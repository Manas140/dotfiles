<h1 align="center">Dotfiles</h1>
<h4 align="center">Config files by Manas140</h4>

<p align="center">
  <a href="https://github.com/Manas140/dotfiles/stargazers"><img src="https://img.shields.io/github/stars/Manas140/dotfiles?colorA=151515&colorB=8C977D&style=for-the-badge&logo=starship"></a>
  <a href="https://github.com/Manas140/dotfiles/issues"><img src="https://img.shields.io/github/issues/Manas140/dotfiles?colorA=151515&colorB=B66467&style=for-the-badge&logo=bugatti"></a>
  <a href="https://github.com/Manas140/dotfiles/network/members"><img src="https://img.shields.io/github/forks/Manas140/dotfiles?colorA=151515&colorB=8DA3B9&style=for-the-badge&logo=github"></a>
</p>

<p align="center">
  <img src="preview.png">
</p>

## Installation

- <details><summary>Prerequisites</summary><br>
  
  > Must have, just to make sure everything works properly
  
    ```
    ImageMagick alsa-plugins-pulseaudio bspwm dunst feh flameshot i3lock-color kitty maim notify-send pactl picom pulseaudio redshift rofi sxhkd tint2 xbacklight xclip xsettingsd zsh
    ```
  
  > Suggested, makes everything feel complete

    ```
    alacritty bash firefox htop lf lite-xl mpv nvim zathura
    ```
  
  > For convinience, make your life easy

    ```
    bc ffmpeg fzf make xdg-utils xdotools 
    ```

</details>

- Clone the repo

  ```
  git clone https://github.com/Manas140/dotfiles.git && cd dotfiles
  ```

- Install / Copy all configs

  ```
  ./install.sh 
  ```

- <details><summary>Download submodules, includes config for Gtk3 & Nvim ... [ Optional ]</summary><br>

  ```
  git submodules init
  git submodules update
  ```
  
  > Once Done, 
  > - Follow Gtk3 installation over [here](https://github.com/paradise-theme/gtk).
  > - Follow Nvim installation over [here](https://github.com/manas140/conscious).
  
</details>

## Usage [ Keybinds ] 
| Key                                  | Action                     |
| -----                                | -----                      |
| Super + Return                       | kitty                      |
| Super + b                            | firefox                    |
| Super + r                            | rofi                       |
| Print                                | screenshot menu            |
| Super + p                            | power menu                 |
| Super + Print                        | powermenu                  |
| Super + [1-9]                        | focus desktop 1-9          |
| Super + Shift + [1-9]                | move window to desktop 1-9 |
| Alt + Tab                            | toggle window focus        |
| Super + Tab                          | toggle floating/tiling     |
| Super + q                            | kill focused window        |
| Super + space                        | toggle fullscreen          |
| Super + m                            | toggle monocle             |
| Super + Arrow [Up,Down,Left,Right]   | resize window              |
| Super + Shift + [Up,Down,Left,Right] | swap window                |

## Project references
  - Colorscheme: [Paradise-theme](https://github.com/paradise-theme)
  - Fetch: [Fetch](https://github.com/manas140/fetch)
  - Firefox: [SimpleFox](https://github.com/migueravila/SimpleFox)
  - Nvim: [Conscious](https://github.com/manas140/conscious)
