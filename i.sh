#!/bin/sh

# Instalar programas
sudo pacman -S --noconfirm nvidia-dkms nvidia-utils libva libva-nvidia-driver lib32-nvidia-utils
sudo pacman -S --noconfirm bspwm sxhkd zsh kitty vim rofi ranger polybar papirus-icon-theme feh redshift xclip maim orchis-theme picom ttf-font-awesome

# Mover .config
rm -r ~/.config
mv -f .config ~/

# Mover arquivos .zshrc,.xinitrc, scripts ...  para ~/
mv -f .zshrc .xinitrc .zprofile wallpapers scripts .gtkrc-2.0 ~/

# Dar permissões
chmod -R 755 ~/.config/bspwm/bspwmrc
chmod -R 644 ~/.config/sxhkd/sxhkdrc
chmod -R 755 ~/.config/polybar/launch.sh
chmod -R 755 ~/scripts/changewp.sh

#mouse
#echo -e 'Section "InputClass"\n     Identifier "My Mouse"\n     MatchIsPointer "yes"\n     Option "AccelerationProfile" "-1"\n     Option "AccelerationScheme" "none"\n     Option "AccelSpeed" "-1"\nEndSection' | sudo tee /etc/X11/xorg.conf.d/50-mouse-acceleration.conf

#trocar o shell para zsh
chsh -s /bin/zsh

#AUR Helper
cd
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd

#AUR programas
yay -S --noconfirm papirus-folders

#icones, temas e fontes
papirus-folders -C black --theme Papirus

rm -rf ~/bspwm
rm -rf ~/yay
