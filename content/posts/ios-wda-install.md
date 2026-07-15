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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663DLJ4KXX%2F20260715%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260715T185331Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGsaCXVzLXdlc3QtMiJHMEUCIQD3hMStw5lhgWuoD3zclzfXtvsIafTnCeNPnJhwYAxcGgIgZ2HnKhlFh9O8boiNd24w6nUY0TWbpxs1gugfwUdcrO4q%2FwMIMxAAGgw2Mzc0MjMxODM4MDUiDNMkm9N81%2FusnmIwPCrcAwL0St%2BcxYwkEolM56K53iQaXcHHcVx3OmViPOfdJHUAj%2Fwo%2FB79liUgbkJyVLGeByQUOFaSmbpkEFeWeiAcZd4%2FmZRq%2Fmxkv26vYENcNqg5%2Fd0THtex6AbWDrg3dQu6WjZwLLJHdEJ5oFhskMlMwNH7J0pCXudor%2BUqwdt03lRqRvESNCHclVIZY%2B6hxxq0pSZWWAOojLYU79%2BB3Fj2EabhVNhJd%2BSYi1y3ca5t0y1tG5yxuY6JDqHV6%2BNQJS44IA3gqbbQIeOGdSM8%2FCWXD4LqFLL2CjFDLPnUDLJ3ug%2BMy79a5eF7josV2dw%2B%2FlcAo52vwejiqwSl8colDm5LneKI4hn1TBbd5mtJKX8RlTOx69ysPAiW9bSSAVtdcWG4GOJBYD7Om9Qh4xKXTDw1Vu5eNw5mxmtrpdGCUETbYv9EYrJrojxOiFo%2Fs1B2VclsXP90bdoV49dR1sDLF79B2NzMdyrXI841Jvda7ZgTqihearY0JrSbp9r%2BgqG1TBfhQy5YS9DEZLk918k6m9QOrn74R5mx6i3GuiQNq0o7sa%2F9J3aMQxl5y3J3ftW1xzQJsIdfHpoFJITe9TEK2%2FmiOy%2FbG0z3KZOHVZtN7VG6uigLTQqdRAkS4cA98IBiMMOf39IGOqUBcg8mclkyAiyYVIiPVNG4YPeEpEdz825tGyIhpgeBWl%2BjZUnNoAuVw7uq2InaVC%2Bi4HxXHDApUJmyhmIZMvKtyHfXTzbqhR7OViWycUjZ90jwo3nC0jFV2RidOe6nosBtRapaP1w4zsjAHCXmQVtBz6cKzcoT0DAUU9GpYqpmirm0YVr3vUSGnLnd9vwHPeiOAoouZhKhImR8ysnZC3pd7KW%2FBWc1&X-Amz-Signature=c95d6fc16ccf42a9e88ff23bd0a30e2754ac4cb7d88520605be5c73e6aa2c0ee&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663DLJ4KXX%2F20260715%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260715T185331Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGsaCXVzLXdlc3QtMiJHMEUCIQD3hMStw5lhgWuoD3zclzfXtvsIafTnCeNPnJhwYAxcGgIgZ2HnKhlFh9O8boiNd24w6nUY0TWbpxs1gugfwUdcrO4q%2FwMIMxAAGgw2Mzc0MjMxODM4MDUiDNMkm9N81%2FusnmIwPCrcAwL0St%2BcxYwkEolM56K53iQaXcHHcVx3OmViPOfdJHUAj%2Fwo%2FB79liUgbkJyVLGeByQUOFaSmbpkEFeWeiAcZd4%2FmZRq%2Fmxkv26vYENcNqg5%2Fd0THtex6AbWDrg3dQu6WjZwLLJHdEJ5oFhskMlMwNH7J0pCXudor%2BUqwdt03lRqRvESNCHclVIZY%2B6hxxq0pSZWWAOojLYU79%2BB3Fj2EabhVNhJd%2BSYi1y3ca5t0y1tG5yxuY6JDqHV6%2BNQJS44IA3gqbbQIeOGdSM8%2FCWXD4LqFLL2CjFDLPnUDLJ3ug%2BMy79a5eF7josV2dw%2B%2FlcAo52vwejiqwSl8colDm5LneKI4hn1TBbd5mtJKX8RlTOx69ysPAiW9bSSAVtdcWG4GOJBYD7Om9Qh4xKXTDw1Vu5eNw5mxmtrpdGCUETbYv9EYrJrojxOiFo%2Fs1B2VclsXP90bdoV49dR1sDLF79B2NzMdyrXI841Jvda7ZgTqihearY0JrSbp9r%2BgqG1TBfhQy5YS9DEZLk918k6m9QOrn74R5mx6i3GuiQNq0o7sa%2F9J3aMQxl5y3J3ftW1xzQJsIdfHpoFJITe9TEK2%2FmiOy%2FbG0z3KZOHVZtN7VG6uigLTQqdRAkS4cA98IBiMMOf39IGOqUBcg8mclkyAiyYVIiPVNG4YPeEpEdz825tGyIhpgeBWl%2BjZUnNoAuVw7uq2InaVC%2Bi4HxXHDApUJmyhmIZMvKtyHfXTzbqhR7OViWycUjZ90jwo3nC0jFV2RidOe6nosBtRapaP1w4zsjAHCXmQVtBz6cKzcoT0DAUU9GpYqpmirm0YVr3vUSGnLnd9vwHPeiOAoouZhKhImR8ysnZC3pd7KW%2FBWc1&X-Amz-Signature=9329dae0143b337f8ea42f5897846bba8bc36b72fbd4ae45652cf93db1a22f5e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
