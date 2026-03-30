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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466T2DTWEUZ%2F20260330%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260330T012316Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFAaCXVzLXdlc3QtMiJHMEUCIQCYT6YICgBEik2xZZOaITR4r6kv2Ok8P8%2B6U7Jn7xybXQIgTFWlZv%2B6ljW9ZX8ExQCr4NB9crrF5YJmk6jg0wVmzI4q%2FwMIGRAAGgw2Mzc0MjMxODM4MDUiDDn%2FQYMlTUQX2T6cxyrcA1yz0DnD1tzCvDK%2BgMUhPsiOnXtMAsgEpWjJYC9RuFPvTBqqjb5nhkFdB9a2Yb5QAo1WM6VkzSRSYMjC3XtUXuibF1gGcfL%2Bzoyy3f6c%2B0wNfmVehQsE9k9Bix%2Fz60JfurQQAkqBr1y3MrQoib%2Fy706T8Zjqeuiu7Y%2Fotqvse2ZfGVTINkkGNjsqU7Iepo2DSspO5VJfhEjiXtBBo8EB7YRKJ6fWqG9UTZGeCrkDtzIYMUnX59EEKW0VzfHLSUcBizOnvap%2F5WwDAW85ef8bdpayQ1Q89xdlNJ%2B0VuqXEhLos%2FTctXi2T65EbehGzGfktl%2BWCoFODlGK6GL4eedhGNl0E2UNRoePD7cMBCgXYFDdmU6bhJt2WoucMkzOZilO3jp4BTFta6z%2BumHf9DRBY0y9mIH%2BOe6CGtMr7u0NDNzV9Tq4IF1SCEMuVdNknop6vsZx4aPohd6Pl1MWPc2qEYL55NsutHrw8667diNXjMtraLG3EhBlBom%2FxT0C1AxMCMhFPhGhHl0im%2BC%2FEiUP4ImuCXMbGsUkVfdPFQARnc8e3R6JiXJ61WNV4C60qkx%2B1uhgaqBdI2uAzPu8VTmxx9hskm9QWpUnmC4gvxbDn%2FqN2koR0wa%2FnuEPb823MNz4ps4GOqUBV2fHEDPg%2B2aGOmr1nCRUahrdz75kXnBIilKdD7B07R6RfKz2BvD3oD%2FvmWvM2stwXCUZvp2KaNrod4nqZxH8C4bTlrcWzEVy7kFzvjhCIH9H0oizJIcN%2BldNhFzXdykzoDa4HBC6qwOGS15KjJXQ9jwHt0V2MQ%2FWUSCxO5oA6zjH0bUSmFQKKfu%2BxgiFICgMvCgrBgPk9QhaAJngIEdaK%2B0ymX4c&X-Amz-Signature=56d576c7723b668c5111c6fec14aea1e84b7a9127aa62e062c2e981a2e48d2c8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466T2DTWEUZ%2F20260330%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260330T012316Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFAaCXVzLXdlc3QtMiJHMEUCIQCYT6YICgBEik2xZZOaITR4r6kv2Ok8P8%2B6U7Jn7xybXQIgTFWlZv%2B6ljW9ZX8ExQCr4NB9crrF5YJmk6jg0wVmzI4q%2FwMIGRAAGgw2Mzc0MjMxODM4MDUiDDn%2FQYMlTUQX2T6cxyrcA1yz0DnD1tzCvDK%2BgMUhPsiOnXtMAsgEpWjJYC9RuFPvTBqqjb5nhkFdB9a2Yb5QAo1WM6VkzSRSYMjC3XtUXuibF1gGcfL%2Bzoyy3f6c%2B0wNfmVehQsE9k9Bix%2Fz60JfurQQAkqBr1y3MrQoib%2Fy706T8Zjqeuiu7Y%2Fotqvse2ZfGVTINkkGNjsqU7Iepo2DSspO5VJfhEjiXtBBo8EB7YRKJ6fWqG9UTZGeCrkDtzIYMUnX59EEKW0VzfHLSUcBizOnvap%2F5WwDAW85ef8bdpayQ1Q89xdlNJ%2B0VuqXEhLos%2FTctXi2T65EbehGzGfktl%2BWCoFODlGK6GL4eedhGNl0E2UNRoePD7cMBCgXYFDdmU6bhJt2WoucMkzOZilO3jp4BTFta6z%2BumHf9DRBY0y9mIH%2BOe6CGtMr7u0NDNzV9Tq4IF1SCEMuVdNknop6vsZx4aPohd6Pl1MWPc2qEYL55NsutHrw8667diNXjMtraLG3EhBlBom%2FxT0C1AxMCMhFPhGhHl0im%2BC%2FEiUP4ImuCXMbGsUkVfdPFQARnc8e3R6JiXJ61WNV4C60qkx%2B1uhgaqBdI2uAzPu8VTmxx9hskm9QWpUnmC4gvxbDn%2FqN2koR0wa%2FnuEPb823MNz4ps4GOqUBV2fHEDPg%2B2aGOmr1nCRUahrdz75kXnBIilKdD7B07R6RfKz2BvD3oD%2FvmWvM2stwXCUZvp2KaNrod4nqZxH8C4bTlrcWzEVy7kFzvjhCIH9H0oizJIcN%2BldNhFzXdykzoDa4HBC6qwOGS15KjJXQ9jwHt0V2MQ%2FWUSCxO5oA6zjH0bUSmFQKKfu%2BxgiFICgMvCgrBgPk9QhaAJngIEdaK%2B0ymX4c&X-Amz-Signature=64309169e88842fe0adef3c20e39f319e52d03ef01dfcacd12271baf7f3a1c95&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
