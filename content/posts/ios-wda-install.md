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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662ONROTNR%2F20260115%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260115T182333Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHIaCXVzLXdlc3QtMiJHMEUCIQDDkwJUe3MoUBn%2Bfh5dtjcH6%2FdqH7%2B3OCRs2jsjduM7BgIgfGvqGxU%2BCn1Ns2pnbj2%2BaUu9CaU5wW15G5OqwB2cQScq%2FwMIOxAAGgw2Mzc0MjMxODM4MDUiDDbBfnOVaShyezoadyrcA0mJAwYEI4GdyECBblENQ0I2dLPRYkKI84zDVirkewOU2mZFigK352Urc7UWPbEjk9HvQkEbKz6nZ%2BNpC0JrjwHrqRE0oTI4CdHbsZ89XmiY55FoPVATK9%2FN28wh8VPwonIao%2F1HOes9LYtRWBBvhJiZgmMOIrskyde%2FMRs14%2FMX74BDfl%2BAH7w6GGBkXs1OnSULI4yBoc%2B3l5zT7PJ7JHoZsUH2uUp3e%2Fxw%2BRC1zDO0GKtlzCmpCjLV%2F0VaQHlxEuneW52pK%2F7AWBmZDgzyQLiXEsiIoP2448DuQdufc85jQ5epG7Oc3cydQma7cQZ4H8CdtMxTxE8y2icJWWl2jG9c%2Fw7525imMcj9VcjLUWZUQH3zcuks49Yg%2F1pKUM2VE%2B2xSfd5dG5dlNDQHCK%2BITyYZDTxmUscLIQ%2BVRbu7ssT24P%2FvKB4Wu2f6TtqFvEi9PEn%2FdYlTJn7buSpP25ZkSRWXqe%2Bsx6rwspgY%2Fpva%2Bi4mdxYxMTv4kafSnZhI0L5SOcQk98zyj1U4EjUr8LBlXPQ8GnvR0ZeJmwyPIAZcwAsFHI1ii0gUcBD8CJ9c9Gu4Ms%2BQmUCAdGFrhbTEA%2BO4HCUhdRFAL70YRpRhrMyaUlGpfcSQFzV2eHJtc3NMMHQpMsGOqUBOCSz8%2FsvCZ9abvmXhkYHslY7pzvwlcQMDzy70O3qqszZTCYxa4sLxkiAQhi%2Fe1H1YEKsegHnyeqhiwyLloD7oPpqQJRwH6rbZ05Y7M%2BAlsieeXafSc1XM3%2FQ5w7mHwf8GoZFdw6f23QfviQH0ueNP0E9hjpzvBaCuNeK5bxPWc8RiFw%2Bb0G6CPUsAf8rauCFA5EZynqy%2BHLNKCQ5HYKC0NgeXJrX&X-Amz-Signature=ec7cb09aecb324c06c2098323cd59d79187d00319c0236012dff1daae759777f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662ONROTNR%2F20260115%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260115T182333Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHIaCXVzLXdlc3QtMiJHMEUCIQDDkwJUe3MoUBn%2Bfh5dtjcH6%2FdqH7%2B3OCRs2jsjduM7BgIgfGvqGxU%2BCn1Ns2pnbj2%2BaUu9CaU5wW15G5OqwB2cQScq%2FwMIOxAAGgw2Mzc0MjMxODM4MDUiDDbBfnOVaShyezoadyrcA0mJAwYEI4GdyECBblENQ0I2dLPRYkKI84zDVirkewOU2mZFigK352Urc7UWPbEjk9HvQkEbKz6nZ%2BNpC0JrjwHrqRE0oTI4CdHbsZ89XmiY55FoPVATK9%2FN28wh8VPwonIao%2F1HOes9LYtRWBBvhJiZgmMOIrskyde%2FMRs14%2FMX74BDfl%2BAH7w6GGBkXs1OnSULI4yBoc%2B3l5zT7PJ7JHoZsUH2uUp3e%2Fxw%2BRC1zDO0GKtlzCmpCjLV%2F0VaQHlxEuneW52pK%2F7AWBmZDgzyQLiXEsiIoP2448DuQdufc85jQ5epG7Oc3cydQma7cQZ4H8CdtMxTxE8y2icJWWl2jG9c%2Fw7525imMcj9VcjLUWZUQH3zcuks49Yg%2F1pKUM2VE%2B2xSfd5dG5dlNDQHCK%2BITyYZDTxmUscLIQ%2BVRbu7ssT24P%2FvKB4Wu2f6TtqFvEi9PEn%2FdYlTJn7buSpP25ZkSRWXqe%2Bsx6rwspgY%2Fpva%2Bi4mdxYxMTv4kafSnZhI0L5SOcQk98zyj1U4EjUr8LBlXPQ8GnvR0ZeJmwyPIAZcwAsFHI1ii0gUcBD8CJ9c9Gu4Ms%2BQmUCAdGFrhbTEA%2BO4HCUhdRFAL70YRpRhrMyaUlGpfcSQFzV2eHJtc3NMMHQpMsGOqUBOCSz8%2FsvCZ9abvmXhkYHslY7pzvwlcQMDzy70O3qqszZTCYxa4sLxkiAQhi%2Fe1H1YEKsegHnyeqhiwyLloD7oPpqQJRwH6rbZ05Y7M%2BAlsieeXafSc1XM3%2FQ5w7mHwf8GoZFdw6f23QfviQH0ueNP0E9hjpzvBaCuNeK5bxPWc8RiFw%2Bb0G6CPUsAf8rauCFA5EZynqy%2BHLNKCQ5HYKC0NgeXJrX&X-Amz-Signature=bf0c0de05fa634a25887df680131aff15c0f5821e8017253698559381f0c5578&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
