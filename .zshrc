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
zstyle ':vcs_info:*'     actionformats     "%F{cyan}[%b|%a]%f"

setopt PROMPT_SUBST
PROMPT='%F{magenta}${PWD/#$HOME/~}%f $ '
RPROMPT='${vcs_info_msg_0_}'

# java
export JAVA_HOME=/Library/Java/JavaVirtualMachines/amazon-corretto-8.jdk/Contents/Home

# python
export PATH=/usr/local/bin:$PATH

# nvm(node)
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
	  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

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

# commit履歴をbranchの分岐も含めて可視化してくれる
fshow() {
  git log --graph --color=always \
    --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
    --bind "ctrl-m:execute:
      (grep -o '[a-f0-9]\{7\}' | head -1 |
      xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
      {}
      FZF-EOF"
}
