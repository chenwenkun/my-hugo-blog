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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RZ25VFS5%2F20260827%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260827T170303Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHEaCXVzLXdlc3QtMiJGMEQCIAlSDdERMTwSH7XOak2PDNpZtGqW7TbtGmDHNtfYV5K1AiAjoG5y8dCv%2FG0tkZOmkaUuhBnU9C9xDTWWAhuL3KPg6yr%2FAwg6EAAaDDYzNzQyMzE4MzgwNSIMN9J2BdcDabDscL4HKtwDbMyQDuCcWdTB9y2L%2B17fgQdnUuGi%2FklHpGWYDRMY7t%2FuYPjaXm2skTEpA5N38JJ%2BLihYYV4GPTGoMJ8gAHJaxUPRLxnuyoUsDwSpsmBL7%2BXicDUUsV5opnhQbzw0wjwG80an6c%2B34GGHJLDkQNCLr5Py5sgH434Zsrgl9X2if2X3BfHreKaUMXfW64zFh67Q%2BXrDGCC2KuuNlgpAQ65wHWzFMeLRb1cZ92abqzG73%2FdjZNdDgB5yit4C80TJO7aFYUNb3kd96Hz1yFdKEnHQA%2BQypFiqz2ALGr9O6dGiLsRFTbu6Jda0rOF8lUwpxjl%2FCLOCwe43OG6ipe5QNEjh0hR5ni38Cl3bwh2TSw1PUb7O3J735K%2Fgp2Xd3VMBYi5YniZptJDhJ9dSgpP21bACnNHSEQs5b7oOgX%2BcAsEIg58IHa3hNrpvC%2BX5zM380vEUJZyQCufUVNV1jVFq56%2FLIwd9TLW0D0F4uCA38siLH6edlSXWgEV2IJgjqKUR3AL9bV%2BoPTbIQzOKVZKxNSOi0B4KYERBA8z1yTHyUkZpjF8GoykXJyKboBykq3YJ83AFoaLIoNzo922%2FNRbUydlB0%2B49RDw7HRSmr43w%2F34nY2gKglS%2FlNZ7JrZCM5swktLB1AY6pgH%2B4Z7XDmPCGjU8CeapHS53pioDML1eO7vpJaJYgrtfTYdfukTpkXG0PPcZKUwWPqu%2FJFFzlF3rCod1DH43DRw9pfuq585Rqz0eZk9TSMxZf7STLxQcUEs1vP4A5EdTbyzR%2F71WqsGjOUmE%2FtfF7GxpVOFrQempJsfkNhRjTXgScj%2FyK3ge5ufvIk1zGneHjqTnVfIXkHf%2BMd5gVUWQYNoFF4Unzt7m&X-Amz-Signature=906ef64c1a64367bfc19f02dcfa391a772182bbcfaf463ada186883e35a6b0ea&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RZ25VFS5%2F20260827%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260827T170303Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHEaCXVzLXdlc3QtMiJGMEQCIAlSDdERMTwSH7XOak2PDNpZtGqW7TbtGmDHNtfYV5K1AiAjoG5y8dCv%2FG0tkZOmkaUuhBnU9C9xDTWWAhuL3KPg6yr%2FAwg6EAAaDDYzNzQyMzE4MzgwNSIMN9J2BdcDabDscL4HKtwDbMyQDuCcWdTB9y2L%2B17fgQdnUuGi%2FklHpGWYDRMY7t%2FuYPjaXm2skTEpA5N38JJ%2BLihYYV4GPTGoMJ8gAHJaxUPRLxnuyoUsDwSpsmBL7%2BXicDUUsV5opnhQbzw0wjwG80an6c%2B34GGHJLDkQNCLr5Py5sgH434Zsrgl9X2if2X3BfHreKaUMXfW64zFh67Q%2BXrDGCC2KuuNlgpAQ65wHWzFMeLRb1cZ92abqzG73%2FdjZNdDgB5yit4C80TJO7aFYUNb3kd96Hz1yFdKEnHQA%2BQypFiqz2ALGr9O6dGiLsRFTbu6Jda0rOF8lUwpxjl%2FCLOCwe43OG6ipe5QNEjh0hR5ni38Cl3bwh2TSw1PUb7O3J735K%2Fgp2Xd3VMBYi5YniZptJDhJ9dSgpP21bACnNHSEQs5b7oOgX%2BcAsEIg58IHa3hNrpvC%2BX5zM380vEUJZyQCufUVNV1jVFq56%2FLIwd9TLW0D0F4uCA38siLH6edlSXWgEV2IJgjqKUR3AL9bV%2BoPTbIQzOKVZKxNSOi0B4KYERBA8z1yTHyUkZpjF8GoykXJyKboBykq3YJ83AFoaLIoNzo922%2FNRbUydlB0%2B49RDw7HRSmr43w%2F34nY2gKglS%2FlNZ7JrZCM5swktLB1AY6pgH%2B4Z7XDmPCGjU8CeapHS53pioDML1eO7vpJaJYgrtfTYdfukTpkXG0PPcZKUwWPqu%2FJFFzlF3rCod1DH43DRw9pfuq585Rqz0eZk9TSMxZf7STLxQcUEs1vP4A5EdTbyzR%2F71WqsGjOUmE%2FtfF7GxpVOFrQempJsfkNhRjTXgScj%2FyK3ge5ufvIk1zGneHjqTnVfIXkHf%2BMd5gVUWQYNoFF4Unzt7m&X-Amz-Signature=0cfc80a6b93683a18850274352b9cbeea08cb46e79392bb1e4b4aea7024dc686&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
