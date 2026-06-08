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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RFNK3TCA%2F20260608%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260608T152605Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCICLE30cd7Fm2OWNtLoHgfPGzdq1KDGH5z0EitWSEITz9AiEA%2BuS1Hsc2LwehLd7vj07S1A0gkYlSBpVEBrk5XQ9TT9kqiAQIt%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDGvgc7MnzFgRmhTgzSrcA2PK720R25gWDezEU7aOK3wC2c2y5R91Tv%2BINHZHhH6%2FmCq3UruAEjiztAOikoHxtvs6No8BLMGRJTLnLW1VYdYMlN6x%2Fa7ItTz7tBj8vRYTNQMlv8rZvX3CPCBxoyhRLhJL2Sqowht%2BQCBAbFHsGgb729mZOjp1DkpMWktLBbmfJkkygJPGVG8J8PVeZe%2Fp8alUWn4j1TE0E3DG2Yxv6bqFIK%2FnIjVAxLvhd0BxE6UmEQu02CDbvIRvjUbrmhL6dzNFgm92D7H3qhY8hCSrhQQEOekwvzNeEdVZqf1CSV874FaPQ4%2Ffi79fYDGZRmPYJfff%2F08kPx%2FGOqsIReKagyV93t189eXgR6SU8xAwe5PO%2Fc0mWwXjvSgP%2FFBhVBJdLRYEwWTFXaXsJ8odxSOhq5sJGdaU595h3A7u%2BBj5N72UC2RrHCTx1b85eX7j%2FzFWJg%2FHWvr4qiRwgBhx2M%2FVtxFlStBr6qhOIVITq6xSX%2B39weQX4YJkUJ%2FoPaLz6M%2Fx4oghH7HlpTR%2FkgQxoueABZaKaiK%2BSZ%2BRWCmOkpuHS3uF7r%2BC2hQ3hmIQvLoEhuZbnEBYBEUA31VPOix1QV1aIgg%2FDWqeFqdPyUx1PeBU3e%2BnCRDl6UmkHUiQ1jbEMLSem9EGOqUBfvmV4%2B6OfDOtEzRWkv4H%2BdabgPejmI1khAl5AIpUq92Ymcx0n%2FHdu%2FIt72QHoqWr9Uxe8Gs1J43DElPmak3xjTK8xciZeHfVuTVtayGRjHAH%2Bh8yo1dV2orRYRQWf3%2BljXewXziNkVslEvKPeZxBtDCQXPPEzKerfDCOqFDKOD%2FcCcQ5JpX4vTvSQTuUjnkvK5YcLpUP%2FsGRW%2BDWgW8TjyszfUja&X-Amz-Signature=62c5feafc098a9eca0e947efcbae3cc6682c62a5569c8595282bc3367ed3b4f5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RFNK3TCA%2F20260608%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260608T152605Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCICLE30cd7Fm2OWNtLoHgfPGzdq1KDGH5z0EitWSEITz9AiEA%2BuS1Hsc2LwehLd7vj07S1A0gkYlSBpVEBrk5XQ9TT9kqiAQIt%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDGvgc7MnzFgRmhTgzSrcA2PK720R25gWDezEU7aOK3wC2c2y5R91Tv%2BINHZHhH6%2FmCq3UruAEjiztAOikoHxtvs6No8BLMGRJTLnLW1VYdYMlN6x%2Fa7ItTz7tBj8vRYTNQMlv8rZvX3CPCBxoyhRLhJL2Sqowht%2BQCBAbFHsGgb729mZOjp1DkpMWktLBbmfJkkygJPGVG8J8PVeZe%2Fp8alUWn4j1TE0E3DG2Yxv6bqFIK%2FnIjVAxLvhd0BxE6UmEQu02CDbvIRvjUbrmhL6dzNFgm92D7H3qhY8hCSrhQQEOekwvzNeEdVZqf1CSV874FaPQ4%2Ffi79fYDGZRmPYJfff%2F08kPx%2FGOqsIReKagyV93t189eXgR6SU8xAwe5PO%2Fc0mWwXjvSgP%2FFBhVBJdLRYEwWTFXaXsJ8odxSOhq5sJGdaU595h3A7u%2BBj5N72UC2RrHCTx1b85eX7j%2FzFWJg%2FHWvr4qiRwgBhx2M%2FVtxFlStBr6qhOIVITq6xSX%2B39weQX4YJkUJ%2FoPaLz6M%2Fx4oghH7HlpTR%2FkgQxoueABZaKaiK%2BSZ%2BRWCmOkpuHS3uF7r%2BC2hQ3hmIQvLoEhuZbnEBYBEUA31VPOix1QV1aIgg%2FDWqeFqdPyUx1PeBU3e%2BnCRDl6UmkHUiQ1jbEMLSem9EGOqUBfvmV4%2B6OfDOtEzRWkv4H%2BdabgPejmI1khAl5AIpUq92Ymcx0n%2FHdu%2FIt72QHoqWr9Uxe8Gs1J43DElPmak3xjTK8xciZeHfVuTVtayGRjHAH%2Bh8yo1dV2orRYRQWf3%2BljXewXziNkVslEvKPeZxBtDCQXPPEzKerfDCOqFDKOD%2FcCcQ5JpX4vTvSQTuUjnkvK5YcLpUP%2FsGRW%2BDWgW8TjyszfUja&X-Amz-Signature=bc64be8f7bd6949050e5218b2b3490b62c3c67f2c392dc543501b2d21e7de233&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
