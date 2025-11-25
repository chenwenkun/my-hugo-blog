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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TKTWG73A%2F20251125%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251125T005313Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCbH53Ou2lKRpQvuudth%2FjjmtTVLRmuedg4wCZfbbTDOAIgXEbLdJzR6JX2qUVAOzovY9h8aVQ%2Fv8ME9Iin9LSwEIIq%2FwMIYBAAGgw2Mzc0MjMxODM4MDUiDBywwukb5a5crZkHOSrcA9xMihHM3Ew%2F1R0xj3KZoy1lrd9JqbL9KGH7zDbMupNzSkI0lw51ACCQY4Ckh3dLJKACG7OEedQ66bwusRg6i2xmJOqvl8fCOwMBgye%2BbpgpDLOhLDzSRC3527hVjmssX9xMxCd7e8WMZ4jVg%2FGPFnWtw4%2BCcplC2nYGJgmEBPGmh5rFYMWKmMgy%2FaoLjasRVUudWNp4Dvj2x%2Bu52WvHGFWebfx1QQKMTwLbLSPBCNszWjhNgHjPInYO5OElS8TT8R7BJf5xLuYwR0MrcqjxPnXXBZ04JjevZyukxzQTADJ9HREmu95G2Cx2F2oencEgnnJueN54l7Q%2F7KFL7Orgtz3NTNIABvVr7dWRWPPiRuXnzgUsRaAM%2B%2Fg%2FmwwwQSJoHzLd4qnKaDNj7Zq3NS5AgQe24hJMBx4vV06fF2RID2BbuqpbaPuy9sDj%2F%2BJS7uDC4cV9%2B68db%2BxzWwhCpZaon4MqM1ZM4366ibJlwmxPqo7ypR9pWpFpWyw2drkc7bKIz1DUiBN7WHFzMxK%2Bk1a2w75UD087rAlNxdg9lL49jeKiDVsbP6jhix%2FDDdXU%2Fg4ahHI%2F8mZ6Jwt4kF%2B642tjFzRAb8VTgei%2BOxm0mY%2FeI4CoB3cpi8U9QYqLmH%2BHMJfLk8kGOqUBpFFWWgK%2BIfR%2BeIRJFEXFJv17sKShrnRAEqn%2Bck%2BdR6vN4%2BTJksArMj2eNlOHNpgMaz2LvP4XMq2BSC49OZZtra%2FUUHPJtL52dK59Lg8Z1CH1GXvqKXQyV0xZLjBtdgI5mpxHA84s3NIozvaeRMG7jpzERW8feGPswX7cXNTdbxivVdvCacJJnuohtbcFk3vSDbmPMgFWvhaBcFtidMOHTqwFRWWn&X-Amz-Signature=9a4ecb78da12ca66595689d31e45339a205f1e61501e37e94ca71041127c711b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TKTWG73A%2F20251125%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251125T005313Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCbH53Ou2lKRpQvuudth%2FjjmtTVLRmuedg4wCZfbbTDOAIgXEbLdJzR6JX2qUVAOzovY9h8aVQ%2Fv8ME9Iin9LSwEIIq%2FwMIYBAAGgw2Mzc0MjMxODM4MDUiDBywwukb5a5crZkHOSrcA9xMihHM3Ew%2F1R0xj3KZoy1lrd9JqbL9KGH7zDbMupNzSkI0lw51ACCQY4Ckh3dLJKACG7OEedQ66bwusRg6i2xmJOqvl8fCOwMBgye%2BbpgpDLOhLDzSRC3527hVjmssX9xMxCd7e8WMZ4jVg%2FGPFnWtw4%2BCcplC2nYGJgmEBPGmh5rFYMWKmMgy%2FaoLjasRVUudWNp4Dvj2x%2Bu52WvHGFWebfx1QQKMTwLbLSPBCNszWjhNgHjPInYO5OElS8TT8R7BJf5xLuYwR0MrcqjxPnXXBZ04JjevZyukxzQTADJ9HREmu95G2Cx2F2oencEgnnJueN54l7Q%2F7KFL7Orgtz3NTNIABvVr7dWRWPPiRuXnzgUsRaAM%2B%2Fg%2FmwwwQSJoHzLd4qnKaDNj7Zq3NS5AgQe24hJMBx4vV06fF2RID2BbuqpbaPuy9sDj%2F%2BJS7uDC4cV9%2B68db%2BxzWwhCpZaon4MqM1ZM4366ibJlwmxPqo7ypR9pWpFpWyw2drkc7bKIz1DUiBN7WHFzMxK%2Bk1a2w75UD087rAlNxdg9lL49jeKiDVsbP6jhix%2FDDdXU%2Fg4ahHI%2F8mZ6Jwt4kF%2B642tjFzRAb8VTgei%2BOxm0mY%2FeI4CoB3cpi8U9QYqLmH%2BHMJfLk8kGOqUBpFFWWgK%2BIfR%2BeIRJFEXFJv17sKShrnRAEqn%2Bck%2BdR6vN4%2BTJksArMj2eNlOHNpgMaz2LvP4XMq2BSC49OZZtra%2FUUHPJtL52dK59Lg8Z1CH1GXvqKXQyV0xZLjBtdgI5mpxHA84s3NIozvaeRMG7jpzERW8feGPswX7cXNTdbxivVdvCacJJnuohtbcFk3vSDbmPMgFWvhaBcFtidMOHTqwFRWWn&X-Amz-Signature=2f0b8b703573e7df1ad2ee3bd9cea8608581c9838a67098c14c068dc41377b72&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
