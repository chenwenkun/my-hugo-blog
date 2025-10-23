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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TJJF4ILR%2F20251023%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251023T181608Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDCWO8DUCkQ8LD4qO1XWIikf%2BFZGfjKv7mEaPTWa46ckQIgG9W%2FEOqlha0wkOgcToQc3aSTinMbM4aU1PZ%2F6aeVH1Aq%2FwMISxAAGgw2Mzc0MjMxODM4MDUiDH7%2BChFaCxZXSZp%2BiSrcAxbUiYQteIONgsraEQ%2FIvM0KJVqgoVF%2Bv5oL7c1RmPx2TJ35wJ0Zy9sgN4KPbBNkgIqrYXHLh101UM03DwIovbC1tF7Vj7IF89YIAwlA06XGUr1cMqk4mrodkWosZ6z%2F%2F3qud0hZY25dN8vsMm%2Bq4fDUdb3DBBRbcrO3YMp4ttERV3kcrsryiG9zP3A2szinfQ4xqM8Umm4w2oEQnTUvM5NxDkz1SIIpKDkRODXIuTOuj%2B1Pms7%2B3EyVCuh7YOlOOtH9aBqqBVPEF3L5GhmRVPFnfcN09OILKWpqajghpAu%2FS53YlX8CGSQbza9WsM3rnttTaYgRxS7Xhppa4dlddXQgn6cTttGDRS0w8SiMVO6KF%2FhvG53HHz4T6ei%2BVnYmtX4jER83jiojm65AjFFvssi4lynEKYq9nii%2Fq%2BJNjUQCntiTLAaKFElJQ9JWf%2BxNC%2FYFxyZ%2F1KgQsRHGQawR123Mh8YQVvu0fwTQJF%2BRy%2BUW%2BHiubFVWor3NMk3lnQT7DVeWcWe%2FWoGDztYVp%2Fd%2FaXGruq8yylY3vWM08KhCrJimjOJws5q02S0QvzlxYH7VYZt2GwlqDkMUBFJ%2Bx3qo7VRW1yIAntC%2FvZCp8aZzo%2BgWIHyVzLh%2F6ebUDsfTMIrZ6ccGOqUBGvvEJjozeUL4e4m92vK8HWDJ4pB5ToQKicGaO9GjbV9Co9vhkFhCOSdWrtUF%2BDpceU0DcllnAtUuAbTiKobw8KobTVJAoPD62CvxOWyAR57%2BpADZ0gSaV%2FIoTSXkBjLUBrrVvFYKZDMvsLOjBWk9zMg2lTh5tH3I1dYnTyd1bMhZ59FlGEkirQFQ0oVd0a7RsePpH7ngPeLFXtDzmFeBRKN8YhGK&X-Amz-Signature=99d81340aa3c696a884c6b4436bd8d6cdac36faba398aa259d8c883659766796&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TJJF4ILR%2F20251023%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251023T181608Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDCWO8DUCkQ8LD4qO1XWIikf%2BFZGfjKv7mEaPTWa46ckQIgG9W%2FEOqlha0wkOgcToQc3aSTinMbM4aU1PZ%2F6aeVH1Aq%2FwMISxAAGgw2Mzc0MjMxODM4MDUiDH7%2BChFaCxZXSZp%2BiSrcAxbUiYQteIONgsraEQ%2FIvM0KJVqgoVF%2Bv5oL7c1RmPx2TJ35wJ0Zy9sgN4KPbBNkgIqrYXHLh101UM03DwIovbC1tF7Vj7IF89YIAwlA06XGUr1cMqk4mrodkWosZ6z%2F%2F3qud0hZY25dN8vsMm%2Bq4fDUdb3DBBRbcrO3YMp4ttERV3kcrsryiG9zP3A2szinfQ4xqM8Umm4w2oEQnTUvM5NxDkz1SIIpKDkRODXIuTOuj%2B1Pms7%2B3EyVCuh7YOlOOtH9aBqqBVPEF3L5GhmRVPFnfcN09OILKWpqajghpAu%2FS53YlX8CGSQbza9WsM3rnttTaYgRxS7Xhppa4dlddXQgn6cTttGDRS0w8SiMVO6KF%2FhvG53HHz4T6ei%2BVnYmtX4jER83jiojm65AjFFvssi4lynEKYq9nii%2Fq%2BJNjUQCntiTLAaKFElJQ9JWf%2BxNC%2FYFxyZ%2F1KgQsRHGQawR123Mh8YQVvu0fwTQJF%2BRy%2BUW%2BHiubFVWor3NMk3lnQT7DVeWcWe%2FWoGDztYVp%2Fd%2FaXGruq8yylY3vWM08KhCrJimjOJws5q02S0QvzlxYH7VYZt2GwlqDkMUBFJ%2Bx3qo7VRW1yIAntC%2FvZCp8aZzo%2BgWIHyVzLh%2F6ebUDsfTMIrZ6ccGOqUBGvvEJjozeUL4e4m92vK8HWDJ4pB5ToQKicGaO9GjbV9Co9vhkFhCOSdWrtUF%2BDpceU0DcllnAtUuAbTiKobw8KobTVJAoPD62CvxOWyAR57%2BpADZ0gSaV%2FIoTSXkBjLUBrrVvFYKZDMvsLOjBWk9zMg2lTh5tH3I1dYnTyd1bMhZ59FlGEkirQFQ0oVd0a7RsePpH7ngPeLFXtDzmFeBRKN8YhGK&X-Amz-Signature=f35a804de82ebef03045c58f0a6c81373e246b086718b04b816de6bf7dcc06af&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
