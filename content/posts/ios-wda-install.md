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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46622LABVJP%2F20260701%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260701T023023Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAYaCXVzLXdlc3QtMiJGMEQCIEK5rxjzj%2Fkqel3eaZ9K17k9wCIu8kBaQb918VGSgyL2AiAGc%2BCl%2FtTgmsu%2FfCs1lg78yPPZP%2Fvi6IXBAbXjWxkSeyqIBAjO%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM94OCtig2YRYmNNBEKtwDYOQwXnaxR%2FXqvXY5UJGf%2BbOgHTWE6iRwIsKeUzFmfGTyMc%2BC0gOEj%2BcbZ2zBc1XMzPAmtUiYr6mGmZMUja844jWWe%2FgDpp1sAzLU3Oy4eRNXPFTr1o%2Bxw392JCOeA%2B713gYSC0CSLD0vBDye25zCboY1eSnhhTKgyPbVqEnWwANnagoZeYNdxwbHSBk7eUD3RMMus70xfvytEzf%2FMhFdkAjVECM3TLU3YPpHlXQFaZibowb9Dz%2BguuwCFF1i0gb6IP2aH1dtQBcYcxX8PJj9Rk6lUfuOQ%2FDS821M8JY1M7VZd9Ai3oY5JFLDSDsU5YJCxd0TcjJbaThxQydgYUiKhS7VKrS4iegtQn6OBvQd44f2ZyqehxUg9cI96TUbTVz5CDZet%2B9vFnRnZ3XzKyMN6dJvViStF9Mefhm4Mo4W3xu3NzsFHtZLYZ70L2bMgFjZcNerxEba03K5cYH19fZJEY9DqtI0FU9Vx8eQHyZTaM7q61ONvbM0u6YV9JpuyyB9QH%2FDetX%2BEe685riKmazkhFqkHDqjkOShsM31%2FnJ8a8CiJn8pDGBA3bKBv5HbLDlc3jfKhl9vnYBor8pNI2kEkQPomWlqn1OeATPtI3vJbsBTtzXU33qkGfk%2FoBgw%2BeeQ0gY6pgEpgl0GRyFbtwYiiI22PspeEru0dnZD5UE%2BbE2MKC3ofcgZVxxmof3wRg0MkPNZviUUNDXeCoIvrob3As7twMpSBdb%2FwG6pUVDWINDAium824mJb%2FUse6mJhCm8RAsZ84G9WaZO4K1V0yGIVWirV%2F%2F0Q5dL4%2FrQaUw6m1ZN4FATcFvO1smzr5SCOudwj78QM28bie1M9%2FvJOnHyPRnToYlKhdlcQuP0&X-Amz-Signature=f64c57018d33c163dce7f8376b0f90548964d16856269513d4fda25c055e4a52&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46622LABVJP%2F20260701%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260701T023023Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAYaCXVzLXdlc3QtMiJGMEQCIEK5rxjzj%2Fkqel3eaZ9K17k9wCIu8kBaQb918VGSgyL2AiAGc%2BCl%2FtTgmsu%2FfCs1lg78yPPZP%2Fvi6IXBAbXjWxkSeyqIBAjO%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM94OCtig2YRYmNNBEKtwDYOQwXnaxR%2FXqvXY5UJGf%2BbOgHTWE6iRwIsKeUzFmfGTyMc%2BC0gOEj%2BcbZ2zBc1XMzPAmtUiYr6mGmZMUja844jWWe%2FgDpp1sAzLU3Oy4eRNXPFTr1o%2Bxw392JCOeA%2B713gYSC0CSLD0vBDye25zCboY1eSnhhTKgyPbVqEnWwANnagoZeYNdxwbHSBk7eUD3RMMus70xfvytEzf%2FMhFdkAjVECM3TLU3YPpHlXQFaZibowb9Dz%2BguuwCFF1i0gb6IP2aH1dtQBcYcxX8PJj9Rk6lUfuOQ%2FDS821M8JY1M7VZd9Ai3oY5JFLDSDsU5YJCxd0TcjJbaThxQydgYUiKhS7VKrS4iegtQn6OBvQd44f2ZyqehxUg9cI96TUbTVz5CDZet%2B9vFnRnZ3XzKyMN6dJvViStF9Mefhm4Mo4W3xu3NzsFHtZLYZ70L2bMgFjZcNerxEba03K5cYH19fZJEY9DqtI0FU9Vx8eQHyZTaM7q61ONvbM0u6YV9JpuyyB9QH%2FDetX%2BEe685riKmazkhFqkHDqjkOShsM31%2FnJ8a8CiJn8pDGBA3bKBv5HbLDlc3jfKhl9vnYBor8pNI2kEkQPomWlqn1OeATPtI3vJbsBTtzXU33qkGfk%2FoBgw%2BeeQ0gY6pgEpgl0GRyFbtwYiiI22PspeEru0dnZD5UE%2BbE2MKC3ofcgZVxxmof3wRg0MkPNZviUUNDXeCoIvrob3As7twMpSBdb%2FwG6pUVDWINDAium824mJb%2FUse6mJhCm8RAsZ84G9WaZO4K1V0yGIVWirV%2F%2F0Q5dL4%2FrQaUw6m1ZN4FATcFvO1smzr5SCOudwj78QM28bie1M9%2FvJOnHyPRnToYlKhdlcQuP0&X-Amz-Signature=132b78ee53730af9c49aa36c9d208ff8c5b2dc8f50d21f26ebc95bfdd507e031&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
