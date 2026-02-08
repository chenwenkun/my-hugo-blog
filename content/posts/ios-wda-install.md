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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664GZNRH5V%2F20260208%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260208T182215Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEK%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCICyS%2BZYAjWDohAneHRofbCRILKMF04Xvlv7ZLdVDCNfcAiAOMko3wTH82ARgLaA3NAWYBYBmJVKJn7gs7l7Xe1Tiair%2FAwh4EAAaDDYzNzQyMzE4MzgwNSIMDLaei9majem1e5G3KtwDLBYtsw84V8b4jUUb4i04yS0f%2FmKXbiU%2BNWurZUVmC9AuqqYvCEjHiimNzyiBfsJ4A1lb%2FqYolYDNUzSSp3rg101kDuylIn%2BucenicSUhlRZJJMxqTWfAbe2sQy4Dx3iozXX7LeQIZFHF39dkmOu57qy2UjER3IkB9CKXCRL9fPrhxcjlusdgb4R7OwsAUQS47Ai9x9udiUpSOBbGeiHY0GbYzFOeyjKdw7V1HsDSJOqFEuOHKo2NZUz%2BoHeHAgVPQdd5jNV3f7KK08FxVMeGBjj1goEKkIrC%2B1iwq3pRe5xLVZZJDKPyw%2BSn1XLOtsC09Rz8%2BglJgAaej2yZLPNowrI%2Fd9Fb9W0YSfYtufF77BZ8N4otdCX82626ceIO4Y5vlUh7qxYgBmWxGJL6PkH0GT9uH6g7%2FixeZcLO%2F2AuI%2B8TgAh6sWuOye%2F%2F%2BD6yxxIF6Xh5kO8UVivy8deNc2G2JuCJxHltc4aZJFoTDyDmLAHCTcey6oMHGiU6KKtn6BFnQDOVsLSxBy%2BXVkCwZzDlJjKjJ4xh9aW3PtfG9vnfV91tpJ%2B7qwOFGtYCqGMRfP3hz3Inl8P8wJkyXGl%2Fwfv0u7JowtQYOeBkgfoLineeER3OSvgIrcLiRnPUf10wk72izAY6pgHYtG31%2BMflFU9FOt0h27CQNN%2FzA1B5iayV%2BS0Yfm7dl4OgmU3%2FiQSGDZewExhZqemOIfV9foo4zio8zahhUWCkSvBwSn55Rm7rC0EhUbdt7QTpd1bc8IgysmXpkyi0L6syBk59paZygFyLyg73aMG8K48%2BDqTiwTRex61owIBWua0ECO7Z5kdAU4smg2nA763C6DkumeFA4rP%2F63DHZyeTBz617u1D&X-Amz-Signature=e8cf7bfac4acedeca83e0a7f7ba774e16bb67b2b5dc43ee7d9f6b2446fd21e74&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664GZNRH5V%2F20260208%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260208T182215Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEK%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCICyS%2BZYAjWDohAneHRofbCRILKMF04Xvlv7ZLdVDCNfcAiAOMko3wTH82ARgLaA3NAWYBYBmJVKJn7gs7l7Xe1Tiair%2FAwh4EAAaDDYzNzQyMzE4MzgwNSIMDLaei9majem1e5G3KtwDLBYtsw84V8b4jUUb4i04yS0f%2FmKXbiU%2BNWurZUVmC9AuqqYvCEjHiimNzyiBfsJ4A1lb%2FqYolYDNUzSSp3rg101kDuylIn%2BucenicSUhlRZJJMxqTWfAbe2sQy4Dx3iozXX7LeQIZFHF39dkmOu57qy2UjER3IkB9CKXCRL9fPrhxcjlusdgb4R7OwsAUQS47Ai9x9udiUpSOBbGeiHY0GbYzFOeyjKdw7V1HsDSJOqFEuOHKo2NZUz%2BoHeHAgVPQdd5jNV3f7KK08FxVMeGBjj1goEKkIrC%2B1iwq3pRe5xLVZZJDKPyw%2BSn1XLOtsC09Rz8%2BglJgAaej2yZLPNowrI%2Fd9Fb9W0YSfYtufF77BZ8N4otdCX82626ceIO4Y5vlUh7qxYgBmWxGJL6PkH0GT9uH6g7%2FixeZcLO%2F2AuI%2B8TgAh6sWuOye%2F%2F%2BD6yxxIF6Xh5kO8UVivy8deNc2G2JuCJxHltc4aZJFoTDyDmLAHCTcey6oMHGiU6KKtn6BFnQDOVsLSxBy%2BXVkCwZzDlJjKjJ4xh9aW3PtfG9vnfV91tpJ%2B7qwOFGtYCqGMRfP3hz3Inl8P8wJkyXGl%2Fwfv0u7JowtQYOeBkgfoLineeER3OSvgIrcLiRnPUf10wk72izAY6pgHYtG31%2BMflFU9FOt0h27CQNN%2FzA1B5iayV%2BS0Yfm7dl4OgmU3%2FiQSGDZewExhZqemOIfV9foo4zio8zahhUWCkSvBwSn55Rm7rC0EhUbdt7QTpd1bc8IgysmXpkyi0L6syBk59paZygFyLyg73aMG8K48%2BDqTiwTRex61owIBWua0ECO7Z5kdAU4smg2nA763C6DkumeFA4rP%2F63DHZyeTBz617u1D&X-Amz-Signature=4654e94f9b66e1eb5b8cd87ea7edbf739621f37418603de42cab1457c112a0f6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
