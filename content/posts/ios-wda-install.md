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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YSEL7XNC%2F20260128%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260128T005903Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIG9Ge298ZUjMA0PoapdY%2B3lwDSGnfvfCuwVJdwcVkFCAAiEA5iCKJVP2l90pbBtgg5aNMrCaWyADtN7rjN1KxfY3Wigq%2FwMIYRAAGgw2Mzc0MjMxODM4MDUiDKWkObXBXRn%2FJSrohCrcAyxkJwY3Hh%2FVO%2BcoZMabIOTfnY4CzeuPhAINgHtJzYi5oTMEcWW2E1uBv%2FimZq%2BVwjAh7aoS5ShGDq56%2BuTuEu6mKhNLewJd596DzrI0DaUxSsgm4PGlh4eupzCgKN7unypBZ2HMDPHtXbOZV%2FPXh7fLlNj86aW9HRbXdZ8uYFogq0ooN77etWtGrO63RzeLG1FwqKaervQ7yIM9xt4LUctQSPCWhzeV7iGL%2FdGdHsPAVIh97tx8QN1QMIcue%2Bzbi3lXcZmiI93mBK4gwzYdOq0oe%2BET4FKb9GgqUs8novMrv1yTnRAbqf7VgasT6QVYfOWwHi2noWRv9g3%2FcNFkpSr130%2FlwPAyEhRz1IhUUzMwINAJ7EszHg5HNCy0O2mt6hNEeyOoONn3dpoJLOmIskV%2BO4TcO%2FLLUn%2BDpUB8fu447vcjXwWbxrg71zb%2FQvLvx1JtS%2BaCAd4D2%2Bjx%2B5CqJv7Ru3%2FtGK0wp5cCT5BcY93Bhz0qe4w6xjjib1BXx%2B4yn5NnhA%2FMGrOOs50fho0ziWGQTlajmn%2F4Oyk4WpJVK0OiXcxC%2FOdmeJrBQ8mtuP4CzdEzLaEufLYX40kHp%2FQKHxAcDpoU9f7Tj04rNLkAsmSa1OAhLFYpQN%2BQd6GuMOWW5csGOqUBP3SNNyEkkBkiM6NE2oT1jD2tYwoCiib5YRgKh2GifxTfTBIV0CkitXhYHj80WCzgJ4OYla%2BQrRe3cvY50Mb12EE6lEepM1KHJVwBCRfW8%2BibreyVUb564jRrwec6Qza2fT0%2F4cBWOe2vHlKDaIEszHtSk%2BeE27QCvmwcLV4tbmYr3%2FyDdpRBZzdyxYF%2BwSsR4M1FyxXt9rVpf9czj64uGlEYmDfP&X-Amz-Signature=63ce9f9071b2971a4e09e59774c44e212e30b27d0d150da6ec57d890df243585&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YSEL7XNC%2F20260128%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260128T005903Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIG9Ge298ZUjMA0PoapdY%2B3lwDSGnfvfCuwVJdwcVkFCAAiEA5iCKJVP2l90pbBtgg5aNMrCaWyADtN7rjN1KxfY3Wigq%2FwMIYRAAGgw2Mzc0MjMxODM4MDUiDKWkObXBXRn%2FJSrohCrcAyxkJwY3Hh%2FVO%2BcoZMabIOTfnY4CzeuPhAINgHtJzYi5oTMEcWW2E1uBv%2FimZq%2BVwjAh7aoS5ShGDq56%2BuTuEu6mKhNLewJd596DzrI0DaUxSsgm4PGlh4eupzCgKN7unypBZ2HMDPHtXbOZV%2FPXh7fLlNj86aW9HRbXdZ8uYFogq0ooN77etWtGrO63RzeLG1FwqKaervQ7yIM9xt4LUctQSPCWhzeV7iGL%2FdGdHsPAVIh97tx8QN1QMIcue%2Bzbi3lXcZmiI93mBK4gwzYdOq0oe%2BET4FKb9GgqUs8novMrv1yTnRAbqf7VgasT6QVYfOWwHi2noWRv9g3%2FcNFkpSr130%2FlwPAyEhRz1IhUUzMwINAJ7EszHg5HNCy0O2mt6hNEeyOoONn3dpoJLOmIskV%2BO4TcO%2FLLUn%2BDpUB8fu447vcjXwWbxrg71zb%2FQvLvx1JtS%2BaCAd4D2%2Bjx%2B5CqJv7Ru3%2FtGK0wp5cCT5BcY93Bhz0qe4w6xjjib1BXx%2B4yn5NnhA%2FMGrOOs50fho0ziWGQTlajmn%2F4Oyk4WpJVK0OiXcxC%2FOdmeJrBQ8mtuP4CzdEzLaEufLYX40kHp%2FQKHxAcDpoU9f7Tj04rNLkAsmSa1OAhLFYpQN%2BQd6GuMOWW5csGOqUBP3SNNyEkkBkiM6NE2oT1jD2tYwoCiib5YRgKh2GifxTfTBIV0CkitXhYHj80WCzgJ4OYla%2BQrRe3cvY50Mb12EE6lEepM1KHJVwBCRfW8%2BibreyVUb564jRrwec6Qza2fT0%2F4cBWOe2vHlKDaIEszHtSk%2BeE27QCvmwcLV4tbmYr3%2FyDdpRBZzdyxYF%2BwSsR4M1FyxXt9rVpf9czj64uGlEYmDfP&X-Amz-Signature=f230b1cb135f4afb6b3b65fb26eb19b96f7255675d3e9ba536ef387bfa4a87e2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
