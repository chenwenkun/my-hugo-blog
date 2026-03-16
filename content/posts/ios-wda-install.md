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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663OMDSIY7%2F20260316%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260316T184731Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBAaCXVzLXdlc3QtMiJHMEUCIQCJerM6VLDyMXO0SjYIb6A7WE8eyMycLczNJBlvcSrMHwIgFxt4OSpr7xpEL3V1xju1mKkl%2BKtzKIBX%2BkLnyPQBr%2FkqiAQI2P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDEUp14wjprPdyhKAfCrcA3rfgjr7V6Q7WI6jGUqsyPpAXxkB%2Fw65dS%2FIfGvm0oXIVpqlrTyPCnC7dWauJILobnHRWdjmFTGV4tgBaG2Vw%2BB188x8XPKzajT8oAjdIj5MZcnK5QvCbPqDe%2FcX6VXwaIfONXOLo3jW59CEKs57Oj6OZQZJ5myG8%2FZWOIoYGmtr%2FuY95W16b%2F2Y75col6g8YOSvBSxHvd3cyAQGG8XIHHKwNLOFNJzrPfTcLZfGEtLjPyT8SzfrsmCBeaH4H9XB23iqbFQWlMMD%2F7flP%2BiPV6rdbBKBdEqk4pnvBi8SZkZCfmZgTGUELBvPQDVhX23mIW2Ib%2BEQc1IUCsggKkG8zYFCDNy1D6pianxzNT8dMh4%2FfR38C2%2BoaxCx24lwgZ1qaGnllD5P5bA%2FSBiHx8IefyaJPKux15%2F48eNhGH8EdjwRXOIS%2B%2BtikKpJIvTpWY396J7X8QQE6LCmyvlT3%2B4IUuGGRaQ%2FuGktffWijT6%2B7ndho4%2FWQu36M8Ns8knbKatOZyett3XYbJRZCN9bmtGPRdxQ7P%2BgFrqRSnLHSTkeDQZVo909XYCSB%2BJXQL8SVZKDp5wy88HE07qc56DpqT9RXeSy%2Bh6Q%2FfYErwTvDKqATgcQ6fcmiN50KGO2BY18MM%2B%2B4M0GOqUBlIoEbfjII1pvhOFNSdyT3hyh%2B0r12bMkx6RtIJOkCO1LlMsL%2FLjYDgRiyD1nIrJ9Qyb%2FECkOumV9r2wGmH%2B%2F6TLwKFHtZBF712qHf%2FFY5PHDnO%2Fvdk%2Fqk%2F7MkrfMtWF5Jvk62VWLUNufHktzKhpFKiQnFh1N5C4unOYmDMEWd%2Bq6mQ156Zp91CSTTEZrGE2wC8HBf%2B%2BEUrJIl1XZSeYNJiISf%2F0P&X-Amz-Signature=194e2c6b27fe034f8fcaaa47b93a10351f7b9b81a230aa4435329853a4d8aa2d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663OMDSIY7%2F20260316%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260316T184731Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBAaCXVzLXdlc3QtMiJHMEUCIQCJerM6VLDyMXO0SjYIb6A7WE8eyMycLczNJBlvcSrMHwIgFxt4OSpr7xpEL3V1xju1mKkl%2BKtzKIBX%2BkLnyPQBr%2FkqiAQI2P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDEUp14wjprPdyhKAfCrcA3rfgjr7V6Q7WI6jGUqsyPpAXxkB%2Fw65dS%2FIfGvm0oXIVpqlrTyPCnC7dWauJILobnHRWdjmFTGV4tgBaG2Vw%2BB188x8XPKzajT8oAjdIj5MZcnK5QvCbPqDe%2FcX6VXwaIfONXOLo3jW59CEKs57Oj6OZQZJ5myG8%2FZWOIoYGmtr%2FuY95W16b%2F2Y75col6g8YOSvBSxHvd3cyAQGG8XIHHKwNLOFNJzrPfTcLZfGEtLjPyT8SzfrsmCBeaH4H9XB23iqbFQWlMMD%2F7flP%2BiPV6rdbBKBdEqk4pnvBi8SZkZCfmZgTGUELBvPQDVhX23mIW2Ib%2BEQc1IUCsggKkG8zYFCDNy1D6pianxzNT8dMh4%2FfR38C2%2BoaxCx24lwgZ1qaGnllD5P5bA%2FSBiHx8IefyaJPKux15%2F48eNhGH8EdjwRXOIS%2B%2BtikKpJIvTpWY396J7X8QQE6LCmyvlT3%2B4IUuGGRaQ%2FuGktffWijT6%2B7ndho4%2FWQu36M8Ns8knbKatOZyett3XYbJRZCN9bmtGPRdxQ7P%2BgFrqRSnLHSTkeDQZVo909XYCSB%2BJXQL8SVZKDp5wy88HE07qc56DpqT9RXeSy%2Bh6Q%2FfYErwTvDKqATgcQ6fcmiN50KGO2BY18MM%2B%2B4M0GOqUBlIoEbfjII1pvhOFNSdyT3hyh%2B0r12bMkx6RtIJOkCO1LlMsL%2FLjYDgRiyD1nIrJ9Qyb%2FECkOumV9r2wGmH%2B%2F6TLwKFHtZBF712qHf%2FFY5PHDnO%2Fvdk%2Fqk%2F7MkrfMtWF5Jvk62VWLUNufHktzKhpFKiQnFh1N5C4unOYmDMEWd%2Bq6mQ156Zp91CSTTEZrGE2wC8HBf%2B%2BEUrJIl1XZSeYNJiISf%2F0P&X-Amz-Signature=1d8f6c156850c71d2874d2dd92e0183c601af0d7deef5671bd7a661d69ec1bfb&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
