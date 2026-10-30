---
title: iOS WDA作为App独立运行
date: '2025-09-25'
tags:
  - 技术
draft: false
author: chenwenkun
toc: true
show_reading_time: true
---
## 目标

把 WebDriverAgent（WDA）**打包成可独立安装运行的 iOS App（.ipa）**，用于：

- 不依赖 Xcode 直接在真机上启动 WDA
- 远程/自动化环境更方便地拉起 WDA 服务
- iOS 17+ 也可用（按你的记录验证）
---

## 已验证情况（来自原始记录）

- iOS 16.6：运行闪退
- iOS 18.3 / 18.4：可正常安装运行
---

## 背景：WDA 与维护者

- WDA 最早来自 Facebook（现已不活跃）
- 当前常用维护版本由 Appium 维护（建议优先使用 Appium 维护分支）
（下方保留原始对象/链接块）

---

## 步骤 1：下载代码 & Xcode 首次构建

1. 下载/拉取 WebDriverAgent 代码
1. 用 Xcode 打开工程并先构建一次（确保依赖齐全）
1. 修改 `Bundle Identifier`
1. 选择并勾选你自己的 Apple ID（签名用）
（下方保留原图）

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QIQA36DP%2F20261030%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261030T115007Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGoaCXVzLXdlc3QtMiJGMEQCIH47hs5Gqh9OnWDOsiwgJntCd1bJWl5ZS2LIXVXCVYCpAiBBRycyvNkanJfYBNyoYMmH8CBCl9MoNzDo7sT9WXTpuCr%2FAwgzEAAaDDYzNzQyMzE4MzgwNSIMojkEa%2BhAjz%2FMD6aJKtwDFOIkSBoHPHnNP1TQj%2BR1pssHTJjCgODHBVRi1asyycL4B232LcSN9KjKZvuCmrSg9Phgij3VyksZ0GlowwpEcLwtFUHt82BkrqxgZYfX%2BtqWGi3crIMhR06%2Bdwt5swpkC3qUTSjFbdF%2F2XsOwl2lDBskhp%2Fd7a6p1t%2BsqscISpjB5iz5MbR%2B1Mh5kjCwnuWt9KblM%2FwUO8%2BvDOEZSfi8nabZTNHAEfckS6%2BS9JmGNGMwjM1LedVMsPPkW4GfVLm8cUc7HwrN8ZpAQiKIzxdZfg2EV%2F75u57c%2Foy12Fkv7r%2Fz4S%2Bh2%2FqQ8JTqsTbihPWy7RgZWWHw6lQ7dLEmn7HBhc2kYzYLDm58I1lHbI0yjYwcQ%2BrgGXA6Inu1LfKof9eXdxi4k13pWNEWfAnv8OK8PzjC0rEU5%2BG2vQZc1uG%2FvJVYvLXmafG6tzoDxwn9qTvV0mn4gD%2BXLSmg4FrpsS6hKPbrdQ0qIvebR89M080YGYIZjJMjiFSVuvls36GictHdcA7cRD%2FQ%2B41qfVQLTMPNUpWGuS4kq6Qal1XMRqzQOjwFYwgUMHpt2cJOJMNA6LU%2FbQbm8RY%2BIpBLZjaXMbyB%2F6NP0rtgcRQKl4G31Nq1Kr6j8mIaOsw1U1KftUgw%2B9KR1wY6pgH9JLW8QgVF31btt2wT32u1WGRK3ibSswJ5Xhfn2rbOWLZnhGdYYJvvn2%2BFKGoXy945xfJA9PyFZRHy1pRDJ80a4V4TR9LWR7c8RB1GkVfnQiGdt3YhVZYaRkYa8QBEqWHB5vJkIooVcpwTyttMEHjY65yTFAPqk4BtsHzScrP3S6Lyw%2FnUv3lwOiveOmz9HEc7rDXGhKDjz%2FHiFrz7ClJ9jv9JRYuK&X-Amz-Signature=6f75a3d7ef15d1cd86d8c500615a95b2eba22db01846b1ab9aba9a821c468a12&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 步骤 2：用 xcodebuild 产出可用于打包的构建产物

```bash
cd /Users/chenwenkun/Downloads/androidandios/iosui/WebDriverAgent/WebDriverAgent

# 使用 xcodebuild 构建 WebDriverAgentRunner 用于测试
xcodebuild build-for-testing \
  -scheme WebDriverAgentRunner \
  -sdk iphoneos \
  -configuration Release \
  -derivedDataPath /tmp/derivedDataPath

# Apple Silicon（可选）显式指定 arm64
xcodebuild build-for-testing \
  -scheme WebDriverAgentRunner \
  -sdk iphoneos \
  -configuration Release \
  -derivedDataPath /tmp/derivedDataPath \
  -arch arm64
```

---

## 步骤 3：组装 Payload 并打包 ipa

```bash
cd /tmp/derivedDataPath
cd Build/Products/Release-iphoneos

# 创建 Payload 并复制 .app
mkdir Payload && cp -r *.app Payload

# 打包 ipa
zip -r WDA.ipa Payload
```

---

## 步骤 4：清理 Frameworks（关键）

进入：

`WebDriverAgentRunner-Runner.app/Frameworks`

把 **XC 开头的文件全部删掉**（按你原记录的踩坑经验）

（下方保留原图）

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QIQA36DP%2F20261030%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261030T115007Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGoaCXVzLXdlc3QtMiJGMEQCIH47hs5Gqh9OnWDOsiwgJntCd1bJWl5ZS2LIXVXCVYCpAiBBRycyvNkanJfYBNyoYMmH8CBCl9MoNzDo7sT9WXTpuCr%2FAwgzEAAaDDYzNzQyMzE4MzgwNSIMojkEa%2BhAjz%2FMD6aJKtwDFOIkSBoHPHnNP1TQj%2BR1pssHTJjCgODHBVRi1asyycL4B232LcSN9KjKZvuCmrSg9Phgij3VyksZ0GlowwpEcLwtFUHt82BkrqxgZYfX%2BtqWGi3crIMhR06%2Bdwt5swpkC3qUTSjFbdF%2F2XsOwl2lDBskhp%2Fd7a6p1t%2BsqscISpjB5iz5MbR%2B1Mh5kjCwnuWt9KblM%2FwUO8%2BvDOEZSfi8nabZTNHAEfckS6%2BS9JmGNGMwjM1LedVMsPPkW4GfVLm8cUc7HwrN8ZpAQiKIzxdZfg2EV%2F75u57c%2Foy12Fkv7r%2Fz4S%2Bh2%2FqQ8JTqsTbihPWy7RgZWWHw6lQ7dLEmn7HBhc2kYzYLDm58I1lHbI0yjYwcQ%2BrgGXA6Inu1LfKof9eXdxi4k13pWNEWfAnv8OK8PzjC0rEU5%2BG2vQZc1uG%2FvJVYvLXmafG6tzoDxwn9qTvV0mn4gD%2BXLSmg4FrpsS6hKPbrdQ0qIvebR89M080YGYIZjJMjiFSVuvls36GictHdcA7cRD%2FQ%2B41qfVQLTMPNUpWGuS4kq6Qal1XMRqzQOjwFYwgUMHpt2cJOJMNA6LU%2FbQbm8RY%2BIpBLZjaXMbyB%2F6NP0rtgcRQKl4G31Nq1Kr6j8mIaOsw1U1KftUgw%2B9KR1wY6pgH9JLW8QgVF31btt2wT32u1WGRK3ibSswJ5Xhfn2rbOWLZnhGdYYJvvn2%2BFKGoXy945xfJA9PyFZRHy1pRDJ80a4V4TR9LWR7c8RB1GkVfnQiGdt3YhVZYaRkYa8QBEqWHB5vJkIooVcpwTyttMEHjY65yTFAPqk4BtsHzScrP3S6Lyw%2FnUv3lwOiveOmz9HEc7rDXGhKDjz%2FHiFrz7ClJ9jv9JRYuK&X-Amz-Signature=1325a1c0cf3dece18e0b7a7f13b28866ee5e349a46f59c6b576398d673dd03a2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 步骤 5：重签名（Re-sign）

使用工具进行重签名：

- iOS App Signer / App Resigner
- 你原文参考链接（保留）：  
产物：保存为 `WDA2.ipa`

（你记录里提到：个人开发者证书可用）

---

## 步骤 6：安装到真机（tidevice）

```bash
pip install tidevice

tidevice install WDA2.ipa
```

---

## 步骤 7：启动与验证

1. 手机上点击 WDA 图标启动
1. 浏览器打开：
- http://localhost:8100/status
出现一段 JSON 即正常。

---

## 附件（保留）

---

## 国内环境补充（你的原始备注整理）

如果需要把端口映射到电脑端进行访问/调试：

```bash
brew install --HEAD libimobiledevice
iproxy 8100 8100
```

然后在电脑端访问 `http://localhost:8100/status`。
