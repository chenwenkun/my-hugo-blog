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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Q6MSI2C6%2F20251012%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251012T181320Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFXetXDpAbUeqOwlfDkck7bsU9IGt4%2Fxbko4hnO8xTbrAiB5FUBR%2Bez1UUr0rzRoTxGc7tFEsctEfPsja7Dvf3jLair%2FAwguEAAaDDYzNzQyMzE4MzgwNSIMlOQl94zmbeO6aYOSKtwDGw23bJwd3qFmHLVw9DpHQBHPn2mmjHmSX7SJmoh9yFB3TANy9B8kOTbilTNW7ofBSjdap%2BUYSFjpDU8KHGJ%2BA5yUHN%2FJnfIlwDuMPeKaahbPFid65hUks%2BsvtXV4nO88mrEozbaGUu49ahyJVPB2elquDwmQmy8aGc5MB40qPNJ2ACwz6%2B6%2Fi74LB4iIQtq4a35cQs1SxXQ1KAHK1hKVomIWnD8EV1g9DU6h%2FWxCnfgGYSHOKlIAynRVzU%2BlPQ2J6FxaeCEmzg4qpJ5QXh6%2BJgbnIMlFVsKvC8c%2BWMQFfp%2FYLxnkA4FVm7dcU5BvAt9GTn8Nha6CsEZcM774uO6GIu%2FFeP5%2Fu5bKxbFVJgUkwUdDKk%2Bd7xFuOnQ2XOAW7OICaOVnz%2BFjTASA%2FkHQQYKTFynQYU3IDrkPvDfENuVkWCTMfnRtqbhP0uzGcbdsnIQGTRxeyDYnNy3MRFv3Ky8GY1tKPT%2BPlHZhtfkegZ3C5Zx%2FkK4Ksk3wqXQDad8U4ay0TzTpo4PGMVmom6b6LSv0lsWf%2BNw3lDR2jm7O3LZlvDxbOvsA88xhOw3SbpKWhUtaCJvbNZN7nxNJjFy3FCsMdSoT62OrTZUGFxze3O1UbAmwSMVgGUhnNH8OHCUw1s%2BuxwY6pgH7MAAMdG4zXTtyRm7EtXhciRUCc2cTuwgQWB6ip%2B896DjHtdEXf2Z3fFYyMxEwL5NbqTxPtaL%2Fr9iWqoC7amBRLqCSoCE0yTWpe4TO1ynfQTpd7XPJcghrp01yuMpVP9s1YTsEBKQgCDL%2B8OoJxhRN0SlLzeDmkI11bb9qzDPK8zjzUYgxvlF79RVnkq8TtL2ztULcUHCwElZxMdSy1Zg4TbRQv2%2Bm&X-Amz-Signature=cc44dfcf638ce5611ba7a57600a87bed21b672cf37ef944613e8f4ecf1e59645&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Q6MSI2C6%2F20251012%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251012T181320Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFXetXDpAbUeqOwlfDkck7bsU9IGt4%2Fxbko4hnO8xTbrAiB5FUBR%2Bez1UUr0rzRoTxGc7tFEsctEfPsja7Dvf3jLair%2FAwguEAAaDDYzNzQyMzE4MzgwNSIMlOQl94zmbeO6aYOSKtwDGw23bJwd3qFmHLVw9DpHQBHPn2mmjHmSX7SJmoh9yFB3TANy9B8kOTbilTNW7ofBSjdap%2BUYSFjpDU8KHGJ%2BA5yUHN%2FJnfIlwDuMPeKaahbPFid65hUks%2BsvtXV4nO88mrEozbaGUu49ahyJVPB2elquDwmQmy8aGc5MB40qPNJ2ACwz6%2B6%2Fi74LB4iIQtq4a35cQs1SxXQ1KAHK1hKVomIWnD8EV1g9DU6h%2FWxCnfgGYSHOKlIAynRVzU%2BlPQ2J6FxaeCEmzg4qpJ5QXh6%2BJgbnIMlFVsKvC8c%2BWMQFfp%2FYLxnkA4FVm7dcU5BvAt9GTn8Nha6CsEZcM774uO6GIu%2FFeP5%2Fu5bKxbFVJgUkwUdDKk%2Bd7xFuOnQ2XOAW7OICaOVnz%2BFjTASA%2FkHQQYKTFynQYU3IDrkPvDfENuVkWCTMfnRtqbhP0uzGcbdsnIQGTRxeyDYnNy3MRFv3Ky8GY1tKPT%2BPlHZhtfkegZ3C5Zx%2FkK4Ksk3wqXQDad8U4ay0TzTpo4PGMVmom6b6LSv0lsWf%2BNw3lDR2jm7O3LZlvDxbOvsA88xhOw3SbpKWhUtaCJvbNZN7nxNJjFy3FCsMdSoT62OrTZUGFxze3O1UbAmwSMVgGUhnNH8OHCUw1s%2BuxwY6pgH7MAAMdG4zXTtyRm7EtXhciRUCc2cTuwgQWB6ip%2B896DjHtdEXf2Z3fFYyMxEwL5NbqTxPtaL%2Fr9iWqoC7amBRLqCSoCE0yTWpe4TO1ynfQTpd7XPJcghrp01yuMpVP9s1YTsEBKQgCDL%2B8OoJxhRN0SlLzeDmkI11bb9qzDPK8zjzUYgxvlF79RVnkq8TtL2ztULcUHCwElZxMdSy1Zg4TbRQv2%2Bm&X-Amz-Signature=e8f95ab67dbebc03c3c311b2fe81a9aa6137bd6d43282d15057494612bc4faca&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
