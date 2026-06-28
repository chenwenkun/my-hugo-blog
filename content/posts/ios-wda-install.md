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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667JIJYSB7%2F20260628%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260628T131359Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIADkpOr9JSBEcCBLzR3SJ6k2svD7GvzyQYU6PVr4uS5MAiBCxO4fEfOlbKTdchN7uC5XI4htkmQz9%2BsBzupTCIRDliqIBAiT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM0DL%2FMnGw5NUTZAlLKtwD4eD4IFjfPBw7Wr8cYMkBCIFkss9RvdIVUoyGDQRqV4sJiNq425UKTOZFGOSE1Kho1HcgaLnaXeHglDnAmHZlHEkA4zuKMnhkKbOzlEuY2k4VOt9yoUZrkV1VpBsQAFhhgyFWfUKJR7LkJJGqXXtxi8AS%2BvpWnI8LJTVP%2B%2F4iICLltoBWh%2FeylxYMDvWb%2FLfN58V4wr7DWmIDnvEyx1QJLqME3OGy0cLUnlr3e5WHVu2fYqMqVrcqnP16XNVwOzKlGv0MMh1PLbFOg3qj3WoXgG3UN1xNu2z1i%2B%2FpYJ8lDdKb4k2ko7AtjpBtZm8hYhJeAJecQNIUxLPCa8qmA9KJny8XjZlrnMRp%2BIRhJjnsQzvjQXMkWIboy%2FoZedeL7joFMk8o3BBJaU3wf8BVJk3RItXXkUPStlJpJK7%2F8wTZZhW%2BCsY6R6FqqcQbsBdQVIz%2F%2BnJFU4qYnAnUf8enPNtzIjAZlyiLQowg70336H%2BOfys4npTaWXs%2FA%2BdiDq2Z%2Fb7DWKk0%2B5O2Yti5P0Ov3f0cMyYm75jHOMUf%2B8kA7aAZp0eHLc4c3MkAInd8k0MVr1Zcr9Kk5xD1vfJrtDmpq2Xj%2Bm%2Bmdyazba%2FD%2FInFa1WsciAKwkOgYY78BiVgFrYwg9KD0gY6pgE9eKH2gmKz8n4SFPLgUbA0TC2gFyMGJFX%2BmnIk3FQC07%2F%2FhaQfSet4f%2FtWze4J%2BeODMl7QOvEmlnAGKyGysZ4qNjqmSVdzyqtKONDMsvlqFGkYJV1O8BVfQ%2FZIZsE%2BF8OHTgbNOBgahCP%2FlBJG4GD%2BLHlNLaoAoINXQdjUzf50hmCnNz7j2OVQLHvP%2FQMaCdwCACMpVk7XAi9omvUiCcl1hdyRAbkW&X-Amz-Signature=cc1ef8ae352db814c8bda8957db1d6dc56f80c2f30faee47cdb74a99f5965f13&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667JIJYSB7%2F20260628%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260628T131359Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIADkpOr9JSBEcCBLzR3SJ6k2svD7GvzyQYU6PVr4uS5MAiBCxO4fEfOlbKTdchN7uC5XI4htkmQz9%2BsBzupTCIRDliqIBAiT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM0DL%2FMnGw5NUTZAlLKtwD4eD4IFjfPBw7Wr8cYMkBCIFkss9RvdIVUoyGDQRqV4sJiNq425UKTOZFGOSE1Kho1HcgaLnaXeHglDnAmHZlHEkA4zuKMnhkKbOzlEuY2k4VOt9yoUZrkV1VpBsQAFhhgyFWfUKJR7LkJJGqXXtxi8AS%2BvpWnI8LJTVP%2B%2F4iICLltoBWh%2FeylxYMDvWb%2FLfN58V4wr7DWmIDnvEyx1QJLqME3OGy0cLUnlr3e5WHVu2fYqMqVrcqnP16XNVwOzKlGv0MMh1PLbFOg3qj3WoXgG3UN1xNu2z1i%2B%2FpYJ8lDdKb4k2ko7AtjpBtZm8hYhJeAJecQNIUxLPCa8qmA9KJny8XjZlrnMRp%2BIRhJjnsQzvjQXMkWIboy%2FoZedeL7joFMk8o3BBJaU3wf8BVJk3RItXXkUPStlJpJK7%2F8wTZZhW%2BCsY6R6FqqcQbsBdQVIz%2F%2BnJFU4qYnAnUf8enPNtzIjAZlyiLQowg70336H%2BOfys4npTaWXs%2FA%2BdiDq2Z%2Fb7DWKk0%2B5O2Yti5P0Ov3f0cMyYm75jHOMUf%2B8kA7aAZp0eHLc4c3MkAInd8k0MVr1Zcr9Kk5xD1vfJrtDmpq2Xj%2Bm%2Bmdyazba%2FD%2FInFa1WsciAKwkOgYY78BiVgFrYwg9KD0gY6pgE9eKH2gmKz8n4SFPLgUbA0TC2gFyMGJFX%2BmnIk3FQC07%2F%2FhaQfSet4f%2FtWze4J%2BeODMl7QOvEmlnAGKyGysZ4qNjqmSVdzyqtKONDMsvlqFGkYJV1O8BVfQ%2FZIZsE%2BF8OHTgbNOBgahCP%2FlBJG4GD%2BLHlNLaoAoINXQdjUzf50hmCnNz7j2OVQLHvP%2FQMaCdwCACMpVk7XAi9omvUiCcl1hdyRAbkW&X-Amz-Signature=63b80469dbc8ae9afe924f1540eb0507c9857b516934a30b616927ec00830631&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
