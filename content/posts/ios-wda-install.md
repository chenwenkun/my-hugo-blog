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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XMBTZETQ%2F20260520%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260520T021103Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBoaCXVzLXdlc3QtMiJIMEYCIQDozhCgywq0fstt80I%2FNxUCMe3cajzbItCj5NgCW84huQIhAPylDAjQ6p9oCmao72M3Ch%2BIJm2MA8O6iTryHxd5V7PiKogECOP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzZRExEgetJBFcdJoYq3APxEpmmzyuHBq2EzArRacjfHancuGejTyzKYV67g9KCiMPepJVJP5NnRtwplxsLGFpF1Uh1oC%2BUA8ZQz3I2VCmKFAnqgpzUfZADtUMt8A2nYDN8jOaZGibcDfVQMCLA02i3LjGAHjSAuWuYyvIHW9XQNmWMeW%2FcKiLaYz4kpmyqPYdhQJRa8xtx2Hr5WBd%2BxDZoEnz0QaDdtu9SfDSK4zomp5ScI58C9WfvzLBwErHAig%2BP1My1CUjX3M6mmKK%2BbcryYXag7tK%2Bd1Za4lr5bnIXyvQvYAxKWkAxUchmqjdlSBZWb4mO4PIUOfxMfsyxg9RdwpcKbvJHN4iCHhEFmZy81TTBM5hhL3H4hi1z5Aje92%2FB7%2FDDGlJoZJ1BPWfTLOfYpe2j659w7MgXObecRgnIWfWwxGYly5FVfAqlmZQIRClIe93IBL0q1xRVJGg5d8PehnR8fUozyoxvdBNpgKNnTK30V72Vo%2BG38Nk%2FJu8ys%2BKqcNg5TKqNn2SEKQcg1732Vg4zTRrBmCVzVqxl6Ew3FgG7o4G2X5z38uAlL%2B1ZidhbXBM%2B86DqfurCFlraQV1RSX1Ij%2FD7xGaXE4JEYYsvnoKj6quhcdcJDtDxqBea%2BjoVcMxAMY0U9mO7SDDyrLTQBjqkAYWuH1d901aU1wBXvv9UhDALskZ70z15BECk8q7PIGHZEjE7ppg1NpclYcFgvQXH%2FOFZDsJnzYEkVXNHO5GJN1YG063aaeflpFIVtlXHhEA5F4%2Fno9Aefd8EgGGBz8FRaqbC0VtSsxIHAZJwEsaHP7GvkIZCJ3d9xQMP%2B2fPoMEXcy%2F7apbxRjfxklPqno5qAenwAxPKoSH%2FwySztzVamjUGCCKl&X-Amz-Signature=c9c090d8788d6731cc1b814c2452866020a4c9e6c6a83e58976599d0b0b69075&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XMBTZETQ%2F20260520%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260520T021103Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBoaCXVzLXdlc3QtMiJIMEYCIQDozhCgywq0fstt80I%2FNxUCMe3cajzbItCj5NgCW84huQIhAPylDAjQ6p9oCmao72M3Ch%2BIJm2MA8O6iTryHxd5V7PiKogECOP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzZRExEgetJBFcdJoYq3APxEpmmzyuHBq2EzArRacjfHancuGejTyzKYV67g9KCiMPepJVJP5NnRtwplxsLGFpF1Uh1oC%2BUA8ZQz3I2VCmKFAnqgpzUfZADtUMt8A2nYDN8jOaZGibcDfVQMCLA02i3LjGAHjSAuWuYyvIHW9XQNmWMeW%2FcKiLaYz4kpmyqPYdhQJRa8xtx2Hr5WBd%2BxDZoEnz0QaDdtu9SfDSK4zomp5ScI58C9WfvzLBwErHAig%2BP1My1CUjX3M6mmKK%2BbcryYXag7tK%2Bd1Za4lr5bnIXyvQvYAxKWkAxUchmqjdlSBZWb4mO4PIUOfxMfsyxg9RdwpcKbvJHN4iCHhEFmZy81TTBM5hhL3H4hi1z5Aje92%2FB7%2FDDGlJoZJ1BPWfTLOfYpe2j659w7MgXObecRgnIWfWwxGYly5FVfAqlmZQIRClIe93IBL0q1xRVJGg5d8PehnR8fUozyoxvdBNpgKNnTK30V72Vo%2BG38Nk%2FJu8ys%2BKqcNg5TKqNn2SEKQcg1732Vg4zTRrBmCVzVqxl6Ew3FgG7o4G2X5z38uAlL%2B1ZidhbXBM%2B86DqfurCFlraQV1RSX1Ij%2FD7xGaXE4JEYYsvnoKj6quhcdcJDtDxqBea%2BjoVcMxAMY0U9mO7SDDyrLTQBjqkAYWuH1d901aU1wBXvv9UhDALskZ70z15BECk8q7PIGHZEjE7ppg1NpclYcFgvQXH%2FOFZDsJnzYEkVXNHO5GJN1YG063aaeflpFIVtlXHhEA5F4%2Fno9Aefd8EgGGBz8FRaqbC0VtSsxIHAZJwEsaHP7GvkIZCJ3d9xQMP%2B2fPoMEXcy%2F7apbxRjfxklPqno5qAenwAxPKoSH%2FwySztzVamjUGCCKl&X-Amz-Signature=54b258b3b305bbd2bf3d5f3584f616b40d5f28818d5e8c0aab87058237c329e0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
