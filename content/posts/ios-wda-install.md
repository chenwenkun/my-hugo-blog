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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663XVX6VTL%2F20260706%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260706T020621Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIGptykap0LFdJvYKItK78A%2FPGAriOIUwxsxLLFGcKjK6AiATy43PAdVir%2FiidV5CciDNGrYsYyW9p7FjkqXb%2FMgQZCr%2FAwhLEAAaDDYzNzQyMzE4MzgwNSIMMYt46w52pHTVZjp8KtwDvDi9EfBmnCb5EM3QCC%2FrBCY8r%2F5cok7lMMBVG7uBuFvICa0xU6FhGNqc8RqGMtp15wIUv9%2FG%2FDJ25Q%2FF92AqZFZcH7r7qENS%2FE69jJfl0%2B1zLU9fA50bcN06I098kD7PQef9NunvzorpS52cKviEGDQF6klnFSkqystvirIxMITzjehT%2BUHSsfA9KWKV13kBvoRLN4pACHQR0Sa9YH81yAGqGo2uqe5c7UC9JJghgkocwMWlojcFq9NVGZa5yh0hkyBTnalfb89mI%2FWvSxiQ%2BNsIrgYDhBGMorqbd3od4CnmwhD2K5W9jqhS5dNZjMCjTcqmSARmA55kXIMocBx4WC3N5Njln53op1clhocGM2Ax7ZBqixJQJGOOVnTB4kvIzBDKMMuuyzpQns7Bydhzs1CAAObsrtzx1vSKbfvPyJ4vnPosQn9vbN%2Fyn0IR%2FjkgZFaWGYkcQvvPT3YZy0c37lzn6Fbegpl0GU9rk34IosuOdZBPGONmqNm5MYURPJYsarGn2Lob6q139G1gBW8U72cg1ZuF%2F98u6UrLEwnqBMFItpWTE0Htc8Kcle2dsBHbCgSvyqAMx9in2jwQXCoHEfimFytKT98ZhDpwLUZF%2FC%2BfaVzKqUGF19gWjxwwk42s0gY6pgF2Xxh7oGhp8Sm7DmGypivKBFppJIyZQ8vbkxXxcMLQPhBBxxI71l6jst%2FJynE3wtcng%2Fq2N0CuVReglBMHyUBhllZeiR2Qj3GaimNoxLV6n5ogy7FQkcb9K7jfF88bBnb54mrW4rVGoXWh9%2F9Oylv%2B5mvaJ7nMniSpF55hkIxXD5voTt17sS8pCW6VjMKF0jISyNPO8aQVMVi2CTS3Ihww7csop9QV&X-Amz-Signature=d9f8dee52df47cb3f1475c9bf498f6932ec85ac148558756695a92868b1e87a1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663XVX6VTL%2F20260706%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260706T020621Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIGptykap0LFdJvYKItK78A%2FPGAriOIUwxsxLLFGcKjK6AiATy43PAdVir%2FiidV5CciDNGrYsYyW9p7FjkqXb%2FMgQZCr%2FAwhLEAAaDDYzNzQyMzE4MzgwNSIMMYt46w52pHTVZjp8KtwDvDi9EfBmnCb5EM3QCC%2FrBCY8r%2F5cok7lMMBVG7uBuFvICa0xU6FhGNqc8RqGMtp15wIUv9%2FG%2FDJ25Q%2FF92AqZFZcH7r7qENS%2FE69jJfl0%2B1zLU9fA50bcN06I098kD7PQef9NunvzorpS52cKviEGDQF6klnFSkqystvirIxMITzjehT%2BUHSsfA9KWKV13kBvoRLN4pACHQR0Sa9YH81yAGqGo2uqe5c7UC9JJghgkocwMWlojcFq9NVGZa5yh0hkyBTnalfb89mI%2FWvSxiQ%2BNsIrgYDhBGMorqbd3od4CnmwhD2K5W9jqhS5dNZjMCjTcqmSARmA55kXIMocBx4WC3N5Njln53op1clhocGM2Ax7ZBqixJQJGOOVnTB4kvIzBDKMMuuyzpQns7Bydhzs1CAAObsrtzx1vSKbfvPyJ4vnPosQn9vbN%2Fyn0IR%2FjkgZFaWGYkcQvvPT3YZy0c37lzn6Fbegpl0GU9rk34IosuOdZBPGONmqNm5MYURPJYsarGn2Lob6q139G1gBW8U72cg1ZuF%2F98u6UrLEwnqBMFItpWTE0Htc8Kcle2dsBHbCgSvyqAMx9in2jwQXCoHEfimFytKT98ZhDpwLUZF%2FC%2BfaVzKqUGF19gWjxwwk42s0gY6pgF2Xxh7oGhp8Sm7DmGypivKBFppJIyZQ8vbkxXxcMLQPhBBxxI71l6jst%2FJynE3wtcng%2Fq2N0CuVReglBMHyUBhllZeiR2Qj3GaimNoxLV6n5ogy7FQkcb9K7jfF88bBnb54mrW4rVGoXWh9%2F9Oylv%2B5mvaJ7nMniSpF55hkIxXD5voTt17sS8pCW6VjMKF0jISyNPO8aQVMVi2CTS3Ihww7csop9QV&X-Amz-Signature=65456dc71d84193e5ad4cd0635765bf6243f5315d7e7f866fdcbf388dad0e045&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
