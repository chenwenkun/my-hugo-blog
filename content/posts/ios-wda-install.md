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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WZYHLD4K%2F20260113%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260113T061948Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDUaCXVzLXdlc3QtMiJHMEUCIAtt7mq43QKf5Mw6diRvRYXzE3F2uhytWFXEQfyjMtmaAiEAo5WIM%2Bg5P%2FqmpYKdd3OXIkavlISAUeknKH%2FvlgW0UGYqiAQI%2Fv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDG6RX0B%2BSKbtCATDzCrcA%2Ft3yXLCTNw3vRQqJf0ygQUKedc1nIsB1bfx%2BEjuj8sNHUnTIyG1SzzQU6QnvlKFgO13zrrvHxyY7Pgv9yKf21gi1OBmlb2HhF%2Fwp04BqA1PdSf8q%2Flx5qAqEggcj4ZkAUdRx7hi%2Bu2uScBcO8jdRCQdr7cvreXTMhaUXf3uwo16mTUSOaWQj6K6QY3mmsa74mUA%2BxgeCJveXrNCOnewCcJKFqmDIb2Q%2Fk93Qg1K%2B7C%2BYCo6a4gsrlvJ3RI0u3JQzdA3TMdsSvUBT%2FAO%2BTDl306d7zbaodquk0nkm4b%2FEIGtXqjrbtaCwIw8tLNVP2B%2B8MSrfcWTCaLJFi7rVywMpobHhUJl29wtJdAQb%2F%2FN8VkhAL28yMlQVUHQk%2Bs6VMJacs4gpps%2FJ4nvLF%2F68YBPDPhXCyHMCOuOsMKgvHSbDyjGJ%2BuAiiHT%2FwhLTAueyJoGrDa%2FfLVqKJrRjHKELOx8MQnTiK0N7NWRYXnRBjACZgHrwfmG%2FSKpsKuwslnTsTbs6%2F5VabTYQfSf1IUkqlMF8AjoHA%2Fk3y2PUnHVB8trd1kvoVZPcts3NCcmOtndDemAU4jjEb5zjJda47%2BhRNGT8R0uakvYDkbXx7YY1E65%2FS4YkTaxkP%2F1uf7USVvAMIqgl8sGOqUBnp9XtBWA0PZ3MbPGzpuw1ug9suKST%2BKJS6iGhOeJdOGzudgfpRICNKBQ2P7rXxxyPO%2Fr8Syl8EIgv6aIxSVG6AHcQ9awqr3IedeQCJ59%2FG9BSU%2FhPH8f9YqalKmcN%2Fhyo4a11Wjv43NGDqvxoB0CHAG5bh4p6J5%2FLsSG%2FnDccLmB6hCbB4wnPFhD2c%2FKZCbp9SVbqsXl2M0oY2EFgvcCqhWzfnm%2F&X-Amz-Signature=e50682e406a6ebb684295bef47a7dd8c5ec3f76aa0775673edfb9ad0a7b84335&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WZYHLD4K%2F20260113%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260113T061948Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDUaCXVzLXdlc3QtMiJHMEUCIAtt7mq43QKf5Mw6diRvRYXzE3F2uhytWFXEQfyjMtmaAiEAo5WIM%2Bg5P%2FqmpYKdd3OXIkavlISAUeknKH%2FvlgW0UGYqiAQI%2Fv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDG6RX0B%2BSKbtCATDzCrcA%2Ft3yXLCTNw3vRQqJf0ygQUKedc1nIsB1bfx%2BEjuj8sNHUnTIyG1SzzQU6QnvlKFgO13zrrvHxyY7Pgv9yKf21gi1OBmlb2HhF%2Fwp04BqA1PdSf8q%2Flx5qAqEggcj4ZkAUdRx7hi%2Bu2uScBcO8jdRCQdr7cvreXTMhaUXf3uwo16mTUSOaWQj6K6QY3mmsa74mUA%2BxgeCJveXrNCOnewCcJKFqmDIb2Q%2Fk93Qg1K%2B7C%2BYCo6a4gsrlvJ3RI0u3JQzdA3TMdsSvUBT%2FAO%2BTDl306d7zbaodquk0nkm4b%2FEIGtXqjrbtaCwIw8tLNVP2B%2B8MSrfcWTCaLJFi7rVywMpobHhUJl29wtJdAQb%2F%2FN8VkhAL28yMlQVUHQk%2Bs6VMJacs4gpps%2FJ4nvLF%2F68YBPDPhXCyHMCOuOsMKgvHSbDyjGJ%2BuAiiHT%2FwhLTAueyJoGrDa%2FfLVqKJrRjHKELOx8MQnTiK0N7NWRYXnRBjACZgHrwfmG%2FSKpsKuwslnTsTbs6%2F5VabTYQfSf1IUkqlMF8AjoHA%2Fk3y2PUnHVB8trd1kvoVZPcts3NCcmOtndDemAU4jjEb5zjJda47%2BhRNGT8R0uakvYDkbXx7YY1E65%2FS4YkTaxkP%2F1uf7USVvAMIqgl8sGOqUBnp9XtBWA0PZ3MbPGzpuw1ug9suKST%2BKJS6iGhOeJdOGzudgfpRICNKBQ2P7rXxxyPO%2Fr8Syl8EIgv6aIxSVG6AHcQ9awqr3IedeQCJ59%2FG9BSU%2FhPH8f9YqalKmcN%2Fhyo4a11Wjv43NGDqvxoB0CHAG5bh4p6J5%2FLsSG%2FnDccLmB6hCbB4wnPFhD2c%2FKZCbp9SVbqsXl2M0oY2EFgvcCqhWzfnm%2F&X-Amz-Signature=c243b4d4f3d55184835ceaa398110eb7441af39fdce2a12fb9f92fc5ca6d497a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
