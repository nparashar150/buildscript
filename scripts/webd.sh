#!/usr/bin/bash
# Menu Item
main_menu()
{

while :
do
	clear
	echo " "
    echo "-------------------------------------"
    echo "         Welcome to My WebD Script        "
	echo "-------------------------------------"
    echo "       Follow me @nparashar150       "
	echo "-------------------------------------"
	echo "            Main Menu                "
	echo "-------------------------------------"
	echo "[1] Install npm nodejs react"
	echo "[2] Create Quick React App"
    echo "[3] Create Quick Node Project"
	echo "[4] Exit"
	echo "====================================="
	echo "[*] Please run this as root if you did'nt"
	echo ""
	echo "Enter your menu choice [1-4]: \c "
	read m_menu
	
	case "$m_menu" in

		1) option_1;;
		2) option_2;;
		3) option_3;;
		4) exit 0;;
		*) echo "\nOpps!!! Please Select Correct Choice";
		   echo "Press ENTER To Continue..." ; read ;;
	esac
done
}

option_1()
{
    echo "Installing node npm for you."
    curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
    sudo apt-get install -y nodejs
    echo -e "Node and npm are installed successfully.\nThe current version installed are \nnpm : v$(npm --version | cut -b 1)\nnode: v$(node --version | cut -b 2,3)"
    echo ""
    echo ""
    echo ""
    echo ""
    echo ""
    echo "Do you want to install BootStrap and jQuery to npm ?"
    read inputNpm
    if [[ $inputNpm == "yes" || $inputNpm == "Yes" || $inputNpm == 1 || $inputNpm == "y" || $inputNpm == "Y" ]]; then
    	echo -e "Installing jQuery and Bootstrap globally."
        sudo npm i -g jquery bootstrap
    else 
        echo "Skipping jQuery and BootStrap installation."
    fi
    echo ""
    echo ""
    echo ""
    echo ""
    echo ""
    echo "Do you want to install React ?"
    read inputReact
    if [[ $inputReact == "yes" || $inputReact == "Yes" || $inputReact == 1 || $inputReact == "y" || $inputReact == "Y" ]]; then
    	echo "Installing React for you."
        sudo npm -g install create-react-app
        create-react-app --version
    else 
        echo "Skipping React installation."
    fi
    echo "Done."
}

option_2()
{
    echo -e "Creating React App for you.\nEnter React App name"
    read appName
    dirPath=~/Desktop/React/$appName
    mkdir $dirPath
    cd $dirPath
    create-react-app $appName
    cd $appName
    npm start
}

option_3()
{
	echo "Creating a quick project for you.\nEnter the path for project to be created."
    cd ~/Desktop
    dir=~/Desktop/Project   
    if [ -d "$dir" ] ; then
        i=1
        if [ -d "$dir-$i" ]; then
            while [ -d "$dir-$i" ]; do
                let i++
            done
            path=~/Desktop/Project-$i
            mkdir ~/Desktop/Project-$i
        else 
        path=~/Desktop/Project-1
        mkdir ~/Desktop/Project-1
        fi
    else 
    path=$dir
    mkdir ~/Desktop/Project
    fi
    cd $path
    npm init -y
    echo "" >> index.html
    echo "" >> index.css
    echo "" >> index.js
    npm i bootstrap jquery
    echo "Project is at $path"
    echo "Installed BootStrap and jQUery for you."
    echo "Done."
}

main_menu
