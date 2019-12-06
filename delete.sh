#!/bin/sh

# 删除 dnsmasq 相关配置
sed -i "/\/host\//d" /etc/storage/dnsmasq/dnsmasq.conf

# 删除定时任务
http_username=$(nvram get http_username)
sed -i '/\/host\//d' /etc/storage/cron/crontabs/$http_username

# 删除 WAN 口配置
sed -i '/\/host\//d' /etc/storage/post_wan_script.sh

# 删除相关文件
rm -rf /etc/storage/dnsmasq/host

# 重启 dnsmasq
/sbin/restart_dhcpd

