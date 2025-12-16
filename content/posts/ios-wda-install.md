---
title: iOS WDA作为App独立运行
date: '2025-09-25'
tags:
  - 技术
draft: false
author: chenwenkun
toc: false
show_reading_time: true
---
测试系统 16.6 运行闪退

18.3 18.4系统正常安装

代码地址：

本来是 facebook 的项目，目前由 appium 进行维护

代码下载

先在xcode 构建一次，修改Bundle Identifier，勾选自己的 appleid

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZHVL2GGD%2F20251216%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251216T181820Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCICjDB6PgEdHFNEgQ3jHk%2BjFTCrob30dIFoiGktJUwDtpAiEA7USFiDmtLJuiijbxcWuXo2DPrIS3yMK6UJXiCRg8aAkq%2FwMIaxAAGgw2Mzc0MjMxODM4MDUiDD6vmOqVuiyfseMwJSrcAzNSq6fxcYJf1aLuQ9l4atSRn2yAXpORWY4SJo%2F7OzcocNfwwJIjoNpGaPJkMsZMJxlpB3ZsLGqGkqz%2BDM0eDVSjgSIWCAjlkVRYxpBgFMyztd3n9b5%2FHHTfAudjfNs8T79O0zmGoErtJ7IuKms25sieXVecIFP96yv9kftMUJy0el1cHFxOvHI9JNWbQ2tweSTuCiDBaVGfk9WekPBIQD3UgUMsTVFHo%2F6D5jppos3ZfVI3DnSHOtGAfC7f6Ue9Q%2FB8aWJpyNhAWMlypj37FAmH7eOClB4gm8ZJPYAFEKnSFiwaaWxTk9rQbUnXDgGkw4M5JZ1R3ZxQlidwlF1Wu2IqdMOac%2Btt%2BxQBMuiLH7a8c3C6kHGgoXM7hXzwIL98agYVspAglWaR7i2EcC3r%2Fw%2BedG0LLausZJlluOL%2F%2BXqxv9gedFtO1My8vWzBteO339m1%2FywSn8rfMTEtiTc1g77UmmFbWNTudSnTkGGvVxxdml6z5mXjp73GF%2F2YLmcC49BntaJvEXt8PYAuyX3w%2FSctDOS%2FzoLmuTqeTAy%2BOe%2Bm1jsS%2BjuddLHzp4ZizIQVEPs0lHvQMTPrppHqQufQc4gzPXtQhZVjsG8CcZcBy1goz878nhu3rdnCc0T3MIu1hsoGOqUBvCkkFTr7PditcnXwAXimBGQCpa4GpcrZubqVMApLymAKRq1b0fMT%2B6zLt9NFZA85%2BYBEAjVoWv54VVQWFT4ozZwN5maF6bFtBZ89GwItJdu4N7ZhBKx8Ylk8AnS2xTywIlde6C7HaKZDcgy6C0HuC483HNBc%2Bf2M1EqjSCyz310J%2B6gnOXSnXHfl4izBPunlrKx%2BlmfSrOeR3fFOBGT0tv7Mvp1M&X-Amz-Signature=d9e1eb553fb2a0fbc4ccee4718f9dde9897e737037bf16ea840c2b67ee35aee1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

```shell
cd /Users/chenwenkun/Downloads/androidandios/iosui/WebDriverAgent/WebDriverAgent
# 使用xcodebuild构建WebDriverAgentRunner用于测试
$ xcodebuild build-for-testing -scheme WebDriverAgentRunner -sdk iphoneos -configuration Release -derivedDataPath /tmp/derivedDataPath

xcodebuild build-for-testing -scheme WebDriverAgentRunner -sdk iphoneos -configuration Release -derivedDataPath /tmp/derivedDataPath -arch arm64
ARCHS=arm64
# 导航到生成的构建目录
$ cd /tmp/derivedDataPath

# 进入Release-iphoneos目录（注意：实际路径可能因环境而异）
$ cd Build/Products/Release-iphoneos

# 创建iOS应用程序打包所需的Payload文件夹结构
# 创建Payload文件夹并将.app文件复制到其中
$ mkdir Payload && cp -r *.app Payload

# 将Payload文件夹压缩为zip文件，然后将扩展名更改为.ipa
# .ipa文件是iOS应用程序的标准分发格式
# 可以使用zip命令进行压缩：zip -r MyApp.ipa Payload
# 或者也可以通过文件管理器进行压缩，然后手动更改扩展名
```

然后：进入到目录 `WebDriverAgentRunner-Runner.app/Frameworks` 把XC开头的文件全部删掉

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZHVL2GGD%2F20251216%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251216T181819Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCICjDB6PgEdHFNEgQ3jHk%2BjFTCrob30dIFoiGktJUwDtpAiEA7USFiDmtLJuiijbxcWuXo2DPrIS3yMK6UJXiCRg8aAkq%2FwMIaxAAGgw2Mzc0MjMxODM4MDUiDD6vmOqVuiyfseMwJSrcAzNSq6fxcYJf1aLuQ9l4atSRn2yAXpORWY4SJo%2F7OzcocNfwwJIjoNpGaPJkMsZMJxlpB3ZsLGqGkqz%2BDM0eDVSjgSIWCAjlkVRYxpBgFMyztd3n9b5%2FHHTfAudjfNs8T79O0zmGoErtJ7IuKms25sieXVecIFP96yv9kftMUJy0el1cHFxOvHI9JNWbQ2tweSTuCiDBaVGfk9WekPBIQD3UgUMsTVFHo%2F6D5jppos3ZfVI3DnSHOtGAfC7f6Ue9Q%2FB8aWJpyNhAWMlypj37FAmH7eOClB4gm8ZJPYAFEKnSFiwaaWxTk9rQbUnXDgGkw4M5JZ1R3ZxQlidwlF1Wu2IqdMOac%2Btt%2BxQBMuiLH7a8c3C6kHGgoXM7hXzwIL98agYVspAglWaR7i2EcC3r%2Fw%2BedG0LLausZJlluOL%2F%2BXqxv9gedFtO1My8vWzBteO339m1%2FywSn8rfMTEtiTc1g77UmmFbWNTudSnTkGGvVxxdml6z5mXjp73GF%2F2YLmcC49BntaJvEXt8PYAuyX3w%2FSctDOS%2FzoLmuTqeTAy%2BOe%2Bm1jsS%2BjuddLHzp4ZizIQVEPs0lHvQMTPrppHqQufQc4gzPXtQhZVjsG8CcZcBy1goz878nhu3rdnCc0T3MIu1hsoGOqUBvCkkFTr7PditcnXwAXimBGQCpa4GpcrZubqVMApLymAKRq1b0fMT%2B6zLt9NFZA85%2BYBEAjVoWv54VVQWFT4ozZwN5maF6bFtBZ89GwItJdu4N7ZhBKx8Ylk8AnS2xTywIlde6C7HaKZDcgy6C0HuC483HNBc%2Bf2M1EqjSCyz310J%2B6gnOXSnXHfl4izBPunlrKx%2BlmfSrOeR3fFOBGT0tv7Mvp1M&X-Amz-Signature=06b90c511e7bd08a3cbfa2f6f30566a2e027d3e8d1f4870173c85ccf0cc681bc&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

用zip命令打包出来一个ipa

```shell
zip -r WDA.ipa Payload
```

下载[iOS App Resigner](https://zhida.zhihu.com/search?content_id=237756070&content_type=Article&match_order=1&q=iOS%20App%20Resigner&zd_token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJ6aGlkYV9zZXJ2ZXIiLCJleHAiOjE3NDQzNTQ0ODAsInEiOiJpT1MgQXBwIFJlc2lnbmVyIiwiemhpZGFfc291cmNlIjoiZW50aXR5IiwiY29udGVudF9pZCI6MjM3NzU2MDcwLCJjb250ZW50X3R5cGUiOiJBcnRpY2xlIiwibWF0Y2hfb3JkZXIiOjEsInpkX3Rva2VuIjpudWxsfQ.XGwOKX0ujlvhojSuRT3SlA0sDFnQK-FxDJr60CX6YqU&zhida_source=entity)进行重签名：[https://dantheman827.github.io/ios-app-signer/](https://dantheman827.github.io/ios-app-signer/)

保存为 WDA2.ipa

试了下个人开发者证书可以。

最后用tidevice把IPA装到手机上（iOS17也可以）

```shell
# install tidevice
pip install tidevice

# install WDA2 to phone
tidevice install WDA2.ipa
```

直接点击手机桌面上的WDA图标就可以了

手机浏览器打开测试一下 [http://localhost:8100/status](http://localhost:8100/status)

出现一个长长的JSON就是正常的。

国内手机需要安装

brew install --HEAD libimobiledevice

然后运行iproxy 8100 8100 监听在电脑端
