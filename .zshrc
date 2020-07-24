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
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*'     formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*'     actionformats '[%b|%a]'

setopt PROMPT_SUBST
PROMPT='%F{magenta}${PWD/#$HOME/~}%f ${vcs_info_msg_0_} > '
