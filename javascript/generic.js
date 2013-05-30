(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
})(window,document,'script','//www.google-analytics.com/analytics.js','ga');

ga('create', 'UA-41310796-1', 'apphb.com');
ga('send', 'pageview');

function isNullOrWhiteSpace(input) {
    if (!input) return true;
    return input.replace(/\s/g, '').length < 1;
}

function getQueryStringRegExp(name) {
    var reg = new RegExp("(^|\\?|&)" + name + "=([^&]*)(\\s|&|$)", "i");
    if (reg.test(location.href)) return unescape(RegExp.$2.replace(/\+/g, " "));
    return "";
};

$.base64 = {
    encode: function(str) {
        return CryptoJS.enc.Base64.stringify(CryptoJS.enc.Utf8.parse(str));
    },
    decode: function(str) {
        return CryptoJS.enc.Base64.parse(str).toString(CryptoJS.enc.Utf8);
    }
};

$.base64reversed = {
    encode: function(str) {
        return $.base64.encode(str.split("").reverse().join(""));
    },
    decode: function(str) {
        return $.base64.decode(str).split("").reverse().join("");
    }
};