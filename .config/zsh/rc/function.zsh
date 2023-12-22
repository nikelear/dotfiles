function ggr () {
  firefox "https://www.google.com/search?q=${*// /+}"
}


function wiki () {
  if [ $# -ne 1 ]; then
    echo "Function wiki requires exactly one argument."
    return
  fi
  firefox "https://ja.wikipedia.org/wiki/"$1
}

te () {
  trans -b :en "$*"
}

tj () {
  trans -b :ja "$*"
}