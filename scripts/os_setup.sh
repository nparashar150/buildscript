#!/bin/bash
echo ""
echo ""
echo "Welcome to the script."
echo "Installing neccessary stuff for you."
sudo apt install vlc google-chrome-stable gnome-tweaks gnome-tweak-tool freedownloadmanager htop psensor telegram-desktop gimp spotify-client tlp tlp-rdw grub-customizer
sudo tlp start
sudo dnf install git-all
echo "Put your github username"
read username 
git config --global user.name "$username"
echo "Put your github useremail"
read useremail
git config --global user.email "$useremail"
git config --global color.ui true
git config --global core.editor emacs
sudo apt update
sudo apt upgrade
sudo apt install lsb-core -y
echo "The OS installed is `lsb_release -d | cut -d ':' -f 2 | sed -e 's/^[[:space:]]*//'`."
OS_VERSION="$(lsb_release -d | cut -d ':' -f 2 | sed -e 's/^[[:space:]]*//')"
if [[ ${LSB_RELEASE} =~ "Ubuntu" ]]; then
sudo apt install ubuntu-restricted-extras
fi
echo "Done"
echo "Exiting in 5 seconds"
echo -ne '######                    (33%)\r'
sleep 1
echo -ne '#############             (66%)\r'
sleep 3
echo -ne '#######################  (100%)\r'
echo -ne '\n'
