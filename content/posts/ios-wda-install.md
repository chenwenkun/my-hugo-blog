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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZFF5SCD4%2F20260105%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260105T181921Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIEyiZF%2FLWqj%2FgqpISh0zb8wc7rqL4tObrAOhE6Z%2FMTrZAiEAszdQH4Zl9sdA9g6xqobVzjur7hfpXtRAhFuR%2FFu96QMq%2FwMISxAAGgw2Mzc0MjMxODM4MDUiDHfbm55p5taLi6hzKCrcAxFLatlP1URboly9TGypZ9bwlvIFFVKOSqk%2BSrCIZZvyj8MCSh6OjOmFt73Ol1tDfY4jMcNGXd7ayNxqBdxw9G8SM9aObKW%2F8ZxGBke6IeFYFXfYn8pKjVicfhX397UYRZXskiSMv1Ri81Ayi60840M5uakswq5qclJ%2BmsR9l9JLnwNtjhCVan3d5ZNuv2Vw2O%2FtfC3km%2Fxa2vUJNZjjhZsMf1OCDL%2BxI%2BXv5b3Dv%2FyAquKsFr8FJYFyR%2Fbu9cYvc7Tvdj8ajxrIPM7L2ly04dheQnMrxWbOA6M0YTudrYSGhaEbREhaMREQ1xoUDLSHIb9hNi1uDp3CAwZOzxw1QYJQp%2F4KfXBtWZLicEeLyyOz5lL12UBjbU21t3YDZgjzKoilTy9Iy%2F4HhWMMbYztW9NBz4EdTf0oQD8ZSLa2GKBBoNql%2FAEnsMB6XxwWhp0Xw4RXYlCBmrrLu0bXBA5sn87sCZ3XLwYUvx5HhVEJ360j1CNNEvDq%2BQ4DdIUB6bi1dK0jaKjo87eRr5LS00e3TE37k1a25vE2sK%2FpRTqTiWpBr%2FjyoMjarNy9IWQhSX%2B43u9MPb3SYGDVd3%2F2AVZeLZ5GEaI3%2FNLwOVHMStprF%2BTJkWDOBE5hqdyqVmSnMOXw78oGOqUBNM%2BhNafm3uKpW%2BvXMYSEvC30Hhr6sfYEhBSVbceMYcA7YG%2B%2Bt5brzEU73Gqpp%2Bb7zLz%2FMjcyWT8wAuNzCQ33Lgz%2B2u23BvZ1i5nsCgzZwoSJDjTalzpv3ys0R8TE4ghwLgaZe2tx9g8VSIUGG%2B%2BGCwxSPnmsK88YkxXNIMVZ%2FD3ulban9CgDtUpPQaaXDa%2FEyUIvQ%2FLFdcPCQByC49P7VzdwpOIm&X-Amz-Signature=778e832e1349488331db6fa543b850fee557de642436a68117907c152f25545a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZFF5SCD4%2F20260105%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260105T181921Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIEyiZF%2FLWqj%2FgqpISh0zb8wc7rqL4tObrAOhE6Z%2FMTrZAiEAszdQH4Zl9sdA9g6xqobVzjur7hfpXtRAhFuR%2FFu96QMq%2FwMISxAAGgw2Mzc0MjMxODM4MDUiDHfbm55p5taLi6hzKCrcAxFLatlP1URboly9TGypZ9bwlvIFFVKOSqk%2BSrCIZZvyj8MCSh6OjOmFt73Ol1tDfY4jMcNGXd7ayNxqBdxw9G8SM9aObKW%2F8ZxGBke6IeFYFXfYn8pKjVicfhX397UYRZXskiSMv1Ri81Ayi60840M5uakswq5qclJ%2BmsR9l9JLnwNtjhCVan3d5ZNuv2Vw2O%2FtfC3km%2Fxa2vUJNZjjhZsMf1OCDL%2BxI%2BXv5b3Dv%2FyAquKsFr8FJYFyR%2Fbu9cYvc7Tvdj8ajxrIPM7L2ly04dheQnMrxWbOA6M0YTudrYSGhaEbREhaMREQ1xoUDLSHIb9hNi1uDp3CAwZOzxw1QYJQp%2F4KfXBtWZLicEeLyyOz5lL12UBjbU21t3YDZgjzKoilTy9Iy%2F4HhWMMbYztW9NBz4EdTf0oQD8ZSLa2GKBBoNql%2FAEnsMB6XxwWhp0Xw4RXYlCBmrrLu0bXBA5sn87sCZ3XLwYUvx5HhVEJ360j1CNNEvDq%2BQ4DdIUB6bi1dK0jaKjo87eRr5LS00e3TE37k1a25vE2sK%2FpRTqTiWpBr%2FjyoMjarNy9IWQhSX%2B43u9MPb3SYGDVd3%2F2AVZeLZ5GEaI3%2FNLwOVHMStprF%2BTJkWDOBE5hqdyqVmSnMOXw78oGOqUBNM%2BhNafm3uKpW%2BvXMYSEvC30Hhr6sfYEhBSVbceMYcA7YG%2B%2Bt5brzEU73Gqpp%2Bb7zLz%2FMjcyWT8wAuNzCQ33Lgz%2B2u23BvZ1i5nsCgzZwoSJDjTalzpv3ys0R8TE4ghwLgaZe2tx9g8VSIUGG%2B%2BGCwxSPnmsK88YkxXNIMVZ%2FD3ulban9CgDtUpPQaaXDa%2FEyUIvQ%2FLFdcPCQByC49P7VzdwpOIm&X-Amz-Signature=3c27c4d1dfa7bcd3ef3c18551685b3531a06f966e5eaae0a3ddb16c4a29dc4f9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
