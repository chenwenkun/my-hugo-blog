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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46652LV2GF6%2F20251011%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251011T004601Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGAaCXVzLXdlc3QtMiJGMEQCICRr0qQCQH0IwnaS%2BCN7PyOrqAwgZxf5%2FwJlxGqu%2FyMXAiAJGpqBNZEY0HYeohuXPuqe5wmnujqVl4mo6evT6Z9RASqIBAj5%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMX377JZE3mG5vAYZPKtwDJyw05NsZjR4msYNNJMrtiXo0Al%2BmFK0qwREeOarSYUKksakukVSMXGdP3TXL7QfQq2Zp%2F1PvryzAv4ar%2BdOvBZGaxxg9rPTogy3Uc3awLmMVn%2B6bCXMETlGsGHQjWt4bf%2FX%2ByvWgh%2BHUE7gMyoOFZwss0m%2BAXqzZ3e4LK4WM3WE24y%2BhlmPc%2BWoJESeGDUhlvC1xClTFISWPJxYhxQBFs2Zx0N8VTC220%2BDFMx%2B5W%2BfYGps%2BnCRKISk8A%2BA6hY%2BaSL4bT54dPlO539PmXZNVgD3FlD%2BxinEY%2FgGSQwtCsnSz3SKsYHFrfZKxD0lNLFIdhJlCmz3sXqfbwDCt6A1Cgtnjvn1K0ORothJQ3it11d%2BUFJANXSWEfVU6rjHa72gkdPnLJ4Jm3Ycc8Wocce1ruIr5HbRiC7Vvl2OPFHgRanBmxfxuxW43wam74HxafsWxgUmmPfZ4Iosg%2B5mkzJBESfCq1kUca%2BJaoYe%2F9e2cSDVftn83noAgPF3FOezXJVKCHYvCMQvYK1UjVbweepKFT6VV4MqUk5Cik0xglqVUdNe5oFxNZFoZ%2FaZzhoJnvbS4ACbkzvsjhnFgsdtKPs4sTpK0QRPynXGFJG3kG8ZMehP%2F78EK4U3KFDbq8rEwnbamxwY6pgGme3L3h6IKCt9QPwWOuvr5GN%2F%2FjOs86sXcTGoQ6VWmnp%2BIToeYI2fTD%2B04rGdYNo0jUMKAejHXvq%2FAWID9s1c9avucYdOUb%2BF4ZbKjpBMSgagwPjYx8JovpJoZmHkfyirso8zZkEeH2xxm%2FzLK5qRUGg0B8DKQ0Oy38DAnqRCNbVbEMj1hXSHFYqKPqAmVlS70CvKF8nIKGdnrM2yr%2FRLAG2H8So%2FT&X-Amz-Signature=b5255408e43355fa6adee8dcf872be67e45a187cfc1c2b97dea3d414745b2f94&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46652LV2GF6%2F20251011%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251011T004601Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGAaCXVzLXdlc3QtMiJGMEQCICRr0qQCQH0IwnaS%2BCN7PyOrqAwgZxf5%2FwJlxGqu%2FyMXAiAJGpqBNZEY0HYeohuXPuqe5wmnujqVl4mo6evT6Z9RASqIBAj5%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMX377JZE3mG5vAYZPKtwDJyw05NsZjR4msYNNJMrtiXo0Al%2BmFK0qwREeOarSYUKksakukVSMXGdP3TXL7QfQq2Zp%2F1PvryzAv4ar%2BdOvBZGaxxg9rPTogy3Uc3awLmMVn%2B6bCXMETlGsGHQjWt4bf%2FX%2ByvWgh%2BHUE7gMyoOFZwss0m%2BAXqzZ3e4LK4WM3WE24y%2BhlmPc%2BWoJESeGDUhlvC1xClTFISWPJxYhxQBFs2Zx0N8VTC220%2BDFMx%2B5W%2BfYGps%2BnCRKISk8A%2BA6hY%2BaSL4bT54dPlO539PmXZNVgD3FlD%2BxinEY%2FgGSQwtCsnSz3SKsYHFrfZKxD0lNLFIdhJlCmz3sXqfbwDCt6A1Cgtnjvn1K0ORothJQ3it11d%2BUFJANXSWEfVU6rjHa72gkdPnLJ4Jm3Ycc8Wocce1ruIr5HbRiC7Vvl2OPFHgRanBmxfxuxW43wam74HxafsWxgUmmPfZ4Iosg%2B5mkzJBESfCq1kUca%2BJaoYe%2F9e2cSDVftn83noAgPF3FOezXJVKCHYvCMQvYK1UjVbweepKFT6VV4MqUk5Cik0xglqVUdNe5oFxNZFoZ%2FaZzhoJnvbS4ACbkzvsjhnFgsdtKPs4sTpK0QRPynXGFJG3kG8ZMehP%2F78EK4U3KFDbq8rEwnbamxwY6pgGme3L3h6IKCt9QPwWOuvr5GN%2F%2FjOs86sXcTGoQ6VWmnp%2BIToeYI2fTD%2B04rGdYNo0jUMKAejHXvq%2FAWID9s1c9avucYdOUb%2BF4ZbKjpBMSgagwPjYx8JovpJoZmHkfyirso8zZkEeH2xxm%2FzLK5qRUGg0B8DKQ0Oy38DAnqRCNbVbEMj1hXSHFYqKPqAmVlS70CvKF8nIKGdnrM2yr%2FRLAG2H8So%2FT&X-Amz-Signature=9b9e7cf67911a690951e626c853ba4dcaa7cf6ab11d61b57064972f723b1bade&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
