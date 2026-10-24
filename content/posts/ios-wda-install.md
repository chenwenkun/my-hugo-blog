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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VOBQSIXO%2F20261024%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261024T095751Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIG6qCHgCt%2BNfp6sO87kYdvPSf6MDdHQHPinsMmA9SOfVAiB5z4n4yeqUiGrR3C6XXct7YmRenzhPSQ83t5CFfHPa2CqIBAii%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMMidxQxm3jk6DzMbBKtwDpPyggvEYZUMNdsO0HBqwTEo8JlEbEfEhu%2F199G4mhaOZY5eAfyOt%2FB5WMBxX4lNWNR0j%2BaaPY46jD8okaFOWq19A73LzgcUn4PtGCqHNBY87XXMJen0JJ104weNwNq0t8D1OQAsAPAy%2BjTR4CrT%2Fmflz9%2BWF2Kz1gkASFIy0P3p7kDjEDy2R6vN4wM54lAZuLkv8gnqkAh2O9AnthRiW6mpe3JHNdY8xvMaqrReHOhU98yfK%2B9bQvu4ifOwFkdGwOvnQvsjEQ%2FRhAgwgVUASY7Z2FIB6FHoBL6NnemVmojB9%2F%2FvzA65TC3mFedCWhTJmEUqj725viJ%2BUaN3bXbg1mgopFw0vV%2FZWSIYXfVoDS47ijvPIBqz7SGLJGaFbWXRL21wR79d1yznooWbPdM4fsiMq8S8vqbmLFDPTAd7BVB%2B%2B10K2HnhXl6cJmTqlrZNMzmB3UyzJZeu7vIbCju8SnEwd51P1f2yTtSPklZ0FuzWqYULObk798FRIFkpL7D4y8YXlKmRDzy58KbPFfiflDKorMTkCGAxum3lEYRE9Y%2B6fIW4MiAiy3H3SckiMaUQhN9Rl59f%2FOWdGoIM3r7dVVlOWVTuzWPVN2IOhPMOUSEzuKaVcJnchHGZmCswwqvLx1gY6pgGlRKjujv63jrDb%2FHmuIDmpuzeAgvEgZDmBuWdfl%2F9TpgGsR%2FBBDLuOc4NGmlA3%2FlnjuxwFKJVf25o5qbtPKiAKDA2vr7lwKDYuptGkQZK8VO7G2B51caRve3avvjfDWxLC6VLDdMenOxKVUIw8ZBCUMuwqZG89yi5Xgj0Es2CwCSdIRPXLln%2BWpIBovSwup0sCAYiNwcA1KRBrkvJBDtVmvy4L8ghg&X-Amz-Signature=cbd1a24f68d280400b458fbe78da295c785112b935904a4935684d2e44840305&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VOBQSIXO%2F20261024%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261024T095751Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIG6qCHgCt%2BNfp6sO87kYdvPSf6MDdHQHPinsMmA9SOfVAiB5z4n4yeqUiGrR3C6XXct7YmRenzhPSQ83t5CFfHPa2CqIBAii%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMMidxQxm3jk6DzMbBKtwDpPyggvEYZUMNdsO0HBqwTEo8JlEbEfEhu%2F199G4mhaOZY5eAfyOt%2FB5WMBxX4lNWNR0j%2BaaPY46jD8okaFOWq19A73LzgcUn4PtGCqHNBY87XXMJen0JJ104weNwNq0t8D1OQAsAPAy%2BjTR4CrT%2Fmflz9%2BWF2Kz1gkASFIy0P3p7kDjEDy2R6vN4wM54lAZuLkv8gnqkAh2O9AnthRiW6mpe3JHNdY8xvMaqrReHOhU98yfK%2B9bQvu4ifOwFkdGwOvnQvsjEQ%2FRhAgwgVUASY7Z2FIB6FHoBL6NnemVmojB9%2F%2FvzA65TC3mFedCWhTJmEUqj725viJ%2BUaN3bXbg1mgopFw0vV%2FZWSIYXfVoDS47ijvPIBqz7SGLJGaFbWXRL21wR79d1yznooWbPdM4fsiMq8S8vqbmLFDPTAd7BVB%2B%2B10K2HnhXl6cJmTqlrZNMzmB3UyzJZeu7vIbCju8SnEwd51P1f2yTtSPklZ0FuzWqYULObk798FRIFkpL7D4y8YXlKmRDzy58KbPFfiflDKorMTkCGAxum3lEYRE9Y%2B6fIW4MiAiy3H3SckiMaUQhN9Rl59f%2FOWdGoIM3r7dVVlOWVTuzWPVN2IOhPMOUSEzuKaVcJnchHGZmCswwqvLx1gY6pgGlRKjujv63jrDb%2FHmuIDmpuzeAgvEgZDmBuWdfl%2F9TpgGsR%2FBBDLuOc4NGmlA3%2FlnjuxwFKJVf25o5qbtPKiAKDA2vr7lwKDYuptGkQZK8VO7G2B51caRve3avvjfDWxLC6VLDdMenOxKVUIw8ZBCUMuwqZG89yi5Xgj0Es2CwCSdIRPXLln%2BWpIBovSwup0sCAYiNwcA1KRBrkvJBDtVmvy4L8ghg&X-Amz-Signature=69bf1150525413cda0929a7cd213334f1cc2bd37d5c133fdf0b9f7149a4e9e1d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
