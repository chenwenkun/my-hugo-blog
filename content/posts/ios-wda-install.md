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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YVX3XTIX%2F20251214%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251214T122032Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGgaCXVzLXdlc3QtMiJHMEUCIGErOVopnHE4AjFl646jswWVxPaLFyWHI5rQh%2FHb1ma%2BAiEAuoz7hE8AsyrSD9QDVMAOcYrjnCsfdXmuhHZ69P6cA14q%2FwMIMRAAGgw2Mzc0MjMxODM4MDUiDB8QlSPO7RX%2Bn9OAyircA8wh%2BtrhfiQPX%2BeujHREE0eeejyZE2g1jVElSGEMIfTIV1sxQ369IY%2FYZ53njwqnUsKN%2FqBPKEOu2zGlW4uarMRQyctZU7M%2BQvcaDVBZVtkSvx7lFobJB268osKgL8KnD%2BBS%2BAi9iWrY0bC9KIG6Yb3mGXy7h07bcg34DCZl18C%2F2fltkYhHf2OJp6IAhEvz%2B0rrw0KTn082hBpVb8U14e%2F2yANqIVTbJvYZL5%2FksOSkRmxtZ1qWYIAGhW2GiBICKSk%2FNezasU%2FK0okz6h8syK9tEO4pD5kWImtGiqNywMHp1KasjVW7n%2F4KVDmGO2XNnkJKKoSRqoaDBLMZgy1QmX3cmTfBOfaO4LW8quc33zdYJRi2%2B1oRDFEeeqln8uRj1lTmtsBgDmo%2FtEE2jlm5%2FGKHEAj1PcuEErx854kpMqdiPKsJsIC%2FazNon83FK6GBPFlYFETAjElLmUHC93r9WyJ0zTLCuEArlcMQOcHHbkxINdzXhyx3HJLKPILUdusyYnoTch7LC6j9pqfrYwqfuZm%2FwnuuHPKnkqelss4KNlD8Rls1d0NGDhLQ3hmO3IqEiuIIoHy1JJAk9cUeI%2B7ho6bsZ8hTPs1eYYIBCk8Fa6SkwQefTRnT28sNAhXZMJzQ%2BckGOqUBg9HUVqWh4u7YWV0TeDtiQuc3ExPsrmWiUIoB9%2FT511r%2BwAQfnF9xP6bLDMsQ2AxrTduEt0SWhC57jwQnaX88bVSeBRvp6aFu%2FOUVJwDxAJUaZkyu2vRGCzi2vg%2FNNrWVV%2FAPuceVsvX%2Bw%2B9bb9ssuqzSK6u7sB0c%2F74L7hhsfrC1tZ6hKVBNORPG5JpmAHmlgABEZCajGw3cgLcch2tSxW8Lzzi1&X-Amz-Signature=a64af8d1027ef6cc5c9ae195ee04d4ad9d12ec2fa83c90eb512cdb1e9f687d93&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YVX3XTIX%2F20251214%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251214T122032Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGgaCXVzLXdlc3QtMiJHMEUCIGErOVopnHE4AjFl646jswWVxPaLFyWHI5rQh%2FHb1ma%2BAiEAuoz7hE8AsyrSD9QDVMAOcYrjnCsfdXmuhHZ69P6cA14q%2FwMIMRAAGgw2Mzc0MjMxODM4MDUiDB8QlSPO7RX%2Bn9OAyircA8wh%2BtrhfiQPX%2BeujHREE0eeejyZE2g1jVElSGEMIfTIV1sxQ369IY%2FYZ53njwqnUsKN%2FqBPKEOu2zGlW4uarMRQyctZU7M%2BQvcaDVBZVtkSvx7lFobJB268osKgL8KnD%2BBS%2BAi9iWrY0bC9KIG6Yb3mGXy7h07bcg34DCZl18C%2F2fltkYhHf2OJp6IAhEvz%2B0rrw0KTn082hBpVb8U14e%2F2yANqIVTbJvYZL5%2FksOSkRmxtZ1qWYIAGhW2GiBICKSk%2FNezasU%2FK0okz6h8syK9tEO4pD5kWImtGiqNywMHp1KasjVW7n%2F4KVDmGO2XNnkJKKoSRqoaDBLMZgy1QmX3cmTfBOfaO4LW8quc33zdYJRi2%2B1oRDFEeeqln8uRj1lTmtsBgDmo%2FtEE2jlm5%2FGKHEAj1PcuEErx854kpMqdiPKsJsIC%2FazNon83FK6GBPFlYFETAjElLmUHC93r9WyJ0zTLCuEArlcMQOcHHbkxINdzXhyx3HJLKPILUdusyYnoTch7LC6j9pqfrYwqfuZm%2FwnuuHPKnkqelss4KNlD8Rls1d0NGDhLQ3hmO3IqEiuIIoHy1JJAk9cUeI%2B7ho6bsZ8hTPs1eYYIBCk8Fa6SkwQefTRnT28sNAhXZMJzQ%2BckGOqUBg9HUVqWh4u7YWV0TeDtiQuc3ExPsrmWiUIoB9%2FT511r%2BwAQfnF9xP6bLDMsQ2AxrTduEt0SWhC57jwQnaX88bVSeBRvp6aFu%2FOUVJwDxAJUaZkyu2vRGCzi2vg%2FNNrWVV%2FAPuceVsvX%2Bw%2B9bb9ssuqzSK6u7sB0c%2F74L7hhsfrC1tZ6hKVBNORPG5JpmAHmlgABEZCajGw3cgLcch2tSxW8Lzzi1&X-Amz-Signature=558ccde91102f4a829760369e66f9517a40b947c8fe8e7fd431333b725fed3f3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
