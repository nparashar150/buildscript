#!/usr/bin/bash
# Menu Item
main_menu()
{

while :
do
	clear
	echo " "
    echo "-------------------------------------"
    echo "         Welcome to My Script        "
	echo "-------------------------------------"
    echo "       Follow me @nparashar150       "
	echo "-------------------------------------"
	echo "            Main Menu "
	echo "-------------------------------------"
	echo "[1] Set up Build Environment"
	echo "[2] Build Kernel for your Device"
	echo "[3] Low RAM Patch"
	echo "[4] Install softwares on Fresh OS install"
    echo "[5] Install ZSH"
    echo "[6] Run WebD Script"
	echo "[7] Exit"
	echo "====================================="
	echo "[*] Please run this as root if you did'nt"
	echo ""
	echo "Enter your menu choice [1-7]: \c "
	read m_menu
	
	case "$m_menu" in

		1) option_1;;
		2) option_2;;
		3) option_3;;
		4) option_4;;
        5) option_5;;
        6) option_6;;
		7) exit 0;;
		*) echo "\nOpps!!! Please Select Correct Choice";
		   echo "Press ENTER To Continue..." ; read ;;
	esac
done
}

option_1()
{
    echo "You have selected Option 1."
    echo "You wanna setup Build Environment?"
    git clone https://github.com/nparashar150/buildscript.git  ~/Desktop
    cd ~/Desktop/buildscript/scripts
    sudo bash env.sh
}

option_2()
{
	echo "You have selected Option 2."
    echo "Syncing the Tools and Cloning Repositories"
    git clone https://github.com/nparashar150/buildscript.git  ~/Desktop
    cd ~/Desktop/buildscript/scripts
    bash kernel.sh
}

option_3()
{
	echo "You have selected Option 3."
    echo "Patching your system for Low RAM"
	echo "You have selected Option 3."
    echo "Patching your system for Low RAM"
	echo ""
    echo ""
    sudo apt install neofetch -y
    SYSTEM_INFO="$(cat /proc/meminfo | grep MemTotal | cut -b 18)"
    if [ ${SYSTEM_INFO} -lt 15 ]; then
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
    echo "All the things needed are done. Now sync the source."
    echo "Then cherry pick the things needed from there :)"
    echo -e '\e]8;;https://github.com/nparashar150/android_build_soong\aApply Metalava Patch from here if you have 8Gb RAM or less.\e]8;;\a'
    echo "https://github.com/nparashar150/android_build_soong"
    echo "I hope you liked my script."
    echo -e '\e]8;;https://github.com/nparashar150/\aFollow Me for more support.\e]8;;\a'
    echo "Done"
	fi
}

option_4()
{
	echo "You have selected Option 4."
	git clone https://github.com/nparashar150/buildscript.git  ~/Desktop
	cd ~/Desktop/buildscript/scripts
    sudo bash os_setup.sh
}

option_5()
{
	echo "You have selected Option 5."
	git clone https://github.com/nparashar150/buildscript.git  ~/Desktop
	cd ~/Desktop/buildscript/scripts
    sudo bash zsh.sh
}

option_6()
{
	echo "You have selected Option 6."
	git clone https://github.com/nparashar150/buildscript.git  ~/Desktop
	cd ~/Desktop/buildscript/scripts
    sudo bash webd.sh
}

main_menu
