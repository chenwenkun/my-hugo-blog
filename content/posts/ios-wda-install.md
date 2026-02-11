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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665YAH276C%2F20260211%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260211T065047Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDtKZN3mzO2ZNcgcajq%2BdBGCQLYEqOfMxzGXU7aLL%2BzWgIhAIMEUdXWEbfVjsWHIk7Iuyd4Q85taQj4CrNrXpjq8EjuKogECLf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzUaDeGtwEjECz%2B0EUq3APeDX2XLdgESRPx1i5LhYlfGx5Ohh5sydH5mA0lV895jp5kLLxdldWKHIJ3W5DCoYmCnQehnoggC2zRxHiuODZMtkXt0BV9j7uIEpFEDglc2ltQ4PR0lowS69wOPnivS4%2BlnrtNU%2Bp7ZMALlz%2B0n79bSukv3RVIy5HLc2UzO%2BQpgWXsHk5JIzTsjhqbOoq5U%2FNamjdewOJwxOCxFJ07eY733771InkLlThgN4yddWr17wK%2BX7o54FPg%2BDKQQp%2BgPYCXoUTNidPC3qG%2F%2Fr%2BAQxFFGm%2BcWTcxZBWYqSODTGsMEHLLIJgDiVkgbZu1162a%2BPTHv%2BLtDjcQUGIZyorLc9mpdeLF5Dc%2F6BLntbEO6%2FH5GGmc7LsByD7qkf6eU4B6unACgcoLJ5X7u38TDu9ErQRUr4x85WlVcws6KxXZnlEZzeTcBYa9%2FyqkCH5DvEo4Z%2Bhis9H2KrmNO6eCrHilrXZr%2BdnDEDJQdOxaPGTOvzeU1A7G5Z8Goh2wj%2FztHFwxFxkFS%2FWISX9HW4DrBWZPbV3n1LPHU%2F0gczD9h834uQbnhGj6NvRY%2Bs4Prp4aEPyElM9JqPCYPcHFDGaok1AqBG5w9GGrM1nSPNwijBpea%2BrwGQYeROlkKOfMLsjb3TDavbDMBjqkAb3%2FypaLg8lRDNYwZsaYMMOVCV7R%2BRCFjE3kS8t2ztXedFKCRHc3wYwUx%2Fh3untEQEo3vJhzdMH5swf05AY9%2BoBIuE0t7fZtb92OfyHisALi5nQN5s9RCvgtIm0dLo5FKuisolVtJBcG0rw%2FQqqeBjv2aceZBz%2B%2FSNEgGn4u%2FsamUweE3JD8Tc1Cx0BoC4lh%2Bo6Yu79FU7uJ6rXvcBuv8dWvbFwF&X-Amz-Signature=0aaec506ffe725447defd5542f134f4d57485935893913a2403e30cca5e314c6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665YAH276C%2F20260211%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260211T065047Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDtKZN3mzO2ZNcgcajq%2BdBGCQLYEqOfMxzGXU7aLL%2BzWgIhAIMEUdXWEbfVjsWHIk7Iuyd4Q85taQj4CrNrXpjq8EjuKogECLf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzUaDeGtwEjECz%2B0EUq3APeDX2XLdgESRPx1i5LhYlfGx5Ohh5sydH5mA0lV895jp5kLLxdldWKHIJ3W5DCoYmCnQehnoggC2zRxHiuODZMtkXt0BV9j7uIEpFEDglc2ltQ4PR0lowS69wOPnivS4%2BlnrtNU%2Bp7ZMALlz%2B0n79bSukv3RVIy5HLc2UzO%2BQpgWXsHk5JIzTsjhqbOoq5U%2FNamjdewOJwxOCxFJ07eY733771InkLlThgN4yddWr17wK%2BX7o54FPg%2BDKQQp%2BgPYCXoUTNidPC3qG%2F%2Fr%2BAQxFFGm%2BcWTcxZBWYqSODTGsMEHLLIJgDiVkgbZu1162a%2BPTHv%2BLtDjcQUGIZyorLc9mpdeLF5Dc%2F6BLntbEO6%2FH5GGmc7LsByD7qkf6eU4B6unACgcoLJ5X7u38TDu9ErQRUr4x85WlVcws6KxXZnlEZzeTcBYa9%2FyqkCH5DvEo4Z%2Bhis9H2KrmNO6eCrHilrXZr%2BdnDEDJQdOxaPGTOvzeU1A7G5Z8Goh2wj%2FztHFwxFxkFS%2FWISX9HW4DrBWZPbV3n1LPHU%2F0gczD9h834uQbnhGj6NvRY%2Bs4Prp4aEPyElM9JqPCYPcHFDGaok1AqBG5w9GGrM1nSPNwijBpea%2BrwGQYeROlkKOfMLsjb3TDavbDMBjqkAb3%2FypaLg8lRDNYwZsaYMMOVCV7R%2BRCFjE3kS8t2ztXedFKCRHc3wYwUx%2Fh3untEQEo3vJhzdMH5swf05AY9%2BoBIuE0t7fZtb92OfyHisALi5nQN5s9RCvgtIm0dLo5FKuisolVtJBcG0rw%2FQqqeBjv2aceZBz%2B%2FSNEgGn4u%2FsamUweE3JD8Tc1Cx0BoC4lh%2Bo6Yu79FU7uJ6rXvcBuv8dWvbFwF&X-Amz-Signature=ad621146349495883e0aaced71516c8e084ddf79d3a76242e88ec4b89953bc4a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
