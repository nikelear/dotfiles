
PS1='\u@\h:\w\n\$'
PS1="\[\e[1;34m\][\u@\h \W]\\$ \[\e[m\]"
prompt_git() {
	local branchName='';

	# check in worktree
	if [ $(git rev-parse --is-inside-work-tree &>/dev/null; echo $?) == '0' ]; then

		# fetch branch name or hash
		branchName="$(git symbolic-ref --quiet --short HEAD 2> /dev/null || \
			git rev-parse --short HEAD 2> /dev/null || \
			echo '(unknown)')";

		echo -e " (${branchName}) ";
	else
		return;
	fi;
}

PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$(prompt_git)\n\t \$ "

export PS1
