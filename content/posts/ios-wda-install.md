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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SGASBCB4%2F20260612%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260612T095458Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEoaCXVzLXdlc3QtMiJGMEQCIHBUJwWdrLvP%2BQHeca1D3yTRQarevRYDED9R%2Frsm%2FukzAiBd6zamXb7rzW93JZncFG8H8SvJWCZkgxQ79M3CJjSxyir%2FAwgSEAAaDDYzNzQyMzE4MzgwNSIMANtOb9iVl00lMCErKtwDD0FToZpFyh9AyarQkbBe56djwDECqbKJBldpZ%2F5b%2BV8Yk1y6jZKc7n6FCY%2Bf1hrrji7e5CHqhOKZ%2FEKEQ8%2Bq6GzHAnaDLjoOQ2yL0I5C0p1mjJj7IkTmm92sYx9iOCrCb%2BCWOj5gRkh78F8h4DsDA4944VtWbM5EfO2F7IH3dRyGTObneKx7r6BhRY66VeUdqqTiv14tw0wfQL5PiEbsPI9xef%2BELCUjLyoQjrRJIudkayugn0zifzoHbFUvSfHMjqeQ33upcRCqjBx9Z3jJcUj7HLmdxW87M5b8nXFRwb8ckAEfO8pfNs1NwnuGslcAyJt3xAGN9e%2Bua7JUTx%2BPh7PhTTwPWCxlxR8A1P%2FkIZ1xEs7ipycmkxeXdkl1f%2Bu%2F0WanL8dXNQABlpSr60u1%2FrzRbz4zPjBW2GHdH0IbyZeyFJ25QD1xfsvDtTTwOgJiDdsnj1VjHYjkjMCflcnPCLoPhBTVuMCuh0AQ%2FS93zuS3FbB7xzxmcGQuybCoUgNwrIam9Z5BafdXLi31CXk9vwv9i%2FVqBewaG8le9Vv7cqeaX6yLNEhmfUxLe9ZU%2B5gqpeQQpu8FclcgDW3L4dBKBk%2BWk5t1rF%2BrjbHSEIudAAhyinTUIfSAz2mgQxIwiaCv0QY6pgFY5oU2dYSAIkT9zor9qcqDis1ezB1I700m3mKrDEq1ud2j4etsh%2FNn3t2bMLQhs6gsJ47Bfa%2F249FpVqrB2xBazjumJwB6ZbdqcWBuj3vuenUAqkne6UmcQvmIYTdxQuKgOIpT%2FzA%2BHDrKc1TtcvoU3C%2Bn7nde%2BMoQ%2FswxpKgMs5e4S1o72QMiTrs%2Fer4oGsO7HUkSip%2FVs1XRndvCAPC7tC3anAlQ&X-Amz-Signature=95c55ac9edb620bfae0be1cd912b6bd376e0ce88dd7e11648e4fdb7287e9ed99&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SGASBCB4%2F20260612%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260612T095458Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEoaCXVzLXdlc3QtMiJGMEQCIHBUJwWdrLvP%2BQHeca1D3yTRQarevRYDED9R%2Frsm%2FukzAiBd6zamXb7rzW93JZncFG8H8SvJWCZkgxQ79M3CJjSxyir%2FAwgSEAAaDDYzNzQyMzE4MzgwNSIMANtOb9iVl00lMCErKtwDD0FToZpFyh9AyarQkbBe56djwDECqbKJBldpZ%2F5b%2BV8Yk1y6jZKc7n6FCY%2Bf1hrrji7e5CHqhOKZ%2FEKEQ8%2Bq6GzHAnaDLjoOQ2yL0I5C0p1mjJj7IkTmm92sYx9iOCrCb%2BCWOj5gRkh78F8h4DsDA4944VtWbM5EfO2F7IH3dRyGTObneKx7r6BhRY66VeUdqqTiv14tw0wfQL5PiEbsPI9xef%2BELCUjLyoQjrRJIudkayugn0zifzoHbFUvSfHMjqeQ33upcRCqjBx9Z3jJcUj7HLmdxW87M5b8nXFRwb8ckAEfO8pfNs1NwnuGslcAyJt3xAGN9e%2Bua7JUTx%2BPh7PhTTwPWCxlxR8A1P%2FkIZ1xEs7ipycmkxeXdkl1f%2Bu%2F0WanL8dXNQABlpSr60u1%2FrzRbz4zPjBW2GHdH0IbyZeyFJ25QD1xfsvDtTTwOgJiDdsnj1VjHYjkjMCflcnPCLoPhBTVuMCuh0AQ%2FS93zuS3FbB7xzxmcGQuybCoUgNwrIam9Z5BafdXLi31CXk9vwv9i%2FVqBewaG8le9Vv7cqeaX6yLNEhmfUxLe9ZU%2B5gqpeQQpu8FclcgDW3L4dBKBk%2BWk5t1rF%2BrjbHSEIudAAhyinTUIfSAz2mgQxIwiaCv0QY6pgFY5oU2dYSAIkT9zor9qcqDis1ezB1I700m3mKrDEq1ud2j4etsh%2FNn3t2bMLQhs6gsJ47Bfa%2F249FpVqrB2xBazjumJwB6ZbdqcWBuj3vuenUAqkne6UmcQvmIYTdxQuKgOIpT%2FzA%2BHDrKc1TtcvoU3C%2Bn7nde%2BMoQ%2FswxpKgMs5e4S1o72QMiTrs%2Fer4oGsO7HUkSip%2FVs1XRndvCAPC7tC3anAlQ&X-Amz-Signature=dfb9210629c0a2c9a47710ec09de2a4e0ed62c0d1d246c08f03a7c4f050c1c43&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
