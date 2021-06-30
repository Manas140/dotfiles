
echo -e [*] This Config Replaces Your Previous Config, Make A Backup Before Running ./install.sh -y

if [[ "$1" == "-y" ]]; then
    cp -r fonts/* ~/.fonts/
    echo -e [*] Fonts Installed
    cp -r walls/* ~/Pictures/Wallpapers/.
    echo -e [*] Wallpapers Installed
    cp -r * ~/.config/.
    rm -r ~/.config/README.md ~/.config/install.sh ~/.config/fonts/ ~/.config/walls/
    echo -e [*] Config Installed
fi

