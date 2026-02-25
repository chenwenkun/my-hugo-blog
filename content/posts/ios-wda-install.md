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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QAWRVLHG%2F20260225%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260225T185201Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEoaCXVzLXdlc3QtMiJIMEYCIQDWrub2GVoqM9Rj1%2BmkW5diiT3hcbrdLjivgkAbNZCAwAIhAKU7dwcLsSEXyVg0SHjEHOajR9wzXyIkl62oBSuOYj92Kv8DCBMQABoMNjM3NDIzMTgzODA1IgzOyPH6YQTlJbVGwy4q3AM%2Fh62sxbkQvhiYGZytcq5Y3Qm%2FDyJw%2Fo0SGc9gT%2FDw0jr0aHuBgvT2LGg1GGoxmHjelS%2FBeQQXcyThQjzKAHJ3y3eu80OwsdxhZFw3khnEG3MiPXzFuTgrDydC63yvUpwi%2Bb%2FvcLCcR7pYVdNfU3Du%2FBEt1sbdS0Gn4PxLvPE%2FqgREMJJwO5zkVmknK7QKi9sQVirCFGErT%2FR8%2Bx0QP6JJo8ktwibycd950fzOH9Z490L3%2FBaF4Pb3ezx%2FThB6y4vr9O3gZ44fY1BplhuYSCo3PVaeftC5dY2b3xCYqMD%2BzzJvnnBeqwFvpM4oLhZcyiKJJmYRCoBst%2F%2B9Eyr6kwp2S30qlo7YXgLSMTI%2FX1qkLZy11q5R%2BmOpjubo81jT5cG7e9dJn8doDh0Gn%2FR1NPudBZlBB7kh%2BEx0YT9o743yTQ11jAmWXHaSMUn4szDIHjXbpmFVdwJyPdwA5PMT9pqyHozd75dviAzAF0h9sqV565YM5OFA1EcON3reY3JYbIJrQsVlyRDRpFHfmaY8%2Fb5VOG%2FGRTO%2Fp4WQV6Gie%2FT3EyejCPXbu%2Fnad9ZPPc%2BgOJiBZHy2PkgN5GYpC6UuKXMqJagwYhnhACSzvHlNSjl7S2YQ9jLrpON%2BAeFQrjCm9%2FzMBjqkAdMk%2FHvXdzbiBaj%2F5Uv%2B7LzkDGOS6yc6KV4K9ljpLhG8O2f1CXLdwzXe7EJ3iLweH0KQ4yP9zySdmLJ9lP%2BTp7%2BqUdeZpq0rzwK5jOH%2BTzIen1NthhVbrLtK3YG5YZnvz8EZDPlUX4t1SZseUQKPNyR1WWc4K4reZULDyeMtI5%2FLh0zPweQ5EKodWI%2B%2Fy9MFSYPpXybLFAnO8lu2tbgTHmJmr1cM&X-Amz-Signature=84c83008dcab0c32d8f24aeb34b8b234e7b72ca6cb257a182bce3a874a3a5f53&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QAWRVLHG%2F20260225%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260225T185201Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEoaCXVzLXdlc3QtMiJIMEYCIQDWrub2GVoqM9Rj1%2BmkW5diiT3hcbrdLjivgkAbNZCAwAIhAKU7dwcLsSEXyVg0SHjEHOajR9wzXyIkl62oBSuOYj92Kv8DCBMQABoMNjM3NDIzMTgzODA1IgzOyPH6YQTlJbVGwy4q3AM%2Fh62sxbkQvhiYGZytcq5Y3Qm%2FDyJw%2Fo0SGc9gT%2FDw0jr0aHuBgvT2LGg1GGoxmHjelS%2FBeQQXcyThQjzKAHJ3y3eu80OwsdxhZFw3khnEG3MiPXzFuTgrDydC63yvUpwi%2Bb%2FvcLCcR7pYVdNfU3Du%2FBEt1sbdS0Gn4PxLvPE%2FqgREMJJwO5zkVmknK7QKi9sQVirCFGErT%2FR8%2Bx0QP6JJo8ktwibycd950fzOH9Z490L3%2FBaF4Pb3ezx%2FThB6y4vr9O3gZ44fY1BplhuYSCo3PVaeftC5dY2b3xCYqMD%2BzzJvnnBeqwFvpM4oLhZcyiKJJmYRCoBst%2F%2B9Eyr6kwp2S30qlo7YXgLSMTI%2FX1qkLZy11q5R%2BmOpjubo81jT5cG7e9dJn8doDh0Gn%2FR1NPudBZlBB7kh%2BEx0YT9o743yTQ11jAmWXHaSMUn4szDIHjXbpmFVdwJyPdwA5PMT9pqyHozd75dviAzAF0h9sqV565YM5OFA1EcON3reY3JYbIJrQsVlyRDRpFHfmaY8%2Fb5VOG%2FGRTO%2Fp4WQV6Gie%2FT3EyejCPXbu%2Fnad9ZPPc%2BgOJiBZHy2PkgN5GYpC6UuKXMqJagwYhnhACSzvHlNSjl7S2YQ9jLrpON%2BAeFQrjCm9%2FzMBjqkAdMk%2FHvXdzbiBaj%2F5Uv%2B7LzkDGOS6yc6KV4K9ljpLhG8O2f1CXLdwzXe7EJ3iLweH0KQ4yP9zySdmLJ9lP%2BTp7%2BqUdeZpq0rzwK5jOH%2BTzIen1NthhVbrLtK3YG5YZnvz8EZDPlUX4t1SZseUQKPNyR1WWc4K4reZULDyeMtI5%2FLh0zPweQ5EKodWI%2B%2Fy9MFSYPpXybLFAnO8lu2tbgTHmJmr1cM&X-Amz-Signature=c08cde5172213836f553136b0de6189b15f704b58bd0c4ca82057977af398a33&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
