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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WOYFEL2Q%2F20251219%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251219T181720Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIE0T530T%2BHj0IF%2BvqPqNOBXArg57%2BvUhVYVCVd8XT8VIAiBA1bmvsBK%2F4OqoejuSBSDDR6rn%2FoMJLYR0nvB8nMBzjyqIBAiz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM9rCRsgajiYIMTl47KtwDfcnFkxFhOy7gIMMKWDfNKjXgZtFtNfl1rjyTbm3ZzXrBIRH%2FASqb7ZzxXbmC6jf5HLl5JIjqz8CUn%2Fw8P55Zz%2BKZkmm4Ap2pRNZckesUKGyk8VXwND8sBelpb1%2Fb5i7rhciodhPGTbuP7AO8DiY4IIMdpjJ2jpqV46rA2ZBbZR2eizbfPxa1XYKeGIuafmIv5SCQhmnLyij7r7dwtpuVI5kkt8eAK73azwIVWnsztCMaWuT8v7q3O8iEA9wdHulZ3FIt%2BFSjIZnudXn1RfI7tK5psAD7a3JoGEDdGpA74btX1sVGq%2Bh4pekhgy%2Fb4xGo7I1ebc1OaxXfk1253s3jYOUdWhG6iN5fzuLdykja2NUYvXKDiP%2BTZizxAibajOMoaG5rRFmmewZGyDnOiFYeFBsP%2BDhXA%2B2deTsLQ6%2BK0%2BTf6%2Fy4bXod%2F4T2eraeXwbDepR4hVQBEfSHCLQ%2BjxfCxhnb4PyldiQP7Rc38O1BqSz8%2BR7mR2s0MjjCzFH%2BrFBt9q9sFtptc9Bt1%2FgaRtGMa14SRurm9p5ntgLPjf8Pa%2FXBn1VKkrZ7puVWogLDwHithrtuEtiQJMinYwPRCLjSWRc1QQsZC8Rk3FSu8s2j7YXssLYW5jP3WLlbewIwm6mWygY6pgFqddZvNnxmdz29v1n%2FO6WOkkaPvXOWPxLTaQS4zAMgHgl6blP1WenO4qr%2B4jgQlY%2FOQn732WyWuR3kfmc0Ej%2BmmBZA0NeFXVIvVzgDw1k0oSbIGLVuUQHSeBHSJ4rJ5Ms4lnoREhsRmUlQSkSQLlgeWojVbm1A4N3Uc3yiwTNDXlW0poCrgzFNZqZ5IlSHkVPVICZZD7aoWU%2FA%2BUXkOBJKpnL%2ByA3g&X-Amz-Signature=e4ae435f771bdf6fb876af6768fde9d4b33050b36af4c0590b512d4dd80f9a87&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WOYFEL2Q%2F20251219%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251219T181720Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIE0T530T%2BHj0IF%2BvqPqNOBXArg57%2BvUhVYVCVd8XT8VIAiBA1bmvsBK%2F4OqoejuSBSDDR6rn%2FoMJLYR0nvB8nMBzjyqIBAiz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM9rCRsgajiYIMTl47KtwDfcnFkxFhOy7gIMMKWDfNKjXgZtFtNfl1rjyTbm3ZzXrBIRH%2FASqb7ZzxXbmC6jf5HLl5JIjqz8CUn%2Fw8P55Zz%2BKZkmm4Ap2pRNZckesUKGyk8VXwND8sBelpb1%2Fb5i7rhciodhPGTbuP7AO8DiY4IIMdpjJ2jpqV46rA2ZBbZR2eizbfPxa1XYKeGIuafmIv5SCQhmnLyij7r7dwtpuVI5kkt8eAK73azwIVWnsztCMaWuT8v7q3O8iEA9wdHulZ3FIt%2BFSjIZnudXn1RfI7tK5psAD7a3JoGEDdGpA74btX1sVGq%2Bh4pekhgy%2Fb4xGo7I1ebc1OaxXfk1253s3jYOUdWhG6iN5fzuLdykja2NUYvXKDiP%2BTZizxAibajOMoaG5rRFmmewZGyDnOiFYeFBsP%2BDhXA%2B2deTsLQ6%2BK0%2BTf6%2Fy4bXod%2F4T2eraeXwbDepR4hVQBEfSHCLQ%2BjxfCxhnb4PyldiQP7Rc38O1BqSz8%2BR7mR2s0MjjCzFH%2BrFBt9q9sFtptc9Bt1%2FgaRtGMa14SRurm9p5ntgLPjf8Pa%2FXBn1VKkrZ7puVWogLDwHithrtuEtiQJMinYwPRCLjSWRc1QQsZC8Rk3FSu8s2j7YXssLYW5jP3WLlbewIwm6mWygY6pgFqddZvNnxmdz29v1n%2FO6WOkkaPvXOWPxLTaQS4zAMgHgl6blP1WenO4qr%2B4jgQlY%2FOQn732WyWuR3kfmc0Ej%2BmmBZA0NeFXVIvVzgDw1k0oSbIGLVuUQHSeBHSJ4rJ5Ms4lnoREhsRmUlQSkSQLlgeWojVbm1A4N3Uc3yiwTNDXlW0poCrgzFNZqZ5IlSHkVPVICZZD7aoWU%2FA%2BUXkOBJKpnL%2ByA3g&X-Amz-Signature=a72f6f385e3c0ce05d4a24374c7d742d31be557a31c185678299e51d0a7ef2ad&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
