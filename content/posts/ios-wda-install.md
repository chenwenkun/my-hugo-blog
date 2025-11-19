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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QQBVQ4QB%2F20251119%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251119T122159Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBQaCXVzLXdlc3QtMiJHMEUCIQCv4UI9K%2FxnjIsn6U%2FyyOzZODwxfWSLl9UiU23cCUwqEgIgICLxiuRId22qTDzO7VcWhAaPqqNSAfnzSzzEDX%2Bx%2FIcqiAQI3f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNDg0AxzrbcbEn28JCrcA%2B%2B1V1XNRUfh1Kmes3Swz%2F3ttHcN0MHy6wVoOxXMx%2BOulMTFfsR10lrvf7Hk2RtAphO2nLz9KrMx7fPGQCvLclXYJqVUuDbBBGPeFatlHYPgvoTF3wP58VcFpd44xI7FIyKAwZBrnjoyBfb4yNW6EmLdl6vSZ2aXs41ZJ2psOOcaf7iOu0srh1IX6QWKrVn5tRsZwnyzNw3GWjtA4OSnyHKIVpBaSIEWx1DOUSc8hj2imggOgijz7%2FrdymfdUv1WJZD6SVHPYUMCDIjM%2FDM69rNDjGZBT7I%2Fs3C5MrJn7EWKqVYzDcq2ATsNY8m4A%2FtsAj43%2B%2BlvKQD7jTerXQiA1fyhrYOseSOTQIRRKCqmV0L%2BZDgIwZ7NgAPzul377J8hXBYtv21960bQ56x%2BduT2xE7EPEkxR4YX2WVQJ%2Fz%2FL6S8PflTyGpyoRstJ0XlALxd6lvZaqGe9k1h8NSpVHd6mfaf%2BHKPiulM6iSx%2FNwfPWc8RdGRHcS7L8Ju1Y11nUBrdHRAiCZ3FxG%2BNZzpb0g2yfSz9QEbqZO4XJqpT0WhEy79x5NNdgRLNk1mBRvwQFOCS7%2BPuuf3sAb9MLj5Z33lgUv6e1VFVprQLwGFKztMd%2FAZKZnKQWTzcg5AsQ%2BaMKbp9sgGOqUBqb26tX7GRYiaGOehrDlRRQf8NdaoJYUi0s6qZxZsLkZu8rkKpMfdqYJF1Wyx1wQTiuOHde58v2dyFmOyQwOH8FKJR5SaZN7hzz5oIfTixK7B824mrM7krhipdD6R5wEFuNeUxcwH3PdBFr28QgqvU9Ic70aGNuOm8LAFHraSIcabJeT%2BaJAMX80XQP7DLGnCjOQYg4NC755obBe9kqdeT9uyfIao&X-Amz-Signature=adc18170462efbd5ba8c38c4f835b7725f7608d52dcf4ef36386aca6bb818414&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QQBVQ4QB%2F20251119%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251119T122159Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBQaCXVzLXdlc3QtMiJHMEUCIQCv4UI9K%2FxnjIsn6U%2FyyOzZODwxfWSLl9UiU23cCUwqEgIgICLxiuRId22qTDzO7VcWhAaPqqNSAfnzSzzEDX%2Bx%2FIcqiAQI3f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNDg0AxzrbcbEn28JCrcA%2B%2B1V1XNRUfh1Kmes3Swz%2F3ttHcN0MHy6wVoOxXMx%2BOulMTFfsR10lrvf7Hk2RtAphO2nLz9KrMx7fPGQCvLclXYJqVUuDbBBGPeFatlHYPgvoTF3wP58VcFpd44xI7FIyKAwZBrnjoyBfb4yNW6EmLdl6vSZ2aXs41ZJ2psOOcaf7iOu0srh1IX6QWKrVn5tRsZwnyzNw3GWjtA4OSnyHKIVpBaSIEWx1DOUSc8hj2imggOgijz7%2FrdymfdUv1WJZD6SVHPYUMCDIjM%2FDM69rNDjGZBT7I%2Fs3C5MrJn7EWKqVYzDcq2ATsNY8m4A%2FtsAj43%2B%2BlvKQD7jTerXQiA1fyhrYOseSOTQIRRKCqmV0L%2BZDgIwZ7NgAPzul377J8hXBYtv21960bQ56x%2BduT2xE7EPEkxR4YX2WVQJ%2Fz%2FL6S8PflTyGpyoRstJ0XlALxd6lvZaqGe9k1h8NSpVHd6mfaf%2BHKPiulM6iSx%2FNwfPWc8RdGRHcS7L8Ju1Y11nUBrdHRAiCZ3FxG%2BNZzpb0g2yfSz9QEbqZO4XJqpT0WhEy79x5NNdgRLNk1mBRvwQFOCS7%2BPuuf3sAb9MLj5Z33lgUv6e1VFVprQLwGFKztMd%2FAZKZnKQWTzcg5AsQ%2BaMKbp9sgGOqUBqb26tX7GRYiaGOehrDlRRQf8NdaoJYUi0s6qZxZsLkZu8rkKpMfdqYJF1Wyx1wQTiuOHde58v2dyFmOyQwOH8FKJR5SaZN7hzz5oIfTixK7B824mrM7krhipdD6R5wEFuNeUxcwH3PdBFr28QgqvU9Ic70aGNuOm8LAFHraSIcabJeT%2BaJAMX80XQP7DLGnCjOQYg4NC755obBe9kqdeT9uyfIao&X-Amz-Signature=cf268ee6a012b86cbd7b5a64f0596d681d487259d6710295938f8ec08166735e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
