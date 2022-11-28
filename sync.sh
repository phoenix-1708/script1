#!/bin/bash
cd $(pwd)/tmp
mkdir rom
cd rom
echo "initialising repo"
repo init --depth=1 --no-repo-verify -u https://github.com/RiceDroid/android -b thirteen -g default,-mips,-darwin,-notdefault

echo "Syncing source"
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j$(nproc --all) || repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8

echo "cloning device"
git clone https://github.com/phoenix-1708/device_sweet -b main --depth=1 device/xiaomi/sweet

echo "cloning vendor"
git clone https://github.com/phoenix-1708/vendor_sweet -b main --depth=1 vendor/xiaomi/sweet

echo "cloning clang"
git clone https://gitlab.com/ImSurajxD/clang-r450784d -b master --depth=1 prebuilts/clang/host/linux-x86/clang-r450784d
git clone https://gitlab.com/nerdprojectorg/SDClang -b 16 --depth=1 prebuilts/clang/host/linux-x86/clang-sdclang

echo "cloning dolby"
git clone https://gitlab.com/someone5678/vendor_dolby -b thirteen --depth=1 vendor/dolby

echo "cloning kernel"
git clone https://github.com/phoenix-1708/kernel_xiaomi_sm6150 -b t13 --depth=1 kernel/xiaomi/sweet

echo"cloning finished"

cp kernel/xiaomi/sweet/arch/arm64/configs/sweet_defconfig kernel/xiaomi/sweet/arch/arm64/configs/sweet_user_defconfig
echo "file copied successfully"
