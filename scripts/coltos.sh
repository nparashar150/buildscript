#!/bin/bash

echo "Syncing stuff for you."
mkdir ~/bin
PATH=~/bin:$PATH
curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
repo init -u git://github.com/Colt-Enigma/platform_manifest.git -b c10
repo sync --no-tags --no-clone-bundle --force-sync -c
git clone -b colt https://github.com/nparashar150/android_device_xiaomi_msm8953-common.git device/xiaomi/msm8953-common/
git clone -b colt https://github.com/nparashar150/android_device_xiaomi_tissot.git device/xiaomi/tissot/
git clone -b queso https://github.com/nparashar150/vendor_xiaomi_tissot.git vendor/xiaomi/
git clone -b aex10 https://github.com/MASTERGUY/android_kernel_xiaomi_msm8953.git kernel/xiaomi/msm8953/
git clone -b aex10 https://github.com/MASTERGUY/android_kernel_xiaomi_msm8953.git kernel/xiaomi/tissot/
echo "Done the syncing process."
echo "Shutting down the system."
shutdown
