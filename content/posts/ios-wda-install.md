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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666JHLLFPB%2F20260921%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260921T021544Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIBYfa5%2FQbqV1G%2F8ARj1Rj2hDQJ4YEnyGmy%2Fc%2BncW0eILAiBNW%2Fril16u3p4PCu1G4j%2Fzjg40y0QrBuDau001aowdNyr%2FAwh%2FEAAaDDYzNzQyMzE4MzgwNSIMDYHutsw44dqnbe9YKtwDD3r0SM3lPqwNRqs1SUCpE1cpII3qGJzHZu0wemH0qAxOM6fHLXlcgtj7K9Okbwy24733%2BDAQQqfhJuyqzuA%2BfrM4KChUH3Q19Y6W57nhTvg%2Bi9n50XuaIVWlptU4sBkIdmcqVxX2fOB1e%2BpDranQuCKQKeOymXdsoIsvBIvrQVfQmBzTYMn%2BnWr8gwujFOkIDq2Yq23UV%2BxSvZXhgZmwy8wV%2FIX9nR4p9i13irVzWEJwMcd86%2BGBft%2BZzFWaFZr4IlisaUuP9%2FwImTKdx20gzSVohGJE200pBsqYzW5tKPQfiQdXv8yzqRH8ZJDwmQ9TzTTt4fHWFlTgD76nRkcnt%2FQ%2BSYXsgHKSZmg3T8C1SE%2Fxu5AXxc3Njsk3DDWD9dGAe8SLhnpCm%2BKMiNDIe3XymTSStoVcvSmUj%2BgB%2BSMyfOrCEk%2BFxT76MdEDa7Nw1sIAkdtpK71ImXypblBHZUTNbdIe1659z68wlm%2BAI5GWfPq%2BDLRWx2aIz0rz1OnLWcEqPevSosfqvZv8WgWd2LAws3DGV1wXD8ijQh0IOoB7nnt8067%2FbP0dtWIz0%2FyPiRJ0IXo5O5LiA%2BdYovk%2BngCCOai5x4fd9x3uRPZuiWGMMBUe8EA4q9QyqKj7s1cwrKnB1QY6pgEPH12WydNLHJPMoUL7BggnvAevxmWrpDHvqvKFO9u3k%2Bgnr1LfodtQHnp7zbpJxi7Lxf5ybtp80PvdnK56OixN5Xbk1zyg0cOeX1z2pQ4q%2Fq5E7XHZgVhusJOxelbDJo9LYPSnGXHDN0dBVF%2Boc2VkzY2FtmC4cgyXTu041Pqu%2FDTp5iWPj4HiTNDKc2b8PRndrdtrknOcjbYW%2BkGAy4MRSqO73V5C&X-Amz-Signature=8f0a728f4f01112aa93432e29d9c5952b695db988bc83264d75213ec7a00ee59&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666JHLLFPB%2F20260921%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260921T021544Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIBYfa5%2FQbqV1G%2F8ARj1Rj2hDQJ4YEnyGmy%2Fc%2BncW0eILAiBNW%2Fril16u3p4PCu1G4j%2Fzjg40y0QrBuDau001aowdNyr%2FAwh%2FEAAaDDYzNzQyMzE4MzgwNSIMDYHutsw44dqnbe9YKtwDD3r0SM3lPqwNRqs1SUCpE1cpII3qGJzHZu0wemH0qAxOM6fHLXlcgtj7K9Okbwy24733%2BDAQQqfhJuyqzuA%2BfrM4KChUH3Q19Y6W57nhTvg%2Bi9n50XuaIVWlptU4sBkIdmcqVxX2fOB1e%2BpDranQuCKQKeOymXdsoIsvBIvrQVfQmBzTYMn%2BnWr8gwujFOkIDq2Yq23UV%2BxSvZXhgZmwy8wV%2FIX9nR4p9i13irVzWEJwMcd86%2BGBft%2BZzFWaFZr4IlisaUuP9%2FwImTKdx20gzSVohGJE200pBsqYzW5tKPQfiQdXv8yzqRH8ZJDwmQ9TzTTt4fHWFlTgD76nRkcnt%2FQ%2BSYXsgHKSZmg3T8C1SE%2Fxu5AXxc3Njsk3DDWD9dGAe8SLhnpCm%2BKMiNDIe3XymTSStoVcvSmUj%2BgB%2BSMyfOrCEk%2BFxT76MdEDa7Nw1sIAkdtpK71ImXypblBHZUTNbdIe1659z68wlm%2BAI5GWfPq%2BDLRWx2aIz0rz1OnLWcEqPevSosfqvZv8WgWd2LAws3DGV1wXD8ijQh0IOoB7nnt8067%2FbP0dtWIz0%2FyPiRJ0IXo5O5LiA%2BdYovk%2BngCCOai5x4fd9x3uRPZuiWGMMBUe8EA4q9QyqKj7s1cwrKnB1QY6pgEPH12WydNLHJPMoUL7BggnvAevxmWrpDHvqvKFO9u3k%2Bgnr1LfodtQHnp7zbpJxi7Lxf5ybtp80PvdnK56OixN5Xbk1zyg0cOeX1z2pQ4q%2Fq5E7XHZgVhusJOxelbDJo9LYPSnGXHDN0dBVF%2Boc2VkzY2FtmC4cgyXTu041Pqu%2FDTp5iWPj4HiTNDKc2b8PRndrdtrknOcjbYW%2BkGAy4MRSqO73V5C&X-Amz-Signature=7e5dcbde3f84887ee3d75c80a10129dbc88891eec209b50521d6e0b59ba8ed09&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
