#!/bin/bash
pkg_managers=(xbps-install apt pacman)

for pkg_man in ${pkg_managers[@]}; do
    av_pkg_man=$(which $pkg_man)
    case $av_pkg_man in
        *xbps-install*)
            xbps-install -Mun | wc -l;;
        *apt*)
            apt list --upgradable | wc -l;;
        *pacman*)
            pacman -Sy &>/dev/null && pacman -Qu | wc -l;;
        *)
            printf "Error\n";;
    esac
    exit
done
