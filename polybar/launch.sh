#!/usr/bin/sh

dir="$HOME/.config/polybar"

launch_bar() {
  killall polybar
  while pgrep polybar; do killall polybar; done
  polybar -q main -c "$dir/$style.ini"
}

case $1 in
  *comfy*) style="comfy";;
  *compact*) style="compact";;
  *info*) style="informative";;
  *h*)
    printf "Usage : launch.sh theme\nThemes: comfy compact info manas"
    exit;;
  *) style="config";;
esac

launch_bar
