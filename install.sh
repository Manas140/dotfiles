#!/bin/bash

#variables
green="\033[1;32m"
yellow="\033[1;33m"
blue="\033[1;34m"
red="\033[1;31m"
magenta="\033[1;35m"
end="\033[1;0m"

printf "${green}[*] This Config Replaces Your Previous Config, Make A Backup Before Running It.${end}\n"

printf "${blue} [*] Proceeding Here Will Replace Your Config(If It's There).${yellow}\n"
read -p "  [*] DO YOU WANT TO PROCEED [Y/N] " allowed

if [[ $allowed = Y* || $allowed = y* || $allowed = "" ]]; then
    cp -r .*rc ~/.
    printf "${magenta}   [*] Terminal Set\n"
    cp -r fonts/* ~/.fonts/
    printf "${magenta}   [*] Fonts Installed\n"
    cp -r walls/* ~/Pictures/Wallpapers/.
    printf "${magenta}   [*] Wallpapers Installed${end}\n"
    cp -r * ~/.config/.
    rm -r ~/.config/README.md ~/.config/LICENSE ~/.config/install.sh ~/.config/fonts/ ~/.config/walls/
    printf "${green}[*] Config Installed${end}\n"
else
    printf "${red}[-] Aborting!${end}\n"
fi

