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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466X3I3GGJJ%2F20260606%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260606T130614Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCJRuxIIJoj8Ayfa2cdpNh2yRXI2lRD7r6Uz6ZB5yf%2FzAIgZCMmca9aXFiNb4fl70qXvNuVQdKUhkqCY8azQHQPkuAqiAQIhf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOb2isyLx37%2BY8iTcSrcAzmV%2F8eRUw9fREnZE5NH1ia%2FmNkeKLjkuKsi2fQTRKYg%2FRUOMArR%2BTu6TDvk51%2FKU0I438%2Fpno6Bx%2FgEd5XqprhPvBdvXh5ioEH%2FN8sUofyNHTsgbCzPpja3c%2FLP1IXOInd7A2C%2FUXx%2BbhQscsKfGM6d6gpqsYUPuhONvxarDT9mYyLhfz6u7PEeBXajOAl8%2FhG1Mrk4AxnVTyK%2BlmMAu7XjjodmbYUvv%2F0modzxYqwVjuPotMRb2gUfgBo1Rl2jK4FrhmSdPCNWD6g4fr1WOVNmug%2B8dszBXumc%2FTHwwR9ODWsdA%2Bs6I8r%2Bin%2BlPrVvjlzHWdy0ULXKo13xfegLCZRF4z2y5NEsBR8z7YJe6UUX9ODwkeK7hYPVXZgUESPHJRvIevY%2B5lwU3iQIWIFhFIgG0eudZJlaKdjwTFBmPuHME65lvWnOOz1lI6wd2f9oSDCEKhbwANzN6cr20JhnA%2BisWi%2BFA%2BpGaNatOfuTKJJgiWKBX69FvIXy8E9Yr5lg%2FP4XoMapbUXZhLyXNlQqYo504sCol4RUb6JxDmsXP5ieffewb22m3%2F9EB4ZFLQgDgt7IwwtoA9pF5HeGly4R7M2jq0CnVz5SwVbXX0%2FGU4J3ZhLbtXJQGdHgbhdeMOmKkNEGOqUByStLjcmRQ9UaYdgVXhvw7YqEndWz75Iv3j58G9joFC37sXL%2FSi2LPYwjoDjznBfjBl%2B%2FHs1TNSNeFDy6zEnH3vQpj8W4JZBHPy735I4t9OGTd4K9CNsTzRrEIzVvRZrgq8RDEo4YG1QRG2eyHt4xdskxMVtrUNzE%2B4Rm%2Bh4lcDxpw7GXRqo3WIsDJ%2FLzgbqI4U4sRSo9uMIsZNPPIYY84eZux1uD&X-Amz-Signature=854d7c4858fbbdec99c159a3e2d7e71b9009fda25b4d1be3e2af7a1341842e8b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466X3I3GGJJ%2F20260606%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260606T130614Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCJRuxIIJoj8Ayfa2cdpNh2yRXI2lRD7r6Uz6ZB5yf%2FzAIgZCMmca9aXFiNb4fl70qXvNuVQdKUhkqCY8azQHQPkuAqiAQIhf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOb2isyLx37%2BY8iTcSrcAzmV%2F8eRUw9fREnZE5NH1ia%2FmNkeKLjkuKsi2fQTRKYg%2FRUOMArR%2BTu6TDvk51%2FKU0I438%2Fpno6Bx%2FgEd5XqprhPvBdvXh5ioEH%2FN8sUofyNHTsgbCzPpja3c%2FLP1IXOInd7A2C%2FUXx%2BbhQscsKfGM6d6gpqsYUPuhONvxarDT9mYyLhfz6u7PEeBXajOAl8%2FhG1Mrk4AxnVTyK%2BlmMAu7XjjodmbYUvv%2F0modzxYqwVjuPotMRb2gUfgBo1Rl2jK4FrhmSdPCNWD6g4fr1WOVNmug%2B8dszBXumc%2FTHwwR9ODWsdA%2Bs6I8r%2Bin%2BlPrVvjlzHWdy0ULXKo13xfegLCZRF4z2y5NEsBR8z7YJe6UUX9ODwkeK7hYPVXZgUESPHJRvIevY%2B5lwU3iQIWIFhFIgG0eudZJlaKdjwTFBmPuHME65lvWnOOz1lI6wd2f9oSDCEKhbwANzN6cr20JhnA%2BisWi%2BFA%2BpGaNatOfuTKJJgiWKBX69FvIXy8E9Yr5lg%2FP4XoMapbUXZhLyXNlQqYo504sCol4RUb6JxDmsXP5ieffewb22m3%2F9EB4ZFLQgDgt7IwwtoA9pF5HeGly4R7M2jq0CnVz5SwVbXX0%2FGU4J3ZhLbtXJQGdHgbhdeMOmKkNEGOqUByStLjcmRQ9UaYdgVXhvw7YqEndWz75Iv3j58G9joFC37sXL%2FSi2LPYwjoDjznBfjBl%2B%2FHs1TNSNeFDy6zEnH3vQpj8W4JZBHPy735I4t9OGTd4K9CNsTzRrEIzVvRZrgq8RDEo4YG1QRG2eyHt4xdskxMVtrUNzE%2B4Rm%2Bh4lcDxpw7GXRqo3WIsDJ%2FLzgbqI4U4sRSo9uMIsZNPPIYY84eZux1uD&X-Amz-Signature=3561b1bcbd49a782f5ae679cd65f285f952bce9d962dffac8068263f84d767ad&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
