#!/bin/sh

# Instalar programas
sudo pacman -S --noconfirm nvidia-dkms nvidia-utils libva libva-nvidia-driver lib32-nvidia-utils
sudo pacman -S --noconfirm bspwm sxhkd zsh kitty picom vim rofi nemo nemo-fileroller polybar papirus-icon-theme feh redshift xclip maim orchis-theme picom ttf-nerd-fonts-symbols remmina

# Mover .config
rm -r ~/.config
mv -f .config ~/

# Mover arquivos .zshrc,.xinitrc, scripts ...  para ~/
mv -f .zshrc .xinitrc .zprofile .vimrc wallpapers scripts ~/

# Dar permissões
chmod -R 755 ~/.config/bspwm/bspwmrc
chmod -R 644 ~/.config/sxhkd/sxhkdrc
chmod -R 755 ~/.config/polybar/launch.sh
chmod -R 755 ~/scripts/changewp.sh
chmod -R 755 ~/scripts/changeAudio.sh

#trocar o shell para zsh
chsh -s /bin/zsh

#AUR Helper
cd
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd

#AUR programas
yay -S --removemake --noconfirm papirus-folders librewolf-bin

#icones, temas e fontes
papirus-folders -C black --theme Papirus

rm -rf ~/bspwm
rm -rf ~/yay
