#!/bin/sh

dnsmasq_path="/etc/storage/dnsmasq"
path="${dnsmasq_path}/hosts"

echo "开始配置 dnsmasq"
sed -i "/\/hosts\//d" ${dnsmasq_path}/dnsmasq.conf
cat >> ${dnsmasq_path}/dnsmasq.conf << EOF
addn-hosts=${path}/hosts
conf-file=${path}/gghosts
EOF

echo "配置定时任务"
http_username=$(nvram get http_username)
sed -i '/\/hosts\//d' /etc/storage/cron/crontabs/$http_username
cat >> /etc/storage/cron/crontabs/$http_username << EOF
0 5 * * * /bin/sh ${path}/update.sh
EOF

echo "WAN 口启动后更新"
sed -i '/\/hosts\//d' /etc/storage/post_wan_script.sh
cat >> /etc/storage/post_wan_script.sh << EOF
/bin/sh ${path}/update.sh
EOF

