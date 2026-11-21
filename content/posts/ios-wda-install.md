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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TVQNBZH6%2F20261121%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261121T223304Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCOKLpKAwWjLKQU%2BoQWTS09RGQiKeX6W8SLgUti1ONdwQIhAJsb5MR3WaBo1iR3ffF1X%2BLtlKtceuNkMaYKgxf0t%2FjMKv8DCE8QABoMNjM3NDIzMTgzODA1IgwMCs9RnIRZmVJ%2F99cq3APJ26D71voW8ixO2gUqn436CMm0Km4UBcF05P5YfG1J8krh66F9SoTh1bg8wnu5yp6AZ0nrenFPEs%2Bj9k7Z8dj42Qba%2BCCERwaLezAwfSJB%2BgubdarKlMuQts%2FKxCKThJdSzxfbbP9L7DxNMA%2F%2FkJrVfbBJaRdFNNfrqZ1%2BK7Q%2BAE6ZgGiLtVItrL6LLtGV38QTaBc1kkGHrQsqWD0MdUUp8DcWJnEek6tp%2BX%2FRXw1KLshll%2FxQmWWJjuLLYF1poWYidljnMDPjgKA5pjWR9Q9txz%2FL2onT7QUEcYj40oov7Co8ZMnLRCQuCWjNL7jRYwY%2FSunGW1ImzcxA1gpAKnt6QGso8KZww%2BJ6XRj%2FW0Vo2NfP1SaRP1ukt16WY%2F4ukgpv7F4iTzH4WkNUzdMp5SDxah60F98b8iIYEmqFNc3L%2F4yU3rQ%2FU8d8wl1F4ZrBYAQbhZFMyg8DeuBRaBTkO64s9fUrN23Sho%2BS%2F9Vx4HYgqpbCFLZT0VwrM0wY7KXeXmK%2B%2FHEWhCQzKzPFlwgeAkk6VEXe6uVkyj5LINJmW0DJnfL4lIEB%2FRbcCq6RvwNSozhPFWxUoie3Ry3R6oguw%2F3W2dMjrNmy2dpL4bkV%2Fb1106zhEfPmhdWLhB%2FTzDCRsIjYBjqkAc3F54r0It7yf3wpoL%2BrpWtj%2B2hyBZqjdy15eB%2BFcFNdIOW4B4QAi4hVZZHmzqi9phdrNHWY%2BH1hedRBo0QMXl7J0W85K6GAEYuOEnFmVVAKyiAhC7CNNuoyVz60fnwf3fhobHeqldscCaSneJ1JBDcMpD%2Fr8KrxA%2FUcdyfrogvKzW9HlCU%2FjmdS%2Bt%2BNgVwLVSbrCmtfoAWIl6y4YTBNIMuMYUHq&X-Amz-Signature=1e1d342a98be86d1929c23c2c553aa5ebd8db6b7741febdc6f4013d7bb04516c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TVQNBZH6%2F20261121%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261121T223304Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCOKLpKAwWjLKQU%2BoQWTS09RGQiKeX6W8SLgUti1ONdwQIhAJsb5MR3WaBo1iR3ffF1X%2BLtlKtceuNkMaYKgxf0t%2FjMKv8DCE8QABoMNjM3NDIzMTgzODA1IgwMCs9RnIRZmVJ%2F99cq3APJ26D71voW8ixO2gUqn436CMm0Km4UBcF05P5YfG1J8krh66F9SoTh1bg8wnu5yp6AZ0nrenFPEs%2Bj9k7Z8dj42Qba%2BCCERwaLezAwfSJB%2BgubdarKlMuQts%2FKxCKThJdSzxfbbP9L7DxNMA%2F%2FkJrVfbBJaRdFNNfrqZ1%2BK7Q%2BAE6ZgGiLtVItrL6LLtGV38QTaBc1kkGHrQsqWD0MdUUp8DcWJnEek6tp%2BX%2FRXw1KLshll%2FxQmWWJjuLLYF1poWYidljnMDPjgKA5pjWR9Q9txz%2FL2onT7QUEcYj40oov7Co8ZMnLRCQuCWjNL7jRYwY%2FSunGW1ImzcxA1gpAKnt6QGso8KZww%2BJ6XRj%2FW0Vo2NfP1SaRP1ukt16WY%2F4ukgpv7F4iTzH4WkNUzdMp5SDxah60F98b8iIYEmqFNc3L%2F4yU3rQ%2FU8d8wl1F4ZrBYAQbhZFMyg8DeuBRaBTkO64s9fUrN23Sho%2BS%2F9Vx4HYgqpbCFLZT0VwrM0wY7KXeXmK%2B%2FHEWhCQzKzPFlwgeAkk6VEXe6uVkyj5LINJmW0DJnfL4lIEB%2FRbcCq6RvwNSozhPFWxUoie3Ry3R6oguw%2F3W2dMjrNmy2dpL4bkV%2Fb1106zhEfPmhdWLhB%2FTzDCRsIjYBjqkAc3F54r0It7yf3wpoL%2BrpWtj%2B2hyBZqjdy15eB%2BFcFNdIOW4B4QAi4hVZZHmzqi9phdrNHWY%2BH1hedRBo0QMXl7J0W85K6GAEYuOEnFmVVAKyiAhC7CNNuoyVz60fnwf3fhobHeqldscCaSneJ1JBDcMpD%2Fr8KrxA%2FUcdyfrogvKzW9HlCU%2FjmdS%2Bt%2BNgVwLVSbrCmtfoAWIl6y4YTBNIMuMYUHq&X-Amz-Signature=8e3f2f92091bffa34c4d12de48f9b966e47f17c4b3458cdc202e33c9432e7262&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
