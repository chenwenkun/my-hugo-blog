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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662AOSULGS%2F20251006%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251006T005049Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCICRtsheacnzZEoIC5xZ5WxT2f%2F2f9Qi1RwbtEtQbhHL0AiBasXr3tYVkyMJCg%2FCK7fnjx%2FM7%2BPaAW1AEirDOmzB4ziqIBAiB%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMVm6yBmt6SNqRiuPZKtwDi%2Bdgc5fn9DEmUehfbsERvztz6mv0aiU7eudN6Qo161aCB5iI60ykSt2OsQdWV9IpOEAcK44p0i9FhdP%2BxLWU5qOy74EZW2rXFh%2BrS0DwStSR%2BJtb2i9HGolhl80ijjf6zXSgmVxsIsqBh8MIjK3sVw53kGkQ5bYUCffcgrOmttESCLEhPsRPiJzJDDMLKGLDcl8p6XasP%2BkHgnfZo0RY0Vm9vWNgLPvB%2B9a7NKeIakb5T5twQR7nwelHk%2Fv847U2IURonjZFpQaokMgxowplKZ1Z192YPqP8DO7uPy6Z99EEFz%2BtfSLOo0vTN%2FY2DugSeebq8BWgNxaEGEkUzkiLr949xDRqk%2BA0uDqUXS44bXcGgZNoCwMAvp1wlYqsXqPO6lHZxi8NHi%2FttLamtOrEx6SufYjVsacFLjKgY776%2FvzyOXlV83IPf%2FUe9zXeXEIibgqbkeaMhWGrWrODq9ap%2F0LET3vau6cJ9ZO9%2FPd%2Bde%2FBUd36YPIQ4aQVO%2FN6DUaS3uMqPfoabSzb2wHFJVsNCLgfQU850w6WCyHpB%2FdpzzkWDzC2TQjvCmQQXnTYyH1%2BBx747Ad%2FpZXZb0BnXdaTqakhEvujd5fhiujmL%2FP1ScbOc50BIRZxDtk9gtgw2pWMxwY6pgH9mNqdl1VwalyqCserADeuE41Tk2LvaH5X66cppeVmhGY%2FCuTjDJHhIYNcpjSHguuNuU%2BG8Sm8wRxHlV1Kt4G47HqOlerUVa505H%2FssixF%2BhagR2om6u5N45sb75ZmZ%2BbgWeT5SUX0IAhKavQHK0GVPwwRBj%2Bk%2F97E0XhT7T2qbaGJsl%2BnG2GzIPf%2FjJvT5KjdVEXJMshHtN8%2FW861MLO%2Fb4xq8QJm&X-Amz-Signature=975fe7c125629a55e5f35fb7c9af14cc85e85eeb7031e4fac2fb363de5af5f6d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662AOSULGS%2F20251006%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251006T005049Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCICRtsheacnzZEoIC5xZ5WxT2f%2F2f9Qi1RwbtEtQbhHL0AiBasXr3tYVkyMJCg%2FCK7fnjx%2FM7%2BPaAW1AEirDOmzB4ziqIBAiB%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMVm6yBmt6SNqRiuPZKtwDi%2Bdgc5fn9DEmUehfbsERvztz6mv0aiU7eudN6Qo161aCB5iI60ykSt2OsQdWV9IpOEAcK44p0i9FhdP%2BxLWU5qOy74EZW2rXFh%2BrS0DwStSR%2BJtb2i9HGolhl80ijjf6zXSgmVxsIsqBh8MIjK3sVw53kGkQ5bYUCffcgrOmttESCLEhPsRPiJzJDDMLKGLDcl8p6XasP%2BkHgnfZo0RY0Vm9vWNgLPvB%2B9a7NKeIakb5T5twQR7nwelHk%2Fv847U2IURonjZFpQaokMgxowplKZ1Z192YPqP8DO7uPy6Z99EEFz%2BtfSLOo0vTN%2FY2DugSeebq8BWgNxaEGEkUzkiLr949xDRqk%2BA0uDqUXS44bXcGgZNoCwMAvp1wlYqsXqPO6lHZxi8NHi%2FttLamtOrEx6SufYjVsacFLjKgY776%2FvzyOXlV83IPf%2FUe9zXeXEIibgqbkeaMhWGrWrODq9ap%2F0LET3vau6cJ9ZO9%2FPd%2Bde%2FBUd36YPIQ4aQVO%2FN6DUaS3uMqPfoabSzb2wHFJVsNCLgfQU850w6WCyHpB%2FdpzzkWDzC2TQjvCmQQXnTYyH1%2BBx747Ad%2FpZXZb0BnXdaTqakhEvujd5fhiujmL%2FP1ScbOc50BIRZxDtk9gtgw2pWMxwY6pgH9mNqdl1VwalyqCserADeuE41Tk2LvaH5X66cppeVmhGY%2FCuTjDJHhIYNcpjSHguuNuU%2BG8Sm8wRxHlV1Kt4G47HqOlerUVa505H%2FssixF%2BhagR2om6u5N45sb75ZmZ%2BbgWeT5SUX0IAhKavQHK0GVPwwRBj%2Bk%2F97E0XhT7T2qbaGJsl%2BnG2GzIPf%2FjJvT5KjdVEXJMshHtN8%2FW861MLO%2Fb4xq8QJm&X-Amz-Signature=c7f47da6f43482054112420981c1391e8f7bc376f2e2cff21b5bac7e9350046d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
