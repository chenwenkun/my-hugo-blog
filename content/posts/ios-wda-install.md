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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V2EWNLXQ%2F20251107%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251107T122112Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCWhxJcY40meyIbXYS%2Bt3OW2%2FExsDSRA%2FKFth%2FIiKOm5wIgXvMxpeDjmSJVkG71SM%2BJY3I%2BlN0hvHo17BG3s0OPoi8qiAQIvf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDHMFjQn3DLDkLpZ%2FHircA4ARv3r1EpVdEYYZPm59DS%2B4cxhmE4T5%2Fn5NkdREHfhiLtXbIP0d9W96RNBj%2FLabFB%2FUloa8pS6h%2B%2B2%2BjAil%2FJCrciLkUJ2YuDGkGDU%2F81TAP%2F0G0MqSWdT%2BTlxIvvpGEG8BMzKERqXMvKx7qgOX5djdyc%2Bq03K88sKnup1Yw80Hjj5QLTH8YSlkTv3K6WPKZB3AQzr%2Fy30w%2BUDG6x9tWVJ2BI5M3jxoaNyymp9%2B28%2Fw5X8dxoj3z2G1bKMdOIrGRRatr%2BU29SRwTWkK%2FErcrAiOBd09V%2BbTq%2FfKpg09XrqYRa6fxx%2BQaIoISkxL3dR534s1BWFsf32grUGPDzIbzVpsZqUvdRkGWliqw9vJ40XXy25r20ZA%2BoZZOyTYyY%2FdK9rO1ea4fuVQlNh67T4tkveT3xZePazvgc%2FHAxA2dGDDNFPgeOxpJfUsDhYVEoDaRoM9keCwtmwkk8hx5vDCivmD71kpg9D48%2FtW%2BVliDIUBg8aJMMkTOGAi4xuYnNrFuj3%2BXXMER%2B81ZPyQikhjmJ6OyX7srOozpi0AGQOvgyV8JiqNJLoQ1BlpLFTxQg7EOJgv84Ph2gtMYIHRo1RMIyG%2BsGGs%2Fyc4gJbVT63QUNYxzyOpvYhtQ0A5q1pvMKXGt8gGOqUBUN4U76L%2FdE99%2BhlyGKAe%2FPMIIKeApQhdzr6OK3w3wKsTzWoSfvssD0g7RsH7Hd4ZLdZ4Rf3%2Fam6MMSjt%2BIqXnd6ubwMi8qf6gvlie%2BmZRHGcJxmSKgt2G9Wt2I5rqqP7ruVMU28lNHRpeLu2ibqZKRvlL77sccqkTFmlHuOpvWk9b%2FtvW2TS5lpR3s86dMe%2BkCRuJ6LCmCgRSb00Urx9Mm5rHjiv&X-Amz-Signature=b631b2ade716aeb8fef7f824114d235a5685a214e59da54d5321e070eda95aff&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V2EWNLXQ%2F20251107%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251107T122112Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCWhxJcY40meyIbXYS%2Bt3OW2%2FExsDSRA%2FKFth%2FIiKOm5wIgXvMxpeDjmSJVkG71SM%2BJY3I%2BlN0hvHo17BG3s0OPoi8qiAQIvf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDHMFjQn3DLDkLpZ%2FHircA4ARv3r1EpVdEYYZPm59DS%2B4cxhmE4T5%2Fn5NkdREHfhiLtXbIP0d9W96RNBj%2FLabFB%2FUloa8pS6h%2B%2B2%2BjAil%2FJCrciLkUJ2YuDGkGDU%2F81TAP%2F0G0MqSWdT%2BTlxIvvpGEG8BMzKERqXMvKx7qgOX5djdyc%2Bq03K88sKnup1Yw80Hjj5QLTH8YSlkTv3K6WPKZB3AQzr%2Fy30w%2BUDG6x9tWVJ2BI5M3jxoaNyymp9%2B28%2Fw5X8dxoj3z2G1bKMdOIrGRRatr%2BU29SRwTWkK%2FErcrAiOBd09V%2BbTq%2FfKpg09XrqYRa6fxx%2BQaIoISkxL3dR534s1BWFsf32grUGPDzIbzVpsZqUvdRkGWliqw9vJ40XXy25r20ZA%2BoZZOyTYyY%2FdK9rO1ea4fuVQlNh67T4tkveT3xZePazvgc%2FHAxA2dGDDNFPgeOxpJfUsDhYVEoDaRoM9keCwtmwkk8hx5vDCivmD71kpg9D48%2FtW%2BVliDIUBg8aJMMkTOGAi4xuYnNrFuj3%2BXXMER%2B81ZPyQikhjmJ6OyX7srOozpi0AGQOvgyV8JiqNJLoQ1BlpLFTxQg7EOJgv84Ph2gtMYIHRo1RMIyG%2BsGGs%2Fyc4gJbVT63QUNYxzyOpvYhtQ0A5q1pvMKXGt8gGOqUBUN4U76L%2FdE99%2BhlyGKAe%2FPMIIKeApQhdzr6OK3w3wKsTzWoSfvssD0g7RsH7Hd4ZLdZ4Rf3%2Fam6MMSjt%2BIqXnd6ubwMi8qf6gvlie%2BmZRHGcJxmSKgt2G9Wt2I5rqqP7ruVMU28lNHRpeLu2ibqZKRvlL77sccqkTFmlHuOpvWk9b%2FtvW2TS5lpR3s86dMe%2BkCRuJ6LCmCgRSb00Urx9Mm5rHjiv&X-Amz-Signature=d4747c3485dbe2362d4ceb4b2c2ecc9ec9e3f60e28914d7bfb491627ea95b0ff&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
