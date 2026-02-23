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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WUTRW6DN%2F20260223%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260223T065301Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEA4aCXVzLXdlc3QtMiJGMEQCIHlKARPYkk2OeJ54%2Fc3rdUms0in75IkkCJ5RTYSBt8YjAiAzcmUL3%2F4L08uS%2FVrElsCCGfbos3gSSNq5jHblpWeVFSqIBAjX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM9adpnxrnxRcZ4PIHKtwDBhtbKcWEiEtEf%2FA6zN%2B3j0NrCtD11rr5DAU3ijXwOoDmoebhPKXKwAXMyB0%2BZQx14eD1kQ8WLyS6bmqFdeP3i%2BdzvCpfFSYqfNzmSDWZC4zlZnVaF%2Bv1Mu9S8%2Fmm%2FNxp40Ip9oU%2BimYYViumLElaSdYvX%2FgKzBkCCoZDQ9CJAUvCV%2FuD7vzW7Wg98aCex3%2F2NxQo%2Bh8R8DVSmuUB5j91nmmUk764PTtMeNUy%2Fc%2BzK8vAt78j8fA7RJuBK8QbFqtKx7DDV7X1y3yPg7k%2BePuX3bRNQ%2F7BkkM%2B52QfogGtvyLkWYZppzZZSxYtkAXuB4obIsZ%2Fp1sofvc4rJxE12NFYwaqp5fqvSiJf2KvfyqZKp1mkZxkSs8hNwhz21CsZEHqE6JQ9dL2OreA%2B4fKhjA7zs%2FQeKQDioWvXZ0nV3pj61UfVMHqpgTdozv0Z0LPU1Rxg%2FnOd73s0rxPJH%2B%2BUBP8Ec%2BGYAMtaFhHcQdLvKYz9w80NHL%2FWcH1rS3YoIEa%2BecNF3kJ6VrhvPTwbZly21IpFLeMcy9UdT7CKF8UsvJIT5WKlOfSItnTRDUw71zvwvI%2BQ3DbyW9v86qnK7QICXqniGAdBDo7TwSx2gJMpAfZXgKz%2FobYNFN3SjiHWMow%2FtbvzAY6pgFOkGFxaxRmAYUOF%2FN5n1x12JLfn9xtMCPP5gT4fS28zQiDfomZgqpe1ains%2BcivVEPwYpUJUJR378Tfhn5X7uGCKaS3juP%2BSo4rOJX4kDt3mWkFSeNUn6GOUTP%2B581XqMQdXGDGXPpxeo2d14PW47m1MfkpPOel%2FYjB6dfXkecXZdp%2FJrMd1Zs77UOfga9oZ1XRJI0fKH6AoIvNjlLj47e3etVvX9Z&X-Amz-Signature=30463a33588225b19baebafa2281f320a4b7abeb1061c3c475db6fb0f47e50b2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WUTRW6DN%2F20260223%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260223T065301Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEA4aCXVzLXdlc3QtMiJGMEQCIHlKARPYkk2OeJ54%2Fc3rdUms0in75IkkCJ5RTYSBt8YjAiAzcmUL3%2F4L08uS%2FVrElsCCGfbos3gSSNq5jHblpWeVFSqIBAjX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM9adpnxrnxRcZ4PIHKtwDBhtbKcWEiEtEf%2FA6zN%2B3j0NrCtD11rr5DAU3ijXwOoDmoebhPKXKwAXMyB0%2BZQx14eD1kQ8WLyS6bmqFdeP3i%2BdzvCpfFSYqfNzmSDWZC4zlZnVaF%2Bv1Mu9S8%2Fmm%2FNxp40Ip9oU%2BimYYViumLElaSdYvX%2FgKzBkCCoZDQ9CJAUvCV%2FuD7vzW7Wg98aCex3%2F2NxQo%2Bh8R8DVSmuUB5j91nmmUk764PTtMeNUy%2Fc%2BzK8vAt78j8fA7RJuBK8QbFqtKx7DDV7X1y3yPg7k%2BePuX3bRNQ%2F7BkkM%2B52QfogGtvyLkWYZppzZZSxYtkAXuB4obIsZ%2Fp1sofvc4rJxE12NFYwaqp5fqvSiJf2KvfyqZKp1mkZxkSs8hNwhz21CsZEHqE6JQ9dL2OreA%2B4fKhjA7zs%2FQeKQDioWvXZ0nV3pj61UfVMHqpgTdozv0Z0LPU1Rxg%2FnOd73s0rxPJH%2B%2BUBP8Ec%2BGYAMtaFhHcQdLvKYz9w80NHL%2FWcH1rS3YoIEa%2BecNF3kJ6VrhvPTwbZly21IpFLeMcy9UdT7CKF8UsvJIT5WKlOfSItnTRDUw71zvwvI%2BQ3DbyW9v86qnK7QICXqniGAdBDo7TwSx2gJMpAfZXgKz%2FobYNFN3SjiHWMow%2FtbvzAY6pgFOkGFxaxRmAYUOF%2FN5n1x12JLfn9xtMCPP5gT4fS28zQiDfomZgqpe1ains%2BcivVEPwYpUJUJR378Tfhn5X7uGCKaS3juP%2BSo4rOJX4kDt3mWkFSeNUn6GOUTP%2B581XqMQdXGDGXPpxeo2d14PW47m1MfkpPOel%2FYjB6dfXkecXZdp%2FJrMd1Zs77UOfga9oZ1XRJI0fKH6AoIvNjlLj47e3etVvX9Z&X-Amz-Signature=d3ae6780f9a78d832b1404eba4f8d591c2ee2217caffe8e216d8353bfaf4f519&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
