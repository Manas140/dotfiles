#!/bin/sh

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

case $allowed in
  Y*|y*) cp -r .*rc ~/.
    printf "${magenta}   [*] Terminal Set\n"
    cp -r fonts/* ~/.fonts/
    printf "${magenta}   [*] Fonts Installed\n"
    cp -r walls/* ~/Pictures/Wallpapers/.
    printf "${magenta}   [*] Wallpapers Installed${end}\n"
    cp -r * ~/.config/.
    rm -r ~/.config/LICENSE ~/.config/fonts/ ~/.config/walls/ ~/.config/*.png
    printf "${green}[*] Config Installed${end}\n";;
  N*|n*) printf "${red}[-] Aborting!${end}\n";;
  *) printf "${red}[-] Aborting!${end}\n";;
esac
