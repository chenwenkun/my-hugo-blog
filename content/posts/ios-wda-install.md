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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RX4QDKJZ%2F20260224%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260224T064639Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECcaCXVzLXdlc3QtMiJIMEYCIQCckaxQSS%2FVPIqE%2FTbL3BH3UGSX0WQz30ME4g1wksaH2QIhAPyZAFEesPWKv9e0ciWRrpseCdlPrxbDb7rcDuv754GVKogECO%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzDQibeSoflEfgbruAq3ANHSo4UZye1uuXsK4JnZG1lPHIP3%2F8%2B7bON3d39SFA%2Fd23BUFvtvoezr1X4HAAIG4WblircLSDyzG48b5gIsDfNEDCZtQ5W9OYozJoPDKo%2BMV8WSKkf%2FwqCh02oJtjELciuduKrBbG%2FQcKy8UYgeoakQvsdvMdl6%2BvvrJAaLu8ZHygWzfjYSzg3t9GS15l2dFspfFbAeqL1dQxEGbwqEoUpIixmFEuWG4fnc0xG5s6Ontd%2BxYrVZvzG6Z6meGuqH7FPXpIYpObjntPPB2YepJ3I7VzMks3aIVG9Z8JS7O%2FvNtVjJn%2BpHPllWSEhmmQtxxvofisTkOhYO0%2Fafrua48ufz1By7rNAZYzYws3f%2BVffpJ9xd7eFunpmiAXx8CN2u%2FhL1HIaZdpXkRjSkdPVG%2F%2BM86dAl7cWltcq9nu1c42jbOajK%2BrsgcA2wMpRGLW6L1Gm6DAy2r71gsyhhfrua3v6sT%2FqIpEIEQbZLzusDedje3bHNbwVNuYskaUTVBaLzMG5WbGBNEYH8nC7yE2OtUm0OEkUQYooyDmfe%2BAJ9dQqlayBfdvyB9hjZS9oepztiiOkwoPeN7%2BTE%2FKC8ddbPervJZzLFhoQcqPsrp5XJn3SEOqq66OPq%2FjQer%2BGLzCvhfXMBjqkAYtoV1D5M2fR2rQTJjDan7BbqdGHJI%2B7FfucBIaflyJUJRMScy0Dl%2BambqQxX7MKLg83tGldQfr1LwIgv6KqpE9ZdwOcK%2BOoi6yTxPlFhlCpCZFkkFbm%2FWrfaRLm%2FwE4grymDQuGm8u7oC1zyQu4aymRBlYk7oVw%2BfavV%2BwdoNSD1alrO5HdNPiFpTMWOgmnTIuu3Jg7WLUeT4jNYVXZDrCYqxdO&X-Amz-Signature=85b89edbfd658f0a8e2ff33e373fec39d0a8f900c252a7aaf0f6b79894709c58&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RX4QDKJZ%2F20260224%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260224T064639Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECcaCXVzLXdlc3QtMiJIMEYCIQCckaxQSS%2FVPIqE%2FTbL3BH3UGSX0WQz30ME4g1wksaH2QIhAPyZAFEesPWKv9e0ciWRrpseCdlPrxbDb7rcDuv754GVKogECO%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzDQibeSoflEfgbruAq3ANHSo4UZye1uuXsK4JnZG1lPHIP3%2F8%2B7bON3d39SFA%2Fd23BUFvtvoezr1X4HAAIG4WblircLSDyzG48b5gIsDfNEDCZtQ5W9OYozJoPDKo%2BMV8WSKkf%2FwqCh02oJtjELciuduKrBbG%2FQcKy8UYgeoakQvsdvMdl6%2BvvrJAaLu8ZHygWzfjYSzg3t9GS15l2dFspfFbAeqL1dQxEGbwqEoUpIixmFEuWG4fnc0xG5s6Ontd%2BxYrVZvzG6Z6meGuqH7FPXpIYpObjntPPB2YepJ3I7VzMks3aIVG9Z8JS7O%2FvNtVjJn%2BpHPllWSEhmmQtxxvofisTkOhYO0%2Fafrua48ufz1By7rNAZYzYws3f%2BVffpJ9xd7eFunpmiAXx8CN2u%2FhL1HIaZdpXkRjSkdPVG%2F%2BM86dAl7cWltcq9nu1c42jbOajK%2BrsgcA2wMpRGLW6L1Gm6DAy2r71gsyhhfrua3v6sT%2FqIpEIEQbZLzusDedje3bHNbwVNuYskaUTVBaLzMG5WbGBNEYH8nC7yE2OtUm0OEkUQYooyDmfe%2BAJ9dQqlayBfdvyB9hjZS9oepztiiOkwoPeN7%2BTE%2FKC8ddbPervJZzLFhoQcqPsrp5XJn3SEOqq66OPq%2FjQer%2BGLzCvhfXMBjqkAYtoV1D5M2fR2rQTJjDan7BbqdGHJI%2B7FfucBIaflyJUJRMScy0Dl%2BambqQxX7MKLg83tGldQfr1LwIgv6KqpE9ZdwOcK%2BOoi6yTxPlFhlCpCZFkkFbm%2FWrfaRLm%2FwE4grymDQuGm8u7oC1zyQu4aymRBlYk7oVw%2BfavV%2BwdoNSD1alrO5HdNPiFpTMWOgmnTIuu3Jg7WLUeT4jNYVXZDrCYqxdO&X-Amz-Signature=faaf33e7dc45fd000bc191a9194b05bf5765a6e23d7bf297e31c184a37fd3bea&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
