# builtin
alias la='ls -a'
alias ll='ls -l'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# apt
alias ai='sudo apt install'
alias ar='sudo apt remove'
alias au='sudo apt update'
alias aug='sudo apt upgrade'

#vim
alias vf='vifm'

# tmux
alias t='tmux attach || tmux new-session'

# git
alias gs='git status'
alias ga='git add'
alias gd='git diff'
alias gds='git diff --staged'
alias gcm='git commit -m'
alias gp='git push origin HEAD'
alias gpl='git pull'
alias gc='git checkout'
alias gb='git branch'
alias gl='git log --oneline --graph --decorate'

# settings
alias initrc='vim ~/.config/initrc'
alias vimrc='vim ~/.vimrc'
alias tmuxconf='vim ~/.tmux.conf'
alias reload='exec $SHELL -l'
