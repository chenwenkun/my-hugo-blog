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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662R7UMGI6%2F20251218%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251218T005334Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCsXGY0C2BE11unX%2F5kDHtq%2B6kQWQouDXFyEcBgVJas5gIgeSBgjnZxn%2FhZo6udfNNwZR5pc5yJ46RJSAPLx5gpshYqiAQIif%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDK5m7OrYE2oxD3PygircA7dkFy1Db8AeFxR4FUSFz%2F1lzOMtGJp%2FRD4k5K75MVwdRhkIK9p7gqoKQgnzhiLiceYaKca4uN1vAZS0loQa%2BnL2pLtX8nNzqRhLjhRHVRV%2BVrE%2FECMAXgB1srdIIbAh9oC52UTvPUIq%2FW1C10d0C5I6jFOWEaJ0rJngBdgYx625JmGCztpyRzrGwNBny%2B6BvyxEU6RXG%2BP1plgG%2BGfLJZ44Eadh7s0LapGDK2DQauw8TG%2FGQlTxA0zkewGojzQcP17ihvCoYQB6cvkioD0FdF78Ruvixn55Kj4YhJrD1%2BxV%2B5smEPD8JHsE4dpXMCG2oW8WdX9XhsdL7uoUZh9mk8z4i9Czz9VHqq%2BN95Yb2Dm%2FoAfsuDKyKhwQcnSCIJZTirmCy55hpkOr2AY8ygAnPDrO0NGyWqVAN7px60c6%2FG5y1nyyvrGcAnj1C4dPB%2BCK%2FrON0Ihp7UNOWfwmdcV7aCBNWl99ljFVnYc%2F3zaelOaCLbKAIib2S56SD4nShPTdG9yAAfFqpwdUFRdXNo0Kvs1yHPk42Bdz0a3JDvG9wfg8LIuE%2BgZkYHwGnHfyVIJ7a8vGHXxiCjvXuOFgu1S0lSdyV1%2B6xrvR62J4DSDLvYV476y9Uw1i4gGhrE%2FOMLKNjcoGOqUBkwXUisAEXSSE73jP9KVTSo1E1UkvZp08D7I%2BAGrs23IQY5YiXwiaR%2FjXMVo9hOihtUUmD87jNAD%2FQKuSi8%2FO0aq1ourHnIN%2FkdKDHkpLCfP3bYLLYK3WBaDoypdS26tE%2BH%2BWST4Qo%2B8L5%2B77Id3uQUzaRcrRMLZbCtc2qQPB9uP3vjVngyxnZF5wmwWxw7b6XMyQV0j2WbDL3uTJx3sjL6PNkAi5&X-Amz-Signature=420a0bc55248de8da18d9277cc599025e03fdea926d2b4254abee41534a48f6d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662R7UMGI6%2F20251218%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251218T005334Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCsXGY0C2BE11unX%2F5kDHtq%2B6kQWQouDXFyEcBgVJas5gIgeSBgjnZxn%2FhZo6udfNNwZR5pc5yJ46RJSAPLx5gpshYqiAQIif%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDK5m7OrYE2oxD3PygircA7dkFy1Db8AeFxR4FUSFz%2F1lzOMtGJp%2FRD4k5K75MVwdRhkIK9p7gqoKQgnzhiLiceYaKca4uN1vAZS0loQa%2BnL2pLtX8nNzqRhLjhRHVRV%2BVrE%2FECMAXgB1srdIIbAh9oC52UTvPUIq%2FW1C10d0C5I6jFOWEaJ0rJngBdgYx625JmGCztpyRzrGwNBny%2B6BvyxEU6RXG%2BP1plgG%2BGfLJZ44Eadh7s0LapGDK2DQauw8TG%2FGQlTxA0zkewGojzQcP17ihvCoYQB6cvkioD0FdF78Ruvixn55Kj4YhJrD1%2BxV%2B5smEPD8JHsE4dpXMCG2oW8WdX9XhsdL7uoUZh9mk8z4i9Czz9VHqq%2BN95Yb2Dm%2FoAfsuDKyKhwQcnSCIJZTirmCy55hpkOr2AY8ygAnPDrO0NGyWqVAN7px60c6%2FG5y1nyyvrGcAnj1C4dPB%2BCK%2FrON0Ihp7UNOWfwmdcV7aCBNWl99ljFVnYc%2F3zaelOaCLbKAIib2S56SD4nShPTdG9yAAfFqpwdUFRdXNo0Kvs1yHPk42Bdz0a3JDvG9wfg8LIuE%2BgZkYHwGnHfyVIJ7a8vGHXxiCjvXuOFgu1S0lSdyV1%2B6xrvR62J4DSDLvYV476y9Uw1i4gGhrE%2FOMLKNjcoGOqUBkwXUisAEXSSE73jP9KVTSo1E1UkvZp08D7I%2BAGrs23IQY5YiXwiaR%2FjXMVo9hOihtUUmD87jNAD%2FQKuSi8%2FO0aq1ourHnIN%2FkdKDHkpLCfP3bYLLYK3WBaDoypdS26tE%2BH%2BWST4Qo%2B8L5%2B77Id3uQUzaRcrRMLZbCtc2qQPB9uP3vjVngyxnZF5wmwWxw7b6XMyQV0j2WbDL3uTJx3sjL6PNkAi5&X-Amz-Signature=54378fbe2efbb90277e90da4b9d926f977110f2f9d4640e9ce33281f9a261298&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
