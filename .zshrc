HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd share_history hist_ignore_dups nomatch notify
unsetopt beep extendedglob

# set vim as the text editor
bindkey -v

zstyle :compinstall filename '/home/alexander/.zshrc'
autoload -Uz compinit promptinit
compinit
promptinit
prompt redhat

export ZGEN_RESET_ON_CHANGE=(${HOME}/.zshrc)
source /usr/share/zsh/share/zgen.zsh
setopt HIST_FIND_NO_DUPS

if ! zgen saved; then
  # load plugins
  zgen load zsh-users/zsh-syntax-highlighting
  zgen load zsh-users/zsh-history-substring-search
  zgen load zsh-users/zsh-autosuggestions
  zgen load zsh-users/zsh-completions

  # zgen oh-my-zsh themes/arrow
  # generate the init script from plugins above
  zgen save
fi

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# aliases
alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'
alias ls='ls --color=always'
alias v='nvim'
alias cdfm='cd /home/alexander/development/tzoa/fm/fleet-management'
