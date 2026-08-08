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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QXTKZ3I4%2F20260808%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260808T063309Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIHqK3Vh27zmH16FfG%2BwfrbXEEBSsk0TL5pssI9U%2BokDPAiAOAs10Cwe1Nai6A60vGfn8AU6zZu94olxhxNXjyga4Tir%2FAwhmEAAaDDYzNzQyMzE4MzgwNSIMUXtejKqqe%2FikhgHjKtwDPpb%2BKKuY7FMdt4Lf2%2BfsK5B9QjuszZKgdv%2FjylD7CQO3L%2BFToVX5RS7YlwV%2FqUHv%2BPS%2Bs0U9r2KZeMDm4iJBLpVCY74iEIqOMTnfzzd1DarHRhQxzFy8ovN9TsWHDkw2B6DpnWLkplyld%2FRysQM6zOip8jE97spZ38EPLe%2FlHvzlCB6QfJmVAEJF5beV2vIsvsLpE8OWr1HA0YkwOjs6BDmRbo4yR8Y3Q5cjewrbzaFPA7T%2BqCQ2xwqsvd%2F1OjRTjHRf0Mm%2Fi%2BNa6BRMmmmW1MXkysh4KNsdhTb%2FlPF%2F%2F6mAm2C5Eb53H822gsZFLH5ot0G%2BN6muM%2BPxVhZiJsNc%2BRjHM96FG%2B1ACqgi5bIRpWtEYEQSQz29%2BzsCqN0XJT01tANECJCVUGySnZjTCb6RdSdnV4qO%2BmbHNXWVP9hLJ6JD6ZC1W8mPq33%2BULYawrtL5%2B%2FSt1xaHPGWT9a8jN14w%2BeeNsib8aArcDvJZ3mESQQy3uQU0Jc18mB9ZmcWsyBu2qPC5MmpJOyXc4A%2Fp%2BnsV3ZwhmEtHoOPO5PNhMrMeDlumhgEK29YuqUn%2Bg2TScfE022EsFz%2BLbBZSa9TAdKDi51zDNwStAPsUJfO%2BTQ08fx8%2BvsWUo0z1%2FGP7mQw1O3a0wY6pgF3iSYqidT%2FiI6LDSud6KQTHMmHILtAm1YCli5XAWHJtlKw7Zy7e4RZFpLvol3whAge0G0Trm%2BR%2FsQfrPeFiukp%2FCA2cli4TYGg%2FsC8EvG0v%2BBL6d50%2FDQ%2FLRd0HbYVKEmEQqkmxIfPTDgKaIuJp0O2jPG9UE%2F42hxCGLHqm4GlSs%2Bql6Lbchf6V41S3sES1vqG4AVguE7TS%2FdOdEr4horcItJucso9&X-Amz-Signature=d1c978304b99fe1dacf3b2a0a9d9d9bf5ae3b5798e9339bac163b5521d27e948&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QXTKZ3I4%2F20260808%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260808T063310Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIHqK3Vh27zmH16FfG%2BwfrbXEEBSsk0TL5pssI9U%2BokDPAiAOAs10Cwe1Nai6A60vGfn8AU6zZu94olxhxNXjyga4Tir%2FAwhmEAAaDDYzNzQyMzE4MzgwNSIMUXtejKqqe%2FikhgHjKtwDPpb%2BKKuY7FMdt4Lf2%2BfsK5B9QjuszZKgdv%2FjylD7CQO3L%2BFToVX5RS7YlwV%2FqUHv%2BPS%2Bs0U9r2KZeMDm4iJBLpVCY74iEIqOMTnfzzd1DarHRhQxzFy8ovN9TsWHDkw2B6DpnWLkplyld%2FRysQM6zOip8jE97spZ38EPLe%2FlHvzlCB6QfJmVAEJF5beV2vIsvsLpE8OWr1HA0YkwOjs6BDmRbo4yR8Y3Q5cjewrbzaFPA7T%2BqCQ2xwqsvd%2F1OjRTjHRf0Mm%2Fi%2BNa6BRMmmmW1MXkysh4KNsdhTb%2FlPF%2F%2F6mAm2C5Eb53H822gsZFLH5ot0G%2BN6muM%2BPxVhZiJsNc%2BRjHM96FG%2B1ACqgi5bIRpWtEYEQSQz29%2BzsCqN0XJT01tANECJCVUGySnZjTCb6RdSdnV4qO%2BmbHNXWVP9hLJ6JD6ZC1W8mPq33%2BULYawrtL5%2B%2FSt1xaHPGWT9a8jN14w%2BeeNsib8aArcDvJZ3mESQQy3uQU0Jc18mB9ZmcWsyBu2qPC5MmpJOyXc4A%2Fp%2BnsV3ZwhmEtHoOPO5PNhMrMeDlumhgEK29YuqUn%2Bg2TScfE022EsFz%2BLbBZSa9TAdKDi51zDNwStAPsUJfO%2BTQ08fx8%2BvsWUo0z1%2FGP7mQw1O3a0wY6pgF3iSYqidT%2FiI6LDSud6KQTHMmHILtAm1YCli5XAWHJtlKw7Zy7e4RZFpLvol3whAge0G0Trm%2BR%2FsQfrPeFiukp%2FCA2cli4TYGg%2FsC8EvG0v%2BBL6d50%2FDQ%2FLRd0HbYVKEmEQqkmxIfPTDgKaIuJp0O2jPG9UE%2F42hxCGLHqm4GlSs%2Bql6Lbchf6V41S3sES1vqG4AVguE7TS%2FdOdEr4horcItJucso9&X-Amz-Signature=bb63bc67ebaff84a869ddc8cfc0b16d51f70534f0b05f6e505eff2b3f9f76420&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
