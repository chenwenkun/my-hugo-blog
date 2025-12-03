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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466W6T2GU4V%2F20251203%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251203T181755Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGoaCXVzLXdlc3QtMiJIMEYCIQDGSp1QgWHykXjh0pF8DkYFHne%2FKlu2vJ77RK44ngXaLwIhAKTYfpiQmOylMpSIcIWK5bvPYNxWORf7EPFSa9DW8fSDKv8DCDMQABoMNjM3NDIzMTgzODA1IgymuwxG339ck1eXuVAq3AODqkTaMAkCme6U3U9i5lcI3hUk1xK%2BWH1njX%2Bv4Yx6EfDT%2B4fhpr3%2BeTgy2jE%2F530tThs%2FsoR1TNL7yoT8hVwNrD3cjebRHtb4RR54MkLoL2oppMFU18YOKqcRD4SsQYZp7Wgu3ypIRqKIKp9Gd0CxjVRjQjrlKpEweGK87rQAaCWqyM7YO6i24ugwsbikv754jKXBPF3fmD2qGXXM5S4m%2FInK9c3donCL8I0sSgrHq6gN281r%2BANjGpf1chWqnwYEUBLtOAWtOsipPlXMerE0M7XfYj6e5YmB8UhC0dXdkshgRHoaLoJGCPBuCSd636DfmdWt02C0AtTwlxNTTgbvzNDmuZE9yc1zzDBpJDCInbNxd9%2FEkpgwilWBqr%2F9%2FbflciJSDPPZ11g4IcV4DzqY7FA8v4gOUEATrz4%2FOXkFNVd1xFnPberbgLrVXFFOT6UWHVHmRJ3I%2Fn5XG29V46ySSj4A82YKJFLjZVBmV1W8ZEi0g11VAJObEQQrBFYDNvgo6fiQ07j7XeDYDODUuG2NljIQHc5UGRrcEWWkWxfmryRo8%2FOVnD2oU41U0v%2FitsFn4C6g5GNmuFIYKImb%2BeXmmYtBT%2FX7yPdASiEN7oDgxTuoijvOxo2topqyczDj98HJBjqkAYlKQk6UWs71dBCpn%2FDD93dX5hWsPxbp9zgJE6fChX2L8GwbVj1W3x%2F5WIHrgHoHP34ed1fOtzK%2BhuVYafF1bKil94QvJQzctb%2BOc%2FqganwYigLjzWKlpJHCTrj9iDWchhtcIkJFDj63dz1arGD7Gd9R7RE3SsXhz%2B6OpLxMFMA3chobBHkiEHbOxBRyG9we3a7h7xjEPJ26SqAz%2FrckYO0mMdZX&X-Amz-Signature=4d3317fd7ed9a252429375e7d537132e5fdd1d9e9dbbcf9a3fcabc9786d38bf9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466W6T2GU4V%2F20251203%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251203T181755Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGoaCXVzLXdlc3QtMiJIMEYCIQDGSp1QgWHykXjh0pF8DkYFHne%2FKlu2vJ77RK44ngXaLwIhAKTYfpiQmOylMpSIcIWK5bvPYNxWORf7EPFSa9DW8fSDKv8DCDMQABoMNjM3NDIzMTgzODA1IgymuwxG339ck1eXuVAq3AODqkTaMAkCme6U3U9i5lcI3hUk1xK%2BWH1njX%2Bv4Yx6EfDT%2B4fhpr3%2BeTgy2jE%2F530tThs%2FsoR1TNL7yoT8hVwNrD3cjebRHtb4RR54MkLoL2oppMFU18YOKqcRD4SsQYZp7Wgu3ypIRqKIKp9Gd0CxjVRjQjrlKpEweGK87rQAaCWqyM7YO6i24ugwsbikv754jKXBPF3fmD2qGXXM5S4m%2FInK9c3donCL8I0sSgrHq6gN281r%2BANjGpf1chWqnwYEUBLtOAWtOsipPlXMerE0M7XfYj6e5YmB8UhC0dXdkshgRHoaLoJGCPBuCSd636DfmdWt02C0AtTwlxNTTgbvzNDmuZE9yc1zzDBpJDCInbNxd9%2FEkpgwilWBqr%2F9%2FbflciJSDPPZ11g4IcV4DzqY7FA8v4gOUEATrz4%2FOXkFNVd1xFnPberbgLrVXFFOT6UWHVHmRJ3I%2Fn5XG29V46ySSj4A82YKJFLjZVBmV1W8ZEi0g11VAJObEQQrBFYDNvgo6fiQ07j7XeDYDODUuG2NljIQHc5UGRrcEWWkWxfmryRo8%2FOVnD2oU41U0v%2FitsFn4C6g5GNmuFIYKImb%2BeXmmYtBT%2FX7yPdASiEN7oDgxTuoijvOxo2topqyczDj98HJBjqkAYlKQk6UWs71dBCpn%2FDD93dX5hWsPxbp9zgJE6fChX2L8GwbVj1W3x%2F5WIHrgHoHP34ed1fOtzK%2BhuVYafF1bKil94QvJQzctb%2BOc%2FqganwYigLjzWKlpJHCTrj9iDWchhtcIkJFDj63dz1arGD7Gd9R7RE3SsXhz%2B6OpLxMFMA3chobBHkiEHbOxBRyG9we3a7h7xjEPJ26SqAz%2FrckYO0mMdZX&X-Amz-Signature=fdacefb0cc419556a873e58f3851441b504b7c2a2ab3bd296b106cb2b6f2a3b8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
