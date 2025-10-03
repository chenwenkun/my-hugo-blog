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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VDR5JHND%2F20251003%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251003T004815Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCabo%2B%2FLeEq6n%2FDxOYJBiwh4ooe6BMkYzLzLFA7VHpPtQIhAJM3qM7mdGldIrNJjwIjIkKkKTAyqJV6DNnwz27g3%2FJHKv8DCDcQABoMNjM3NDIzMTgzODA1Igx%2FyjIPLdR1SZNVZHUq3APGLLh3Y029vnWo%2FHiAq9VJY5k7TaoCb9N48WkotJiSWT%2FlncegKmCtceboHJIfald%2Bilf0WTvGKKN5uvnijygS0Y6D0jfyCHEMQTqHVrh%2FC6rnMsR%2Fk9Uy57opdWAbGyC5lo6gqHa%2F7GWYYucPSiWehmjCkbJebv4nmG2ExYJwNLCrv0CB8Xu6qrEk%2FEsRhPtq%2FXrZUipgYVMR9XbJ6gQyoo4Zb7JysH2dq2JJE4xMQ2mOXOMradeGiIsrrr6ZamiSrCg1ZcUY%2Bj7vSvqkP9vW9UmfxwE7aT%2BCldoqXLR0%2BNe1I2fDddZWVwTKg4YJmsQ1guaFmzvN6FSNx423%2BcsFW5Xh8f6modNTguMh1nyWMXae%2BJGC1K%2B8gKwp11Sf6m8k%2BQdx%2FXJK6dHTjTimXBnfjXOM5hmch9GGqTOuJOnwh8g35DvFmb4ebSrGKQ%2BvliiJNSCnwysQaPaOWZq4TbR1IU1UMRkfs85JQ0jocn80%2Fx79eG5BVv0H10860VxE9LPgJfafVxz30w4n0SChajxy3JSHt9wOVDgRexdcSicF1Ndv8pAQi3Qr3%2B4CMft3rFFmPlCLgR1mNZ9CIFIgs7GT9vA%2BCm9d7iHhI7FuVNMCvenQRcVXhIsKGQXBtjDY8PvGBjqkAbtZqA6ohsLZ%2BTvCGAyiVNlHsOOeTWdMPDYu3Przd011fDHZzBx45%2BLNqYhgaujddOeyzxjtkKZE4pgEyoKAlUhZhJMXM%2BT8uTZzMLP8rGYbaIEoISelkiJfRYSU1S5QeHfHavHRupbtvP06%2B%2BGdOL0zxYAYZGg0yfGt4bzo4tRVCNtgXOBfVA%2FgSILCnmfHOcWd4BDfeTTu5vLTNv%2FLgE27yjxc&X-Amz-Signature=c2f804a91a19b6e58b83caf9043e8ccc4d457bde3b92da20331089be84050f2b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VDR5JHND%2F20251003%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251003T004815Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCabo%2B%2FLeEq6n%2FDxOYJBiwh4ooe6BMkYzLzLFA7VHpPtQIhAJM3qM7mdGldIrNJjwIjIkKkKTAyqJV6DNnwz27g3%2FJHKv8DCDcQABoMNjM3NDIzMTgzODA1Igx%2FyjIPLdR1SZNVZHUq3APGLLh3Y029vnWo%2FHiAq9VJY5k7TaoCb9N48WkotJiSWT%2FlncegKmCtceboHJIfald%2Bilf0WTvGKKN5uvnijygS0Y6D0jfyCHEMQTqHVrh%2FC6rnMsR%2Fk9Uy57opdWAbGyC5lo6gqHa%2F7GWYYucPSiWehmjCkbJebv4nmG2ExYJwNLCrv0CB8Xu6qrEk%2FEsRhPtq%2FXrZUipgYVMR9XbJ6gQyoo4Zb7JysH2dq2JJE4xMQ2mOXOMradeGiIsrrr6ZamiSrCg1ZcUY%2Bj7vSvqkP9vW9UmfxwE7aT%2BCldoqXLR0%2BNe1I2fDddZWVwTKg4YJmsQ1guaFmzvN6FSNx423%2BcsFW5Xh8f6modNTguMh1nyWMXae%2BJGC1K%2B8gKwp11Sf6m8k%2BQdx%2FXJK6dHTjTimXBnfjXOM5hmch9GGqTOuJOnwh8g35DvFmb4ebSrGKQ%2BvliiJNSCnwysQaPaOWZq4TbR1IU1UMRkfs85JQ0jocn80%2Fx79eG5BVv0H10860VxE9LPgJfafVxz30w4n0SChajxy3JSHt9wOVDgRexdcSicF1Ndv8pAQi3Qr3%2B4CMft3rFFmPlCLgR1mNZ9CIFIgs7GT9vA%2BCm9d7iHhI7FuVNMCvenQRcVXhIsKGQXBtjDY8PvGBjqkAbtZqA6ohsLZ%2BTvCGAyiVNlHsOOeTWdMPDYu3Przd011fDHZzBx45%2BLNqYhgaujddOeyzxjtkKZE4pgEyoKAlUhZhJMXM%2BT8uTZzMLP8rGYbaIEoISelkiJfRYSU1S5QeHfHavHRupbtvP06%2B%2BGdOL0zxYAYZGg0yfGt4bzo4tRVCNtgXOBfVA%2FgSILCnmfHOcWd4BDfeTTu5vLTNv%2FLgE27yjxc&X-Amz-Signature=4d7a254bfab49c3e91c481567225854b1b35ccc1dcb21f942494440545bf8b83&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
