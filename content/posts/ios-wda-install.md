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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RKTQXN4P%2F20260430%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260430T190448Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEoaCXVzLXdlc3QtMiJHMEUCIA54RBVNaCLo4xy4z0bVFdFPu3Evk6WeNNTp%2FCd2NbkqAiEA9AxOiqcRco%2FbFblH1eFH4n4jbk00V4i1RwgSwAfz9swq%2FwMIExAAGgw2Mzc0MjMxODM4MDUiDE5DcHx6WoYD4oNHUyrcAwNjlGYmXL7zlZ5BINv0THArYUYpnd73vCmoVQHYS0bCVbiodvq4rZRp0EksyuYIlG6XAJtXqjgIAVR8SIDramuJx91wv7SG1ic8xAb4NJ7Js%2B4HMmSoud%2BzZzm7kEBY0hTTZhszc0rir9RhehKMBe6JUrqAC20G8vuAWQbu0n%2FaaT2ZXG2a%2FUROtXwnroy4T%2FaqmUdwfKv192Ed%2FrvAMPitNa8dsvLTtm9vikDAl9%2Ba3EByI%2FW0E1iYvYbEfHnFGMv%2F3Z7gAXuS2CuAcHQZ5R%2B2lvDpZE9ch7JiHLS2DRYkZsmRsebb9t3KMOtEgTuEP4w8wjuljGKLpRa1CfzusC6Iq3XpO%2BzTcWqthNWEi22OTegCQVd5Jcb3deYqSt7o%2BwiWPqxO4vrPQN8vXJNBX9JQjfFWbkZ3z4FAl3EUueot68gvF%2By5w%2FchlmQB5ikqaq%2FmTwkd5T7S%2B9w9x65ejIv%2FcaOC4KX23YMCeRLDfkp56cbqTBkBSDiGV3WGqOT%2Bf6IGYkBwjhVxvozaeNGsASEXYwPyqKKPj3ZE2vRnAjxHa6cDoW8ykXKxVXUzeLxTk%2Fzfoa%2BoNUkO55cWbY4X18PRji%2BWkNujaiYcKrobTVN93YIKWFiOB5hMCT4NMJG3zs8GOqUBv6Jl03Pmr0g0Sf6KFe8hzRJpwvuTRzFKLtQ5JqBBMBKUfUuxtNog6HvpoV9mfrTX1a0VGBWUTun%2BUga%2Bq0bfsVDLBOIdeyOVXVXGdRDeZnbkMDDvfrvrCnFgY50kjDsuUIrRmolDP9z31H95nvNCHwu1J7XpqTDnFDqPViXNLmrKkiXr2c0rDkFyEKZbQ1agbvtaK4ZbvmDFv2euPnc9onlzBHlX&X-Amz-Signature=4d7f0d22b23c42818583fc6304c42c195a79391259165cb0c8c53ed68c0b2305&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RKTQXN4P%2F20260430%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260430T190448Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEoaCXVzLXdlc3QtMiJHMEUCIA54RBVNaCLo4xy4z0bVFdFPu3Evk6WeNNTp%2FCd2NbkqAiEA9AxOiqcRco%2FbFblH1eFH4n4jbk00V4i1RwgSwAfz9swq%2FwMIExAAGgw2Mzc0MjMxODM4MDUiDE5DcHx6WoYD4oNHUyrcAwNjlGYmXL7zlZ5BINv0THArYUYpnd73vCmoVQHYS0bCVbiodvq4rZRp0EksyuYIlG6XAJtXqjgIAVR8SIDramuJx91wv7SG1ic8xAb4NJ7Js%2B4HMmSoud%2BzZzm7kEBY0hTTZhszc0rir9RhehKMBe6JUrqAC20G8vuAWQbu0n%2FaaT2ZXG2a%2FUROtXwnroy4T%2FaqmUdwfKv192Ed%2FrvAMPitNa8dsvLTtm9vikDAl9%2Ba3EByI%2FW0E1iYvYbEfHnFGMv%2F3Z7gAXuS2CuAcHQZ5R%2B2lvDpZE9ch7JiHLS2DRYkZsmRsebb9t3KMOtEgTuEP4w8wjuljGKLpRa1CfzusC6Iq3XpO%2BzTcWqthNWEi22OTegCQVd5Jcb3deYqSt7o%2BwiWPqxO4vrPQN8vXJNBX9JQjfFWbkZ3z4FAl3EUueot68gvF%2By5w%2FchlmQB5ikqaq%2FmTwkd5T7S%2B9w9x65ejIv%2FcaOC4KX23YMCeRLDfkp56cbqTBkBSDiGV3WGqOT%2Bf6IGYkBwjhVxvozaeNGsASEXYwPyqKKPj3ZE2vRnAjxHa6cDoW8ykXKxVXUzeLxTk%2Fzfoa%2BoNUkO55cWbY4X18PRji%2BWkNujaiYcKrobTVN93YIKWFiOB5hMCT4NMJG3zs8GOqUBv6Jl03Pmr0g0Sf6KFe8hzRJpwvuTRzFKLtQ5JqBBMBKUfUuxtNog6HvpoV9mfrTX1a0VGBWUTun%2BUga%2Bq0bfsVDLBOIdeyOVXVXGdRDeZnbkMDDvfrvrCnFgY50kjDsuUIrRmolDP9z31H95nvNCHwu1J7XpqTDnFDqPViXNLmrKkiXr2c0rDkFyEKZbQ1agbvtaK4ZbvmDFv2euPnc9onlzBHlX&X-Amz-Signature=aa1695247bde6d868305df6cb8102db41f9ac01754f28c132fafa798fed2f04f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
