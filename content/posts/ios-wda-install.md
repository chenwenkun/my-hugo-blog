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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667B2VGRZG%2F20260317%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260317T124416Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECUaCXVzLXdlc3QtMiJHMEUCIQD27Sc6v6HjcTgtvX9PgZ3xJdUjLjwfmHPZu0lorSaeqQIgPUFYfbEQ7SSG%2BVWsCOgj2UxHyv01WrMZh7ff3qZp4l8qiAQI7f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOqT%2BETxmPGqWbL4SSrcAzax2HOk72MpXh7cTivLV3zT4KLQRJzJU3zv8tE9nv%2FIF%2FOn%2BAH87PZUq%2Fp%2BsQvwOEucEHYoW5SLAjz9gXV9f1EU%2BPf17DGo6EjoblhmCYx8HonyOTCI78g%2BAHEOOo%2FWQa3t0cLfbb5SL8UvAGJQ0xqvd2RWe%2BjI86jIV6FyD7pebVBC%2BFhgDMizwP7Oold3Fi9VYmajxojLJJx7kEavfJbIsZoUDuwCKZDX1p5DX860Y2QxCte549D2bI2sbirqTQ9yzr6kBh0AKvcTvrG2dZwToyPGaPzUeouhaiID7XaowRxEcD9r4HiSMZoCKthX9B0%2FVN20JWDcvK6s%2BsktN23dqw8Iv4zZ8PBQCQUkBxsc6Agtz%2BJ82aXCX39GyKwLBxXgboriVziYCJ9BtOnMGobJ6NaX043j2HqS1GGzUr5BqaTOF2DLP%2BfCMBymqGfWO7FCdnnzUodMzweKxYtvs6bbs32QzxWYH7W38i6TYLg0keOBcAdoEW%2FM8ozKzmlc%2FpSqMNZPwR0PIKtxQaprVjQ8RGX5mIFbT%2Fbqf04fAmN4jDfGPpSeA7E3mkWYpcOvG4LqjtAmvtGgwcWzOtnudoaoyKsNbGRLovs2Nm7Nzd3T4EJlDlpEMeeq74hQMO6N5c0GOqUBj7JMYgFVqi4NyY1UBkJZYykc4BtPABv6I1deqESfgWUPjJbJmhhM7kl9nCU%2Bc2DBg7xQPCNIXzppA4mOJtQ7GuebyVdbmkckBxf%2F%2FAwaSpsZPbE56ytlKMp7VNPk6YwS5EU39biJbaEFRPbZauUplyIEyw5NM87TkQUl5iHVyBNvLD1kLMhnrfTmwDDOy4lOPEl6HVLjxe%2BOxzYtvETebHrnyk3K&X-Amz-Signature=c71efa98ec2a48cabbb9d3ad6ecf0399b31d523f25ff74e07d73af407c4b32c3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667B2VGRZG%2F20260317%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260317T124416Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECUaCXVzLXdlc3QtMiJHMEUCIQD27Sc6v6HjcTgtvX9PgZ3xJdUjLjwfmHPZu0lorSaeqQIgPUFYfbEQ7SSG%2BVWsCOgj2UxHyv01WrMZh7ff3qZp4l8qiAQI7f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOqT%2BETxmPGqWbL4SSrcAzax2HOk72MpXh7cTivLV3zT4KLQRJzJU3zv8tE9nv%2FIF%2FOn%2BAH87PZUq%2Fp%2BsQvwOEucEHYoW5SLAjz9gXV9f1EU%2BPf17DGo6EjoblhmCYx8HonyOTCI78g%2BAHEOOo%2FWQa3t0cLfbb5SL8UvAGJQ0xqvd2RWe%2BjI86jIV6FyD7pebVBC%2BFhgDMizwP7Oold3Fi9VYmajxojLJJx7kEavfJbIsZoUDuwCKZDX1p5DX860Y2QxCte549D2bI2sbirqTQ9yzr6kBh0AKvcTvrG2dZwToyPGaPzUeouhaiID7XaowRxEcD9r4HiSMZoCKthX9B0%2FVN20JWDcvK6s%2BsktN23dqw8Iv4zZ8PBQCQUkBxsc6Agtz%2BJ82aXCX39GyKwLBxXgboriVziYCJ9BtOnMGobJ6NaX043j2HqS1GGzUr5BqaTOF2DLP%2BfCMBymqGfWO7FCdnnzUodMzweKxYtvs6bbs32QzxWYH7W38i6TYLg0keOBcAdoEW%2FM8ozKzmlc%2FpSqMNZPwR0PIKtxQaprVjQ8RGX5mIFbT%2Fbqf04fAmN4jDfGPpSeA7E3mkWYpcOvG4LqjtAmvtGgwcWzOtnudoaoyKsNbGRLovs2Nm7Nzd3T4EJlDlpEMeeq74hQMO6N5c0GOqUBj7JMYgFVqi4NyY1UBkJZYykc4BtPABv6I1deqESfgWUPjJbJmhhM7kl9nCU%2Bc2DBg7xQPCNIXzppA4mOJtQ7GuebyVdbmkckBxf%2F%2FAwaSpsZPbE56ytlKMp7VNPk6YwS5EU39biJbaEFRPbZauUplyIEyw5NM87TkQUl5iHVyBNvLD1kLMhnrfTmwDDOy4lOPEl6HVLjxe%2BOxzYtvETebHrnyk3K&X-Amz-Signature=f62428d731d35df39f4e79fd36e943a893f2ca59561c9e3f8c7ffab5474e808e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
