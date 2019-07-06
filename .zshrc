HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd share_history nomatch notify
unsetopt beep extendedglob
bindkey -v

zstyle :compinstall filename '/home/alexander/.zshrc'
autoload -Uz compinit promptinit
compinit
promptinit
prompt redhat

source /usr/share/zsh/share/zgen.zsh
# bindkey '^ ' autosuggest-accept

# bindkey "^[[A" history-beginning-search-backward
# bindkey "^[[B" history-beginning-search-forward


if ! zgen saved; then

  # specify plugins
  zgen load zsh-users/zsh-syntax-highlighting

  # generate the init script from plugins above
  zgen save
fi

# aliases
alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'
