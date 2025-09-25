---
title: warp连接服务器
date: '2025-09-25'
tags:
  - 技术
draft: false
---
1、建一个workflows，通过expect，写一个脚本，保存为 xxx,

```shell
#!/usr/bin/expect

set timeout 20
set hostname "your_hostname_or_ip"
set username "your_username"
set password "your_password"

spawn ssh $username@$hostname

expect "assword:"
send "$password\r"

interact
```

```shell
chmod +x 文件.exp
```

放在 workflow 运行就好了

存在在私钥的

```shell
#!/usr/bin/expect

set timeout 20
set key_path "/path/to/private_key.pem"
set username "your_username"
set ip_address "your_ip_address"
set passphrase "your_private_key_password"

spawn ssh -i $key_path -o StrictHostKeyChecking=no $username@$ip_address

expect "Enter passphrase for key '$key_path':"
send "$passphrase\r"

interact
```
