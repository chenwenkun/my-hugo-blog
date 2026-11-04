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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VQU52XKD%2F20261104%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261104T225841Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQD3yZJotJhu7KzoXgPA7uELUO9FUnPh3oP%2BCUtPYwszlQIgH0oN7PULjM8PFuxkcS3ecrCdcv%2FwFjWal0I4%2FhzoqeAqiAQItv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDEc%2BIKgidglJ48hOZyrcAz%2F3Qt5VSGCaLMwxRf8qDlUJfGYCd1hheLVbahaKl3I1vVOE5ypLoZrplwHZqaN2Ya5baIi0YnvqmCN1ih5Bsz46QpiBr1pKGSV8FtCDGpiGjUUL9OZI%2Brrek3AXNZfEmJAlfjJsRgzJChBIKvIH%2BNE9%2FxZT6swSKNMMp5xYePZZDRx6%2F7YfP1zGgJjGbkYL1xPxsVay8Su%2F0JDQ6qdkTqACLOCnN%2BMWiMnaC8gS7i7P82w373tYeeY%2BmryQKHK%2B%2BfeLmWWgdXGpOj3zZpz%2BKpp0JqqEbbTe7powkDK5%2BmrjObSGaYsLVvFZSw5tnQjHRKXPxCwdGBEtINgTCRHrp%2FlpK%2B7%2BSZslbHCmDt23M3gHWnBzYRK7%2FDdE6XsSBBYvNUGyUyo5KRSkDz15c8rhjX4OMCSfjo2NseqzJIiKxDohsk8CnSwboZkl3Ub%2F3NrFw0Rzm5FwtTTYIQQ05y%2BPoWZTs84dj2iwph6HtMPNEOuhBIl8xYRAr95dyg%2Fs%2BavjJYabZO%2F%2FHM9LSk7etseCIcBFrFvt%2B%2BsdvJFW3fbwxZtx3TB9XmsgRqkCmdtzR43nXwuoSD%2FP6AxVBYQ5YI02ZfMX%2BT%2BPibNps3MJlOBgAEZ19u2%2ByO6KHf7JpikzMP3NrtcGOqUBZdDMWZC%2F8lJ%2Fpv%2BP3cLkoDzR9uAqTvh044zl6%2Fwxi11r%2BwmwOvnaOPU0BJ2W8SSMgShFvLAeYrcqQbH56Q6UJi7zZuteHKu6AFJ3fnX3L%2BjQ%2BTPR5PWMl6QZUejBUYyJzKKyjQXeQ2jzwPf5Yb%2B7F48iJyvAfUMjhjH0SK3rTlA62v5U9s9TQyA9FM7eUDyQJ42TtNh%2BawCmVcIDtr4sJ6lXRBUU&X-Amz-Signature=ec71f62b3ef64692ff12505670868d15397e681ae5d9f3896fdbf7006a2f1fa6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VQU52XKD%2F20261104%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261104T225841Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQD3yZJotJhu7KzoXgPA7uELUO9FUnPh3oP%2BCUtPYwszlQIgH0oN7PULjM8PFuxkcS3ecrCdcv%2FwFjWal0I4%2FhzoqeAqiAQItv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDEc%2BIKgidglJ48hOZyrcAz%2F3Qt5VSGCaLMwxRf8qDlUJfGYCd1hheLVbahaKl3I1vVOE5ypLoZrplwHZqaN2Ya5baIi0YnvqmCN1ih5Bsz46QpiBr1pKGSV8FtCDGpiGjUUL9OZI%2Brrek3AXNZfEmJAlfjJsRgzJChBIKvIH%2BNE9%2FxZT6swSKNMMp5xYePZZDRx6%2F7YfP1zGgJjGbkYL1xPxsVay8Su%2F0JDQ6qdkTqACLOCnN%2BMWiMnaC8gS7i7P82w373tYeeY%2BmryQKHK%2B%2BfeLmWWgdXGpOj3zZpz%2BKpp0JqqEbbTe7powkDK5%2BmrjObSGaYsLVvFZSw5tnQjHRKXPxCwdGBEtINgTCRHrp%2FlpK%2B7%2BSZslbHCmDt23M3gHWnBzYRK7%2FDdE6XsSBBYvNUGyUyo5KRSkDz15c8rhjX4OMCSfjo2NseqzJIiKxDohsk8CnSwboZkl3Ub%2F3NrFw0Rzm5FwtTTYIQQ05y%2BPoWZTs84dj2iwph6HtMPNEOuhBIl8xYRAr95dyg%2Fs%2BavjJYabZO%2F%2FHM9LSk7etseCIcBFrFvt%2B%2BsdvJFW3fbwxZtx3TB9XmsgRqkCmdtzR43nXwuoSD%2FP6AxVBYQ5YI02ZfMX%2BT%2BPibNps3MJlOBgAEZ19u2%2ByO6KHf7JpikzMP3NrtcGOqUBZdDMWZC%2F8lJ%2Fpv%2BP3cLkoDzR9uAqTvh044zl6%2Fwxi11r%2BwmwOvnaOPU0BJ2W8SSMgShFvLAeYrcqQbH56Q6UJi7zZuteHKu6AFJ3fnX3L%2BjQ%2BTPR5PWMl6QZUejBUYyJzKKyjQXeQ2jzwPf5Yb%2B7F48iJyvAfUMjhjH0SK3rTlA62v5U9s9TQyA9FM7eUDyQJ42TtNh%2BawCmVcIDtr4sJ6lXRBUU&X-Amz-Signature=e1680c46282ca108f648a8902b1eb1ac2e6c337fc320d45ea283f19c68d1a367&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
