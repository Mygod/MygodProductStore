using System;
using System.Collections.Generic;
using System.Web.UI;

namespace Mygod.Website.ProductStore.Online.WoGCorp
{
    public partial class Default : Page
    {
        #region CountryNames

        private static readonly Dictionary<string, string> CountryNames = new Dictionary<string, string> {{"AD", "安道尔共和国"}, {"AE", "阿拉伯联合酋长国"}, {"AF", "阿富汗"}, {"AG", "安提瓜和巴布达"}, {"AI", "安圭拉岛"}, {"AL", "阿尔巴尼亚"}, {"AM", "亚美尼亚"}, {"AN", "荷属安的列斯群岛"}, {"AO", "安哥拉"}, {"AR", "阿根廷"}, {"AS", "东萨摩亚"}, {"AT", "奥地利"}, {"AU", "澳大利亚"}, {"AW", "阿鲁巴"}, {"AX", "奥兰群岛"}, {"AZ", "阿塞拜疆"}, {"BA", "波黑"}, {"BB", "巴巴多斯"}, {"BD", "孟加拉国"}, {"BE", "比利时"}, {"BF", "布基纳法索"}, {"BG", "保加利亚"}, {"BH", "巴林"}, {"BI", "布隆迪"}, {"BJ", "贝宁"}, {"BM", "百慕大群岛"}, {"BN", "文莱"}, {"BO", "玻利维亚"}, {"BR", "巴西"}, {"BS", "巴哈马"}, {"BT", "不丹"}, {"BV", "布维岛"}, {"BW", "博茨瓦纳"}, {"BY", "白俄罗斯"}, {"BZ", "伯利兹"}, {"CA", "加拿大"}, {"CC", "可可岛"}, {"CD", "刚果民主共和国"}, {"CF", "中非共和国"}, {"CG", "刚果"}, {"CH", "瑞士"}, {"CI", "象牙海岸"}, {"CK", "库克群岛"}, {"CL", "智利"}, {"CM", "喀麦隆"}, {"CN", "中国"}, {"CO", "哥伦比亚"}, {"CR", "哥斯达黎加"}, {"CU", "古巴"}, {"CV", "佛得角"}, {"CX", "圣诞岛"}, {"CY", "塞浦路斯"}, {"CZ", "捷克共和国"}, {"DE", "德国"}, {"DJ", "吉布提"}, {"DK", "丹麦"}, {"DM", "多明哥"}, {"DO", "多米尼加共和国"}, {"EC", "厄瓜多尔"}, {"EE", "爱沙尼亚"}, {"EG", "埃及"}, {"EH", "西撒哈拉"}, {"ER", "厄立特里亚"}, {"ES", "西班牙"}, {"ET", "埃塞俄比亚"}, {"EU", "欧洲联盟"}, {"FI", "芬兰"}, {"FJ", "斐济"}, {"FK", "福克兰群岛"}, {"FM", "密克罗尼西亚"}, {"FO", "法罗群岛"}, {"FR", "法国"}, {"GA", "加蓬"}, {"GB", "英国"}, {"GD", "格林纳达"}, {"GE", "格鲁吉亚"}, {"GF", "法属圭亚那"}, {"GG", "格恩西岛"}, {"GH", "加纳"}, {"GI", "直布罗陀"}, {"GL", "格陵兰"}, {"GM", "冈比亚"}, {"GN", "几内亚"}, {"GP", "瓜德罗普"}, {"GQ", "赤道几内亚"}, {"GR", "希腊"}, {"GS", "南乔治亚岛和南桑德韦奇岛"}, {"GT", "危地马拉"}, {"GU", "关岛"}, {"GW", "几内亚比绍"}, {"GY", "圭亚那"}, {"HK", "香港特别行政区"}, {"HN", "洪都拉斯"}, {"HR", "克罗地亚"}, {"HT", "海地"}, {"HU", "匈牙利"}, {"ID", "印度尼西亚"}, {"IE", "爱尔兰"}, {"IL", "以色列"}, {"IM", "马恩岛"}, {"IN", "印度"}, {"IO", "英联邦的印度洋领域"}, {"IQ", "伊拉克"}, {"IR", "伊朗"}, {"IS", "冰岛"}, {"IT", "意大利"}, {"JE", "泽西岛"}, {"JM", "牙买加"}, {"JO", "约旦"}, {"JP", "日本"}, {"KE", "肯尼亚"}, {"KG", "吉尔吉斯坦"}, {"KH", "柬埔寨"}, {"KI", "基里巴斯"}, {"KM", "科摩罗"}, {"KN", "圣茨和尼维斯"}, {"KP", "朝鲜"}, {"KR", "韩国"}, {"KW", "科威特"}, {"KY", "开曼群岛"}, {"KZ", "哈萨克斯坦"}, {"LA", "老挝"}, {"LB", "黎巴嫩"}, {"LC", "圣卢西亚"}, {"LI", "列支敦士登"}, {"LK", "斯里兰卡"}, {"LR", "利比里亚"}, {"LS", "莱索托"}, {"LT", "立陶宛"}, {"LU", "卢森堡"}, {"LV", "拉脱维亚"}, {"LY", "利比亚"}, {"MA", "摩洛哥"}, {"MC", "摩纳哥"}, {"MD", "摩尔多瓦"}, {"MG", "马达加斯加"}, {"MH", "马里"}, {"MK", "缅甸"}, {"ML", "马里"}, {"MM", "缅甸"}, {"MN", "蒙古"}, {"MO", "澳门"}, {"MP", "蒙特塞拉特岛"}, {"MQ", "毛里塔尼亚"}, {"MR", "毛里塔尼亚"}, {"MS", "蒙特塞拉特"}, {"MT", "马耳他"}, {"MU", "毛里求斯"}, {"MV", "马尔代夫"}, {"MW", "马拉维"}, {"MX", "墨西哥"}, {"MY", "马来西亚"}, {"MZ", "莫桑比克"}, {"NA", "纳米比亚"}, {"NC", "新喀里多尼亚"}, {"NE", "尼日尔"}, {"NF", "诺福克岛"}, {"NG", "尼日利亚"}, {"NI", "尼加拉瓜"}, {"NL", "荷兰"}, {"NO", "挪威"}, {"NP", "尼泊尔"}, {"NR", "瑙鲁"}, {"NU", "纽埃"}, {"NZ", "新西兰"}, {"OM", "阿曼"}, {"PA", "巴拿马"}, {"PE", "秘鲁"}, {"PF", "法属玻利尼西亚"}, {"PG", "巴布亚新几内亚"}, {"PH", "菲律宾"}, {"PK", "巴基斯坦"}, {"PL", "波兰"}, {"PM", "圣皮埃尔和密克隆岛"}, {"PN", "皮特开恩群岛"}, {"PR", "波多黎各"}, {"PS", "巴勒斯坦"}, {"PT", "葡萄牙"}, {"PW", "帕劳"}, {"PY", "巴拉圭"}, {"QA", "卡塔尔"}, {"RE", "留尼汪岛"}, {"RO", "罗马尼亚"}, {"RU", "俄罗斯"}, {"RW", "卢旺达"}, {"SA", "沙特阿拉伯"}, {"SB", "所罗门群岛"}, {"SC", "塞舌尔"}, {"SD", "苏丹"}, {"SE", "瑞典"}, {"SG", "新加坡"}, {"SH", "圣赫勒那"}, {"SI", "斯洛文尼亚"}, {"SJ", "斯马尔巴特和扬马延岛"}, {"SK", "斯洛伐克"}, {"SL", "塞拉利昂"}, {"SM", "圣马力诺"}, {"SN", "塞内加尔"}, {"SO", "索马里"}, {"SR", "苏里南"}, {"ST", "圣多美和普林西比"}, {"SV", "萨尔瓦多"}, {"SY", "叙利亚"}, {"SZ", "斯威士兰"}, {"TC", "特克斯和凯科斯群岛"}, {"TD", "乍得"}, {"TF", "法属南方领土"}, {"TG", "多哥"}, {"TH", "泰国"}, {"TJ", "塔吉克斯坦"}, {"TK", "托克劳"}, {"TL", "东帝汶"}, {"TM", "土库曼斯坦"}, {"TN", "突尼斯"}, {"TO", "汤加"}, {"TR", "土耳其"}, {"TT", "特立尼达和多巴哥"}, {"TV", "图瓦卢"}, {"TW", "台湾省"}, {"TZ", "坦桑尼亚"}, {"UA", "乌克兰"}, {"UG", "乌干达"}, {"UM", "美国边远小岛"}, {"US", "美国"}, {"UY", "乌拉圭"}, {"UZ", "乌兹别克斯坦"}, {"VA", "梵蒂冈"}, {"VC", "圣文森特岛"}, {"VE", "委内瑞拉"}, {"VG", "不列颠岛(英)"}, {"VI", "不列颠岛(美)"}, {"VN", "越南"}, {"VU", "瓦努阿图"}, {"WF", "瓦利斯和富图纳群岛"}, {"WS", "西萨摩亚"}, {"XX", "未知国家"}, {"YE", "也门"}, {"YT", "马约特岛"}, {"ZA", "南非"}, {"ZM", "赞比亚"}, {"ZW", "津巴布韦"}};

        #endregion

        private static string Try(Func<string> a)
        {
            try
            {
                return a();
            }
            catch (Exception exc)
            {
                return "对不起，处理过程出现了错误！详细信息：" + exc.Message + "";
            }
        }
        
        protected void Page_Load(object sender, EventArgs e)
        {
            Output = Try(() =>
            {
                // ReSharper disable PossibleNullReferenceException
                var response = WoGBuddy.GetXmlResponse("GetWogcStats");
                var output = string.Empty;
                foreach (var stat in response.Element("HighTowerStats").Elements("HighTowerStat"))
                {
                    var countryCode = stat.Attribute("countryCode").Value;
                    output += string.Format("<tr><td><img src=\"{6}.png\" /></td><td>{9}玩家 #{0}，存档名叫“{1}”，于 " + 
                        "{8:yyyy.M.d H:mm:ss} 上传了TA的记录：收集了 {4} 个球，使用 {5} 个球搭了 {2}m 高的塔。TA的最好记录是 {3}m。" +
                        "TA于 {7:yyyy.M.d H:mm:ss} 首次上传了TA的塔。</td></tr>{10}", long.Parse(stat.Attribute("player_id").Value), 
                        stat.Attribute("player_name").Value, double.Parse(stat.Attribute("height").Value), 
                        double.Parse(stat.Attribute("heightMax").Value), long.Parse(stat.Attribute("ballCount").Value),
                        long.Parse(stat.Attribute("ballCountAttached").Value), countryCode, 
                        DateTime.Parse(stat.Attribute("timeCreated").Value).AddHours(16),
                        DateTime.Parse(stat.Attribute("timeModified").Value).AddHours(16), CountryNames[countryCode], Environment.NewLine);
                }
                return "<table>" + output + "</table>";
                // ReSharper restore PossibleNullReferenceException
            });
        }

        protected string Output;

        protected void Show(object sender, EventArgs e)
        {
            if (!string.IsNullOrWhiteSpace(HeightTextBox.Text))
                ShowRankButton.Text = Try(() => "第" + WoGBuddy.GetRank(double.Parse(HeightTextBox.Text)).ToString() + "名！");
            if (!string.IsNullOrWhiteSpace(RankTextBox.Text))
                ShowHeightButton.Text = Try(() => WoGBuddy.GetHeight(long.Parse(RankTextBox.Text)).ToString() + "米！");
            if (!string.IsNullOrWhiteSpace(PlayerKeyBox.Text)) ShowNameButton.Text = Try(() => WoGBuddy.GetPlayerName(PlayerKeyBox.Text));
        }
    }
}