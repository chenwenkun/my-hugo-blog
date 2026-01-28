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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665TM6U5KL%2F20260128%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260128T182439Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCRM%2FbbXtUuabq0162P2tRbWwBx%2F5hvaabpXRykcrKTCgIgOTBcrKNkRl6%2BZkUOQYGuHrJJWTzGCYiJZDCkONVScWsq%2FwMIcxAAGgw2Mzc0MjMxODM4MDUiDL6VorXtIZa5VhcPISrcAykr23pcz%2Ft3lW5a9U6XhwZYbP%2FpzhMcCJQklkKhj1qmndRmycB7150GKn9HkV%2BbWOLj%2BVAAwZLaPzPEsuU1rCbl7pgFtdtPnxNfuc4SOKnamqVd4e0D%2Bp1kXKbASFsZ6LCkDIvrQKTTnT3122iaLxOdTvY7nsqwIukcEc7GM3tN4LHcE%2B9SGTxDZXcz0GUNV0UGJuhnvbZLTztPFnn%2BZWI0sxunM4hXllqSqR9%2BNOddjWWhchM%2BtUrVVkoghyMH1nHP4UDhaIBaVuclGzqaMwzO6a834TUWXLaPmcWJQRqSk4rl0Zjj3uCAEG087Fb%2B7YbqC%2FTHOPKnZJlWhkd5HFTFVwOlnKLtB4JZMa9GjOCNeYtyY8t7p6ODdLylkbBZqLI%2Fqj8mK6uBt7ALPa3eAmRqhDtmJa5Cr88y7svhGIb4ftIDU4Ysiev5jdyRsr2JvjnMY2hLKj8%2F2sV1HhcKpia%2BUm5J1MDyNd%2BA33lvJhM84xFC5HzLr2MUKyAbIJxTNAknFgUTHlgduZh4I%2FHafdKnLF3arVbd6Dh%2BXmpq07Pwy7QlHEPs4loUKYmvLF59fJCdmHgjZ%2BF5xNXmMio6Evqcju%2BD%2FIvlzjJpHrEuorP5RDA6fvXpes9Ewrb8MKaW6csGOqUBZ1uuCVVRZIo8RnMkR23j4FtIcMdS7cbAjNsVTrKFkcXO3j7zxyX1X3GZMyF58iDmiaujiEKOzTUAjG%2BIlAdY8Cc%2FE8%2FrxkXYCWIJ%2FVHaqXCL%2FUJnhAmUWQyaTTRPKOkW%2FlEZY7xY7zbqsuu0iSJOrXnjYWBV2LcQtRvIjKlaFvWTlzAH%2BnmLkWdAtMVxN7Lf3WNsKzE%2FETLbjbW444Z2No6Zz%2F5w&X-Amz-Signature=36b75e37570479c02a5704e060726427178a453c918643903285d06d90a265f2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665TM6U5KL%2F20260128%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260128T182439Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCRM%2FbbXtUuabq0162P2tRbWwBx%2F5hvaabpXRykcrKTCgIgOTBcrKNkRl6%2BZkUOQYGuHrJJWTzGCYiJZDCkONVScWsq%2FwMIcxAAGgw2Mzc0MjMxODM4MDUiDL6VorXtIZa5VhcPISrcAykr23pcz%2Ft3lW5a9U6XhwZYbP%2FpzhMcCJQklkKhj1qmndRmycB7150GKn9HkV%2BbWOLj%2BVAAwZLaPzPEsuU1rCbl7pgFtdtPnxNfuc4SOKnamqVd4e0D%2Bp1kXKbASFsZ6LCkDIvrQKTTnT3122iaLxOdTvY7nsqwIukcEc7GM3tN4LHcE%2B9SGTxDZXcz0GUNV0UGJuhnvbZLTztPFnn%2BZWI0sxunM4hXllqSqR9%2BNOddjWWhchM%2BtUrVVkoghyMH1nHP4UDhaIBaVuclGzqaMwzO6a834TUWXLaPmcWJQRqSk4rl0Zjj3uCAEG087Fb%2B7YbqC%2FTHOPKnZJlWhkd5HFTFVwOlnKLtB4JZMa9GjOCNeYtyY8t7p6ODdLylkbBZqLI%2Fqj8mK6uBt7ALPa3eAmRqhDtmJa5Cr88y7svhGIb4ftIDU4Ysiev5jdyRsr2JvjnMY2hLKj8%2F2sV1HhcKpia%2BUm5J1MDyNd%2BA33lvJhM84xFC5HzLr2MUKyAbIJxTNAknFgUTHlgduZh4I%2FHafdKnLF3arVbd6Dh%2BXmpq07Pwy7QlHEPs4loUKYmvLF59fJCdmHgjZ%2BF5xNXmMio6Evqcju%2BD%2FIvlzjJpHrEuorP5RDA6fvXpes9Ewrb8MKaW6csGOqUBZ1uuCVVRZIo8RnMkR23j4FtIcMdS7cbAjNsVTrKFkcXO3j7zxyX1X3GZMyF58iDmiaujiEKOzTUAjG%2BIlAdY8Cc%2FE8%2FrxkXYCWIJ%2FVHaqXCL%2FUJnhAmUWQyaTTRPKOkW%2FlEZY7xY7zbqsuu0iSJOrXnjYWBV2LcQtRvIjKlaFvWTlzAH%2BnmLkWdAtMVxN7Lf3WNsKzE%2FETLbjbW444Z2No6Zz%2F5w&X-Amz-Signature=c3d01839ac00f075e589e560ea23b377aeb37f39fb74a9b310b0dee17205f9c5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
