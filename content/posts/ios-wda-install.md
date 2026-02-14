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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RPP2FRNK%2F20260214%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260214T010835Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDEaCXVzLXdlc3QtMiJHMEUCIQCO18iBdWNeVWtz5BX8Dpc47xqffd8GBWzY4Df1JIq1lwIgHQ2gpKcJo0OsqUNkbBtiquJUkMLLS3Gv%2FdD6busyz3cqiAQI%2Bv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDPHL5uGeuLnG%2B1xjIircA9XF0sN5Rluydk%2FQTcqAv7wJkIQDHE4FGktXPKn6ByeM9K7POtlnkCGQS2gI70oShz9sZGQzeN01phnBwrWFNp9OL9E1MXwc2ZI9hEb0mpF7q9mZn%2FbfaPIYKrfhAPQy3bxjIijDf7PZba%2BMA0l2yjHyf3JKGieDAW6sob75fcTQ5WAecJaCrx%2BF8tm45D91Zd46eCoWC4mXZGpvnnmCEIX599I6eCjrvA%2Bm0VdA3SnwgFKJycIC06aWSkOZ4rnCbuL0nQNmkenj%2FDD7M9yZy1FYx1JPhUqt%2FxUA%2FA0%2FOE57uQpYFRQfH38AXTpoO5ABl4a4GZeFGPqPluB4Rvr1yaHP5ENh3vzl7A%2BvfB3%2FJ81YWOJjoL1HSrrjKyjWFz60T0zo%2FktABSw2xauki5fNkvEQiStmK7YVSm4clIMx2ZWxvFFlw0BOq7aJzUMBk3bAByUh25MJXB2ZKK5C7IV7eWuIrwb%2FmRU5H9AsLU%2FW%2BviQ8J0nB3G0jCjlsxyyq4XTTmBMn%2BVqcIKq6Jw4M4Eikr37rbfyCL%2Bb6R5DG0TvuKU71vDEKxNAbu3DMDxJFNDGVaWkmxmH7Piya499gnD9yM70jMNT4ldLyq9jjCvHs5kcJZId85SxEhmw3hoxMJ2Tv8wGOqUBVRbbCBrkheEzivOVOEHsWoFWPl%2BpoeCIM0GyFVW8T9A63Ch6fLBn9CrDFbp4FQeoVYLu%2F%2Fm6b%2FMJ61SEd0GZwK2ZxJZsgzWy%2FNO1KEnE8dLnxlodZlCMPH5Chrvp6u0S%2BGvfKyIOWp7guj%2FbNWKJc%2FCwiJ6rwYtiht6kYfPfg6B3E0vx22ju%2FYKbNL%2BGSEMasKmJUBGLGaZ3yOq5lih5WvIVxg1y&X-Amz-Signature=3d41312b619d52b7b28f3e2ff9f915dca4a7b4579035f8744710faa64037f947&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RPP2FRNK%2F20260214%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260214T010835Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDEaCXVzLXdlc3QtMiJHMEUCIQCO18iBdWNeVWtz5BX8Dpc47xqffd8GBWzY4Df1JIq1lwIgHQ2gpKcJo0OsqUNkbBtiquJUkMLLS3Gv%2FdD6busyz3cqiAQI%2Bv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDPHL5uGeuLnG%2B1xjIircA9XF0sN5Rluydk%2FQTcqAv7wJkIQDHE4FGktXPKn6ByeM9K7POtlnkCGQS2gI70oShz9sZGQzeN01phnBwrWFNp9OL9E1MXwc2ZI9hEb0mpF7q9mZn%2FbfaPIYKrfhAPQy3bxjIijDf7PZba%2BMA0l2yjHyf3JKGieDAW6sob75fcTQ5WAecJaCrx%2BF8tm45D91Zd46eCoWC4mXZGpvnnmCEIX599I6eCjrvA%2Bm0VdA3SnwgFKJycIC06aWSkOZ4rnCbuL0nQNmkenj%2FDD7M9yZy1FYx1JPhUqt%2FxUA%2FA0%2FOE57uQpYFRQfH38AXTpoO5ABl4a4GZeFGPqPluB4Rvr1yaHP5ENh3vzl7A%2BvfB3%2FJ81YWOJjoL1HSrrjKyjWFz60T0zo%2FktABSw2xauki5fNkvEQiStmK7YVSm4clIMx2ZWxvFFlw0BOq7aJzUMBk3bAByUh25MJXB2ZKK5C7IV7eWuIrwb%2FmRU5H9AsLU%2FW%2BviQ8J0nB3G0jCjlsxyyq4XTTmBMn%2BVqcIKq6Jw4M4Eikr37rbfyCL%2Bb6R5DG0TvuKU71vDEKxNAbu3DMDxJFNDGVaWkmxmH7Piya499gnD9yM70jMNT4ldLyq9jjCvHs5kcJZId85SxEhmw3hoxMJ2Tv8wGOqUBVRbbCBrkheEzivOVOEHsWoFWPl%2BpoeCIM0GyFVW8T9A63Ch6fLBn9CrDFbp4FQeoVYLu%2F%2Fm6b%2FMJ61SEd0GZwK2ZxJZsgzWy%2FNO1KEnE8dLnxlodZlCMPH5Chrvp6u0S%2BGvfKyIOWp7guj%2FbNWKJc%2FCwiJ6rwYtiht6kYfPfg6B3E0vx22ju%2FYKbNL%2BGSEMasKmJUBGLGaZ3yOq5lih5WvIVxg1y&X-Amz-Signature=1e01324050b443b1102776474366f6c9b83e2e8472de97be525ecba8c5d33397&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
