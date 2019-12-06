#!/bin/sh

dnsmasq_path="/etc/storage/dnsmasq"
path="${dnsmasq_path}/host"
update="https://raw.githubusercontent.com/opsxin/dnsmasq-hosts/master/update.sh"
delete="https://raw.githubusercontent.com/opsxin/dnsmasq-hosts/master/delete.sh"
merge="https://raw.githubusercontent.com/opsxin/dnsmasq-hosts/master/merge.sh"

echo "开始配置 dnsmasq"
sed -i "/\/host\//d" ${dnsmasq_path}/dnsmasq.conf
cat >> ${dnsmasq_path}/dnsmasq.conf << EOF
addn-hosts=${path}/hosts
conf-file=${path}/gghosts
EOF

echo "配置定时任务"
http_username=$(nvram get http_username)
sed -i '/\/host\//d' /etc/storage/cron/crontabs/$http_username
cat >> /etc/storage/cron/crontabs/$http_username << EOF
0 5 * * * /bin/sh ${path}/update.sh
EOF

echo "WAN 口启动后更新"
sed -i '/\/host\//d' /etc/storage/post_wan_script.sh
cat >> /etc/storage/post_wan_script.sh << EOF
/bin/sh ${path}/update.sh
EOF

echo "创建保存 host 文件夹"
if [ ! -d "${path}" ]; then
        mkdir -p ${path}
fi

echo "下载相关脚本"
wget --no-check-certificate ${update} -O ${path}/update.sh 
wget --no-check-certificate ${delete} -O ${path}/delete.sh
wget --no-check-certificate ${merge} -O ${path}/merge.sh
chmod +x ${path}/update.sh ${path}/delete.sh ${path}/merge.sh

echo "更新规则"
/bin/sh ${path}/update.sh

