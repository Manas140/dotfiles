#!/usr/bin/env bash
walls_dir=~/Pictures/Wallpapers
walls=($(echo $walls_dir/*))
number_of_walls=$(ls $walls_dir | wc -l )
random_number=$(($RANDOM%$number_of_walls))
wall=${walls[$(echo $random_number)]}
feh --bg-fill $wall
