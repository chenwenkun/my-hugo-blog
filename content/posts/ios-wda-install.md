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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZSWEGTJJ%2F20251122%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251122T005117Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFAaCXVzLXdlc3QtMiJGMEQCIC0CYhAUxqkAMRj1KKsS1QvCj5yw4fWgsETrydIYJaLqAiAqLQzbndSDt1kjevdPQ2SOQU8sKxvetzWwYsTxMmbI%2Fir%2FAwgZEAAaDDYzNzQyMzE4MzgwNSIMXhRKuPxMkGd8Na8IKtwDXOXMaU3rKihsjCOitqhI7YV4VrAcDAGr0XaKY1VYsH1oCVyoJ%2FYpwAq0U%2B7JJ80ccTtuioigugq%2FjoUCyfU0DhGKOYdyF1mxghG%2FGOwfFZOwq7cu60kTDkhgNp%2BdMwVmq1VZVs%2B4uToO5SNHfTOnJ4kJxs0ov6i0jELxoMueIkimvV9WjY9V%2Fa%2BXREsVPyIxKNgMzN1QmDmqi7Tor4%2BgadV2g0CVJcdhB9VdVhn5hhKN8WvUrvLwXCuum6BZ8Kz1NyQV9MjBam28W2x3fpPnJUiBUAjckzvNLDr80WMy3lWKtZX2cu25NvaYwLQyadYfx5MedO8K11k%2FGVnhymSokZvRVBJ6sO4IbcynNmRlO5JVXCcwFWnlguwRf%2BOU6fZj81ddLv1nUWcZXwCHYN6h%2FxsIHMwOVxY7d%2FEdA8uwnbybC1CzlO4xweHhsULKiCQC1CLZj7LJMIDuGktpr6dGy3%2FfIpxQLUhxIU19VNd24JEUEe9wMkkhOGXwZYU4pUIlDePxf2wqLk1FnV1KLiEL04%2BMEwSkaXdJDH0aGSPuoRXtcXGxPt%2FDR4nBigwbrPK1BZR5GgHdkAlVd3gMULImN5jguI7a%2FEA9CtrbcZZqF4RUM2qp%2FmO5gNK0UsswloGEyQY6pgFBU9Byl2lk%2F4q5dfJQ2Tl1F9OALvjucr0yQebQCxMgi53Px8s%2BQGOd6bwOt%2B9nya18Ij1SRGp2RBc05cQFRqCAUmX1bZIvt4hWc0dkZ1a39nsV1ESAtpGdhcpYBBwoFsjLteJ8vZZWYJRSIwqXjUZtQoRjc4%2BS6CIolCx2jAonFKRN51SqyiIYiwr4QkbAPMoW0mCyMJTlBWfJZKsd3rBWF%2BsEh5j3&X-Amz-Signature=5203fd836f2c94b1e76d9b766dbe80e914af5e97371b3a1555328e6f0b368374&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZSWEGTJJ%2F20251122%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251122T005117Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFAaCXVzLXdlc3QtMiJGMEQCIC0CYhAUxqkAMRj1KKsS1QvCj5yw4fWgsETrydIYJaLqAiAqLQzbndSDt1kjevdPQ2SOQU8sKxvetzWwYsTxMmbI%2Fir%2FAwgZEAAaDDYzNzQyMzE4MzgwNSIMXhRKuPxMkGd8Na8IKtwDXOXMaU3rKihsjCOitqhI7YV4VrAcDAGr0XaKY1VYsH1oCVyoJ%2FYpwAq0U%2B7JJ80ccTtuioigugq%2FjoUCyfU0DhGKOYdyF1mxghG%2FGOwfFZOwq7cu60kTDkhgNp%2BdMwVmq1VZVs%2B4uToO5SNHfTOnJ4kJxs0ov6i0jELxoMueIkimvV9WjY9V%2Fa%2BXREsVPyIxKNgMzN1QmDmqi7Tor4%2BgadV2g0CVJcdhB9VdVhn5hhKN8WvUrvLwXCuum6BZ8Kz1NyQV9MjBam28W2x3fpPnJUiBUAjckzvNLDr80WMy3lWKtZX2cu25NvaYwLQyadYfx5MedO8K11k%2FGVnhymSokZvRVBJ6sO4IbcynNmRlO5JVXCcwFWnlguwRf%2BOU6fZj81ddLv1nUWcZXwCHYN6h%2FxsIHMwOVxY7d%2FEdA8uwnbybC1CzlO4xweHhsULKiCQC1CLZj7LJMIDuGktpr6dGy3%2FfIpxQLUhxIU19VNd24JEUEe9wMkkhOGXwZYU4pUIlDePxf2wqLk1FnV1KLiEL04%2BMEwSkaXdJDH0aGSPuoRXtcXGxPt%2FDR4nBigwbrPK1BZR5GgHdkAlVd3gMULImN5jguI7a%2FEA9CtrbcZZqF4RUM2qp%2FmO5gNK0UsswloGEyQY6pgFBU9Byl2lk%2F4q5dfJQ2Tl1F9OALvjucr0yQebQCxMgi53Px8s%2BQGOd6bwOt%2B9nya18Ij1SRGp2RBc05cQFRqCAUmX1bZIvt4hWc0dkZ1a39nsV1ESAtpGdhcpYBBwoFsjLteJ8vZZWYJRSIwqXjUZtQoRjc4%2BS6CIolCx2jAonFKRN51SqyiIYiwr4QkbAPMoW0mCyMJTlBWfJZKsd3rBWF%2BsEh5j3&X-Amz-Signature=a0d130b1b34ce62ca00a31ea96ac43147dde809ea52e6ea2daa6ac752c5c8ac9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
