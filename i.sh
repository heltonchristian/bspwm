#!/bin/sh

# Função para instalar no Arch Linux
install_arch() {
    # Instalar programas
    sudo pacman -S --noconfirm nvidia-dkms nvidia-utils libva libva-nvidia-driver lib32-nvidia-utils xdo xorg-xrandr
    sudo pacman -S --noconfirm bspwm sxhkd zsh kitty picom neovim rofi nemo nemo-fileroller polybar papirus-icon-theme feh redshift xclip maim orchis-theme picom ttf-nerd-fonts-symbols ttf-fira-code remmina

    # Mover .config
    rm -r ~/.config
    mv -f .config ~/

    # Mover arquivos .zshrc,.xinitrc, scripts ...  para ~/
    mv -f .zshrc .xinitrc .zprofile wallpapers scripts ~/

    # Dar permissões
    chmod -R 755 ~/.config/bspwm/bspwmrc
    chmod -R 644 ~/.config/sxhkd/sxhkdrc
    chmod -R 755 ~/.config/polybar/launch.sh
    chmod -R 755 ~/scripts/changewp.sh
    chmod -R 755 ~/scripts/changeAudio.sh

    # Trocar o shell para zsh
    chsh -s /bin/zsh

    # AUR Helper
    cd
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd

    # AUR programas
    yay -S --removemake --noconfirm papirus-folders librewolf-bin

    # Icones, temas e fontes
    papirus-folders -C black --theme Papirus

    rm -rf ~/bspwm
    rm -rf ~/yay
}

# Função para instalar no Void Linux
install_void() {
    # Adicionar repositórios
    sudo xbps-install -Suy
    sudo xbps-install -Suy void-repo-nonfree void-repo-multilib void-repo-multilib-nonfree

    # Instalar programas
    sudo xbps-install -Suy xorg-server xinit xrandr nvidia-settings linux-headers dkms nvidia-dkms kitty picom bspwm sxhkd zsh nemo neovim nwg-look
    # Mover .config
    rm -r ~/.config
    mv -f .config ~/

    # Mover arquivos .zshrc,.xinitrc, scripts ...  para ~/
    mv -f .zshrc .xinitrc .zprofile wallpapers scripts ~/

    # Dar permissões
    chmod -R 755 ~/.config/bspwm/bspwmrc
    chmod -R 644 ~/.config/sxhkd/sxhkdrc
    chmod -R 755 ~/.config/polybar/launch.sh
    chmod -R 755 ~/scripts/changewp.sh
    chmod -R 755 ~/scripts/changeAudio.sh

    # Trocar o shell para zsh
    chsh -s /bin/zsh

    rm -rf ~/bspwm
}

# Verificar o sistema operacional
if [ -f /etc/os-release ]; then
    . /etc/os-release
    if [ "$ID" = "arch" ]; then
        echo "Detectado Arch Linux. Instalando..."
        install_arch
    elif [ "$ID" = "void" ]; then
        echo "Detectado Void Linux. Instalando..."
        install_void
    else
        echo "Sistema operacional não suportado."
        exit 1
    fi
else
    echo "Não foi possível detectar o sistema operacional."
    exit 1
fi
