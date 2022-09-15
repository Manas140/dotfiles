<h1 align="center">AweDots</h1>
<h4 align="center">Config files for AwesomeWm</h4>

<p align="center">
  <a href="https://github.com/Manas140/dotfiles/stargazers"><img src="https://img.shields.io/github/stars/Manas140/dotfiles?colorA=151515&colorB=8C977D&style=for-the-badge&logo=starship"></a>
  <a href="https://github.com/Manas140/dotfiles/issues"><img src="https://img.shields.io/github/issues/Manas140/dotfiles?colorA=151515&colorB=B66467&style=for-the-badge&logo=bugatti"></a>
  <a href="https://github.com/Manas140/dotfiles/network/members"><img src="https://img.shields.io/github/forks/Manas140/dotfiles?colorA=151515&colorB=8DA3B9&style=for-the-badge&logo=github"></a>
</p>

<p align="center">
  <img src="preview.png">
</p>

## Installation

- <details><summary>Prerequisites</summary>

  > Must have, just to make sure everything works properly

    ```
    awesome bluez elogind flameshot kitty mpd mpDris2 nmcli playerctl pulsemixer redshift rofi xbacklight xsettingsd zsh
    ```

  > Suggested, makes everything feel complete

    ```
    alacritty firefox ncmpcpp nvim lf zathura
    ```

</details>

- Clone the repo

  ```
  git clone https://github.com/Manas140/dotfiles.git --depth=1 --branch='awedots' && cd dotfiles
  ```

- Install / Copy all configs

  ```
  ./install.sh 
  ```

</details>

## Usage [ Keybinds ] 
| Key                                  | Action                     |
| -----                                | -----                      |
| **[Software]**                       | **Action**                 |
| Print                                | flameshot gui              |
| Super + r                            | rofi                       |
| Super + Return                       | kitty                      |
|                                      |                            |
| **[Hardware]**                       | **Action**                 |
| Fn + Arrow [Up,Down]                 | Volume Control             |
| Fn + Arrow [Left,Right]              | Brightness Control         |
|                                      |                            |
| **[AwesomeWm]**                      | **Action**                 |
| Super + d                            | open dashboard             |
| Super + q                            | kill focused window        |
| Alt + Tab                            | toggle window focus        |
| Super + Tab                          | toggle floating/tiling     |
| Super + space                        | toggle fullscreen          |
| Super + [1-9]                        | focus desktop 1-9          |
| Super + Shift + [1-9]                | move window to desktop 1-9 |
| Super + Arrow [Up,Down,Left,Right]   | resize window              |


## Project references
  - Colorscheme: [Paradise-theme](https://github.com/paradise-theme)
  - Fetch: [Fetch](https://github.com/manas140/fetch)
  - Firefox: [SimpleFox](https://github.com/migueravila/SimpleFox)
  - Nvim: [Conscious](https://github.com/manas140/conscious)

## Special Thanks

  - [Rklyz](https://github.com/rklyz)
