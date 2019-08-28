HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
KEYTIMEOUT=1
zmodload zsh/complist
setopt autocd share_history hist_ignore_dups nomatch notify
unsetopt beep extendedglob

# highlight items during tab completion
zstyle ':completion:*' menu select

# set vim as the text editor
bindkey -v
export VISUAL=nvim
export EDITOR="$VISUAL"
export BROWSER=firefox

source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh

zstyle :compinstall filename '/home/alexander/.zshrc'
autoload -Uz compinit promptinit
compinit
promptinit
prompt redhat

export ZGEN_RESET_ON_CHANGE=(${HOME}/.zshrc)
source /usr/share/zsh/share/zgen.zsh
if ! zgen saved; then
  # load plugins
  zgen load zsh-users/zsh-syntax-highlighting
  zgen load zsh-users/zsh-history-substring-search
  # zgen load zsh-users/zsh-autosuggestions
  zgen load zsh-users/zsh-completions
  zgen load mafredri/zsh-async
  zgen load sindresorhus/pure

  # generate the init script from plugins above
  zgen save
fi

setopt HIST_FIND_NO_DUPS
HISTORY_SUBSTRING_SEARCH_FUZZY='true'

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

bindkey -M menuselect '^[[Z' reverse-menu-complete

# disable shell reserved word and enable POSIX output
# disable -r time
# alias time='time -p '

# aliases
alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'
alias ls='ls --color=always'
alias v='nvim'
alias cdfm='cd /home/alexander/development/tzoa/fm/fleet-management'
