#!/bin/sh

# 合并两个广告 hosts 源的文件

vokins_hosts="https://raw.githubusercontent.com/vokins/yhosts/master/hosts"
h2y_shadowrocket="https://raw.githubusercontent.com/h2y/Shadowrocket-ADBlock-Rules/master/sr_direct_banad.conf"

wget --no-check-certificate ${vokins_hosts} -O hosts1
wget --no-check-certificate ${h2y_shadowrocket} -O hosts2

# 生成合并的 hosts
awk -F, '/DOMAIN-SUFFIX/ {print $2}' hosts2 > tmp.txt
awk '/127.0.0.1/ {print $2}' hosts1 >> tmp.txt
sort -u tmp.txt | awk '/^[^.]/ {print "127.0.0.1", $0}' > hosts

# 清理文件
rm -f hosts1 hosts2 tmp.txt

