#!/bin/sh

for a in $(ls /bin); do
  case $a in
    xbps-install) xbps-install -Mun | wc -l;;
    pacman) pacman -Qu | wc -l;;
  esac
done
