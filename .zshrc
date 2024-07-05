
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# suppres p10k warning
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# ==========================================
# ================ PLUGINS =================
# ==========================================
source "${HOME}/.zgenom/zgenom.zsh"
zgenom autoupdate
if ! zgenom saved; then
    zgenom load zsh-users/zsh-completions
    zgenom load zsh-users/zsh-syntax-highlighting
    zgenom load jeffreytse/zsh-vi-mode
    zgenom load zsh-users/zsh-history-substring-search
    zgenom load romkatv/powerlevel10k powerlevel10k
fi

# ==========================================
# ================== PATH ==================
# ==========================================
export PATH=/opt/homebrew/bin:$PATH

# ==========================================
# ================ ALIASES =================
# ==========================================
alias v="nvim"
alias cm="cmatrix"

# ============================================
# ============= CUSTOM SETTINGS ==============
# ============================================
# default editor
export EDITOR="nvim"
export VISUAL="nvim"
export ZVM_VI_EDITOR="nvim"

# command history
export HISTSIZE=10000000
export SAVEHIST=10000000
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
