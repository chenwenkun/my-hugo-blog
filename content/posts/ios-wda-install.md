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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SK5ZVMSB%2F20260718%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260718T072540Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIF6pkDuODnQ%2FXy8GIQQA3vyTpJD55aN79erHNr972u51AiAvKSryeRr0DW6TymWuaVwral%2FmcAbUpGJFcYJrsPmzMCr%2FAwhwEAAaDDYzNzQyMzE4MzgwNSIM%2B7kyswR1bPADXowhKtwDgizKZJYEdZ3OjnhaM9nKlqzXsyGBFUVoGXq%2FbDXKtsp5fLnoyN5CNJ9Ux4%2BHaJe%2BUcQ4PYzLGqHDoYXUXLqnraq3w35oI%2F%2By7fMaFTG4u9T%2FHx2Zr6WgS6%2Fai8ep8xUdLqgGUmRSU%2Bx58518UFcdLbsv48n3n8f7CYnOHq7hAEY7EytB5%2Fq86Vu2X5RlaNtTWysxnYRAqutKahFoSRhoLHeoAMS%2FceO9kyefOCADSLYhWb2gs7TW0JdB6lk%2BuDNd8ssJJwELiSVmvQd5bhyJvX%2FWIFMQ5vOctgjTVCMuLblfn5N8jYZuEFDuILO6oAUcL10rNGw7X%2BGCYWUtm3YxjEdLiOhWLINL3mJte88aY6RCR4yvss5NLTCLVA6C3z0KnAs9WviiLD9AEusGfXO%2FHOwiXf0A6Ofn6BWVpLUlydk%2BPHqeEqHo9El8gbjco6gg02BOVJQeF7Aqu3G6E2%2FhDjv7WkpdbYZtvvR4h0Cxed1tC9TO%2FDiLeIDulGsclIFpEnQ7cOSEN%2F1NM6SvVuGOWEfp%2FKhtydsu3Oqd3sHbHZ8FBdZVi5TJxneZS2zIj64BTwVFwjJISNSSDmDsojU9y1s6iXceg30UJHavYRVhXlpRmmFO2M0yb3nslSswksXs0gY6pgE0SaHlvBzXssN6A%2BRASeaLbmcVcJEJtTl5pxBwpf9yfNXI7wwn%2BXGJc43CESZzC2KJUxgHnPDLuwf5CS8oVZumHi0tZPofTi%2B8Hn%2BWtcK9fNhIHoMtRvgKo5PsaU%2FHQvLgKbpDT41evDWRRnjdnSsnxjMIcSfsRq4J65gTy43VDkIu6er0J8ipF5gVVxLTNpWU9VeQaRQQDugBDlUtv4uASwe%2Fg5ET&X-Amz-Signature=697ba4da2f677eae81c9f2890800300535bf35301dd144b24bdcd98e07d38af3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SK5ZVMSB%2F20260718%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260718T072540Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIF6pkDuODnQ%2FXy8GIQQA3vyTpJD55aN79erHNr972u51AiAvKSryeRr0DW6TymWuaVwral%2FmcAbUpGJFcYJrsPmzMCr%2FAwhwEAAaDDYzNzQyMzE4MzgwNSIM%2B7kyswR1bPADXowhKtwDgizKZJYEdZ3OjnhaM9nKlqzXsyGBFUVoGXq%2FbDXKtsp5fLnoyN5CNJ9Ux4%2BHaJe%2BUcQ4PYzLGqHDoYXUXLqnraq3w35oI%2F%2By7fMaFTG4u9T%2FHx2Zr6WgS6%2Fai8ep8xUdLqgGUmRSU%2Bx58518UFcdLbsv48n3n8f7CYnOHq7hAEY7EytB5%2Fq86Vu2X5RlaNtTWysxnYRAqutKahFoSRhoLHeoAMS%2FceO9kyefOCADSLYhWb2gs7TW0JdB6lk%2BuDNd8ssJJwELiSVmvQd5bhyJvX%2FWIFMQ5vOctgjTVCMuLblfn5N8jYZuEFDuILO6oAUcL10rNGw7X%2BGCYWUtm3YxjEdLiOhWLINL3mJte88aY6RCR4yvss5NLTCLVA6C3z0KnAs9WviiLD9AEusGfXO%2FHOwiXf0A6Ofn6BWVpLUlydk%2BPHqeEqHo9El8gbjco6gg02BOVJQeF7Aqu3G6E2%2FhDjv7WkpdbYZtvvR4h0Cxed1tC9TO%2FDiLeIDulGsclIFpEnQ7cOSEN%2F1NM6SvVuGOWEfp%2FKhtydsu3Oqd3sHbHZ8FBdZVi5TJxneZS2zIj64BTwVFwjJISNSSDmDsojU9y1s6iXceg30UJHavYRVhXlpRmmFO2M0yb3nslSswksXs0gY6pgE0SaHlvBzXssN6A%2BRASeaLbmcVcJEJtTl5pxBwpf9yfNXI7wwn%2BXGJc43CESZzC2KJUxgHnPDLuwf5CS8oVZumHi0tZPofTi%2B8Hn%2BWtcK9fNhIHoMtRvgKo5PsaU%2FHQvLgKbpDT41evDWRRnjdnSsnxjMIcSfsRq4J65gTy43VDkIu6er0J8ipF5gVVxLTNpWU9VeQaRQQDugBDlUtv4uASwe%2Fg5ET&X-Amz-Signature=fafaddc587abbf931e560ce44975269f261654bbdc02cb488695244ea5f97428&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
