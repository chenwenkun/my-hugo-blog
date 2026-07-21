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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Z75PNUPM%2F20260721%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260721T012941Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCKGVyeOU%2FllcUwNJYdYfluygxFDHK9%2F1SGBbjBQlph3AIgcrJUwkqmbCHedTKVlAvEsq1F8zIlwNcz%2FarPuysQhHkqiAQIsP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDPUM%2FaaiFRVvzugdTyrcA5WtuHJZ19BWRFyHJ6uiiGwrtMWv%2B7CJ4%2FTuyz%2F0%2FvU3HNjDigcQ3cfRR%2BGGqzJK63o8rwHABhZNVG3RHX8dB%2BSfuEsToD%2B6vwTlyV69RnioQgVUORx8BA%2F5bOqxvJEqAWSmTxFd3dE%2FgzH42UsDVjZR1PCKcVc7yWCpquaTf4rWMOiAgBcOopqPkWjlWZaSQZ3gg7qOP7vloUkDc3G8Zn4I2UAKRCR7Mpl6BzFZZUKYeilGVZ6C9xV3Vr5x%2BKaORmDJGNtPKzztZzWcuuVe3lLscYDaXKWtIJnA8lvX9pjkJkM3QETeE%2B5ArnBwkbLVxQkbbZViB7Q6R0d1AHMi%2FAeOIK5BrdwxS8U7f8OLgoed5YpEtyjVKRHPr4UBvbdtJSX5FLAP93hD2WoGLRQQd660hTeXqnUv2y82FcKkxsnvAERfDB1h2NwWDU%2FqaeEiyGp8k0jls13Bj4HFnnXxrMRjm1VlPAHZ56DTbMJJbnYrBKeWcjsbcvN2CL1YgUqkOm%2FyYkQcugreQOATSOO93mGual9sB3g9t%2F%2FKmsE16N1t8hBccXQLlqd%2BdHwRwewWetzmvYAQgEMIoJMxEvtKlxb5vcFi%2FDmpx7BmpyxEEWhASRMNen6fQZB8K7K1MLPC%2BtIGOqUBwc1mWmRbOkSawHCCh%2Fy9kFA09kjF5VIpGo4f3TEWmq8ImoXM0bOL6T0fcfLURjAxqPjtdtmUemZAUEeti4dRK0uJbX%2B7fJsQ3AFC6km%2ByHDoZVSTN3ktMe%2BzV1Bt0x1HUN1qbxnOX6MdrnlrpHzMKS2FWfiteIaogOw8OuS5g5pZGY9x6ZC%2B0Xy%2BY4qeskVT%2FhNqGfWN3zLAZUAxm4nYwlmGDGRq&X-Amz-Signature=af660c40112e7605cffbc6f12d53017de19f650a928392d8ba1f2aa765ebfcd5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Z75PNUPM%2F20260721%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260721T012941Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCKGVyeOU%2FllcUwNJYdYfluygxFDHK9%2F1SGBbjBQlph3AIgcrJUwkqmbCHedTKVlAvEsq1F8zIlwNcz%2FarPuysQhHkqiAQIsP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDPUM%2FaaiFRVvzugdTyrcA5WtuHJZ19BWRFyHJ6uiiGwrtMWv%2B7CJ4%2FTuyz%2F0%2FvU3HNjDigcQ3cfRR%2BGGqzJK63o8rwHABhZNVG3RHX8dB%2BSfuEsToD%2B6vwTlyV69RnioQgVUORx8BA%2F5bOqxvJEqAWSmTxFd3dE%2FgzH42UsDVjZR1PCKcVc7yWCpquaTf4rWMOiAgBcOopqPkWjlWZaSQZ3gg7qOP7vloUkDc3G8Zn4I2UAKRCR7Mpl6BzFZZUKYeilGVZ6C9xV3Vr5x%2BKaORmDJGNtPKzztZzWcuuVe3lLscYDaXKWtIJnA8lvX9pjkJkM3QETeE%2B5ArnBwkbLVxQkbbZViB7Q6R0d1AHMi%2FAeOIK5BrdwxS8U7f8OLgoed5YpEtyjVKRHPr4UBvbdtJSX5FLAP93hD2WoGLRQQd660hTeXqnUv2y82FcKkxsnvAERfDB1h2NwWDU%2FqaeEiyGp8k0jls13Bj4HFnnXxrMRjm1VlPAHZ56DTbMJJbnYrBKeWcjsbcvN2CL1YgUqkOm%2FyYkQcugreQOATSOO93mGual9sB3g9t%2F%2FKmsE16N1t8hBccXQLlqd%2BdHwRwewWetzmvYAQgEMIoJMxEvtKlxb5vcFi%2FDmpx7BmpyxEEWhASRMNen6fQZB8K7K1MLPC%2BtIGOqUBwc1mWmRbOkSawHCCh%2Fy9kFA09kjF5VIpGo4f3TEWmq8ImoXM0bOL6T0fcfLURjAxqPjtdtmUemZAUEeti4dRK0uJbX%2B7fJsQ3AFC6km%2ByHDoZVSTN3ktMe%2BzV1Bt0x1HUN1qbxnOX6MdrnlrpHzMKS2FWfiteIaogOw8OuS5g5pZGY9x6ZC%2B0Xy%2BY4qeskVT%2FhNqGfWN3zLAZUAxm4nYwlmGDGRq&X-Amz-Signature=8d31698f872416b7c8d854cd33dff2fe8ea2876c4e26b9819914f155b3ab6d28&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
