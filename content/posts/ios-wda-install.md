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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VTIHS2LW%2F20260912%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260912T143604Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIHohLwrDrkOBRXX%2Bi%2FMpHO22QQQdSSmcLp%2FjytVAH9ymAiBLOnJ%2FJdEJhojpLeBemoKwDAIaXQ1jlSS1oS56T52LgSqIBAi3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM3mvdgNQ1qN22R5gjKtwDkfEh8PrnOeJH57KFWAMlFMTyAbmNodXcuh5RT3azdgM6b3w8iqU4Hj%2FvZdnnw%2Fjrqeb%2BuxXw5LuvQVZRft6gCvNXFtA8FYWoLOi8oPoQNIA4Z0tbFLXnvgDdodg90FlUdot8bRXq%2FxTPsmCEdu%2F8TwsoXykc3Stk5YTPzblMBVd4%2FBSR2dfWv4M0Mn5sNba2cCzLp6UkZEEyjkJhAr6NeHp44oFkEkBhzxdJLk83up3rH5G22%2BgBtktu8m%2Fnj4E0H%2F4hxRRl9V4fvIwdPwHflFjMcvoacIV4sZEk4W84UeweEceWFhF%2BO5uea3GSaw379aL71JYLYMIcQQuvXngt6ISt4mKfPb5c0gh72CMX5kXcVCWBakRB%2BA%2F4Zv376iWsjOtCNgHivPrVpdTitgblNdnOmPE9d2rYduoRTAbINtWHFYqMx8qPaXKKtpG0J%2BxmdS7zOts7dpLLWz6rGNxCc7EjU5T1v74RLGiB0pZezd%2Bj%2Bb3WomMMAl6BeTxhLFOJBwqzc2xK6gQnejGwwLL%2BG%2BXxDDYsaFVmzOJoOFaGw9qiCBTKtBvVCxhk2JA5h3X%2FEcIXT4JGdT%2BHbu6UGoiCN7oWhn33lk5%2FQgTfY48nL110CqPv%2FFj2zD7DEtMw1aaV1QY6pgF2XYpUcs3tVgOXHMG9HAPaRNkEyTK13oAqunlwy29vd8ZuebCzx5gbNfLBndehkPSxQfXqbIThtv3yWWxVgi05AHOxQuLEigQd97grqGAHK352P7PAnKQYnBWNAhlHM1CYO6b86ditVtaKyEgPkA7fYyC1S3YtQonU4iB7YqbSViSk3IcI78Z%2BlM8NCds%2FBCpuoVw1qpR4nk2cPBdEcJgxbVzYmrzx&X-Amz-Signature=83c92701e6b21cf413589c5df3ef2551a262ea36402914bf3a9cefd752eddfe6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VTIHS2LW%2F20260912%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260912T143604Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIHohLwrDrkOBRXX%2Bi%2FMpHO22QQQdSSmcLp%2FjytVAH9ymAiBLOnJ%2FJdEJhojpLeBemoKwDAIaXQ1jlSS1oS56T52LgSqIBAi3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM3mvdgNQ1qN22R5gjKtwDkfEh8PrnOeJH57KFWAMlFMTyAbmNodXcuh5RT3azdgM6b3w8iqU4Hj%2FvZdnnw%2Fjrqeb%2BuxXw5LuvQVZRft6gCvNXFtA8FYWoLOi8oPoQNIA4Z0tbFLXnvgDdodg90FlUdot8bRXq%2FxTPsmCEdu%2F8TwsoXykc3Stk5YTPzblMBVd4%2FBSR2dfWv4M0Mn5sNba2cCzLp6UkZEEyjkJhAr6NeHp44oFkEkBhzxdJLk83up3rH5G22%2BgBtktu8m%2Fnj4E0H%2F4hxRRl9V4fvIwdPwHflFjMcvoacIV4sZEk4W84UeweEceWFhF%2BO5uea3GSaw379aL71JYLYMIcQQuvXngt6ISt4mKfPb5c0gh72CMX5kXcVCWBakRB%2BA%2F4Zv376iWsjOtCNgHivPrVpdTitgblNdnOmPE9d2rYduoRTAbINtWHFYqMx8qPaXKKtpG0J%2BxmdS7zOts7dpLLWz6rGNxCc7EjU5T1v74RLGiB0pZezd%2Bj%2Bb3WomMMAl6BeTxhLFOJBwqzc2xK6gQnejGwwLL%2BG%2BXxDDYsaFVmzOJoOFaGw9qiCBTKtBvVCxhk2JA5h3X%2FEcIXT4JGdT%2BHbu6UGoiCN7oWhn33lk5%2FQgTfY48nL110CqPv%2FFj2zD7DEtMw1aaV1QY6pgF2XYpUcs3tVgOXHMG9HAPaRNkEyTK13oAqunlwy29vd8ZuebCzx5gbNfLBndehkPSxQfXqbIThtv3yWWxVgi05AHOxQuLEigQd97grqGAHK352P7PAnKQYnBWNAhlHM1CYO6b86ditVtaKyEgPkA7fYyC1S3YtQonU4iB7YqbSViSk3IcI78Z%2BlM8NCds%2FBCpuoVw1qpR4nk2cPBdEcJgxbVzYmrzx&X-Amz-Signature=808bb20f9613a556ca21ca2ac348556e08e61064bcec693f3e7a0d22cc25c154&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
