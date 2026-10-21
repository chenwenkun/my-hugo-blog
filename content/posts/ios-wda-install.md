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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46654LE4CEY%2F20261021%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261021T104730Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQC2eLK0E14%2BPltKnpqBM9uHDsFspSaiLShfdsz3hJX9gQIhAOXeXLfD3piZj%2FsiWsnZre%2FA6iZhO22xhCzW4ZldiY7DKv8DCFoQABoMNjM3NDIzMTgzODA1Igxt%2FjdnNro2vdmyxp8q3AP%2Bj77NhZT5g4Me4%2FkkARN7zNj8AsSUPtDqfplwdC5V3Kw6K%2B82kCePvqrxdphuLVo5pmR2wtpkgYQ5aLmrZotuIblZI5QZHTsxPwXuCS%2BCDh0E5IbpbAIrtvFkO7mCMeRIJrWE3s87%2BO%2FsRsrrI%2BbVTpNtsVp50YotQGJAY%2FDsAGb%2BloV3r2TUhEEfUn0krzXEeXUVCUQcMlhBWWOCN6M3wb8ZN5ktcTLfdO4i4WB4SraH5JcuMggliAvMGUB%2Fdm4ytexBvHrLuPbJyELo9%2F1kLqVSCO2WDCIyRamA4k4oHS3tiraX%2B4VkePVC8LEaVul0KYdmQ1b6JdevOEMidVGWPdACA5AOTj1Qe2jZrCVk1oh6Tb%2FfL80GqNcBZQoe%2FFx5KXvk%2BlzxoVZqINchupChBpgPTvfI2keWiTUpDYj7BcMSxhooeYTUBuwTHxPb6A5RL4MLGckwHWLajTbCDfvJ0NMGY5Hj8iJ41DycBlvlsyTUN%2FwSjotCdXGpciEqiH4meHsp4CSmmwBWbfDEdKvAEp0HlwWaBEK7AJyXxpsZC4mFM4qDGLoRfmFmjKzxnwQ5JzodczMMeBMlWrLir9mUpGTc%2BauUiYHNeBPskH0mPxYnXwS%2Faww1UHAnkDDjlOLWBjqkAe%2FKhoit8JcwNyCekSVqyD6o7NiUmCoGoEn0smZ9vyxClVhG6JGJC7LaKtfketnbQqd3FspmJ0f%2FKiP%2BSzH35BQVghENthUDSzpuPeLh6sJQJfd0SNXiFS0eBaRaDMIv8yGIAUzIMr8StwmAbXFYmB31ZQRVZSCsYUT7SiYACdHS08rM%2B2LKQzl1jqAJgo1OsCSYApmKn5DlUmQ5AwqllX8P5s9G&X-Amz-Signature=0cc5162dd0c577e396b1155dc1ce7cd7ee6d87ea3d9c296aaef50c3d7451ab60&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46654LE4CEY%2F20261021%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261021T104730Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQC2eLK0E14%2BPltKnpqBM9uHDsFspSaiLShfdsz3hJX9gQIhAOXeXLfD3piZj%2FsiWsnZre%2FA6iZhO22xhCzW4ZldiY7DKv8DCFoQABoMNjM3NDIzMTgzODA1Igxt%2FjdnNro2vdmyxp8q3AP%2Bj77NhZT5g4Me4%2FkkARN7zNj8AsSUPtDqfplwdC5V3Kw6K%2B82kCePvqrxdphuLVo5pmR2wtpkgYQ5aLmrZotuIblZI5QZHTsxPwXuCS%2BCDh0E5IbpbAIrtvFkO7mCMeRIJrWE3s87%2BO%2FsRsrrI%2BbVTpNtsVp50YotQGJAY%2FDsAGb%2BloV3r2TUhEEfUn0krzXEeXUVCUQcMlhBWWOCN6M3wb8ZN5ktcTLfdO4i4WB4SraH5JcuMggliAvMGUB%2Fdm4ytexBvHrLuPbJyELo9%2F1kLqVSCO2WDCIyRamA4k4oHS3tiraX%2B4VkePVC8LEaVul0KYdmQ1b6JdevOEMidVGWPdACA5AOTj1Qe2jZrCVk1oh6Tb%2FfL80GqNcBZQoe%2FFx5KXvk%2BlzxoVZqINchupChBpgPTvfI2keWiTUpDYj7BcMSxhooeYTUBuwTHxPb6A5RL4MLGckwHWLajTbCDfvJ0NMGY5Hj8iJ41DycBlvlsyTUN%2FwSjotCdXGpciEqiH4meHsp4CSmmwBWbfDEdKvAEp0HlwWaBEK7AJyXxpsZC4mFM4qDGLoRfmFmjKzxnwQ5JzodczMMeBMlWrLir9mUpGTc%2BauUiYHNeBPskH0mPxYnXwS%2Faww1UHAnkDDjlOLWBjqkAe%2FKhoit8JcwNyCekSVqyD6o7NiUmCoGoEn0smZ9vyxClVhG6JGJC7LaKtfketnbQqd3FspmJ0f%2FKiP%2BSzH35BQVghENthUDSzpuPeLh6sJQJfd0SNXiFS0eBaRaDMIv8yGIAUzIMr8StwmAbXFYmB31ZQRVZSCsYUT7SiYACdHS08rM%2B2LKQzl1jqAJgo1OsCSYApmKn5DlUmQ5AwqllX8P5s9G&X-Amz-Signature=21acfdabe4f2442dc90bbfd7b8fe47d1b9f9bd1cbcd8e9161f740a53347b0080&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
