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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466T77ECCSO%2F20260419%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260419T123637Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDkaCXVzLXdlc3QtMiJIMEYCIQCiVS7zRGOLfQWP0gevhPmbdKdZekFcW7k4Tc4G0Jgq%2BwIhAL78FNpwPUk%2FmZgO86j%2FC%2BbrOK75ogWQIGrYCx6o1unUKv8DCAIQABoMNjM3NDIzMTgzODA1IgzNXZLXMeo6tJVD3xgq3ANQwR40LpFHqZsCCjF5sagtgBnHTCumHtfpDVcIXKfuibADVpqNnUfK83O5ivndtOGhwpN1Js5ZBXlehKfuonEehZxjn%2BTvSps2tZbgpjcSUqMWjg68qa9cwvMKR8kasFAp4z7U3yOqG8dXNCMIIo%2B9gWo3r1JCDO0%2FavXDzeDTK%2FLtvPeyJCk52m5Wj11XZ4178rSC%2FEb7aJtZDh3R5eVXYFuNPkrlKJa5diNpuBrQZGNLM9GIq8xIe9phyFqUOk935zSJzIqWmwLxUIZlf0Uy%2Bd6FkECOzCW20W6XvgNGoPUTlSOEtQGmIgiPZsMCkZs1598MP1%2FbJItahlh5p5jYQ6VmrikYDKarR0%2Fb3DJQcfjQX8mA7tuWCo72PXmc3A9a5UF%2BgeJjlMY1wlLEwfw2l0HammEV4VxF9SwgkMqhWsJyt3%2BmS0zlzTi3YLF%2F%2BL0JZK%2BrZskjSM4Hx%2Fd%2BcO0mBKs0f%2BsGezudiZriJbn0%2FWek6P0SnscB17JQd24tRxyiIykw2dmd0b%2FVehO5qNW8fgU9RNUna3TIZrLsUc7btVWtHehLMp7hdZupIc%2FWM5LnlInDE9tQ5ODeBDqIuzaQHWgLcSlKYwp4A10isMb92MXW%2B4MlxnGULRrEmTC7sJLPBjqkAXmNgs9BUVQJpJnQ7%2FK6ZM3bhVQaK5s7oSxPgTH2p0LISbpSWE%2F%2BnkR1qK2y3L4ILxlHLxDdijX%2BNs3yuex%2F5LKCQGd1imogG7NNm7OVuRxyPdhElKhhzfeDJaXTs%2FxwJAeUa%2Bg0cre4g%2BL8Pync8UC2qRrtqyCRnK5cLXgdCAl2XS3LxbZVIBJEMISaVX27md2w0rVEUA0WUCmU636epeY%2B8OSt&X-Amz-Signature=6b6bd9cecc51e5fc5ebc0e0fed4e03078ac93d59caa9d4d448dfe32de6baba81&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466T77ECCSO%2F20260419%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260419T123637Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDkaCXVzLXdlc3QtMiJIMEYCIQCiVS7zRGOLfQWP0gevhPmbdKdZekFcW7k4Tc4G0Jgq%2BwIhAL78FNpwPUk%2FmZgO86j%2FC%2BbrOK75ogWQIGrYCx6o1unUKv8DCAIQABoMNjM3NDIzMTgzODA1IgzNXZLXMeo6tJVD3xgq3ANQwR40LpFHqZsCCjF5sagtgBnHTCumHtfpDVcIXKfuibADVpqNnUfK83O5ivndtOGhwpN1Js5ZBXlehKfuonEehZxjn%2BTvSps2tZbgpjcSUqMWjg68qa9cwvMKR8kasFAp4z7U3yOqG8dXNCMIIo%2B9gWo3r1JCDO0%2FavXDzeDTK%2FLtvPeyJCk52m5Wj11XZ4178rSC%2FEb7aJtZDh3R5eVXYFuNPkrlKJa5diNpuBrQZGNLM9GIq8xIe9phyFqUOk935zSJzIqWmwLxUIZlf0Uy%2Bd6FkECOzCW20W6XvgNGoPUTlSOEtQGmIgiPZsMCkZs1598MP1%2FbJItahlh5p5jYQ6VmrikYDKarR0%2Fb3DJQcfjQX8mA7tuWCo72PXmc3A9a5UF%2BgeJjlMY1wlLEwfw2l0HammEV4VxF9SwgkMqhWsJyt3%2BmS0zlzTi3YLF%2F%2BL0JZK%2BrZskjSM4Hx%2Fd%2BcO0mBKs0f%2BsGezudiZriJbn0%2FWek6P0SnscB17JQd24tRxyiIykw2dmd0b%2FVehO5qNW8fgU9RNUna3TIZrLsUc7btVWtHehLMp7hdZupIc%2FWM5LnlInDE9tQ5ODeBDqIuzaQHWgLcSlKYwp4A10isMb92MXW%2B4MlxnGULRrEmTC7sJLPBjqkAXmNgs9BUVQJpJnQ7%2FK6ZM3bhVQaK5s7oSxPgTH2p0LISbpSWE%2F%2BnkR1qK2y3L4ILxlHLxDdijX%2BNs3yuex%2F5LKCQGd1imogG7NNm7OVuRxyPdhElKhhzfeDJaXTs%2FxwJAeUa%2Bg0cre4g%2BL8Pync8UC2qRrtqyCRnK5cLXgdCAl2XS3LxbZVIBJEMISaVX27md2w0rVEUA0WUCmU636epeY%2B8OSt&X-Amz-Signature=9610d44d64cb518131a087d97c52cd5b55368011a84b9353132e4b450a72ea01&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
