# dnsmasq 屏蔽广告 hosts

## 使用方法

```bash
wget https://github.com/opsxin/dnsmasq-hosts/raw/master/setting.sh -O setting.sh
sh setting.sh
```

## 说明

1. **适用于华硕固件。**
2. 每日 5 点更新 hosts。
3. WAN 口启动后更新 hosts。
4. 脚本存储路径：`/etc/storage/dnsmasq/host`。
5. 如不继续使用，通过`delete.sh`清理。

## 广告 hosts 来源

- [yhosts](https://github.com/vokins/yhosts/blob/master/hosts)
- [Shadowrocket-ADBlock-Rules](https://github.com/h2y/Shadowrocket-ADBlock-Rules/blob/master/sr_direct_banad.conf)

