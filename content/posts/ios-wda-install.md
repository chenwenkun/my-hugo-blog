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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XHM3J5GB%2F20251115%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251115T181354Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDJE3HOgfHkMsHU%2BSkNguM7ZJNzuMaqlAUMx%2BFqg%2FfiTgIhAPe24rY2kB1UTqaCuiFmIYjzy3ycivLfVcBbIBOAC6RwKogECID%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzFZsM0QZv3cYZjyT8q3AP1Eum9ptIHmZzqwa4qtha5OsY2AvbEhFIU1vWKCNKD%2FICF%2FuDNPMfw5uZdwiOCoCZIJR8j1OzHAcl880s9Gtw%2BtMsl%2BVmcrBL5FsLgrBVdhMAEd87k%2BgsxUxJ1OwjOHt4roSAaP38w%2FIG%2BAphuCT0HrUAoHL4feSjP2690zNR%2BDFrVzf83iXqL4F2zn6h3U%2BANNaiMTxBCmOCrwuQM2gh6inO1nlj9BFSpACdIQQSdzflcsQnAAbPB6znFn13IXtgGTq%2Bz91Awo0MVVuxwWjak1%2BCSHtyShPxdy89HZ%2BfHZDrExVEj8oP8p0%2Fa5Nu8LDS9FXalDhvTeV9VAmcFL5pxVTND6bm5LAkA2QAaaBoURdbLTeIPFCc3Uo4Wl0%2FrYah8gR4TXTSTkUkdavFXUw4tROh3%2B1jDTPirRkVLGFexQMIw8%2FaeQ0rOHYq0ZBMavu%2FQLsmCayEv%2FEwt70jhPvw7KBG%2FDHBjPAybkGmlhiGpKsHvatFJHAxIHsA0p32R0uejzxNO30%2FtvDKa433fbjXouuTTiM8R7hXuiaY6%2B0fdI5WXP42VSqCygmjUEGuOfzpmdwrTsd7C%2BkzIMkMEc4EPlhMm6fRghD8GwBhICYoy%2FoGhnEq%2BJ3qi0VPxpzC9s%2BLIBjqkASXXUdFCSdzshmfay3Jtna9%2Bdu0mxUd5gy0jYG8d3OUtAJXqSBJewOt2zH1GfA1IUPKMSEvdCxo8o6AtqbAXrxcRE2r0Zk1D1y%2BzfrvexwO9OzDPUDkLfSPTH1gpergkPM2ohh6KPpozhXlHcv0SX20kLBcOrsCJbYjG3oR0DOUp7vb4pHMoOe49LZkoCMJIsU%2FjP2%2BOXkeSll0scpebiZSH07Za&X-Amz-Signature=aa03e1ba9655923713171605d95b07afe6021b395e98b38890bf3f9020f24cb2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XHM3J5GB%2F20251115%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251115T181354Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDJE3HOgfHkMsHU%2BSkNguM7ZJNzuMaqlAUMx%2BFqg%2FfiTgIhAPe24rY2kB1UTqaCuiFmIYjzy3ycivLfVcBbIBOAC6RwKogECID%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzFZsM0QZv3cYZjyT8q3AP1Eum9ptIHmZzqwa4qtha5OsY2AvbEhFIU1vWKCNKD%2FICF%2FuDNPMfw5uZdwiOCoCZIJR8j1OzHAcl880s9Gtw%2BtMsl%2BVmcrBL5FsLgrBVdhMAEd87k%2BgsxUxJ1OwjOHt4roSAaP38w%2FIG%2BAphuCT0HrUAoHL4feSjP2690zNR%2BDFrVzf83iXqL4F2zn6h3U%2BANNaiMTxBCmOCrwuQM2gh6inO1nlj9BFSpACdIQQSdzflcsQnAAbPB6znFn13IXtgGTq%2Bz91Awo0MVVuxwWjak1%2BCSHtyShPxdy89HZ%2BfHZDrExVEj8oP8p0%2Fa5Nu8LDS9FXalDhvTeV9VAmcFL5pxVTND6bm5LAkA2QAaaBoURdbLTeIPFCc3Uo4Wl0%2FrYah8gR4TXTSTkUkdavFXUw4tROh3%2B1jDTPirRkVLGFexQMIw8%2FaeQ0rOHYq0ZBMavu%2FQLsmCayEv%2FEwt70jhPvw7KBG%2FDHBjPAybkGmlhiGpKsHvatFJHAxIHsA0p32R0uejzxNO30%2FtvDKa433fbjXouuTTiM8R7hXuiaY6%2B0fdI5WXP42VSqCygmjUEGuOfzpmdwrTsd7C%2BkzIMkMEc4EPlhMm6fRghD8GwBhICYoy%2FoGhnEq%2BJ3qi0VPxpzC9s%2BLIBjqkASXXUdFCSdzshmfay3Jtna9%2Bdu0mxUd5gy0jYG8d3OUtAJXqSBJewOt2zH1GfA1IUPKMSEvdCxo8o6AtqbAXrxcRE2r0Zk1D1y%2BzfrvexwO9OzDPUDkLfSPTH1gpergkPM2ohh6KPpozhXlHcv0SX20kLBcOrsCJbYjG3oR0DOUp7vb4pHMoOe49LZkoCMJIsU%2FjP2%2BOXkeSll0scpebiZSH07Za&X-Amz-Signature=cc1dce2604f58345ae3af9f56a5e9f2bd800127f26913fad00bf0a25f1463cc4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
