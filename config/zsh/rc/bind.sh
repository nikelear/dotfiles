# fzf-tab
bindkey '^I' fzf_completion

# fzf-ghq
function cd_ghq_list() {
  local destination_dir="$(ghq list | fzf)"
  echo $destination_dir > ~/fuga
  if [ -n "$destination_dir" ]; then
    BUFFER="cd ~/.local/share/ghq/$destination_dir"
    zle accept-line
  fi
  zle clear-screen
}
zle -N cd_ghq_list
bindkey '^g' cd_ghq_list
