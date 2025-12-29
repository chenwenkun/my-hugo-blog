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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TRFROPMM%2F20251229%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251229T010152Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIEgwkcWzmIo%2BVDdXAq0WWnKAqESW%2BTK8sB%2FGdie7h8gdAiArWU73mcGUOY5u6pg%2F8Zl82hPflff2nEdZgzkRGA9QmyqIBAiS%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMJdK8fbRy%2F8%2BCxHwgKtwDWMo40DpilrH83EgDodwYjSDFzhdsH8NVXixwkSUllc2R9TaZOwLVGmzmE6zjTr0wEVdH15aQihrS5WNe3CtUO7vNz%2Flf5b4SZmfT68Lfn9AWdvQJfsJqb1IuiK88%2F5eku%2BBa55CF8%2BO0nItaFXqdi7cebICRJwiGhS7scDBUo7vghYkuEGZW64eHeGrg47JeZ5wI%2BknzcW%2BRg6xh%2FCymjVZgl0NFIKbGAo7eid2Usa8RIqXo9fqL01PE9MSvu29%2FzcNa1Fls%2FsrArSnXMmVkXcS%2FYFzM8pvohwsjD1ITFfGXJgjkQuB1BdgiPWpG0q21ThClasvpa1G7BP18ng9w6bRhwrq9vtr3VsI%2BDkb4wFjM58iDxwfhVntV6VYf1RhZVAMMkxMalBuWE41uFz3GVxA6Um2Ip%2BY4T3Fak%2Fyjwv%2FMmP%2FL9GUx6XxXy%2FnLx28KRs7yPaZ68S6eoOyTsiISLJfbTgvC8CGYhyUtwtz%2BUsoqjnHBJ0M8DEs0GMrZQ2bcNrNAX0OSN2JCA2JZmjamx3w3kNaQC5UUL2%2F9sgeY8twK%2F04bjqV2PtJjVIorm0MnUyHwua15euvDo3zcRkn9qIyAc%2BNw62ZeKBnuM0jeXgY9kG5tR1Vi1pfQ58owi6THygY6pgHL9L0MuDNYk2QXM9YSOllDUrlD53lkho4ozR0kp3X5XL8v90Iie0wM6%2Br7d21gphtbGna2KMKeG7vu0iANeXqLmilyFgK3G39vu%2BuOp1PK18MlbJ9QZyqounwN5OkoTUmwM6V6IcQEyCMU7vVrM5BJddBvbislx%2BehvXQchqZ7ssRTq0tSwNx3%2BypdNFNZsNjEgng3ZrlfU41omAARycPjtheDqvvv&X-Amz-Signature=b2e2edd9ec91a6acff7400d9133af896c3534384f285d3e1d8dfbd96150a3329&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TRFROPMM%2F20251229%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251229T010152Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIEgwkcWzmIo%2BVDdXAq0WWnKAqESW%2BTK8sB%2FGdie7h8gdAiArWU73mcGUOY5u6pg%2F8Zl82hPflff2nEdZgzkRGA9QmyqIBAiS%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMJdK8fbRy%2F8%2BCxHwgKtwDWMo40DpilrH83EgDodwYjSDFzhdsH8NVXixwkSUllc2R9TaZOwLVGmzmE6zjTr0wEVdH15aQihrS5WNe3CtUO7vNz%2Flf5b4SZmfT68Lfn9AWdvQJfsJqb1IuiK88%2F5eku%2BBa55CF8%2BO0nItaFXqdi7cebICRJwiGhS7scDBUo7vghYkuEGZW64eHeGrg47JeZ5wI%2BknzcW%2BRg6xh%2FCymjVZgl0NFIKbGAo7eid2Usa8RIqXo9fqL01PE9MSvu29%2FzcNa1Fls%2FsrArSnXMmVkXcS%2FYFzM8pvohwsjD1ITFfGXJgjkQuB1BdgiPWpG0q21ThClasvpa1G7BP18ng9w6bRhwrq9vtr3VsI%2BDkb4wFjM58iDxwfhVntV6VYf1RhZVAMMkxMalBuWE41uFz3GVxA6Um2Ip%2BY4T3Fak%2Fyjwv%2FMmP%2FL9GUx6XxXy%2FnLx28KRs7yPaZ68S6eoOyTsiISLJfbTgvC8CGYhyUtwtz%2BUsoqjnHBJ0M8DEs0GMrZQ2bcNrNAX0OSN2JCA2JZmjamx3w3kNaQC5UUL2%2F9sgeY8twK%2F04bjqV2PtJjVIorm0MnUyHwua15euvDo3zcRkn9qIyAc%2BNw62ZeKBnuM0jeXgY9kG5tR1Vi1pfQ58owi6THygY6pgHL9L0MuDNYk2QXM9YSOllDUrlD53lkho4ozR0kp3X5XL8v90Iie0wM6%2Br7d21gphtbGna2KMKeG7vu0iANeXqLmilyFgK3G39vu%2BuOp1PK18MlbJ9QZyqounwN5OkoTUmwM6V6IcQEyCMU7vVrM5BJddBvbislx%2BehvXQchqZ7ssRTq0tSwNx3%2BypdNFNZsNjEgng3ZrlfU41omAARycPjtheDqvvv&X-Amz-Signature=9555002bc438376cd6f13d98bdd70b72f467033b0e4e2b09215b853978844622&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
