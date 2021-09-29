#Prompt
PS1="%F{magenta}%B%~/ → %b%f"
export EDITOR=nvim

# Aliases
alias ls='ls --color=auto'
alias cls='clear'
alias py='python3'
alias pip='pip3'
alias ytdl='youtube-dl'
alias docker='sudo docker'
alias open='xdg-open'
alias xi='sudo xbps-install'
alias xr='sudo xbps-remove'
alias xq='sudo xbps-query'
alias sudo='sudo -p "$(printf "\033[1;31mPassword: " )"'
alias cp='printf "\033[1;32m" && cp -v'
alias mv='printf "\033[1;34m" && mv -v'
alias rm='printf "\033[1;31m" && rm -v'

# History
HISTSIZE=500
SAVEHIST=1000
HISTFILE=.cache/zsh_history

# Tab completion
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

#binds
bindkey "^[[3~" delete-char
bindkey "^A" beginning-of-line
bindkey "^Q" end-of-line
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

