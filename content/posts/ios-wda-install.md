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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TF5O4UGN%2F20260219%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260219T183905Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIEnG6V0bAVcW9z8BNpTLkO%2BmIku4vLDaxn4U2bTpvQbGAiAkQPRk%2FwopT%2BIRmf9aWXlUFstO9m9RpKP6u248854UyiqIBAiC%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMfitZ3uO4FTEY%2BrABKtwD8WZD8%2FbVEdscIu6YhsjEZnzJhcLI5ddyV9yIfJoQ7skI2sAPqdX%2F0Rs499fOK3Hz8taMEHk6XdsyQ%2FMGaT2nRFyDwbWj8wfnrtGMQJAQP0viWZd5L0PSfjnyKNFlPZhTWU7hhkhA97FYapll%2F%2F12IB%2FwVB%2BXO4YILKVZUnZGasAzEbXte5jYDJyAfkD94NffoxcGqheWM8NCd%2BDEs9a%2B27TL8Mj0fky14HaeZDksipAVn16x7Qg%2FJrAUY%2FmrpCCjw7a8ftn558iiBcRcfM6BzlmHFs1wGTM5f1BgxDUcyLaJe%2FveTa1nm3qJlGkpxNjyRxfQ94wN4h8%2F88QtWN6%2BIw%2BBITg6TCpa0CKuq33BtyBgk7h0WkpOIP9hFgrQqvCk9kV7TCmD8vvr0aZXKRb5AC%2FgeJgLZmawE1rKVkpzfy56M8eq1p%2B2vDPqeZ%2BtGA0jKo8Vd76gXp%2FH3RGVG8I2hb%2FQLhNB6oN5l12GJnuRvmXu7yx5VgX5U0sNgjp8bwO3q5rHJbXqG0cgqXC6SjxEy4arHUkwdhtn3IPDI7ksO9DYjS%2BqEZt5a2v170vEjAtgfLG3MLyxfhkmHNGtBQ2eaKLukdD4B2XIIwmMcmr%2FHk3OYxMNh6hlB9PdQ%2B8wiIbdzAY6pgH5MYy49k9BdkfClXHtBeFAMX6lHhf8wi16Z9ogU3%2ByxbfrM%2BLvAhX0n24RijlfN1O%2FokSdGwESyNHYJwy%2FzvNcb%2F8%2BQfMAuYCXIOs5gFrtFistNwvDPP5%2FgaTvbNFuEgplrIpxfS3ye2MAj%2FytcDPUx%2FLgjzGmpTEmQcFCwIeGF9egbe808bT18n5a%2FuC18hwBcDoon3YM4BYDKC1K%2F92tk4vDf9vd&X-Amz-Signature=d245aa18c40c4a0b9444f96c1f28c0f85df41eccb8a01c4171f4b3b58843316e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TF5O4UGN%2F20260219%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260219T183905Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIEnG6V0bAVcW9z8BNpTLkO%2BmIku4vLDaxn4U2bTpvQbGAiAkQPRk%2FwopT%2BIRmf9aWXlUFstO9m9RpKP6u248854UyiqIBAiC%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMfitZ3uO4FTEY%2BrABKtwD8WZD8%2FbVEdscIu6YhsjEZnzJhcLI5ddyV9yIfJoQ7skI2sAPqdX%2F0Rs499fOK3Hz8taMEHk6XdsyQ%2FMGaT2nRFyDwbWj8wfnrtGMQJAQP0viWZd5L0PSfjnyKNFlPZhTWU7hhkhA97FYapll%2F%2F12IB%2FwVB%2BXO4YILKVZUnZGasAzEbXte5jYDJyAfkD94NffoxcGqheWM8NCd%2BDEs9a%2B27TL8Mj0fky14HaeZDksipAVn16x7Qg%2FJrAUY%2FmrpCCjw7a8ftn558iiBcRcfM6BzlmHFs1wGTM5f1BgxDUcyLaJe%2FveTa1nm3qJlGkpxNjyRxfQ94wN4h8%2F88QtWN6%2BIw%2BBITg6TCpa0CKuq33BtyBgk7h0WkpOIP9hFgrQqvCk9kV7TCmD8vvr0aZXKRb5AC%2FgeJgLZmawE1rKVkpzfy56M8eq1p%2B2vDPqeZ%2BtGA0jKo8Vd76gXp%2FH3RGVG8I2hb%2FQLhNB6oN5l12GJnuRvmXu7yx5VgX5U0sNgjp8bwO3q5rHJbXqG0cgqXC6SjxEy4arHUkwdhtn3IPDI7ksO9DYjS%2BqEZt5a2v170vEjAtgfLG3MLyxfhkmHNGtBQ2eaKLukdD4B2XIIwmMcmr%2FHk3OYxMNh6hlB9PdQ%2B8wiIbdzAY6pgH5MYy49k9BdkfClXHtBeFAMX6lHhf8wi16Z9ogU3%2ByxbfrM%2BLvAhX0n24RijlfN1O%2FokSdGwESyNHYJwy%2FzvNcb%2F8%2BQfMAuYCXIOs5gFrtFistNwvDPP5%2FgaTvbNFuEgplrIpxfS3ye2MAj%2FytcDPUx%2FLgjzGmpTEmQcFCwIeGF9egbe808bT18n5a%2FuC18hwBcDoon3YM4BYDKC1K%2F92tk4vDf9vd&X-Amz-Signature=e5356254cc7a416cff7406b3134a4bf96823e545b4dd6be75b6d6d301a3442bb&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
