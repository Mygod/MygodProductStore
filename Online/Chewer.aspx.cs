using System;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;

namespace Mygod.Website.ProductStore.Online
{
    public partial class Chewer : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var url = Request.QueryString["URL"];
            if (string.IsNullOrWhiteSpace(url)) return;
            url = Encoding.UTF8.GetString(Convert.FromBase64String(url)).Reverse().Aggregate(string.Empty, (c, s) => c + s);
            #region 定义局部变量
            long startBytes = 0;
            const int packSize = 1024 * 10; //分块读取，每块10K bytes  
            var request = WebRequest.Create(url);
            var response = request.GetResponse();
            var disposition = response.Headers["Content-Disposition"] ?? string.Empty;
            var pos = disposition.IndexOf("filename=", StringComparison.Ordinal);
            var fileName = pos >= 0 ? disposition.Substring(pos + 9).Trim('"', '\'') : Path.GetFileName(url);
            
            var myFile = response.GetResponseStream();
            var br = new BinaryReader(myFile);
            long? fileLength;
            if (myFile.CanSeek) fileLength = myFile.Length;
            else
                try
                {
                    fileLength = response.ContentLength;
                }
                catch
                {
                    fileLength = null;
                }
            var eTag = HttpUtility.UrlEncode(fileName, Encoding.UTF8);//便于恢复下载时提取请求头;  
            #endregion

            #region--验证：文件是否太大，是否是续传，且在上次被请求的日期之后是否被修

            if (Request.Headers["If-Range"] != null)    //对应响应头ETag：文件名+文件最后修改时间  
            {
                //----------上次被请求的日期之后被修改过--------------  
                if (Request.Headers["If-Range"].Replace("\"", "") != eTag)  //文件修改过  
                {
                    Response.StatusCode = 412;  //预处理失败  
                    return;
                }
            }
            #endregion

            try
            {
                #region -------添加重要响应头、解析请求头、相关验证-------------------
                Response.Clear();
                Response.Buffer = false;
                //Response.AddHeader("Content-MD5", GetMD5Hash(myFile));//用于验证文件  
                Response.AddHeader("Accept-Ranges", "bytes");//重要：续传必须  
                Response.AppendHeader("ETag", "\"" + eTag + "\"");//重要：续传必须  
                Response.ContentType = "application/octet-stream";//MIME类型：匹配任意文件类型  
                Response.AddHeader("Content-Disposition", "attachment;filename=" + HttpUtility.UrlEncode(fileName, Encoding.UTF8)
                    .Replace("+", "%20"));
                if (fileLength != null) Response.AddHeader("Content-Length", (fileLength - startBytes).ToString());
                Response.AddHeader("Connection", "Keep-Alive");
                Response.ContentEncoding = Encoding.UTF8;
                if (Request.Headers["Range"] != null && myFile.CanSeek)
                    //------如果是续传请求，则获取续传的起始位置，即已经下载到客户端的字节数------  
                {
                    Response.StatusCode = 206;//重要：续传必须，表示局部范围响应。初始下载时默认为200  
                    var range = Request.Headers["Range"].Split(new[] { '=', '-' });//"bytes=1474560-"  
                    startBytes = Convert.ToInt64(range[1]);//已经下载的字节数，即本次下载的开始位置    
                    if (startBytes < 0 || fileLength != null && startBytes >= fileLength) return;//无效的起始位置  
                }
                if (startBytes > 0 && fileLength > 0)
                    //------如果是续传请求，告诉客户端本次的开始字节数，总长度，以便客户端将续传数据追加到startBytes位置后----------  
                    Response.AddHeader("Content-Range", string.Format(" bytes {0}-{1}/{2}", startBytes, fileLength - 1, fileLength));
                else startBytes = 0;
                #endregion

                #region -------向客户端发送数据块-------------------
                if (startBytes > 0) br.BaseStream.Seek(startBytes, SeekOrigin.Begin);
                while (Response.IsClientConnected)    //客户端中断连接，则暂停
                {
                    var buffer = br.ReadBytes(packSize);
                    Response.BinaryWrite(buffer);
                    Response.Flush();
                    if (buffer.Length < packSize) break;
                }
                #endregion
            }
            finally
            {
                br.Close();
                myFile.Close();
            }
        }
    }
}