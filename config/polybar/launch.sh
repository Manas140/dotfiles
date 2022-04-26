#!/bin/sh

dir="$HOME/.config/polybar"
killall polybar;
polybar -q main -c "$dir/config.ini"
