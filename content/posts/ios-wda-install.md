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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VQ3XYBJ6%2F20260131%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260131T062550Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDU0ty8lWM3AcpqNDAsucYq%2FxWMoq0DTa82o2JvhJBN7QIhAK%2FVpiroT%2BKDInAOjYjeN2L4ER7osggRliFFh3FCvhfjKogECK7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgydzpWpZ%2F12FSoyiTEq3AMnwX1AFyTGsuGzD8UBX0SJhkF8iXiCcQNGM0Rx71YQb1EFxNz4hB0Yu%2BPbGs0s1zUflvLdQz5b%2FLk0gFxeH7P6UxjfIi0yA2WrIuHUUJVDl8Ef44n8C48aZMD5S2J9crKPnjgM%2FaUmwNQJajBqzztXYJzcRq2jvmtz4wMG4BU22fObT%2FDOwZCIhe%2B3rml8kQVB8Z9YNELWH7%2Bs5FRB%2F9V2NBjvucvBRVCBRJzJ4jfpBS7kAoo7%2FhDyaqrU5ku1dOoVAZ6uSSPqvMhvI02sImJFJot9%2BIqEEKR6%2BCqXmPEhnej4ZXQrvIhzEgn%2FytsrcjjDb4X6%2F6LGzrB2Jka2e6AzRwh%2BOwUxSKCicv5TGyeqxv4J%2FlClK%2FWPyO%2F7S6R0BvhkOaYMdt%2BGgelqZ1j0Z0%2BezR%2BSji0N4sMA9hKVaPkQ6gfhKtkBLyXPzD2Ql02L4U8Ah1IMWKlpJK3QwZ2xkAcLmlApb5z0UnSaWaNt7Vh8i%2FQ2lUdc3bWOhgAMrGT%2BxTBds7SUIbU2cZNknwvIo7aXHxJBgr8rEjKN6RSJYfMLnR69OIUpcywe%2FWqftoVt5zMn3hujp8UwcvW4jvJQH5tj8JH3Zw8aVA9M0NVkDC0R1ROnGKhbVhdf1Uo0EDDgmPbLBjqkAT68%2FceZJuhTLy6hiGoH1Qnj4fo7isS7RGNkel7FkM1hDznHwvIyYn4DqrT%2B62Dfbf6f1dVm8akX85DutkhoDIc572JUOKDnQsMeQA3SNVlYYR%2B36EUC2fjjeNGn6WCr47OAtoFC4DdS0P43i7cK40XeBWGNMm9xTLwPXMZjt3JHkIhBeeu76JLaa1PXn0oxLlirsK%2FRHKpkzrNW7%2ByjI9Vrjvri&X-Amz-Signature=50a552ba647d9d1ccf9c950182685701d9692df2752a3665bf3490664670ecde&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VQ3XYBJ6%2F20260131%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260131T062550Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDU0ty8lWM3AcpqNDAsucYq%2FxWMoq0DTa82o2JvhJBN7QIhAK%2FVpiroT%2BKDInAOjYjeN2L4ER7osggRliFFh3FCvhfjKogECK7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgydzpWpZ%2F12FSoyiTEq3AMnwX1AFyTGsuGzD8UBX0SJhkF8iXiCcQNGM0Rx71YQb1EFxNz4hB0Yu%2BPbGs0s1zUflvLdQz5b%2FLk0gFxeH7P6UxjfIi0yA2WrIuHUUJVDl8Ef44n8C48aZMD5S2J9crKPnjgM%2FaUmwNQJajBqzztXYJzcRq2jvmtz4wMG4BU22fObT%2FDOwZCIhe%2B3rml8kQVB8Z9YNELWH7%2Bs5FRB%2F9V2NBjvucvBRVCBRJzJ4jfpBS7kAoo7%2FhDyaqrU5ku1dOoVAZ6uSSPqvMhvI02sImJFJot9%2BIqEEKR6%2BCqXmPEhnej4ZXQrvIhzEgn%2FytsrcjjDb4X6%2F6LGzrB2Jka2e6AzRwh%2BOwUxSKCicv5TGyeqxv4J%2FlClK%2FWPyO%2F7S6R0BvhkOaYMdt%2BGgelqZ1j0Z0%2BezR%2BSji0N4sMA9hKVaPkQ6gfhKtkBLyXPzD2Ql02L4U8Ah1IMWKlpJK3QwZ2xkAcLmlApb5z0UnSaWaNt7Vh8i%2FQ2lUdc3bWOhgAMrGT%2BxTBds7SUIbU2cZNknwvIo7aXHxJBgr8rEjKN6RSJYfMLnR69OIUpcywe%2FWqftoVt5zMn3hujp8UwcvW4jvJQH5tj8JH3Zw8aVA9M0NVkDC0R1ROnGKhbVhdf1Uo0EDDgmPbLBjqkAT68%2FceZJuhTLy6hiGoH1Qnj4fo7isS7RGNkel7FkM1hDznHwvIyYn4DqrT%2B62Dfbf6f1dVm8akX85DutkhoDIc572JUOKDnQsMeQA3SNVlYYR%2B36EUC2fjjeNGn6WCr47OAtoFC4DdS0P43i7cK40XeBWGNMm9xTLwPXMZjt3JHkIhBeeu76JLaa1PXn0oxLlirsK%2FRHKpkzrNW7%2ByjI9Vrjvri&X-Amz-Signature=0f9f6d3f2dae6c925c5ead963549c6fba687b6878389bc24e0d230806058bc76&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
