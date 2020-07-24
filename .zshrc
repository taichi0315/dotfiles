export XDG_CONFIG_HOME=~/.config
export LANG=ja_JP.UTF-8

# alias
alias ls='ls -G'
alias la='ls -a'
alias vi='nvim'

# prompt
autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr         "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr       "%F{red}+"
zstyle ':vcs_info:*'     formats           "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*'     actionformats     '[%b|%a]'

setopt PROMPT_SUBST
PROMPT='%F{magenta}${PWD/#$HOME/~}%f ${vcs_info_msg_0_} $ '

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fvi - search file and open file by nvim
fvi() {
  files=$(git ls-files) &&
  selected_files=$(echo "$files" | fzf -m --preview 'head -100 {}') &&
  vi $selected_files
}

# fbr - checkout git branch (including remote branches)
fbr() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}
