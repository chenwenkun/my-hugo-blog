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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667MATGPNM%2F20260306%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260306T183051Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECIaCXVzLXdlc3QtMiJGMEQCIBgIHCzLUH%2B0Me2svO%2FgzryrPhnLjpWyhuU%2Fi0SKlerAAiBo7mJhKKEDvryd7%2BOfS6J2g6Ofd28%2BBMKGd%2FQAkLTUyCqIBAjr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMDkcIgGclsd6nQZSaKtwDNpwShvvlp4DUOJx99Npps%2FDEOSGm8U2jan0vFgcLa74JM%2BRIafGCAWGep9L8EVowbJsZVKqS1i4UaYU%2B9fyPhtdkASByXlWfKzQstigTX5wO%2BENt1KKU6b%2FTLlzKQv7u%2B7ikocgeXy06%2FYglVZisNiKGj9ijadMhEmwUGDRdKjHqWi29VfY63Gw82U9tsMHc%2FEQzQrWGBaoE2dqTadKkWhuOvDZ5QL0a2BMNKICPaX%2BW68Guab4f7DAWVum9XFd7FcmR6a9EoLu9C9qRYQI5rYFYoaY3BJwg4LMjbltao9faCVyh7MsHeob2naWEojplh1lTtPi25Mk4nRLf1uMkYwAPTAB2qEL9Olt1Sv3Jx7umYv8fYOrnV91%2FrBLNxPSa7EzzPtP865FPqUcicDelg6DqKtpF%2Fib%2BGtNXJSjpIoKslfgExnVdm5lAzQ6cro1zGUYq4LKUnZwmnE1ThpgW1laS8gW%2BC4Pz50ikjtdFOqJ6Tq%2FF7WIYGxh%2FzFqXyKlTXC0wE5qG0nnPZtuG4w3a%2BLO9aRuNhQsDRyr8VPnOR8IswxUUV3pQV9Y1n%2BW%2F3dkIDwYi7K7lLr2%2BzkAbYo8YqNi1WrZfo9hIrXb2Crup2S%2FNVch5bRj8q0asRs4w1p6szQY6pgGXhru3NK4Doi%2FZrBFKTRPpuSpc4KPQPkJLnz7%2FYt5xbj2U8RgjCsPS7p4ahVtncivU3hOJ4vxXn%2BDk3p4nAphNu4aNAfiyt%2FvtXPIpr6KBxUDc6dcKPD8F7wAzFUDURUgFxww17YggnSxF7N1Ep7v6lKuscUPk00D8r54Zj95k%2BEeP4W1FYVIFTRGcPoZcun0C0NgyYxsqYsQVNY1jEyfWclrV%2F57i&X-Amz-Signature=9e17952c171a1e609cbb9961b1d4ef65cb93cc151741b35bdecd926ce9679c27&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667MATGPNM%2F20260306%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260306T183051Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECIaCXVzLXdlc3QtMiJGMEQCIBgIHCzLUH%2B0Me2svO%2FgzryrPhnLjpWyhuU%2Fi0SKlerAAiBo7mJhKKEDvryd7%2BOfS6J2g6Ofd28%2BBMKGd%2FQAkLTUyCqIBAjr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMDkcIgGclsd6nQZSaKtwDNpwShvvlp4DUOJx99Npps%2FDEOSGm8U2jan0vFgcLa74JM%2BRIafGCAWGep9L8EVowbJsZVKqS1i4UaYU%2B9fyPhtdkASByXlWfKzQstigTX5wO%2BENt1KKU6b%2FTLlzKQv7u%2B7ikocgeXy06%2FYglVZisNiKGj9ijadMhEmwUGDRdKjHqWi29VfY63Gw82U9tsMHc%2FEQzQrWGBaoE2dqTadKkWhuOvDZ5QL0a2BMNKICPaX%2BW68Guab4f7DAWVum9XFd7FcmR6a9EoLu9C9qRYQI5rYFYoaY3BJwg4LMjbltao9faCVyh7MsHeob2naWEojplh1lTtPi25Mk4nRLf1uMkYwAPTAB2qEL9Olt1Sv3Jx7umYv8fYOrnV91%2FrBLNxPSa7EzzPtP865FPqUcicDelg6DqKtpF%2Fib%2BGtNXJSjpIoKslfgExnVdm5lAzQ6cro1zGUYq4LKUnZwmnE1ThpgW1laS8gW%2BC4Pz50ikjtdFOqJ6Tq%2FF7WIYGxh%2FzFqXyKlTXC0wE5qG0nnPZtuG4w3a%2BLO9aRuNhQsDRyr8VPnOR8IswxUUV3pQV9Y1n%2BW%2F3dkIDwYi7K7lLr2%2BzkAbYo8YqNi1WrZfo9hIrXb2Crup2S%2FNVch5bRj8q0asRs4w1p6szQY6pgGXhru3NK4Doi%2FZrBFKTRPpuSpc4KPQPkJLnz7%2FYt5xbj2U8RgjCsPS7p4ahVtncivU3hOJ4vxXn%2BDk3p4nAphNu4aNAfiyt%2FvtXPIpr6KBxUDc6dcKPD8F7wAzFUDURUgFxww17YggnSxF7N1Ep7v6lKuscUPk00D8r54Zj95k%2BEeP4W1FYVIFTRGcPoZcun0C0NgyYxsqYsQVNY1jEyfWclrV%2F57i&X-Amz-Signature=6b149f9a8662efdd50fc5032c0ca707abac1248923c577653c2af0a964c8c3fe&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
