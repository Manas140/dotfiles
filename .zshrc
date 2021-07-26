## ZSH Config (~/.zshrc)
# --------------------------

#Prompt
PS1="%F{magenta}%B%~/%b%f → "
export EDITOR=nvim

# Aliases
alias ls='ls --color=auto'
alias cls='clear'
alias docker='sudo docker'
alias open='xdg-open'
alias xi='sudo xbps-install'
alias xr='sudo xbps-remove'
alias xq='sudo xbps-query'

# History
HISTSIZE=500
SAVEHIST=1000
HISTFILE=/.cache/zsh/history

# Tab completion
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

#binds
bindkey    "^[[3~"          delete-char
bindkey "^A" beginning-of-line
bindkey "^Q" end-of-line
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

