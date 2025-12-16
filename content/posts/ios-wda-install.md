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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QF4EEGO2%2F20251216%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251216T005705Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDpHhSgzzg05jv%2FGNC%2FwxLFCZmNUz0YYv2JJXf03uLwzAiAPMB8DCknMerUZDLto9huw06gH2ySg8iQR22lhb5%2BFlSr%2FAwhZEAAaDDYzNzQyMzE4MzgwNSIM2i4ACEfutJ2XbEMlKtwD%2FGjP7Qanmvg2Txxa8rcxFBrZm1E5WudLgyL3WI6aCt14893VTvFUDKygtOjTyJXPj%2BktH%2F3A%2Ful9Ja3NhU%2BEtFVrBF7bxuG7i%2BKnUGpX3vxXOebmTJQWE%2B9wqXZIRNiDnuLqL7keurcNHzIFocl6%2FGgHAQ9buaXRhlpVUHBpz6RCkoBV22XfRtzcnFUYlOTgYSfcRielaL3V0Vefs%2F1eqvSrFi0DbVU42DlQjzLZIUAG11pd2vxjA2WBsy3pNrB6akaBBn92V8OnAw2RoUEZVcZ%2ByA34wtv7z9WOKmuIYQMYNomwVch7rg3g%2BdFZXplDIgMeIVI9uVxJJAZDMrCbmwmCMemlEfNAL80wnjQazMgTqVMTQM1MvboHPWqtaQZZLjKRAUtbF02JCOyQ6ieyq1bivrBU9oP60GZIUBGBfSdYAK0sXKGUgLGXRJ1PEBEed8iLyCquFERriRzjqB3XLnnIUAVbgeJ5bPRjGeuR91cWR0G9bTmt0TgUWlcbEBnx8kurafHGnk3wtfS1D7kylTLy%2FydmZv8J%2Froxw%2FVHX4iW%2B5S1MPSxao9%2B3SsfonGfeGKd1983qUxyri4kDyH1ibUwIOGE7RfVunOLREq5OUpgsVLTVf3wc%2F8trC4w%2FsmCygY6pgFhuZVxjauyBh76r637HLAjeoomEivZnx8d9Jc8AhTSuEQ5UtqbVjf5qUegbdWp%2B%2FJ4DYtF8raeannyhZP1rLpO2%2Fne9uxDRHl0x6U0VgBIWNxwINrqXQ4AK%2BR%2BCEShZbuhr9B2LiMY8YaShMj9OxIsG5ZPEw2E1q6NEduPOGf4RCqtGYZW%2F3%2FcIt34Q6g1ffgu7OgHmLWnN1q5rTmLqxjSmwd2g79d&X-Amz-Signature=b1c2784bd142e83e19d1cab3eb9b9f07ab8cb5e9ff3ff9ebfbe2b9e3262758d0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QF4EEGO2%2F20251216%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251216T005705Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDpHhSgzzg05jv%2FGNC%2FwxLFCZmNUz0YYv2JJXf03uLwzAiAPMB8DCknMerUZDLto9huw06gH2ySg8iQR22lhb5%2BFlSr%2FAwhZEAAaDDYzNzQyMzE4MzgwNSIM2i4ACEfutJ2XbEMlKtwD%2FGjP7Qanmvg2Txxa8rcxFBrZm1E5WudLgyL3WI6aCt14893VTvFUDKygtOjTyJXPj%2BktH%2F3A%2Ful9Ja3NhU%2BEtFVrBF7bxuG7i%2BKnUGpX3vxXOebmTJQWE%2B9wqXZIRNiDnuLqL7keurcNHzIFocl6%2FGgHAQ9buaXRhlpVUHBpz6RCkoBV22XfRtzcnFUYlOTgYSfcRielaL3V0Vefs%2F1eqvSrFi0DbVU42DlQjzLZIUAG11pd2vxjA2WBsy3pNrB6akaBBn92V8OnAw2RoUEZVcZ%2ByA34wtv7z9WOKmuIYQMYNomwVch7rg3g%2BdFZXplDIgMeIVI9uVxJJAZDMrCbmwmCMemlEfNAL80wnjQazMgTqVMTQM1MvboHPWqtaQZZLjKRAUtbF02JCOyQ6ieyq1bivrBU9oP60GZIUBGBfSdYAK0sXKGUgLGXRJ1PEBEed8iLyCquFERriRzjqB3XLnnIUAVbgeJ5bPRjGeuR91cWR0G9bTmt0TgUWlcbEBnx8kurafHGnk3wtfS1D7kylTLy%2FydmZv8J%2Froxw%2FVHX4iW%2B5S1MPSxao9%2B3SsfonGfeGKd1983qUxyri4kDyH1ibUwIOGE7RfVunOLREq5OUpgsVLTVf3wc%2F8trC4w%2FsmCygY6pgFhuZVxjauyBh76r637HLAjeoomEivZnx8d9Jc8AhTSuEQ5UtqbVjf5qUegbdWp%2B%2FJ4DYtF8raeannyhZP1rLpO2%2Fne9uxDRHl0x6U0VgBIWNxwINrqXQ4AK%2BR%2BCEShZbuhr9B2LiMY8YaShMj9OxIsG5ZPEw2E1q6NEduPOGf4RCqtGYZW%2F3%2FcIt34Q6g1ffgu7OgHmLWnN1q5rTmLqxjSmwd2g79d&X-Amz-Signature=c38a436d226b507ca07e74638385a12b9b3a34a8601f892cd8c060bc2bf73a9d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
