#!/bin/bash

#variables
green="\033[1;32m"
blue="\033[1;34m"
red="\033[1;31m"
magenta="\033[1;35m"
end="\033[1;0m"

echo -e "${green}[*] This Config Replaces Your Previous Config, Make A Backup Before Running It.${end}"

echo -e "${blue} [*] Proceeding Here Will Replace Your Config(If It's There).${end}"
read -p "  [*] DO YOU WANT TO PROCEED [Y/N] " allowed

if [[ $allowed = Y* || $allowed = y* || $allowed = "" ]]; then
    cp -r .*rc ~/.
    echo -e "${magenta}   [*] Terminal Set"
    cp -r fonts/* ~/.fonts/
    echo -e "${magenta}   [*] Fonts Installed"
    cp -r walls/* ~/Pictures/Wallpapers/.
    echo -e "${magenta}   [*] Wallpapers Installed${end}"
    cp -r * ~/.config/.
    rm -r ~/.config/README.md ~/.config/LICENSE ~/.config/install.sh ~/.config/fonts/ ~/.config/walls/
    echo -e "${green}[*] Config Installed${end}"
else
    echo -e "${red}[-] Aborting!${end}"
fi

