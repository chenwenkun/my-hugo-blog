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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664HZBNT2N%2F20260526%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260526T093407Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDBLcAfIIkBUqHzKPi27kjRwG6DJfKbKuuQVMSJSD%2BwzAIhAK1ML45CU5Ufrs8xsKWwu5Rh9sDw59V4%2BtejtJ1ytpxZKv8DCHkQABoMNjM3NDIzMTgzODA1Igwj67vO95%2F6w%2BVW024q3AMIPm0qMlmPXOyRDF4a2ZM7rDvHcPb8qUJIGEZM1qTFVPbJ%2FOtIBR%2BLPtNzW1JO%2BxSu5QKM2FF3KbfEZ6FL8bqXU%2BV0y9NAVLi9hNXEuqE7AnTxGqrObvWZ8mKmBT%2BFlxZcOY9pfdYLBRS7smmdDL%2FNxnVVEqoQTWIxDWnkJzJnLg0%2FQeEvclU8dgOMLZ58F0PYAw6luCb51AuYLBH1lyEZmuuSsWQSPg%2FEUuw69xUR6LMGuxVw4hAWGRAw0JijuOLd%2Bze3Yj0BvxdcvDEiSknPUQn9nrrY9GUObob1szE4CTlwEuFM44tigWe8R9NZFyhWQStYeqVy4M2rUMxF3FnLm8RCF8vhC7ewcSMINxOvEWziVcZCbB8dbfzo1ESXQb3WnSpvx339WsiPpI6UfUbooo6xqaCR2w7DJLYgTra6J0J1Nh7Cmri%2FP%2FZ0AqzN%2BcEmrqCuG9mKrVu8JoVAwW4mSk%2BoPzh09OPm7NKDev5ONqAAybcAlLk7v8j0BC6sXg1awcoEAj%2BmO5jMFgoybWzlIXuMLM5ye6kS2XsEtxOWhvxXu3yrwSu%2Fi10Js3wf0is7Yz7CeO979pSwjFPwCW1Od6dvvkxGn5Pdhdgw9yJGDcAGrzC2l0h097NAGjCZrdXQBjqkAWu56a0CTUkawz%2F0iRnPKlQbFLSq69oCSR%2F3k7bNthJljX%2FvHl9OtYoWT3vNzHDKcYFj%2FOwtLoxjhxjXnQpKRMmHFDsxrFKbMajYu3W9qQJRZaz%2BK8lsmmD5LI8K0hbqkSKyKeDhLegcBGEtyMZ%2BH8rWboReRstvPGPuqL3KHL1ywqq%2FoTHrb%2FZJq77C0a3HQ85x5ESiUqhNwNrYgoJJqw0PTeO4&X-Amz-Signature=f5db11f53f2db8e7df94b95a6e1782468d20eb19f2e4ab44703c77e0695cf0d5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664HZBNT2N%2F20260526%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260526T093407Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDBLcAfIIkBUqHzKPi27kjRwG6DJfKbKuuQVMSJSD%2BwzAIhAK1ML45CU5Ufrs8xsKWwu5Rh9sDw59V4%2BtejtJ1ytpxZKv8DCHkQABoMNjM3NDIzMTgzODA1Igwj67vO95%2F6w%2BVW024q3AMIPm0qMlmPXOyRDF4a2ZM7rDvHcPb8qUJIGEZM1qTFVPbJ%2FOtIBR%2BLPtNzW1JO%2BxSu5QKM2FF3KbfEZ6FL8bqXU%2BV0y9NAVLi9hNXEuqE7AnTxGqrObvWZ8mKmBT%2BFlxZcOY9pfdYLBRS7smmdDL%2FNxnVVEqoQTWIxDWnkJzJnLg0%2FQeEvclU8dgOMLZ58F0PYAw6luCb51AuYLBH1lyEZmuuSsWQSPg%2FEUuw69xUR6LMGuxVw4hAWGRAw0JijuOLd%2Bze3Yj0BvxdcvDEiSknPUQn9nrrY9GUObob1szE4CTlwEuFM44tigWe8R9NZFyhWQStYeqVy4M2rUMxF3FnLm8RCF8vhC7ewcSMINxOvEWziVcZCbB8dbfzo1ESXQb3WnSpvx339WsiPpI6UfUbooo6xqaCR2w7DJLYgTra6J0J1Nh7Cmri%2FP%2FZ0AqzN%2BcEmrqCuG9mKrVu8JoVAwW4mSk%2BoPzh09OPm7NKDev5ONqAAybcAlLk7v8j0BC6sXg1awcoEAj%2BmO5jMFgoybWzlIXuMLM5ye6kS2XsEtxOWhvxXu3yrwSu%2Fi10Js3wf0is7Yz7CeO979pSwjFPwCW1Od6dvvkxGn5Pdhdgw9yJGDcAGrzC2l0h097NAGjCZrdXQBjqkAWu56a0CTUkawz%2F0iRnPKlQbFLSq69oCSR%2F3k7bNthJljX%2FvHl9OtYoWT3vNzHDKcYFj%2FOwtLoxjhxjXnQpKRMmHFDsxrFKbMajYu3W9qQJRZaz%2BK8lsmmD5LI8K0hbqkSKyKeDhLegcBGEtyMZ%2BH8rWboReRstvPGPuqL3KHL1ywqq%2FoTHrb%2FZJq77C0a3HQ85x5ESiUqhNwNrYgoJJqw0PTeO4&X-Amz-Signature=a16d93a44758b40c6de82cbda37ad7aac19df21f8739039332db341292ddb5b6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
