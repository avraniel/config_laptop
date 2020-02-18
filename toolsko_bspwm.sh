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

sudo pacman -S lib32-fontconfig  --needed --noconfirm
sudo pacman -S lib32-libpng12 --needed --noconfirm
sudo pacman -S lib32-libsm --needed --noconfirm
sudo pacman -S lib32-libxinerama --needed --noconfirm
sudo pacman -S lib32-libxrender --needed --noconfirm
sudo pacman -S lib32-libjpeg6-turbo --needed --noconfirm
sudo pacman -S lib32-libxtst --needed --noconfirm
sudo pacman -S lib32-dbus --needed --noconfirm
sudo pacman -S lib32-freetype2 --needed --noconfirm

# wget https://archive.archlinux.org/packages/l/lib32-freetype2/lib32-freetype2-2.8-2-x86_64.pkg.tar.xz
# sudo pacman -U lib32-freetype2-2.8-2-x86_64.pkg.tar.xz --needed --noconfirm
# rm ./lib32-freetype2-2.8-2-x86_64.pkg.tar.xz

package="teamviewer"

#----------------------------------------------------------------------------------

#checking if application is already installed or else install with aur helpers
if pacman -Qi $package &> /dev/null; then

		echo "################################################################"
		echo "################## "$package" is already installed"
		echo "################################################################"

else

	#checking which helper is installed
	if pacman -Qi yay &> /dev/null; then

		echo "################################################################"
		echo "######### Installing with yay"
		echo "################################################################"
		yay -S --noconfirm $package

	elif pacman -Qi trizen &> /dev/null; then

		echo "################################################################"
		echo "######### Installing with trizen"
		echo "################################################################"
		trizen -S --noconfirm --needed --noedit $package

	elif pacman -Qi yaourt &> /dev/null; then

		echo "################################################################"
		echo "######### Installing with yaourt"
		echo "################################################################"
		yaourt -S --noconfirm $package

	elif pacman -Qi pacaur &> /dev/null; then

		echo "################################################################"
		echo "######### Installing with pacaur"
		echo "################################################################"
		pacaur -S --noconfirm --noedit  $package

	elif pacman -Qi packer &> /dev/null; then

		echo "################################################################"
		echo "######### Installing with packer"
		echo "################################################################"
		packer -S --noconfirm --noedit  $package

	fi

	# Just checking if installation was successful
	if pacman -Qi $package &> /dev/null; then

	echo "################################################################"
	echo "#########  "$package" has been installed"
	echo "################################################################"

	else

	echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
	echo "!!!!!!!!!  "$package" has NOT been installed"
	echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
	echo "Teamviewer needs 32 bits applications"
	echo "Go to /etc/pacman.conf and edit these lines"
	echo "[multilib]"
	echo "Include = /etc/pacman.d/mirrorlist"
	echo "Include this mirrorlist as well"
	sleep 2
	fi

fi

sudo systemctl enable teamviewerd.service
sudo systemctl start teamviewerd.service

sudo pacman -S --noconfirm --needed flameshot
sudo pacman -S --noconfirm --needed vivaldi-ffmpeg-codecs
sudo pacman -S --noconfirm --needed vivaldi-widevine

yay -S zoom --noconfirm --needed

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

#yay -S breeze-obsidian-cursor-theme --noconfirm --needed

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
#cp ~/config_laptop/.config/.zshrc ~/
cp ~/config_laptop/.config/pipes-diagonal ~/.bin
cp ~/config_laptop/dog ~/.bin 
#sudo cp -Rf ~/config_laptop/.config/lightdm.conf /etc/lightdm/lightdm.conf 

#sudo chsh $USER -s /bin/zsh && echo 'Now log out.'

~/.bin/main/700-fun-apps-for-screenshots-v6.sh

#cp ~/.bashrc-latest ~/.bashrc && source ~/.bashrc && sudo cp /etc/skel/.bashrc-latest /etc/skel/.bashrc

#sudo chsh niel -s /bin/zsh

sudo reboot
