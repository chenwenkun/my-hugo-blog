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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UT2WTQ2U%2F20260208%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260208T012927Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQC1uAi2z4RRNgSlPFsb0Sh51bDImgFFMCQj6bfx0opOoAIhAJQ4kr36mgH607xTA1vwpZf7ZIi9%2B%2BNihF0GfCn9UxoLKv8DCGoQABoMNjM3NDIzMTgzODA1Igw%2Fngp3uDaMi5PQqL4q3AP6JglLIFD0kp363gig00tVEha8gH9SqpRC3mpVqC%2BL%2B44vNhN%2BXRhBhJTOwnYQ%2FdAqCjCXZQeaq%2BQ3v0Y9iQrXXLMCS2Zuc6VtmtvS0V1ZenXDP2AijymM1XnCiF0fusqzRNVVx2Vyt8Z67ZvsJqsKnOHv%2FgIDAPuqPICZw7t0vu7LtS%2B4w0CYejODhJP1eWHcR4qgAO0f%2FWp6yYjYPWnwAJruYYi7YJ%2BxC%2BFcSje8gYUQJXC09KdX7Xfw%2B%2Bz4xK%2FqAVo7Ji8uOuIhazwVj%2BySJtmnfo4gugu5tNoqD4jrGFaEUyHTWV0W9qETN02QGAxgxho5gJc%2B%2BDdUJTN4jo5FofeItbS%2BLZwk8ufotnoSP0HVGcq5cQ%2BXJYuFzBfDaPcE9xB61WyttcUIB%2BtcvIY9OowUDUZg8VvTQyRKLjEYcLX3mwkRIcKBGoqjjN6lIqFuJEf2msLNOeuFaqyiwVyCiBSQSmV620RuE3FczfDIS%2B%2B3VOkHRQFdNQywlM779VKhoX9V0zWMkTIVshDoWn4Izq3N%2FdZQr5ZDnD4GBvRkWIF%2BZnlVDzu7wmRbg8KO0MczCNyR6TJmi1mueo1zji7i7eRjUmD3l%2FOWOL71bEXv7IbINhcxrSbUGjQQRzDvy5%2FMBjqkAfa6ry4Gg111ujSm9OhK1rHb81xd9LX5Wg8gU%2BLuoGmKr5kiHVJggQCSesq9xHIvq4TYHk94Q5XtbIeHPVZ%2BeU27X4P3FuD7TcdUhd6JzOD%2BmxnWCsWyQrAvn41rL40iMDnxURFZ6HsAYfw3dyz%2FntRyVwRGsC%2FyYvrUdH%2Bz%2BlKcmEMqphO80DbNEgBPvH3LiCT2L7By7oGF59dWSf7Ipt9jdi%2Fu&X-Amz-Signature=5f9dfc422a4bb6ad231e4740bb24cd4439f78104db0d5907930755e48762c4a4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UT2WTQ2U%2F20260208%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260208T012927Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQC1uAi2z4RRNgSlPFsb0Sh51bDImgFFMCQj6bfx0opOoAIhAJQ4kr36mgH607xTA1vwpZf7ZIi9%2B%2BNihF0GfCn9UxoLKv8DCGoQABoMNjM3NDIzMTgzODA1Igw%2Fngp3uDaMi5PQqL4q3AP6JglLIFD0kp363gig00tVEha8gH9SqpRC3mpVqC%2BL%2B44vNhN%2BXRhBhJTOwnYQ%2FdAqCjCXZQeaq%2BQ3v0Y9iQrXXLMCS2Zuc6VtmtvS0V1ZenXDP2AijymM1XnCiF0fusqzRNVVx2Vyt8Z67ZvsJqsKnOHv%2FgIDAPuqPICZw7t0vu7LtS%2B4w0CYejODhJP1eWHcR4qgAO0f%2FWp6yYjYPWnwAJruYYi7YJ%2BxC%2BFcSje8gYUQJXC09KdX7Xfw%2B%2Bz4xK%2FqAVo7Ji8uOuIhazwVj%2BySJtmnfo4gugu5tNoqD4jrGFaEUyHTWV0W9qETN02QGAxgxho5gJc%2B%2BDdUJTN4jo5FofeItbS%2BLZwk8ufotnoSP0HVGcq5cQ%2BXJYuFzBfDaPcE9xB61WyttcUIB%2BtcvIY9OowUDUZg8VvTQyRKLjEYcLX3mwkRIcKBGoqjjN6lIqFuJEf2msLNOeuFaqyiwVyCiBSQSmV620RuE3FczfDIS%2B%2B3VOkHRQFdNQywlM779VKhoX9V0zWMkTIVshDoWn4Izq3N%2FdZQr5ZDnD4GBvRkWIF%2BZnlVDzu7wmRbg8KO0MczCNyR6TJmi1mueo1zji7i7eRjUmD3l%2FOWOL71bEXv7IbINhcxrSbUGjQQRzDvy5%2FMBjqkAfa6ry4Gg111ujSm9OhK1rHb81xd9LX5Wg8gU%2BLuoGmKr5kiHVJggQCSesq9xHIvq4TYHk94Q5XtbIeHPVZ%2BeU27X4P3FuD7TcdUhd6JzOD%2BmxnWCsWyQrAvn41rL40iMDnxURFZ6HsAYfw3dyz%2FntRyVwRGsC%2FyYvrUdH%2Bz%2BlKcmEMqphO80DbNEgBPvH3LiCT2L7By7oGF59dWSf7Ipt9jdi%2Fu&X-Amz-Signature=24670c870601c7db4aae857bd7c1edf515d92ef9100080939c7871f6ca639b2b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
