
echo -e [*] This Config Replaces Your Previous Config Make A Backup Before Running ./install.sh -y

if [[ "$1" == "-y" ]]; then
    cp -r fonts/* ~/.fonts/
    echo -e [*] Fonts Installed
    cp -r * ~/.config/
    rm ~/.config/README.md ~/.config/install.sh
    echo -e [*] Config Installed
fi

