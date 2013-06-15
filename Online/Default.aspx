<%@ Page Title="在线工具" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs"
         Inherits="Mygod.Website.ProductStore.Online.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <script type="text/javascript">
        var newline = "CuW8gOS4queOqeeskee9ouS6hu+8geavleern+ayoeacieS6uuS8muWCu+WIsOaKiue9keermeeuoeeQhuWKn+iDveeahOWvhueggeaYjuaWh+WtmOWCqOWcqEhUTUzmlofku7bph4zvvIHkuI3ov4fkvaDov5jmmK/op6PplIHlh6DkuKrmnInotqPnmoTlip/og73vvIHmga3llpzkvaDvvIE=";
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div>
        <button class="command-button" type="button" id="mom-cn">
            MOM 中文版
            <small>改良版！</small>
        </button>
        <button class="command-button" type="button" id="mom-en">
            MOM 英文版
            <small>改良版！</small>
        </button>
        <button class="command-button" type="button" id="wogcorp">
            搭塔者
            <small>看看世界上正在搭塔的人们。</small>
        </button>
        <button class="command-button" type="button" id="countdowns">
            倒计时
            <small>让你对未来充满希望，或是给你一种莫名的压迫感！</small>
        </button>
        <button class="command-button" type="button" id="browser-download">
            Mygod浏览器下载小工具
            <small>用来用浏览器下载一些东西……（我的第一个Javascript程序）</small>
        </button>
        <button class="command-button" type="button" id="wog-leaderboard">
            中国粘粘世界排行榜
            <small>中国的粘粘世界排行榜！支持关卡与玩家！</small>
        </button>
        <button class="command-button" type="button" id="skylark">
            云雀™
            <small>云雀™，您的云存储伴侣。</small>
        </button>
        <span id="admin-features">
            <button class="command-button" type="button" id="nothing-here">
                这儿啥都没有……
                <small>这儿曾经有一个比较有用的东西，不过随着云雀™的诞生而灭亡了……</small>
            </button>
        </span>
    </div>
    <div>
        输入管理员密码以解锁网站管理功能：
        <input type="password" id="admin-password-box" />
    </div>
    <div id="disqus_thread"></div>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#mom-cn').click(function () { location.href = 'MOM/'; });
            $('#mom-en').click(function () { location.href = 'MOM/English.htm'; });
            $('#wogcorp').click(function () { location.href = 'WoGCorp/'; });
            $('#countdowns').click(function () { location.href = 'Countdowns.aspx'; });
            $('#browser-download').click(function () { location.href = 'BrowserDownload.aspx'; });
            $('#wog-leaderboard').click(function () { location.href = 'WoGLeaderboard/'; });
            $('#skylark').click(function () { location.href = 'Skylark/'; });

            $('#admin-password-box').keypress(function () {
                setTimeout(function() {
                    if ($('#admin-password-box').val() != "mygodisthebest") return;
                    $('#admin-features').show();
                    alert("网站管理功能解锁成功！" + $.base64.decode(newline));
                }, 5);
            });
            $('#admin-features').hide();
        });

        /* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */
        var disqus_shortname = 'mygodps'; // required: replace example with your forum shortname
        var disqus_identifier = 'main';

        /* * * DON'T EDIT BELOW THIS LINE * * */
        (function () {
            var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
            dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
            (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
        })();
    </script>
</asp:Content>
