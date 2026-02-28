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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46654DHJCIV%2F20260228%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260228T122414Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQD6KIpVUVvOfItx4ae%2BsBVgXQ6RzoVaKblenvgGxWTnNwIhAPIZE%2BykAnENptkFhgbyWmtVO8vfFjAGTi3eT8zkGXQhKv8DCFMQABoMNjM3NDIzMTgzODA1Igz6Rs6hpU57ZTpBcyQq3AMyLJkbnrUFujdsZia5UAWh7fjgekjFFWYGhy3oq5xhVyIUv48R1KxLnVvASsWR5ENbab0iu%2BIIKMq4%2BGk64VglBCE8ffKC4PVnCWM1N6K%2BadN6COvyvctJGGOcWqKWCB7T8ZP7FbZM%2FThlFaoA505kG5MVdceJSUSi5%2BkspelL8vqERTN2i%2F2Gc1vhdijEZXuvfugA5nDYJRfi8wFB22DBbUVw7UWibZqGYkOw7RMwRcUsHMb3RXFeg88MYDXeSlLB3VBNBgoq1U7XV24wxcBo%2FTEVjWPna%2FKjlHL1CaXZO%2BeuU1U%2FAlUUV%2BgN6r82xDc1qWWObLLvJdwLMhUH6bR99APYgqTRaIDjTR9LAdjH25%2FZl4yygWa4zlA2pN3l4XHMX45Zc26%2FLCpbMuJEhttmspmpbwKSU0eBQxBdnv2lt50ZfpGMUTEaIJfy3W75F5R%2FKNACoEXcui8notOz3qqMq9ASOZ61gp86NyETkp5Sd%2BMzbshQKPtNdEkuz4IfjoqxMjsCJZV1KWvQZCyvy1gG3DvRVmLKeO6rDoZtWzJVGepzPwDUrc5GRcwk5utjI%2FqArwZwInhp4NPqk2i7GpS%2FHGptRhBwtZBIOMqcWqArk8luhDfqPa9rdqOgaDCY%2F4rNBjqkAUhSTjF3Gp1OiEPkGbZQD1hY2wE0OD7UtiarPHvvCBTLydR497FB0Dn3wzcFBGAGSWvjALg0Vwkw9kiKhjyZdgUFgMMcTaysYHYyMYbOMoC95P3eplhyXvhk0BnBwb9LWO4J4GSWr1EWcMffYxEg0C%2BxvXUqXTjvsE4PMKsRJ4vJFOLFKP2L3cmD0pR%2B7xigtLAC4uZshdVF8FgdbdbKX%2Bo3Hyak&X-Amz-Signature=7418ebabb9f1f2244381c78a9e65c9c040882d0f6f4bd01163c55d71d9347eda&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46654DHJCIV%2F20260228%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260228T122414Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQD6KIpVUVvOfItx4ae%2BsBVgXQ6RzoVaKblenvgGxWTnNwIhAPIZE%2BykAnENptkFhgbyWmtVO8vfFjAGTi3eT8zkGXQhKv8DCFMQABoMNjM3NDIzMTgzODA1Igz6Rs6hpU57ZTpBcyQq3AMyLJkbnrUFujdsZia5UAWh7fjgekjFFWYGhy3oq5xhVyIUv48R1KxLnVvASsWR5ENbab0iu%2BIIKMq4%2BGk64VglBCE8ffKC4PVnCWM1N6K%2BadN6COvyvctJGGOcWqKWCB7T8ZP7FbZM%2FThlFaoA505kG5MVdceJSUSi5%2BkspelL8vqERTN2i%2F2Gc1vhdijEZXuvfugA5nDYJRfi8wFB22DBbUVw7UWibZqGYkOw7RMwRcUsHMb3RXFeg88MYDXeSlLB3VBNBgoq1U7XV24wxcBo%2FTEVjWPna%2FKjlHL1CaXZO%2BeuU1U%2FAlUUV%2BgN6r82xDc1qWWObLLvJdwLMhUH6bR99APYgqTRaIDjTR9LAdjH25%2FZl4yygWa4zlA2pN3l4XHMX45Zc26%2FLCpbMuJEhttmspmpbwKSU0eBQxBdnv2lt50ZfpGMUTEaIJfy3W75F5R%2FKNACoEXcui8notOz3qqMq9ASOZ61gp86NyETkp5Sd%2BMzbshQKPtNdEkuz4IfjoqxMjsCJZV1KWvQZCyvy1gG3DvRVmLKeO6rDoZtWzJVGepzPwDUrc5GRcwk5utjI%2FqArwZwInhp4NPqk2i7GpS%2FHGptRhBwtZBIOMqcWqArk8luhDfqPa9rdqOgaDCY%2F4rNBjqkAUhSTjF3Gp1OiEPkGbZQD1hY2wE0OD7UtiarPHvvCBTLydR497FB0Dn3wzcFBGAGSWvjALg0Vwkw9kiKhjyZdgUFgMMcTaysYHYyMYbOMoC95P3eplhyXvhk0BnBwb9LWO4J4GSWr1EWcMffYxEg0C%2BxvXUqXTjvsE4PMKsRJ4vJFOLFKP2L3cmD0pR%2B7xigtLAC4uZshdVF8FgdbdbKX%2Bo3Hyak&X-Amz-Signature=3301f892295fe6746fb15da364c5c3ecb4a6a59edb4af4dddcad595a1cbfc00a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
