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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RKYMXJQB%2F20261108%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261108T031500Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDsaCXVzLXdlc3QtMiJIMEYCIQC9%2FWx4ewcddDNmAj3WUk6KrtNTHNLbNRiW72d8uS45CQIhALDv5nemJTTAdtZwOwbavJ%2FDqshmGZicU%2BiOdjtgjxFLKv8DCAQQABoMNjM3NDIzMTgzODA1IgySQw3RcXeOStRMh%2BYq3AOKQn%2B%2BKshHLlRawVeyXZtPNxfnmQ6uWs5ICCSIGs2twT5NmPFlh5A6egLoziUNahSi%2F5YiEqU%2FEJLfk0HgL1EMrmLHSYR4JmNU8XfWpCn55H2oKNkDn8uWK7IoNVBU%2F9ivVJV1%2FQixUL7guHGlNvboH7RYOeKJTxIxmIh7Lvuk2BLuGXePTFh%2FcBP1wwCBNm4UvELb%2Fy6GHDKGC89v%2BxDla3FYFkCvTbKCK6vgDQMelebyE5zZr2bY68C7HGBJPsRfCy8%2FFjscX9zRWJt20r%2B2B%2BvbNcnoawxxQGlq%2FqMQD%2FNNET1mJtKtY4%2F41FN4lO1F39A9vQ5E1BEZv%2Bma2oFpXPnJDj2Sk0xR3TmdLgHAz6f%2F8TllbkJ5Cves%2BvCAWkeO2QOOUG7QKeG4ti60LCgzsN1WDF9THDLybndDtR%2FU9qZ7xiRmkWvsp6l7323Ku1JYWoRXfuAYyLPmjqVJJlCvCk80yhXP%2FImrWxhTqwSu7mjOSi00BwjwHV11x3tobtq1uEkVhw8FFdUMY5J%2FtgjYCU9dRJ6sJ58Oew43U0UooQ%2B9JhmKBwCJnweuu2LxHrsyCCaTwyWzH8zFbeuB1eHf1%2B7EUr4P%2B6xqPET6wVwnqomyoELzmZTCDblwzjDFzL%2FXBjqkAVtx6BhstsY%2FWvtNEWNzQ8R4vk81dU6Vq2y6xluWO3ZSODxuL4cmdaykJ2IJ6p%2BOcJul%2Bp02f32R3HQ5419su3EbcHAT5hTXoyPmFz0XSa29211KtkH91lw9UEkaUTXJE39Y7HpTcYWqWPN2TpnGMUscaO2AhQK3vzLOQarNXkvtvZqyVeowuubphwPZAqnXv58%2FuvK%2By96E6lvuDWShdMhRNxeN&X-Amz-Signature=d21357da5cc3e88bd829f9e8aed48e10190f2fbbb2dc90719877cec6b8ff6177&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RKYMXJQB%2F20261108%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261108T031500Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDsaCXVzLXdlc3QtMiJIMEYCIQC9%2FWx4ewcddDNmAj3WUk6KrtNTHNLbNRiW72d8uS45CQIhALDv5nemJTTAdtZwOwbavJ%2FDqshmGZicU%2BiOdjtgjxFLKv8DCAQQABoMNjM3NDIzMTgzODA1IgySQw3RcXeOStRMh%2BYq3AOKQn%2B%2BKshHLlRawVeyXZtPNxfnmQ6uWs5ICCSIGs2twT5NmPFlh5A6egLoziUNahSi%2F5YiEqU%2FEJLfk0HgL1EMrmLHSYR4JmNU8XfWpCn55H2oKNkDn8uWK7IoNVBU%2F9ivVJV1%2FQixUL7guHGlNvboH7RYOeKJTxIxmIh7Lvuk2BLuGXePTFh%2FcBP1wwCBNm4UvELb%2Fy6GHDKGC89v%2BxDla3FYFkCvTbKCK6vgDQMelebyE5zZr2bY68C7HGBJPsRfCy8%2FFjscX9zRWJt20r%2B2B%2BvbNcnoawxxQGlq%2FqMQD%2FNNET1mJtKtY4%2F41FN4lO1F39A9vQ5E1BEZv%2Bma2oFpXPnJDj2Sk0xR3TmdLgHAz6f%2F8TllbkJ5Cves%2BvCAWkeO2QOOUG7QKeG4ti60LCgzsN1WDF9THDLybndDtR%2FU9qZ7xiRmkWvsp6l7323Ku1JYWoRXfuAYyLPmjqVJJlCvCk80yhXP%2FImrWxhTqwSu7mjOSi00BwjwHV11x3tobtq1uEkVhw8FFdUMY5J%2FtgjYCU9dRJ6sJ58Oew43U0UooQ%2B9JhmKBwCJnweuu2LxHrsyCCaTwyWzH8zFbeuB1eHf1%2B7EUr4P%2B6xqPET6wVwnqomyoELzmZTCDblwzjDFzL%2FXBjqkAVtx6BhstsY%2FWvtNEWNzQ8R4vk81dU6Vq2y6xluWO3ZSODxuL4cmdaykJ2IJ6p%2BOcJul%2Bp02f32R3HQ5419su3EbcHAT5hTXoyPmFz0XSa29211KtkH91lw9UEkaUTXJE39Y7HpTcYWqWPN2TpnGMUscaO2AhQK3vzLOQarNXkvtvZqyVeowuubphwPZAqnXv58%2FuvK%2By96E6lvuDWShdMhRNxeN&X-Amz-Signature=c2454cb5c848ee1210f75260da7802e74a99e2bc58de9d2defabea938f269ddc&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
