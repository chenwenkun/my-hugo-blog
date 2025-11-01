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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UAK53INZ%2F20251101%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251101T005544Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFcaCXVzLXdlc3QtMiJIMEYCIQCKWm%2FN5GQiETnoxBj34M7OYiiC0%2F935q3EPDymhyyzSAIhAOTQJeNF8jSpYXWhCmH6c0K0Od7sUYmgVQJhsZAZbncdKv8DCCAQABoMNjM3NDIzMTgzODA1IgwUgZtEWkPa0LLZS2wq3AOm5cZV1OVDev4Z4IWtsipTDMA0GELkAiKR25sRVAkyz1AIx8DtUNAxiUmMCOoAbnSBSKLWlJhTAGUZRr7Mz2mFxg6UxQU4O%2F2QaLFb74HAaiutA0d35jAfDQH%2FbDErTpBJ8lIqxMk9oSC%2BTwmWYeM1%2FQdTy5Vc7ScHfV0lbxlzt05PzugZAkoOze%2F0eN9LI9vZm0U%2BIMecs2rfwr8vmrp6QzhZ1HvsDtFl5tFc4qYgorQLzGOkwnhQ5L8Amm%2B%2BNIzF5wpPC2I8%2BOowdHylwnqYiUPKB1SuMX423%2B7CpmHSteQ3HW%2Fpj7gy80t0vs1cxKjkqXw93wFGVluwXio71HxTAjh6F5tHL9Zx%2BNPAohRLU%2Fzfe%2BN1D7aoi7N3eAHi1lAj0cgxcHrGB15PICkjPHZPdQFpDVRTSw6VLTKrr2Nmv5r%2F5PpxJxCl3d8yR%2FQilO6S9oVmm9PbPDPH6utAUNKJbGtQPKQl5N2wtDvM1iN1ti8MdCs%2FguUKtWoRWQFNKR8Fr2wj2yzyBvrZlDuB5t7Cdsx1XiMGLPX3AEn23YcUBfoly2iMy8dhMfRbpKwUQvTNBw6ISFY2hb4WcQ5syAlmQUtyH%2FlYTsOAS2GdCGcT0SpIrdjjMz1lt6AKXDDb%2BpTIBjqkARDpZOZxTqGgL47erO9V8EUpLtnsUKJftSvNDc2FkqzQUdHSHbpTeGBZ5y7GXgxF4j9uErgUxyOsY4gPTm4%2Bs%2FKYss8MaNe80gOjrnNqR6Zn%2BjGteQbomVHZ%2FesVc3iBO6mesyQbCJ6e23O4AZVIEqwVcD1FjBdtVTk7ZCh6%2BPAzRNXa0VK76Q7JwHh4HDbsGBlIQygK2MyBuUUUnHPaKmVL2Mv8&X-Amz-Signature=43bd0f4b63237a75f03404fd82da8e7d9a3bbf57706a355ed7abdb34e10106c1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UAK53INZ%2F20251101%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251101T005544Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFcaCXVzLXdlc3QtMiJIMEYCIQCKWm%2FN5GQiETnoxBj34M7OYiiC0%2F935q3EPDymhyyzSAIhAOTQJeNF8jSpYXWhCmH6c0K0Od7sUYmgVQJhsZAZbncdKv8DCCAQABoMNjM3NDIzMTgzODA1IgwUgZtEWkPa0LLZS2wq3AOm5cZV1OVDev4Z4IWtsipTDMA0GELkAiKR25sRVAkyz1AIx8DtUNAxiUmMCOoAbnSBSKLWlJhTAGUZRr7Mz2mFxg6UxQU4O%2F2QaLFb74HAaiutA0d35jAfDQH%2FbDErTpBJ8lIqxMk9oSC%2BTwmWYeM1%2FQdTy5Vc7ScHfV0lbxlzt05PzugZAkoOze%2F0eN9LI9vZm0U%2BIMecs2rfwr8vmrp6QzhZ1HvsDtFl5tFc4qYgorQLzGOkwnhQ5L8Amm%2B%2BNIzF5wpPC2I8%2BOowdHylwnqYiUPKB1SuMX423%2B7CpmHSteQ3HW%2Fpj7gy80t0vs1cxKjkqXw93wFGVluwXio71HxTAjh6F5tHL9Zx%2BNPAohRLU%2Fzfe%2BN1D7aoi7N3eAHi1lAj0cgxcHrGB15PICkjPHZPdQFpDVRTSw6VLTKrr2Nmv5r%2F5PpxJxCl3d8yR%2FQilO6S9oVmm9PbPDPH6utAUNKJbGtQPKQl5N2wtDvM1iN1ti8MdCs%2FguUKtWoRWQFNKR8Fr2wj2yzyBvrZlDuB5t7Cdsx1XiMGLPX3AEn23YcUBfoly2iMy8dhMfRbpKwUQvTNBw6ISFY2hb4WcQ5syAlmQUtyH%2FlYTsOAS2GdCGcT0SpIrdjjMz1lt6AKXDDb%2BpTIBjqkARDpZOZxTqGgL47erO9V8EUpLtnsUKJftSvNDc2FkqzQUdHSHbpTeGBZ5y7GXgxF4j9uErgUxyOsY4gPTm4%2Bs%2FKYss8MaNe80gOjrnNqR6Zn%2BjGteQbomVHZ%2FesVc3iBO6mesyQbCJ6e23O4AZVIEqwVcD1FjBdtVTk7ZCh6%2BPAzRNXa0VK76Q7JwHh4HDbsGBlIQygK2MyBuUUUnHPaKmVL2Mv8&X-Amz-Signature=545dc88c602c83227c9c35b6380478a21532c2c47178a19df555099e142b7f13&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
