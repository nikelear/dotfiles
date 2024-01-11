
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

cdh () {
  if [ -d /mnt/c ]; then
    if command -v cmd > /dev/null; then
      cd /mnt/c
      userprofile=$(cmd /C echo %USERPROFILE% | tr -d '\r')
      fd=$(echo "$userprofile" | awk -F'\\' '{print $NF}')

      cd /mnt/c/Users/$fd
    else
      echo "not set cmd-path"
    fi
  else
    echo "not in wsl"
  fi
}