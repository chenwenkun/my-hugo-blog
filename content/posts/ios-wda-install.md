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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RRSWQGKW%2F20250925%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20250925T181637Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIDnKtMi1WCoeiK%2FZwVyZMU1aygUrKfyIW7%2BJ4f%2BbsEvaAiEAp4cjR%2FK89yHgL9iWQ%2BFCDw3HxOzbpnUZLnf04SlkF2gq%2FwMIeRAAGgw2Mzc0MjMxODM4MDUiDJDCsYOdKVY6WofB1yrcA2g6pWyD46vb0esuqfJsdZ777OafGpikSqWxO1wFHsGfMD0CcPMWzbZgIN0ncHEYYNV5aHm6KIC9XtZ6JlzN4WORr7JOEF3OipVXife%2Fvz2hjtLVD4HDtL0o3Ru3vuQ1MT7rz47m%2BOEagw3V3tI4YahbFF2LEvJBp%2BGz79dFpXW9%2FQx34kCYlLa4erMC94ljVXYYlT%2Fok2R7rK%2BLCDFizY0X93l0yiYTpJhnd3W9UVPvWiQUT9HSH3g8Ef%2BGsCYQizF5E%2FJKk2rOmZ%2F4%2FFRBkW6weS6ryOfzjeSMVw%2FhhGFNreHJEC7mdVzKbgGM6DVrD5QFbhMSRGor%2F021AVMaQy%2B7vh1RwSVqLmXA%2B1%2BNfjMIlTWaGQbuylFgm09bBworB4bM7rBCn4JdDPviQHHNUJNXHloicui99hvcTic%2FeIlTXC8bF4f5TFgtz%2B8i%2Br9%2B0vd4RM6b4hqFt7Lsj8E%2FbSEwUvXLJnR1OP7RBbHx122HAbARY91wGNB5DtuURuXTs1VrJgVMErWUGhFbY7ZjjbDVgilMOzTwjS21L3dGud%2BUzHGIfgQBUjBMD2V1dyXUXRfQTGi%2Bi%2F0svyqpDmXXvAj%2BMK2Q82r8JtmEhPTyDwO6HczHJTbHwbn2YWssML7O1cYGOqUBkHA1T699l6E3H3kHl5LzXed2hcfvj1kiz0LSmS%2B3u4V%2BW44qbINmYqV5JsN9chLlYW4FnNnNH%2FeFH8GxAHw%2BPbxMZ8JN4x22YjZVmaa9qUiAs6KdQWtyV5WOKSe0dFJ2vrKHYx4vDeiN7ljHPhEe94YtLHgucEq9uNLC6tP8KfaEwgCtvm%2FMuo13IHpShh8mlSz25CaTg%2FYkEE8BORIIU6diV196&X-Amz-Signature=f959d15f53feaec714ef1c67d9169db5ade2ff70cbf84ec58b1107bda1779c13&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RRSWQGKW%2F20250925%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20250925T181637Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIDnKtMi1WCoeiK%2FZwVyZMU1aygUrKfyIW7%2BJ4f%2BbsEvaAiEAp4cjR%2FK89yHgL9iWQ%2BFCDw3HxOzbpnUZLnf04SlkF2gq%2FwMIeRAAGgw2Mzc0MjMxODM4MDUiDJDCsYOdKVY6WofB1yrcA2g6pWyD46vb0esuqfJsdZ777OafGpikSqWxO1wFHsGfMD0CcPMWzbZgIN0ncHEYYNV5aHm6KIC9XtZ6JlzN4WORr7JOEF3OipVXife%2Fvz2hjtLVD4HDtL0o3Ru3vuQ1MT7rz47m%2BOEagw3V3tI4YahbFF2LEvJBp%2BGz79dFpXW9%2FQx34kCYlLa4erMC94ljVXYYlT%2Fok2R7rK%2BLCDFizY0X93l0yiYTpJhnd3W9UVPvWiQUT9HSH3g8Ef%2BGsCYQizF5E%2FJKk2rOmZ%2F4%2FFRBkW6weS6ryOfzjeSMVw%2FhhGFNreHJEC7mdVzKbgGM6DVrD5QFbhMSRGor%2F021AVMaQy%2B7vh1RwSVqLmXA%2B1%2BNfjMIlTWaGQbuylFgm09bBworB4bM7rBCn4JdDPviQHHNUJNXHloicui99hvcTic%2FeIlTXC8bF4f5TFgtz%2B8i%2Br9%2B0vd4RM6b4hqFt7Lsj8E%2FbSEwUvXLJnR1OP7RBbHx122HAbARY91wGNB5DtuURuXTs1VrJgVMErWUGhFbY7ZjjbDVgilMOzTwjS21L3dGud%2BUzHGIfgQBUjBMD2V1dyXUXRfQTGi%2Bi%2F0svyqpDmXXvAj%2BMK2Q82r8JtmEhPTyDwO6HczHJTbHwbn2YWssML7O1cYGOqUBkHA1T699l6E3H3kHl5LzXed2hcfvj1kiz0LSmS%2B3u4V%2BW44qbINmYqV5JsN9chLlYW4FnNnNH%2FeFH8GxAHw%2BPbxMZ8JN4x22YjZVmaa9qUiAs6KdQWtyV5WOKSe0dFJ2vrKHYx4vDeiN7ljHPhEe94YtLHgucEq9uNLC6tP8KfaEwgCtvm%2FMuo13IHpShh8mlSz25CaTg%2FYkEE8BORIIU6diV196&X-Amz-Signature=ab95254f994794ad72d4a2d563e21a719ccef963358c31c419385aa1dd82fe90&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
