#!/bin/bash
sudo mkdir /mnt/ccache
sudo mount --bind /home/harikumar/tmp/ccache /mnt/ccache
source build/envsetup.sh
lunch lineage_sweet-userdebug
export CCACHE_DIR=/mnt/ccache
export CCACHE_EXEC=/usr/bin/ccache
export USE_CCACHE=1
ccache -M 12G
ccache -o compression=true
ccache -z
export BUILD_USERNAME=Harikumar
export BUILD_HOSTNAME=prototype
export TZ=Asia/Jakarta
mka bacon -j$(nproc --all)
