#!/bin/bash
echo ""
echo ":::       ::: :::::::::: :::        ::::::::   ::::::::  ::::    ::::  :::::::::: "
echo ":+:       :+: :+:        :+:       :+:    :+: :+:    :+: +:+:+: :+:+:+ :+:        "
echo "+:+       +:+ +:+        +:+       +:+        +:+    +:+ +:+ +:+:+ +:+ +:+        "
echo "+#+  +:+  +#+ +#++:++#   +#+       +#+        +#+    +:+ +#+  +:+  +#+ +#++:++#   "
echo "+#+ +#+#+ +#+ +#+        +#+       +#+        +#+    +#+ +#+       +#+ +#+        "
echo " #+#+# #+#+#  #+#        #+#       #+#    #+# #+#    #+# #+#       #+# #+#        "
echo "  ###   ###   ########## ########## ########   ########  ###       ### ########## "
echo ""
echo "Do you want to setup Build Environment?"
echo "Answer 1=yes and 2=no"
read Answer
if [ $Answer = 1 ]
then 
git clone https://github.com/nparashar150/buildscript.git
cd buildscript/scripts
sudo bash env.sh
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
echo "Tell the path where you want to clone the repo"
read repositor
echo "Now give me the links of the Device Tree"
read devicetree
cd $repositor/device/
mkdir $devicebrand 
mkdir $devicebrand/$devicename/
git clone $devicetree /device/$devicebrand/$devicename/
echo "Now give me the links of the Device Tree Common"
read devicetreecmmn
cd $repositor/device/$devicebrand/
git clone $devicetreecmmn /device/$devicebrand/
echo "Done cloning the device specific stuff"
echo ""
echo ""
echo "Give me the Kernel link"
read kernel
cd $repositor/kernel/
mkdir $devicebrand
mkdir $devicebrand/$devicename/
git clone $kernel /kernel/$devicebrand/$devicename/
echo "Now give me the Kernel Common link"
read kernelcmmn
cd $repositor/kernel/$devicebrand/
git clone $kernelcmmn /kernel/$devicebrand/
echo "Done cloning the kernel specific stuff"
echo ""
echo ""
echo "Give me the link of the Vendor"
read vendor
cd $repositor/vendor/
mkdir $devicebrand/
git clone $vendor /vendor/$devicebrand/
echo "Done cloning the vendor specific stuff"
fi
echo "Do you want to apply patches for smooth build?"
echo "1. CCache"
echo "2. ZRam"
echo "3. Metalava"
echo "4. All of 'em "
echo "5. None of 'em "
echo "*. Metalava patch is till Android 10 only. For Android 11 check My Github."
echo -e '\e]8;;https://github.com/nparashar150/android_build_soong\aApply Metalava Patch for Android R.\e]8;;\a'
read choice
if [ $choice = 1 ]
then 
prebuilts/misc/linux-x86/ccache/ccache -M 50G
ccache -M 50G
export USE_CCACHE=1
export CCACHE_EXEC=$ 
fi
if [ $choice = 2 ]
then 
echo ""
echo ""
echo "Add a # carefully at swap and save and exit"
echo ""
echo "Add a # carefully at swap and save and exit"
sudo apt install zram-config
echo "Add a # carefully at swap and save and exit"
sudo nano /etc/fstab
cat /proc/swaps
nano ~/.bashrc
source ~/.bashrc
fi
if [ $choice = 3 ]
then 
echo "Applying Metalava Patch"
echo "Tell your Repo Path"
read reposito
cd $reposito/build/soong/
git fetch https://github.com/Magma-WIP/build_soong ten-metalava
git cherry-pick bcd1bb529132905cf55e72f5a2a6ba19a99f60ac^..dc3365fbde3b2a5773e655f690bb073967100795 
fi
if [ $choice = 4 ]
then 
prebuilts/misc/linux-x86/ccache/ccache -M 50G
ccache -M 50G
export USE_CCACHE=1
export CCACHE_EXEC=$ 
echo ""
echo ""
echo "Add a # carefully at swap and save and exit"
echo ""
echo "Add a # carefully at swap and save and exit"
sudo apt install zram-config
echo "Add a # carefully at swap and save and exit"
sudo nano /etc/fstab
cat /proc/swaps
nano ~/.bashrc
source ~/.bashrc
echo "Applying Metalava Patch"
echo "Tell your Repo Path"
read reposito
cd $reposito/build/soong/
git fetch https://github.com/Magma-WIP/build_soong ten-metalava
git cherry-pick bcd1bb529132905cf55e72f5a2a6ba19a99f60ac^..dc3365fbde3b2a5773e655f690bb073967100795 
fi
echo "Done !"
echo ""
echo "::::::::::: :::    :::     :::     ::::    ::: :::    :::      :::   :::  ::::::::  :::    :::      "
echo "    :+:     :+:    :+:   :+: :+:   :+:+:   :+: :+:   :+:       :+:   :+: :+:    :+: :+:    :+:      "
echo "    +:+     +:+    +:+  +:+   +:+  :+:+:+  +:+ +:+  +:+         +:+ +:+  +:+    +:+ +:+    +:+      "
echo "    +#+     +#++:++#++ +#++:++#++: +#+ +:+ +#+ +#++:++           +#++:   +#+    +:+ +#+    +:+      "
echo "    +#+     +#+    +#+ +#+     +#+ +#+  +#+#+# +#+  +#+           +#+    +#+    +#+ +#+    +#+      "
echo "    #+#     #+#    #+# #+#     #+# #+#   #+#+# #+#   #+#          #+#    #+#    #+# #+#    #+#      "
echo "    ###     ###    ### ###     ### ###    #### ###    ###         ###     ########   ########       "
echo ""
echo "Exiting in 5 seconds"
echo -ne '######                    (33%)\r'
sleep 1
echo -ne '#############             (66%)\r'
sleep 3
echo -ne '#######################  (100%)\r'
echo -ne '\n'