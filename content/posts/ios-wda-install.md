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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46666XC7PIE%2F20251017%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251017T061633Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDnuR4YiVYn1BDg1VOG5eylEOAxJXhSuj5MEUVdDCwktAIhANEJyw8hde6psiIf3Z%2Fryf6OC52K1SlmK9QO8Epbn1LEKogECJr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igy46Yh8ECNjLjnFBjgq3AMgGaKo7GCvJZOTdT1Nkp15%2B8tEcwnKPfDjU9PhHe1XEtvdcJWkZOKoj98f6sXMbUvPCQxD%2F5E9AJfZIrd28vyskPXfxTd461iZnwG9pjIjHCGa7%2BajwqQZ4AfcWY1xajtB2rXCT8hvlJaW7MVltoF9HwG9GWwbYpbPZSyB9v6ed8EwJ5La0E6oKwNMtSEbscXCb4QF7qTyCHsFrdsXjSK0fSHPRAAmH1CQb2F%2F%2BEZB7ooKIWF%2BcgOKAUKWoieEQ99%2FKRsy%2Bq%2F323v%2BgMB0mraIh%2BrREnhi5QL5NRXz841x7H320RQcmbV802xIFpYkRfF%2B8%2Fg%2BI80ShNpDympliOyPh8NJ%2FyZQIiYy31j3lL2ADhH2djg9qBlbDE6vnjs30svGILn%2BG1XP2g35i2Mn3n%2BAByo3S%2B2asl%2FR9qPwshTUE3cbF8ZgaRAHbsy1PWPeLyG4FGcoceOqkMGNssdEppm9x9Cmff%2FClF6AM264ac5ivgugFf3uyJZ%2BSVu5ATuU0MAYhTmq1%2BFOtVhyUDDZ1z6B8JRvSAqd9rOe4RkvQjZUXBq1Pfo6nVMR3mjvn9%2BVsEJMwRkMHLTWvoPrHrbPpNCJFcaHRJ6FYFLaFkiN%2Bt3jUoogQ9rGX8fIKcsMMzDGtMbHBjqkARZU2e1BDvjbh4tGXun5sok1YUlbxwEY2dl4fpD0ZxqgNqsWguSxF0Yb86knz81BrIMVeWMLhG06pGLo0F8YrFhO37pxhN%2B8h1YnV3Ad88YFRT9nzO3nx57dK17qOUb1iZja9X9RzAdpd8vFOtqdv9AMtCQt7ijlcigA8dnLs0Ea9kV5r2OBOQFw%2Brtd9zaAT3I5CZpHIuvFKNMarJSEt71e12aO&X-Amz-Signature=14e6f1f48258cd3b126757797c616f55ca503e060f2fc8ef08e5b5eacddaf75d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46666XC7PIE%2F20251017%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251017T061632Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDnuR4YiVYn1BDg1VOG5eylEOAxJXhSuj5MEUVdDCwktAIhANEJyw8hde6psiIf3Z%2Fryf6OC52K1SlmK9QO8Epbn1LEKogECJr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igy46Yh8ECNjLjnFBjgq3AMgGaKo7GCvJZOTdT1Nkp15%2B8tEcwnKPfDjU9PhHe1XEtvdcJWkZOKoj98f6sXMbUvPCQxD%2F5E9AJfZIrd28vyskPXfxTd461iZnwG9pjIjHCGa7%2BajwqQZ4AfcWY1xajtB2rXCT8hvlJaW7MVltoF9HwG9GWwbYpbPZSyB9v6ed8EwJ5La0E6oKwNMtSEbscXCb4QF7qTyCHsFrdsXjSK0fSHPRAAmH1CQb2F%2F%2BEZB7ooKIWF%2BcgOKAUKWoieEQ99%2FKRsy%2Bq%2F323v%2BgMB0mraIh%2BrREnhi5QL5NRXz841x7H320RQcmbV802xIFpYkRfF%2B8%2Fg%2BI80ShNpDympliOyPh8NJ%2FyZQIiYy31j3lL2ADhH2djg9qBlbDE6vnjs30svGILn%2BG1XP2g35i2Mn3n%2BAByo3S%2B2asl%2FR9qPwshTUE3cbF8ZgaRAHbsy1PWPeLyG4FGcoceOqkMGNssdEppm9x9Cmff%2FClF6AM264ac5ivgugFf3uyJZ%2BSVu5ATuU0MAYhTmq1%2BFOtVhyUDDZ1z6B8JRvSAqd9rOe4RkvQjZUXBq1Pfo6nVMR3mjvn9%2BVsEJMwRkMHLTWvoPrHrbPpNCJFcaHRJ6FYFLaFkiN%2Bt3jUoogQ9rGX8fIKcsMMzDGtMbHBjqkARZU2e1BDvjbh4tGXun5sok1YUlbxwEY2dl4fpD0ZxqgNqsWguSxF0Yb86knz81BrIMVeWMLhG06pGLo0F8YrFhO37pxhN%2B8h1YnV3Ad88YFRT9nzO3nx57dK17qOUb1iZja9X9RzAdpd8vFOtqdv9AMtCQt7ijlcigA8dnLs0Ea9kV5r2OBOQFw%2Brtd9zaAT3I5CZpHIuvFKNMarJSEt71e12aO&X-Amz-Signature=bcb82ba9d62d4c7e6a93c3baff5d3b8cbcf6537395772f9e6784e5bf5130e80c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
