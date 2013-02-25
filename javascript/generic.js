function isNullOrWhiteSpace(input) {
    if (!input) return true;
    return input.replace(/\s/g, '').length < 1;
}