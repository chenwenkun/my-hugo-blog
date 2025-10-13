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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZYKZF6FT%2F20251013%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251013T061806Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCnrq7Cp8pAi8PhzuqjUjmvmp7WtbClaT5uymAvmV25GQIgB1vAZryManW2%2BbjO%2BkSf%2BZg7iF5Qbb9VG8iiWGeZoqEq%2FwMIPRAAGgw2Mzc0MjMxODM4MDUiDH0k7UmETKaHJFCOFyrcA7zYzP%2BF7YKqgsCBOEDSTNQJ8IZ8xniAtawRjXG48PsQEpSCPvxVPvzn4h56kdBM6hyoYZuY5Uu6Mno3B4kgrHrCdPyVOWNEnPIeA27chO2tv4yUwmd6xY2Qk8mizN%2FffJbuJJTPON%2Bmhgi%2Fvs3Y5wS1TjXv8ymhEcXQT70fk4aomGJkE%2B7uKXf5qsy3dZ7ecwSTtpyRlrRpnbtxhyDzz4wRKmdGhixSti2eQxfX7dqVRNHgOucKfRria4HN1IberGi5%2BcE5bSAt7jSE7SIlinmuF5EEFmEGTDWWXWxuT9ZdH7wjyMTdybseWeLUgkOJzYGrKKTZL%2BFfs%2FjLpwNEHHVbTWcAJvd%2BD6l3sU%2B%2F0xvz6sWbnHwaVhEc5lS53XcxytH8XiNIsFNGvn1sT5r30j1Ja6Cdxo8aztJmLGn0zPWpH2faegSua14PO7Vyi1o3pbG5qlioM0oGJLYB0dbVIJNngwh5hG2I9dpwKI%2Beyj0TDcJVvALYgeiDGnbtJfLhjr6uqgvgIabgQ5iY1AI1LLGzkBrCP%2B4AtbIIQINtOwNwzkqrOy7AX6D%2Bztwyo6tF9wL56Nv85i4aeFH3NfElj6uX%2FVCI5I227jRD6jxWO34AcSfNT4yzJdLzseeaMODtsccGOqUBn8K8QfjHU9LV%2F4DjHhcg%2BbIKhLRSVbLdGz8G%2FNZBWUed9o4cit%2FmYbzxui%2BkWPP47PbjQLN%2BRsHIARxghLkdZp6GzlcorqOBRtXscAOPg4xXHFoMx1sx4fUv2kR%2BTvTJGQ17dce7fd7C6QkH4yAE0gIBo3VCgDBydOIpPttkLwGRvjRlKfcXz29Qv2vyguOXNPHRIxhH%2Bc5Q2dQzb1nh%2FoaJ7aaY&X-Amz-Signature=0a19c26a7ce03d985592107853067ce49b0d708e15ad7f24d7988c84fc404253&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZYKZF6FT%2F20251013%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251013T061806Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCnrq7Cp8pAi8PhzuqjUjmvmp7WtbClaT5uymAvmV25GQIgB1vAZryManW2%2BbjO%2BkSf%2BZg7iF5Qbb9VG8iiWGeZoqEq%2FwMIPRAAGgw2Mzc0MjMxODM4MDUiDH0k7UmETKaHJFCOFyrcA7zYzP%2BF7YKqgsCBOEDSTNQJ8IZ8xniAtawRjXG48PsQEpSCPvxVPvzn4h56kdBM6hyoYZuY5Uu6Mno3B4kgrHrCdPyVOWNEnPIeA27chO2tv4yUwmd6xY2Qk8mizN%2FffJbuJJTPON%2Bmhgi%2Fvs3Y5wS1TjXv8ymhEcXQT70fk4aomGJkE%2B7uKXf5qsy3dZ7ecwSTtpyRlrRpnbtxhyDzz4wRKmdGhixSti2eQxfX7dqVRNHgOucKfRria4HN1IberGi5%2BcE5bSAt7jSE7SIlinmuF5EEFmEGTDWWXWxuT9ZdH7wjyMTdybseWeLUgkOJzYGrKKTZL%2BFfs%2FjLpwNEHHVbTWcAJvd%2BD6l3sU%2B%2F0xvz6sWbnHwaVhEc5lS53XcxytH8XiNIsFNGvn1sT5r30j1Ja6Cdxo8aztJmLGn0zPWpH2faegSua14PO7Vyi1o3pbG5qlioM0oGJLYB0dbVIJNngwh5hG2I9dpwKI%2Beyj0TDcJVvALYgeiDGnbtJfLhjr6uqgvgIabgQ5iY1AI1LLGzkBrCP%2B4AtbIIQINtOwNwzkqrOy7AX6D%2Bztwyo6tF9wL56Nv85i4aeFH3NfElj6uX%2FVCI5I227jRD6jxWO34AcSfNT4yzJdLzseeaMODtsccGOqUBn8K8QfjHU9LV%2F4DjHhcg%2BbIKhLRSVbLdGz8G%2FNZBWUed9o4cit%2FmYbzxui%2BkWPP47PbjQLN%2BRsHIARxghLkdZp6GzlcorqOBRtXscAOPg4xXHFoMx1sx4fUv2kR%2BTvTJGQ17dce7fd7C6QkH4yAE0gIBo3VCgDBydOIpPttkLwGRvjRlKfcXz29Qv2vyguOXNPHRIxhH%2Bc5Q2dQzb1nh%2FoaJ7aaY&X-Amz-Signature=bbecb14736eb05b7def3042cb132a25a5241221960089a17a29bfc3d37eaec81&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
