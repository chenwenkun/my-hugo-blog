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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662BCIARCV%2F20260215%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260215T182133Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFkaCXVzLXdlc3QtMiJGMEQCIDTEcNPOUadj7IWyX37aV3NfRr3VcLBfzMqO8ZEMH35sAiAEEJ6h45yscPOWtICGpl4ppCb1ccaH6j1bTcYch62NhCr%2FAwgiEAAaDDYzNzQyMzE4MzgwNSIM8%2BQdRs%2F7nbpilKwoKtwDMxzyKRtN0u3%2BILe3xGDYCpCenps3aibhWFvKAkmY3e833gadc3N1qnpIMeQECKarhcfVRvHla3AiHs%2FxmqT00y4DbXz%2BHxchJ4KtbsUx4JffShs21T6divI6faNX3rhFCdua49qnZ01Tu2VZajqCgl4GA%2BNhVqQcOp6vOkdrRpr5L7NdNQvUTGxOGGnb2yqtXwJra%2B%2BBR%2B%2FMsqOAASGFrx7obZONFszaKbsbRo%2BArZXWuEy3wCxlW%2Bpp%2FQ5bBvvPOvc2fZ49d6du0bV1unVhI37iKdvQxG04lnfm1Pe4TeqWJVORFMsXtEcHDZEExa%2F9KynVIWuiwCe%2FSdVZ7Lfn6CsopLI1MeHW%2F2ZFdbtIhxwe1%2FQo%2BUxgz1U0Hn5O0HiucbiqpdOKJt22prPdQptJfRGBgmvb9WBkAWDzFq5RzCtYkyGy6XuOPjbHDmItXd5it65WLCyIL%2BokfPEFj29vpqjaS4lJXk3g%2FEFplxjjPZODshcvntgY12HXtNZdaaIGpwOgoNqdQYJShk%2BIJdRl8kyfsoIKQnHJIW9R0OGxiE7BD8jRo3TF%2BtB7s4v%2Bmr3nh7lhPpdrmFRwEDyUjPpb4IQPDVS8IBzu%2FyRIlqEXbkARlyR3cnRLdfg6htsw5e3HzAY6pgGugFA%2F4K1A5Q8ubkPh517bPZWggJHRg%2BEs0DeX44Cc6vNb8lJET5HvhsdASPGo%2FwQED17Fe1%2FcdnP8tYNalrIGLnC7vIUkINEr7RE4G%2FTS9x8G4mIiI4GYttjQUIibK0DThVDpbOpwzWj90zyLFA5w9PpURlZeDN3dCEy3fuWnLMYxilT6TbCdhEXtba08oIZQ8D7edH4A9ksq04mLOekOBHrkTVFE&X-Amz-Signature=ae4aab11b0d10aa389cbb0c186a5f501e82e0ae036b34d8df3d5909f27799cc6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662BCIARCV%2F20260215%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260215T182133Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFkaCXVzLXdlc3QtMiJGMEQCIDTEcNPOUadj7IWyX37aV3NfRr3VcLBfzMqO8ZEMH35sAiAEEJ6h45yscPOWtICGpl4ppCb1ccaH6j1bTcYch62NhCr%2FAwgiEAAaDDYzNzQyMzE4MzgwNSIM8%2BQdRs%2F7nbpilKwoKtwDMxzyKRtN0u3%2BILe3xGDYCpCenps3aibhWFvKAkmY3e833gadc3N1qnpIMeQECKarhcfVRvHla3AiHs%2FxmqT00y4DbXz%2BHxchJ4KtbsUx4JffShs21T6divI6faNX3rhFCdua49qnZ01Tu2VZajqCgl4GA%2BNhVqQcOp6vOkdrRpr5L7NdNQvUTGxOGGnb2yqtXwJra%2B%2BBR%2B%2FMsqOAASGFrx7obZONFszaKbsbRo%2BArZXWuEy3wCxlW%2Bpp%2FQ5bBvvPOvc2fZ49d6du0bV1unVhI37iKdvQxG04lnfm1Pe4TeqWJVORFMsXtEcHDZEExa%2F9KynVIWuiwCe%2FSdVZ7Lfn6CsopLI1MeHW%2F2ZFdbtIhxwe1%2FQo%2BUxgz1U0Hn5O0HiucbiqpdOKJt22prPdQptJfRGBgmvb9WBkAWDzFq5RzCtYkyGy6XuOPjbHDmItXd5it65WLCyIL%2BokfPEFj29vpqjaS4lJXk3g%2FEFplxjjPZODshcvntgY12HXtNZdaaIGpwOgoNqdQYJShk%2BIJdRl8kyfsoIKQnHJIW9R0OGxiE7BD8jRo3TF%2BtB7s4v%2Bmr3nh7lhPpdrmFRwEDyUjPpb4IQPDVS8IBzu%2FyRIlqEXbkARlyR3cnRLdfg6htsw5e3HzAY6pgGugFA%2F4K1A5Q8ubkPh517bPZWggJHRg%2BEs0DeX44Cc6vNb8lJET5HvhsdASPGo%2FwQED17Fe1%2FcdnP8tYNalrIGLnC7vIUkINEr7RE4G%2FTS9x8G4mIiI4GYttjQUIibK0DThVDpbOpwzWj90zyLFA5w9PpURlZeDN3dCEy3fuWnLMYxilT6TbCdhEXtba08oIZQ8D7edH4A9ksq04mLOekOBHrkTVFE&X-Amz-Signature=6f2557dd5b16d8e8e35e13b90433ec87f12ea89aed5e2a6d59fe41940d9b7d9c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
