#!/bin/sh

path="/etc/storage/dnsmasq/host"
#vokins_hosts="https://raw.githubusercontent.com/vokins/yhosts/master/hosts"
google_hosts="https://raw.githubusercontent.com/googlehosts/hosts/master/hosts-files/dnsmasq.conf"

# 创建保存 hosts 文件夹
if [ ! -d "${path}" ]; then
        mkdir -p ${path}
fi

cd ${path}

# 下载 ad hosts
#wget --no-check-certificate ${vokins_hosts} -O hosts

# 合并两个广告源
/bin/sh merge.sh

# 下载 google hosts
wget --no-check-certificate ${google_hosts} -O gghosts

# 重启 dnsmasq
/sbin/restart_dhcpd
