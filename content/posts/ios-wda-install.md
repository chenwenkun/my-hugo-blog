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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RMQF6GLX%2F20260328%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260328T182544Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEC8aCXVzLXdlc3QtMiJIMEYCIQCNCGdpOtwwvb4gJ%2FeRGAApYij31RZdBRyUFeFEzKoKjAIhAIErfPKNRR6wrQc%2BHIjGlKeTVxeBzIxa6ANKjwB6DVGiKogECPj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgySeuviY0f5VgA%2BLvUq3AOrt41ubmyVN8ZZl9Djl6pCsojCwFGccoy80UEWen3DYCNxbikilSX6UqkFlZK7yuY7VrAjcBqhZhMjIJo7OhZV1EW5rF6GAELMSmc9yaIuWAtxk%2Fgf1omfyl0SeAa3hrXTX6enF8oLNBT%2BhNvtNGZZekTQQ0CABGX8cv%2BRdn5Dh1jF%2BrHdGBJByYG3d5eT8KmKwqutSYj6NF91u3pWNcn0G3N6dQaCzmcg1ARa6njUTWI3k9FHOuo54aOjtCwqkag%2FBGkIphkf9uIlZMH7OAsFj%2FmkWTh5Ba7TktIweTxDu7oLfvFIdaMf3ow23ji4kbJuNtXfBq2xRWVo613ERWvPrhNVCXmTTYrY1mIyNVXsjqWodER9wQMenGqKZGwcoYW5eC9c%2FM%2BbnOPZGuK4C3NK7%2F1rZ4tToFdWZXxZq3YgAT%2ByOq9MrIqqbHZYaz89x5%2F2a96mKKgSro25nmnyaaHEMRZeikAN5t2RhuoBP58vi2tnBSkAQ%2B6jQuz3zf1kQrItpIYf5GlvGckZKvR6HyGxJs%2BPLlBFPsu2LdF5QKveer%2FNtUsnkUP8La3m7%2B3XiYR4RFpVMXMF06swIXBkW2GxygCi7f89h88aq8HboQ03mVdtdcGPItUqm%2BtbpTDa1Z%2FOBjqkAdtVF2q%2F1zbwSMwAQcUT1tYP%2FZmKR%2BVmNl72zTbKUM7cBHiMe91s%2FpM3Pt6VY5qr0RKluSeHN2IfyRK9A7H4DbF18GJLi7KK%2FMtXXDwOWndvZRLNWDKordx0CIQG5pz6P4bwdd0IDm4fcJ2Y2WsjDYXYOlZXxcDB%2Bq47flEndrRJ4ue9xpaDSnYOB9tMuqAv98wswzvLI6WvhWpUzzlFhLqY9WyH&X-Amz-Signature=a3c4618a29013d6a14e382075d53de1594b48c00ba91263fa50e18e79accfc30&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RMQF6GLX%2F20260328%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260328T182544Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEC8aCXVzLXdlc3QtMiJIMEYCIQCNCGdpOtwwvb4gJ%2FeRGAApYij31RZdBRyUFeFEzKoKjAIhAIErfPKNRR6wrQc%2BHIjGlKeTVxeBzIxa6ANKjwB6DVGiKogECPj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgySeuviY0f5VgA%2BLvUq3AOrt41ubmyVN8ZZl9Djl6pCsojCwFGccoy80UEWen3DYCNxbikilSX6UqkFlZK7yuY7VrAjcBqhZhMjIJo7OhZV1EW5rF6GAELMSmc9yaIuWAtxk%2Fgf1omfyl0SeAa3hrXTX6enF8oLNBT%2BhNvtNGZZekTQQ0CABGX8cv%2BRdn5Dh1jF%2BrHdGBJByYG3d5eT8KmKwqutSYj6NF91u3pWNcn0G3N6dQaCzmcg1ARa6njUTWI3k9FHOuo54aOjtCwqkag%2FBGkIphkf9uIlZMH7OAsFj%2FmkWTh5Ba7TktIweTxDu7oLfvFIdaMf3ow23ji4kbJuNtXfBq2xRWVo613ERWvPrhNVCXmTTYrY1mIyNVXsjqWodER9wQMenGqKZGwcoYW5eC9c%2FM%2BbnOPZGuK4C3NK7%2F1rZ4tToFdWZXxZq3YgAT%2ByOq9MrIqqbHZYaz89x5%2F2a96mKKgSro25nmnyaaHEMRZeikAN5t2RhuoBP58vi2tnBSkAQ%2B6jQuz3zf1kQrItpIYf5GlvGckZKvR6HyGxJs%2BPLlBFPsu2LdF5QKveer%2FNtUsnkUP8La3m7%2B3XiYR4RFpVMXMF06swIXBkW2GxygCi7f89h88aq8HboQ03mVdtdcGPItUqm%2BtbpTDa1Z%2FOBjqkAdtVF2q%2F1zbwSMwAQcUT1tYP%2FZmKR%2BVmNl72zTbKUM7cBHiMe91s%2FpM3Pt6VY5qr0RKluSeHN2IfyRK9A7H4DbF18GJLi7KK%2FMtXXDwOWndvZRLNWDKordx0CIQG5pz6P4bwdd0IDm4fcJ2Y2WsjDYXYOlZXxcDB%2Bq47flEndrRJ4ue9xpaDSnYOB9tMuqAv98wswzvLI6WvhWpUzzlFhLqY9WyH&X-Amz-Signature=75c2e63b72c478bab51cb4f10f8f8f9ecb6239d53639b02f8b30f1b6329a841f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
