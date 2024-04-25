[ ! command -v git &> /dev/null ] && exit 0

if [ ! -d "${XDG_DATA_HOME}/zsh-abbr" ] && [ ! -d "${XDG_DATA_HOME}/fzf-tab-completion" ]; then
  [ timeout 5 git ls-remote "https://github.com/zenn-dev/zenn-community" &> /dev/null ] && exit 0
fi

if [ ! -d "${XDG_DATA_HOME}/zsh-abbr" ]; then
  (cd "${XDG_DATA_HOME}" && git clone https://github.com/olets/zsh-abbr)
fi

if [ ! -d "${XDG_DATA_HOME}/fzf-tab-completion" ]; then
  (cd "${XDG_DATA_HOME}" && git clone https://github.com/lincheney/fzf-tab-completion)
fi

source "${XDG_DATA_HOME}/zsh-abbr/zsh-abbr.zsh"
source "${XDG_DATA_HOME}/fzf-tab-completion/zsh/fzf-zsh-completion.sh"

