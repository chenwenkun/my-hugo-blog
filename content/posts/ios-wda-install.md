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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QCXGBKKP%2F20251111%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251111T061755Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEE4aCXVzLXdlc3QtMiJIMEYCIQDLPQpvRPZ7GHowYr1UVdixk%2FKADEdW4XLFEcran%2BXNhQIhAJxc4nZaglw30zWSNLCf2Ld9Po1alTwHtbWr7lsYkTgRKv8DCBcQABoMNjM3NDIzMTgzODA1IgzPNApgoAyBFdVvx8oq3AMWpewo83unotMl3yuq1u69mcno5BNWDYwh4W2DrIJBfA%2BtuZosPks0VpaY%2B0KFMn%2FUn1T5Y1%2BsRJU%2Fs%2BNno9LbzJErjfAGBO5k1fm0Yb2Wn8lkvbjLrrC6TJhDYjdcsRRktxB6i7PCVWKOQ9AtJH1q2aYFdIxacPF5wcOcZcKbIh4GZoHkFFjIkjYPT8I4FhUaLn5V6%2FDxtinBfFVtDQ7yPI0x2EkdbaAnKBvkWIJR4nlwqM2%2FAHCJx%2F9NefLAbRDLlbZSzMiGQzT7Idao0h0RNUAYI6Dg%2FjAulD%2FYnOUfxaBJK3QiPYAff0dhnSK9Vv7fsrVPQhXsCckVjEvawkHixcsfGbySRYhBTQyBI0SHOmq8x%2Bp9XjcnN6GM13MPFFzNh3KhgnNxDJ6r2pX61EuJrEw%2FO%2FbjBlLbtoWFPj4up%2FKRmuR7oFrnWJ6l7Raa9goRR1Ps7rWlrV%2BcDWjWzAk33IpevbB5i594T43w8xjsi%2BbEBDsIEwTovGShGEYEjqYKZGpcf0Aw7ktTDDZcl0ayVwEo%2B15b04DAqB%2FzzSDfax1AL7NYKAZYI4RXzPNmGHtAlkUTuMt77hGJ9wVyTM%2BsWIMEw4VkX5Bqxp0yaqK3NA1GApFc2rhfHx7kAjDumcvIBjqkAWWv0sH%2Bh%2Bol5AhirSYJKCg1jckaI%2BsP92O4OXoEbZ2%2B5LWU1RuA%2Fz%2Fc3aIglwRY8FJF%2B6xMaNKeJ344jSpl7Wtn0tlFYIg5Q1TeoQTncneAvihGtJGfGJvmPYcPwNahHjW6leYqwCqjJ0iDzPiOZuEauwQfijEyUXM3gN%2By9ozC9fHo7b6Izhhl4dzQJrAWFqEXeFaSR6XEuB7zaa%2F1n7bjE05P&X-Amz-Signature=7a14898e8cafb9b3c039ca578f94450519cdb0b79f8a4fe55d93793898b3b353&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QCXGBKKP%2F20251111%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251111T061755Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEE4aCXVzLXdlc3QtMiJIMEYCIQDLPQpvRPZ7GHowYr1UVdixk%2FKADEdW4XLFEcran%2BXNhQIhAJxc4nZaglw30zWSNLCf2Ld9Po1alTwHtbWr7lsYkTgRKv8DCBcQABoMNjM3NDIzMTgzODA1IgzPNApgoAyBFdVvx8oq3AMWpewo83unotMl3yuq1u69mcno5BNWDYwh4W2DrIJBfA%2BtuZosPks0VpaY%2B0KFMn%2FUn1T5Y1%2BsRJU%2Fs%2BNno9LbzJErjfAGBO5k1fm0Yb2Wn8lkvbjLrrC6TJhDYjdcsRRktxB6i7PCVWKOQ9AtJH1q2aYFdIxacPF5wcOcZcKbIh4GZoHkFFjIkjYPT8I4FhUaLn5V6%2FDxtinBfFVtDQ7yPI0x2EkdbaAnKBvkWIJR4nlwqM2%2FAHCJx%2F9NefLAbRDLlbZSzMiGQzT7Idao0h0RNUAYI6Dg%2FjAulD%2FYnOUfxaBJK3QiPYAff0dhnSK9Vv7fsrVPQhXsCckVjEvawkHixcsfGbySRYhBTQyBI0SHOmq8x%2Bp9XjcnN6GM13MPFFzNh3KhgnNxDJ6r2pX61EuJrEw%2FO%2FbjBlLbtoWFPj4up%2FKRmuR7oFrnWJ6l7Raa9goRR1Ps7rWlrV%2BcDWjWzAk33IpevbB5i594T43w8xjsi%2BbEBDsIEwTovGShGEYEjqYKZGpcf0Aw7ktTDDZcl0ayVwEo%2B15b04DAqB%2FzzSDfax1AL7NYKAZYI4RXzPNmGHtAlkUTuMt77hGJ9wVyTM%2BsWIMEw4VkX5Bqxp0yaqK3NA1GApFc2rhfHx7kAjDumcvIBjqkAWWv0sH%2Bh%2Bol5AhirSYJKCg1jckaI%2BsP92O4OXoEbZ2%2B5LWU1RuA%2Fz%2Fc3aIglwRY8FJF%2B6xMaNKeJ344jSpl7Wtn0tlFYIg5Q1TeoQTncneAvihGtJGfGJvmPYcPwNahHjW6leYqwCqjJ0iDzPiOZuEauwQfijEyUXM3gN%2By9ozC9fHo7b6Izhhl4dzQJrAWFqEXeFaSR6XEuB7zaa%2F1n7bjE05P&X-Amz-Signature=a540cf28b20785b79e90a205f6fe214ec16066789657d3e1edc7ed4f7e838d43&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
