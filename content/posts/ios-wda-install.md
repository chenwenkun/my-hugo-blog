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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XHRJVGXA%2F20251022%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251022T005329Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGkaCXVzLXdlc3QtMiJHMEUCIQCPLzqtLtn0IfeTDsvAD5v%2BE%2BtpcqHoBkQTo8x7EH8JhwIgQIxmmFfns42MLPuhkRMx8R6yazdbG1C5IGtrpmK4H1kq%2FwMIIhAAGgw2Mzc0MjMxODM4MDUiDGHnGo716Mhl4FXghCrcA%2BTAU6HvK5KTI14LVMFmOsxj%2FFeXG5T1uFFT2hrUqfE7hIMtf6zS1hhcGVlFHHhIkphXWUiFADKSdYb2KzpXDWxVgjSloZdj97zRSblU2E21sL71EVx9YODnNG154JOeZ8lBw%2ByF4kGAIClhT35%2BvhgGN2bPF2S6fluf1U5Ism5CKz%2BBTFhF9F9L4qkd1csuoVjV0K3ETXWLN3vQoUpsKsC01Zjq8UZoMrzdsJUIgfHkFJWkWp%2BJcplX1hObnM0Yjj0RMRAeXinOGdO5RWiEWaLcuKjTraLLf0wwGN72zOm4UMHvWroCO3aVzTDCPJq77PS5WlMIrJwl9PFWmyCERDtQcZyNHq%2BTOuyx0bg8AlDab2xbJjrwhBRPmGIlvXNzNG7yLaODQazr2rU1N%2F4xKLalw3okxgSxd3q9jlpuw1pfZTWTtdhzi25YG4h%2Fg8fNkEJZoE7vrVKke%2B6oFrF%2FMrZDL%2B7Dwqv92TB1v8FMlwViyhAeEibz%2FPCBitCgDxzquGj8OtZ%2B6borpAlZYnouqg1BVxCgMsWRnq%2B3WTqgbRujTQdU7TitNswG0kbj22Uz7lItj7qDQvRiffjf%2BDcPePBa9mMkWl3RsajzcrNBbQlRgtM47O0At7tut4TOMKrN4McGOqUBkiDWBcSl%2BGy6b5hr85HhH%2FZic0qQSWZcfPAmWkf8YhsS0jdCc5CA01ZLDDXlRhZQQP9Tjtn8BX1Fsgn%2BBw7lAVAdHxSlkGYImpva7aX2bRpdab%2F3g1uGrUBSOiWgZ8LftybLcoh94IrmsFBN%2FDAxYcTiMM8t2ERSIyNnWh5CE2CcARhETAnfwz2AzJQ2KUFJK%2BNxmIoQ1NsoIk%2FvuXUNs2W%2FJCdG&X-Amz-Signature=a2ee93340c4c1d9bc4cf1397df71aca39dc9e0fd17f1d49c742dec4740648720&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XHRJVGXA%2F20251022%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251022T005329Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGkaCXVzLXdlc3QtMiJHMEUCIQCPLzqtLtn0IfeTDsvAD5v%2BE%2BtpcqHoBkQTo8x7EH8JhwIgQIxmmFfns42MLPuhkRMx8R6yazdbG1C5IGtrpmK4H1kq%2FwMIIhAAGgw2Mzc0MjMxODM4MDUiDGHnGo716Mhl4FXghCrcA%2BTAU6HvK5KTI14LVMFmOsxj%2FFeXG5T1uFFT2hrUqfE7hIMtf6zS1hhcGVlFHHhIkphXWUiFADKSdYb2KzpXDWxVgjSloZdj97zRSblU2E21sL71EVx9YODnNG154JOeZ8lBw%2ByF4kGAIClhT35%2BvhgGN2bPF2S6fluf1U5Ism5CKz%2BBTFhF9F9L4qkd1csuoVjV0K3ETXWLN3vQoUpsKsC01Zjq8UZoMrzdsJUIgfHkFJWkWp%2BJcplX1hObnM0Yjj0RMRAeXinOGdO5RWiEWaLcuKjTraLLf0wwGN72zOm4UMHvWroCO3aVzTDCPJq77PS5WlMIrJwl9PFWmyCERDtQcZyNHq%2BTOuyx0bg8AlDab2xbJjrwhBRPmGIlvXNzNG7yLaODQazr2rU1N%2F4xKLalw3okxgSxd3q9jlpuw1pfZTWTtdhzi25YG4h%2Fg8fNkEJZoE7vrVKke%2B6oFrF%2FMrZDL%2B7Dwqv92TB1v8FMlwViyhAeEibz%2FPCBitCgDxzquGj8OtZ%2B6borpAlZYnouqg1BVxCgMsWRnq%2B3WTqgbRujTQdU7TitNswG0kbj22Uz7lItj7qDQvRiffjf%2BDcPePBa9mMkWl3RsajzcrNBbQlRgtM47O0At7tut4TOMKrN4McGOqUBkiDWBcSl%2BGy6b5hr85HhH%2FZic0qQSWZcfPAmWkf8YhsS0jdCc5CA01ZLDDXlRhZQQP9Tjtn8BX1Fsgn%2BBw7lAVAdHxSlkGYImpva7aX2bRpdab%2F3g1uGrUBSOiWgZ8LftybLcoh94IrmsFBN%2FDAxYcTiMM8t2ERSIyNnWh5CE2CcARhETAnfwz2AzJQ2KUFJK%2BNxmIoQ1NsoIk%2FvuXUNs2W%2FJCdG&X-Amz-Signature=448ad7602b2303152e49c29bafcfe762852a787a32706081e5bf0d049b1315e0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
