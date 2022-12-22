#!/bin/bash
git config --global user.name "phoenix-1708"
git config --global user.email "harikumar1708@gmail.com"
git config --global color.ui true
sudo apt-get install -y bc bison build-essential ccache curl flex g++-multilib gcc-multilib git gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev liblz4-tool libncurses5 libncurses5-dev libsdl1.2-dev libssl-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev
sudo apt-get install -y openjdk-11-jdk
sudo apt-get install -y wget
sudo apt-get install -y jq
chmod +x setup.sh build.sh upload.sh sync.sh
git clone https://github.com/akhilnarang/scripts bscripts && cd bscripts && bash setup/android_build_env.sh && cd ..
mkdir -p ~/.config/rclone
cp rclone.conf ~/.config/rclone/rclone.conf
df -h && free -h && nproc
mkdir -p /home/harikumar/ccache
