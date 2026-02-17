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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SVDWQX3J%2F20260217%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260217T011147Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHkaCXVzLXdlc3QtMiJHMEUCIE12L3VCjfaH9k6f1A2AcJLA9FBX1CjX3uIVtk%2Fx1UbqAiEA%2Bm3LsmXCObbyOPbfkxxSjWV92EAcCDrzyn614A76zHYq%2FwMIQhAAGgw2Mzc0MjMxODM4MDUiDCiTXTB6KVvhde%2FSYSrcA8%2BuSCsRqEC5nQPZwiSYDbdjz%2BXAxotwIfOBuFqX0D785jo4ZIQ0c4lT9xM8YNeRzcJ0DQBemSPCIux80Ii48CyNPOoBf%2F0wAUCvM1CQTarfhVkpDFBIKJvxZXH87lybESPwO7N6Rp%2BmM75Qmew35XDAC%2Fk79HGrE1v2mkhH2kTVa1%2FpKFt%2BaduPQUGi9gg1KOoUu%2BPW1Vb8xbo%2FsBjvWKoMUwuouGsTFlECq5uiOdDoYmysyOxLj5Ff56iABiF%2B4nOv0HPaLaQo7JvzEOJEZJS5ZQ4RkeooOM5zJs9Mu%2B0ML%2FKU7vqMgN8dqCPfhEZxXzBhT%2FDp1t81og9q6hLuY8iPT0T9%2F5tADrzfznnrWL4n4x626myupJfvksZUShw76WomMDdL%2BjVg6i0R2Jug79DgLWg0t9fVXLZB06G0pnEIKu59G8JxbEDkAnB44X%2FKMnqetwzReWpHqVkX4OU3twtKUYN4Rg3bv3cKWsze62%2BMd0TxUT2Kin3TFmI9RSxHt5kbaaaQTmQ%2BiIf7JwhaxxUCvZwzbS9jLVVenuBvbXoNLzjlUALGBpg0JXWYi10eOtDjHBu7HAAOZxSh7dJLkIXCFVkKNkNgBkCIiGSNhRyJAq81o%2B%2F9M%2BpviJo5MO3wzswGOqUBtkh5H9TM0KXOrRbU4gA6W6YfFoWlQ3lKF8ygDoM57oA%2BKShdOtuWk1QjeycOD4U9E2quFsYWtq6A96jhEV4TVAb6y%2BwPKV07J9jdSH97m7YehulpEW%2FX8uRIHquoMg%2BHCcGsnedKPXCu7cYZGx99JHArWFx14arTGuzzfzGh0KnK%2FGk3YanQzF99ARdG3oyomMwwvtMbyEgvneLYng2LWXuTooxK&X-Amz-Signature=9b7061696c2bb5b5c4df9ac86bb5dd8eeab81cdf000eae3caca1165780804835&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SVDWQX3J%2F20260217%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260217T011147Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHkaCXVzLXdlc3QtMiJHMEUCIE12L3VCjfaH9k6f1A2AcJLA9FBX1CjX3uIVtk%2Fx1UbqAiEA%2Bm3LsmXCObbyOPbfkxxSjWV92EAcCDrzyn614A76zHYq%2FwMIQhAAGgw2Mzc0MjMxODM4MDUiDCiTXTB6KVvhde%2FSYSrcA8%2BuSCsRqEC5nQPZwiSYDbdjz%2BXAxotwIfOBuFqX0D785jo4ZIQ0c4lT9xM8YNeRzcJ0DQBemSPCIux80Ii48CyNPOoBf%2F0wAUCvM1CQTarfhVkpDFBIKJvxZXH87lybESPwO7N6Rp%2BmM75Qmew35XDAC%2Fk79HGrE1v2mkhH2kTVa1%2FpKFt%2BaduPQUGi9gg1KOoUu%2BPW1Vb8xbo%2FsBjvWKoMUwuouGsTFlECq5uiOdDoYmysyOxLj5Ff56iABiF%2B4nOv0HPaLaQo7JvzEOJEZJS5ZQ4RkeooOM5zJs9Mu%2B0ML%2FKU7vqMgN8dqCPfhEZxXzBhT%2FDp1t81og9q6hLuY8iPT0T9%2F5tADrzfznnrWL4n4x626myupJfvksZUShw76WomMDdL%2BjVg6i0R2Jug79DgLWg0t9fVXLZB06G0pnEIKu59G8JxbEDkAnB44X%2FKMnqetwzReWpHqVkX4OU3twtKUYN4Rg3bv3cKWsze62%2BMd0TxUT2Kin3TFmI9RSxHt5kbaaaQTmQ%2BiIf7JwhaxxUCvZwzbS9jLVVenuBvbXoNLzjlUALGBpg0JXWYi10eOtDjHBu7HAAOZxSh7dJLkIXCFVkKNkNgBkCIiGSNhRyJAq81o%2B%2F9M%2BpviJo5MO3wzswGOqUBtkh5H9TM0KXOrRbU4gA6W6YfFoWlQ3lKF8ygDoM57oA%2BKShdOtuWk1QjeycOD4U9E2quFsYWtq6A96jhEV4TVAb6y%2BwPKV07J9jdSH97m7YehulpEW%2FX8uRIHquoMg%2BHCcGsnedKPXCu7cYZGx99JHArWFx14arTGuzzfzGh0KnK%2FGk3YanQzF99ARdG3oyomMwwvtMbyEgvneLYng2LWXuTooxK&X-Amz-Signature=ab99231e2a831242804f008daaea1028d7343f566f57be24744d323c169ab458&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
