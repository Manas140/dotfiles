#interactive mode idk how this works
[[ $- != *i* ]] && return

#Prompt
PS1='\033[1;35m\w/ → \033[1;0m'

#Aliases
alias ls='ls --color=auto'
alias cls='clear'
alias py='python3'
alias pip='pip3'
alias ytdl='youtube-dl'
alias docker='sudo docker'
alias open='xdg-open'
alias xr='sudo xbps-remove'
alias xi='sudo xbps-install'
alias xq='sudo xbps-query'
alias sudo='sudo -p "$(printf "\033[1;31mPassword: " )"'
alias cp='printf "\033[1;32m" && cp -v'
alias mv='printf "\033[1;34m" && mv -v'
alias rm='printf "\033[1;31m" && rm -v'
