#!/bin/bash
source build/envsetup.sh
lunch calyx_sweet-user
export CCACHE_DIR=/tmp/ccache
export CCACHE_EXEC=$(which ccache)
export USE_CCACHE=1
ccache -M 12G
ccache -o compression=true
ccache -z
export TZ=Asia/Dhaka
m -j$(nproc --all)
