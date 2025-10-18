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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QOV34OFK%2F20251018%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251018T181321Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBUaCXVzLXdlc3QtMiJHMEUCICfeYObyZR7%2FYOiIaMwrf1NySFnqyV1yHfRjY%2BaNaEAtAiEAtesZpKZl%2Fp0vxfFSKDzCzNgpy6nYWk2EEovPIlnDxPsqiAQIvv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDCkgoSmPZv0dw9XCJCrcA3i08535kLkr9Gz21fsZC4NLcG1xS1YzLPgZU9071bug0bMQfRVLdp%2BXuLdn6Y5kzVGn5v1vlmxFcjy51FjsY4Yx5xYQjDxy%2BpyBgTaTxB6QJuac6Baord3%2B3Ys4zTjT4BGUK4qRMDxaJWT4S53hWlsTTwc4IJsdr1gXwhD2UVHboQFh7XeZiaZBK3ZTO%2FgYuIrd4yHLSAjr%2BOUmQb3NtTIUVvadLwWutLC3odHeV%2FEdXZ1PbiFY7pVkLpSzxPsHjl2QgD%2FfjiOo1Ehbo164zHG6MuZJr0EME6abDp08RCL%2BPtMJTERSflendLNaNBtR5mhyYnUYq4a4xIgaEOGbSwqUL8bL3Mxtnsue1yQhrcYnkkOWenNfs%2BHFDBL2QGFfRf5juB2IU%2BR37OBmr35nQr%2FPFMkAxC0x2cFVnnrE7W7gw3EY8GZCvO0VtT0jkrpw6gNtIstPMhhGep2gWBe2sU9OcPDrommgiB%2F8sNgoQ03TpilAe%2Fm8Xj8heorsfCwzsDFAhfJl%2FlxGqSkpd9tHsbSKgAdZrl%2FYNZwokzBZHm3CNjQ0SXjF9PpM5GhbVtkpXBiKW2SL66qi4m%2FeJXqrQ98P2G09mhmkIMYIpEvdxRStt5XUGblISkm%2F%2FYyZMPSbzscGOqUBmcAvWx1NtnGO4r0psGiw228vYjZ1lEdN37qhIsHm2XOfgNhh7cHSakbXuo%2Fqubkj0TrkvWQp7U0oCh0QUt3FGenfs6fehPzJm%2FEpD6MT6zB8ZJBEhLZUkCW0MC9uZmakeLXYx1Rr%2FKuPX1qwnqroi5gdNzWnOjhzVF%2FQypXhYsnzJBXs5sqUDa%2FquYyjdpwdWMGt5BbaPXd%2FSN9nqTUbT0QWMhgR&X-Amz-Signature=7394390cbec10951d53cbbeff267211253c086372a53fc2d04ffb469847d51ec&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QOV34OFK%2F20251018%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251018T181321Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBUaCXVzLXdlc3QtMiJHMEUCICfeYObyZR7%2FYOiIaMwrf1NySFnqyV1yHfRjY%2BaNaEAtAiEAtesZpKZl%2Fp0vxfFSKDzCzNgpy6nYWk2EEovPIlnDxPsqiAQIvv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDCkgoSmPZv0dw9XCJCrcA3i08535kLkr9Gz21fsZC4NLcG1xS1YzLPgZU9071bug0bMQfRVLdp%2BXuLdn6Y5kzVGn5v1vlmxFcjy51FjsY4Yx5xYQjDxy%2BpyBgTaTxB6QJuac6Baord3%2B3Ys4zTjT4BGUK4qRMDxaJWT4S53hWlsTTwc4IJsdr1gXwhD2UVHboQFh7XeZiaZBK3ZTO%2FgYuIrd4yHLSAjr%2BOUmQb3NtTIUVvadLwWutLC3odHeV%2FEdXZ1PbiFY7pVkLpSzxPsHjl2QgD%2FfjiOo1Ehbo164zHG6MuZJr0EME6abDp08RCL%2BPtMJTERSflendLNaNBtR5mhyYnUYq4a4xIgaEOGbSwqUL8bL3Mxtnsue1yQhrcYnkkOWenNfs%2BHFDBL2QGFfRf5juB2IU%2BR37OBmr35nQr%2FPFMkAxC0x2cFVnnrE7W7gw3EY8GZCvO0VtT0jkrpw6gNtIstPMhhGep2gWBe2sU9OcPDrommgiB%2F8sNgoQ03TpilAe%2Fm8Xj8heorsfCwzsDFAhfJl%2FlxGqSkpd9tHsbSKgAdZrl%2FYNZwokzBZHm3CNjQ0SXjF9PpM5GhbVtkpXBiKW2SL66qi4m%2FeJXqrQ98P2G09mhmkIMYIpEvdxRStt5XUGblISkm%2F%2FYyZMPSbzscGOqUBmcAvWx1NtnGO4r0psGiw228vYjZ1lEdN37qhIsHm2XOfgNhh7cHSakbXuo%2Fqubkj0TrkvWQp7U0oCh0QUt3FGenfs6fehPzJm%2FEpD6MT6zB8ZJBEhLZUkCW0MC9uZmakeLXYx1Rr%2FKuPX1qwnqroi5gdNzWnOjhzVF%2FQypXhYsnzJBXs5sqUDa%2FquYyjdpwdWMGt5BbaPXd%2FSN9nqTUbT0QWMhgR&X-Amz-Signature=459993f256f1c7560420e0933dd6eb174464b6bf66bb921061e77209efa4f190&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
