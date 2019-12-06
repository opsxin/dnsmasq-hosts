#!/bin/sh

# 删除 dnsmasq 相关配置
sed -i "/\/hosts\//d" /etc/storage/dnsmasq/dnsmasq.conf

# 删除定时任务
sed -i '/\/hosts\//d' /etc/storage/cron/crontabs/$http_username

# 删除 WAN 口配置
sed -i '/\/hosts\//d' /etc/storage/post_wan_script.sh

# 删除相关文件
rm -rf /etc/storage/dnsmasq/hosts
