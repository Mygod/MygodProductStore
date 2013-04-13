﻿<%@ Page Title="在线工具" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs"
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
        <button class="command-button" type="button" id="chewer">
            Mygod嚼烂喂给你吃下载器
            <small>记住，Mygod嚼烂喂给你吃下载器……就是这么拽！</small>
        </button>
        <button class="command-button" type="button" id="youtube-downloader">
            你管下载者 Online
            <small>使用它可以下载任何一部你管上的视频！（支持离线下载）</small>
        </button>
        <button class="command-button" type="button" id="offline-downloader">
            Mygod离线下载器
            <small>迅雷会员一点也不拽，Mygod会员现在也可以获得离线下载的功能！</small>
        </button>
        <button class="command-button" type="button" id="wog-leaderboard">
            粘粘世界吧排行榜
            <small>wogfan in China!</small>
        </button>
        <span id="admin-features">
            <button class="command-button" type="button" id="nothing-seriously">
                什么都没有
                <small>嘿嘿……什么都没有……</small>
            </button>
        </span>
    </div>
    <div style="visibility: collapse;">
        输入管理员密码以解锁网站管理功能：
        <input type="password" id="admin-password-box" />
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#mom-cn').click(function () { location.href = 'MOM/'; });
            $('#mom-en').click(function () { location.href = 'MOM/English.htm'; });
            $('#wogcorp').click(function () { location.href = 'WoGCorp/'; });
            $('#countdowns').click(function () { location.href = 'Countdowns.aspx'; });
            $('#browser-download').click(function () { location.href = 'BrowserDownload.aspx'; });
            $('#chewer').click(function () { location.href = 'Chewer.aspx'; });
            $('#youtube-downloader').click(function () { location.href = 'NiGuanDownloader.aspx'; });
            $('#offline-downloader').click(function () { location.href = 'OfflineDownloader/'; });
            $('#wog-leaderboard').click(function () { location.href = 'WoGLeaderboard/'; });

            $('#admin-password-box').keypress(function () {
                setTimeout(function() {
                    if ($('#admin-password-box').val() != "mygodisthebest") return;
                    $('#admin-features').show();
                    alert("网站管理功能解锁成功！" + $.base64.decode(newline));
                }, 5);
            });
            $('#admin-features').hide();
        });
    </script>
</asp:Content>
