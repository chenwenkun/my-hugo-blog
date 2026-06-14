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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QWYATRRX%2F20260614%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260614T023637Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHIaCXVzLXdlc3QtMiJGMEQCIDC1Kd2A4HiZ%2FlRPi8fI%2FApnLdjeVgB5bu3RjzCZYdqJAiATVmLrlr0CSItQAcVTdjqFipi3BoIrRQw9HO3HLC7KASr%2FAwg7EAAaDDYzNzQyMzE4MzgwNSIMo7x%2FwXVPWNvEQT28KtwDw9r1IPKYwHA9sxlyhYhkzW1eW%2BnKDF4WtoblIAwj7K3mPD2H4ohwsaNMYr9Ozbm3LdFzqimt1xcIdBb0CYiAAcGbP2vIjJ8WP1rWJBKMc2OCEtjxPcff%2BVx38%2FWCrAwTOeRbWUNY7Uyi8wFGFabxzeCrQw%2BDHqiWrw9b%2BR48BlIgfSte112PBx83885nuOpQlekB%2FaK%2BdIWl1KkdJaWsdtSklk6kNls%2FHg2fIX%2FRbL3CjMuOHdeiXap7duzRLSqAhvPyMhgGCmBV7xWo4dF6U4qoiF1pYn9PyhrPlffb9Z5W7%2Ba%2B552LPB8crajPfkuROepm%2BBBI0nZ68xXPhkgIh4a0zfd%2BCPHN1QbUKDkz%2BvtS93aIptZV2XxfbRY7cZkcaSjBsxcDUM76a%2FLByXCzOnrf1SCvMpRw5wMfwcGrfcsj9rj8xwrVty94OtcRObgZ4OC9e0WLWVIe%2FU2JDseiggP6PwsCrGi1ju6PDY2zaFDoT0C75kfLOwSMniCAXWp%2FN6aiaL5bx3jk52i8VjYLakMnCaX3%2B%2F4ZSdQybUbs%2FCnQ62wtI%2BSm5rSceHbZuAuroW8E%2BDqPhZIqzuftSyshN%2BaDODcwKHFq0wjeN3B2QJNCI3dqdqoIgt8SxFIwqJy40QY6pgHJM0h4g8vTAuXx5vPjJgnmOuDmhH898zOKDqJnuuyhKNuj4FfrBHVgPT2%2FdNCzkiCxX6so%2B38z%2FI8Q9I%2BdpDeXaigoQH4pD1xEheE%2BabrUs2qGqz7lI4UNF2Sei1pd186sNpNmMsHjnPmcOrhDfVHiuwbwmpVahv%2FueYvIPd6A2IMPdCMeXrDwQZRO5jMG3NeUxRtIxXmE1rY2odXgxzf4SvBHorE3&X-Amz-Signature=c0ea48f7a9b86a5e56af8a789aea52c611514eb67770b5162e18c66a72a03c11&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QWYATRRX%2F20260614%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260614T023637Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHIaCXVzLXdlc3QtMiJGMEQCIDC1Kd2A4HiZ%2FlRPi8fI%2FApnLdjeVgB5bu3RjzCZYdqJAiATVmLrlr0CSItQAcVTdjqFipi3BoIrRQw9HO3HLC7KASr%2FAwg7EAAaDDYzNzQyMzE4MzgwNSIMo7x%2FwXVPWNvEQT28KtwDw9r1IPKYwHA9sxlyhYhkzW1eW%2BnKDF4WtoblIAwj7K3mPD2H4ohwsaNMYr9Ozbm3LdFzqimt1xcIdBb0CYiAAcGbP2vIjJ8WP1rWJBKMc2OCEtjxPcff%2BVx38%2FWCrAwTOeRbWUNY7Uyi8wFGFabxzeCrQw%2BDHqiWrw9b%2BR48BlIgfSte112PBx83885nuOpQlekB%2FaK%2BdIWl1KkdJaWsdtSklk6kNls%2FHg2fIX%2FRbL3CjMuOHdeiXap7duzRLSqAhvPyMhgGCmBV7xWo4dF6U4qoiF1pYn9PyhrPlffb9Z5W7%2Ba%2B552LPB8crajPfkuROepm%2BBBI0nZ68xXPhkgIh4a0zfd%2BCPHN1QbUKDkz%2BvtS93aIptZV2XxfbRY7cZkcaSjBsxcDUM76a%2FLByXCzOnrf1SCvMpRw5wMfwcGrfcsj9rj8xwrVty94OtcRObgZ4OC9e0WLWVIe%2FU2JDseiggP6PwsCrGi1ju6PDY2zaFDoT0C75kfLOwSMniCAXWp%2FN6aiaL5bx3jk52i8VjYLakMnCaX3%2B%2F4ZSdQybUbs%2FCnQ62wtI%2BSm5rSceHbZuAuroW8E%2BDqPhZIqzuftSyshN%2BaDODcwKHFq0wjeN3B2QJNCI3dqdqoIgt8SxFIwqJy40QY6pgHJM0h4g8vTAuXx5vPjJgnmOuDmhH898zOKDqJnuuyhKNuj4FfrBHVgPT2%2FdNCzkiCxX6so%2B38z%2FI8Q9I%2BdpDeXaigoQH4pD1xEheE%2BabrUs2qGqz7lI4UNF2Sei1pd186sNpNmMsHjnPmcOrhDfVHiuwbwmpVahv%2FueYvIPd6A2IMPdCMeXrDwQZRO5jMG3NeUxRtIxXmE1rY2odXgxzf4SvBHorE3&X-Amz-Signature=7837755149e8f18c87501fd3ab731d018103fecc9624b5710ae28e64056e3054&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
