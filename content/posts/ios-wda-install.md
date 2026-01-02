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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XISVVTKL%2F20260102%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260102T005817Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECQaCXVzLXdlc3QtMiJHMEUCIQDf3tQUI4PN8pAByGe1vegejYf1tUVmi%2BdTx2DBmZHJygIgbtCuA5nZIbtqsHHC72GKceWJnleIU0YKLXEiSkTD44AqiAQI7f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDEIfJhCmBD6aCFutHyrcA1MWg6T55F%2BZkjdfudZj%2F2eQ5PGsqYNMfOhOquLdkqdFBSPNaxjfsNI%2FC7hqI8hxL2irCgqhE1eDwdqbdQKjIixZ169mBMtSpsljO%2B7smCNAyOxs6WvD0De8QrpLPxNDyjui3hq%2BF1f7wxO42yynkX2iMyf%2BP7x5Hzr0DCRqv1j%2FjuJJvbdLpIbG8X6LadBi3KaekUvxV9jtJrf%2BI4itnLT8faIlII4jWlPjBOLV7Fzz6JDl0dsP0QHOy2k3tfSd4qfM26mNt0ujP7zXqwlZ5XxQw1521jnnfbrplTk0ixYd4BAOAU1SGmZUHroXFfXyry1bki82wdHYEqJUwz4b8Z%2BIZZrF4hTUR6HniPnu23LnJuI94DeR2mSNmOuS3U2fLmUrRjHKxk2x8fiCFK8VcgSnB8ez%2BIjv9pUWBUbyoWsfSlRvfTNWp%2BF0RSkTSp%2B2IYqLJJ8lJkWcIW2b%2Fv3SoezSwRoBOvvXaAoJUd59PQmqx4qtRzTw3%2Bg9F4MKpD9d0sHDc21ixXkIDeCGHRfLXlGjHdIYDG%2Fn0WMMsZgCGWu01QF2pTWy1WCAagyhMHGP%2Bu2zJIRMVBq8Al8QBn3eC%2B6RvCcidfq%2B8iqGMUoRPO2b7iuylkt7QzsLv4g0MPSX28oGOqUBqwCIa%2BHaR4iDe1uLwIzTdmTeB9mJF7i%2BD6xf13lr1NasnqWBDWNf4FTZNw2rPQWmRjooglBmiHtAYMNwuZp6XALPZtxrhfbvN%2BTGDr0PgmT8UeA%2FwlWyPLNaDL0sDn6exOE8UedpduxpnW2yTalEUf5pGwHnNZFpJ01iHpdufwIxGcFLQE5QGSyfNyMm5gKu7xtveRRKPQqjHDZO1KNAyhURUlBM&X-Amz-Signature=074ef0e00e81ca4fd5036b47112cefdbe5ec368b6cd48765b2d3e0d931d31a97&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XISVVTKL%2F20260102%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260102T005817Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECQaCXVzLXdlc3QtMiJHMEUCIQDf3tQUI4PN8pAByGe1vegejYf1tUVmi%2BdTx2DBmZHJygIgbtCuA5nZIbtqsHHC72GKceWJnleIU0YKLXEiSkTD44AqiAQI7f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDEIfJhCmBD6aCFutHyrcA1MWg6T55F%2BZkjdfudZj%2F2eQ5PGsqYNMfOhOquLdkqdFBSPNaxjfsNI%2FC7hqI8hxL2irCgqhE1eDwdqbdQKjIixZ169mBMtSpsljO%2B7smCNAyOxs6WvD0De8QrpLPxNDyjui3hq%2BF1f7wxO42yynkX2iMyf%2BP7x5Hzr0DCRqv1j%2FjuJJvbdLpIbG8X6LadBi3KaekUvxV9jtJrf%2BI4itnLT8faIlII4jWlPjBOLV7Fzz6JDl0dsP0QHOy2k3tfSd4qfM26mNt0ujP7zXqwlZ5XxQw1521jnnfbrplTk0ixYd4BAOAU1SGmZUHroXFfXyry1bki82wdHYEqJUwz4b8Z%2BIZZrF4hTUR6HniPnu23LnJuI94DeR2mSNmOuS3U2fLmUrRjHKxk2x8fiCFK8VcgSnB8ez%2BIjv9pUWBUbyoWsfSlRvfTNWp%2BF0RSkTSp%2B2IYqLJJ8lJkWcIW2b%2Fv3SoezSwRoBOvvXaAoJUd59PQmqx4qtRzTw3%2Bg9F4MKpD9d0sHDc21ixXkIDeCGHRfLXlGjHdIYDG%2Fn0WMMsZgCGWu01QF2pTWy1WCAagyhMHGP%2Bu2zJIRMVBq8Al8QBn3eC%2B6RvCcidfq%2B8iqGMUoRPO2b7iuylkt7QzsLv4g0MPSX28oGOqUBqwCIa%2BHaR4iDe1uLwIzTdmTeB9mJF7i%2BD6xf13lr1NasnqWBDWNf4FTZNw2rPQWmRjooglBmiHtAYMNwuZp6XALPZtxrhfbvN%2BTGDr0PgmT8UeA%2FwlWyPLNaDL0sDn6exOE8UedpduxpnW2yTalEUf5pGwHnNZFpJ01iHpdufwIxGcFLQE5QGSyfNyMm5gKu7xtveRRKPQqjHDZO1KNAyhURUlBM&X-Amz-Signature=888a580503684fd4b1275a096e48f06060425a4333303370f9529ee0830d4515&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
