function isNullOrWhiteSpace(input) {
    if (!input) return true;
    return input.replace(/\s/g, '').length < 1;
}

$.base64 = {
    encode: function (str) {
        return CryptoJS.enc.Base64.stringify(CryptoJS.enc.Utf8.parse(str));
    },
    decode: function (str) {
        return CryptoJS.enc.Base64.parse(str).toString(CryptoJS.enc.Utf8);
    }
}