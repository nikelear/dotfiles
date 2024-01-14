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
alias v='nvim'
alias vf='vifm'
alias vimrc='nvim ~/.config/nvim/init.lua'

# tmux
alias t='tmux attach || tmux'
alias tmuxconf='nvim ~/.tmux.conf'

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
alias reload='exec $SHELL -l'
