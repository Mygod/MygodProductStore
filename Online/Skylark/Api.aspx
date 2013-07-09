<%@ Page Title="云雀™ 开发者 API 指南" Language="C#" MasterPageFile="~/Online/Skylark/Skylark.master" AutoEventWireup="true" CodeBehind="Api.aspx.cs" Inherits="Mygod.Website.ProductStore.Online.Skylark.Api" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <h3>Download/{*Path}</h3>
    <div>直链下载指定的文件。此时的 MIME 类型为 application/octet-stream。</div>
    <div>可用的查询字符串：</div>
    <ul>
        <li><strong>Timeout</strong>：默认为 10，表示等待文件处理的秒数。若设置为 -1 则将无限制地等下去。</li>
    </ul>
    <div>返回 HTTP 状态码：</div>
    <ul>
        <li><strong>200 &amp; 206 &amp; 304</strong>：传输文件/断点续传。</li>
        <li><strong>404</strong>：指定文件不存在。</li>
        <li><strong>412</strong>：断点续传失败。</li>
        <li><strong>503</strong>：文件仍然在处理而等待已超时。</li>
    </ul>

    <h3>View/{*Path}</h3>
    <div>使用用户定义的默认的 MIME 类型显示指定文件。</div>
    <div>可用的查询字符串：</div>
    <ul>
        <li><strong>Mime</strong>：默认为用户定义的 MIME 类型，表示响应的 MIME 类型。</li>
        <li><strong>Timeout</strong>：默认为 10，表示等待文件处理的秒数。若设置为 -1 则将无限制地等下去。</li>
    </ul>
    <div>返回 HTTP 状态码：</div>
    <ul>
        <li><strong>200 &amp; 206 &amp; 304</strong>：传输文件/断点续传。</li>
        <li><strong>404</strong>：指定文件不存在。</li>
        <li><strong>412</strong>：断点续传失败。</li>
        <li><strong>503</strong>：文件仍然在处理而等待已超时。</li>
    </ul>

    <h3>Upload/{*Path}</h3>
    <div>使用 multipart/form-data 上传指定文件到指定目录。</div>
    <div>返回 JSON：</div>
    <ul>
        <li><strong>{"success":true}</strong>：成功。</li>
        <li><strong>{"error":"(message)"}</strong>：出错，具体信息在 message 中。</li>
    </ul>
    
    <h3>Api/List/{*Path}</h3>
    <div>列出当前目录下的所有目录与文件。</div>
    <div>返回 XML：</div>
    <ul>
        <li>
            <div><strong>result 元素</strong></div>
            <ul>
                <li><strong>@status</strong>：指定操作是否成功，值为ok或error。</li>
                <li><strong>@message</strong>：出错信息。</li>
                <li><strong>@lastWriteTimeUtc</strong>：修改日期，其格式为协调世界时 (UTC)。</li>
                <li>
                    <div><strong>result/directory 元素</strong>：一个目录。</div>
                    <ul>
                        <li><strong>@name</strong>：目录名。</li>
                        <li><strong>@lastWriteTimeUtc</strong>：修改日期，其格式为协调世界时 (UTC)。</li>
                    </ul>
                </li>
                <li>
                    <div><strong>result/file 元素</strong>：一个文件。</div>
                    <ul>
                        <li><strong>@name</strong>：文件名。</li>
                        <li><strong>@size</strong>：文件大小，单位：字节。</li>
                        <li><strong>@lastWriteTimeUtc</strong>：修改日期，其格式为协调世界时 (UTC)。</li>
                    </ul>
                </li>
            </ul>
        </li>
    </ul>
    
    <h3>Api/Details/{*Path}</h3>
    <div>给出指定文件的详细信息。</div>
    <div>返回 XML：</div>
    <ul>
        <li>
            <div><strong>result 元素</strong></div>
            <ul>
                <li><strong>@status</strong>：指定操作是否成功，值为ok或error。</li>
                <li><strong>@message</strong>：出错信息。</li>
                <li>
                    <div><strong>result/file 元素</strong>：当前文件。</div>
                    <ul>
                        <li><strong>@state</strong>：文件当前状态，如果为 ready 表示处理完毕，否则可能会附带其他属性。</li>
                        <li><strong>@mime</strong>：文件的默认 MIME 类型。</li>
                        <li><strong>@size</strong>：文件大小，单位：字节。</li>
                        <li><strong>@lastWriteTimeUtc</strong>：修改日期，其格式为协调世界时 (UTC)。</li>
                        <li><strong>result/file/ffmpeg 元素</strong>：元素内部含有 FFmpeg 分析结果的 CDATA。</li>
                    </ul>
                </li>
            </ul>
        </li>
    </ul>
    
    <h3>Api/CreateDirectory/{*Path}</h3>
    <div>在指定位置创建目录。</div>
    <div>返回 XML：</div>
    <ul>
        <li>
            <div><strong>result 元素</strong></div>
            <ul>
                <li><strong>@status</strong>：指定操作是否成功，值为ok或error。</li>
                <li><strong>@message</strong>：出错信息。</li>
            </ul>
        </li>
    </ul>
    
    <h3>Api/Copy/{*Path}</h3>
    <div>将指定位置目录/文件复制到目标位置。</div>
    <div>可用的查询字符串：</div>
    <ul>
        <li><strong>Target</strong>：目标位置。</li>
    </ul>
    <div>返回 XML：</div>
    <ul>
        <li>
            <div><strong>result 元素</strong></div>
            <ul>
                <li><strong>@status</strong>：指定操作是否成功，值为ok或error。</li>
                <li><strong>@message</strong>：出错信息。</li>
            </ul>
        </li>
    </ul>
    
    <h3>Api/Move/{*Path}</h3>
    <div>将指定位置目录/文件移动到目标位置。</div>
    <div>可用的查询字符串：</div>
    <ul>
        <li><strong>Target</strong>：目标位置。</li>
    </ul>
    <div>返回 XML：</div>
    <ul>
        <li>
            <div><strong>result 元素</strong></div>
            <ul>
                <li><strong>@status</strong>：指定操作是否成功，值为ok或error。</li>
                <li><strong>@message</strong>：出错信息。</li>
            </ul>
        </li>
    </ul>
    
    <h3>Api/Delete/{*Path}</h3>
    <div>删除指定位置目录/文件。</div>
    <div>返回 XML：</div>
    <ul>
        <li>
            <div><strong>result 元素</strong></div>
            <ul>
                <li><strong>@status</strong>：指定操作是否成功，值为ok或error。</li>
                <li><strong>@message</strong>：出错信息。</li>
            </ul>
        </li>
    </ul>
    
    <h3>Api/NiGuan/{*Path}</h3>
    <div>查询特定页上的全部 YouTube 视频及其在指定目录下离线下载地址。</div>
    <div>返回 XML：</div>
    <ul>
        <li>
            <div><strong>result 元素</strong></div>
            <ul>
                <li><strong>@status</strong>：指定操作是否成功，值为ok或error。</li>
                <li><strong>@message</strong>：出错信息。</li>
                <li>
                    <div><strong>result/video 元素</strong>：表示一个 YouTube 视频。</div>
                    <ul>
                        <li><strong>@title</strong>：视频名称。</li>
                        <li><strong>@url</strong>：视频地址。</li>
                        <li>
                            <div><strong>result/video/download 元素</strong>：表示该视频的一种格式。</div>
                            <ul>
                                <li><strong>@type</strong>：该格式的简要信息。</li>
                                <li><strong>@link</strong>：在指定目录下创建离线下载任务的地址。</li>
                            </ul>
                        </li>
                    </ul>
                </li>
            </ul>
        </li>
    </ul>
    
    <h3>Api/Codecs</h3>
    <div>查询当前服务器支持的编解码器。</div>
    <div>返回 XML：</div>
    <ul>
        <li>
            <div><strong>result 元素</strong></div>
            <ul>
                <li><strong>@status</strong>：指定操作是否成功，值为ok或error。</li>
                <li><strong>@message</strong>：出错信息。</li>
                <li>
                    <div><strong>result/codec 元素</strong>：表示一种编解码器。</div>
                    <ul>
                        <li><strong>@name</strong>：编解码器名称。</li>
                        <li><strong>@description</strong>：编解码器简介。</li>
                        <li><strong>@decodingSupported</strong>：是否支持解码，默认为 False。</li>
                        <li><strong>@encodingSupported</strong>：是否支持编码，默认为 False。</li>
                        <li><strong>@type</strong>：指示该编解码器为视频编解码器（Video）、音频编解码器（Audio）还是字幕编解码器（Subtitle）。</li>
                        <li><strong>@intraFrameOnlyCodec</strong>：是否仅支持帧内编解码，默认为 False。</li>
                        <li><strong>@lossyCompression</strong>：是否支持有损压缩，默认为 False。</li>
                        <li><strong>@losslessCompression</strong>：是否支持无损压缩，默认为 False。</li>
                    </ul>
                </li>
            </ul>
        </li>
    </ul>
    
    <h3>Task/Create/Offline/{*Path}</h3>
    <div>在指定目录下创建离线下载任务。</div>
    <div>可用的查询字符串：</div>
    <ul>
        <li><strong>Url</strong>：使用 Rbase64（$.base64reversed）加密过的字符串。</li>
    </ul>
    <div>返回 XML：</div>
    <ul>
        <li>
            <div><strong>result 元素</strong></div>
            <ul>
                <li><strong>@status</strong>：指定操作是否成功，值为ok或error。</li>
                <li><strong>@message</strong>：出错信息。</li>
            </ul>
        </li>
    </ul>
    
    <h3>Task/Create/Offline-MediaFire/{*Path}</h3>
    <div>在指定目录下创建 MediaFire 网盘离线下载任务。</div>
    <div>可用的查询字符串：</div>
    <ul>
        <li><strong>ID</strong>：MediaFire 网盘文件 ID。</li>
    </ul>
    <div>返回 XML：</div>
    <ul>
        <li>
            <div><strong>result 元素</strong></div>
            <ul>
                <li><strong>@status</strong>：指定操作是否成功，值为ok或error。</li>
                <li><strong>@message</strong>：出错信息。</li>
            </ul>
        </li>
    </ul>
    
    <h3>Task/Create/Compress/{*Path}</h3>
    <div>将指定文件压缩到指定路径。</div>
    <div>可用的查询字符串：</div>
    <ul>
        <li><strong>BaseFolder</strong>：压缩的位置，默认为根目录。</li>
        <li><strong>Files</strong>：要压缩的文件/目录相对于压缩位置的路径，用“|”分割。</li>
        <li><strong>CompressionLevel</strong>：压缩级别，默认为 Ultra。可以是 Ultra, High, Normal, Low, Fast, None 中的一个。</li>
    </ul>
    <div>返回 XML：</div>
    <ul>
        <li>
            <div><strong>result 元素</strong></div>
            <ul>
                <li><strong>@status</strong>：指定操作是否成功，值为ok或error。</li>
                <li><strong>@message</strong>：出错信息。</li>
            </ul>
        </li>
    </ul>
    
    <h3>Task/Create/Decompress/{*Path}</h3>
    <div>将指定文件解压到指定路径。</div>
    <div>可用的查询字符串：</div>
    <ul>
        <li><strong>Target</strong>：解压的目标位置。</li>
    </ul>
    <div>返回 XML：</div>
    <ul>
        <li>
            <div><strong>result 元素</strong></div>
            <ul>
                <li><strong>@status</strong>：指定操作是否成功，值为ok或error。</li>
                <li><strong>@message</strong>：出错信息。</li>
                <li><strong>@id</strong>：创建的任务 ID，生成方式为 Convert.ToBase64String(Encoding.UTF8.GetBytes(DateTime.UtcNow.Ticks.ToString(CultureInfo.InvariantCulture)))。</li>
            </ul>
        </li>
    </ul>
    
    <h3>Task/Create/Convert/{*Path}</h3>
    <div>将指定文件转码。</div>
    <div>可用的查询字符串：</div>
    <ul>
        <li><strong>Target</strong>：转码的目标位置。</li>
        <li><strong>Size</strong>：转码后的图像尺寸，不填表示不变。</li>
        <li><strong>VCodec</strong>：使用的视频编解码器名称，不填表示自动识别。</li>
        <li><strong>ACodec</strong>：使用的音频编解码器名称，不填表示自动识别。</li>
        <li><strong>SCodec</strong>：使用的字幕编解码器名称，不填表示自动识别。</li>
        <li><strong>Start</strong>：转码的开始时间，不填表示从头开始。</li>
        <li><strong>End</strong>：转码的结束时间，不填表示到尾结束。</li>
    </ul>
    <div>返回 XML：</div>
    <ul>
        <li>
            <div><strong>result 元素</strong></div>
            <ul>
                <li><strong>@status</strong>：指定操作是否成功，值为ok或error。</li>
                <li><strong>@message</strong>：出错信息。</li>
            </ul>
        </li>
    </ul>
    
    <h3>Task/Create/CrossAppCopy/{*Path}</h3>
    <div>跨云雀复制文件到指定路径。</div>
    <div>可用的查询字符串：</div>
    <ul>
        <li><strong>Domain</strong>：源云雀的域名。</li>
        <li><strong>Path</strong>：源云雀的位置。</li>
    </ul>
    <div>返回 XML：</div>
    <ul>
        <li>
            <div><strong>result 元素</strong></div>
            <ul>
                <li><strong>@status</strong>：指定操作是否成功，值为ok或error。</li>
                <li><strong>@message</strong>：出错信息。</li>
                <li><strong>@id</strong>：创建的任务 ID，生成方式为 Convert.ToBase64String(Encoding.UTF8.GetBytes(DateTime.UtcNow.Ticks.ToString(CultureInfo.InvariantCulture)))。</li>
            </ul>
        </li>
    </ul>
    
    <h3>Task/Query/Decompress/{ID}</h3>
    <div>查询指定解压任务的进度。</div>
    <div>返回 XML：</div>
    <ul>
        <li>
            <div><strong>result 元素</strong></div>
            <ul>
                <li><strong>@status</strong>：指定操作是否成功，值为ok或error。</li>
                <li><strong>@message</strong>：出错信息。</li>
                <li>
                    <div><strong>result/decompress 元素</strong></div>
                    <ul>
                        <li><strong>@pid</strong>：处理任务的进程 ID。</li>
                        <li><strong>@running</strong>：指示处理任务的进程是否还活着。</li>
                        <li><strong>@archive</strong>：压缩包地址。</li>
                        <li><strong>@directory</strong>：目标目录。</li>
                        <li><strong>@progress</strong>：进度（百分比）。</li>
                        <li><strong>@current</strong>：当前处理的文件。</li>
                        <li><strong>@message</strong>：错误信息。</li>
                        <li><strong>@finish</strong>：完成时间。</li>
                    </ul>
                </li>
            </ul>
        </li>
    </ul>
    
    <h3>Task/Query/CrossAppCopy/{ID}</h3>
    <div>查询指定跨云雀传输任务的进度。</div>
    <div>返回 XML：</div>
    <ul>
        <li>
            <div><strong>result 元素</strong></div>
            <ul>
                <li><strong>@status</strong>：指定操作是否成功，值为ok或error。</li>
                <li><strong>@message</strong>：出错信息。</li>
                <li>
                    <div><strong>result/crossAppCopy 元素</strong></div>
                    <ul>
                        <li><strong>@pid</strong>：处理任务的进程 ID。</li>
                        <li><strong>@running</strong>：指示处理任务的进程是否还活着。</li>
                        <li><strong>@domain</strong>：源云雀域名。</li>
                        <li><strong>@path</strong>：源云雀路径。</li>
                        <li><strong>@target</strong>：目标路径。</li>
                        <li><strong>@fileCopied</strong>：目标路径。</li>
                        <li><strong>@sizeCopied</strong>：目标路径。</li>
                        <li><strong>@current</strong>：当前处理的文件。</li>
                        <li><strong>@message</strong>：错误信息。</li>
                        <li><strong>@finish</strong>：完成时间。</li>
                    </ul>
                </li>
            </ul>
        </li>
    </ul>
</asp:Content>
