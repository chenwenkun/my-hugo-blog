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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZGGIB6QZ%2F20260618%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260618T023731Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCBkUth47tCZlIA2%2BaJlvYEMlsFXTJ%2FGtIXO2Ez3vRkFAIgPQYCIsRGA6184MUFiiQSlM4Qe%2FPWro5GeAlX46zH1ekqiAQInP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDC3TxJWZVmypravGNyrcA9sjg39TTsRR1zN76Va%2F2stXExODuf3om%2ByLt16iiSQHec%2Bv2cA%2BwDCDQUb%2F6KGAvI8cLymbFe1vSdNu4z9fnVsDcxjMIM6DXUwKfYeAmpxvnQhFSbhwDl8fptn%2BvgrlWR2jAKJyCDYVdil8D4MHs6xOl4ZPIvbAmILNUxFkfFGCM8SOoFjA7nYu5SB9ZUZ4YegHOw4gByvBSC%2FarQo0X3chagw%2FFmx6os%2BvOjA8epYZzGyKdsUZBCQgHB3BTDINfz78%2FQa2uJmqe25v6owoR%2BO4MwgD3RxBHr%2BqIxDiGW%2BNm%2FH3CfurNoATIy2rLvL8wEzqNIjWV303C3Cpo7CqDHKPrkg3lV7Bm1QyJtFpy5TyDxgpMtRxmp2i8yVP%2F5vOe3QS1iflKyDuYqEIddI5NwxA546lg%2F3SQ7e%2F888PZAgf40w9ihBVCIRq0vw0GO4GAkNT1m68Lyd8Y%2FOwFMW2tAzNdTm0qRzV8g9LxGWivqagl6%2FJupKV2SycwZF1P0dHORYM80Z7zzU4v1fAxJ%2F9MBBexnqXQf5TGNEY57R%2B6%2FdtsLLtv%2F45ls6xF2p%2Bj8mF8GfJ3O%2FHqykUMa343m78nKexsda%2Bj2ggCCVjueEy3HaM6%2FQcdcXnTbxQyAz7MPuwzdEGOqUBa20FTcfKeMvzPqMNbLRD5wmHwByXDfl1hssZx1RUmK34vAkuqhnCT90q1%2FLyydf1vuN7rsizJyaCNDt0YcO%2FT%2FsX508SjYGEHdyBcfHtu72jXhyrLMnDRMW%2BWGGZjF9INfqr1ExSgqQAhdugIrzjCW1wCAjiFHUfNRTTmtdcIZW%2FIoMGdfqVGj%2FBzGW7EqmYmphaCn7XnBYF8EooKN%2F4VvYCBQ0T&X-Amz-Signature=74de09c0f37bc6027d303733e35e2c603b195ee3a15651202612ffed44606769&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZGGIB6QZ%2F20260618%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260618T023731Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCBkUth47tCZlIA2%2BaJlvYEMlsFXTJ%2FGtIXO2Ez3vRkFAIgPQYCIsRGA6184MUFiiQSlM4Qe%2FPWro5GeAlX46zH1ekqiAQInP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDC3TxJWZVmypravGNyrcA9sjg39TTsRR1zN76Va%2F2stXExODuf3om%2ByLt16iiSQHec%2Bv2cA%2BwDCDQUb%2F6KGAvI8cLymbFe1vSdNu4z9fnVsDcxjMIM6DXUwKfYeAmpxvnQhFSbhwDl8fptn%2BvgrlWR2jAKJyCDYVdil8D4MHs6xOl4ZPIvbAmILNUxFkfFGCM8SOoFjA7nYu5SB9ZUZ4YegHOw4gByvBSC%2FarQo0X3chagw%2FFmx6os%2BvOjA8epYZzGyKdsUZBCQgHB3BTDINfz78%2FQa2uJmqe25v6owoR%2BO4MwgD3RxBHr%2BqIxDiGW%2BNm%2FH3CfurNoATIy2rLvL8wEzqNIjWV303C3Cpo7CqDHKPrkg3lV7Bm1QyJtFpy5TyDxgpMtRxmp2i8yVP%2F5vOe3QS1iflKyDuYqEIddI5NwxA546lg%2F3SQ7e%2F888PZAgf40w9ihBVCIRq0vw0GO4GAkNT1m68Lyd8Y%2FOwFMW2tAzNdTm0qRzV8g9LxGWivqagl6%2FJupKV2SycwZF1P0dHORYM80Z7zzU4v1fAxJ%2F9MBBexnqXQf5TGNEY57R%2B6%2FdtsLLtv%2F45ls6xF2p%2Bj8mF8GfJ3O%2FHqykUMa343m78nKexsda%2Bj2ggCCVjueEy3HaM6%2FQcdcXnTbxQyAz7MPuwzdEGOqUBa20FTcfKeMvzPqMNbLRD5wmHwByXDfl1hssZx1RUmK34vAkuqhnCT90q1%2FLyydf1vuN7rsizJyaCNDt0YcO%2FT%2FsX508SjYGEHdyBcfHtu72jXhyrLMnDRMW%2BWGGZjF9INfqr1ExSgqQAhdugIrzjCW1wCAjiFHUfNRTTmtdcIZW%2FIoMGdfqVGj%2FBzGW7EqmYmphaCn7XnBYF8EooKN%2F4VvYCBQ0T&X-Amz-Signature=fbf4e2ce451af6b56080e70b894ea9bc05ae9ee4c6ec630eca70642968d46b9d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
