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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QLTEGWOU%2F20260716%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260716T131739Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHwaCXVzLXdlc3QtMiJGMEQCIDCzajlKfEQLV1iKLzSKOA%2B8HY0zDUt%2BBPHi8mGBmptlAiApLULE8OUjVwpvSKv8BmBHQTtpLT9YZPfBWzcOOvvqAyr%2FAwhFEAAaDDYzNzQyMzE4MzgwNSIMEl%2BXHEIewExSSLrrKtwDI36%2BKwWjPt0IhWd0h9P1HOlS2E%2Fk1Ez1wPlXF1jjfYUmQlRVWIDCcoWQmPFUstAgGPPPdlY%2BDiRfgp7CugTryBEMo9SXH8BacfzKcVx88EcTCRPWpowyjwEc5%2BvCDoOWNPjYzyVHGF3ZhIH3%2BeUP2hyaMXJD56xONSOCdhu0IzzUb762jd5%2F2VA%2Fz6S4Icn%2Fg5%2BBTRNEBtF5KbygFZKXxr6Xty7hYzwqesKOWsuXbXRLFzNNSJyhhrek577hPSnRxNLadVfH8gbEG7xfOEcdR6Tsakp9L%2F4LQEBXMiPSaHkHEFLXojkktAzHzeWvL6Pi1YqPkituh%2BYRxN4ApXiYGTIGbC7qtw1IFeXMn0lv6q80wpw6zFE8sXoWe2G13lDNZesPPTmnbXrJbrDVQ9jmXzm8bO%2BVbCS3CQUsgDDcMc3YHRiBkH3PIhbDg2i%2Bw7AFP3zUbbm6wdooMr9RhtoB5A16ZTkO2LbGuPPb5D%2BHziie2r9tPYYI%2Bg6An1VfHiec1cb3k3GoMePwRtfAxaG%2Bv0zSyz2CVV2ntMDwkVEwH1Q6YWqU%2FqkN9igmKx8TF8oP1%2Bpd0ROPxlxtFQP18cuAbd0FfZuTvDimgTpsC7kysyaOBVnNrhuKXgwBUrcwqI%2Fj0gY6pgH7Rdf6%2F3yeT%2Fg4Fd5tG3%2Fs5YOOJ7WTtL%2B6IBqQSCx9FbbIekQJ%2BWeyhEm4r15W9UfDj83AjzshA6GmnojOCXwjAQlt7ynMtmHIzjwHmdrUibeEw%2FxR3DXlcO0hydj3B4Us%2F3i%2Frs7cD63%2FLxza4XzoZxjQDnh3wip1BMp1isGLJG9BBW0dg7qX%2FkDa8m4vP1gWjDUNLGvtoV3wnCExYS%2FhMGllwLrX&X-Amz-Signature=c421917d887fb049796e9192efe5d36a3563a939f41590cbc44b6b2dafda9692&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QLTEGWOU%2F20260716%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260716T131739Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHwaCXVzLXdlc3QtMiJGMEQCIDCzajlKfEQLV1iKLzSKOA%2B8HY0zDUt%2BBPHi8mGBmptlAiApLULE8OUjVwpvSKv8BmBHQTtpLT9YZPfBWzcOOvvqAyr%2FAwhFEAAaDDYzNzQyMzE4MzgwNSIMEl%2BXHEIewExSSLrrKtwDI36%2BKwWjPt0IhWd0h9P1HOlS2E%2Fk1Ez1wPlXF1jjfYUmQlRVWIDCcoWQmPFUstAgGPPPdlY%2BDiRfgp7CugTryBEMo9SXH8BacfzKcVx88EcTCRPWpowyjwEc5%2BvCDoOWNPjYzyVHGF3ZhIH3%2BeUP2hyaMXJD56xONSOCdhu0IzzUb762jd5%2F2VA%2Fz6S4Icn%2Fg5%2BBTRNEBtF5KbygFZKXxr6Xty7hYzwqesKOWsuXbXRLFzNNSJyhhrek577hPSnRxNLadVfH8gbEG7xfOEcdR6Tsakp9L%2F4LQEBXMiPSaHkHEFLXojkktAzHzeWvL6Pi1YqPkituh%2BYRxN4ApXiYGTIGbC7qtw1IFeXMn0lv6q80wpw6zFE8sXoWe2G13lDNZesPPTmnbXrJbrDVQ9jmXzm8bO%2BVbCS3CQUsgDDcMc3YHRiBkH3PIhbDg2i%2Bw7AFP3zUbbm6wdooMr9RhtoB5A16ZTkO2LbGuPPb5D%2BHziie2r9tPYYI%2Bg6An1VfHiec1cb3k3GoMePwRtfAxaG%2Bv0zSyz2CVV2ntMDwkVEwH1Q6YWqU%2FqkN9igmKx8TF8oP1%2Bpd0ROPxlxtFQP18cuAbd0FfZuTvDimgTpsC7kysyaOBVnNrhuKXgwBUrcwqI%2Fj0gY6pgH7Rdf6%2F3yeT%2Fg4Fd5tG3%2Fs5YOOJ7WTtL%2B6IBqQSCx9FbbIekQJ%2BWeyhEm4r15W9UfDj83AjzshA6GmnojOCXwjAQlt7ynMtmHIzjwHmdrUibeEw%2FxR3DXlcO0hydj3B4Us%2F3i%2Frs7cD63%2FLxza4XzoZxjQDnh3wip1BMp1isGLJG9BBW0dg7qX%2FkDa8m4vP1gWjDUNLGvtoV3wnCExYS%2FhMGllwLrX&X-Amz-Signature=07b2e2b67b3b9681d5073dc549a854b164d73c34bf5b7a82f255559efcd613ca&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
