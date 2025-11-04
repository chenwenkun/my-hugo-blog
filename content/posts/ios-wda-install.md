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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WKRICFOV%2F20251104%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251104T122315Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDm1Py0ZW3mT9ZJGKCBw%2Bdj4vvnNBicaP2OL0uFT83gUQIgZ%2BWhHyZsQp%2B9g0sHUVFsfxCXFjq5un0bI4JS7OPcCgMq%2FwMIdBAAGgw2Mzc0MjMxODM4MDUiDOx2TsfbZn4RwbZNdSrcAxDEO5wv8qJFBTjNo5hki7I4a%2BO6D5IyfI%2Fq5lVekzYsKrjHXoH9QBtjzru3J4gv59ROSwaG5R7DePe1zcRLh%2B4SRyfQsDZaByWOKDn5v1NGFiEGVK6mA8%2FGx%2FMlkpxfMg6xEJueumCcl14mvjRW5isjElu15dFZye0%2BnkKT0WAbTnCmHGp6JRh0rqmTSRViI71JbPa5r%2Bjtr2lL82SHpIhu%2B02bOMvMuopBk1WQrN6jyL4GBze1zBBlce2KSvpeoDiAiDrrI8%2FECp%2FLooYDGV%2FUxI3WCZeg8ZdqreHxM1s%2FE%2FvKANwemuqoHoAYsTtPOr7hRGw2pBeEcsCrUr%2BP3%2Bx3tJPGpMyiEma2CvDCoPy1e1C8Q9z%2BRXEVzBdWKkD3op%2Bc5WEw0I0VTo%2B8UuAK3PwjdW3AH8gzZfT3CMpnUfJC8Hl7SFxWrwMDY5vBDZP3sc4PTEDiyxGy%2BLeJpPxPGdWbVPtPApe%2Fx2GQpLuenVNr0Wrl6%2F6PZqXlyj5MTGksi%2FdA8NmCRNb89sZpMDIVsPoc3dOt38oVwIMstj%2BoFxUSwQGYuBo2axKnnVBLTb7KWJnTFTz3%2Br4kFIzvEMkpS0MKd%2BTNHxcgS0tJJ1%2F5QeeuoG07rGfgvHTvrTcHMOzGp8gGOqUBqSxbLt1oQ8XHpRADuGfLAWhE9XWx1JlTHvhyLGESXPA8CN8m0IqN8z9aHt6LT%2FYyirCbxfTXQeFYFh09pfUzf4J%2B3ZBOKGEc%2FPUyaDFf%2BdDA%2FeWYBgE8WJSjfOntTmRJ6NyIh%2FiI%2B8udDdvbeAZKD0P3vdGz%2FMEGCixXNkrTTQWzdKLI2H%2F9dX2cfun%2Bl6%2F71xxFe%2BoQh2n%2F3DbuN2UFmYtKRwgB&X-Amz-Signature=b27e4dd4cdfeb22f8d8da1a591ae0839f44a8d774d4c5a62b6ca6a6b49d6307a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WKRICFOV%2F20251104%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251104T122315Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDm1Py0ZW3mT9ZJGKCBw%2Bdj4vvnNBicaP2OL0uFT83gUQIgZ%2BWhHyZsQp%2B9g0sHUVFsfxCXFjq5un0bI4JS7OPcCgMq%2FwMIdBAAGgw2Mzc0MjMxODM4MDUiDOx2TsfbZn4RwbZNdSrcAxDEO5wv8qJFBTjNo5hki7I4a%2BO6D5IyfI%2Fq5lVekzYsKrjHXoH9QBtjzru3J4gv59ROSwaG5R7DePe1zcRLh%2B4SRyfQsDZaByWOKDn5v1NGFiEGVK6mA8%2FGx%2FMlkpxfMg6xEJueumCcl14mvjRW5isjElu15dFZye0%2BnkKT0WAbTnCmHGp6JRh0rqmTSRViI71JbPa5r%2Bjtr2lL82SHpIhu%2B02bOMvMuopBk1WQrN6jyL4GBze1zBBlce2KSvpeoDiAiDrrI8%2FECp%2FLooYDGV%2FUxI3WCZeg8ZdqreHxM1s%2FE%2FvKANwemuqoHoAYsTtPOr7hRGw2pBeEcsCrUr%2BP3%2Bx3tJPGpMyiEma2CvDCoPy1e1C8Q9z%2BRXEVzBdWKkD3op%2Bc5WEw0I0VTo%2B8UuAK3PwjdW3AH8gzZfT3CMpnUfJC8Hl7SFxWrwMDY5vBDZP3sc4PTEDiyxGy%2BLeJpPxPGdWbVPtPApe%2Fx2GQpLuenVNr0Wrl6%2F6PZqXlyj5MTGksi%2FdA8NmCRNb89sZpMDIVsPoc3dOt38oVwIMstj%2BoFxUSwQGYuBo2axKnnVBLTb7KWJnTFTz3%2Br4kFIzvEMkpS0MKd%2BTNHxcgS0tJJ1%2F5QeeuoG07rGfgvHTvrTcHMOzGp8gGOqUBqSxbLt1oQ8XHpRADuGfLAWhE9XWx1JlTHvhyLGESXPA8CN8m0IqN8z9aHt6LT%2FYyirCbxfTXQeFYFh09pfUzf4J%2B3ZBOKGEc%2FPUyaDFf%2BdDA%2FeWYBgE8WJSjfOntTmRJ6NyIh%2FiI%2B8udDdvbeAZKD0P3vdGz%2FMEGCixXNkrTTQWzdKLI2H%2F9dX2cfun%2Bl6%2F71xxFe%2BoQh2n%2F3DbuN2UFmYtKRwgB&X-Amz-Signature=1bfbb65a0b51beb38c540031379ce2563edd27d761c0e88f66da75ddce47816e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
