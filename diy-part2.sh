#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

sed -i 's/192.168.1.1/192.168.5.21/g' package/base-files/files/bin/config_generate
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci-light/Makefile   # 选择argon为默认主题
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci-nginx/Makefile   # 选择argon为默认主题
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci-ssl-nginx/Makefile   # 选择argon为默认主题
sed -i 's/LUCI_DEPENDS:=+umbim/#LUCI_DEPENDS:=+umbim/g' feeds/luci/protocols/luci-proto-mbim/Makefile   #暂时不编译进入
sed -i 's/LUCI_DEPENDS:=+uqmi/#LUCI_DEPENDS:=+uqmi/g' feeds/luci/protocols/luci-proto-qmi/Makefile  #暂时不编译进入
rm -rf feeds/packages/lang/golang   #删除自带
git clone https://github.com/sbwml/packages_lang_golang -b 20.x feeds/packages/lang/golang
rm -rf package/diy/luci-app-ota
git clone -b main https://github.com/sirpdboy/luci-app-parentcontrol package/luci-app-parentcontrol
git clone -b main https://github.com/sirpdboy/luci-app-eqosplus package/luci-app-eqosplus
