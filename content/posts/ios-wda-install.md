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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UE5DDPNI%2F20251119%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251119T005339Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAgaCXVzLXdlc3QtMiJIMEYCIQDR04kvrcr9OFvlBZZ0JGE9UerNyDzfqNqjfZoR%2Fk5ZbAIhAM%2FbwZGsW03dDr2x%2FqnoomieA1FsK%2F%2FLaIwejr1%2FhwiyKogECNH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwDaDjSbdDq%2BT1pTXUq3AOitQzAe8jjs2I6DUZW1kGR2kRTbKFJ37hS9Q2CRQAbqlmlIVH0gTk1lemI4zH5%2FbAvPUcfTlWYn5QzmdvVtPATpCqaWkgx61opynqqnam95YgbPcO4uGHlglThtwUOZVi6ejKrAz9J%2FWe8XjRHJNMwbw%2FIKfkIix2nmbeIatfvO4Th0mTkEIKV4NGGw%2F%2Bja1RuRvVr%2BUdr9TPd8hIkT3bbEa6Cc5hHFh%2BxY8%2BNFcPggT8ZH0MSx8FaZucPV6q%2FFXB1FDY9WUpyCtS79tB31uiq1mHfVch1BEBIRYv%2Bk%2FzRKJD0CPJ7VcrHT%2FeERBOnaWhPXq4IgiwqV6yTbCxOzY5G%2Fzgit336x7Q6yk5XJKyF07qaelGyO0aBfPS6hTsAThnMC%2BSZhfL9GzCnColrkqT1%2F6%2B543Ftqb36VfprLNFGYFJ8gjqgntKIqu9GBw7tewf7wrVWOGwGoz%2F1HR1dCclx9uKgh08kSylb%2BiCLX%2Bz50V%2FKXpX1x0EPVMARNpILzKzBurK%2BfajmxS6bFSgJdmg9l%2FR%2FTxp%2Blf7vDWy%2BctOWsYxBrH0zry5QW8vO3UqdRgqTBwANtl8zCnrvCwAi2zXs8JRs3CcbjEvHS2IgwGIh1B%2FNrk%2F%2Bg3XrnbEAeDDGl%2FTIBjqkAWus%2FA0IZHUtIFo20ZYp3zFG%2Fbqcgf4pX1FXtNg2id7jgL%2B5uZncwYFTGrdPJ21AUezVhhNcFxU9FXubc5cDC21EAt5SfZxq%2FBcvEaKt1fvkeRcALhX%2Fj4Va2HMKe%2BE6FYxAe0RO5strauEQ0uCVSWsQD5ob1j6%2F0sb7VyD8ejeImvCsGW9ViKGwkqEY3YnvR1iNa0Eob%2FxpYwjwxB4NYboijlPd&X-Amz-Signature=1a88a13d3f4ab0bee2e7ee1a26c1bee5d2dd79f1f644a554b6faff42385739c3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UE5DDPNI%2F20251119%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251119T005339Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAgaCXVzLXdlc3QtMiJIMEYCIQDR04kvrcr9OFvlBZZ0JGE9UerNyDzfqNqjfZoR%2Fk5ZbAIhAM%2FbwZGsW03dDr2x%2FqnoomieA1FsK%2F%2FLaIwejr1%2FhwiyKogECNH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwDaDjSbdDq%2BT1pTXUq3AOitQzAe8jjs2I6DUZW1kGR2kRTbKFJ37hS9Q2CRQAbqlmlIVH0gTk1lemI4zH5%2FbAvPUcfTlWYn5QzmdvVtPATpCqaWkgx61opynqqnam95YgbPcO4uGHlglThtwUOZVi6ejKrAz9J%2FWe8XjRHJNMwbw%2FIKfkIix2nmbeIatfvO4Th0mTkEIKV4NGGw%2F%2Bja1RuRvVr%2BUdr9TPd8hIkT3bbEa6Cc5hHFh%2BxY8%2BNFcPggT8ZH0MSx8FaZucPV6q%2FFXB1FDY9WUpyCtS79tB31uiq1mHfVch1BEBIRYv%2Bk%2FzRKJD0CPJ7VcrHT%2FeERBOnaWhPXq4IgiwqV6yTbCxOzY5G%2Fzgit336x7Q6yk5XJKyF07qaelGyO0aBfPS6hTsAThnMC%2BSZhfL9GzCnColrkqT1%2F6%2B543Ftqb36VfprLNFGYFJ8gjqgntKIqu9GBw7tewf7wrVWOGwGoz%2F1HR1dCclx9uKgh08kSylb%2BiCLX%2Bz50V%2FKXpX1x0EPVMARNpILzKzBurK%2BfajmxS6bFSgJdmg9l%2FR%2FTxp%2Blf7vDWy%2BctOWsYxBrH0zry5QW8vO3UqdRgqTBwANtl8zCnrvCwAi2zXs8JRs3CcbjEvHS2IgwGIh1B%2FNrk%2F%2Bg3XrnbEAeDDGl%2FTIBjqkAWus%2FA0IZHUtIFo20ZYp3zFG%2Fbqcgf4pX1FXtNg2id7jgL%2B5uZncwYFTGrdPJ21AUezVhhNcFxU9FXubc5cDC21EAt5SfZxq%2FBcvEaKt1fvkeRcALhX%2Fj4Va2HMKe%2BE6FYxAe0RO5strauEQ0uCVSWsQD5ob1j6%2F0sb7VyD8ejeImvCsGW9ViKGwkqEY3YnvR1iNa0Eob%2FxpYwjwxB4NYboijlPd&X-Amz-Signature=60eb091f27fbc98a2dec41c87a2f5a44e97ec93cb6b8e0eaeb0bab6d792ba17b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
