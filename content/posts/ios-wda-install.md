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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Z57DC2HW%2F20260310%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260310T183505Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDoEW6hw%2FecGTrPgnCnMBM4HsIwfr7oYIyCK%2FhBt2xiDwIhAPpLBanjF%2BS3YXNNIowbQYXuGSI5DJzTA24OLaZnbPDqKv8DCEoQABoMNjM3NDIzMTgzODA1IgwJnHzuHm2Z1hatBV0q3APjXDLK300FB6%2Ftpny2752vgy%2FxIydNBv3kPxPt3gdnx1MYYX2VXTpfcl78bB7Tm2ls6de%2Fqr%2FCYl0JzhbxK4jKLhfeyFiOSeQJqbkXgp4gR42xC06z58BO7%2Fw889zmsI9s4Rvh%2FKTIoMO9yQpDSyNZNiXkQ6OLKOnNfXGz4y3y5ylKhl5w8NqkFdv9Xh9EllF2%2BSLhL4UtSA6WP6WT4UG5GEkI1ZEyuhGQtD6Wu%2BDw0enm%2BNUcYOCBlomWG1uoV5qac%2Bkm%2B3mLKVRpTved3Qy1GLokONQ3HLNEC9do4HLeG4LHSRXRhmUwFWHL5O1HBkMemj9kBKvDxQTGKFPjBGTGU%2Fft1L1XslMqO1DNVyU6Fm8q7DX5kFvwfe70MBDOGUfDgfxGAJEppWP%2BqNIlbDXqyUgZOsUm2oeMsYKpd%2FY3xWdQ5d8FEjVMLS8Q3It4VFyx0Veb7lljofT%2ByYhBkV8TeNQr3vSi8sDs99t0MtiR%2BEV4IG7Uls9Dr%2FUZGMblosiD7EjsNyBXqtuklZ7RrcYNHcsipjhOuXXu70y87L8oxPC%2FXB3iK6Ztd%2BtPovE8vSsN8lfsnbFlMbmIcniOEC8RVwvAvX3NI6gPi3RPwd%2BGDWPA7a3Fe%2FhHkFD8%2BTD3nsHNBjqkAbF0Swp6xWCIkEunK%2BsPUlG8nEn4bSNHqN%2BlO8dPh88%2B4zhr0fybzgHhGPXhu6JUpq%2FD0mbygdT2amI1s1dMi8sWmzUYKntKTdvQKWWRl5S5Czyjd2EUe94FdRpnwRG5JT8QoQ3IZe56scUoBOXw86p9o13%2BGxURyCXUPTNgNFmYz6REhwJj0fbiEfY3Ct8vBBR3tPfC1XksbQud9M1kUb7xqvMA&X-Amz-Signature=2a73ae23bf53b13a65ccfc1e2db8172eddcc191a2ba59d08729e0924c16e836b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Z57DC2HW%2F20260310%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260310T183505Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDoEW6hw%2FecGTrPgnCnMBM4HsIwfr7oYIyCK%2FhBt2xiDwIhAPpLBanjF%2BS3YXNNIowbQYXuGSI5DJzTA24OLaZnbPDqKv8DCEoQABoMNjM3NDIzMTgzODA1IgwJnHzuHm2Z1hatBV0q3APjXDLK300FB6%2Ftpny2752vgy%2FxIydNBv3kPxPt3gdnx1MYYX2VXTpfcl78bB7Tm2ls6de%2Fqr%2FCYl0JzhbxK4jKLhfeyFiOSeQJqbkXgp4gR42xC06z58BO7%2Fw889zmsI9s4Rvh%2FKTIoMO9yQpDSyNZNiXkQ6OLKOnNfXGz4y3y5ylKhl5w8NqkFdv9Xh9EllF2%2BSLhL4UtSA6WP6WT4UG5GEkI1ZEyuhGQtD6Wu%2BDw0enm%2BNUcYOCBlomWG1uoV5qac%2Bkm%2B3mLKVRpTved3Qy1GLokONQ3HLNEC9do4HLeG4LHSRXRhmUwFWHL5O1HBkMemj9kBKvDxQTGKFPjBGTGU%2Fft1L1XslMqO1DNVyU6Fm8q7DX5kFvwfe70MBDOGUfDgfxGAJEppWP%2BqNIlbDXqyUgZOsUm2oeMsYKpd%2FY3xWdQ5d8FEjVMLS8Q3It4VFyx0Veb7lljofT%2ByYhBkV8TeNQr3vSi8sDs99t0MtiR%2BEV4IG7Uls9Dr%2FUZGMblosiD7EjsNyBXqtuklZ7RrcYNHcsipjhOuXXu70y87L8oxPC%2FXB3iK6Ztd%2BtPovE8vSsN8lfsnbFlMbmIcniOEC8RVwvAvX3NI6gPi3RPwd%2BGDWPA7a3Fe%2FhHkFD8%2BTD3nsHNBjqkAbF0Swp6xWCIkEunK%2BsPUlG8nEn4bSNHqN%2BlO8dPh88%2B4zhr0fybzgHhGPXhu6JUpq%2FD0mbygdT2amI1s1dMi8sWmzUYKntKTdvQKWWRl5S5Czyjd2EUe94FdRpnwRG5JT8QoQ3IZe56scUoBOXw86p9o13%2BGxURyCXUPTNgNFmYz6REhwJj0fbiEfY3Ct8vBBR3tPfC1XksbQud9M1kUb7xqvMA&X-Amz-Signature=8885ee5642da87a3c5be33c0948cd4ab46944f61ef67d7576ec63a2fdab99213&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
