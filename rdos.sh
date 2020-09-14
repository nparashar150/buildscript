#!/bin/bash
repo init -u https://github.com/Cosmic-OS/platform_manifest.git -b quasar-release
repo sync --no-tags --no-clone-bundle --force-sync -c -j10
git clone https://github.com/Paranoid-Tissot/android_device_xiaomi_tissot.git -b pa device/xiaomi/tissot/
git clone https://github.com/Paranoid-Tissot/android_device_xiaomi_msm8953-common.git -b pa device/xiaomi/msm8953-common/
git clone https://github.com/DerpFest-Devices/kernel_xiaomi_msm8953.git kernel/xiaomi/msm8953/
git clone https://github.com/DerpFest-Devices/kernel_xiaomi_msm8953.git kernel/xiaomi/tissot/
git clone https://github.com/DerpFest-Devices/vendor_xiaomi_tissot.git vendor/xiaomi/
git clone https://github.com/AOSPA/android_hardware_qcom_display -b quartz-89xx hardware/qcom/display
git clone https://github.com/AOSPA/android_hardware_qcom_audio -b quartz-89xx hardware/qcom/audio
git clone https://github.com/AOSPA/android_hardware_qcom_media -b quartz-89xx hardware/qcom/media
git clone https://github.com/AOSPA/android_packages_apps_Bluetooth -b quartz-dev packages/apps/Bluetooth
