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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664JSDMVME%2F20260603%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260603T204555Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHwaCXVzLXdlc3QtMiJHMEUCIEgJA%2BqZi3VW8Fg5wNBY7JBhaxuUdkLvlRIxv3GY6IXGAiEAi7pbBK399PTzd7AjEgpQVl%2FQ6H1e5FIcjTPzCh9TGRMq%2FwMIRBAAGgw2Mzc0MjMxODM4MDUiDKhpmh2MEzZnCpPsVyrcAyohO6wLTMzcAg4BHW32tK4upFanjuNdaR%2FVi%2BL0T7xVrmhMXv3lIna7RZmnEpqR%2BRy8mURokCa6GzE4P2dwjR0BwL%2FlM3tT5sEnHTPTOvnpwR6ewm1TjCMqoBIUMlWeZSp9pNMWjOWZpWYYWj9lSWqezKhAGv0rgQ3oeirzEUm%2FTPxKwoeUkkmS1MhywSuRh4bK5nHqp5N%2FfuY8mcEHzD%2BDj4UYYS8fkHYGCShRm31NYvS2OGlbI%2Fmjrw%2BVmJE7e4VyHzhlMNJwOQtzZMn6CRl4UxOOd5fFqR%2FEjqL6ONqpsryygw5xmvSm2cPl6nVnonn4Q5E6s%2FvctLdGeKja9kvq8ppiwpMX9lIm4kqrm6%2B7A8wGLgQE7kuHIiHNy%2FsCrHP0KNLH1qqOGyUh0zmJsiv%2FBaFGvUG%2FNETdrByzALQGrkARS78jMFljkoYO1XCT0WBTubNcU8ZpnAHBemFQMRjC%2FI3aotbEhXBktqJTTSWk5K6Wcs8%2B3UG8MNNdjQuRmh4Lir3g8I9TQu3VT6nHSUHP1%2BPU1DUONtUChMAt%2FX6OREedXYV3Ptwcv0Ned93Bp3Ya8sUspIiQD792JixiyEHXxeZkWXIl2tKm0QFvP45Jk0Pk6s9pnVRCAHO5MJ3%2BgdEGOqUBhb2T73oR07sHo6enm8LMYD%2BIWewNCHyJC8N3n%2Ba51%2BXPsDhsjBCiw0sEOoqkyU%2FKK1qwXRVGwnZVC68VzHnmdWhk2jQ3P%2BQ8OnXouTVdeE8uyqXfIGVYMMgaP2LnEHcAueHrRNxSe6YrDb2siEFGdo%2BwwYutpRxtk1164vwiMTiETRWYRCQGAozKFyApJvnRtzuJNC99Ygf9rIAnc%2BmXA1Izy7MZ&X-Amz-Signature=9e16518002865f8bc5ff357d4c9705868a57e0292b4dce18059486f9f4aee9b1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664JSDMVME%2F20260603%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260603T204555Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHwaCXVzLXdlc3QtMiJHMEUCIEgJA%2BqZi3VW8Fg5wNBY7JBhaxuUdkLvlRIxv3GY6IXGAiEAi7pbBK399PTzd7AjEgpQVl%2FQ6H1e5FIcjTPzCh9TGRMq%2FwMIRBAAGgw2Mzc0MjMxODM4MDUiDKhpmh2MEzZnCpPsVyrcAyohO6wLTMzcAg4BHW32tK4upFanjuNdaR%2FVi%2BL0T7xVrmhMXv3lIna7RZmnEpqR%2BRy8mURokCa6GzE4P2dwjR0BwL%2FlM3tT5sEnHTPTOvnpwR6ewm1TjCMqoBIUMlWeZSp9pNMWjOWZpWYYWj9lSWqezKhAGv0rgQ3oeirzEUm%2FTPxKwoeUkkmS1MhywSuRh4bK5nHqp5N%2FfuY8mcEHzD%2BDj4UYYS8fkHYGCShRm31NYvS2OGlbI%2Fmjrw%2BVmJE7e4VyHzhlMNJwOQtzZMn6CRl4UxOOd5fFqR%2FEjqL6ONqpsryygw5xmvSm2cPl6nVnonn4Q5E6s%2FvctLdGeKja9kvq8ppiwpMX9lIm4kqrm6%2B7A8wGLgQE7kuHIiHNy%2FsCrHP0KNLH1qqOGyUh0zmJsiv%2FBaFGvUG%2FNETdrByzALQGrkARS78jMFljkoYO1XCT0WBTubNcU8ZpnAHBemFQMRjC%2FI3aotbEhXBktqJTTSWk5K6Wcs8%2B3UG8MNNdjQuRmh4Lir3g8I9TQu3VT6nHSUHP1%2BPU1DUONtUChMAt%2FX6OREedXYV3Ptwcv0Ned93Bp3Ya8sUspIiQD792JixiyEHXxeZkWXIl2tKm0QFvP45Jk0Pk6s9pnVRCAHO5MJ3%2BgdEGOqUBhb2T73oR07sHo6enm8LMYD%2BIWewNCHyJC8N3n%2Ba51%2BXPsDhsjBCiw0sEOoqkyU%2FKK1qwXRVGwnZVC68VzHnmdWhk2jQ3P%2BQ8OnXouTVdeE8uyqXfIGVYMMgaP2LnEHcAueHrRNxSe6YrDb2siEFGdo%2BwwYutpRxtk1164vwiMTiETRWYRCQGAozKFyApJvnRtzuJNC99Ygf9rIAnc%2BmXA1Izy7MZ&X-Amz-Signature=bddacefc5213620d68c1c3c0e10e690c07eed40fc91827188e28a1793d239a73&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
