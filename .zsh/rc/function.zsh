# search script
ggr() {
    local url="https://google.co.jp/search?q=${*// /+}"
    firefox.exe $url
}