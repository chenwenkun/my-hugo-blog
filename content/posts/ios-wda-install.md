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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TOFT44SN%2F20260103%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260103T181603Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFAaCXVzLXdlc3QtMiJHMEUCIQDEOVTzPWk5a2FqZi10sJVu02WTt%2FJJow99by30raBmBAIgUoyGEdse6MUqSmbtY%2B6q5yJBBFLS4xApOcYFqkxQKIQq%2FwMIGRAAGgw2Mzc0MjMxODM4MDUiDBEarWMxzdvYrfnsyircA4lm%2BxTA583dP6PG6uKhLZPAOw3O7SnOK753TfqJ1oG69W8vHN4p1ronzmOR4wH2TpUEhLYCO46ZbCfKQWlafECAAto2%2FrDGCDJzXnqEnh%2FthhQHrQelSydX6A1XsQsxZQttGz7yT3QnNs1gd2WqNZiVOpd2X41dSOXMfe4OyhMPZ%2B0EUwniIR%2BcW9HXx4jkn4HMET413646ZOyT%2B5abf2L22A4GWy2uxmJYhAIuP5fTYkThUxKxjIRuYs1c%2BjiXsYzTgn%2BobkbihkZ8d4NLuFMcsTy2dEZ0SpC6%2B06estMWB6Q9IpmHymt4VXz4kwKL3U8ZNTXAUiRPRAlp1fgNJoVs3CoYg5vSg5IIpPauwn2cTd841ncd66KTHnedby6xInvVxDSXuaLE281aGMGWJDeUAyI0TBdMEZKQuXiKhhiG0sowqcIDyu22SQpA%2Fu%2BV7nnCcjSF%2BotNInfV56vKgzFVEi45HJzjTp1IvLtz%2FTr%2BtqiblkqU2JFucVNGhyHbgYTDmXysHGJD3J9ZAiwY5BTAOiZBkdS5ZW8zdpM7871VlL1MYlJMWJ%2FVGsgk2xoAOzsBsjl2u8s1TlB6N%2BqtxtTgoNKFfO1U3etKWgkKFJ3AXSHAgk0gghuCCIljMPH55MoGOqUBrr7R01xs%2Bj4PvFFChyCcO4PTQvLU3XbsGyxi3KHoWSPjuDgSasWO4MjB3CLcAon5USXvZwh0Lb9N7%2FwdZK7jHhUcrKSu87%2BqJQy0UfXF7v7FenomkQfjQmhrEP9%2FaQdgT%2BFv4Q%2FsGs8BWQCSZ38moixDdLmiy%2F6ZX1us6WWfPnyvEapbNyabDM2%2Ba0k%2BjgjIcXtl%2F%2Bjt9Pj5e6DU9IV26eVlxKhu&X-Amz-Signature=8ab3d429333f39658d992e257aedf936efce15f235a33c9e10a42c7e5962333b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TOFT44SN%2F20260103%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260103T181603Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFAaCXVzLXdlc3QtMiJHMEUCIQDEOVTzPWk5a2FqZi10sJVu02WTt%2FJJow99by30raBmBAIgUoyGEdse6MUqSmbtY%2B6q5yJBBFLS4xApOcYFqkxQKIQq%2FwMIGRAAGgw2Mzc0MjMxODM4MDUiDBEarWMxzdvYrfnsyircA4lm%2BxTA583dP6PG6uKhLZPAOw3O7SnOK753TfqJ1oG69W8vHN4p1ronzmOR4wH2TpUEhLYCO46ZbCfKQWlafECAAto2%2FrDGCDJzXnqEnh%2FthhQHrQelSydX6A1XsQsxZQttGz7yT3QnNs1gd2WqNZiVOpd2X41dSOXMfe4OyhMPZ%2B0EUwniIR%2BcW9HXx4jkn4HMET413646ZOyT%2B5abf2L22A4GWy2uxmJYhAIuP5fTYkThUxKxjIRuYs1c%2BjiXsYzTgn%2BobkbihkZ8d4NLuFMcsTy2dEZ0SpC6%2B06estMWB6Q9IpmHymt4VXz4kwKL3U8ZNTXAUiRPRAlp1fgNJoVs3CoYg5vSg5IIpPauwn2cTd841ncd66KTHnedby6xInvVxDSXuaLE281aGMGWJDeUAyI0TBdMEZKQuXiKhhiG0sowqcIDyu22SQpA%2Fu%2BV7nnCcjSF%2BotNInfV56vKgzFVEi45HJzjTp1IvLtz%2FTr%2BtqiblkqU2JFucVNGhyHbgYTDmXysHGJD3J9ZAiwY5BTAOiZBkdS5ZW8zdpM7871VlL1MYlJMWJ%2FVGsgk2xoAOzsBsjl2u8s1TlB6N%2BqtxtTgoNKFfO1U3etKWgkKFJ3AXSHAgk0gghuCCIljMPH55MoGOqUBrr7R01xs%2Bj4PvFFChyCcO4PTQvLU3XbsGyxi3KHoWSPjuDgSasWO4MjB3CLcAon5USXvZwh0Lb9N7%2FwdZK7jHhUcrKSu87%2BqJQy0UfXF7v7FenomkQfjQmhrEP9%2FaQdgT%2BFv4Q%2FsGs8BWQCSZ38moixDdLmiy%2F6ZX1us6WWfPnyvEapbNyabDM2%2Ba0k%2BjgjIcXtl%2F%2Bjt9Pj5e6DU9IV26eVlxKhu&X-Amz-Signature=9df9d1583604872c48b2dfc16d44c12c4af0f761052da7fccb60b6ed3c513dc8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
