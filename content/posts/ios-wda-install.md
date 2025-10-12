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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466W2UVCGOL%2F20251012%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251012T061415Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEH0aCXVzLXdlc3QtMiJHMEUCIChkWqLw6YTsAp5YLHDJZfnvvMxF7L7auPutBW%2BiGy76AiEA84%2FY%2Fsl8m6oSE%2FrSXxlTf%2BZLGGy%2Bkt80mlehPAI%2FXVwq%2FwMIJRAAGgw2Mzc0MjMxODM4MDUiDJfuryj6U9OwhhFmUSrcA78klM0Op2o%2FdUDm53g1cNZ%2B2zIrn6bbvaXgbo9eABX%2FHL85ywgvBCPhnAr0LRwzDfs4AtYCDNytSVbV4jKBeLYqEQ81r3BBFSq5yVo2pqfVy0SbWhBQUrEzV6RDL3MXqjZqWTZ0S6gbA%2Bd7lQLzwX9U%2BFGbPDa2UwbOSCMBajlJLP0ca5UVUCavOK6l7NgkgBCHt1oZMsmZIXW6PfsjzD%2Fvo3wqM2wPrtRYnv2lC1QC8rBmKU4jernbyO%2BP1Gpe7e6AT1U8FGdpla%2FOlGHzO5Uuv0FK19AQVh5yDWY7DN53mw%2FoF9Adx9Cw4caxtoEkumobjUutf7qP6A139EypejNrHu9wbN52x9UYevVPm1eCoT%2Fx%2B8M4%2BCBNhx6Hqmzq0QlZW4hUI1%2BjyEAjrurpvqFjuY2uiA1ZTaBugvS0bgV%2BsCTHLcPrtWcHFuuGxAlrnQqjZNzufbrd9Ls2c6Q%2BlGUxACXPS81ONre6z07Pplxt6B0yiODf2XhBoXwWWva4MBUUBJ2Ezx80tI4b1MjMs8LUyZgMlkMKCv7bGd32JgtWiLSPby6ZFZZs%2BF3U%2BR5tPCbe1MiHpLTvKWtb%2BoBOHvlU187GSkWgNNJmdvIHuSLafG%2FWnjRX6V6cDY2kMI7brMcGOqUBUoWPZctpcUQT3f%2FvkFy3j%2BL1b3g7xGBYh%2BDc5U%2Fr1qPv8SyMAl%2F3Q2TkIP%2F%2FZw3o9iR0K3VN%2FV0vQeY0MQNQqUbAuBPkLhcWdDiMXcZrKmXeutSaxwXILqwfvxtS8OwCwaaadmAiTEZNW9m5cfjso%2F13D5VIkhKWg8Rb0s2Z%2FOgx1tNmOnAnMLAHr9vrzQubUg5dg56v1ft%2BF9CEgU25ecSr6z1e&X-Amz-Signature=2b581e1926dc3f9079b29b5985b7732882481401bbb67fbb170d69c7a21afbd7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466W2UVCGOL%2F20251012%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251012T061415Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEH0aCXVzLXdlc3QtMiJHMEUCIChkWqLw6YTsAp5YLHDJZfnvvMxF7L7auPutBW%2BiGy76AiEA84%2FY%2Fsl8m6oSE%2FrSXxlTf%2BZLGGy%2Bkt80mlehPAI%2FXVwq%2FwMIJRAAGgw2Mzc0MjMxODM4MDUiDJfuryj6U9OwhhFmUSrcA78klM0Op2o%2FdUDm53g1cNZ%2B2zIrn6bbvaXgbo9eABX%2FHL85ywgvBCPhnAr0LRwzDfs4AtYCDNytSVbV4jKBeLYqEQ81r3BBFSq5yVo2pqfVy0SbWhBQUrEzV6RDL3MXqjZqWTZ0S6gbA%2Bd7lQLzwX9U%2BFGbPDa2UwbOSCMBajlJLP0ca5UVUCavOK6l7NgkgBCHt1oZMsmZIXW6PfsjzD%2Fvo3wqM2wPrtRYnv2lC1QC8rBmKU4jernbyO%2BP1Gpe7e6AT1U8FGdpla%2FOlGHzO5Uuv0FK19AQVh5yDWY7DN53mw%2FoF9Adx9Cw4caxtoEkumobjUutf7qP6A139EypejNrHu9wbN52x9UYevVPm1eCoT%2Fx%2B8M4%2BCBNhx6Hqmzq0QlZW4hUI1%2BjyEAjrurpvqFjuY2uiA1ZTaBugvS0bgV%2BsCTHLcPrtWcHFuuGxAlrnQqjZNzufbrd9Ls2c6Q%2BlGUxACXPS81ONre6z07Pplxt6B0yiODf2XhBoXwWWva4MBUUBJ2Ezx80tI4b1MjMs8LUyZgMlkMKCv7bGd32JgtWiLSPby6ZFZZs%2BF3U%2BR5tPCbe1MiHpLTvKWtb%2BoBOHvlU187GSkWgNNJmdvIHuSLafG%2FWnjRX6V6cDY2kMI7brMcGOqUBUoWPZctpcUQT3f%2FvkFy3j%2BL1b3g7xGBYh%2BDc5U%2Fr1qPv8SyMAl%2F3Q2TkIP%2F%2FZw3o9iR0K3VN%2FV0vQeY0MQNQqUbAuBPkLhcWdDiMXcZrKmXeutSaxwXILqwfvxtS8OwCwaaadmAiTEZNW9m5cfjso%2F13D5VIkhKWg8Rb0s2Z%2FOgx1tNmOnAnMLAHr9vrzQubUg5dg56v1ft%2BF9CEgU25ecSr6z1e&X-Amz-Signature=6d6cd1d95f98affa88d45b482bb3842fd9c98fbc8997a09a90c91a46c3138da6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
