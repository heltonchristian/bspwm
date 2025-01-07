#!/bin/sh

# Instalar programas
sudo pacman -S --noconfirm git go bspwm sxhkd zsh kitty vim rofi nemo htop polybar papirus-icon-theme ttf-nerd-fonts-symbols ttf-fira-code ttf-font-awesome feh redshift neofetch xclip maim pavucontrol firefox chromium libreoffice-fresh libreoffice-fresh-pt-br libreoffice-fresh-pt-br orchis-theme

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
papirus-folders -C white --theme Papirus

rm -rf ~/bspwm
rm -rf ~/yay

### Autologin ###
#sudo mkdir -p /etc/systemd/system/getty@tty1.service.d
#echo "[Service]
#ExecStart=
#ExecStart=-/sbin/agetty -o '-p -f -- \\u' --noclear --autologin ly2 - \$TERM" | sudo tee /etc/systemd/system/getty@tty1.service.d/autologin.conf > /dev/null
