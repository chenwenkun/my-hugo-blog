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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UQSWVKKN%2F20260214%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260214T063218Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDYaCXVzLXdlc3QtMiJHMEUCID%2FWv0x%2BKPfuDqWHUBCxoGxa9c72KX4cs%2Fmn4gwgnH4WAiEAmzYgRCzxR1Qoy89hRbP2DP6n%2F3OrcQyRZu69C0%2Fmw3wqiAQI%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDPpwxss9aevXhoNgFCrcA6QwlDxEhEa06nd4fZE%2F5TFJJHVAEWGArPVoVmL78fnvdbBbUq2wb95YTx8zyUuh3k6gJZXB%2BVmH3d49SW2WPpNLXNsGDl8OINvR5JwnkzIB6%2BCKrFUFDAT%2BavPqVUruG5dRHJ9pVm%2FdoG42vOERP6fKMN1jyDkYc%2BoMk67qqmVk0EgKTnSJf5EFQjdwe2cWZapZ0LJXgTIKCq7c672n4vT3pN6k05HuHLJTHzcXXN7iUbpBVlFhvM8yfNxZuv5226PsA9Ik6Q9YXT5JcZeMct3NPZ1RMg9I8c%2BiYVa0PUgKYCef1jSWUZAVoPlr3B6D547%2FdvitsyGUE3glNzN2ZatTVfGAOZhUKTKMkGxklKQlI2Az4Xgx74skcqHsQoL4CV83LtqDTavUMhvcYtvrsjYJu4Ds0ML5qB0oVN1XQHdEx4m0TaIPPwHjqXzQRPPy64khKK%2FBZhz6SEGunbbU%2FLKQGKyIw6imkuddl5ghWYOYuwldhWSHKGZH97rwOInK0F3UY4AsNfBXSVk%2Fliv7OqZhdVR4bI27mf7W%2FkFnnGKBXppP7M6JEeG%2Bnlt8n3v8vB4usAd8j5r6GrZCNJLBHTPr1KXFwq%2FFk4BpWCDaog0HD9LZPnWlX7Sx9M2pMKOTwMwGOqUBGqnvGDoNIW7EjQ1Qbkt3tCER41t%2FSF8mhmV7HG7GW1JFnZmeQflLSmfa6KM5LofiBkYl5vA%2Bt1Uoup2HObAfErDXhsN39%2BZSeCZdDrG5GawUCmc8IoRyIX6GQfem2T9rChjm%2F5ofJmBK4YHSSF1bu6RY6YvIm8PkPMwQayNkl%2FbzZ%2BKOZ8RrXKEUfE6qjqRuUOE4y3hBLSsE2um73j73fIp8%2Bbw7&X-Amz-Signature=8b366edb0c6e080107fb3397f3497dea889c41041f29cf763a4c603848431378&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UQSWVKKN%2F20260214%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260214T063218Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDYaCXVzLXdlc3QtMiJHMEUCID%2FWv0x%2BKPfuDqWHUBCxoGxa9c72KX4cs%2Fmn4gwgnH4WAiEAmzYgRCzxR1Qoy89hRbP2DP6n%2F3OrcQyRZu69C0%2Fmw3wqiAQI%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDPpwxss9aevXhoNgFCrcA6QwlDxEhEa06nd4fZE%2F5TFJJHVAEWGArPVoVmL78fnvdbBbUq2wb95YTx8zyUuh3k6gJZXB%2BVmH3d49SW2WPpNLXNsGDl8OINvR5JwnkzIB6%2BCKrFUFDAT%2BavPqVUruG5dRHJ9pVm%2FdoG42vOERP6fKMN1jyDkYc%2BoMk67qqmVk0EgKTnSJf5EFQjdwe2cWZapZ0LJXgTIKCq7c672n4vT3pN6k05HuHLJTHzcXXN7iUbpBVlFhvM8yfNxZuv5226PsA9Ik6Q9YXT5JcZeMct3NPZ1RMg9I8c%2BiYVa0PUgKYCef1jSWUZAVoPlr3B6D547%2FdvitsyGUE3glNzN2ZatTVfGAOZhUKTKMkGxklKQlI2Az4Xgx74skcqHsQoL4CV83LtqDTavUMhvcYtvrsjYJu4Ds0ML5qB0oVN1XQHdEx4m0TaIPPwHjqXzQRPPy64khKK%2FBZhz6SEGunbbU%2FLKQGKyIw6imkuddl5ghWYOYuwldhWSHKGZH97rwOInK0F3UY4AsNfBXSVk%2Fliv7OqZhdVR4bI27mf7W%2FkFnnGKBXppP7M6JEeG%2Bnlt8n3v8vB4usAd8j5r6GrZCNJLBHTPr1KXFwq%2FFk4BpWCDaog0HD9LZPnWlX7Sx9M2pMKOTwMwGOqUBGqnvGDoNIW7EjQ1Qbkt3tCER41t%2FSF8mhmV7HG7GW1JFnZmeQflLSmfa6KM5LofiBkYl5vA%2Bt1Uoup2HObAfErDXhsN39%2BZSeCZdDrG5GawUCmc8IoRyIX6GQfem2T9rChjm%2F5ofJmBK4YHSSF1bu6RY6YvIm8PkPMwQayNkl%2FbzZ%2BKOZ8RrXKEUfE6qjqRuUOE4y3hBLSsE2um73j73fIp8%2Bbw7&X-Amz-Signature=d63f3bffb60b0a2c3cc67e252a222ef49ba6a45978730ef86beabed088965ff6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
