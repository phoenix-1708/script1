#!/bin/bash


cd $(pwd)/tmp

com () 
{ 
    tar --use-compress-program="pigz -k -$2 " -cf $1.tar.gz $1
}

time com ccache 1

cd $(pwd)/tmp
time rclone copy $(pwd)/tmp/rom/out/target/product/sweet/*.zip remote:sweet -P
curl -s "https://api.telegram.org/bot1858827137:AAFZVaKOjAhjVyCXfiGgL-SK6dp7_lILZIE/sendMessage" -d chat_id=-509071822 -d text="Build Uploaded Successfully!"
cd $(pwd)/tmp
time rclone copy ccache.tar.gz remote:ccache/ci2 -P
