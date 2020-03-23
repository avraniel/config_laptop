#!/bin/bash
set -e
##################################################################################################################
# Author	:	Raniel Laguna
# Website	:	https://www.arcolinux.info
# Website	:	https://www.arcolinux.com
# Website	:	https://www.arcolinuxd.com
# Website	:	https://www.arcolinuxb.com
# Website	:	https://www.arcolinuxiso.com
# Website	:	https://www.arcolinuxforum.com
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################

#dependencies

sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist

yay -Syu --noconfirm



sudo pacman -S --noconfirm --needed flameshot
sudo pacman -S --noconfirm --needed vivaldi-ffmpeg-codecs
sudo pacman -S --noconfirm --needed vivaldi-widevine

yay -S zoom --noconfirm --needed
sudo pacman -S arcolinux-teamviewer --noconfirm --needed
sudo pacman -S discord --noconfirm --needed
sudo pacman -S telegram-desktop --noconfirm --needed
yay -S blockify-git --noconfirm --needed
yay -S qtwebflix-git --noconfirm --needed
yay -S polybar --noconfirm --needed
yay -S dropbox --noconfirm --needed
yay -S papirus-icon-theme --noconfirm --needed
yay -S arc-icon-theme --noconfirm --needed
yay -S adapta-gtk-theme --noconfirm --needed
yay -S oh-my-bash-git --noconfirm --needed
yay -S oh-my-zsh-git --noconfirm --needed

yay -S breeze-obsidian-cursor-theme --noconfirm --needed

yay -S faba-icon-theme --noconfirm --needed
yay -S halo-icons-git --noconfirm --needed
yay -S moka-icon-theme --noconfirm --needed
yay -S paper-icon-theme --noconfirm --needed
yay -S zafiro-icon-theme --noconfirm --needed
yay -S xcursor-simpleandsoft --noconfirm --needed
yay -S popcorntime-bin --noconfirm --needed
#yay -S nvidia-340xx-lts --needed

cp -Rf ~/config_laptop/.config/{termite,neofetch,polybar,openbox,variety,ranger} ~/.config
cp ~/config_laptop/.config/.bashrc-personal ~/.bashrc-personal
cp -Rf ~/config_laptop/.bashrc ~/.bashrc
cp ~/config_laptop/.config/.zshrc ~/
cp -RF ~/config_laptop/.config/.cache ~/.cache
cp -Rf ~/config_laptop/.config/rofi ~/.config/rofi
cp ~/config_laptop/.config/pipes-diagonal ~/.bin
cp -Rf ~/config_laptop/.config/autostart ~/.config/openbox
sudo cp -Rf ~/config_laptop/.config/lightdm.conf /etc/lightdm/lightdm.conf 


sudo reboot
