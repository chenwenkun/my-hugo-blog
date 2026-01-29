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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U6BERFQZ%2F20260129%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260129T063410Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCAGBndhau4KGFVr4HB%2BZWem1KMdowF6gpnxyVg0SzVXAIhAK9vAVgNs1nrgEX3TWpEolLc424AttzJiCHs4%2BOq6V8GKv8DCH8QABoMNjM3NDIzMTgzODA1Igy0V37JDc6yQWIJw6Uq3AOPeJkxhmHCdlG1y8zA51T44fS2MPNKTxJN9l8EgQLn4r%2BzG8p%2Fmzi0nhIBOIDw6RnZfHpOPLbbZY268j88Vm1M3zjZCdz1sghs441aLMFej3zB2dnJHsfrOcpXoKZnK0klpmooWr7UoQQg9SMuv8YbODxpQtfg4snRwjpHVVFYk3irAYewhhc377hb%2BDK1LTxL0%2BkdfRPFywEoRCH2A7hkmP1dLtPETdbuYFYq83qnSoQnTZ0UKNkYinznBL6Gjg1Fnm%2FE9Jz%2FmWmf%2FR8%2Fl%2BX5l8S0J2UfzHcBtaefFZM%2BuskD3TrVjy2DefGc3avSB%2B8l%2B7syL%2BbnyuRwa%2FshGzqPdaV%2Fbaj9%2BVIK7F8TVibQtro0e1h46NZ9kYjLk9DnrA8B95grtufG8AQHwt55dv13t1PZw5f56SFasg9EiDdt9jUYDEIcOaoBbNnPg8sq5lFYsOpnzdoi%2BWd3pDFCgfrnu72kyPLUTvhzxww%2FYsmcR0BP%2FRq%2FAnzLYjY%2F3vaChWCkzIIWUHHnRFtnP4aFH7FG61XdUC6DEpLAStBpH8gHjPn1X78Wf9Yb%2FaCJ886Rq44sepHFUsAIlyVaUyeqY2Zz7wMS02HcnxzRn%2B7H%2B176Jheja4vP%2B%2FdbRl7bqDDb4OvLBjqkAWHUrHGugeiPn%2BK1z6lSkVOlpqCNZmfdRzu7X26eYvj9COUEkvoMGS%2FIWGanbYkrb6F4s4grS5Wdc2aiDWArrmQuUnc7QYUbPRh%2F%2BVEJobTJMoXjCMYMuqKaQx7Cru%2FJUr6ybLYyxzX8c%2FL4t4yggHx1UmMmO%2FbtSBPulm5vnIG%2Fm7yanayTYvAUwpSz3CqlcBkiy0pcMnvLIy8s6nnyIpdeZkx8&X-Amz-Signature=94fc7e96ad1c31ac06496da188ee7f35455d3f065fd45d0e57548572f5583896&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U6BERFQZ%2F20260129%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260129T063410Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCAGBndhau4KGFVr4HB%2BZWem1KMdowF6gpnxyVg0SzVXAIhAK9vAVgNs1nrgEX3TWpEolLc424AttzJiCHs4%2BOq6V8GKv8DCH8QABoMNjM3NDIzMTgzODA1Igy0V37JDc6yQWIJw6Uq3AOPeJkxhmHCdlG1y8zA51T44fS2MPNKTxJN9l8EgQLn4r%2BzG8p%2Fmzi0nhIBOIDw6RnZfHpOPLbbZY268j88Vm1M3zjZCdz1sghs441aLMFej3zB2dnJHsfrOcpXoKZnK0klpmooWr7UoQQg9SMuv8YbODxpQtfg4snRwjpHVVFYk3irAYewhhc377hb%2BDK1LTxL0%2BkdfRPFywEoRCH2A7hkmP1dLtPETdbuYFYq83qnSoQnTZ0UKNkYinznBL6Gjg1Fnm%2FE9Jz%2FmWmf%2FR8%2Fl%2BX5l8S0J2UfzHcBtaefFZM%2BuskD3TrVjy2DefGc3avSB%2B8l%2B7syL%2BbnyuRwa%2FshGzqPdaV%2Fbaj9%2BVIK7F8TVibQtro0e1h46NZ9kYjLk9DnrA8B95grtufG8AQHwt55dv13t1PZw5f56SFasg9EiDdt9jUYDEIcOaoBbNnPg8sq5lFYsOpnzdoi%2BWd3pDFCgfrnu72kyPLUTvhzxww%2FYsmcR0BP%2FRq%2FAnzLYjY%2F3vaChWCkzIIWUHHnRFtnP4aFH7FG61XdUC6DEpLAStBpH8gHjPn1X78Wf9Yb%2FaCJ886Rq44sepHFUsAIlyVaUyeqY2Zz7wMS02HcnxzRn%2B7H%2B176Jheja4vP%2B%2FdbRl7bqDDb4OvLBjqkAWHUrHGugeiPn%2BK1z6lSkVOlpqCNZmfdRzu7X26eYvj9COUEkvoMGS%2FIWGanbYkrb6F4s4grS5Wdc2aiDWArrmQuUnc7QYUbPRh%2F%2BVEJobTJMoXjCMYMuqKaQx7Cru%2FJUr6ybLYyxzX8c%2FL4t4yggHx1UmMmO%2FbtSBPulm5vnIG%2Fm7yanayTYvAUwpSz3CqlcBkiy0pcMnvLIy8s6nnyIpdeZkx8&X-Amz-Signature=3b8ac2cdcc67cc6e850c5ffe0bbc7184d6d781c900c6ad9664931718ff3be9a1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
