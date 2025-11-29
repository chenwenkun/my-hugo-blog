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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SKLFAQXQ%2F20251129%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251129T122001Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAMaCXVzLXdlc3QtMiJGMEQCIGZPwYSh8it%2BjXL7q4qy0eADvcZG0OaWwP8uDozNEgGSAiBNa%2FOOUmLCRpxB5pX0u9JV27zYJEtiR9oJICtckEUpJiqIBAjL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMyL7Q5YMMQRshy33FKtwDJQmC%2FlAay9imBn4EIJA67zeeH5r9QfbdCialqmpXUxS3JMXdQGGszfUhpX4Iuvotnil6eHODfeT12%2BUrxKSMfO7wZyoduFNTMcBxQYtDLERWEy%2BbwmS6MWDGdbEvl0WPiZH7ASnDLeV1gvoJdKYM1w%2B%2FAHzpIGO0K9fl9XnSefN3ZnRQnqm0OW8u8aOWdCjtgnc3ZqfcaQyAXv7spSDqOPdQsinH3idVZdv9iq15KFrxf%2FjLz4Xg6FM9iWvnnteoUWn4f8xBgzoCoOg0dHZ5jb5OOtLUIu4duW%2FbPTjrtEd%2BagaJAYDfLje2czVxhCfwgAqFlPRuh1vKND63UWqEUYx9l1mPu%2BNfY3DU6mTy1503eT%2FCwrJu0BSRi5va04hA%2FTNAaqCi6hl12QGo%2FAub5KKVcQ4kZOIywX2g1YrKj4NZm6BONN5XB4%2Fb3b1b7rTUh3dXNH2Pqho8M3ZgYLGrwYCfYwk5OppXie1p53nJCpcdBcuNl1bMG47YzvuvJ5mNG4beslR8rMISl9IUsnx4jNM3G6lJW%2BjfzVy4oAM1amY%2FnPSPzK%2BEfD1l%2BHoAxaJK%2BX6wQtfqxjyGjGWsxfR5f%2B8fcXGZlStpiswaMDpmu%2FqItv0pXVeM25JF1JYwuJOryQY6pgGeSKiYwDQ3FKiJQHk1819Kk%2FWgMXcSPUfCAzyvU587%2BjG%2FGYnnLR8kUs%2FMYbdSJHP9Y9VPMu9XaRuLKjSxbH4wVADbTO0coe3nSLOXPQjD2flIiGPAUQDH%2B%2FIyGvXwIMFfeIrAjVFop3d1Ti%2FZMgCuAXDmt%2FMAJI3oDuzTRlYzewxm832FjcvQJHqgbzWtEkBhGe7kZIgZrXYyuIaAhXU78JpBB1aS&X-Amz-Signature=37d9c549429935d990b60a19957ae7e4ffac8ebc34ae4cd78b4dd8fe5e9dd9a4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SKLFAQXQ%2F20251129%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251129T122001Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAMaCXVzLXdlc3QtMiJGMEQCIGZPwYSh8it%2BjXL7q4qy0eADvcZG0OaWwP8uDozNEgGSAiBNa%2FOOUmLCRpxB5pX0u9JV27zYJEtiR9oJICtckEUpJiqIBAjL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMyL7Q5YMMQRshy33FKtwDJQmC%2FlAay9imBn4EIJA67zeeH5r9QfbdCialqmpXUxS3JMXdQGGszfUhpX4Iuvotnil6eHODfeT12%2BUrxKSMfO7wZyoduFNTMcBxQYtDLERWEy%2BbwmS6MWDGdbEvl0WPiZH7ASnDLeV1gvoJdKYM1w%2B%2FAHzpIGO0K9fl9XnSefN3ZnRQnqm0OW8u8aOWdCjtgnc3ZqfcaQyAXv7spSDqOPdQsinH3idVZdv9iq15KFrxf%2FjLz4Xg6FM9iWvnnteoUWn4f8xBgzoCoOg0dHZ5jb5OOtLUIu4duW%2FbPTjrtEd%2BagaJAYDfLje2czVxhCfwgAqFlPRuh1vKND63UWqEUYx9l1mPu%2BNfY3DU6mTy1503eT%2FCwrJu0BSRi5va04hA%2FTNAaqCi6hl12QGo%2FAub5KKVcQ4kZOIywX2g1YrKj4NZm6BONN5XB4%2Fb3b1b7rTUh3dXNH2Pqho8M3ZgYLGrwYCfYwk5OppXie1p53nJCpcdBcuNl1bMG47YzvuvJ5mNG4beslR8rMISl9IUsnx4jNM3G6lJW%2BjfzVy4oAM1amY%2FnPSPzK%2BEfD1l%2BHoAxaJK%2BX6wQtfqxjyGjGWsxfR5f%2B8fcXGZlStpiswaMDpmu%2FqItv0pXVeM25JF1JYwuJOryQY6pgGeSKiYwDQ3FKiJQHk1819Kk%2FWgMXcSPUfCAzyvU587%2BjG%2FGYnnLR8kUs%2FMYbdSJHP9Y9VPMu9XaRuLKjSxbH4wVADbTO0coe3nSLOXPQjD2flIiGPAUQDH%2B%2FIyGvXwIMFfeIrAjVFop3d1Ti%2FZMgCuAXDmt%2FMAJI3oDuzTRlYzewxm832FjcvQJHqgbzWtEkBhGe7kZIgZrXYyuIaAhXU78JpBB1aS&X-Amz-Signature=8b5f8ab498c416fe9946f9ce86fac239083253aeb1eb4ffde608b4e10e440ef4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
