#!/bin/bash

echo "Syncing stuff for you."
mkdir ~/bin
PATH=~/bin:$PATH
curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
git clone https://github.com/IMMANUEL44/device_xiaomi_jasmine_sprout.git device/xiaomi/jasmine_sprout/
git clone https://github.com/IMMANUEL44/device_xiaomi_sdm660-common.git device/xiaomi/sdm660-common/
git clone https://github.com/IMMANUEL44/vendor_xiaomi_sdm660-common.git vendor/xiaomi/sdm660-common/
git clone https://github.com/IMMANUEL44/kernel_xiaomi_sdm660.git kernel/xiaomi/sdm660/
git clone https://github.com/IMMANUEL44/vendor_xiaomi_wayne-common kernel/xiaomi/wayne-common/
echo "Done the syncing process."
