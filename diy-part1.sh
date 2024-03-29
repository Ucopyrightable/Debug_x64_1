#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#sed -i '1i src-git helloworld https://github.com/fw876/helloworld' feeds.conf.default
#sed -i '2i src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages' feeds.conf.default
#sed -i '3i src-git passwall https://github.com/xiaorouji/openwrt-passwall' feeds.conf.default
#sed -i '4i src-git passwall2 https://github.com/xiaorouji/openwrt-passwall2' feeds.conf.default

#Add Openclash&passwall&passwall2
mkdir package/modify
mkdir package/modify/openclash
cd package/modify/openclash
git init
git remote add origin https://github.com/vernesong/OpenClash.git
git config core.sparsecheckout true
echo "luci-app-openclash" >> .git/info/sparse-checkout
git pull --depth 1 origin master
git branch --set-upstream-to=origin/master master
cd ../../..
cd package/modify
git clone --depth=1 --single-branch https://github.com/xiaorouji/openwrt-passwall-packages.git
git clone --depth=1 --single-branch https://github.com/xiaorouji/openwrt-passwall.git
git clone --depth=1 --single-branch https://github.com/xiaorouji/openwrt-passwall2.git
cd ../..
