using System;
using System.IO;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Xml.Linq;

namespace Mygod.Website.ProductStore.Online.OfflineDownloader
{
    public partial class Fetch : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Update(!IsPostBack);
        }

        private void Update(bool firstLoad)
        {
            var temp = Server.MapPath("/Temp");
            Directory.CreateDirectory(temp);
            TaskCount = Application.Count + "/" + new DirectoryInfo(temp).GetFiles().Length / 2;
            Url = FileSize = DownloadedFileSize = AverageDownloadSpeed = StartTime = SpentTime = RemainingTime = EndingTime = "未知";
            Percentage = "0";
            string md5 = Request.QueryString["Key"] ?? string.Empty, path = Server.MapPath("/Temp/" + md5), xmlPath = path + ".xml";
            if (!File.Exists(xmlPath))
            {
                Status = "你的文件消失了……我甚至不能确定它是否存在过。可能是服务器反应太慢了，按F5踹他一脚（刷新）试试。";
                return;
            }
            var download = XDocument.Load(xmlPath).Element("download");
            Url = string.Format("<a href=\"{0}\">{0}</a>", download.Attribute("url").Value);
            var fileNameAttr = download.Attribute("fileName");
            if (fileNameAttr == null)
            {
                Status = "你的下载正在开始……刷新试试？";
                return;
            }
            var startTime = DateTime.Parse(download.Attribute("startTime").Value);
            StartTime = startTime.AddHours(8).ToString("yyyy.M.d h:mm:ss.fff");
            var attr = download.Attribute("message");
            if (attr != null)
            {
                Status = "发生错误，具体信息：" + attr.Value;
                Never();
                return;
            }
            attr = download.Attribute("size");
            if (attr == null) return;
            var fileSize = long.Parse(attr.Value);
            FileSize = GetSize(fileSize);
            var downloadedFileSize = File.Exists(path) ? new FileInfo(path).Length : 0;
            DownloadedFileSize = string.Format("{0} ({1}%)", GetSize(downloadedFileSize),
                                               Percentage = Percentage = (100.0 * downloadedFileSize / fileSize).ToString());
            attr = download.Attribute("endTime");
            if (attr == null)
            {
                var impossibleEnds = Application[md5] == null;
                Status = impossibleEnds ? "已被咔嚓" : "正在下载";
                if (impossibleEnds) Never();
                else
                {
                    var spentTime = DateTime.UtcNow - startTime;
                    SpentTime = spentTime.ToString("g");
                    var averageDownloadSpeed = downloadedFileSize / spentTime.TotalSeconds;
                    AverageDownloadSpeed = GetSize(averageDownloadSpeed);
                    var remainingTime =
                        new TimeSpan((long)(spentTime.Ticks * (fileSize - downloadedFileSize) / (double)downloadedFileSize));
                    RemainingTime = remainingTime.ToString("g");
                    EndingTime = (startTime + spentTime + remainingTime).AddHours(8).ToString("yyyy.M.d h:mm:ss.fff");
                }
            }
            else
            {
                Status = "下载完毕，刷新开始下载";
                RemainingTime = new TimeSpan(0).ToString("g");
                var endingTime = DateTime.Parse(attr.Value);
                EndingTime = endingTime.AddHours(8).ToString("yyyy.M.d h:mm:ss.fff");
                var spentTime = endingTime - startTime;
                SpentTime = spentTime.ToString("g");
                var averageDownloadSpeed = downloadedFileSize / spentTime.TotalSeconds;
                AverageDownloadSpeed = GetSize(averageDownloadSpeed);
                if (firstLoad) DownloadFile(path, fileNameAttr.Value);
            }
        }

        private void Never()
        {
            RemainingTime = "永远";
            EndingTime = "地球毁灭时";
        }

        protected string Url, Status, FileSize, DownloadedFileSize, AverageDownloadSpeed, StartTime, SpentTime, RemainingTime, 
                         EndingTime, TaskCount, Percentage;

        private static readonly string[] Units = new[] { "字节", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB", "BB", "NB", "DB", "CB" };
        private static string GetSize(long size)
        {
            double byt = size;
            byte i = 0;
            while (byt > 1000)
            {
                byt /= 1024;
                i++;
            }
            var bytesstring = size.ToString("N");
            return byt.ToString("N") + " " + Units[i] + " (" + bytesstring.Remove(bytesstring.Length - 3) + " 字节)";
        }
        private static string GetSize(double size)
        {
            var byt = size;
            byte i = 0;
            while (byt > 1000)
            {
                byt /= 1024;
                i++;
            }
            var bytesstring = size.ToString("N");
            return byt.ToString("N") + " " + Units[i] + " (" + bytesstring.Remove(bytesstring.Length - 3) + " 字节)";
        }

        /// <summary>  
        /// 下载文件，支持大文件、续传。支持续传的响应头Accept-Ranges、ETag，请求头Range 。  
        /// Accept-Ranges：响应头，向客户端指明，此进程支持可恢复下载.实现后台智能传输服务（BITS），值为：bytes；  
        /// ETag：响应头，用于对客户端的初始（200）响应，以及来自客户端的恢复请求，  
        /// 必须为每个文件提供一个唯一的ETag值（可由文件名和文件最后被修改的日期组成），这使客户端软件能够验证它们已经下载的字节块是否仍然是最新的。  
        /// Range：续传的起始位置，即已经下载到客户端的字节数，值如：bytes=1474560- 。  
        /// 另外：UrlEncode编码后会把文件名中的空格转换中+（+转换为%2b），但是浏览器是不能理解加号为空格的，
        /// 所以在浏览器下载得到的文件，空格就变成了加号；  
        /// 解决办法：UrlEncode 之后, 将 "+" 替换成 "%20"，因为浏览器将%20转换为空格  
        /// </summary> 
        /// <param name="filePath">下载文件的路径，含路径、文件名</param>
        /// <param name="fileName">文件名</param>
        /// <returns>true下载成功，false下载失败</returns>  
        private bool DownloadFile(string filePath, string fileName)
        {
            var ret = true;
            try
            {
                #region --验证请求的文件是否存在
                if (!File.Exists(filePath))
                {
                    Response.StatusCode = 404;
                    return false;
                }
                #endregion

                #region 定义局部变量
                long startBytes = 0;
                const int packSize = 1024 * 10; //分块读取，每块10K bytes  
                var myFile = new FileStream(filePath, FileMode.Open, FileAccess.Read, FileShare.ReadWrite);
                var br = new BinaryReader(myFile);
                var fileLength = myFile.Length;

                var lastUpdateTiemStr = File.GetLastWriteTimeUtc(filePath).ToString("r");
                var eTag = HttpUtility.UrlEncode(fileName, Encoding.UTF8) + lastUpdateTiemStr;//便于恢复下载时提取请求头;  
                #endregion

                #region--验证：文件是否太大，是否是续传，且在上次被请求的日期之后是否被修
                if (myFile.Length > Int32.MaxValue)
                {//-------文件太大了-------  
                    Response.StatusCode = 413;//请求实体太大  
                    return false;
                }

                if (Request.Headers["If-Range"] != null)    //对应响应头ETag：文件名+文件最后修改时间  
                {
                    //----------上次被请求的日期之后被修改过--------------  
                    if (Request.Headers["If-Range"].Replace("\"", "") != eTag)  //文件修改过  
                    {
                        Response.StatusCode = 412;  //预处理失败  
                        return false;
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
                    Response.AppendHeader("Last-Modified", lastUpdateTiemStr);//把最后修改日期写入响应                  
                    Response.ContentType = "application/octet-stream";//MIME类型：匹配任意文件类型  
                    Response.AddHeader("Content-Disposition", "attachment;filename=" + HttpUtility.UrlEncode(fileName, Encoding.UTF8)
                        .Replace("+", "%20"));
                    Response.AddHeader("Content-Length", (fileLength - startBytes).ToString());
                    Response.AddHeader("Connection", "Keep-Alive");
                    Response.ContentEncoding = Encoding.UTF8;
                    if (Request.Headers["Range"] != null)   //------如果是续传请求，则获取续传的起始位置，即已经下载到客户端的字节数------  
                    {
                        Response.StatusCode = 206;//重要：续传必须，表示局部范围响应。初始下载时默认为200  
                        string[] range = Request.Headers["Range"].Split(new[] { '=', '-' });//"bytes=1474560-"  
                        startBytes = Convert.ToInt64(range[1]);//已经下载的字节数，即本次下载的开始位置    
                        if (startBytes < 0 || startBytes >= fileLength)
                        {//无效的起始位置  
                            return false;
                        }
                    }
                    if (startBytes > 0)
                    {//------如果是续传请求，告诉客户端本次的开始字节数，总长度，以便客户端将续传数据追加到startBytes位置后----------  
                        Response.AddHeader("Content-Range", string.Format(" bytes {0}-{1}/{2}", startBytes, fileLength - 1, fileLength));
                    }
                    #endregion

                    #region -------向客户端发送数据块-------------------
                    br.BaseStream.Seek(startBytes, SeekOrigin.Begin);
                    var maxCount = (int)Math.Ceiling((fileLength - startBytes + 0.0) / packSize);//分块下载，剩余部分可分成的块数  
                    for (var i = 0; i < maxCount && Response.IsClientConnected; i++)    //客户端中断连接，则暂停  
                    {
                        Response.BinaryWrite(br.ReadBytes(packSize));
                        Response.Flush();
                    }
                    #endregion
                }
                catch
                {
                    ret = false;
                }
                finally
                {
                    br.Close();
                    myFile.Close();
                }
            }
            catch
            {
                ret = false;
            }
            return ret;
        }
    }
}