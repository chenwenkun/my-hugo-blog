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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664TL2T5X7%2F20251029%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251029T061800Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBYaCXVzLXdlc3QtMiJHMEUCICPTV8fTC3gjJ3PTt0HeF%2FZag51KkuIZEG9Oun8zZzYYAiEAjvsAETDGlG2iEovcNQlgogzMkoVYG5Wcf6msPeJG4f8qiAQIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDMg%2Ftk2C2MubPswATSrcAzsGWj73zA5GuOEVtBYIS%2B2gs%2BtDsoRpGWW7EhErT7crvkLxBeDXCbc9%2F3fp7U4AoI2KslBJFbq35%2FiFwVoTz2Up50vPhy%2B8MY4GgiRe6yUzw%2BbJk%2B7Ka3SyxIA7NpHB8Sn2OxN1ou3xFWRkHmNAedjUb1JAZhZAE3ehBrYgkHrxugU5leEYztPSQfL1pya36YDGXNcufWNfHfpGazgw%2Faa%2FZfRrTmofudtgyq%2B1j2hdeQchBGtGT67aZwVdOnOOSkuSNaugGbSpgC5LnwnYef0NjtqcGd3oQDr6qoe91cuI5N0w2JpToCLrH0itHSzWgr3GKjJ4jgEOg%2BWkywuQLhUd2HR%2Fd2ZV0Q0PPWkz8xzkyOMjNyI6lEIJbm%2BS88zZj6SCxefEN2qbVToXDvzkdY9TZtq%2BEVIxTcIC2dIQIjCNpDNHhZVfTIFbBf1XQ8tPdKa9yF444iDbmztIdYo%2Bb8DrJ1aQUGpaPYGFcDzrvez2qpuG5b%2BxTOmsQ7sLJ7xVXeAofrLksjyjMltZpbnWeHMOCh83Notrc34v6P121s0tZ5VuWPWFlSOtI4ZMy%2BfZMFX4kBPxD2bu0f9vGcBqzxgGGg5BUhKeoE7f1f5eTrPuYzJLGwVCmKSQaofCMNnchsgGOqUBBHE0ityOCAH7PJFHp15TacqqasvmZ5ZR8LCdtizUP55qAsOXNOdRUqnUTp8iAtOcVM5FJQ5dLt%2BbJ8OAHEksGlUjLvpCp%2FWaWnWirf3CaTBivkzIj3HSIOIFgC8fh1kaVOsIfqGZXaO5kXB%2BUCwWs41wzyvFnMEpZsWbsssGVZ%2BLZkHPelJPBts77lI6O9UC73gfiuEmiSxlVuKG9W348qRmM7%2Fg&X-Amz-Signature=2f55eb5b4131552e2c0366f18c83419868fdc83d2bec71e5a0499afe6c645f56&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664TL2T5X7%2F20251029%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251029T061800Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBYaCXVzLXdlc3QtMiJHMEUCICPTV8fTC3gjJ3PTt0HeF%2FZag51KkuIZEG9Oun8zZzYYAiEAjvsAETDGlG2iEovcNQlgogzMkoVYG5Wcf6msPeJG4f8qiAQIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDMg%2Ftk2C2MubPswATSrcAzsGWj73zA5GuOEVtBYIS%2B2gs%2BtDsoRpGWW7EhErT7crvkLxBeDXCbc9%2F3fp7U4AoI2KslBJFbq35%2FiFwVoTz2Up50vPhy%2B8MY4GgiRe6yUzw%2BbJk%2B7Ka3SyxIA7NpHB8Sn2OxN1ou3xFWRkHmNAedjUb1JAZhZAE3ehBrYgkHrxugU5leEYztPSQfL1pya36YDGXNcufWNfHfpGazgw%2Faa%2FZfRrTmofudtgyq%2B1j2hdeQchBGtGT67aZwVdOnOOSkuSNaugGbSpgC5LnwnYef0NjtqcGd3oQDr6qoe91cuI5N0w2JpToCLrH0itHSzWgr3GKjJ4jgEOg%2BWkywuQLhUd2HR%2Fd2ZV0Q0PPWkz8xzkyOMjNyI6lEIJbm%2BS88zZj6SCxefEN2qbVToXDvzkdY9TZtq%2BEVIxTcIC2dIQIjCNpDNHhZVfTIFbBf1XQ8tPdKa9yF444iDbmztIdYo%2Bb8DrJ1aQUGpaPYGFcDzrvez2qpuG5b%2BxTOmsQ7sLJ7xVXeAofrLksjyjMltZpbnWeHMOCh83Notrc34v6P121s0tZ5VuWPWFlSOtI4ZMy%2BfZMFX4kBPxD2bu0f9vGcBqzxgGGg5BUhKeoE7f1f5eTrPuYzJLGwVCmKSQaofCMNnchsgGOqUBBHE0ityOCAH7PJFHp15TacqqasvmZ5ZR8LCdtizUP55qAsOXNOdRUqnUTp8iAtOcVM5FJQ5dLt%2BbJ8OAHEksGlUjLvpCp%2FWaWnWirf3CaTBivkzIj3HSIOIFgC8fh1kaVOsIfqGZXaO5kXB%2BUCwWs41wzyvFnMEpZsWbsssGVZ%2BLZkHPelJPBts77lI6O9UC73gfiuEmiSxlVuKG9W348qRmM7%2Fg&X-Amz-Signature=8a87883024e344b50124ecd9fed55984c1797ee267df3009d3aa3a6e344b7301&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
