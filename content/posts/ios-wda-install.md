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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666OKYLAH4%2F20260831%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260831T021339Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQC9rI7ARFDknDsqbaw4wQd6mNBCZQ4d2dK6QQ8dT6Nw9gIhAK8nAWRfjCc31sdPY%2BtysuofYEeUaz2GRTpM8Q05vEf%2BKogECIr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxCrExfwv2R1iOoVDIq3AMd2ZqrM1dBpgA%2BYJePxhq0e6s9uHA1hyAAb8k0NYm3nD7l9QbIwFyqaGhU2NRqml%2BXxHi73geZyQjU%2F1QslxOjZqpN%2FuWtJMS35qf6XFulqwdRtEFB98txgz0mUm1oz8wTaNnU7wHRG%2BbHRUABRgVGtSu4F3mrtdFINNiQbl3lJtj3KTUo1m9fgyemAMrowsAwl38X%2Bopu3jJpGX90sIOeoLqMuUEAk62ouFUTrMDAZoVwViW%2B%2F268BadRIk3z%2B%2F7AsV21wAdSJxkIFMcgG4KTuZBxbI86p%2FIILSltn1lRneeBVyRpBfjtIUogiYxvzOs5EWbN5PyjbP4OdZAdxfjIXkqKIvnzY2ukDdYkmeRsSrewXJSqNZ8qJeJMHoE9REephF1%2FAowyJNxlWK1eanGWUu3Xgkiwif%2F2QipEhX61Ro1BJMUo0uOM2gSWX1a0cMT7Knfj%2Bo9Se2fPdIC7%2FcvQUQCe%2BHAB7TcwiZqDdcsDqqw9NWhQ4L3vh6jBh1KXOxOyiKQcf1SiEVTlO5v62W0aD3I4L6dA69j1KL24%2BAjvo3XzIWat42KAHmWWmAwM5qeiTTrhXaULIVo3b%2F1YLifargwUeYoKmpavka3HYwQH4xfD9Q5k5kNqqUZs0zD6qdPUBjqkAcXrKDH%2FlrK6yfgkSkthItILcjEinCbJqidgsAr9U3WxsvpQW39Q%2FYJqz%2BMYANtt1atScd8HCKu5H8MPBLXpevDK%2FGOKFexII72UoYKa8TO%2BoAcWMcdZw6pvUXQcggG7yOvTlETdexPXS%2FifeSsaNcZYlckYCgBSdGlacZvtK8yfJ9Z0AHdNphiMRnW7G41mNyNIWqpvFicWwbLVqxAzrSES4nJ4&X-Amz-Signature=97d2f1f9e7304a8f43a2c7525eb0ea848f12c3745b2e743040061ab6d48976f3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666OKYLAH4%2F20260831%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260831T021340Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQC9rI7ARFDknDsqbaw4wQd6mNBCZQ4d2dK6QQ8dT6Nw9gIhAK8nAWRfjCc31sdPY%2BtysuofYEeUaz2GRTpM8Q05vEf%2BKogECIr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxCrExfwv2R1iOoVDIq3AMd2ZqrM1dBpgA%2BYJePxhq0e6s9uHA1hyAAb8k0NYm3nD7l9QbIwFyqaGhU2NRqml%2BXxHi73geZyQjU%2F1QslxOjZqpN%2FuWtJMS35qf6XFulqwdRtEFB98txgz0mUm1oz8wTaNnU7wHRG%2BbHRUABRgVGtSu4F3mrtdFINNiQbl3lJtj3KTUo1m9fgyemAMrowsAwl38X%2Bopu3jJpGX90sIOeoLqMuUEAk62ouFUTrMDAZoVwViW%2B%2F268BadRIk3z%2B%2F7AsV21wAdSJxkIFMcgG4KTuZBxbI86p%2FIILSltn1lRneeBVyRpBfjtIUogiYxvzOs5EWbN5PyjbP4OdZAdxfjIXkqKIvnzY2ukDdYkmeRsSrewXJSqNZ8qJeJMHoE9REephF1%2FAowyJNxlWK1eanGWUu3Xgkiwif%2F2QipEhX61Ro1BJMUo0uOM2gSWX1a0cMT7Knfj%2Bo9Se2fPdIC7%2FcvQUQCe%2BHAB7TcwiZqDdcsDqqw9NWhQ4L3vh6jBh1KXOxOyiKQcf1SiEVTlO5v62W0aD3I4L6dA69j1KL24%2BAjvo3XzIWat42KAHmWWmAwM5qeiTTrhXaULIVo3b%2F1YLifargwUeYoKmpavka3HYwQH4xfD9Q5k5kNqqUZs0zD6qdPUBjqkAcXrKDH%2FlrK6yfgkSkthItILcjEinCbJqidgsAr9U3WxsvpQW39Q%2FYJqz%2BMYANtt1atScd8HCKu5H8MPBLXpevDK%2FGOKFexII72UoYKa8TO%2BoAcWMcdZw6pvUXQcggG7yOvTlETdexPXS%2FifeSsaNcZYlckYCgBSdGlacZvtK8yfJ9Z0AHdNphiMRnW7G41mNyNIWqpvFicWwbLVqxAzrSES4nJ4&X-Amz-Signature=bd642139187ab914ddfc495fc34692b58883bcb1348aeb1329fc89a076cea306&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
