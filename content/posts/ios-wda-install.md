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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466W2SMD5LC%2F20260301%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260301T181944Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDw88bn84TvD53iE49z8fjnbokbDLbmreJQ5h0AEARfogIgQimltva0SWD8YtvkZPaJMLjqxtLlJ3t5Tz4G6voTd2Qq%2FwMIbxAAGgw2Mzc0MjMxODM4MDUiDJxptuJA8YmjK6nkFyrcAzKQZe3rvMn3oGD6ED%2BDvkZ%2BBO3mHsYZKzIgBriO%2Be8ICOnz2MWKXNil1vaYxsXyC6Q%2FnNPbst1G1j0UWP8MWXbq5rdaVd%2FnYBLPjyvkSuM2F9tlB%2BRPlIo8U7JUb%2FwaR%2FIP2vEs7%2BAg96K489t%2F9Vefy38JxhZ5UnTVUkwKz%2B0uF7lLtm%2BdpPEhcrnk9un%2BilP2MxWjR6gDnQnNg34fPE9aIaZZ1HJdqZpRs4lLDdSdCzfX14kJUdx9qZQ%2FrZCZzp3IaEfV3iLE5y2gV%2Bk3Lx95mnihwoidaJyew6bsXEioV0IOiv14j%2FMaY3kx4dQvslETZaWQENZmlSZiYvgFGglc1WEBTBAO8VxDqVtAnm3xn4W0m2LtdC0weOl6H4igqwzNWftr8HGWIOHKMWE95Qsc83P3taCaoU3HoBpV2Y1P6AzxwCLwRQz5xBNjBO3CRHjUGz6YYqtWDOYqRuu7Nk%2BRmXbyIn3yirNU84fpVhGOT3dYi3N%2FwCQRJR4NHc3D14Gu97peCdYiay%2FtAu71vCUOsxWteKvd9EDE2nB35WGm%2FX1Wl3FSJOIO%2BqGiu3LHNyXRqrMLlvTmpKaU0Bu%2FZHJ%2Fy54KD2VzZMIC3se2xceDJ2OAMdUNeacLWdBZMJSQkc0GOqUBnf2cPOPSAb4BVTcDodZ4ZNRBY5j8JwzX9mZMH4QpEI%2BKU82gqY8PF%2Fa99dcWbsGeZn7YhT%2FtCibQ%2BvbOQoClFaAMm5kmJuJOnhYYfNM0L7gfxsB%2FWlCZnCcyhIvze6SfnQeuUtkdNgSao6%2FCKZOPJuObNOWJlZX%2FQ7bQefi%2FsfKXbTuihpbqeYFvWNLcNlgI8%2FSd7%2BMwpB%2BngY%2F2qeLjeX8vthNH&X-Amz-Signature=de8a0ddc573cdad5cbc61369b1bd7ad7c7b10d6742f893d73e744dd582555de2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466W2SMD5LC%2F20260301%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260301T181944Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDw88bn84TvD53iE49z8fjnbokbDLbmreJQ5h0AEARfogIgQimltva0SWD8YtvkZPaJMLjqxtLlJ3t5Tz4G6voTd2Qq%2FwMIbxAAGgw2Mzc0MjMxODM4MDUiDJxptuJA8YmjK6nkFyrcAzKQZe3rvMn3oGD6ED%2BDvkZ%2BBO3mHsYZKzIgBriO%2Be8ICOnz2MWKXNil1vaYxsXyC6Q%2FnNPbst1G1j0UWP8MWXbq5rdaVd%2FnYBLPjyvkSuM2F9tlB%2BRPlIo8U7JUb%2FwaR%2FIP2vEs7%2BAg96K489t%2F9Vefy38JxhZ5UnTVUkwKz%2B0uF7lLtm%2BdpPEhcrnk9un%2BilP2MxWjR6gDnQnNg34fPE9aIaZZ1HJdqZpRs4lLDdSdCzfX14kJUdx9qZQ%2FrZCZzp3IaEfV3iLE5y2gV%2Bk3Lx95mnihwoidaJyew6bsXEioV0IOiv14j%2FMaY3kx4dQvslETZaWQENZmlSZiYvgFGglc1WEBTBAO8VxDqVtAnm3xn4W0m2LtdC0weOl6H4igqwzNWftr8HGWIOHKMWE95Qsc83P3taCaoU3HoBpV2Y1P6AzxwCLwRQz5xBNjBO3CRHjUGz6YYqtWDOYqRuu7Nk%2BRmXbyIn3yirNU84fpVhGOT3dYi3N%2FwCQRJR4NHc3D14Gu97peCdYiay%2FtAu71vCUOsxWteKvd9EDE2nB35WGm%2FX1Wl3FSJOIO%2BqGiu3LHNyXRqrMLlvTmpKaU0Bu%2FZHJ%2Fy54KD2VzZMIC3se2xceDJ2OAMdUNeacLWdBZMJSQkc0GOqUBnf2cPOPSAb4BVTcDodZ4ZNRBY5j8JwzX9mZMH4QpEI%2BKU82gqY8PF%2Fa99dcWbsGeZn7YhT%2FtCibQ%2BvbOQoClFaAMm5kmJuJOnhYYfNM0L7gfxsB%2FWlCZnCcyhIvze6SfnQeuUtkdNgSao6%2FCKZOPJuObNOWJlZX%2FQ7bQefi%2FsfKXbTuihpbqeYFvWNLcNlgI8%2FSd7%2BMwpB%2BngY%2F2qeLjeX8vthNH&X-Amz-Signature=bb36de92d71bf13fa6d5abf5e4aceb7772b61e61d0bbb8746d850ae13e77258c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
