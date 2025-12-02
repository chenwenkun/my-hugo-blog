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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UZ22SZKT%2F20251202%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251202T181838Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFIaCXVzLXdlc3QtMiJHMEUCIQDY90ZOYh5%2FjZFxS9UqD5zsqOvBHAiUlCFb8QiEbK6r1wIgRkN4GlbhgOyH8Sk9ShFULpNQiiMgvSeWI0MGYEgavEAq%2FwMIGxAAGgw2Mzc0MjMxODM4MDUiDKv20eomegv%2BMsB7VyrcA%2BedD09UsWB6P%2BSucVpzMZ7Wh1S5%2BnLhYk2IzBn8c1s%2FKXxH8m7LgOJ0xfotMSVrjQ3IgWBpQi92u6ZPTDOC%2BzRGtOKL7j%2B5EoQ9RrpwG1lsU2BgtDpLI00Ows0IJkf6Iagr%2FaWMCusxI9knzyUIaB9vqK9fNJed0nzIFAAyju4bm8eNAJN5RoFLkjoevZB9611FOBzxg9PdiAvgLumdFgwZGGAjfoMx7a20ybXCNtstCzg0hBtmYMTmYubIB7wjb8PDwxWzT2CNdgZjd6keW70ulsyrVddql7UqW4ZH8dg7JdyLbO%2FHwUBFlrDPABoZ2mXvH4XQWnBHb0QFTnSE3NiHaWPfhQMdaFqptcCPfWtLGfj%2BY%2FpF%2FfeINVTgGIkKt8996bBxRF1DCnCrzIoN5vf4R2QGjo3Zo%2FES97VL2FtImUIAIjITNkGJ3Q4idafz47Xxcq%2F%2FZo%2BdZVP1tpshyeKNxiVnQJ9p%2BIopHJ%2BZVGFUEcHlrkxMzwLkv79ypbGeuQ7cCLO2tufteAu7IOfPQK29d%2BsRY2SsylTi%2FQVblk7AugyBSm1vjQOv9gS3lusu%2FNTcKZmDmYm7Fyf%2FfIqk5Fg6o32%2FvSLtTm0S4wak8Fgo4d1skaW4E9EGCNCyMJnSvMkGOqUBHWI0huUezFP7Fhau9P%2BpKJ68ExTF3L6pXPnKoYe%2BZAZvmQJExh7GLIFRiyqvgDZRwY6pUwBj3viG9n3eLY9ZWECopVvqaNHWEA%2Bm7slj5SD0RsDp8aTVAqo2jqIWuJFJHQWT9YOKdI%2Fim3hYf%2B4%2FfkW8D9YBfcXzjyckA9Ukj7o65a0dAxe8s7Vn8epaR%2FZhixKvU%2Fw2nLRn9T94ylkbf8G6HXQB&X-Amz-Signature=64deb762f7565e7526f53fc19985c9c2ea97005ad6fe6f34b83c894769345a80&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UZ22SZKT%2F20251202%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251202T181838Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFIaCXVzLXdlc3QtMiJHMEUCIQDY90ZOYh5%2FjZFxS9UqD5zsqOvBHAiUlCFb8QiEbK6r1wIgRkN4GlbhgOyH8Sk9ShFULpNQiiMgvSeWI0MGYEgavEAq%2FwMIGxAAGgw2Mzc0MjMxODM4MDUiDKv20eomegv%2BMsB7VyrcA%2BedD09UsWB6P%2BSucVpzMZ7Wh1S5%2BnLhYk2IzBn8c1s%2FKXxH8m7LgOJ0xfotMSVrjQ3IgWBpQi92u6ZPTDOC%2BzRGtOKL7j%2B5EoQ9RrpwG1lsU2BgtDpLI00Ows0IJkf6Iagr%2FaWMCusxI9knzyUIaB9vqK9fNJed0nzIFAAyju4bm8eNAJN5RoFLkjoevZB9611FOBzxg9PdiAvgLumdFgwZGGAjfoMx7a20ybXCNtstCzg0hBtmYMTmYubIB7wjb8PDwxWzT2CNdgZjd6keW70ulsyrVddql7UqW4ZH8dg7JdyLbO%2FHwUBFlrDPABoZ2mXvH4XQWnBHb0QFTnSE3NiHaWPfhQMdaFqptcCPfWtLGfj%2BY%2FpF%2FfeINVTgGIkKt8996bBxRF1DCnCrzIoN5vf4R2QGjo3Zo%2FES97VL2FtImUIAIjITNkGJ3Q4idafz47Xxcq%2F%2FZo%2BdZVP1tpshyeKNxiVnQJ9p%2BIopHJ%2BZVGFUEcHlrkxMzwLkv79ypbGeuQ7cCLO2tufteAu7IOfPQK29d%2BsRY2SsylTi%2FQVblk7AugyBSm1vjQOv9gS3lusu%2FNTcKZmDmYm7Fyf%2FfIqk5Fg6o32%2FvSLtTm0S4wak8Fgo4d1skaW4E9EGCNCyMJnSvMkGOqUBHWI0huUezFP7Fhau9P%2BpKJ68ExTF3L6pXPnKoYe%2BZAZvmQJExh7GLIFRiyqvgDZRwY6pUwBj3viG9n3eLY9ZWECopVvqaNHWEA%2Bm7slj5SD0RsDp8aTVAqo2jqIWuJFJHQWT9YOKdI%2Fim3hYf%2B4%2FfkW8D9YBfcXzjyckA9Ukj7o65a0dAxe8s7Vn8epaR%2FZhixKvU%2Fw2nLRn9T94ylkbf8G6HXQB&X-Amz-Signature=5ae39a889659165e277ed28fbe410797e8cefa1287dcaae702a01af13b8af788&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
