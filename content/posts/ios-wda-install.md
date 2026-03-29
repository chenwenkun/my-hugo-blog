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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WBOWV5EI%2F20260329%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260329T123138Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEQaCXVzLXdlc3QtMiJHMEUCIQDV%2BJ4t4h2ISfXSbOkIgyljQac5E6nta3VsqAQQfyc4DgIgDGSIirtwLfKD0M%2Fr1i5O7nxy3tzOvPBA0DwGTJCBdaEq%2FwMIDRAAGgw2Mzc0MjMxODM4MDUiDOZsy8%2BBJzSn2%2BahYCrcAxGRHBBfY%2BRmcnnpFP%2F4rXSAe4pmMbqxeTvY5c46emndXHN51Dlsbl2ROuuZpxWGR%2BS3LDn7qTPf27LIzAVm8r2M45TSF242ZWPnLFezIM8OHvXNnJ3SQ0lLnQtLoKc9eG4%2FN%2FeA1GpaJOIqvAzbJ0HPAoVdZGI3mJ%2Bn8fVU4tnftArH3o4%2BpF%2F%2B1K%2FwQIaQ9ZiPxNL5o%2FJfO7jXDyFqlCLOSXtdylyk5xVEhBuOe7Op1QS89E7OpaGExNrKytaPbMhcTdmqcqxHZyGRn71ec%2BGhVHdKmZafZwqZosUxSNk43gK2sKAXHKBGdvTYwjD4I%2FXN3NyP8wRaAfUCDrkLcpLsN9V8xseTZqK7SVChvEMdaepp8iuIDfaMdCuLlYG5DJemvTfJr%2BslPyFl2r27BRlxJVQxNjUD7cnVeHtUpO9%2BdFYihYSpDZpEV4oPRa2hGtPXSUgxz%2FhcSC96TlrJn38ERMJHIJ4YRQeihHe4pojUxCqVHcyc6l369ok1lT7YUcE4WzGqJRVkSAMXzxcKQu94unOg9fFufbpGTlOMdnr8Du3VW%2BgQsegmkSqhxOP3urJe7oWi4bYtbYCq1KSUIwD9TZPC8kH0aLWMVMYYtPOQjm0yOy7gmtE%2FETX%2FMLqppM4GOqUBc0SESvASzMq4f1Rs51SsHUmkKKGjH5Nk1CWGAZl6rYFBfcAoj72S2bfOMbWgCq5Bu12TZth02GDagrxnAlSf0ZkYYkLvPifw6BB5fqX3e9hFvNXpIoDSJr%2BmNnXBfGfMU%2FCctn80%2BijeQpGrywANjibX%2BsAQlCYSKmfhTRZmd7Wgp9mLuLmoRU5qTFmNKooDZiTUjoRvAKuE2r7Zeo7i%2FbNlZZ7o&X-Amz-Signature=854fd37dfa03bf2ed905c6736b7e826935d32c6f5814564a76dbeaf2a35b2db4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WBOWV5EI%2F20260329%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260329T123138Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEQaCXVzLXdlc3QtMiJHMEUCIQDV%2BJ4t4h2ISfXSbOkIgyljQac5E6nta3VsqAQQfyc4DgIgDGSIirtwLfKD0M%2Fr1i5O7nxy3tzOvPBA0DwGTJCBdaEq%2FwMIDRAAGgw2Mzc0MjMxODM4MDUiDOZsy8%2BBJzSn2%2BahYCrcAxGRHBBfY%2BRmcnnpFP%2F4rXSAe4pmMbqxeTvY5c46emndXHN51Dlsbl2ROuuZpxWGR%2BS3LDn7qTPf27LIzAVm8r2M45TSF242ZWPnLFezIM8OHvXNnJ3SQ0lLnQtLoKc9eG4%2FN%2FeA1GpaJOIqvAzbJ0HPAoVdZGI3mJ%2Bn8fVU4tnftArH3o4%2BpF%2F%2B1K%2FwQIaQ9ZiPxNL5o%2FJfO7jXDyFqlCLOSXtdylyk5xVEhBuOe7Op1QS89E7OpaGExNrKytaPbMhcTdmqcqxHZyGRn71ec%2BGhVHdKmZafZwqZosUxSNk43gK2sKAXHKBGdvTYwjD4I%2FXN3NyP8wRaAfUCDrkLcpLsN9V8xseTZqK7SVChvEMdaepp8iuIDfaMdCuLlYG5DJemvTfJr%2BslPyFl2r27BRlxJVQxNjUD7cnVeHtUpO9%2BdFYihYSpDZpEV4oPRa2hGtPXSUgxz%2FhcSC96TlrJn38ERMJHIJ4YRQeihHe4pojUxCqVHcyc6l369ok1lT7YUcE4WzGqJRVkSAMXzxcKQu94unOg9fFufbpGTlOMdnr8Du3VW%2BgQsegmkSqhxOP3urJe7oWi4bYtbYCq1KSUIwD9TZPC8kH0aLWMVMYYtPOQjm0yOy7gmtE%2FETX%2FMLqppM4GOqUBc0SESvASzMq4f1Rs51SsHUmkKKGjH5Nk1CWGAZl6rYFBfcAoj72S2bfOMbWgCq5Bu12TZth02GDagrxnAlSf0ZkYYkLvPifw6BB5fqX3e9hFvNXpIoDSJr%2BmNnXBfGfMU%2FCctn80%2BijeQpGrywANjibX%2BsAQlCYSKmfhTRZmd7Wgp9mLuLmoRU5qTFmNKooDZiTUjoRvAKuE2r7Zeo7i%2FbNlZZ7o&X-Amz-Signature=614f417c06d35eb4ffa9615e88800393d2665a6668d5051c54f564cde27a98cc&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
