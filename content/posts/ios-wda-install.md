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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RYKVMTTB%2F20260411%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260411T182855Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCq%2Fpe%2Bmpx3T0NbxqACxsddPeDv%2FkEPkPEAWPK0qJaqdwIhAPvx5kExAb3coFqoQ8kIhqKe86yd6Hg5J5YazAAOjW2EKv8DCEsQABoMNjM3NDIzMTgzODA1Igz5h%2Bb4LFFb8jdltgIq3AP09OxuwmzKBLUGS2p9AJJe%2FotYqBzjsls57WjBDZs4rdk99XTj3W0p%2FlI%2BpUy%2BQ5VsuZL8g8thf5baevDDSturyiR6vrtNl6bcEIcz%2FSgs0ipqwIOmr%2F0FJH%2B3HS8gO5ZGpiB3hqL%2BCZe5HKIESeNsYXS5281Wh2FACNS0MVgSH13u3%2Fqeoc%2FDJUm0bKvXb94sRFfzXxgPfcGxluuPpSy8EEEcGtUVJw234WHEpECY75Hl4GpaPINazhNdH4BC%2FinXX%2FoHOnl%2F936jE6yRFxN9qZ4QhPKFcqKv1kosrUomg%2BeDMT3Is1qUpuLpx1wT%2BU5K%2BSs1FxWuiZrQ42GXyoVRTFX%2BbRRlu%2BDGB3CuULTsGt0tyLwLIdXUJI16CrpnrfogVV8jFIKPuuQ9SZ%2FQR1XmEgltNrLoGKlVPamRvxLjDo9biaxiu3SUOl60BAnL7IOj7ew1rADXdpHT%2F%2BRDzZaRimJsAx4uXpchQbapkNQ1KSxY56vYlVSqs72HaI0TPbLqaTw9pDy%2FJUYe9vAJkZI2GBHvOYm5W6rFvbePstm4wuRj7slxWlfwE47H%2BkcxRPtilac1HBi%2FpRX6YWLutE1kT6QaGih8dI2ZbOykwrFbPyLJDpBGX54PwvOASDDYn%2BrOBjqkAZYxYI5b%2FiloK9cpoa%2BwW4QiV97ptBJ0N3p25763FVR507ofPQ4BCYEXDCx29wm5%2BKHr3p09PTXVC9uS7W3HEOZzq8OIq6EubMdwBT75TmPkuszBrDIGswF7DnNI%2BOdc5ox7lkAMyc7wWJEjEw8pU8qsbxEnNtrl1YToC0PptCO%2FXVo8%2FWBd2f1dktW7wqRaVw%2BsuGOjQzoUONzB%2FUklp2GUEfrM&X-Amz-Signature=a055196c9a8da611a90ab5eb342e7449ec8954aa7f75c2ab88e2df885149d49f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RYKVMTTB%2F20260411%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260411T182855Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCq%2Fpe%2Bmpx3T0NbxqACxsddPeDv%2FkEPkPEAWPK0qJaqdwIhAPvx5kExAb3coFqoQ8kIhqKe86yd6Hg5J5YazAAOjW2EKv8DCEsQABoMNjM3NDIzMTgzODA1Igz5h%2Bb4LFFb8jdltgIq3AP09OxuwmzKBLUGS2p9AJJe%2FotYqBzjsls57WjBDZs4rdk99XTj3W0p%2FlI%2BpUy%2BQ5VsuZL8g8thf5baevDDSturyiR6vrtNl6bcEIcz%2FSgs0ipqwIOmr%2F0FJH%2B3HS8gO5ZGpiB3hqL%2BCZe5HKIESeNsYXS5281Wh2FACNS0MVgSH13u3%2Fqeoc%2FDJUm0bKvXb94sRFfzXxgPfcGxluuPpSy8EEEcGtUVJw234WHEpECY75Hl4GpaPINazhNdH4BC%2FinXX%2FoHOnl%2F936jE6yRFxN9qZ4QhPKFcqKv1kosrUomg%2BeDMT3Is1qUpuLpx1wT%2BU5K%2BSs1FxWuiZrQ42GXyoVRTFX%2BbRRlu%2BDGB3CuULTsGt0tyLwLIdXUJI16CrpnrfogVV8jFIKPuuQ9SZ%2FQR1XmEgltNrLoGKlVPamRvxLjDo9biaxiu3SUOl60BAnL7IOj7ew1rADXdpHT%2F%2BRDzZaRimJsAx4uXpchQbapkNQ1KSxY56vYlVSqs72HaI0TPbLqaTw9pDy%2FJUYe9vAJkZI2GBHvOYm5W6rFvbePstm4wuRj7slxWlfwE47H%2BkcxRPtilac1HBi%2FpRX6YWLutE1kT6QaGih8dI2ZbOykwrFbPyLJDpBGX54PwvOASDDYn%2BrOBjqkAZYxYI5b%2FiloK9cpoa%2BwW4QiV97ptBJ0N3p25763FVR507ofPQ4BCYEXDCx29wm5%2BKHr3p09PTXVC9uS7W3HEOZzq8OIq6EubMdwBT75TmPkuszBrDIGswF7DnNI%2BOdc5ox7lkAMyc7wWJEjEw8pU8qsbxEnNtrl1YToC0PptCO%2FXVo8%2FWBd2f1dktW7wqRaVw%2BsuGOjQzoUONzB%2FUklp2GUEfrM&X-Amz-Signature=c998394ceb4bc64950e2635637a248ca5e7ae508c3418ccf390115d43f2abde8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
