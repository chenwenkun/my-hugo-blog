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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V36VXHZK%2F20260714%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260714T190027Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFIaCXVzLXdlc3QtMiJHMEUCICsEqylrGGNk4A52JofaQhV4gw%2FVxpvH2XRrb6Z5peIcAiEAuAXoDWbWpc3uofBaJYjc7tJgM%2BfKjmEE34d0wAN1k1Mq%2FwMIGxAAGgw2Mzc0MjMxODM4MDUiDGjTEcMIRiYJGQqEjircA5U9n%2B%2Bh2kCI5JJ%2B6QTI66JW7g3KJVeZ332g%2Fa4IV6VAaxxjG5kt49v97oRWoSnn8LLHZGx0y%2BOyBqXhPzbkGdeZqqamwkZg33QDNACZ36fBhtzjuJ%2BBP20%2Baz2zAsZBMFUwbQN%2Bf1C5IUn%2F5CUeHMKaGfRnrpJJqcpg7yoPQcz%2Bt%2F5%2B7RQmCMXB7onZ5f6oGU6NBFyJZ90tGiUEfWiMRdgaTkH9rX5FkNyTdKUMhG4D0UCQNhYMf5dhzwhIIpxVoRKReEYHpBYbBgalbBLjHeyv8WdL390CHltq66yqEZPbJI5GlmLO6%2FoNQt%2FRHrFB2VvvrirkD3F09eU8ccQBERRbh%2FA7adNiRQ1DahMvdibwloMuv0nrz%2FhheVHFuGTRlgp3%2FNMp%2FOTKhjrRRwXTkz3kNxAHrXugJlU0yUJwdTP7xyV%2F7yj6hbszk2%2FUoTqwUMCuNvJZ9ova9SS6zuYxw1O1DMltmCNT4%2FfK9kWcR67MRhEWpUVs9hRfPq22PrV0rRrTPWRQL0nHgMyuSlvEWKeo3J36UpiWYf03zafh95qNIwnDSQYkCwq8gyEAs5QTJo125q81mDBRiVURFNBtwwhLZ9%2Bv865StrzK8lEq8Cb5OaI%2BFnwF7qEoxBoVMJXp2dIGOqUBQPNUHbDgt%2FQl7t%2FNgA6aF1ccJJ4p9qXPTz812jW3ZqUWhyGSsKbT1mbA2%2BFR%2BtmdPZDqmtqt7em5A5%2Fg%2BfvVGe%2FDjX%2FHwX03ej3Z7YR5JwDlqfBDdcCAmUG5oufok6Zj3R1icw7008Q%2BElYI8S0OwwTeJdBe9lDTHrlSmxQJH%2FIPo8%2BU7Bd73dQOAGE%2FRBKFQMFq4I28dDF2ambkJuKTaWKKKTng&X-Amz-Signature=d3c90dcb2986f382220d636e1af1970262735bc51a34cf397cacb4b692e3a3b5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V36VXHZK%2F20260714%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260714T190027Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFIaCXVzLXdlc3QtMiJHMEUCICsEqylrGGNk4A52JofaQhV4gw%2FVxpvH2XRrb6Z5peIcAiEAuAXoDWbWpc3uofBaJYjc7tJgM%2BfKjmEE34d0wAN1k1Mq%2FwMIGxAAGgw2Mzc0MjMxODM4MDUiDGjTEcMIRiYJGQqEjircA5U9n%2B%2Bh2kCI5JJ%2B6QTI66JW7g3KJVeZ332g%2Fa4IV6VAaxxjG5kt49v97oRWoSnn8LLHZGx0y%2BOyBqXhPzbkGdeZqqamwkZg33QDNACZ36fBhtzjuJ%2BBP20%2Baz2zAsZBMFUwbQN%2Bf1C5IUn%2F5CUeHMKaGfRnrpJJqcpg7yoPQcz%2Bt%2F5%2B7RQmCMXB7onZ5f6oGU6NBFyJZ90tGiUEfWiMRdgaTkH9rX5FkNyTdKUMhG4D0UCQNhYMf5dhzwhIIpxVoRKReEYHpBYbBgalbBLjHeyv8WdL390CHltq66yqEZPbJI5GlmLO6%2FoNQt%2FRHrFB2VvvrirkD3F09eU8ccQBERRbh%2FA7adNiRQ1DahMvdibwloMuv0nrz%2FhheVHFuGTRlgp3%2FNMp%2FOTKhjrRRwXTkz3kNxAHrXugJlU0yUJwdTP7xyV%2F7yj6hbszk2%2FUoTqwUMCuNvJZ9ova9SS6zuYxw1O1DMltmCNT4%2FfK9kWcR67MRhEWpUVs9hRfPq22PrV0rRrTPWRQL0nHgMyuSlvEWKeo3J36UpiWYf03zafh95qNIwnDSQYkCwq8gyEAs5QTJo125q81mDBRiVURFNBtwwhLZ9%2Bv865StrzK8lEq8Cb5OaI%2BFnwF7qEoxBoVMJXp2dIGOqUBQPNUHbDgt%2FQl7t%2FNgA6aF1ccJJ4p9qXPTz812jW3ZqUWhyGSsKbT1mbA2%2BFR%2BtmdPZDqmtqt7em5A5%2Fg%2BfvVGe%2FDjX%2FHwX03ej3Z7YR5JwDlqfBDdcCAmUG5oufok6Zj3R1icw7008Q%2BElYI8S0OwwTeJdBe9lDTHrlSmxQJH%2FIPo8%2BU7Bd73dQOAGE%2FRBKFQMFq4I28dDF2ambkJuKTaWKKKTng&X-Amz-Signature=df19414a0908bb1089c330517cd65b2da18b9c34400f44724ab559df04f07372&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
