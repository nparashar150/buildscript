#!/bin/bash
echo ""
echo ""
echo "Welcome to the script."
echo "Installing neccessary stuff for you."
sudo apt-get install --ignore-missing -y vlc adb google-chrome-stable gnome-tweaks gnome-tweak-tool htop psensor telegram-desktop gimp tlp tlp-rdw grub-customizer repo android-tools-adb android-tools-fastboot lolcat toilet android-sdk-platform-tools-common speedtest-cli snap rsync python kazam libgtk-3-0 gtk-3-examples libgtk-3-dev inkscape brave-browser codeblocks codeblocks-common codeblocks-contrib codeblocks-dev dolphin curl acpi
sudo tlp start
sudo apt install git-all -y
echo "Put your github username"
read username 
git config --global user.name "$username"
echo "Put your github useremail"
read useremail
git config --global user.email "$useremail"
git config --global color.ui true
git config --global core.editor emacs
echo "Github username is: `git config user.name`"
echo "Github useremail is: `git config user.email`"
echo "Checking & Updating System."
sudo apt update
sudo apt upgrade
sudo apt install lsb-core -y
echo "The OS installed is `lsb_release -d | cut -d ':' -f 2 | sed -e 's/^[[:space:]]*//'`."
OS_VERSION="$(lsb_release -d | cut -d ':' -f 2 | sed -e 's/^[[:space:]]*//')"
if [[ ${LSB_RELEASE} =~ "Ubuntu" ]]; then
sudo apt install ubuntu-restricted-extras -y
fi
echo "Done"
echo "Exiting in 5 seconds"
echo -ne '######                    (33%)\r'
sleep 1
echo -ne '#############             (66%)\r'
sleep 3
echo -ne '#######################  (100%)\r'
echo -ne '\n'
