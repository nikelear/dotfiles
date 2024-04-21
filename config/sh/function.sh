__load_configure () {
  if [ -d $1 ] && [ -r $1 ] && [ -x $1 ]; then
    for file in $1/*.sh; do
      [ -r $file ] && source $file
    done
  fi
}
__load_command () {
  local cache_dir="${XDG_CACHE_HOME:-$HOME/.cache}"
  local config_dir="${XDG_CONFIG_HOME:-$HOME/.config}"
  local target=$1
  local config="${config_dir}/${2}"
  local command=${3}
  local cache="${cache_dir}/$target.$4"

  if command -v $target &> /dev/null; then
    if [[ ! -r "$cache" || "$config" -nt "$cache" ]]; then
      mkdir -p $cache_dir
      eval $command > "$cache"
    fi
    source "${cache}"
  fi
}

__prompt_git() {

  local branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
  if [[ -z "$branch" ]]; then
    return 0
  fi

  local marks=""
  local gst="$(git status --porcelain --branch)"

  [[ $gst =~ "behind" ]] && marks+="<"
  [[ $gst =~ "ahead" ]] && marks+=">"
  [[ $gst =~ "\?\?" ]] && marks+="?"
  [[ $gst =~ "M[ MTD] " ]] && marks+="+"
  [[ $gst =~ "[ MTARC]M " ]] && marks+="!"
  [[ $gst =~ "R[ MTD] " ]] && marks+="»"
  [[ $gst =~ "[ MTARC]D " ]] && marks+="x"
  [[ $gst =~ "UU " ]] && marks+="="
  
#  [[ $(git stash list) ]] && marks+="$"

  [[ -z $marks ]] || marks="[$marks]"
  
  echo " ($branch) $marks "
}


git_push_new_branch(){
    branch_name=$(git symbolic-ref --short HEAD)
    git push --set-upstream origin $branch_name
}

# search
ggr () {
  firefox "https://www.google.com/search?q=${*// /+}"
}

wiki () {
  if [ $# -ne 1 ]; then
    echo "Function wiki requires exactly one argument."
  else
    firefox "https://ja.wikipedia.org/wiki/"$1
  fi
}


if [ -d /mnt/c ]; then
  cdh () {
    if command -v cmd > /dev/null; then
      cd /mnt/c
      userprofile=$(cmd /C echo %USERPROFILE% | tr -d '\r')
      fd=$(echo "$userprofile" | awk -F'\\' '{print $NF}')
  
      cd /mnt/c/Users/$fd
    else
      echo "not set cmd-path"
    fi
  }
fi

fbr() {
  local branches branch
  branches=$(git --no-pager branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}
