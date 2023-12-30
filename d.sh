#!/bin/bash

sudo apt-get update
sudo apt-get install -y git golang-go bspwm sxhkd zsh kitty vim rofi nemo btop polybar papirus-icon-theme fonts-nerd-fonts fonts-firacode feh redshift neofetch ncdu xclip maim pulsemixer firefox chromium picom 7zip

mkdir -p ~/.config
cp -r .config/* ~/.config/

cp .zshrc .xinitrc .zprofile wallpapers scripts .gtkrc-2.0 .ticker.yaml ~/

chmod -R 755 ~/.config/bspwm
chmod -R 755 ~/.config/sxhkd
chmod -R 755 ~/.config/polybar
chmod 755 ~/scripts/changewp.sh
chmod 755 ~/scripts/changeKL.sh

chsh -s /bin/zsh

git clone https://github.com/PapirusDevelopmentTeam/papirus-folders.git
cd papirus-folders
sudo ./install.sh
cd ..
rm -rf papirus-folders

git clone https://github.com/sainnhe/equilux-theme.git
cd equilux-theme
sudo ./install.sh
cd ..
rm -rf equilux-theme
