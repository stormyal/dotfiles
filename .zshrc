# ==========================================
# ================== PATH ==================
# ==========================================
export PATH=/opt/homebrew/bin:$PATH

# if [ -z "$TMUX" ]
# then
#     # tmux attach -t TMUX || tmux new -s TMUX
#     tmux
# fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ==========================================
# ================ PLUGINS =================
# ==========================================
source "${HOME}/.zgenom/zgenom.zsh"
zgenom autoupdate
if ! zgenom saved; then
    zgenom load jeffreytse/zsh-vi-mode
    zgenom load zsh-users/zsh-completions
    zgenom load zsh-users/zsh-syntax-highlighting
    zgenom load zsh-users/zsh-history-substring-search
    zgenom load romkatv/powerlevel10k powerlevel10k
fi

# ==========================================
# ================ ALIASES =================
# ==========================================
alias v="nvim"
alias cm="cmatrix"
alias gt="git log --oneline --graph --decorate --all"
alias gq="git add -A && git commit -m \"changes\" && git push"

# ============================================
# ============= CUSTOM SETTINGS ==============
# ============================================
# default editor
export EDITOR="nvim"
export VISUAL="nvim"
export ZVM_VI_EDITOR="nvim"

# command history
export HISTSIZE=1000000
export SAVEHIST=1000000
setopt inc_append_history
setopt share_history
setopt hist_ignore_dups
HISTORY_SUBSTRING_SEARCH_FUZZY='true'
bindkey -M viins "^[[A" history-substring-search-up
bindkey -M viins "^[[B" history-substring-search-down
#bindkey -M main "^P" history-substring-search-up
#bindkey -M main "^N" history-substring-search-down
#bindkey -M vicmd "^P" history-substring-search-up
#bindkey -M vicmd "^N" history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# command completion on tab
autoload -U compinit; compinit

# highlight items during tab completion
zstyle ':completion:*' menu select

# shift+tab to go up in autocomplete menu
# note: might have to run zsh -Y if this is not working
bindkey -M viins '^[[Z' reverse-menu-complete

# cd without typing 'cd'
setopt autocd

# ls colorful and stuff
export CLICOLOR=1

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# fzf's command
export POWERLEVEL9K_INSTANT_PROMPT="quiet"
export FZF_DEFAULT_COMMAND="fd"
# CTRL-T's command
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# ALT-C's command
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND --type d"
export FZF_DEFAULT_OPTS="
--layout=reverse
--info=inline
--height=80%
--multi
--preview-window=:hidden
--preview '([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'
--color='hl:148,hl+:154,pointer:032,marker:010,bg+:237,gutter:008'
--prompt='∼ ' --pointer='▶' --marker='✓'
--bind '?:toggle-preview'
--bind 'ctrl-a:select-all'
--bind 'ctrl-y:execute-silent(echo {+} | pbcopy)'
--bind 'ctrl-e:execute(echo {+} | xargs -o vim)'
--bind 'ctrl-v:execute(code {+})'
"


# https://unix.stackexchange.com/questions/157763/do-we-have-more-history-for-cd
setopt AUTO_PUSHD                  # pushes the old directory onto the stack
setopt PUSHD_MINUS                 # exchange the meanings of '+' and '-'
setopt CDABLE_VARS                 # expand the expression (allows 'cd -2/tmp')
autoload -U compinit && compinit   # load + start completion
zstyle ':completion:*:directory-stack' list-colors '=(#b) #([0-9]#)*( *)==95=38;5;12'

alias list_colors='for i in {0..255}; do printf "\x1b[38;5;%dmcolour%d\x1b[0m\n" $i $i; done'

