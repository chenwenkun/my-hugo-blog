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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UEW7PXSN%2F20260410%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260410T012254Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFkaCXVzLXdlc3QtMiJHMEUCIQDgb%2FUcCMQYpL6DgdGAxv2kclSc8tw6QTVEy2OkQAo5SwIgGWxGakGDoSwefq5t2GQGY9SzMe8GkIIu%2Bita6UYPnlAq%2FwMIIhAAGgw2Mzc0MjMxODM4MDUiDGoEmVRayNpkMGOWxSrcA1rkmULBgw81KYtjCO61Uz1Xpb%2B0Ssyj%2FUMsluuIcj5QWuMfW8CX93eeSzKsImzWVYEiUAmw2ucy4ehX9k%2BCs3e%2FdG0nIqWDXUbXR0mkNWA5spcWKkaK123c4x5vN%2F2tPo691CSio%2B9WO8rklW0hEPpjB1PSzrC0fYqdc36GFHKu%2FgE5pt%2Fx88wMrvg9jku5HJKdD3dzNzp%2BFcAUg19YUuRLpEOPiMYWtm3jnUX%2FzWZWMCHi8qDt39%2Fi5Z1aebb%2Fifqhj2Fv92jRElrdX%2F7ZziDJstPNj0ePr25W3FjFXAAAe3jW%2BSml0rd8yPRPCh7lHsz0TWYjJFVtGMTzlMmT3qA7x8VTD3WCc5qCLN2nbWs4WFUcZfJ94HVfDkpmob7ihU4N1boT6bmMhY0peGjZpRhViezBRJZGJk3SSuwqqOj475q6U1eO3L3E8aQga89q4Ph3I%2B6PFuhOQbfYn%2Fbhuu24NoyeOwkmWyc4Lg5omc4pPiLjTXL8AasdUwKesFpvtH1bqnsvy%2BFdFVKO0pFx6XvyftX%2FYe%2FLULbNnbnW%2FZPCfkdrfqaygNHx6IrmQv2k84Rmm7zxHXlmrGGAYpG42pYCdIInD7qB93QmYsVEKH4Mw3ffQrKDzgwZXNn9MImQ4c4GOqUBiw%2B3KJ6mLpRc6kJe%2F%2Fbi1TG%2BhFy6z6N%2BjJJN7W0sxHtwNPIB2aEp6BCQZ8nsO90zfaJQt9%2B6p4wRjvUlDldyKzp%2FmE%2BD5Cj7qRsRmKBQCE3chEbIghZj3ltfToq1%2FH3nPl4nU9USOrViUXJ8QMDZmxMYN9zZMxbXnQE%2Bs4VZIcoXhP3hu6c3VEYf%2FGepopQ9vfNHYfG6TlZyY8oMzW0fE6Gcspv8&X-Amz-Signature=1f077708c702e5c5332abca7ac7dcc16181292da1909b91a77e1d5ce798f528b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UEW7PXSN%2F20260410%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260410T012254Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFkaCXVzLXdlc3QtMiJHMEUCIQDgb%2FUcCMQYpL6DgdGAxv2kclSc8tw6QTVEy2OkQAo5SwIgGWxGakGDoSwefq5t2GQGY9SzMe8GkIIu%2Bita6UYPnlAq%2FwMIIhAAGgw2Mzc0MjMxODM4MDUiDGoEmVRayNpkMGOWxSrcA1rkmULBgw81KYtjCO61Uz1Xpb%2B0Ssyj%2FUMsluuIcj5QWuMfW8CX93eeSzKsImzWVYEiUAmw2ucy4ehX9k%2BCs3e%2FdG0nIqWDXUbXR0mkNWA5spcWKkaK123c4x5vN%2F2tPo691CSio%2B9WO8rklW0hEPpjB1PSzrC0fYqdc36GFHKu%2FgE5pt%2Fx88wMrvg9jku5HJKdD3dzNzp%2BFcAUg19YUuRLpEOPiMYWtm3jnUX%2FzWZWMCHi8qDt39%2Fi5Z1aebb%2Fifqhj2Fv92jRElrdX%2F7ZziDJstPNj0ePr25W3FjFXAAAe3jW%2BSml0rd8yPRPCh7lHsz0TWYjJFVtGMTzlMmT3qA7x8VTD3WCc5qCLN2nbWs4WFUcZfJ94HVfDkpmob7ihU4N1boT6bmMhY0peGjZpRhViezBRJZGJk3SSuwqqOj475q6U1eO3L3E8aQga89q4Ph3I%2B6PFuhOQbfYn%2Fbhuu24NoyeOwkmWyc4Lg5omc4pPiLjTXL8AasdUwKesFpvtH1bqnsvy%2BFdFVKO0pFx6XvyftX%2FYe%2FLULbNnbnW%2FZPCfkdrfqaygNHx6IrmQv2k84Rmm7zxHXlmrGGAYpG42pYCdIInD7qB93QmYsVEKH4Mw3ffQrKDzgwZXNn9MImQ4c4GOqUBiw%2B3KJ6mLpRc6kJe%2F%2Fbi1TG%2BhFy6z6N%2BjJJN7W0sxHtwNPIB2aEp6BCQZ8nsO90zfaJQt9%2B6p4wRjvUlDldyKzp%2FmE%2BD5Cj7qRsRmKBQCE3chEbIghZj3ltfToq1%2FH3nPl4nU9USOrViUXJ8QMDZmxMYN9zZMxbXnQE%2Bs4VZIcoXhP3hu6c3VEYf%2FGepopQ9vfNHYfG6TlZyY8oMzW0fE6Gcspv8&X-Amz-Signature=76c6b5ab5b5359f52af22f09e7ea03549ff3264657532487045a9f4205432571&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
