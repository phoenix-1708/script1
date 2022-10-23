#!/bin/bash
echo "initialising repo"
sudo repo init --depth=1 --no-repo-verify -u https://github.com/Spark-Rom/manifest -b pyro -g default,-mips,-darwin,-notdefault
echo "Syncing source"
sudorepo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j$(nproc --all) || repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8
echo "cloning device"
sudo git clone https://github.com/phoenix-1708/android_device_xiaomi_sweet -b arrow-13.0 --depth=1 device/xiaomi/sweet
echo "cloning vendor"
sudo git clone https://github.com/phoenix-1708/vendor_device_xiaomi_sweet -b arrow-13.0 --depth=1 vendor/xiaomi/sweet
echo "cloning proton-clang"
sudo git clone https://github.com/kdrag0n/proton-clang -b master --depth=1 prebuilts/clang/host/linux-x86/clang-proton
echo "cloning kernel"
sudo git clone https://github.com/olhotorto/kernel_xiaomi_sweet -b dev/13 --depth=1 kernel/xiaomi/sweet
echo"cloning finished"
sudo cp kernel/xiaomi/sweet/arch/arm64/configs/sweet_defconfig kernel/xiaomi/sweet/arch/arm64/configs/sweet_user_defconfig
echo "file copied successfully"
