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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663PHXD65G%2F20260530%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260530T130110Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBMaCXVzLXdlc3QtMiJHMEUCIQClcIUYCzi6bwh4NpUsm5YnlTczd4aDVQuozJevNLd4mQIgO2ktALK72KX5r3kM2jbqyUn3vQFvjRIQWE5t2zYPCAUqiAQI3P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDCU9M660VBUtHRkWCCrcA4sJKXC3IUQsOgXBHT%2BR58CZSnMtxeWjqZjgpzAvsGYz6TFywaGXkTTA90fQORWTI80pQ9b37D93Ltgsu4zFxd0%2FYTP72erkgFLxfmUQtj3YP4X3BCo85%2BwVins94wGgQcsRBZebv4livN1P6Sqy76vPrug85e5vLSS8Q7xzUU9W6E7G9HbVu0y3K6VIdFD5QyJ8NomjDDxL6e6zT76yd4TwLkgQw%2BBiGYUC3dTqg3T19hbtGE2hk4tMAukQVZT4ZlSNK4NtDNfmZQe0wVZFZEXlLbYZoqNrVwYipLWU6cf78%2F3PL5%2BPP%2BywXUTNvQUILSQTIpRRrH83y1qzefS3eZBCIoaOKVknL%2FUcwWLP%2B9bjeHb%2FRecExqYfE2Z%2F31oe%2FtoW2TVg7bTh1vnxrIDchB%2FmMj9zXyNfoM3FoNOHesQtIDANEZuHbAM1MN1AsL%2FDB8XIlRHmdK%2BICF1pwY7iXma8uDpRBkW5pkmRoWax1QJQktv%2BkJ6gGk5vkkKaw%2Brx7S%2FQlY%2B6r7u7fB1kHEbZRQ%2BUaSCGcDoeVo7Wm0J7SutoGEwcNzbDCIuOyW6a0IPvPhRfmCLXOWhJlMt5izXVhYIR6H4BcG8cY305rfBOqV1amJml5hkWIDI3khvRMKqJ69AGOqUBGSY8BWJ5tTPzG3Jzf041vK%2BINFlHPDhCHDklMHiWk2abSsbxBJsxb8ZuDIcBLazkbNPLKUcbn9n7C9FYTxPzkaFy5gf%2F1Z7UYZIHGWo3zpYTSUFu0n6l9K6wkeXG%2Flu%2FrcPRVq639ksLm7EWwqnpy8EpaAMAatGiWb6zjAsRxfhLM%2FXiCu6vaKmbhb5iFxcT7aQuVoogiDRzI4GW4j45hpyyCVlf&X-Amz-Signature=62c16e321316fbca29ac58dd8a173693dbfe6f29db0fdb44f849dad066738451&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663PHXD65G%2F20260530%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260530T130110Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBMaCXVzLXdlc3QtMiJHMEUCIQClcIUYCzi6bwh4NpUsm5YnlTczd4aDVQuozJevNLd4mQIgO2ktALK72KX5r3kM2jbqyUn3vQFvjRIQWE5t2zYPCAUqiAQI3P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDCU9M660VBUtHRkWCCrcA4sJKXC3IUQsOgXBHT%2BR58CZSnMtxeWjqZjgpzAvsGYz6TFywaGXkTTA90fQORWTI80pQ9b37D93Ltgsu4zFxd0%2FYTP72erkgFLxfmUQtj3YP4X3BCo85%2BwVins94wGgQcsRBZebv4livN1P6Sqy76vPrug85e5vLSS8Q7xzUU9W6E7G9HbVu0y3K6VIdFD5QyJ8NomjDDxL6e6zT76yd4TwLkgQw%2BBiGYUC3dTqg3T19hbtGE2hk4tMAukQVZT4ZlSNK4NtDNfmZQe0wVZFZEXlLbYZoqNrVwYipLWU6cf78%2F3PL5%2BPP%2BywXUTNvQUILSQTIpRRrH83y1qzefS3eZBCIoaOKVknL%2FUcwWLP%2B9bjeHb%2FRecExqYfE2Z%2F31oe%2FtoW2TVg7bTh1vnxrIDchB%2FmMj9zXyNfoM3FoNOHesQtIDANEZuHbAM1MN1AsL%2FDB8XIlRHmdK%2BICF1pwY7iXma8uDpRBkW5pkmRoWax1QJQktv%2BkJ6gGk5vkkKaw%2Brx7S%2FQlY%2B6r7u7fB1kHEbZRQ%2BUaSCGcDoeVo7Wm0J7SutoGEwcNzbDCIuOyW6a0IPvPhRfmCLXOWhJlMt5izXVhYIR6H4BcG8cY305rfBOqV1amJml5hkWIDI3khvRMKqJ69AGOqUBGSY8BWJ5tTPzG3Jzf041vK%2BINFlHPDhCHDklMHiWk2abSsbxBJsxb8ZuDIcBLazkbNPLKUcbn9n7C9FYTxPzkaFy5gf%2F1Z7UYZIHGWo3zpYTSUFu0n6l9K6wkeXG%2Flu%2FrcPRVq639ksLm7EWwqnpy8EpaAMAatGiWb6zjAsRxfhLM%2FXiCu6vaKmbhb5iFxcT7aQuVoogiDRzI4GW4j45hpyyCVlf&X-Amz-Signature=7d1111d3efb8de0c266b855b8aa04800023b65da7504532f00f5f8e04c5aecfe&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
