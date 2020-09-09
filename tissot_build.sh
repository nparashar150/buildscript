#!/bin/bash

export ARCH=arm64
export SUBARCH=arm64
export CLANG_PATH=/home/naman/Downloads/data/kernel/clang/clang-r399163/bin
export PATH=${CLANG_PATH}:${PATH}
export CLANG_TRIPLE=aarch64-linux-android-
export CROSS_COMPILE=/home/naman/Downloads/data/kernel/ndk/android-ndk-r21d/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin/aarch64-linux-android-
export CROSS_COMPILE_ARM32=/home/naman/Downloads/data/kernel/ndk/android-ndk-r21d/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64/bin/arm-linux-androideabi-
make_kernel_init(){
	rm -rf put
	echo clean 
	make clean && make mrproper
	mkdir -p out

	echo SET DEFCONFIG
	make CC=clang 0=out tissot_defconfig

}

make_simply(){
	make_kernel_init
	echo Build Kernel
	make CC=clang 0=out -j4
}

make_simply
