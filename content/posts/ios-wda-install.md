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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VUO5IKRF%2F20251211%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251211T005705Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBgaCXVzLXdlc3QtMiJIMEYCIQCOWq%2FXxfYqM2kYRNr8U0UP33sBKynUvPQgTCxjfo%2Fk2QIhAIkc6ZLOq%2BdpKI6HalZskyUgj6FW2ps0Vc1iAr6TOwu1KogECOH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzNm9HeKL9A1D8DzXEq3APoczASEDHBZ9iu8QbhCO3uqTnb8nz7JJHPB0bn0g8%2FKCtO05N9DMuer%2Fmp6L%2FypONgGNjN9sftLHgFJG2rpmpQXfZ84M%2FybTRcyLWOFTPl4w1oocnMmf60oaGcoT6Z9ggdUhYP7thkWy93aoiCU3BGBza%2BqBRXoa40T7aXWkaWFjHePZw08NAiCkbvFl7CUYxazTOloWyJmN5Dxfd5%2FK67ajkYWngcUFNkbxrA83kFgWfhSMHs6it92L68N8X8AT0ZJVqqqfDDRVIJiEv584VBWDGyghv4R4ig4%2FuJVVClcaQXmQMsmb%2BXSh6O59V24uKVZe8fBzEghavT20eKEmnzPvyVwngO9AGX9%2F3znDN5%2BSZTVfY7CdQSHt8sBU%2FxP0eVa%2Fj2EB2D3ohIOp80FqAvx5FcsJqOIBqbPFlTHpAUAzZmsd%2B9nlD4MGwxoUkgt9aWin4r%2FA3Px1NmjEjWSf3GVwpfSDD2keWCBoFBRnpXqWhCCyls%2BQRpqXhmyIBCQ3%2FvYG0jrpbCjQmH6kEXOFD7GJBazA1RFWwHjVfSCFkfnvKkRfSGig1eJAdrDM0c0Wtt3%2BmzHJ1Qhp36DXnDOZKI%2B383ISNT%2F5bErSCy8uVBBvDz2AD%2Fm0MZx1XvlzCslOjJBjqkAbKVFE%2Bo7s5VIR4QxUcQIJKelrWHUqKmIIh7tkEahYhcZRKCR9vRuCiQ1MX3txz0oR1%2FIQZpXOw%2FD1%2B1C9ShWhwGmKuDlGn4sN2YQnklgingeaapetjhMo%2BHYtBF6wlgh2Jx2xxF5JSyG3z%2FVZfXUe9TMOSu%2F8IzR2JU9IozafSXt%2FUiyifqlsgiND0mSXLKrUBbwePqBZxzoupKTcETKRFfH6JU&X-Amz-Signature=8afbffd02d551cc0824640b5318d26e6a1c0e418583d0af0e328f369d63a5217&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VUO5IKRF%2F20251211%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251211T005705Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBgaCXVzLXdlc3QtMiJIMEYCIQCOWq%2FXxfYqM2kYRNr8U0UP33sBKynUvPQgTCxjfo%2Fk2QIhAIkc6ZLOq%2BdpKI6HalZskyUgj6FW2ps0Vc1iAr6TOwu1KogECOH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzNm9HeKL9A1D8DzXEq3APoczASEDHBZ9iu8QbhCO3uqTnb8nz7JJHPB0bn0g8%2FKCtO05N9DMuer%2Fmp6L%2FypONgGNjN9sftLHgFJG2rpmpQXfZ84M%2FybTRcyLWOFTPl4w1oocnMmf60oaGcoT6Z9ggdUhYP7thkWy93aoiCU3BGBza%2BqBRXoa40T7aXWkaWFjHePZw08NAiCkbvFl7CUYxazTOloWyJmN5Dxfd5%2FK67ajkYWngcUFNkbxrA83kFgWfhSMHs6it92L68N8X8AT0ZJVqqqfDDRVIJiEv584VBWDGyghv4R4ig4%2FuJVVClcaQXmQMsmb%2BXSh6O59V24uKVZe8fBzEghavT20eKEmnzPvyVwngO9AGX9%2F3znDN5%2BSZTVfY7CdQSHt8sBU%2FxP0eVa%2Fj2EB2D3ohIOp80FqAvx5FcsJqOIBqbPFlTHpAUAzZmsd%2B9nlD4MGwxoUkgt9aWin4r%2FA3Px1NmjEjWSf3GVwpfSDD2keWCBoFBRnpXqWhCCyls%2BQRpqXhmyIBCQ3%2FvYG0jrpbCjQmH6kEXOFD7GJBazA1RFWwHjVfSCFkfnvKkRfSGig1eJAdrDM0c0Wtt3%2BmzHJ1Qhp36DXnDOZKI%2B383ISNT%2F5bErSCy8uVBBvDz2AD%2Fm0MZx1XvlzCslOjJBjqkAbKVFE%2Bo7s5VIR4QxUcQIJKelrWHUqKmIIh7tkEahYhcZRKCR9vRuCiQ1MX3txz0oR1%2FIQZpXOw%2FD1%2B1C9ShWhwGmKuDlGn4sN2YQnklgingeaapetjhMo%2BHYtBF6wlgh2Jx2xxF5JSyG3z%2FVZfXUe9TMOSu%2F8IzR2JU9IozafSXt%2FUiyifqlsgiND0mSXLKrUBbwePqBZxzoupKTcETKRFfH6JU&X-Amz-Signature=5d02adcba39ff9a2f875250ca5efc2c364d7f8e18b5dd8e36fe90172bf1e0f11&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
