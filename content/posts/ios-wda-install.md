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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WTM54AMN%2F20251218%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251218T061855Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIGw21cfyMxi6DS7EkoV32vzwoBzORmNJizPmhvyfgWccAiByp2ikTYyxpSACmFOo%2Bmr%2FPh5JQAGmSUWOFUr%2BnSeeHyqIBAiO%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMRk9t8LHXiEZyDF1FKtwDe1%2BOK3j3BN%2FWk%2FCuLFLWFUwsU1aao2MslRkT9DCDCnlw%2FXcCOwmkdaUrFfzpy4ZCmNZc%2FLTuycUF3XUFTxSug5RObjc8vn7GpOFYZlTFg2NhjTYH7IC%2BoVZDOtVTuPrSs6xdZMPCzRGnYMipMSQv9IS8B1zjnCyA%2B0npyKwPqpvqw%2FcQsVljuKx6TuNMPUBQJyDJ8aQ9O%2BG3%2BEbjhePS6Re1N99A%2BVkZ4%2BaY7Zk5gaI%2B6rQwqo7r95P9HwObpCRLrMtLBnU9ribzQB99gXF8ygHpm9KWu50KaaX1ea6fKMqfHVbJt8JDcZGJMw9K%2Brif%2FeZDb7gD9oIajh4uUuAjgcxGKkqmSwcPqH6GXQLC%2FgBsGi6Bkc0pfiTtaJvfDYi4ESry2olIKQPXRsRD7WLLBmcIzD%2FDpooS52lExiIHOgHOHxuQ%2Bz6hlgGJbipceMez568v%2FxWkw7akejH9WuC2d0eWJSBEw%2BeboqUDyibIA3pX1yJlHXiV2r4XvTlgy8VAgp3%2BEet5FdzPCm8PEclLEHVBEq1h5dehB9LatLjVl8%2FIalAGAW5gJTOAUEtyVAvfabYxPzuNpYNidca%2B%2FDkINrJT3Hvid%2Bx6LrxR6hVm0XU0fjtnrUp%2BrlYvcbAwy56OygY6pgFgZC8Qqza8tMQ%2Bnc4ooXGHe8EtxJZca%2F5tChg%2FbMMNzN7H7BAgc7g7Dn2Hp%2F19ss6LTgPfL8oublvo%2FRk07IpwuTdn7wS9M6hF%2BCV%2BJtJ1qUVUdF%2F1k0cOz1Gl8yVv0IYkkoq68Gvjz7ZNjpFExjEG8xB%2FxQCHDP0MxcMU7ikRSozkPPn0%2FwjYiABCpxDscGZR%2Fg4NuJRf3R7%2Fpk2OB6SgNsFYQZ4U&X-Amz-Signature=e2e8ffcc0b4e7b03aca732d9b97a9ab058be803f5e71fd00b1f3f8cc76f257af&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WTM54AMN%2F20251218%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251218T061855Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIGw21cfyMxi6DS7EkoV32vzwoBzORmNJizPmhvyfgWccAiByp2ikTYyxpSACmFOo%2Bmr%2FPh5JQAGmSUWOFUr%2BnSeeHyqIBAiO%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMRk9t8LHXiEZyDF1FKtwDe1%2BOK3j3BN%2FWk%2FCuLFLWFUwsU1aao2MslRkT9DCDCnlw%2FXcCOwmkdaUrFfzpy4ZCmNZc%2FLTuycUF3XUFTxSug5RObjc8vn7GpOFYZlTFg2NhjTYH7IC%2BoVZDOtVTuPrSs6xdZMPCzRGnYMipMSQv9IS8B1zjnCyA%2B0npyKwPqpvqw%2FcQsVljuKx6TuNMPUBQJyDJ8aQ9O%2BG3%2BEbjhePS6Re1N99A%2BVkZ4%2BaY7Zk5gaI%2B6rQwqo7r95P9HwObpCRLrMtLBnU9ribzQB99gXF8ygHpm9KWu50KaaX1ea6fKMqfHVbJt8JDcZGJMw9K%2Brif%2FeZDb7gD9oIajh4uUuAjgcxGKkqmSwcPqH6GXQLC%2FgBsGi6Bkc0pfiTtaJvfDYi4ESry2olIKQPXRsRD7WLLBmcIzD%2FDpooS52lExiIHOgHOHxuQ%2Bz6hlgGJbipceMez568v%2FxWkw7akejH9WuC2d0eWJSBEw%2BeboqUDyibIA3pX1yJlHXiV2r4XvTlgy8VAgp3%2BEet5FdzPCm8PEclLEHVBEq1h5dehB9LatLjVl8%2FIalAGAW5gJTOAUEtyVAvfabYxPzuNpYNidca%2B%2FDkINrJT3Hvid%2Bx6LrxR6hVm0XU0fjtnrUp%2BrlYvcbAwy56OygY6pgFgZC8Qqza8tMQ%2Bnc4ooXGHe8EtxJZca%2F5tChg%2FbMMNzN7H7BAgc7g7Dn2Hp%2F19ss6LTgPfL8oublvo%2FRk07IpwuTdn7wS9M6hF%2BCV%2BJtJ1qUVUdF%2F1k0cOz1Gl8yVv0IYkkoq68Gvjz7ZNjpFExjEG8xB%2FxQCHDP0MxcMU7ikRSozkPPn0%2FwjYiABCpxDscGZR%2Fg4NuJRf3R7%2Fpk2OB6SgNsFYQZ4U&X-Amz-Signature=b3713a909e0ea0315d5687f771d464a1ad7b4098871295c39ccf646583cb8d23&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
