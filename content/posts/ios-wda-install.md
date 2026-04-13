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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Q2UWNYUD%2F20260413%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260413T190011Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBOTRJ0Qgya8mh1Fohepn6JF0wFVpFahdpAPXAQA0FdCAiEAus3jx7%2BMYHfA7TnQidBCnsCwUyuNZiopKY4nJL98310q%2FwMIexAAGgw2Mzc0MjMxODM4MDUiDE00BkiXGOXn7L1BYircA5L%2BrHrOJIsRSJR5OTLnyAC3dBs75HIlRFhHG9QBjk5BTw0OFM1JCisgV7xHoAZIWfZyR1%2FvUiQn%2BxYrtDDsvHJXfvyc4PcooBeCzChnso3rD3JSqN%2FmOQQ1lyP%2BHIUAnutslhngjonzvtv4s1h6gfcdQXeRI5Uw780Eplz47h6JIeJeHRwxTp0ZAeP9kfC8sPzAk%2FExS6HesVZZnUMIGraIVR24iHSF1cy9fb9I4RMw6qXNv%2BB861roMRt3laUteG%2BQaZVgLNV58x7KGMRY8hgcN378L8Lz1%2FIDtv0yLmkGYTXVEpRt55jUuDWkz409NSgOrjxwpZ3yNQVSAzns1%2BDd0RpThq4C49Dnn16dhcgxvDgbi6fNVB6k6sSluECfpURDHYquLoAe6AU73g0wIRFHmtzmJFE%2BmMtGXNV0TL2lnPBnwZYzJNz6myOBYRpvAmHtPK1LlBhGCU5Cfgbc3vTM3Pel8IGSFG94waf2CEXt6a6g950VcofsGRpxdM7OKFBHS%2F2pb%2FcOFTPoA5g349e%2FQGQJ0RR7DF4q6Wfpr3e6gHnQw2T6zGy5lCqyhYFticZ8eLZR8iZjnMhStjfiLPmKKlN%2FCU5q65V8rnrKezZ11ZIzbwF5K2pPY%2B2%2BMOjd9M4GOqUBzaz%2FZT3wNiXx8zdwhBVESmrCK%2B0Dj%2BgLtC6Feye8sHOvaEwJwhlQIt74XGkK40ugZsG3c7gKis3BtCG%2FvE3%2B9m8gVrNgldBJDMxuHfN45VzVWjUPa58Mz0UPEqz60XbKRJ2cVYTNrIf0naYYLtfDOLwovaJnCAYgOYCzdsfuliYq%2FOWWAioov013lmfaiYpCvelM%2FyWQaCJ7YYLUQ3gNKyg3PgTs&X-Amz-Signature=f585b25ccddf6db417c9f6310a2deb0ccb7485646cab5e9d4e09a86fae75e605&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Q2UWNYUD%2F20260413%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260413T190011Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBOTRJ0Qgya8mh1Fohepn6JF0wFVpFahdpAPXAQA0FdCAiEAus3jx7%2BMYHfA7TnQidBCnsCwUyuNZiopKY4nJL98310q%2FwMIexAAGgw2Mzc0MjMxODM4MDUiDE00BkiXGOXn7L1BYircA5L%2BrHrOJIsRSJR5OTLnyAC3dBs75HIlRFhHG9QBjk5BTw0OFM1JCisgV7xHoAZIWfZyR1%2FvUiQn%2BxYrtDDsvHJXfvyc4PcooBeCzChnso3rD3JSqN%2FmOQQ1lyP%2BHIUAnutslhngjonzvtv4s1h6gfcdQXeRI5Uw780Eplz47h6JIeJeHRwxTp0ZAeP9kfC8sPzAk%2FExS6HesVZZnUMIGraIVR24iHSF1cy9fb9I4RMw6qXNv%2BB861roMRt3laUteG%2BQaZVgLNV58x7KGMRY8hgcN378L8Lz1%2FIDtv0yLmkGYTXVEpRt55jUuDWkz409NSgOrjxwpZ3yNQVSAzns1%2BDd0RpThq4C49Dnn16dhcgxvDgbi6fNVB6k6sSluECfpURDHYquLoAe6AU73g0wIRFHmtzmJFE%2BmMtGXNV0TL2lnPBnwZYzJNz6myOBYRpvAmHtPK1LlBhGCU5Cfgbc3vTM3Pel8IGSFG94waf2CEXt6a6g950VcofsGRpxdM7OKFBHS%2F2pb%2FcOFTPoA5g349e%2FQGQJ0RR7DF4q6Wfpr3e6gHnQw2T6zGy5lCqyhYFticZ8eLZR8iZjnMhStjfiLPmKKlN%2FCU5q65V8rnrKezZ11ZIzbwF5K2pPY%2B2%2BMOjd9M4GOqUBzaz%2FZT3wNiXx8zdwhBVESmrCK%2B0Dj%2BgLtC6Feye8sHOvaEwJwhlQIt74XGkK40ugZsG3c7gKis3BtCG%2FvE3%2B9m8gVrNgldBJDMxuHfN45VzVWjUPa58Mz0UPEqz60XbKRJ2cVYTNrIf0naYYLtfDOLwovaJnCAYgOYCzdsfuliYq%2FOWWAioov013lmfaiYpCvelM%2FyWQaCJ7YYLUQ3gNKyg3PgTs&X-Amz-Signature=325138fc145bb1a88e83eb70dd60994a5212c81c84ac48e539cb7a79b1f2aec3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
