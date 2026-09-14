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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SUBIM2FQ%2F20260914%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260914T210907Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECQaCXVzLXdlc3QtMiJIMEYCIQDJosuJmECHEp4jM2kLLCiVZ6MqODoYkQck1pLu3VNydQIhAOIXDgHYy0%2FBxG%2B%2BMjKycLq9%2BQb2C7XaO0PQ0jofXYtYKogECO3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igzhg92iTN5LKakk8JUq3APT0L6JtBnMkWi%2B5sfJgFwDIpiF3%2F4GlHj8cJ7eZTWLf8%2FqLizdFf6V9RH%2BN6k9EZ89oIG1G0cEAqq38caFwgKl5wS7j8ipO2qF1k2Pl6o3SqP2vFRktLBJqSCAklSqQ%2Bx0HkOpgo1pwoDnNUpIE6dLYACmHV%2Bh%2BO%2Fv%2B%2Fu0i8TFwm6bf5lJGiLWNqS9pP%2FQCGK%2Bd2RnZlR8nNwBg8%2FC1W6%2FJhdJRZhl5lFYHp03g2yjsBDo9T98II70Jo4OO1gDwHs3q3z0sGmT3ZX4JTT3H1vHPjtnsoDcSMCbiWMSyV1ksQJ6xRfgAtF8PEVb6d6fzkqbGSST%2FLmSxjVeZx6QD4uGiYPS7m1P06wkIdmNRJh4M24G1DVdeh1RKDpRMqHCE1BpP5If8ZYE%2F9eeFdII%2B1Wgvh8m2CLvyoWMYP6f%2BY8yJkDgu10VFMtnmZoTfR9Z8p%2FsLNJ7fZIv%2BrqaRFfDFkZCWa8ohoQRHNBlGIbg25cX219PtZwBIyCJFESycmXSwBo%2FV4jsHcxXW1dBASmvH77RobSnMbJRv6oHa9eSrrdvhY063yL04PsLOVIi%2FzaYjRurFd%2BnuGchIRdA5OcECP8JAJ88GpiZ9W15c1Ja71l5tAnVJuiaC8SJ5FWHyzCHpqHVBjqkAQT9p15HPCf7nH0QP6UF2xKOGPnIgrVfslVbNMPP7%2FsVawS%2FTe00fWZbJWtw%2B%2Fm0yKT%2B940iIEVMIBWIiXduG%2BO7aFex4j739AqPkbi1jqxfIqKQFg%2BIdW0eVEhCMuiPUrQocXQNb4mO2CUJSSJUN0TpodeBMUF8Kk27apwleUi%2FXCr%2F8IpmE%2F8xJek5sJK4Jq1kAfpBfZkxImYtkHs9wjdItmoA&X-Amz-Signature=659f132cf2222888b1ddfd0264690d059a7a43ab15e28267a24991dfa6adaf20&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SUBIM2FQ%2F20260914%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260914T210907Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECQaCXVzLXdlc3QtMiJIMEYCIQDJosuJmECHEp4jM2kLLCiVZ6MqODoYkQck1pLu3VNydQIhAOIXDgHYy0%2FBxG%2B%2BMjKycLq9%2BQb2C7XaO0PQ0jofXYtYKogECO3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igzhg92iTN5LKakk8JUq3APT0L6JtBnMkWi%2B5sfJgFwDIpiF3%2F4GlHj8cJ7eZTWLf8%2FqLizdFf6V9RH%2BN6k9EZ89oIG1G0cEAqq38caFwgKl5wS7j8ipO2qF1k2Pl6o3SqP2vFRktLBJqSCAklSqQ%2Bx0HkOpgo1pwoDnNUpIE6dLYACmHV%2Bh%2BO%2Fv%2B%2Fu0i8TFwm6bf5lJGiLWNqS9pP%2FQCGK%2Bd2RnZlR8nNwBg8%2FC1W6%2FJhdJRZhl5lFYHp03g2yjsBDo9T98II70Jo4OO1gDwHs3q3z0sGmT3ZX4JTT3H1vHPjtnsoDcSMCbiWMSyV1ksQJ6xRfgAtF8PEVb6d6fzkqbGSST%2FLmSxjVeZx6QD4uGiYPS7m1P06wkIdmNRJh4M24G1DVdeh1RKDpRMqHCE1BpP5If8ZYE%2F9eeFdII%2B1Wgvh8m2CLvyoWMYP6f%2BY8yJkDgu10VFMtnmZoTfR9Z8p%2FsLNJ7fZIv%2BrqaRFfDFkZCWa8ohoQRHNBlGIbg25cX219PtZwBIyCJFESycmXSwBo%2FV4jsHcxXW1dBASmvH77RobSnMbJRv6oHa9eSrrdvhY063yL04PsLOVIi%2FzaYjRurFd%2BnuGchIRdA5OcECP8JAJ88GpiZ9W15c1Ja71l5tAnVJuiaC8SJ5FWHyzCHpqHVBjqkAQT9p15HPCf7nH0QP6UF2xKOGPnIgrVfslVbNMPP7%2FsVawS%2FTe00fWZbJWtw%2B%2Fm0yKT%2B940iIEVMIBWIiXduG%2BO7aFex4j739AqPkbi1jqxfIqKQFg%2BIdW0eVEhCMuiPUrQocXQNb4mO2CUJSSJUN0TpodeBMUF8Kk27apwleUi%2FXCr%2F8IpmE%2F8xJek5sJK4Jq1kAfpBfZkxImYtkHs9wjdItmoA&X-Amz-Signature=7d680fe705c0d4e6a074ea3196d3fda83763b7a928ba8f963a14740cb411b892&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
