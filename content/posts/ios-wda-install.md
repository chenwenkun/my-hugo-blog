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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U5XEMXDN%2F20261010%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261010T163324Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCICjPNWwZdtxvPJPQi4H14PyLmsI826Z3CuvqcQgnQ4UaAiEAxAbQ4PQ8qEm42Z56ogmp1B5XsRbxnaRP0qJ8%2FJKW320q%2FwMIWBAAGgw2Mzc0MjMxODM4MDUiDOvqNepdhBX8i0XOiircA%2FTYyIRr9NiA2kCfFQOC7z1%2F02Sl2GLYC%2Fxoi%2F%2FxnxdllL%2FLJ6N9g6eV%2FQi63E3CZeHPOnx8eWxEqdiAn1ufj5J89PtduEWyOYgkFBjBaSmlRR8m6%2F2HvM5pNdAdBGxsUg5ftoD1TrOQxrL7nh%2Fyqn0nLblJsth%2FaoK4Z1SVxeTg03iFRxOA5QKacTzp6FJYJKk%2FD2U0TDplchRt48bqcumQB90qB1xmeX6yaSgPHhAd6yNdx9diDIZZcA9YIBZc2z3eRkxA7BdJXYRCzEFVONO4udKhTI0eojQ4IEnwsVHXwcaH5ZWv2cICNmOqGNhyziomL2%2BdrmdkdyoGcUyQSDE5qhc6NvydN%2BS1xakBnBGmHit1EyXl%2Fc7EnRRZJxZUNcWJDPExsThiqdSTY9olOJvyYiwCESciCFob3WhZBAkYmsa%2FMdwGCJ8LiVxLxiM65%2F4gdjrjeeG24zuzBmfqxGeSBrIqpY4RKwrCOGfQanLfGYbYE91Gj%2FNMXPOezh%2F3AalXq7ZwtV%2F8SBmMDuRGqSnzXQuhIt1Or1fGokfD88KvUhglnrsP%2BKy7pUrhKVlmbD2l%2BSllkcxM6fQMcsx2iIzsZPpW34PYrptOJdHOILjd9FtbTUwbzNidS05XMMi2qdYGOqUBGmdorDq6GMCrG5O5GqmYBD%2BS1EqXhjlfgU5EeKiUq2cAE4LkkPQ4HAAYeNVBYpdIjBDUkaU0EczPVmlIn97i%2BPg9MaVWaxxPdk3yq7hlBviJov55bBvi9WQMN4T6bmYenFZGMr5mbH0t1597vCo22FOlr2JJ%2BxJN9YO1V6WkvreH9HL6AiCMGhTML%2Fi60fclS96OwWYAkN%2BhFRBWD23dieBYz5MN&X-Amz-Signature=fc74a7a92dbc9b555bd25996282b8dc57b1dabd409e225159c118e1bc03f9dd5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U5XEMXDN%2F20261010%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261010T163324Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCICjPNWwZdtxvPJPQi4H14PyLmsI826Z3CuvqcQgnQ4UaAiEAxAbQ4PQ8qEm42Z56ogmp1B5XsRbxnaRP0qJ8%2FJKW320q%2FwMIWBAAGgw2Mzc0MjMxODM4MDUiDOvqNepdhBX8i0XOiircA%2FTYyIRr9NiA2kCfFQOC7z1%2F02Sl2GLYC%2Fxoi%2F%2FxnxdllL%2FLJ6N9g6eV%2FQi63E3CZeHPOnx8eWxEqdiAn1ufj5J89PtduEWyOYgkFBjBaSmlRR8m6%2F2HvM5pNdAdBGxsUg5ftoD1TrOQxrL7nh%2Fyqn0nLblJsth%2FaoK4Z1SVxeTg03iFRxOA5QKacTzp6FJYJKk%2FD2U0TDplchRt48bqcumQB90qB1xmeX6yaSgPHhAd6yNdx9diDIZZcA9YIBZc2z3eRkxA7BdJXYRCzEFVONO4udKhTI0eojQ4IEnwsVHXwcaH5ZWv2cICNmOqGNhyziomL2%2BdrmdkdyoGcUyQSDE5qhc6NvydN%2BS1xakBnBGmHit1EyXl%2Fc7EnRRZJxZUNcWJDPExsThiqdSTY9olOJvyYiwCESciCFob3WhZBAkYmsa%2FMdwGCJ8LiVxLxiM65%2F4gdjrjeeG24zuzBmfqxGeSBrIqpY4RKwrCOGfQanLfGYbYE91Gj%2FNMXPOezh%2F3AalXq7ZwtV%2F8SBmMDuRGqSnzXQuhIt1Or1fGokfD88KvUhglnrsP%2BKy7pUrhKVlmbD2l%2BSllkcxM6fQMcsx2iIzsZPpW34PYrptOJdHOILjd9FtbTUwbzNidS05XMMi2qdYGOqUBGmdorDq6GMCrG5O5GqmYBD%2BS1EqXhjlfgU5EeKiUq2cAE4LkkPQ4HAAYeNVBYpdIjBDUkaU0EczPVmlIn97i%2BPg9MaVWaxxPdk3yq7hlBviJov55bBvi9WQMN4T6bmYenFZGMr5mbH0t1597vCo22FOlr2JJ%2BxJN9YO1V6WkvreH9HL6AiCMGhTML%2Fi60fclS96OwWYAkN%2BhFRBWD23dieBYz5MN&X-Amz-Signature=09bce922b03a210462b7f67bb637a9b321297b506ffd4faafbc8edc96ad4f63c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
