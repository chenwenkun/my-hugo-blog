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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666WIQ4XL5%2F20251111%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251111T122137Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFQaCXVzLXdlc3QtMiJGMEQCIGsYMqmR%2Btq1PNct7N1ltZXWx3jw4c60kwudO%2F%2FPvpPVAiBdbfXoO54dHnRUiyO05kpl0v8yu26jaK56jmgFy3OR%2Fyr%2FAwgdEAAaDDYzNzQyMzE4MzgwNSIMBOsdYsVvt%2B7l9%2BCKKtwDNtYx7TKELoD%2BU3thpbfvqmrUa3Yh87Bw%2FAEEqbXvhhl7sjmIiuNCK8tAdlXtV8yWPNrJggqbLOm0Ie9%2F2%2FKGCUcH6gWHb4ZjFX9B9Aqi9Lkr%2BBUYzt0IAGRRUJobUjwfNnuMqDqorI0lsP0DrWaz5fbA1tQ4fAF3YH1u%2FPzGVNJ%2FfdcScGZ4kHmpUyeTYELwn1MvKaZuYQz7hg8xNNC%2Bd4utJ3SThqTyIzCzwiVhFm5YEYAzEEQ6X941iZoZjjPwnYuFQuWSNDyKFXvS91s5wqCq172AYgTz4ToxPT%2FeJgvtj6qY5IJVLOkAcPC0nwfYED8PVCowRFcn5dK7K%2BxC9wHOvuV18sY%2Bwt7wbZpCa1MYTSt7eElNOIRLwkZcvUTDwvDKpVmT3kigwB4wu26%2FTNFqg5uve735J23uDzQFMGdtxzlgus5ZWXEJG2XPdH533%2Fjl1bcpWMjljaRI%2FDLyXV5qxw%2F53NTn%2F2aqLWGv9Sep4n5iu0CT8OTNoQRqiFu9GTeHkN2zZIE%2B%2FsBbWJ1cZHmpRFqv7eRVd7NUyCr1Ya5w44bSaicJIb%2Be48BcawL73ZqDv2qZ04U%2FF5g8fwnOkqMNhl5amyyL6TUYPgwfRI%2BcitY6F%2B3tlUNV5zMwpsvMyAY6pgHvCjsyHiSy%2B8J9ziraDjeD4A65%2FDIax%2FbjuHFU%2BGOdnhgkAkAd714P9jyawsFx5l%2BEK6lT6NiBvJ5VmYSv7AA%2B%2BVv16bMooQEsMXhPQxuG3qdm4of9MiSNr%2Fz8GSmQYeGCw36OudMq3%2FeJIQ%2BeatCST6rRZZ3jnY8uGjTCdPauRj8rYXVvvLZn671Bm1%2Fx5wG5%2BonQvQEr6d%2FKMyujHjRhIdqPznol&X-Amz-Signature=0c6ce5ddfe79e5cd91b8fc37eb4113f17d2dbc298963450ffd385385c4e36458&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666WIQ4XL5%2F20251111%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251111T122137Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFQaCXVzLXdlc3QtMiJGMEQCIGsYMqmR%2Btq1PNct7N1ltZXWx3jw4c60kwudO%2F%2FPvpPVAiBdbfXoO54dHnRUiyO05kpl0v8yu26jaK56jmgFy3OR%2Fyr%2FAwgdEAAaDDYzNzQyMzE4MzgwNSIMBOsdYsVvt%2B7l9%2BCKKtwDNtYx7TKELoD%2BU3thpbfvqmrUa3Yh87Bw%2FAEEqbXvhhl7sjmIiuNCK8tAdlXtV8yWPNrJggqbLOm0Ie9%2F2%2FKGCUcH6gWHb4ZjFX9B9Aqi9Lkr%2BBUYzt0IAGRRUJobUjwfNnuMqDqorI0lsP0DrWaz5fbA1tQ4fAF3YH1u%2FPzGVNJ%2FfdcScGZ4kHmpUyeTYELwn1MvKaZuYQz7hg8xNNC%2Bd4utJ3SThqTyIzCzwiVhFm5YEYAzEEQ6X941iZoZjjPwnYuFQuWSNDyKFXvS91s5wqCq172AYgTz4ToxPT%2FeJgvtj6qY5IJVLOkAcPC0nwfYED8PVCowRFcn5dK7K%2BxC9wHOvuV18sY%2Bwt7wbZpCa1MYTSt7eElNOIRLwkZcvUTDwvDKpVmT3kigwB4wu26%2FTNFqg5uve735J23uDzQFMGdtxzlgus5ZWXEJG2XPdH533%2Fjl1bcpWMjljaRI%2FDLyXV5qxw%2F53NTn%2F2aqLWGv9Sep4n5iu0CT8OTNoQRqiFu9GTeHkN2zZIE%2B%2FsBbWJ1cZHmpRFqv7eRVd7NUyCr1Ya5w44bSaicJIb%2Be48BcawL73ZqDv2qZ04U%2FF5g8fwnOkqMNhl5amyyL6TUYPgwfRI%2BcitY6F%2B3tlUNV5zMwpsvMyAY6pgHvCjsyHiSy%2B8J9ziraDjeD4A65%2FDIax%2FbjuHFU%2BGOdnhgkAkAd714P9jyawsFx5l%2BEK6lT6NiBvJ5VmYSv7AA%2B%2BVv16bMooQEsMXhPQxuG3qdm4of9MiSNr%2Fz8GSmQYeGCw36OudMq3%2FeJIQ%2BeatCST6rRZZ3jnY8uGjTCdPauRj8rYXVvvLZn671Bm1%2Fx5wG5%2BonQvQEr6d%2FKMyujHjRhIdqPznol&X-Amz-Signature=13d80ad50807dffa08c1da69b0735c46be1611460c6af9128722d8965b4306dc&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
