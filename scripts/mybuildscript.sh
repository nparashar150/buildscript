e#!/bin/bash
# This is the Build Scipt which will help you make your Custom Rom builds in more convenient way... !!
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
echo "2. Sync Device Tree + Sync Device Tree Common + Sync Kernel + Sync Vendor + Build"
echo "3. Build Clean"
echo "4. Sync Device Tree + Sync Device Tree Common + Sync Kernel + Sync Vendor"
echo "5. Apply Patches"
echo "6. Dirty Build"
echo "7. Drity Build with api"
echo "8. Install ANGULAR CLI + npm + nodejs"
echo ""
echo""
read Option 
if [ $Option = 1 ]
then 
# Initialising and syncing the Repository
mkdir ~/bin
PATH=~/bin:$PATH
curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
echo "Where do you want to clone the repository: Tell me the path"
read repository
mkdir $repository
cd $repository
repo init -u https://github.com/PixelExtended/manifest -b r
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
echo ""
echo ""
pwd
echo "Repository Synced at the path you specified ;)"
#Adding the Device Tree in the build
echo ""
echo "Syncing Device Tree from git ;)"
git clone https://github.com/xiaomi-sdm660/android_device_xiaomi_jasmine_sprout.git $repository/device/xiaomi/jasmine_sprout/
echo "Device Tree Added in the repository ;)"
#Adding Device Tree Common
echo ""
echo "Syncing Device Tree Common from git ;)"
git clone https://github.com/xiaomi-sdm660/android_device_xiaomi_sdm660-common.git $repository/device/xiaomi/sdm660-common/
echo "Device Tree Common Added in the repository ;)"
echo ""
#Adding Kernel to the Build
echo ""
echo ""
echo ""
echo "Adding kernel to the Build ;)"
git clone https://github.com/xiaomi-sdm660/android_kernel_xiaomi_sdm660.git $repository/kernel/xiaomi/sdm660/
echo ""
echo "Competed Kernel Syncing and Configuration ;)"
#Syncing Vendor for Building
echo ""
echo "Syncing and Configuring Vendor for Build ;)"
git clone https://github.com/xiaomi-sdm660/android_vendor_xiaomi_sdm660-common.git $repository/vendor/xiaomi/sdm660-common/
git clone https://github.com/xiaomi-sdm660/vendor_xiaomi_wayne-common.git $repository/vendor/xiaomi/wayne-common/
git clone https://github.com/xiaomi-sdm660/android_vendor_xiaomi_MiuiCamera.git $repository/vendor/xiaomi/MiuiCamera/
echo "Added and Configured Vendor for the Build ;)"
#Applying Patches
echo -e '\e]8;;https://github.com/nparashar150/android_build_soong\aTo install zram open hyperlink.\e]8;;\a'"
#Applying Metalava Patch
echo "Applying Metalava Patch"
cd $repository/build/soong/
git fetch https://github.com/nparashar150/android_build_soong
git cherry-pick c8ba7af59acda55a16835727d1d351b8d58a5ca4
echo "Added Metalava Patch"
#Building Pixel Extended
echo "Building Pixel Extended"
cd $repository
. build/envsetup.sh && lunch aosp_jasmine_sprout-userdebug
make api-stubs-docs
mka bacon -j$(nproc --all)
echo "Hope my script worked for you ;)"
fi
if [ $Option = 2 ]
then 
#Initialising and syncing the Repository
mkdir ~/bin
PATH=~/bin:$PATH
curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
echo "Where do you want to clone the repository: Tell me the path"
read repository
mkdir $repository
cd $repository
repo init -u https://github.com/PixelExtended/manifest -b r
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
echo ""
echo ""
pwd
echo "Repository Synced at the path you specified ;)"
#Adding the Device Tree in the build
echo ""
echo "Syncing Device Tree from git ;)"
git clone https://github.com/xiaomi-sdm660/android_device_xiaomi_jasmine_sprout.git $repository/device/xiaomi/jasmine_sprout/
echo "Device Tree Added in the repository ;)"
#Adding Device Tree Common
echo ""
echo "Syncing Device Tree Common from git ;)"
git clone https://github.com/xiaomi-sdm660/android_device_xiaomi_sdm660-common.git $repository/device/xiaomi/sdm660-common/
echo "Device Tree Common Added in the repository ;)"
echo ""
#Adding Kernel to the Build
echo ""
echo ""
echo ""
echo "Adding kernel to the Build ;)"
git clone https://github.com/xiaomi-sdm660/android_kernel_xiaomi_sdm660.git $repository/kernel/xiaomi/sdm660/
echo ""
echo "Competed Kernel Syncing and Configuration ;)"
#Syncing Vendor for Building
echo ""
echo "Syncing and Configuring Vendor for Build ;)"
git clone https://github.com/xiaomi-sdm660/android_vendor_xiaomi_sdm660-common.git $repository/vendor/xiaomi/sdm660-common/
git clone https://github.com/xiaomi-sdm660/vendor_xiaomi_wayne-common.git $repository/vendor/xiaomi/wayne-common/
git clone https://github.com/xiaomi-sdm660/android_vendor_xiaomi_MiuiCamera.git $repository/vendor/xiaomi/MiuiCamera/
echo "Added and Configured Vendor for the Build ;)"
#Building Pixel Extended
echo "Building Pixel Extended"
cd $repository
. build/envsetup.sh && lunch aosp_jasmine_sprout-userdebug
make api-stubs-docs
mka bacon -j$(nproc --all)
echo "Hope my script worked for you ;)"
fi
if [ $Option = 3 ]
then
#Building Pixel Extended
echo "Building Pixel Extended"
cd $repository
. build/envsetup.sh && lunch aosp_jasmine_sprout-userdebug
make api-stubs-docs
mka bacon -j$(nproc --all)
echo "Hope my script worked for you ;)"
fi
if [ $Option = 4 ]
then 
#Initialising and syncing the Repository
mkdir ~/bin
PATH=~/bin:$PATH
curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
echo "Where do you want to clone the repository: Tell me the path"
read repository
mkdir $repository
cd $repository
repo init -u https://github.com/PixelExtended/manifest -b r
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
echo ""
echo ""
pwd
echo "Repository Synced at the path you specified ;)"
#Adding the Device Tree in the build
echo ""
echo "Syncing Device Tree from git ;)"
git clone https://github.com/xiaomi-sdm660/android_device_xiaomi_jasmine_sprout.git $repository/device/xiaomi/jasmine_sprout/
echo "Device Tree Added in the repository ;)"
#Adding Device Tree Common
echo ""
echo "Syncing Device Tree Common from git ;)"
git clone https://github.com/xiaomi-sdm660/android_device_xiaomi_sdm660-common.git $repository/device/xiaomi/sdm660-common/
echo "Device Tree Common Added in the repository ;)"
echo ""
#Adding Kernel to the Build
echo ""
echo ""
echo ""
echo "Adding kernel to the Build ;)"
git clone https://github.com/xiaomi-sdm660/android_kernel_xiaomi_sdm660.git $repository/kernel/xiaomi/sdm660/
echo ""
echo "Competed Kernel Syncing and Configuration ;)"
#Syncing Vendor for Building
echo ""
echo "Syncing and Configuring Vendor for Build ;)"
git clone https://github.com/xiaomi-sdm660/android_vendor_xiaomi_sdm660-common.git $repository/vendor/xiaomi/sdm660-common/
git clone https://github.com/xiaomi-sdm660/vendor_xiaomi_wayne-common.git $repository/vendor/xiaomi/wayne-common/
git clone https://github.com/xiaomi-sdm660/android_vendor_xiaomi_MiuiCamera.git $repository/vendor/xiaomi/MiuiCamera/
echo "Added and Configured Vendor for the Build ;)"
fi 
if [ $Option = 5 ]
then 
echo "Please tell me the path of the Repository"
read repository
cd $repository
#Applying Patches
echo "To install zram go to https://www.techrepublic.com/article/how-to-enable-the-zram-module-for-faster-swapping-on-linux/"
#Applying Metalava Patch
echo "Applying Metalava Patch"
cd $repository/build/soong/
git fetch https://github.com/nparashar150/android_build_soong
git cherry-pick c8ba7af59acda55a16835727d1d351b8d58a5ca4
echo "Added Metalava Patch"
fi
if [ $Option = 6 ]
then
#Building Pixel Extended
echo "Building Pixel Extended"
read repository
cd $repository
. build/envsetup.sh && lunch aosp_jasmine_sprout-userdebug
mka bacon -j$(nproc --all)
echo "Hope my script worked for you ;)"
fi
if [ $Option = 7 ]
then
#Building ColtOS
echo "Building Colt OS"
read repository
cd $repository
. build/envsetup.sh && lunch aosp_jasmine_sprout-userdebug
mka api-stubs-docs
mka bacon -j$(nproc --all)
echo "Hope my script worked for you ;)"
fi
if [ $Option = 8 ]
then
#Install Angular CLI
sudo apt install npm -y --ignore-missing
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get update && sudo apt-get install yarn -y
sudo apt install nodejs -y
sudo dpkg -i --force-overwrite /var/cache/apt/archives/nodejs_12.20.1-deb-1nodesource1_amd64.deb
sudo apt-get -f install
node --version
sudo npm install -g @angular/cli
ng --version
fi 
fi 
if [ $environment = no ]
then 
git clone https://github.com/nparashar150/buildscript.git
cd buildscript/scripts
sudo bash env.sh
fi
