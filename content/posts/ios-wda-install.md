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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667P7J56HA%2F20260531%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260531T190106Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDEaCXVzLXdlc3QtMiJGMEQCIEtLmTljuA9HpU0XZ1p6U4VT3eXyJFGffiy7VuGBf256AiBN5c6NA6RyvujFSqy8NJHvaJ8hvKWYr2Zmsqy5%2F5cElSqIBAj6%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMH1f%2F2mJxBBG%2FosibKtwDN45wHeYAhgFzhSKG89UejHyDYHs4a3YSopXEsVOWh43EcEE%2Bcn7XXzHMv97DrS9g3vlujRqio%2FB%2F5d9bCSPwmkbiEhczhKTABaHyvaC88g7bdAYe%2B6xoOrOFPRWJBwftZQKylVKHCgFUupiLsLF49ilOxEEoTMFUwdG5DQU7DE0nrmT7tlc3UJb6pso%2FecYm%2FMoU1X4SNqZJ8fpBcnLmLDFtuLJ5hcXUxcNpguvIJmXTtUsUYOf7piTSdj%2FQRPXCswsbjK%2BJMA64LUDr1dgomdZGoijxBAyRgfX9RCcoPTkVEL%2BYOHPNmjbkCFLgtlVHy%2FkDIIgKmqCKpMgHfG4gw8bTYeisABER%2BfsenOZLHp8h1DKOnr6HvwaYrML0Te3NoGYszNxR4UQewQBDVunGhmMwjlgZoxW68L2gjVoR%2B0bJbhgtsQ%2FQ1%2BNEJOxM2gIKDy6N6tp8lPI25Z4mskMASNY0ImhEqjRPaKek%2F4f03TjUSNKsTSWmwcsk6qqTNMaeKp8uznx9mTZSsQR28HTeve3TL5Ov%2B3D3AA3aEANrWBmEA5CGlCL9CUwaM1hSzeMhgLiDMrwz2WHIeYAScl30RirqyljOkmsfple3qGnSgLeqDRKkqVcvKhkbt0Iwt9Hx0AY6pgE6PvE4SdykwUtu2HFrnjGeqsKHvl6wLE4APIjwUeCPVjDHN%2FY1mOXR2cBfIkMTmhuzEZfvu1AgQxB%2BWPy4LJuYHqfVmr31cFIp5kBFGs2YSPXYlEM%2Bls4eYjRPC1c2hPSF1btIl2EE3%2B4OOMLClPShyEomqN%2BXI8urnqNjw0Z860bf7J%2BqlEXc87kpa%2F4EK0TXSpiIGJ6ezNjin%2FYyGDc9Tfsj4nNt&X-Amz-Signature=e48699e092c340ddcd804ad8a5a0f58783fd9ab6af4f7423ecfc987ebfcff93f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667P7J56HA%2F20260531%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260531T190106Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDEaCXVzLXdlc3QtMiJGMEQCIEtLmTljuA9HpU0XZ1p6U4VT3eXyJFGffiy7VuGBf256AiBN5c6NA6RyvujFSqy8NJHvaJ8hvKWYr2Zmsqy5%2F5cElSqIBAj6%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMH1f%2F2mJxBBG%2FosibKtwDN45wHeYAhgFzhSKG89UejHyDYHs4a3YSopXEsVOWh43EcEE%2Bcn7XXzHMv97DrS9g3vlujRqio%2FB%2F5d9bCSPwmkbiEhczhKTABaHyvaC88g7bdAYe%2B6xoOrOFPRWJBwftZQKylVKHCgFUupiLsLF49ilOxEEoTMFUwdG5DQU7DE0nrmT7tlc3UJb6pso%2FecYm%2FMoU1X4SNqZJ8fpBcnLmLDFtuLJ5hcXUxcNpguvIJmXTtUsUYOf7piTSdj%2FQRPXCswsbjK%2BJMA64LUDr1dgomdZGoijxBAyRgfX9RCcoPTkVEL%2BYOHPNmjbkCFLgtlVHy%2FkDIIgKmqCKpMgHfG4gw8bTYeisABER%2BfsenOZLHp8h1DKOnr6HvwaYrML0Te3NoGYszNxR4UQewQBDVunGhmMwjlgZoxW68L2gjVoR%2B0bJbhgtsQ%2FQ1%2BNEJOxM2gIKDy6N6tp8lPI25Z4mskMASNY0ImhEqjRPaKek%2F4f03TjUSNKsTSWmwcsk6qqTNMaeKp8uznx9mTZSsQR28HTeve3TL5Ov%2B3D3AA3aEANrWBmEA5CGlCL9CUwaM1hSzeMhgLiDMrwz2WHIeYAScl30RirqyljOkmsfple3qGnSgLeqDRKkqVcvKhkbt0Iwt9Hx0AY6pgE6PvE4SdykwUtu2HFrnjGeqsKHvl6wLE4APIjwUeCPVjDHN%2FY1mOXR2cBfIkMTmhuzEZfvu1AgQxB%2BWPy4LJuYHqfVmr31cFIp5kBFGs2YSPXYlEM%2Bls4eYjRPC1c2hPSF1btIl2EE3%2B4OOMLClPShyEomqN%2BXI8urnqNjw0Z860bf7J%2BqlEXc87kpa%2F4EK0TXSpiIGJ6ezNjin%2FYyGDc9Tfsj4nNt&X-Amz-Signature=aee2cc9ffd8deacc88b2e94d410e6dab9acadeee0d85f4cd372f1050a91af614&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
