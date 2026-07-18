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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TS6B7Q5A%2F20260718%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260718T184418Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIGEby%2FfhKoCVaoECciSkWWQTGshyXQS7iYGoDXtZ%2B5hmAiAV4zF7sasyrZRdf7iF%2FaL3I4WtfFJXOVDvRmLQtiZqbCr%2FAwh8EAAaDDYzNzQyMzE4MzgwNSIMJH4Zcg2%2Fs3EiRN5hKtwDHWczcQKZwisCEis9JHdhRCRpjGkOCUwLNRCxwS%2FeNOoPgbl1ASe6JKQkdl6WRBkG%2BFzKx7qNCICAGATiKgavpmGMLAYn%2FDtGWzkY6oq0x0f665Cy0vEpY1%2B%2BklixWtjvzN2pJb2DppxyyxSgl%2FAfmWbacdNm%2Bw42oafp82iGP8H6HYPDqs5Qbp25ExsmEeCNdnMPoaGor45Nirw0u3xa7r4Wbn7VhDtqJOiX66%2BrlLQ1ucROzZWW3%2BmnEF7WXn3aelC%2BD26CFMoJ8FlpSt0zFE29YzG8UZM9QaPg3X89ZSwFyTLVgRrQbxJvfsjdte%2F6%2BDZDCZvzfgaJQxmWUULd2PeYoB8%2FTmtzCJSggxZm%2FoosOjqESWzln4zAUnlAoqkKJ84kXHLIZeSqAuEWDRTXiRdL1CS%2BdWn%2FKFNUoRAp4PPPE6urVD%2BXS7Q6UgS4y7pShM8Un4vnYQYzCLJDyTR1j3K09IpoSwcYMDYSGYUwwy2t5EOG4UjWi2mk8jMuaEe0mpBsXkH%2FXJVoFNVZuf1j%2F262BBrJ20PAt9ZxDPHKLVs07gijlW3C9zLMxyS2%2FtSy4SQLX43IIhlicw9rBxVjBD770DJS6RWByAYVFpMzXG3VNihrcrt684xaKXEwt5Dv0gY6pgHsX2e4JTdHCUcPn85O2MagCp9TdpRMtz%2Bun1NUB8iR0Umcx7f59abP%2F8uy7C96F%2FhoJ97Q2Doe9MUvD%2BwzImgXe2KaLLW2oeGL7W8uStEcrbiOk8KInXt1V9swYtmGYGdAjdBRl%2BtV8JhXla0RxkxXTa1KLahhf%2FM6kne4prQovW013%2FRUHMYmYAS1TlCFcE9l7HJOlAwyr4jRDrGRiH0DTSby9QKa&X-Amz-Signature=83899c65f64a40b63bc9de595c65e7a416711987b790a784e9711b1978031b4b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TS6B7Q5A%2F20260718%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260718T184418Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIGEby%2FfhKoCVaoECciSkWWQTGshyXQS7iYGoDXtZ%2B5hmAiAV4zF7sasyrZRdf7iF%2FaL3I4WtfFJXOVDvRmLQtiZqbCr%2FAwh8EAAaDDYzNzQyMzE4MzgwNSIMJH4Zcg2%2Fs3EiRN5hKtwDHWczcQKZwisCEis9JHdhRCRpjGkOCUwLNRCxwS%2FeNOoPgbl1ASe6JKQkdl6WRBkG%2BFzKx7qNCICAGATiKgavpmGMLAYn%2FDtGWzkY6oq0x0f665Cy0vEpY1%2B%2BklixWtjvzN2pJb2DppxyyxSgl%2FAfmWbacdNm%2Bw42oafp82iGP8H6HYPDqs5Qbp25ExsmEeCNdnMPoaGor45Nirw0u3xa7r4Wbn7VhDtqJOiX66%2BrlLQ1ucROzZWW3%2BmnEF7WXn3aelC%2BD26CFMoJ8FlpSt0zFE29YzG8UZM9QaPg3X89ZSwFyTLVgRrQbxJvfsjdte%2F6%2BDZDCZvzfgaJQxmWUULd2PeYoB8%2FTmtzCJSggxZm%2FoosOjqESWzln4zAUnlAoqkKJ84kXHLIZeSqAuEWDRTXiRdL1CS%2BdWn%2FKFNUoRAp4PPPE6urVD%2BXS7Q6UgS4y7pShM8Un4vnYQYzCLJDyTR1j3K09IpoSwcYMDYSGYUwwy2t5EOG4UjWi2mk8jMuaEe0mpBsXkH%2FXJVoFNVZuf1j%2F262BBrJ20PAt9ZxDPHKLVs07gijlW3C9zLMxyS2%2FtSy4SQLX43IIhlicw9rBxVjBD770DJS6RWByAYVFpMzXG3VNihrcrt684xaKXEwt5Dv0gY6pgHsX2e4JTdHCUcPn85O2MagCp9TdpRMtz%2Bun1NUB8iR0Umcx7f59abP%2F8uy7C96F%2FhoJ97Q2Doe9MUvD%2BwzImgXe2KaLLW2oeGL7W8uStEcrbiOk8KInXt1V9swYtmGYGdAjdBRl%2BtV8JhXla0RxkxXTa1KLahhf%2FM6kne4prQovW013%2FRUHMYmYAS1TlCFcE9l7HJOlAwyr4jRDrGRiH0DTSby9QKa&X-Amz-Signature=fcc24015bb74a8ad4e5da30415b3bdaa1fc755ec42ef7c6ca57d45e5f76d1dbd&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
