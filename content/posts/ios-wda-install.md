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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Q3TUR4HQ%2F20251006%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251006T061721Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDx%2FnRaaRD8CCL1HSP5sIJp%2BfpPQYhyAmFCpn9UezNtYwIgUlmlgJI78wmJafeLdWOgZIJHuTY7Q%2BLbLnyqPWIVPo8qiAQIhv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDIk30nQeHO2h7vXipSrcA%2Bmlitp7I8hdyrCVq2lOkuQ4cl%2FVIPQ5hfWfHHJgQqB9zGp955CSe9nBc6v4iY%2FDgEvc3GE8TQKkrmmhWjz9OJQMKI0fFIvuUiycBBuJohw73s8UwYI18Zw9PUEGR1MOlWtjkL%2Ba8QVgdhy5UfMMnvm8G2E0ZDHJafzGSw%2BlLMmIMMIQTj0h7IpeB90Y6S%2B7sVWvoRX%2FZoCq1AdfvEU81%2Fv5o74wa9YrCGUzLzzJAbSMB7L1JpNyt0n2Fd8nGBHFukCsBFKF9fmxjwl9EhcLpudyjVz7IHPrP3kthTm7WTytqRQaw5K19DazPyEqfySIXyXPK717k9%2FpkClEyg1ue11OyHMjt1l3E%2FoH8QAfJP1EM7eonSqGlijrz8vMQlp%2BIQKZHzTZkYry3IigyJjfdvQeycNqjATElSEzPgp4SPQEGyjcD4lexL%2Bk1ExpH0SnUVpduzvE0Dj1WOWmM3Eh%2BpwtkttubXTIijVgjsho95PxOKuvRGX1JFRMwEUvpyp6JZ%2BwVAS%2BHgExXL3Z5t2j60ZmVx%2Fc751hAhhBQbQHcGevG7f%2BEGteFBbSqdOyZ2uSvUCmdALal2WEUHt3RKtbjFB3zT8POhVRQUzgT5dJaDlywyPAfcY7qWXC74P5MKmljccGOqUBhrTV9mYle1FJsDFbzDisJXcjfXA%2FXdld08v%2BZop9SGBMo0n3qHZcf5pj%2BQVkh0okojMqG24Zip9O6hseExEAyEz2nrVX0uft0sl1%2FsuVB%2Bt%2BIiDDiR3xSlorP7iTwRtk98ROXSx2881YwSU%2FlvgEkcgUZQl22TNmEs8ylLVEHJDvRMLNqGnbTnnehAf8Tg4yV6G%2FzYz%2B04K2m2cTrJx0NkcawWj%2F&X-Amz-Signature=33787bd6d971d8a43341b24ec2dca786e538e9e6450f82570b53fb589928fdd4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Q3TUR4HQ%2F20251006%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251006T061720Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDx%2FnRaaRD8CCL1HSP5sIJp%2BfpPQYhyAmFCpn9UezNtYwIgUlmlgJI78wmJafeLdWOgZIJHuTY7Q%2BLbLnyqPWIVPo8qiAQIhv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDIk30nQeHO2h7vXipSrcA%2Bmlitp7I8hdyrCVq2lOkuQ4cl%2FVIPQ5hfWfHHJgQqB9zGp955CSe9nBc6v4iY%2FDgEvc3GE8TQKkrmmhWjz9OJQMKI0fFIvuUiycBBuJohw73s8UwYI18Zw9PUEGR1MOlWtjkL%2Ba8QVgdhy5UfMMnvm8G2E0ZDHJafzGSw%2BlLMmIMMIQTj0h7IpeB90Y6S%2B7sVWvoRX%2FZoCq1AdfvEU81%2Fv5o74wa9YrCGUzLzzJAbSMB7L1JpNyt0n2Fd8nGBHFukCsBFKF9fmxjwl9EhcLpudyjVz7IHPrP3kthTm7WTytqRQaw5K19DazPyEqfySIXyXPK717k9%2FpkClEyg1ue11OyHMjt1l3E%2FoH8QAfJP1EM7eonSqGlijrz8vMQlp%2BIQKZHzTZkYry3IigyJjfdvQeycNqjATElSEzPgp4SPQEGyjcD4lexL%2Bk1ExpH0SnUVpduzvE0Dj1WOWmM3Eh%2BpwtkttubXTIijVgjsho95PxOKuvRGX1JFRMwEUvpyp6JZ%2BwVAS%2BHgExXL3Z5t2j60ZmVx%2Fc751hAhhBQbQHcGevG7f%2BEGteFBbSqdOyZ2uSvUCmdALal2WEUHt3RKtbjFB3zT8POhVRQUzgT5dJaDlywyPAfcY7qWXC74P5MKmljccGOqUBhrTV9mYle1FJsDFbzDisJXcjfXA%2FXdld08v%2BZop9SGBMo0n3qHZcf5pj%2BQVkh0okojMqG24Zip9O6hseExEAyEz2nrVX0uft0sl1%2FsuVB%2Bt%2BIiDDiR3xSlorP7iTwRtk98ROXSx2881YwSU%2FlvgEkcgUZQl22TNmEs8ylLVEHJDvRMLNqGnbTnnehAf8Tg4yV6G%2FzYz%2B04K2m2cTrJx0NkcawWj%2F&X-Amz-Signature=4ab6eff2a7fcff04b822aea6252d48e94ecc2b260018b33aee671689d02db91b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
