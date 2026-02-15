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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TBVTAMY4%2F20260215%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260215T063825Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEE4aCXVzLXdlc3QtMiJHMEUCIQDFbEJ8ev7cyIQYQxhGza6uxfmuGI0NCF81HajDHaek8wIgG%2Bww9gCqj2xvO5Fg%2FGubseIMR%2FfaWr1xR4xXHKn16q0q%2FwMIFxAAGgw2Mzc0MjMxODM4MDUiDMS0wchazRsXWCojjircA0VH7A%2F1roCaa%2BEmpjCjZJygWm8kg5%2FuXx%2B8nEUQzj3Z5KLHNBNaVPTgYtME6TKZJ%2F1sAe78H8qepEWt4PU0ifIczwnkD3N9%2B2aGFcC%2F84U%2BtxcMNDzlEkzXvQfRArQb90hNhL8GsKDu1%2FzqMDcSgN%2F%2BFTL7HFgTcoGqTD1EfxwzcMHCOeS8cs7eQXmt%2B90WJsWIB9zunxNj77xKTiaNXdxQiYz3OMqkoLAkPD3rmi58ENWu0oGNYKx5x8saO13bekmxLpHANchTTyw5HmhSoNj9Y15avjLE6Qg52H7%2FDCSloMLQFfxC8gnf46OZGuwVevOahZ9opS%2FZwrpTO0WnsWB3PsfeU1sX8ffffS7YaB67QkctOz2ocQ%2F9jX9uNjVHE9t0Bomh%2BQrfCuMwdtNwI2KEqz4vH30jYB12arJ6uKPmDgMrWfLbSCx8Zm1kS1IJmbuFFVNl8%2Fjfx3srQlrLWzHFDyKdlh0tC5180dsXkxTR7%2FtVl3FccKe%2FXTo9MurWVfEpjvKi1GOsQhM8o4oSxteevKR3tH2mYnSNKuVfn%2FOJKQ7Nzmje%2FagxIMqjYSgeRiriTyj4GJ9PYN8KyJds2Ie2TKK0sTI3xdVaI7cRPAopoWrrEMAw5Cd9hkVLMLq4xcwGOqUBGAHCNHJ6v22%2BMdEgZe6jUNg3CetRajtSO2BE4znroqcvFn7DUzc1qxEoqrZ82qasGI3PJOUzLwsJhMHLdePCkqgeKD8MReIYfZBBuUpdt6Cu4jgDYfKxJiy8cMOMcxqk4zHWruGeUmeOdne8y3y5UowO7g7dnnCRWzKMVVG0scrouI0%2BHNxOElkxDzHgMw2o6dsOJraVK30WMQUjOzf%2FCkzI8Cpf&X-Amz-Signature=f4d4b62069a1c1f5fe08959771b5f7657d738f3ca1f23598b6cd90d39181db72&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TBVTAMY4%2F20260215%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260215T063825Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEE4aCXVzLXdlc3QtMiJHMEUCIQDFbEJ8ev7cyIQYQxhGza6uxfmuGI0NCF81HajDHaek8wIgG%2Bww9gCqj2xvO5Fg%2FGubseIMR%2FfaWr1xR4xXHKn16q0q%2FwMIFxAAGgw2Mzc0MjMxODM4MDUiDMS0wchazRsXWCojjircA0VH7A%2F1roCaa%2BEmpjCjZJygWm8kg5%2FuXx%2B8nEUQzj3Z5KLHNBNaVPTgYtME6TKZJ%2F1sAe78H8qepEWt4PU0ifIczwnkD3N9%2B2aGFcC%2F84U%2BtxcMNDzlEkzXvQfRArQb90hNhL8GsKDu1%2FzqMDcSgN%2F%2BFTL7HFgTcoGqTD1EfxwzcMHCOeS8cs7eQXmt%2B90WJsWIB9zunxNj77xKTiaNXdxQiYz3OMqkoLAkPD3rmi58ENWu0oGNYKx5x8saO13bekmxLpHANchTTyw5HmhSoNj9Y15avjLE6Qg52H7%2FDCSloMLQFfxC8gnf46OZGuwVevOahZ9opS%2FZwrpTO0WnsWB3PsfeU1sX8ffffS7YaB67QkctOz2ocQ%2F9jX9uNjVHE9t0Bomh%2BQrfCuMwdtNwI2KEqz4vH30jYB12arJ6uKPmDgMrWfLbSCx8Zm1kS1IJmbuFFVNl8%2Fjfx3srQlrLWzHFDyKdlh0tC5180dsXkxTR7%2FtVl3FccKe%2FXTo9MurWVfEpjvKi1GOsQhM8o4oSxteevKR3tH2mYnSNKuVfn%2FOJKQ7Nzmje%2FagxIMqjYSgeRiriTyj4GJ9PYN8KyJds2Ie2TKK0sTI3xdVaI7cRPAopoWrrEMAw5Cd9hkVLMLq4xcwGOqUBGAHCNHJ6v22%2BMdEgZe6jUNg3CetRajtSO2BE4znroqcvFn7DUzc1qxEoqrZ82qasGI3PJOUzLwsJhMHLdePCkqgeKD8MReIYfZBBuUpdt6Cu4jgDYfKxJiy8cMOMcxqk4zHWruGeUmeOdne8y3y5UowO7g7dnnCRWzKMVVG0scrouI0%2BHNxOElkxDzHgMw2o6dsOJraVK30WMQUjOzf%2FCkzI8Cpf&X-Amz-Signature=50be9947b78003d92e96b7e8fc5d7a5a293330e6549da7edf4fca659674fb103&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
