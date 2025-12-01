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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665W3EYDX5%2F20251201%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251201T181859Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDoaCXVzLXdlc3QtMiJHMEUCIGJ2q%2FmzxtULNpizhdev3t%2FPmxf0gIyGCFqJEvlD4HYRAiEA2NZEIMEesyucgCFSLrt7%2FEiGGDnN4hX%2BZZZsinVEy8Iq%2FwMIAxAAGgw2Mzc0MjMxODM4MDUiDGdOR31PhumZcxTAUCrcAwjUWQ1twS4aO%2FRV5KWA7WPltCI%2Fo%2F%2BrDS3mMKUJmHq3oQmVTw96eg9AFt8xXhS7a%2Fu3RepJ20SiAM74R34RuGbnMfVE4k9YL%2FX0OwBcC3wZM075Y4HzmWy%2FravYfhRIjxGSGSgG5psBgM1clFAMzo5JI46j7Y14W6Orcj%2B3xK7gFnkekN8DeQOR4VivzQbYGd06UPkU7yO9BDY4JYjKP3xYs92Vrf1udLc00GU4v7et3ZQXd8FlH3r71vZlMmiCMj4cYoYzuvOCo%2BhKIPYfXjDAerLZfsAVtufnOYy6VPEISeE1l5vx5dKR7Fy%2FAMCOvhvoLof8GKTrWQJ3LjNafK7svZvj3MOaFYKQtqKEhhDknwzgC5LqOZT3T2dXTnfAQAiqNhFABpawEH2IuNGZd2TG%2BGgGR1kbwhcEzF86W4GmGd0P2EZHkOO4yMQUmt5thloLKacLQ5Fi23oZhxsUVXCXJrJlH2pK9cfkj52q%2F%2BFXhx8Fjk5Del2ZUS3Ebovb92d3l6%2FsTbzjp9pSqzIk0ZJh%2BWy582RDEtoQWxOtsWvG%2FMJXRCHNe%2Bs%2BDCV%2FIomMvxtOk4sQu56RgwRLKhcOohqBViqt3gm4WLA6YzGLW5wO6sir9CaEn%2FqTIbPGMMaht8kGOqUB9dR26HsHd5ntDo8pbl48yLf5lfyQJI%2FaxugP1X%2FIS8wnIgjW3VyzskqGLVHNHvWhFfhsKh8NLjJbwLxMDzkOQoaTD4C384VeLVGVbuatOxFL1gyXUrLMeIAqHFHwOPSof6G7uCEJjJadA0spmnaLXWIPc2qoWxbgy6baj6QkuLu7FZzGa3zBLYQytkT2PrVHxKAd%2FcxCsW8t%2FJfIzJIysNmQulVW&X-Amz-Signature=c6d575f7d3ef82f8846ba91933e59f3b1a7d942d505ddeee9bd4579ca4e8da7f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665W3EYDX5%2F20251201%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251201T181859Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDoaCXVzLXdlc3QtMiJHMEUCIGJ2q%2FmzxtULNpizhdev3t%2FPmxf0gIyGCFqJEvlD4HYRAiEA2NZEIMEesyucgCFSLrt7%2FEiGGDnN4hX%2BZZZsinVEy8Iq%2FwMIAxAAGgw2Mzc0MjMxODM4MDUiDGdOR31PhumZcxTAUCrcAwjUWQ1twS4aO%2FRV5KWA7WPltCI%2Fo%2F%2BrDS3mMKUJmHq3oQmVTw96eg9AFt8xXhS7a%2Fu3RepJ20SiAM74R34RuGbnMfVE4k9YL%2FX0OwBcC3wZM075Y4HzmWy%2FravYfhRIjxGSGSgG5psBgM1clFAMzo5JI46j7Y14W6Orcj%2B3xK7gFnkekN8DeQOR4VivzQbYGd06UPkU7yO9BDY4JYjKP3xYs92Vrf1udLc00GU4v7et3ZQXd8FlH3r71vZlMmiCMj4cYoYzuvOCo%2BhKIPYfXjDAerLZfsAVtufnOYy6VPEISeE1l5vx5dKR7Fy%2FAMCOvhvoLof8GKTrWQJ3LjNafK7svZvj3MOaFYKQtqKEhhDknwzgC5LqOZT3T2dXTnfAQAiqNhFABpawEH2IuNGZd2TG%2BGgGR1kbwhcEzF86W4GmGd0P2EZHkOO4yMQUmt5thloLKacLQ5Fi23oZhxsUVXCXJrJlH2pK9cfkj52q%2F%2BFXhx8Fjk5Del2ZUS3Ebovb92d3l6%2FsTbzjp9pSqzIk0ZJh%2BWy582RDEtoQWxOtsWvG%2FMJXRCHNe%2Bs%2BDCV%2FIomMvxtOk4sQu56RgwRLKhcOohqBViqt3gm4WLA6YzGLW5wO6sir9CaEn%2FqTIbPGMMaht8kGOqUB9dR26HsHd5ntDo8pbl48yLf5lfyQJI%2FaxugP1X%2FIS8wnIgjW3VyzskqGLVHNHvWhFfhsKh8NLjJbwLxMDzkOQoaTD4C384VeLVGVbuatOxFL1gyXUrLMeIAqHFHwOPSof6G7uCEJjJadA0spmnaLXWIPc2qoWxbgy6baj6QkuLu7FZzGa3zBLYQytkT2PrVHxKAd%2FcxCsW8t%2FJfIzJIysNmQulVW&X-Amz-Signature=83ffe25e0c002297e2e04ce60d74d880476375d824ebdf368e7ff9011b72f85b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
