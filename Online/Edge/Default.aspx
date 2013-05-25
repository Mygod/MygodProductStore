<%@ Page Title="EdgeMod 参考指南" Language="C#" MasterPageFile="~/Online/Edge/Edge.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Mygod.Website.ProductStore.Online.Edge.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <h3>.edgemod 文件格式</h3>
    <div>.edgemod 文件格式其本质是一个压缩包。（.rar、.zip之类，不支持.7z）里面包含了一切要覆盖的文件，<b>虽然不强制，但是推荐你将你的关卡 bin 文件放在单独的文件夹里。（如放在 levels/MyCrappyNickname/MyCrappyLevel.bin）</b>。其中有三类文件比较特殊。</div>
    <div>第一类是 XSL 文件（扩展名为 .xsl），可以用于对 XML 文件进行一些高级操作。通常用于 levels/mapping.xml，这个文件存放着关卡列表。参考资料：<a href="http://pastebin.mozilla.org/2442647">简单地在结尾添加关卡的 XSL（推荐改用 mod.xml，仅当几种操作混合时你才可能需要这东西）</a>；<a href="/#Product-60">《Goomod导论》附录的最后一节有对使用 XSL 操作 XML 文件的简单介绍</a>。</div>
    <div>第二类是根目录下的 description.txt。其内容即为 EdgeMod 的描述。如果该文件不存在表示没有描述。</div>
    <div>第三类是根目录下的 mod.xml。它存放了 EdgeMod 的核心信息。下面将具体介绍。</div>

    <h3>mod.xml</h3>
    <div>这是一个 XML 文件。根元素为 Mod。其属性如下：</div>
    <table>
        <thead>
            <tr>
                <td class="nowrap">属性名</td>
                <td class="nowrap">数据类型</td>
                <td>备注</td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td class="nowrap">ID</td>
                <td class="nowrap">ID</td>
                <td>必填。EdgeMod 的 ID。这里只能包含字母、数字以及“._-”中的符号。在更新版本时不应该修改 ID。</td>
            </tr>
            <tr>
                <td class="nowrap">Name</td>
                <td class="nowrap">文本</td>
                <td>必填。EdgeMod 的名字。</td>
            </tr>
            <tr>
                <td class="nowrap">Version</td>
                <td class="nowrap">版本</td>
                <td>必填。EdgeMod 的版本号。</td>
            </tr>
            <tr>
                <td class="nowrap">Author</td>
                <td class="nowrap">文本</td>
                <td>必填。EdgeMod 的作者名。</td>
            </tr>
            <tr>
                <td class="nowrap">Type</td>
                <td class="nowrap">特殊</td>
                <td>可选，默认为 Level。指定 EdgeMod 的优先级。第一级 Level 不允许覆盖已有文件；第二级 Theme 不允许覆盖 levels/mapping.xml（虽然可以通过使用 xsl 达到覆盖的目的）；第三级 Game 无限制，但是一次只能同时安装一个。（考虑到各个 mod 之间的冲突问题）在 Mod 安装时会按照优先级从（数字）小到大安装。如果可能，请尽量使用 Level，而 Game 仅在极少数情况下需要使用。（如 EDGE Epic）</td>
            </tr>
            <tr>
                <td class="nowrap">Conflicts</td>
                <td class="nowrap">ID列表</td>
                <td>可选。指定不允许和你的 EdgeMod 同时安装的 ID 列表。若这些 Mod 先于你的 Mod 被安装，你的 Mod 将不会被安装。</td>
            </tr>
            <tr>
                <td class="nowrap">Dependency</td>
                <td class="nowrap">ID列表</td>
                <td>可选。指定你的 EdgeMod 依赖的 ID 列表。若在安装时这些 Mod 未被安装，你的 Mod 将不会被安装。请注意这个属性并不会影响安装的顺序，因此可以包含环。</td>
            </tr>
            <tr>
                <td class="nowrap">InstallAfter</td>
                <td class="nowrap">ID列表</td>
                <td>可选。你的 EdgeMod 将会在列表中的 EdgeMod 全部安装完毕后被安装。若依赖链包含环，则该环不会被安装。</td>
            </tr>
            <tr>
                <td class="nowrap">InstallBefore</td>
                <td class="nowrap">ID列表</td>
                <td>可选。你的 EdgeMod 将会在列表中的任意一个 EdgeMod 安装前被安装。若依赖链包含环，则该环不会被安装。</td>
            </tr>
            <tr>
                <td class="nowrap">EngineVersion</td>
                <td class="nowrap">版本区间</td>
                <td>可选。指定你的 EdgeMod 支持的游戏引擎版本区间。参考数据：EDGE 破解版 1.0.1822.6305；EDGE Epic 1.0.2052.6330；最新的 EDGE Extended 1.0.2483.7086。</td>
            </tr>
        </tbody>
    </table>
    <div>它有 0～3 个子元素，分别为 standard, bonus 和 extended，表示对应的关卡类型，用于更新前面提到的 levels/mapping.xml 关卡索引。每个子元素下可以放若干个 level 元素。每一个 level 元素表示在当前分类的结尾添加一个关卡。其属性如下：</div>
    <table>
        <thead>
            <tr>
                <td class="nowrap">属性名</td>
                <td class="nowrap">数据类型</td>
                <td>备注</td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td class="nowrap">filename</td>
                <td class="nowrap">文本</td>
                <td>必填。要添加关卡的 bin 文件的相对路径（无需扩展名）。正如前面所说的推荐你放在文件夹中，如前面举的例子在这里可以填写 MyCrappyNickname/MyCrappyLevel。</td>
            </tr>
            <tr>
                <td class="nowrap">leaderboard_id</td>
                <td class="nowrap">32位整数</td>
                <td>可选。关卡的排行榜 ID。</td>
            </tr>
            <tr>
                <td class="nowrap">name_sfx</td>
                <td class="nowrap">文本</td>
                <td>可选。指定启动关卡时播放的声效 ID。这些声效在 audio 文件夹中定义，格式不明。</td>
            </tr>
        </tbody>
    </table>

    <h3>附：关卡 XML 参考指南</h3>
    <div>简要说明：在你反编译一个关卡后，你会得到一个xxx.xml、一个xxx.png和若干个xxx.x.png文件。本节将介绍如何修改这些文件来制作新关。</div>
    <div>第一个文件是关卡的核心所在，其内部非常复杂。因此你可以<a href="Level.aspx">点这里进入完整的XML参考指南</a>。</div>
    <div>第二个文件是旧版游戏遗留下来的一个奇怪的东西。你可以把它替换成你喜欢的图片，不过它会变成黑白二色（而且不包括灰色！）。（而且不推荐这么做！因为会增大bin文件大小！）</div>
    <div>第三堆文件的后一个x是从0到关卡高度（<a href="Level.aspx">在XML的/Level/@Size中定义</a>）-1的一个索引，表示从下到上第x层中的方块。请注意这里定义的方块在游戏中会影响方块移动，但在PC版中这些玩意儿并不会在关卡中显示。换句话说它们是悬空的。如果你觉得很不爽，你可以用Edge浏览器的修复悬浮功能。（请在完成关卡设计后再使用）</div>
</asp:Content>
