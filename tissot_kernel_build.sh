#!/bin/bash
echo "Running script"
echo "Did you scyn the stuff? 1=yes 2=no"
read stuff
if [ $stuff=1 ]
then 
echo "Building"
KERNEL_DIR=$(pwd)
REPACK_DIR="${KERNEL_DIR}/AnyKernel"
IMAGE="${KERNEL_DIR}/out/arch/arm64/boot/Image.gz"
DTB_T="${KERNEL_DIR}/out/arch/arm64/boot/dts/qcom/msm8953-qrd-sku3-tissot-treble.dtb"
DTB="${KERNEL_DIR}/out/arch/arm64/boot/dts/qcom/msm8953-qrd-sku3-tissot-nontreble.dtb"
BRANCH="$(git rev-parse --abbrev-ref HEAD)"
export PATH="$(pwd)/clang/bin:$PATH"
export KBUILD_COMPILER_STRING="$($kernel/clang/bin/clang --version | head -n 1 | perl -pe 's/\((?:http|git).*?\)//gs' | sed -e 's/  */ /g' -e 's/[[:space:]]*$//' -e 's/^.*clang/clang/')"
export ARCH=arm64
export KBUILD_BUILD_USER=nparashar150
export KBUILD_BUILD_HOST=local
# Compile plox
function compile() {
    make -j$(nproc) O=out ARCH=arm64 tissot_defconfig
    make -j$(nproc) O=out \
                    ARCH=arm64 \
                      CC=clang \
                      CROSS_COMPILE=aarch64-linux-gnu- \
                      CROSS_COMPILE_ARM32=arm-linux-gnueabi- \

    cd $REPACK_DIR
    mkdir kernel
    mkdir dtb-treble
    mkdir dtb-nontreble

    if ! [ -a "$IMAGE" ]; then
        exit 1
        echo "There are some issues"
    fi
    cp $IMAGE $REPACK_DIR/kernel/

    if ! [ -a "$DTB" ]; then
        exit 1
        echo "There are some issues"
    fi
    cp $DTB $REPACK_DIR/dtb-nontreble/

    if ! [ -a "$DTB_T" ]; then
        exit 1
        echo "There are some issues"
    fi
    cp $DTB_T $REPACK_DIR/dtb-treble/
}
# Zipping
function zipping() {
    cd $REPACK_DIR || exit 1
    zip -r9 Perf+Kernel.zip *
    curl https://bashupload.com/Perf+Kernel.zip --data-binary @Perf+Kernel.zip
}
compile
zipping

fi 

if [ $stuff=2 ]
echo "Cloning dependencies"
git clone --depth=1 -b rebase-perf+ https://github.com/MASTERGUY/kernel_xiaomi_msm8953 kernel
cd kernel
git clone --depth=1 -b master https://github.com/kdrag0n/proton-clang clang
git clone https://github.com/MASTERGUY/AnyKernel3 -b tissot --depth=1 AnyKernel
echo "Done"
echo "Building"
KERNEL_DIR=$(pwd)
REPACK_DIR="${KERNEL_DIR}/AnyKernel"
IMAGE="${KERNEL_DIR}/out/arch/arm64/boot/Image.gz"
DTB_T="${KERNEL_DIR}/out/arch/arm64/boot/dts/qcom/msm8953-qrd-sku3-tissot-treble.dtb"
DTB="${KERNEL_DIR}/out/arch/arm64/boot/dts/qcom/msm8953-qrd-sku3-tissot-nontreble.dtb"
BRANCH="$(git rev-parse --abbrev-ref HEAD)"
export PATH="$(pwd)/clang/bin:$PATH"
export KBUILD_COMPILER_STRING="$($kernel/clang/bin/clang --version | head -n 1 | perl -pe 's/\((?:http|git).*?\)//gs' | sed -e 's/  */ /g' -e 's/[[:space:]]*$//' -e 's/^.*clang/clang/')"
export ARCH=arm64
export KBUILD_BUILD_USER=nparashar150
export KBUILD_BUILD_HOST=local
# Compile plox
function compile() {
    make -j$(nproc) O=out ARCH=arm64 tissot_defconfig
    make -j$(nproc) O=out \
                    ARCH=arm64 \
                      CC=clang \
                      CROSS_COMPILE=aarch64-linux-gnu- \
                      CROSS_COMPILE_ARM32=arm-linux-gnueabi- \

    cd $REPACK_DIR
    mkdir kernel
    mkdir dtb-treble
    mkdir dtb-nontreble

    if ! [ -a "$IMAGE" ]; then
        exit 1
        echo "There are some issues"
    fi
    cp $IMAGE $REPACK_DIR/kernel/

    if ! [ -a "$DTB" ]; then
        exit 1
        echo "There are some issues"
    fi
    cp $DTB $REPACK_DIR/dtb-nontreble/

    if ! [ -a "$DTB_T" ]; then
        exit 1
        echo "There are some issues"
    fi
    cp $DTB_T $REPACK_DIR/dtb-treble/
}
# Zipping
function zipping() {
    cd $REPACK_DIR || exit 1
    zip -r9 Rify.zip *

}
compile
zipping
fi
