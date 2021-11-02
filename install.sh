#!/bin/sh

#variables
cr="\033[1;31m"
cg="\033[1;32m"
cb="\033[1;34m"

printf "${cg}[*] Proceeding Will Replaces Your Previous Config, Make A Backup Before Running It.\n"
printf "${cr}"
read -p "[*] DO YOU WANT TO PROCEED [Y/N] " allowed
dir="$HOME/.config $HOME/Pictures/Wallpapers $HOME/.local/bin $HOME/.fonts"

case $allowed in
  Y*|y*)
    for a in $dir; do 
      if ! [ -d $a ]; then 
        mkdir $a 
      fi
    done
    printf "${cg}[*] Copying Dotfiles\n"
    printf "${cb} [*] Copying Configs\n"
    cp -r config/* ~/.config
    cp -r home/.*rc ~/.
    printf "${cg} [*] Configs Copied\n"
    printf "${cb} [*] Copying Scripts\n"
    cp -r bin/* ~/.local/bin/
    printf "${cg} [*] Scripts Copied\n"
    printf "${cb} [*] Copying Wallpapers\n"
    cp -r walls/* ~/Pictures/Wallpapers
    printf "${cg} [*] Wallpapers Copied\n"
    printf "${cb} [*] Copying Fonts\n"
    cp -rn fonts/* ~/.fonts
    printf "${cg} [*] Fonts Copied\n"
    printf "${cg}[*] Dotfiles Installed\n";;
  *) printf "${cr}[-] Aborting!\n";;
esac
