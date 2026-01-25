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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664A7HZ65W%2F20260125%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260125T181716Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGAaCXVzLXdlc3QtMiJGMEQCIGAmRq4m%2FZQKipougQ7YboWffQTMN0uQQ8FMe3TV6Iq3AiBiMJCpkyzgjNBY83E9sRV6pLGHSdHXv7M7eGZSjhvAuir%2FAwgpEAAaDDYzNzQyMzE4MzgwNSIMpd7yTj48kTVqRYyUKtwDPYqtkgW7IHgbIQa118Ol%2FWW81f38zG4g85tJkeytyPVcicrZeEpV4GSsnZQJ9jixMwkoxgRp3n%2FOb8mX85IFlkYB48JpJnP0xCSjTv0Sx0bnduCTXiKic0PbT0n0wUrdx3u12giWXGugH24QozNwguVGjG98pxLcQ1m0OYPdz9%2FdY0nviFA5IO09q2iyyH5r0om3LnFistz2wy3NMSspydc9eA1NWxIKQxm%2BwWAoargkmiH%2FFDEh0cQqdSGC34KUJngFZmoeML8dObAJK29wMBlAvHTK7rhYsdTIVg%2Bs99jcG9ZI2M87kdtX4Rm%2BCy8roFrbm57Ek4jXCVvC85Et7a%2BDwR7pabVnnE5yLdVriFfKJP%2F39MF0u3GxzDAjsFxu%2FUkacDKFT83%2BUugwtu9Is7dOnzQxzOdT1iRGjhhyibeu7i0QHlSg%2FOWQEmtlcNVZjRiDUPGV6toUSywP9qglyO%2Fx3T3Kx0cyZW%2FSPpF9DqfqUrEfJQ2QpiBQYEOCyvzA5dambUdlYbLl2m4d4uS1%2BPr1wWFQ7Iet8AKmn9ied5s9wRmAyfqt8%2BL7KW2Kpqg6%2BAj6v8O9pegnSGTnzphL2K%2Fo2m2JK9zt%2BD%2B2RHiND9RaGdU9aOiE6eUKaGIwrvnYywY6pgHpomL9d%2BNt4PEQGCelLXtuLqlnSZNcmqpIUpQK1q5F5sncpaggb75HGLFsenViONyc8hMw9UXrttlOIlXJ1ACqMq1kulLslrE7Dp6We73olIQL5a90RGLJ1iy9at1CpwvnDMgZ1uYohkunjYpwmr0sft8iHkXA3RQRNkajiWw4puA2NSaDo8CD4YmSoRQ2CmM8TpZyc2k6Xl2I72MmODU1yP8B%2BAd%2B&X-Amz-Signature=69b496942819b59ea49847195a88620860e4a0f313bf161481d66aa88d3a3f1e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664A7HZ65W%2F20260125%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260125T181716Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGAaCXVzLXdlc3QtMiJGMEQCIGAmRq4m%2FZQKipougQ7YboWffQTMN0uQQ8FMe3TV6Iq3AiBiMJCpkyzgjNBY83E9sRV6pLGHSdHXv7M7eGZSjhvAuir%2FAwgpEAAaDDYzNzQyMzE4MzgwNSIMpd7yTj48kTVqRYyUKtwDPYqtkgW7IHgbIQa118Ol%2FWW81f38zG4g85tJkeytyPVcicrZeEpV4GSsnZQJ9jixMwkoxgRp3n%2FOb8mX85IFlkYB48JpJnP0xCSjTv0Sx0bnduCTXiKic0PbT0n0wUrdx3u12giWXGugH24QozNwguVGjG98pxLcQ1m0OYPdz9%2FdY0nviFA5IO09q2iyyH5r0om3LnFistz2wy3NMSspydc9eA1NWxIKQxm%2BwWAoargkmiH%2FFDEh0cQqdSGC34KUJngFZmoeML8dObAJK29wMBlAvHTK7rhYsdTIVg%2Bs99jcG9ZI2M87kdtX4Rm%2BCy8roFrbm57Ek4jXCVvC85Et7a%2BDwR7pabVnnE5yLdVriFfKJP%2F39MF0u3GxzDAjsFxu%2FUkacDKFT83%2BUugwtu9Is7dOnzQxzOdT1iRGjhhyibeu7i0QHlSg%2FOWQEmtlcNVZjRiDUPGV6toUSywP9qglyO%2Fx3T3Kx0cyZW%2FSPpF9DqfqUrEfJQ2QpiBQYEOCyvzA5dambUdlYbLl2m4d4uS1%2BPr1wWFQ7Iet8AKmn9ied5s9wRmAyfqt8%2BL7KW2Kpqg6%2BAj6v8O9pegnSGTnzphL2K%2Fo2m2JK9zt%2BD%2B2RHiND9RaGdU9aOiE6eUKaGIwrvnYywY6pgHpomL9d%2BNt4PEQGCelLXtuLqlnSZNcmqpIUpQK1q5F5sncpaggb75HGLFsenViONyc8hMw9UXrttlOIlXJ1ACqMq1kulLslrE7Dp6We73olIQL5a90RGLJ1iy9at1CpwvnDMgZ1uYohkunjYpwmr0sft8iHkXA3RQRNkajiWw4puA2NSaDo8CD4YmSoRQ2CmM8TpZyc2k6Xl2I72MmODU1yP8B%2BAd%2B&X-Amz-Signature=352e61bb15f1939fd13817a295b39397f1ce5c33e699b339238350a06cae72f8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
