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
	local branchName=''

	# check in worktree
	if [ $(git rev-parse --is-inside-work-tree &>/dev/null; echo $?) -eq '0' ]; then

		# # fetch branch name or hash
		# branchName="$(git symbolic-ref --quiet --short HEAD 2> /dev/null || \
		# 	git rev-parse --short HEAD 2> /dev/null || \
		# 	echo '(unknown)')"

		# echo -e " (${branchName}) "
    local branchname=$(git symbolic-ref --short HEAD 2> /dev/null)
    if [ -z $branchname ]; then
      return
    fi
    local st=$(git status 2> /dev/null)
    local state=""
    local git_status=$(git status 2>/dev/null)
    
    if echo "$git_status" | grep -q "diverged"; then
      state="${state}<>"
    elif echo "$git_status" | grep -q "ahead"; then
      state="${state}^"
    elif echo "$git_status" | grep -q "behind"; then
      state="${state}v"
    fi
    
    if echo "$git_status" | grep -q "Unmerged paths"; then
      state="${state}="
    fi
    
    if echo "$git_status" | grep -q "Untracked files"; then
      state="${state}?"
    fi
    
    if echo "$git_status" | grep -q "Changes to be committed"; then
      state="${state}+"
    fi
    
    if echo "$git_status" | grep -q "Changes not staged for commit"; then
      state="${state}!"
    fi
    
    if echo "$git_status" | grep -q "renamed:"; then
      state="${state}>>"
    fi
    
    if echo "$git_status" | grep -q "deleted:"; then
      state="${state}x"
    fi
    
    if [ ! -z "$(git stash list)" ]; then
      state="${state}\$"
    fi

    echo " [$branchname] ($state) "
	else
		return
	fi
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
