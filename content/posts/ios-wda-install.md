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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Y43YE6UY%2F20260507%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260507T015518Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDseRAltvl5Ql47OCvNhDKDnWhHyvCx%2B9GTcWE8Bk6RjwIge2XSNVyAAnawLE9VLqwW65ocwZ3f2zdTKDFFTrO4G7MqiAQIqv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDHWv2DkdPn75w2J8AyrcA9681hG28hjqf8cBeXD3BOQpSmzsCGuhs5KgQ2jj7HYuYA4TEvJv08k08kc%2FCxQMVno35Z5gppSZiQBfSqypZv01udWxbJX8MjjbrCdzn6DRfEPolR4dKVO6ifnSrkhYhiC%2FsrRnpsrxuMcDpEToRkj1sdgygDtcYj4XxKCKM1%2B85A5N0yNH32%2FrLTNBCcJ2ursdp%2BKRQJHj%2F0FYwUZ5EsgpI%2BDDRwDKNL7uaKJc%2Fxi2V384d7zCfdt5Lkl1lz7LRHDjK4IiP5Sk1J16rOXss2MZWqzda4RCtao1OaYJ97nT8m7iwaoiHHhx6NXLTTFxcvKqwL4ydEy%2FdEZjAGCVC8DU1cBqcERbXFsZDQO9oMI2dfsC3iN%2FkIDt%2BzgjS1bRUqm2CjeF7Aw5D%2BrAdc18LJQ2ZX%2FLINnVzS48rJk03JjcukTBA9xRrEki8SlICzI5tF%2BX7x%2BqQNGmogcWuwO0tSXI0%2FEASeZKO0oOQaZK7bJGyq3G34upXGEWOo%2FR%2BRRgIaRMV7oKXgX%2FpTqknXiCfc4a%2B9MMfrYnd%2BgLzwDD6ImVUMHxM0r%2B48KJs4KR0HIX4eGrvHhQcvkODnFUYdXNz7qudyK4At87jpgTDeo8vB7UbGU2oexiorDvQmJGMMLS788GOqUBMljxgEVLFA6cDr7hdTD61EcfNjE5Xy4uFbSeFsLmo8oS9glyX42p7VKf8DSW9TY6UwJDI4ka4qRcp2jQi8G3EPdgp4H%2FTl%2F07Nok09ekripFGLqMul4qXhKuzm%2Bc333zDOSHx8IPATWVQ5kZcxcommA2pALpJCkMDwVQQ38n4tFOdZHe4809%2FdGeXBv4htMmkVT5hJjczHa%2BznrSZBhTBvA2qmNR&X-Amz-Signature=7ee7128df9588b9292175f025ac1482840ae9c76c490d8bb6e0ec40392397c7a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Y43YE6UY%2F20260507%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260507T015518Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDseRAltvl5Ql47OCvNhDKDnWhHyvCx%2B9GTcWE8Bk6RjwIge2XSNVyAAnawLE9VLqwW65ocwZ3f2zdTKDFFTrO4G7MqiAQIqv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDHWv2DkdPn75w2J8AyrcA9681hG28hjqf8cBeXD3BOQpSmzsCGuhs5KgQ2jj7HYuYA4TEvJv08k08kc%2FCxQMVno35Z5gppSZiQBfSqypZv01udWxbJX8MjjbrCdzn6DRfEPolR4dKVO6ifnSrkhYhiC%2FsrRnpsrxuMcDpEToRkj1sdgygDtcYj4XxKCKM1%2B85A5N0yNH32%2FrLTNBCcJ2ursdp%2BKRQJHj%2F0FYwUZ5EsgpI%2BDDRwDKNL7uaKJc%2Fxi2V384d7zCfdt5Lkl1lz7LRHDjK4IiP5Sk1J16rOXss2MZWqzda4RCtao1OaYJ97nT8m7iwaoiHHhx6NXLTTFxcvKqwL4ydEy%2FdEZjAGCVC8DU1cBqcERbXFsZDQO9oMI2dfsC3iN%2FkIDt%2BzgjS1bRUqm2CjeF7Aw5D%2BrAdc18LJQ2ZX%2FLINnVzS48rJk03JjcukTBA9xRrEki8SlICzI5tF%2BX7x%2BqQNGmogcWuwO0tSXI0%2FEASeZKO0oOQaZK7bJGyq3G34upXGEWOo%2FR%2BRRgIaRMV7oKXgX%2FpTqknXiCfc4a%2B9MMfrYnd%2BgLzwDD6ImVUMHxM0r%2B48KJs4KR0HIX4eGrvHhQcvkODnFUYdXNz7qudyK4At87jpgTDeo8vB7UbGU2oexiorDvQmJGMMLS788GOqUBMljxgEVLFA6cDr7hdTD61EcfNjE5Xy4uFbSeFsLmo8oS9glyX42p7VKf8DSW9TY6UwJDI4ka4qRcp2jQi8G3EPdgp4H%2FTl%2F07Nok09ekripFGLqMul4qXhKuzm%2Bc333zDOSHx8IPATWVQ5kZcxcommA2pALpJCkMDwVQQ38n4tFOdZHe4809%2FdGeXBv4htMmkVT5hJjczHa%2BznrSZBhTBvA2qmNR&X-Amz-Signature=ecfdc55180f5caed41a22c0f1c16647b1a160266cc4f774bca679e8ea434ee08&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
