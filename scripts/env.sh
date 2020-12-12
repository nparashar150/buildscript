#!/bin/bash
if ! [ $(id -u) = 0 ]; then
   echo "The script need to be run as root." >&2
fi
if [ $SUDO_USER ]; then
echo ""
echo ""
echo ""
echo "                                                                                                                             "
echo "#  #  # ###### #       ####   ####  #    # ######    #####  ####     #    # #   #     ####   ####  #####  # #####  #####     "
echo "#  #  # #      #      #    # #    # ##  ## #           #   #    #    ##  ##  # #     #      #    # #    # # #    #   #       "
echo "#  #  # #####  #      #      #    # # ## # #####       #   #    #    # ## #   #       ####  #      #    # # #    #   #       "
echo "#  #  # #      #      #      #    # #    # #           #   #    #    #    #   #           # #      #####  # #####    #       "
echo "#  #  # #      #      #    # #    # #    # #           #   #    #    #    #   #      #    # #    # #   #  # #        #       "
echo " ## ##  ###### ######  ####   ####  #    # ######      #    ####     #    #   #       ####   ####  #    # # #        #    ### "
echo "                                                                                                                             "
echo ""
sudo apt install lsb-core -y
echo "The OS installed is `lsb_release -d | cut -d ':' -f 2 | sed -e 's/^[[:space:]]*//'`."
OS_VERSION="$(lsb_release -d | cut -d ':' -f 2 | sed -e 's/^[[:space:]]*//')"
if [[ ${OS_VERSION} =~ "Mint 20" || ${LSB_RELEASE} =~ "Ubuntu 20" ]]; then
sudo apt-get install git-core gnupg flex bison build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z1-dev libgl1-mesa-dev libxml2-utils xsltproc unzip fontconfig -y
elif [[ ${OS_VERSION} =~ "Mint 18" || ${LSB_RELEASE} =~ "Ubuntu 18" ]]; then
sudo apt-get install git-core gnupg flex bison build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z1-dev libgl1-mesa-dev libxml2-utils xsltproc unzip fontconfig -y
elif [[ ${OS_VERSION} =~ "Mint 16" || $(OS_VERSION) =~ "Ubuntu 14" ]]; then
sudo apt-get install git-core gnupg flex bison gperf build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev libgl1-mesa-dev libxml2-utils xsltproc unzip -y
elif [[ ${OS_VERSION} =~ "Mint 14" || $(OS_VERSION) =~ "Ubuntu 12" ]]; then 
sudo apt-get install git gnupg flex bison gperf build-essential zip curl libc6-dev libncurses5-dev:i386 x11proto-core-dev libx11-dev:i386 libreadline6-dev:i386 libgl1-mesa-glx:i386 libgl1-mesa-dev g++-multilib mingw32 tofrodos python-markdown libxml2-utils xsltproc zlib1g-dev:i386 -y
sudo ln -s /usr/lib/i386-linux-gnu/mesa/libGL.so.1 /usr/lib/i386-linux-gnu/libGL.so
elif [[ ${OS_VERSION} =~ "Mint 12" || $(OS_VERSION) =~ "Ubuntu 10" ]]; then
sudo apt-get install git gnupg flex bison gperf build-essential zip curl zlib1g-dev libc6-dev lib32ncurses5-dev ia32-libs x11proto-core-dev libx11-dev lib32readline5-dev lib32z-dev libgl1-mesa-dev g++-multilib mingw32 tofrodos python-markdown libxml2-utils xsltproc -y
sudo ln -s /usr/lib32/mesa/libGL.so.1 /usr/lib32/mesa/libGL.so
sudo apt-get install libx11-dev:i386
elif [[ ${OS_VERSION} -ne "Mint" || ${LSB_RELEASE} -ne "Ubuntu" ]]; then
echo "You have installed OS other than Linux Mint and Ubuntu."
sudo apt-get install git-core gnupg flex bison build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z1-dev libgl1-mesa-dev libxml2-utils xsltproc unzip fontconfig -y
fi
echo ""
echo ""
echo "Installing Fastboot."
sudo apt install fastboot -y
echo ""
echo ""
JAVA_VERSION="$(java --version | head -n 1)"
if [[ ${JAVA_VERSION} =~ "15" ]]; then 
echo "You are on latest Java Version."
elif [[ ${JAVA_VERSION} =~ "14" ]]; then
echo "Installing latest Java Version."
sudo add-apt-repository ppa:linuxuprising/java
sudo apt update
sudo apt install oracle-java15-installer
sudo apt install oracle-java15-set-default
echo "The Version is `java --version | head -n 1`."
fi
echo ""
echo ""
sudo apt install neofetch -y
SYSTEM_INFO="$(cat /proc/meminfo | grep MemTotal)"
if [[ ${SYSTEM_INFO} > "$9000000" ]]; then
echo ""
echo ""
echo "Installing ZRAM because you have Low RAM for building ROM."
sudo apt install zram-config
echo ""
rm -rf /etc/modules-load.d/zram.conf
rm -rf /etc/modprobe.d/zram.conf
rm -rf /etc/udev/rules.d/99-zram.rules
rm -rf /etc/systemd/system/zram.service
echo 'zram' >/etc/modules-load.d/zram.conf
echo 'options zram num_devices=1' >/etc/modprobe.d/zram.conf
echo 'KERNEL=="zram0", ATTR{disksize}="8192M",TAG+="systemd"' >/etc/udev/rules.d/99-zram.rules
printf '%s\n' '[Unit]' 'Description=Swap with zram' 'After=multi-user.target' '' '[Service]' 'Type=oneshot' 'RemainAfterExit=true' 'ExecStartPre=/sbin/mkswap /dev/zram0' 'ExecStart=/sbin/swapon /dev/zram0' 'ExecStop=/sbin/swapoff /dev/zram0' '' '[Install]' 'WantedBy=multi-user.target' >/etc/systemd/system/zram.service
systemctl enable zram

fi
echo "Installing repo"
mkdir ~/bin
PATH=~/bin:$PATH
curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
echo ""
echo ""
echo ""
echo ""
echo "All the things needed are done. Now sync the source."
echo ""
echo -e '\e]8;;https://github.com/nparashar150/android_build_soong\aApply Metalava Patch from here if you have 8Gb RAM or less.\e]8;;\a'
echo "I hope you liked my script."
echo -e '\e]8;;https://github.com/nparashar150/\aFollow Me for more support.\e]8;;\a'
fi
echo "Done"
echo "Exiting in 5 seconds"
echo -ne '######                    (33%)\r'
sleep 1
echo -ne '#############             (66%)\r'
sleep 3
echo -ne '#######################  (100%)\r'
echo -ne '\n'