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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XBUADGSC%2F20260123%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260123T005950Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECEaCXVzLXdlc3QtMiJHMEUCIEl2QpoHs64VRhYpApU86mVbBMoG6WEdW%2FMehJ8Zdx%2B8AiEAqh%2FI8eB2B%2BwknRM%2FNJgSxg7kojMx7I3kPQCCjTXxDTUqiAQI6v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDPnwRJ4T3cwAjEL5QSrcA%2Bug%2BEkFTEzVDQKVRkxZrHPJB3iSj9KNXMuOVguWDVutcEIyQmOY0%2FlSnZK21L%2FuhfSPMrpawQYJnfEIRMkS8bJy%2B2WaEAFO8%2BJzMHlZZbfXOwrzy9eAzbkb%2Bic19ksOWLKwF2IEWc4%2FwCu4BXC7wDf61luWNuxpPxV%2FmriedhDJRA7Y2GkgI%2B%2FXPhWMABP9ld8sqTzZOWZEZ1cAU7RLM8T41kcS5M2l%2B1CVU43eFOwaySPX8F3iKQEAfTRa0qBWb1NtMve%2Bl9RLDB5cUl%2BeJWKLW7C83Xd7B4jWCFacjtGV7MzqD10RW3l%2BnSBWcnoJl9WrZ5r1xCTetiUzDQnB7ivNaHLYDch6RNEalhGd55Y%2FrpKgYCfTzxokxQ41N2ce%2FaEFuBRFRNF%2FpyqwcojBgn%2FnatyYYS%2FlopO7s3OzyTLZmp0raQmUYGqPB2KL636m6P99TLPKbx2kQmanfdPmOfplr%2BF4dwbS1bZj91yxY7EyJnHwT71G5nUk1TZTgwYgKIawXoOZnCC5G7tnob1Tpl9WLOj%2FuDg06QeyDOBACd94T3Z2sUHLdwLAu5pn2Rr2OauL%2Fc%2F8SjjNs5IOMWZ835geZ78esfWoflkr06ZYIbULMdsHbEVXhJ13qzG7MLWLy8sGOqUBg%2BudxlHU%2B%2FhhPOLWweMG6lGRQe3SYJRuW3rXzzMzeIBYRti8nxcHeL5GAposaXGW8puekeHE05h%2F3zZN6kzjHkO06rXlMuzQx9VRqZQngqDjGNz%2FDEs8YASRwfBaNTmBMo0VufZDnDQyM8hZHbWz3gyOE5AYus1LnBozOBw9ttnCBqLTYKCVg3CyDr0vI2LQpMBltNFnN4npYvp1D94FN5TDWHO8&X-Amz-Signature=3c5c1bf8e307a04ca882af93381b55f44588c54ba80d564a8182755113a2d059&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XBUADGSC%2F20260123%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260123T005950Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECEaCXVzLXdlc3QtMiJHMEUCIEl2QpoHs64VRhYpApU86mVbBMoG6WEdW%2FMehJ8Zdx%2B8AiEAqh%2FI8eB2B%2BwknRM%2FNJgSxg7kojMx7I3kPQCCjTXxDTUqiAQI6v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDPnwRJ4T3cwAjEL5QSrcA%2Bug%2BEkFTEzVDQKVRkxZrHPJB3iSj9KNXMuOVguWDVutcEIyQmOY0%2FlSnZK21L%2FuhfSPMrpawQYJnfEIRMkS8bJy%2B2WaEAFO8%2BJzMHlZZbfXOwrzy9eAzbkb%2Bic19ksOWLKwF2IEWc4%2FwCu4BXC7wDf61luWNuxpPxV%2FmriedhDJRA7Y2GkgI%2B%2FXPhWMABP9ld8sqTzZOWZEZ1cAU7RLM8T41kcS5M2l%2B1CVU43eFOwaySPX8F3iKQEAfTRa0qBWb1NtMve%2Bl9RLDB5cUl%2BeJWKLW7C83Xd7B4jWCFacjtGV7MzqD10RW3l%2BnSBWcnoJl9WrZ5r1xCTetiUzDQnB7ivNaHLYDch6RNEalhGd55Y%2FrpKgYCfTzxokxQ41N2ce%2FaEFuBRFRNF%2FpyqwcojBgn%2FnatyYYS%2FlopO7s3OzyTLZmp0raQmUYGqPB2KL636m6P99TLPKbx2kQmanfdPmOfplr%2BF4dwbS1bZj91yxY7EyJnHwT71G5nUk1TZTgwYgKIawXoOZnCC5G7tnob1Tpl9WLOj%2FuDg06QeyDOBACd94T3Z2sUHLdwLAu5pn2Rr2OauL%2Fc%2F8SjjNs5IOMWZ835geZ78esfWoflkr06ZYIbULMdsHbEVXhJ13qzG7MLWLy8sGOqUBg%2BudxlHU%2B%2FhhPOLWweMG6lGRQe3SYJRuW3rXzzMzeIBYRti8nxcHeL5GAposaXGW8puekeHE05h%2F3zZN6kzjHkO06rXlMuzQx9VRqZQngqDjGNz%2FDEs8YASRwfBaNTmBMo0VufZDnDQyM8hZHbWz3gyOE5AYus1LnBozOBw9ttnCBqLTYKCVg3CyDr0vI2LQpMBltNFnN4npYvp1D94FN5TDWHO8&X-Amz-Signature=c1d2ff3dce4f26deb8950ce2bbc6a27f942d4e88fdd1b94c2ce5cc91e8d32538&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
