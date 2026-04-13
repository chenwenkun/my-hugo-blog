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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664XKUDTF2%2F20260413%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260413T125951Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEK3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFwsHRza4H5j%2BqrxOOKXn%2BS5T6n90cdoe%2F6ct5%2F5XymlAiBNPL0uRGRD1adDXunlZZ%2BbIXHA75rLZVG%2BjOQAw8%2B9Yyr%2FAwh2EAAaDDYzNzQyMzE4MzgwNSIMbfMtpqP5JlOmwY1yKtwDkZUT7RkQlIBjBQ5U1GAnlo0QovOZGAJ%2F%2Fd3j7qH3AuqFsFzuEiS8ec%2FRFSlWpotSPYSGpEtw1XryTPTwGTqRqZXa3ql4SnTXqhf6%2BgajK2%2FKJxhWJWJZoufg0ubZQINBYAOifCU3K5z2RMwX2IOVkni1J2HoQI6%2BoIyz4JioP0krY5Azn7iVGkedCTpnhfHIWQGKS6hPSNFGhl3PWVltZFqT7yji0OPAypoPoo7tF%2B9J1EZkS%2B%2BEeHSBdyNfFYi59eftlwAidTjoNnlvrtFI1Q1xEXAtXtxbYERG0LS7gty53R7tTf2SeazMVohVSPTrDpEC4XaDqR21%2FTyo8HGkuslinDEZZm%2FNsSWLvKz1KD8E6KzlrpWRyhLhdz7WVCX86OavRhP4ZhOESKOZQRAiphVd5M53t3wXmFma2cf0gZBUpJbTPkNhD8Y1pNsPw%2BrEgdHW0xOXiZbiDd%2BtoW10NC25F0SCmEHuPgXYIeVT7LyyJFrORfZO9YhHSbE%2Fsx1yS%2FESVgYQ4hMTb89cbkfA6WDkbd2WbtmaY%2BHDgGnzV0QwfjnVkWYs4FkD9pPUtk82D%2FbV4hD4CJMonkon1VueQQsOftmR08VHsJeSA32EzE7%2FltBQeRbdOEKbQ60wpcXzzgY6pgE94oRz0E2S033Eho5G%2FMYFuBJv%2Fb6wUMT%2BUj0Txo65nqRZcnU%2BVA0xmN8zave8cbRglXaxKBY7wy%2BoWPZcU30y6XQhPgU9p97mW66cctVS9yR4Lc6hGUi%2FbE%2B0tyTu%2FBY0p4Ex8LZ8pROIs9f47JKh6Aibr8kCPTjd7137dMv2ppP8Woqj8iV3HdncNhpcTBX186DE22mA6Wn4eJ%2Bg%2Bx51y034fb2R&X-Amz-Signature=7d97c5c52dfc228eea1e92b341a12d3968267eeb0db80c210f0b5a32bcb65473&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664XKUDTF2%2F20260413%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260413T125951Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEK3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFwsHRza4H5j%2BqrxOOKXn%2BS5T6n90cdoe%2F6ct5%2F5XymlAiBNPL0uRGRD1adDXunlZZ%2BbIXHA75rLZVG%2BjOQAw8%2B9Yyr%2FAwh2EAAaDDYzNzQyMzE4MzgwNSIMbfMtpqP5JlOmwY1yKtwDkZUT7RkQlIBjBQ5U1GAnlo0QovOZGAJ%2F%2Fd3j7qH3AuqFsFzuEiS8ec%2FRFSlWpotSPYSGpEtw1XryTPTwGTqRqZXa3ql4SnTXqhf6%2BgajK2%2FKJxhWJWJZoufg0ubZQINBYAOifCU3K5z2RMwX2IOVkni1J2HoQI6%2BoIyz4JioP0krY5Azn7iVGkedCTpnhfHIWQGKS6hPSNFGhl3PWVltZFqT7yji0OPAypoPoo7tF%2B9J1EZkS%2B%2BEeHSBdyNfFYi59eftlwAidTjoNnlvrtFI1Q1xEXAtXtxbYERG0LS7gty53R7tTf2SeazMVohVSPTrDpEC4XaDqR21%2FTyo8HGkuslinDEZZm%2FNsSWLvKz1KD8E6KzlrpWRyhLhdz7WVCX86OavRhP4ZhOESKOZQRAiphVd5M53t3wXmFma2cf0gZBUpJbTPkNhD8Y1pNsPw%2BrEgdHW0xOXiZbiDd%2BtoW10NC25F0SCmEHuPgXYIeVT7LyyJFrORfZO9YhHSbE%2Fsx1yS%2FESVgYQ4hMTb89cbkfA6WDkbd2WbtmaY%2BHDgGnzV0QwfjnVkWYs4FkD9pPUtk82D%2FbV4hD4CJMonkon1VueQQsOftmR08VHsJeSA32EzE7%2FltBQeRbdOEKbQ60wpcXzzgY6pgE94oRz0E2S033Eho5G%2FMYFuBJv%2Fb6wUMT%2BUj0Txo65nqRZcnU%2BVA0xmN8zave8cbRglXaxKBY7wy%2BoWPZcU30y6XQhPgU9p97mW66cctVS9yR4Lc6hGUi%2FbE%2B0tyTu%2FBY0p4Ex8LZ8pROIs9f47JKh6Aibr8kCPTjd7137dMv2ppP8Woqj8iV3HdncNhpcTBX186DE22mA6Wn4eJ%2Bg%2Bx51y034fb2R&X-Amz-Signature=2f30bf181baa5a8a1377c84c4e0566cf88ba5b5b10eb67762a87f96e38b100d0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
