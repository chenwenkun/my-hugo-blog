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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466347CR2AB%2F20251210%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251210T005628Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIF7X8r1DZ8v1UI7fmmfKYx7fzjsMn4F4P1sdp%2Fi%2F5afHAiBN10qMqAUfTvgbl%2Bf%2FIutZ0Far86pWUE%2Bbsa4iF%2BpdSyqIBAjI%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMdGA1KX6CQpakLx6jKtwD3KQFQDceaGoIRPOJZL6hZiP2AZfP6k59%2FldKTF0DWFggBYPAqRN9e9KLBu4ppgiANFS9rlzl6quVfHWWvDPDg8YLJk8sBRFr7Qb%2FcRKhYTRpPTVVuaSG7yoRV3%2Fo2K83Dha59NSIzChBSupyd92OgQlkx1p9AEimVcy%2BcXRcNbw4shSk3knH7FgY0u1WZaUJSq69K67C7LxMqHQIn2Cw2ZAQMuB6O2WYNJWkCCM70U5hP%2BR2kWHZzkOfpkfQHMTW%2F%2FpWp9wywqIFOPHuxo7yDiFn1pZFdvI1a3JK5EOyP9JLU3WOjuKzHlpjqZ8eikk29VkDJfzMVqhTaBDEl25qOcnXAaZc935n1KwYmKDfqjNYUoLldo%2Fc6wBSmZiIrr6azrzVuA96GshUAU78f3C9IHSUry6nQMviO%2FSl2a77Lbj8V1RYI4tcDfLnlP8s8%2Bye6ytT0C7w17N2yqpHXFrtf8u4dZcaE0wY1EGq%2FRsqARBx2NzrTSDptKy17B8PCH35yVwD%2BN3Vpnkyj%2BZIloiKv8xBhJwpwae0SyueOmskZzRqOqZFFhQKqmfKCSBbWDDDLStpFCjLDqG4LN0KADpqvYiqfyb1l4li1o6rtyDBRjrjMyUcQsC3QKMvtcUwkcniyQY6pgH0xmk%2B%2FMsDChy2GFMQXrP7ZrrdAipRXvKMeYY7qN4W1jjesebEFdm7bF8e56cFIpVXV7B5NFxk90BammoHiGZLqPJrkDpJFmApG3Lq1jsTK1QL%2FLCUYguCQQuMz7wPzojQZMmrVduCzum8UF%2FTeNbWbroTWVM6joVChNKYT3awWJJduf5bSOcGU7T6i11knTG9TPslgbbdOqr9b5xVpj%2B%2Fx%2FVyOTDb&X-Amz-Signature=a7cd1d619ae892883327eabf86d7b345f52e321e2701d09cef2980738c5ffa46&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466347CR2AB%2F20251210%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251210T005628Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIF7X8r1DZ8v1UI7fmmfKYx7fzjsMn4F4P1sdp%2Fi%2F5afHAiBN10qMqAUfTvgbl%2Bf%2FIutZ0Far86pWUE%2Bbsa4iF%2BpdSyqIBAjI%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMdGA1KX6CQpakLx6jKtwD3KQFQDceaGoIRPOJZL6hZiP2AZfP6k59%2FldKTF0DWFggBYPAqRN9e9KLBu4ppgiANFS9rlzl6quVfHWWvDPDg8YLJk8sBRFr7Qb%2FcRKhYTRpPTVVuaSG7yoRV3%2Fo2K83Dha59NSIzChBSupyd92OgQlkx1p9AEimVcy%2BcXRcNbw4shSk3knH7FgY0u1WZaUJSq69K67C7LxMqHQIn2Cw2ZAQMuB6O2WYNJWkCCM70U5hP%2BR2kWHZzkOfpkfQHMTW%2F%2FpWp9wywqIFOPHuxo7yDiFn1pZFdvI1a3JK5EOyP9JLU3WOjuKzHlpjqZ8eikk29VkDJfzMVqhTaBDEl25qOcnXAaZc935n1KwYmKDfqjNYUoLldo%2Fc6wBSmZiIrr6azrzVuA96GshUAU78f3C9IHSUry6nQMviO%2FSl2a77Lbj8V1RYI4tcDfLnlP8s8%2Bye6ytT0C7w17N2yqpHXFrtf8u4dZcaE0wY1EGq%2FRsqARBx2NzrTSDptKy17B8PCH35yVwD%2BN3Vpnkyj%2BZIloiKv8xBhJwpwae0SyueOmskZzRqOqZFFhQKqmfKCSBbWDDDLStpFCjLDqG4LN0KADpqvYiqfyb1l4li1o6rtyDBRjrjMyUcQsC3QKMvtcUwkcniyQY6pgH0xmk%2B%2FMsDChy2GFMQXrP7ZrrdAipRXvKMeYY7qN4W1jjesebEFdm7bF8e56cFIpVXV7B5NFxk90BammoHiGZLqPJrkDpJFmApG3Lq1jsTK1QL%2FLCUYguCQQuMz7wPzojQZMmrVduCzum8UF%2FTeNbWbroTWVM6joVChNKYT3awWJJduf5bSOcGU7T6i11knTG9TPslgbbdOqr9b5xVpj%2B%2Fx%2FVyOTDb&X-Amz-Signature=a1acdc83bd125b6e9065035b57772deac3fa35acb9fb77cf572720446c5620bd&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
