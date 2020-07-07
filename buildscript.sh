#This is the Build Scipt which will help you make your Custom Rom builds in more convenient way... !!
echo ""
echo "Sit freely you need to relax when this is going on"
echo ""
echo ""
echo ""
echo "Did you install the Tools before running this?"
echo ""
echo ""
echo ""
echo "Syncing the ColtOS repository"
echo ""
echo ""
echo ""

#Initialising and syncing the Repository

mkdir ~/bin
PATH=~/bin:$PATH
curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
mkdir ~/Desktop/ColtOS
cd ~/Desktop/ColtOS
repo init -u git://github.com/Colt-Enigma/platform_manifest.git -b c10
repo sync --no-tags --no-clone-bundle --force-sync -c 

echo ""
echo ""
echo ""
echo "Repository Synced @ ~/Desktop/ColtOS"

#Adding the Device Tree in the build

echo "Syncing Device Tree from git"

git clone -b colt https://github.com/nparashar150/android_device_xiaomi_tissot.git ~/Desktop/ColtOS/device/xiaomi/tissot/

echo ""
echo ""
echo ""
echo "Device Tree Added @ ~/Desktop/ColtOS/device/xiaomi/tissot/"

#Adding Device Tree Common

echo ""
echo ""
echo ""
echo "Syncing Device Tree Common from git"

git clone -b derp10 https://github.com/nparashar150/android_device_xiaomi_msm8953-common.git ~/Desktop/ColtOS/device/xiaomi/msm8953-common/

echo ""
echo ""
echo ""
echo "Device Tree Common Added @ ~/Desktop/ColtOS/device/xiaomi/msm8953-common/ "

#Adding Kernel to the Build

echo ""
echo ""
echo ""
echo "Adding kernel to the Build"

git clone https://github.com/nparashar150/kernel_xiaomi_tissot.git ~/Desktop/ColtOS/kernel/xiaomi/tissot/
 
git clone https://github.com/MASTERGUY/kernel_xiaomi_msm8953.git ~/Desktop/ColtOS/kernel/xiaomi/msm8953/

echo ""
echo ""
echo ""
echo "Competed Kernel Syncing and Configuration"

#Syncing Vendor for Building

echo ""
echo ""
echo ""
echo "Syncing and Configuring Vendor for Build"

git clone https://github.com/nparashar150/vendor_xiaomi_tissot.git ~/Desktop/ColtOS/vendor/xiaomi/

echo ""
echo ""
echo ""
echo "Added and Configured Vendor for the Build"

#Applying Patches

echo ""
echo ""
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

echo ""
echo ""
echo ""
echo "CCache and ZRAM configured"

#Applying Metalava Patch

echo ""
echo ""
echo ""
echo "Applying Metalava Patch"
cd ~/Desktop/ColtOS/build/soong/
git fetch https://github.com/Magma-WIP/build_soong ten-metalava
git cherry-pick bcd1bb529132905cf55e72f5a2a6ba19a99f60ac^..dc3365fbde3b2a5773e655f690bb073967100795 
echo ""
echo ""
echo ""
echo "Added Metalava Patch"

#Building ColtOS

echo ""
echo ""
echo ""
echo "Building Colt OS"
cd ~/Desktop/CotlOS/
. build/envsetup.sh && lunch colt_tissot-userdebug
mka clean
mka api-stubs-docs
mka hiddenapi-lists-docs
mka system-api-stubs-docs
mka test-api-stubs-docs
mka colt
echo ""
echo ""
echo ""
echo "Did my script work for you"
echo ""
echo ""
echo ""
