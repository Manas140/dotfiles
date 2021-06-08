#!/usr/bin/env bash

dir="$HOME/.config/polybar"
style="default"

launch_bar() {
	# Terminate already running bar instances
	killall -q polybar

	# Wait until the processes have been shut down
	while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

	# Launch the bar
	#if [[ "$style" == "hack" || "$style" == "cuts" ]]; then
	#	polybar -q top -c "$dir/$style/config.ini" &
	#	polybar -q bottom -c "$dir/$style/config.ini" &
	#elif [[ "$style" == "pwidgets" ]]; then
	#	bash "$dir"/pwidgets/launch.sh --main
	#else
	polybar -q main -c "$dir/$style/config.ini" &	
	#fi
}

launch_bar
