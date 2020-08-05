#!/bin/bash

#This is the Build Scipt which will help you make your Custom Rom builds in more convenient way... !!
echo ""
echo "Sit freely you need to relax when this is going on"
echo "Please Install Tools First"
echo "Did you configured the build environment ?"
echo "yes or no"
read environment
if [ $environment = yes ]
then
echo ""
echo ""
echo "Select an Option ;)"
echo ""
echo "1. Sync Device Tree + Sync Device Tree Common + Sync Kernel + Sync Vendor + Apply Patches + Build"
echo ""
echo "2. Sync Device Tree + Sync Device Tree Common + Sync Kernel + Sync Vendor + Build"
echo ""
echo "3. Build Clean"
echo ""
echo "4. Sync Device Tree + Sync Device Tree Common + Sync Kernel + Sync Vendor"
echo ""
echo "5. Apply Patches"
echo ""
echo "6. Dirty Build"
echo ""
echo "7. Drity Build with api"
echo ""
echo ""
echo""
read Option 

if [ $Option = 1 ]
then 

#Initialising and syncing the Repository

mkdir ~/bin
PATH=~/bin:$PATH
curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
echo "Where do you want to clone the repository:"
read repository
mkdir $repository
cd $repository
repo init -u git://github.com/Colt-Enigma/platform_manifest.git -b c10
repo sync --no-tags --no-clone-bundle --force-sync -c 
echo ""
ecmka cleanho ""
echo "Repository Synced at the path you specified ;)"

#Adding the Device Tree in the build
echo ""
echo "Syncing Device Tree from git ;)"
git clone -b colt https://github.com/nparashar150/android_device_xiaomi_tissot.git $repository/device/xiaomi/tissot/
echo "Device Tree Added in the repository ;)"

#Adding Device Tree Common
echo ""
echo "Syncing Device Tree Common from git ;)"
git clone https://github.com/nparashar150/android_device_xiaomi_msm8953-common.git $repository/device/xiaomi/msm8953-common/
echo "Device Tree Common Added in the repository ;)"
echo ""
#Adding Kernel to the Build

echo ""
echo ""
echo ""
echo "Adding kernel to the Build ;)"
git clone https://github.com/nparashar150/kernel_xiaomi_tissot.git $repository/kernel/xiaomi/tissot/
git clone https://github.com/MASTERGUY/kernel_xiaomi_msm8953.git $repository/kernel/xiaomi/msm8953/
echo ""
echo "Competed Kernel Syncing and Configuration ;)"

#Syncing Vendor for Building
echo ""
echo "Syncing and Configuring Vendor for Build ;)"
git clone https://github.com/nparashar150/vendor_xiaomi_tissot.git $repository/vendor/xiaomi/tissot/
echo "Added and Configured Vendor for the Build ;)"

#Applying Patches
echo ""
echo "Applying Patches wait you need to be here now for adding a # at swap"
#zram && ccache config
sudo apt install zram-config
echo "Add a # carefully at swap and save and exit"
sudo nano /etc/fstab
cat /proc/swaps
nano ~/.bashrc
source ~/.bashrc
prebuilts/misc/linux-x86/ccache/ccache -M 50G
ccache -M 50G
export USE_CCACHE=1
export CCACHE_EXEC=$ 
echo "CCache and ZRAM configured"
#Applying Metalava Patch
echo "Applying Metalava Patch"
cd $repository/build/soong/
git fetch https://github.com/Magma-WIP/build_soong ten-metalava
git cherry-pick bcd1bb529132905cf55e72f5a2a6ba19a99f60ac^..dc3365fbde3b2a5773e655f690bb073967100795 
echo "Added Metalava Patch"

#Building ColtOS

echo "Building Colt OS"
cd $repository
. build/envsetup.sh && lunch colt_tissot-userdebug
mka clean
mka api-stubs-docs
mka hiddenapi-lists-docs
mka system-api-stubs-docs
mka test-api-stubs-docs
mka colt
echo "Hope my script worked for you ;)"
fi

if [ $Option = 2 ]
then 
#Initialising and syncing the Repository

mkdir ~/bin
PATH=~/bin:$PATH
curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
echo "Where do you want to clone the repository:"
read repository
mkdir $repository
cd $repository
repo init -u git://github.com/Colt-Enigma/platform_manifest.git -b c10
repo sync --no-tags --no-clone-bundle --force-sync -c 
echo ""
echo ""
echo "Repository Synced at the path you specified ;)"

#Adding the Device Tree in the build
echo ""
echo "Syncing Device Tree from git ;)"
git clone -b colt https://github.com/nparashar150/android_device_xiaomi_tissot.git $repository/device/xiaomi/tissot/
echo "Device Tree Added in the repository ;)"

#Adding Device Tree Common
echo ""
echo "Syncing Device Tree Common from git ;)"
git clone https://github.com/nparashar150/android_device_xiaomi_msm8953-common.git $repository/device/xiaomi/msm8953-common/
echo "Device Tree Common Added in the repository ;)"
echo ""
#Adding Kernel to the Build

echo ""
echo ""
echo ""
echo "Adding kernel to the Build ;)"
git clone https://github.com/nparashar150/kernel_xiaomi_tissot.git $repository/kernel/xiaomi/tissot/
git clone https://github.com/MASTERGUY/kernel_xiaomi_msm8953.git $repository/kernel/xiaomi/msm8953/
echo ""
echo "Competed Kernel Syncing and Configuration ;)"

#Syncing Vendor for Building
echo ""
echo "Syncing and Configuring Vendor for Build ;)"
git clone https://github.com/nparashar150/vendor_xiaomi_tissot.git $repository/vendor/xiaomi/tissot/
echo "Added and Configured Vendor for the Build ;)"

#Building ColtOS

echo "Building Colt OS"
cd $repository
. build/envsetup.sh && lunch colt_tissot-userdebug
mka clean
mka api-stubs-docs
mka hiddenapi-lists-docs
mka system-api-stubs-docs
mka test-api-stubs-docs
mka colt
echo "Hope my script worked for you ;)"
fi

if [ $Option = 3 ]
then
#Building ColtOS
echo "Please tell where is your Repository Synced ;)"
echo "Building Colt OS"
read repository
cd $repository
. build/envsetup.sh
lunch colt_tissot-userdebug
mka clean
mka api-stubs-docs
mka hiddenapi-lists-docs
mka system-api-stubs-docs
mka test-api-stubs-docs
mka colt
echo "Hope my script worked for you ;)"
fi

if [ $Option = 4 ]
then 
#Initialising and syncing the Repository

mkdir ~/bin
PATH=~/bin:$PATH
curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
echo "Where do you want to clone the repository:"
read repository
mkdir $repository
cd $repository
repo init -u git://github.com/Colt-Enigma/platform_manifest.git -b c10
repo sync --no-tags --no-clone-bundle --force-sync -c 
echo ""
echo ""
echo "Repository Synced at the path you specified ;)"

#Adding the Device Tree in the build
echo ""
echo "Syncing Device Tree from git ;)"
git clone -b colt https://github.com/nparashar150/android_device_xiaomi_tissot.git $repository/device/xiaomi/tissot/
echo "Device Tree Added in the repository ;)"

#Adding Device Tree Common
echo ""
echo "Syncing Device Tree Common from git ;)"
git clone https://github.com/nparashar150/android_device_xiaomi_msm8953-common.git $repository/device/xiaomi/msm8953-common/
echo "Device Tree Common Added in the repository ;)"
echo ""
#Adding Kernel to the Build

echo ""
echo ""
echo ""
echo "Adding kernel to the Build ;)"
git clone https://github.com/nparashar150/kernel_xiaomi_tissot.git $repository/kernel/xiaomi/tissot/
git clone https://github.com/MASTERGUY/kernel_xiaomi_msm8953.git $repository/kernel/xiaomi/msm8953/
echo ""
echo "Competed Kernel Syncing and Configuration ;)"

#Syncing Vendor for Building
echo ""
echo "Syncing and Configuring Vendor for Build ;)"
git clone https://github.com/nparashar150/vendor_xiaomi_tissot.git $repository/vendor/xiaomi/tissot/
echo "Added and Configured Vendor for the Build ;)"
fi 

if [ $Option = 5 ]
then 
read repository
cd $repository
#Applying Patches
echo ""
echo "Applying Patches wait you need to be here now for adding a # at swap"
#zram && ccache config
sudo apt install zram-config
echo "Add a # carefully at swap and save and exit"
sudo nano /etc/fstab
cat /proc/swaps
nano ~/.bashrc
source ~/.bashrc
prebuilts/misc/linux-x86/ccache/ccache -M 50G
ccache -M 50G
export USE_CCACHE=1
export CCACHE_EXEC=$ 
echo "CCache and ZRAM configured"
#Applying Metalava Patch
echo "Applying Metalava Patch"
echo "Tell your Repository Path ;)"
read repository
cd $repository/build/soong/
git fetch https://github.com/Magma-WIP/build_soong ten-metalava
git cherry-pick bcd1bb529132905cf55e72f5a2a6ba19a99f60ac^..dc3365fbde3b2a5773e655f690bb073967100795 
echo "Added Metalava Patch"
fi

if [ $Option = 6 ]
then
#Building ColtOS

echo "Building Colt OS"
read repository
cd $repository
. build/envsetup.sh && lunch colt_tissot-userdebug
mka colt
echo "Hope my script worked for you ;)"
fi

if [ $Option = 7 ]
then
#Building ColtOS

echo "Building Colt OS"
read repository
cd $repository
. build/envsetup.sh && lunch colt_tissot-userdebug
mka api-stubs-docs
mka hiddenapi-lists-docs
mka system-api-stubs-docs
mka test-api-stubs-docs
mka colt
echo "Hope my script worked for you ;)"
fi

fi 

if [ $environment = no ]
then 
exit
fi
