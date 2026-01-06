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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WOYUU6YG%2F20260106%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260106T005816Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCeb6dMtEoIFAfhcMO6OEZrjMbE1Umg9jbVbYKXly%2BNWgIgFetCn7j%2Fi9XPT%2FSimr4d2Q2nQMuxGQZA0xqB3h3IQvIq%2FwMIURAAGgw2Mzc0MjMxODM4MDUiDL7kf5329rDrRb12aircA4Xj%2BJq7h0k1YWXRHQMUAAhGKLLUn2QCaUT%2BQRgtCeQebL6oF%2BevPHvztstGSCCTvCRc27PhbNpwkwuEebmsxezCPeIGAQh%2BF5%2BCUXtD%2FB4MxLUvIKnO4EERHM1PpWLBo1aiRlkNMu5ajq9PZ3u49A%2B5d4%2Fmxu4%2BWTC2sn9tSGMgZnbk5pAbaIENg%2Bxg6Tw3vnaBN4J0rncUcZomyTxad2mkqEULBNDQHMRHJJ%2BlZAZVSbKzQySMV2%2FBfZNc%2FtdOsItnZXP397J8lnG%2FMoGlaGG46Op8IOao2x8pvaRGRay6SBYC7%2BcY8bzQ1HVgR2ATM3GviyTQa5Sj5Mgmx2HMIPOGwiErInyAZjeuG4JP1D4BhGexmsDqLTFgGMsIA5cWs6PvkvdHA5rIlniZ%2F4YIVASiv0rSpAAIjdxkbu7Umryhc8BquPjsAq3auKd8et%2B0lL1fHstYrbezVgIMxQAYvVu98lQOSsv1p3W8mG2NpxcbFMLfn5g2Xtm2AvWoTreywp3BhhmvrKdP6ZTGnRpCTu8OHOOlJfTJhCRUzqIouIQTNonayz46zkstrgyFpJPDje8Px%2FIXHOyi2jo6%2FnkaIPxplxaonXbPn8Vvj9yLItQKeZFJ3gWRoYxrvsMHMNuq8coGOqUB3tVcuUzQbYcpfMDIbNRctXWZqPWt7HtoacKcLDVY11uq%2BIxot8yqRkS3OZuc9ISQbAiO7NWov6AIpO8%2FT5ip5QUCHgidxrAtEA7nP82fF4RtBRHA71EIn0sWQyMZIEjrfUIbm8%2FWwdW6T0HrxkNlcB0vjWrzawb3LgeJmBRwRJj%2FZZwuzWF9eQ4xzXen6hNesmbUC19z6cN%2FqiCNYuiz9BM6IzMw&X-Amz-Signature=1dff0c0ebaf34b024a5f8c4e096438efb752def5d807fa664b56f8250feafd82&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WOYUU6YG%2F20260106%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260106T005816Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCeb6dMtEoIFAfhcMO6OEZrjMbE1Umg9jbVbYKXly%2BNWgIgFetCn7j%2Fi9XPT%2FSimr4d2Q2nQMuxGQZA0xqB3h3IQvIq%2FwMIURAAGgw2Mzc0MjMxODM4MDUiDL7kf5329rDrRb12aircA4Xj%2BJq7h0k1YWXRHQMUAAhGKLLUn2QCaUT%2BQRgtCeQebL6oF%2BevPHvztstGSCCTvCRc27PhbNpwkwuEebmsxezCPeIGAQh%2BF5%2BCUXtD%2FB4MxLUvIKnO4EERHM1PpWLBo1aiRlkNMu5ajq9PZ3u49A%2B5d4%2Fmxu4%2BWTC2sn9tSGMgZnbk5pAbaIENg%2Bxg6Tw3vnaBN4J0rncUcZomyTxad2mkqEULBNDQHMRHJJ%2BlZAZVSbKzQySMV2%2FBfZNc%2FtdOsItnZXP397J8lnG%2FMoGlaGG46Op8IOao2x8pvaRGRay6SBYC7%2BcY8bzQ1HVgR2ATM3GviyTQa5Sj5Mgmx2HMIPOGwiErInyAZjeuG4JP1D4BhGexmsDqLTFgGMsIA5cWs6PvkvdHA5rIlniZ%2F4YIVASiv0rSpAAIjdxkbu7Umryhc8BquPjsAq3auKd8et%2B0lL1fHstYrbezVgIMxQAYvVu98lQOSsv1p3W8mG2NpxcbFMLfn5g2Xtm2AvWoTreywp3BhhmvrKdP6ZTGnRpCTu8OHOOlJfTJhCRUzqIouIQTNonayz46zkstrgyFpJPDje8Px%2FIXHOyi2jo6%2FnkaIPxplxaonXbPn8Vvj9yLItQKeZFJ3gWRoYxrvsMHMNuq8coGOqUB3tVcuUzQbYcpfMDIbNRctXWZqPWt7HtoacKcLDVY11uq%2BIxot8yqRkS3OZuc9ISQbAiO7NWov6AIpO8%2FT5ip5QUCHgidxrAtEA7nP82fF4RtBRHA71EIn0sWQyMZIEjrfUIbm8%2FWwdW6T0HrxkNlcB0vjWrzawb3LgeJmBRwRJj%2FZZwuzWF9eQ4xzXen6hNesmbUC19z6cN%2FqiCNYuiz9BM6IzMw&X-Amz-Signature=409069250527a1e7d72d1db79933d4ba06e624434fb28fbda69326ad82f2b7f5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
