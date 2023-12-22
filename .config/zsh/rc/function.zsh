
# search
ggr () {
  firefox "https://www.google.com/search?q=${*// /+}"
}

wiki () {
  if [ $# -ne 1 ]; then
    echo "Function wiki requires exactly one argument."
    return
  fi
  firefox "https://ja.wikipedia.org/wiki/"$1
}

# translate
te () {
  trans -b :en "$*"
}

tj () {
  trans -b :ja "$*"
}