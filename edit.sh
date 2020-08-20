#!/bin/bash


echo ""
echo ""
echo ""
echo ":::       ::: :::::::::: :::        ::::::::   ::::::::  ::::    ::::  :::::::::: "
echo ":+:       :+: :+:        :+:       :+:    :+: :+:    :+: +:+:+: :+:+:+ :+:        "
echo "+:+       +:+ +:+        +:+       +:+        +:+    +:+ +:+ +:+:+ +:+ +:+        "
echo "+#+  +:+  +#+ +#++:++#   +#+       +#+        +#+    +:+ +#+  +:+  +#+ +#++:++#   "
echo "+#+ +#+#+ +#+ +#+        +#+       +#+        +#+    +#+ +#+       +#+ +#+        "
echo " #+#+# #+#+#  #+#        #+#       #+#    #+# #+#    #+# #+#       #+# #+#        "
echo "  ###   ###   ########## ########## ########   ########  ###       ### ########## "
echo ""
echo ""
echo ""
echo "Do you want to setup Build Environment?"
echo "Answer 1=yes and 2=no"
read Answer
if [ $Answer = 1 ]
then 
echo "Setting Up the Enviroment"
sudo apt-get install git-core gnupg flex bison build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z1-dev libgl1-mesa-dev libxml2-utils xsltproc unzip fontconfig
echo "Build Environment has been set up for you !"
fi
echo "Do you want to sync the ROM?"
echo "Answer 1=yes and 2=no"
read Answer2
if [ $Answer2 = 1 ]
then 
mkdir ~/bin
PATH=~/bin:$PATH
curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
echo "Please tell the path where you want to clone the repo"
read repository
mkdir $repository
cd $repository
echo "Please paste repo init link without 'repo init' "
read init 
repo init $init
repo sync 
echo "Done the repo sync"
fi
echo "Do you want to clone your stuff for your device?"
echo "Answer 1=yes and 2=no"
read Answer3
if [ $Answer3 = 1 ]
then 
echo "Give me your Device Name example 'tissot' "
read devicename
echo "Your device is $devicename "
echo "Give me your Device Brandname example 'oneplus' "
read devicebrand
echo "Your device brand is $devicebrand"
echo ""
echo ""
echo ""
echo "Please tell the path where you want to clone the repo"
read repository
cd $repository
echo "Now give me the links of the Device Tree"
read devicetree
git clone $devicetree /device/$devicebrand/$devicename/
echo "Now give me the links of the Device Tree Common"
read devicetreecommon
cd $repository
git clone $devicetreecommon /device/$devicebrand/$devicename/
echo "Done cloning the device specific stuff"
fi
