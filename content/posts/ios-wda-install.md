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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SAU2TN2G%2F20251219%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251219T061830Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCs5i%2Fa3kSeXzI2NhYoLdwAmT66lcaKUWdAs86uTcsHZQIhAMUWOVYS2htp7QFlQhcKQKgUQ2%2FSpfAAYfBlNtuc16nOKogECKf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgyKrPfXy%2FD%2BVCKfAUcq3AN2IC9OkYZrgux%2B3%2FqP0xU4%2F2Ka51xbcdoTu3DDewE5%2FbNyzIHD0jZMYmh48KhBuphq4f%2FgmMY4YDHFO7663qMh0iAFicZ%2BRSZMGOQFzZfoWZNuYtf6HHALxioq2W0hf21AXCGh44T%2FoUYIC7imxQxphcvQaS1ihyp4bhbr4H3W9LsSGIt9IpcanfCqtcBmrj9qECYg0ZZLtdXhKd3KjBL50HiCLcll7a25Q8QE6PSSJle56gdjDHjMjbw9A2lfnfB5LMa2EcihOByxLS0yCrgbaBGEpfHehKf1i4aNHlhqTpRjn%2FIFTY94t3wkaL4pRf4ZTcDM%2FPwIUZ88mD34MoVUFJl7GALRRUldZY1BBpZw6%2F2a4QSd4PB%2F0t8OvfKgM7OfE9Nj9IrunUVmA1oR64JsIJVAEyJ2E1TtL6hJ5bP9BJLp6WG0vy0A5fkQEkcaobxWSgyIxMh1T9VXRHlxvW3WBPeR%2BjJhaI%2FMLX1SFjUmV735OZj8sZpRRrB%2BHHBuDcz8J2cv0SbCOkmWGy3PIzrMkl23rHXI14Ap9BSZ7eHwV2kjLZycC%2FB1wWV43oYKv68ym3xmBpjHHeYGBarDGDGqIC0mpSGTYQLnY%2BFImXw1ccl8sDZMG%2Byfpn4MLTDUy5PKBjqkAbKWguwQJmMeVw%2BZ1cdJwzSy9%2BDILgTp8sbj5tpLPbS6foP%2FsKoroIHb5G93xr553ITEAgdeo6Uwh9Qe4iiUG3nOXx66dZ7taJS%2BunPm6TEyCurHu65IMv%2Bteu13P94jkoB8UkIPN0DcP6koHtZhoLWFYyF8SPg96C8QRuyTFhAUDla2wuwITPLVmgBuA9BCxjHzT6xefQir%2BdN22vnitNS3ugIm&X-Amz-Signature=8bb26f423c046eebe81b7083330140f1a2856f9113bd571170dc42f0eb389ae7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SAU2TN2G%2F20251219%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251219T061830Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCs5i%2Fa3kSeXzI2NhYoLdwAmT66lcaKUWdAs86uTcsHZQIhAMUWOVYS2htp7QFlQhcKQKgUQ2%2FSpfAAYfBlNtuc16nOKogECKf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgyKrPfXy%2FD%2BVCKfAUcq3AN2IC9OkYZrgux%2B3%2FqP0xU4%2F2Ka51xbcdoTu3DDewE5%2FbNyzIHD0jZMYmh48KhBuphq4f%2FgmMY4YDHFO7663qMh0iAFicZ%2BRSZMGOQFzZfoWZNuYtf6HHALxioq2W0hf21AXCGh44T%2FoUYIC7imxQxphcvQaS1ihyp4bhbr4H3W9LsSGIt9IpcanfCqtcBmrj9qECYg0ZZLtdXhKd3KjBL50HiCLcll7a25Q8QE6PSSJle56gdjDHjMjbw9A2lfnfB5LMa2EcihOByxLS0yCrgbaBGEpfHehKf1i4aNHlhqTpRjn%2FIFTY94t3wkaL4pRf4ZTcDM%2FPwIUZ88mD34MoVUFJl7GALRRUldZY1BBpZw6%2F2a4QSd4PB%2F0t8OvfKgM7OfE9Nj9IrunUVmA1oR64JsIJVAEyJ2E1TtL6hJ5bP9BJLp6WG0vy0A5fkQEkcaobxWSgyIxMh1T9VXRHlxvW3WBPeR%2BjJhaI%2FMLX1SFjUmV735OZj8sZpRRrB%2BHHBuDcz8J2cv0SbCOkmWGy3PIzrMkl23rHXI14Ap9BSZ7eHwV2kjLZycC%2FB1wWV43oYKv68ym3xmBpjHHeYGBarDGDGqIC0mpSGTYQLnY%2BFImXw1ccl8sDZMG%2Byfpn4MLTDUy5PKBjqkAbKWguwQJmMeVw%2BZ1cdJwzSy9%2BDILgTp8sbj5tpLPbS6foP%2FsKoroIHb5G93xr553ITEAgdeo6Uwh9Qe4iiUG3nOXx66dZ7taJS%2BunPm6TEyCurHu65IMv%2Bteu13P94jkoB8UkIPN0DcP6koHtZhoLWFYyF8SPg96C8QRuyTFhAUDla2wuwITPLVmgBuA9BCxjHzT6xefQir%2BdN22vnitNS3ugIm&X-Amz-Signature=6f4138bdf91dabe710ab3f3cff47ea3228992cc7787a3513b7f42bbd7f9b3591&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
