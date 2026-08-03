---
title: warp连接服务器
date: '2025-09-25'
tags:
  - 技术
draft: false
author: chenwenkun
toc: true
show_reading_time: true
---
## 目标

用 WARP / SSH 连接服务器时，减少重复输入密码/口令的麻烦。这里整理两种常见场景：

1) **SSH 密码登录**：通过 `expect` 自动输入密码  

2) **SSH 私钥 + passphrase**：通过 `expect` 自动输入私钥口令

---

## 方案 A：密码登录（expect 自动输密码）

### 1. 新建脚本 `ssh_password.exp`

```javascript
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

### 2. 赋予可执行权限并运行

```bash
chmod +x ssh_password.exp
./ssh_password.exp
```

---

## 方案 B：私钥登录 + 私钥口令（expect 自动输 passphrase）

### 1. 新建脚本 `ssh_key_passphrase.exp`

```javascript
#!/usr/bin/expect
set timeout 20

set key_path "/path/to/private_key.pem"
set username "your_username"
set ip_address "your_ip_address"
set passphrase "your_private_key_password"

spawn ssh -i $key_path -o StrictHostKeyChecking=no $username@$ip_address

expect "Enter passphrase for key"
send "$passphrase\r"

interact
```

### 2. 赋予可执行权限并运行

```bash
chmod +x ssh_key_passphrase.exp
./ssh_key_passphrase.exp
```

---

## 放到 Workflow / 一键执行（可选）

如果你用的是终端工具的 Workflow（或自己写 shell alias），把脚本路径放进去即可。常见做法：

```bash
alias ssh-prod="~/scripts/ssh_password.exp"
```

---

## 注意事项（强烈建议看）

1. **不要把密码/私钥口令明文提交到 Git**
1. `expect` 脚本本质是“自动输入”，安全性取决于你对脚本文件的保护
1. 更推荐的长期方案：
1. `StrictHostKeyChecking=no` 仅用于临时/自动化场景；生产长期使用请保留主机指纹校验
---

## 快速排障

- 卡在 `Are you sure you want to continue connecting`：主机指纹未加入 known_hosts（可先手动连一次）
- 卡在 `Permission denied`：用户名/密码/私钥路径错误或服务器禁用了对应登录方式
