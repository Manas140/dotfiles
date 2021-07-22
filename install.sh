
echo -e [*] This Config Replaces Your Previous Config, Make A Backup Before Running It.

echo "[*] Proceeding Here Will Replace Your Config(If It's There)."
read -p "[*] DO YOU WANT TO PROCEED [Y/N] " allowed
if [[ $allowed = Y* || $allowed = y* ]]; then
    cp -r fonts/* ~/.fonts/
    echo -e [*] Fonts Installed
    cp -r walls/* ~/Pictures/Wallpapers/.
    echo -e [*] Wallpapers Installed
    cp -r * ~/.config/.
    rm -r ~/.config/README.md ~/.config/install.sh ~/.config/fonts/ ~/.config/walls/
    echo -e [*] Config Installed
else
    echo -e Aborting!
fi
