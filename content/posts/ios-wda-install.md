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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466S6UI6VOQ%2F20260116%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260116T062006Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEH4aCXVzLXdlc3QtMiJIMEYCIQCMePDIEw78ib04wfv16H6Hw09HqRCJe2HpfsrvLZEINAIhAJEpTc8jYvcQ%2BDjBWh9l2pqSskZopkX8w7UbFdQUUth0Kv8DCEcQABoMNjM3NDIzMTgzODA1IgyUdED68tobhCD9Twoq3AOEfSlH4%2BqkDbeW%2FkO7PsOQO8n6u5DSqIu2GtROtEwha%2Bvq5reuT5WKOHxci8Pd7jZgF8oBuxsDlqUsx25w6MyQz%2BRgowzZ0aOXHucq2bNWxC5PwgnMvK0OLBAM56Bxu%2BkJKQABs9Mwo23lxIM4z4JtYne%2BGoLgb0dzPUX5L%2BBGCLFhfpFLvJp2EfDh72C1kCCxyGNgrUyTl9N5dj%2BKn4LR0%2FFH8JiY%2BqVYdtIb9CW%2FWHoObjGw4DJYmX1CdAkavGAnLwILqtPcZMY6V36tdk%2FsS2IbVE52u2TxyUHFcEhJs3GeLYhl9xgVM90J8TfFHQ6JXrlAQ9i8j4sMbsSZrVeMw2oVZajjVxmGgH3nwFULODBlg0hYwIu0F%2FMERpgAdMjYZoCdnHFXkPMafdnnFi7o5KDML%2Fe96B58PQLQYAeSfnyrJd3E0h2%2BIsuF5PzXLp%2Bmc2aNKOSAC18%2Bgv21Yt8%2FIoi8fgZDm8OA%2B%2BNUmSVB%2FqmPkLu4OB5c0kvJmFwSvlShCCzYIEBxpSYSYsu%2BCM0c8B%2FzckCUGzNV7%2BvtxYb%2FdxEcNqs8HUn%2BsfMRN9EMzOM5Ws%2Fse6XbOSl95tNNsrj8erx6xYXzqF5m2r37et5KdVFU8VMNaBI%2B8adB%2FDDWrKfLBjqkATkUt80QSLu8bbhpBEUFjeITxvGe1pzYif5j%2BJ06rAPYZO0AWz4%2F9Cwz9iyiwBuxbxZAqGkBxy1pcKjByuFcVTMUVYw8ueoYFUNlkMJT6P2nACXm%2FAjfBzXijq0a6Ui3UuZA7I0nYrNQP0F6yUvv8ZS%2FbNA%2BaixYHqMLN2Kn5%2BVUn9REoJcrkPELLsP9HZD%2FLcX7uveR%2FiE9sKkqXYtKdwEdFx80&X-Amz-Signature=2376eaeaf9b39a5a1b1e9d6a45d100c72abbe89d0ce85ad4eeb17f979f5aa309&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466S6UI6VOQ%2F20260116%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260116T062006Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEH4aCXVzLXdlc3QtMiJIMEYCIQCMePDIEw78ib04wfv16H6Hw09HqRCJe2HpfsrvLZEINAIhAJEpTc8jYvcQ%2BDjBWh9l2pqSskZopkX8w7UbFdQUUth0Kv8DCEcQABoMNjM3NDIzMTgzODA1IgyUdED68tobhCD9Twoq3AOEfSlH4%2BqkDbeW%2FkO7PsOQO8n6u5DSqIu2GtROtEwha%2Bvq5reuT5WKOHxci8Pd7jZgF8oBuxsDlqUsx25w6MyQz%2BRgowzZ0aOXHucq2bNWxC5PwgnMvK0OLBAM56Bxu%2BkJKQABs9Mwo23lxIM4z4JtYne%2BGoLgb0dzPUX5L%2BBGCLFhfpFLvJp2EfDh72C1kCCxyGNgrUyTl9N5dj%2BKn4LR0%2FFH8JiY%2BqVYdtIb9CW%2FWHoObjGw4DJYmX1CdAkavGAnLwILqtPcZMY6V36tdk%2FsS2IbVE52u2TxyUHFcEhJs3GeLYhl9xgVM90J8TfFHQ6JXrlAQ9i8j4sMbsSZrVeMw2oVZajjVxmGgH3nwFULODBlg0hYwIu0F%2FMERpgAdMjYZoCdnHFXkPMafdnnFi7o5KDML%2Fe96B58PQLQYAeSfnyrJd3E0h2%2BIsuF5PzXLp%2Bmc2aNKOSAC18%2Bgv21Yt8%2FIoi8fgZDm8OA%2B%2BNUmSVB%2FqmPkLu4OB5c0kvJmFwSvlShCCzYIEBxpSYSYsu%2BCM0c8B%2FzckCUGzNV7%2BvtxYb%2FdxEcNqs8HUn%2BsfMRN9EMzOM5Ws%2Fse6XbOSl95tNNsrj8erx6xYXzqF5m2r37et5KdVFU8VMNaBI%2B8adB%2FDDWrKfLBjqkATkUt80QSLu8bbhpBEUFjeITxvGe1pzYif5j%2BJ06rAPYZO0AWz4%2F9Cwz9iyiwBuxbxZAqGkBxy1pcKjByuFcVTMUVYw8ueoYFUNlkMJT6P2nACXm%2FAjfBzXijq0a6Ui3UuZA7I0nYrNQP0F6yUvv8ZS%2FbNA%2BaixYHqMLN2Kn5%2BVUn9REoJcrkPELLsP9HZD%2FLcX7uveR%2FiE9sKkqXYtKdwEdFx80&X-Amz-Signature=4b3db50042d9affeeff31cdac1fe0d85b00ddc0715eef9f998e91f248070cda7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
