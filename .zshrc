# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# 補完機能を有効にする
autoload -Uz compinit
compinit -u
if [ -e /usr/local/share/zsh-completions ]; then
  fpath=(/usr/local/share/zsh-completions $fpath)
fi

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000


# 直前と同じコマンドをヒストリに残さない
setopt hist_ignore_dups

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# 同時に起動したzshの間でヒストリを共有
setopt share_history
 
# コマンドのスペルを訂正
setopt correct

# ビープ音を鳴らさない
setopt no_beep
 
# cdなしで移動可能
setopt auto_cd

# カッコの対応などを自動的に補完
setopt auto_param_keys

# ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt auto_param_slash

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# 補完候補を詰めて表示
setopt list_packed

# 補完候補一覧をカラー表示
autoload colors
zstyle ':completion:*' list-colors ''

# コマンドのスペルを訂正
setopt correct

# setting alias

alias la='ls -a'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias ..2='cd ../..'
alias ..3='cd ../../..'

alias ai='sudo apt install'
alias ar='sudo apt remove'
alias au='sudo apt update'

alias vf='vifm'

alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gb='git branch'
alias gco='git checkout'

# search script
ggs() {
    local url="https://google.co.jp/search?q=${*// /+}"
    firefox.exe $url
}

dej() {
  local url="https://www.deepl.com/translator#en/ja/$*"
  firefox.exe $url
}

dje() {
  local url="https://www.deepl.com/translator#ja/en/$*"
  firefox.exe $url
}



# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


if [[ $(cat /etc/environment) =~ HTTP_PROXY=.* ]]; then
  export http_proxy=http://tyo4.sme.zscaler.net:80
  export https_proxy=${http_proxy}
  export ftp_proxy=${http_proxy}
  export HTTP_PROXY=${http_proxy}
  export HTTPS_PROXY=${http_proxy}
  export FTP_PROXY=${http_proxy}
fi

if [ -d "$HOME/.cargo" ]; then
  . "$HOME/.cargo/env"
fi

if command -v sheldon &> /dev/null; then
  eval "$(sheldon source)"
fi



# ZSH_DIR="${HOME}/.zsh"

# # .zshがディレクトリで、読み取り、実行、が可能なとき
# if [ -d $ZSH_DIR ] && [ -r $ZSH_DIR ] && [ -x $ZSH_DIR ]; then
#     # zshディレクトリより下にある、.zshファイルの分、繰り返す
#     for file in ${ZSH_DIR}/**/*.zsh; do
#         # 読み取り可能ならば実行する
#         [ -r $file ] && source $file
#     done
# fi