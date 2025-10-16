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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667S5AUZ24%2F20251016%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251016T061700Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCICF1PZGvmQ5nh8ZwlG8vO7wxvSN7STjjRZObv0%2BJhNMpAiEA2Fu9H7b3CTj4AkIq%2FdetJPpaRtlu3dAOE8pnT7utXHQqiAQIhv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDGxNOuUYGZ94%2B8s4ZSrcA8VAiZGw7VhJK%2FBYbt2QMXuQaK%2BRmKZuMoICRMaap33VrPlsCWz6sCHC8b%2B0VfXECp3DEvBMva3W37f1OBL4Is8vyN9Vt1zbJCc5AilpaZGViNE6HY596heOXZoc3bjEaU%2FLs16rdI%2FvAkpqh2vQUQl9twkOwxVLQF3CNRa7begfDO4ZtFMdYWNqxN32I6Yn6dmZX8C9aMob6C4D4sZYG4xpfZFsRC4IL8%2Fk89hoe5ivsLXMH03BkddLlGR7du91FKvUDPcnFCY1lic3IuAktzj6JUhDH%2FKjg3%2BnjY9lzB9%2BJNLiBiRom%2F12eSZ0rNWP%2BfWryEKlEcs%2F83WOgM1HwXsiWcHqPxFhhTWhTLYxz7iZoGlCvNcUMOqvIY378We2XW0fiQ%2B5aZHk6X%2FB8y48fk9pChpa8Flo38v387XG3SAZWbmDhmoe2c7bVLTqFC0iqrYaca2DgPYjpaC4b24BgFwkZmLylPf3QKfbZELaK7aMDBv5gPWUXK7ZSchvvcmrd3nKNLlxWzoe6ea23UGr6cVd%2BhlG4Ynria01N7ninj2ML8BXdJ15voUS%2FcwlGl2rDIHLaDmcGNaldn%2BBBE42xJIfxFgQY5Mj4x1y2mmv%2Fp2Hgp%2B9zIiNRQBqc4drMLn5wccGOqUBUUZD3QoKGe90x1AsnqcxPsh%2FpD4MNfjTq0p8Emga8druP%2FlCLf9F%2FPtujvTOH1AyanUUndTgdhZXn1gp%2F%2FSSBHhBOwaN9ZqEYR%2BruutfME%2BOK9QPpcnxIxoGW1lBEuK1D865kLltUO6Q0Zu6mgZx4dYbxG%2FyvEre3WfSrRZTQkpvVJ7CmfnwapEOwIzDKoxGHRPD3%2FF2wOdapxW1gKwY5V4ZADwx&X-Amz-Signature=5781c5af2af5cfe80f19f9ad7dd36226f005ae27b16c158ea5744e59fc457314&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667S5AUZ24%2F20251016%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251016T061700Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCICF1PZGvmQ5nh8ZwlG8vO7wxvSN7STjjRZObv0%2BJhNMpAiEA2Fu9H7b3CTj4AkIq%2FdetJPpaRtlu3dAOE8pnT7utXHQqiAQIhv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDGxNOuUYGZ94%2B8s4ZSrcA8VAiZGw7VhJK%2FBYbt2QMXuQaK%2BRmKZuMoICRMaap33VrPlsCWz6sCHC8b%2B0VfXECp3DEvBMva3W37f1OBL4Is8vyN9Vt1zbJCc5AilpaZGViNE6HY596heOXZoc3bjEaU%2FLs16rdI%2FvAkpqh2vQUQl9twkOwxVLQF3CNRa7begfDO4ZtFMdYWNqxN32I6Yn6dmZX8C9aMob6C4D4sZYG4xpfZFsRC4IL8%2Fk89hoe5ivsLXMH03BkddLlGR7du91FKvUDPcnFCY1lic3IuAktzj6JUhDH%2FKjg3%2BnjY9lzB9%2BJNLiBiRom%2F12eSZ0rNWP%2BfWryEKlEcs%2F83WOgM1HwXsiWcHqPxFhhTWhTLYxz7iZoGlCvNcUMOqvIY378We2XW0fiQ%2B5aZHk6X%2FB8y48fk9pChpa8Flo38v387XG3SAZWbmDhmoe2c7bVLTqFC0iqrYaca2DgPYjpaC4b24BgFwkZmLylPf3QKfbZELaK7aMDBv5gPWUXK7ZSchvvcmrd3nKNLlxWzoe6ea23UGr6cVd%2BhlG4Ynria01N7ninj2ML8BXdJ15voUS%2FcwlGl2rDIHLaDmcGNaldn%2BBBE42xJIfxFgQY5Mj4x1y2mmv%2Fp2Hgp%2B9zIiNRQBqc4drMLn5wccGOqUBUUZD3QoKGe90x1AsnqcxPsh%2FpD4MNfjTq0p8Emga8druP%2FlCLf9F%2FPtujvTOH1AyanUUndTgdhZXn1gp%2F%2FSSBHhBOwaN9ZqEYR%2BruutfME%2BOK9QPpcnxIxoGW1lBEuK1D865kLltUO6Q0Zu6mgZx4dYbxG%2FyvEre3WfSrRZTQkpvVJ7CmfnwapEOwIzDKoxGHRPD3%2FF2wOdapxW1gKwY5V4ZADwx&X-Amz-Signature=df221fd91ca2dd559100d52593a4b6e7f03f2fb32508ae65883584bedf713869&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
