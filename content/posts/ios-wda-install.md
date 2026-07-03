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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666NIAACCP%2F20260703%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260703T134031Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEUaCXVzLXdlc3QtMiJGMEQCIDHHQd%2Flf2HgeRzr%2FMaCiGPgJ7v9Hs%2FSj0G7W0w4zYNdAiBb5lu13Qq6AshtZKLigIEfkusAFGfE6aZmovdh%2Fru2Uir%2FAwgOEAAaDDYzNzQyMzE4MzgwNSIMT6AcUUeSkYQEmkuyKtwDbJbADNOr5kPa8C6OaZTaxuXXGL67j4cZ%2BkRyU%2BCwBmOd2V2yFBIJMCjz9mfGQnefiXp6HmpKjSps3WN9EpMSjEvZ5q2bbr3OMIxvFjK%2BVg%2BVRPm1sxHrtilECg9IDypikfsY7SVl7VcyAkT0lAY6sL8sTAxSsikLJFj1E0uzaoSoOzO5ZqrP%2B1w1Q5hYc5AdDX1hocmlD%2FQrjEEGFpQ3i0DwXtYdbPIlDK8MM0P4%2FikMKSa0FbIWOzBgNJVeRpzuk61H3gwMPTS0pX%2BlwWOZEno6upZATKSfcPrV0RrCLBcWK6QYt6tvKCddQP9t7fsL6AJbVlW3tDmVNrtRT0AUvNzZrv6SJiJi9mF4Lwp3Xa5NCvqin9aU5stE%2BAS6HMdSZUOUd9hPnp65Zvw8gx8S2wJye5bzHZmYp4pONm5ihiw3cwotUvvsp6LsLkjP9g8VcUL5w6azXGiZw0bkINYN2rdyx2rX4izy8Bw18rMz4Srh6wOn94FUqQ%2BKv5PHViIm8PnPZanNQEOgHlNe1u6GQSYl0rfAdUve%2FGIuphE%2BEREzctc5aS8PD%2Bd08pvvOB3AIc1Cv6h2MfWdARtqvVPj%2BAC96dFsCUv9Ug3siYaM6Qv3oqbNpfaYJiJQ%2F7MwrNWe0gY6pgFqIP0LLzGL8ARpqyPeXEJlAbI8UW0BxXG0JI685Lf3HsQQmP%2BdZ952Rl4GbglPyKNSjxbKCKng70n2VV7u4fiSFeGfOTYt9ImPkERTI4xInDhwCxUYRL4ZvWfsetzWrzQlPecwdQ8Z6lyQV9b8xe1xYB5CE14D9DBdagPjzwqfFPjAe5b5Yq9ndfL2zT6qbp0xYk3ArNryIiTkl7jLy%2BB694S1iXWR&X-Amz-Signature=5b2cea92b232d287f8ce30d71f5dd9973cd76a92ed411229ef3c8f179b0ad8c3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666NIAACCP%2F20260703%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260703T134031Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEUaCXVzLXdlc3QtMiJGMEQCIDHHQd%2Flf2HgeRzr%2FMaCiGPgJ7v9Hs%2FSj0G7W0w4zYNdAiBb5lu13Qq6AshtZKLigIEfkusAFGfE6aZmovdh%2Fru2Uir%2FAwgOEAAaDDYzNzQyMzE4MzgwNSIMT6AcUUeSkYQEmkuyKtwDbJbADNOr5kPa8C6OaZTaxuXXGL67j4cZ%2BkRyU%2BCwBmOd2V2yFBIJMCjz9mfGQnefiXp6HmpKjSps3WN9EpMSjEvZ5q2bbr3OMIxvFjK%2BVg%2BVRPm1sxHrtilECg9IDypikfsY7SVl7VcyAkT0lAY6sL8sTAxSsikLJFj1E0uzaoSoOzO5ZqrP%2B1w1Q5hYc5AdDX1hocmlD%2FQrjEEGFpQ3i0DwXtYdbPIlDK8MM0P4%2FikMKSa0FbIWOzBgNJVeRpzuk61H3gwMPTS0pX%2BlwWOZEno6upZATKSfcPrV0RrCLBcWK6QYt6tvKCddQP9t7fsL6AJbVlW3tDmVNrtRT0AUvNzZrv6SJiJi9mF4Lwp3Xa5NCvqin9aU5stE%2BAS6HMdSZUOUd9hPnp65Zvw8gx8S2wJye5bzHZmYp4pONm5ihiw3cwotUvvsp6LsLkjP9g8VcUL5w6azXGiZw0bkINYN2rdyx2rX4izy8Bw18rMz4Srh6wOn94FUqQ%2BKv5PHViIm8PnPZanNQEOgHlNe1u6GQSYl0rfAdUve%2FGIuphE%2BEREzctc5aS8PD%2Bd08pvvOB3AIc1Cv6h2MfWdARtqvVPj%2BAC96dFsCUv9Ug3siYaM6Qv3oqbNpfaYJiJQ%2F7MwrNWe0gY6pgFqIP0LLzGL8ARpqyPeXEJlAbI8UW0BxXG0JI685Lf3HsQQmP%2BdZ952Rl4GbglPyKNSjxbKCKng70n2VV7u4fiSFeGfOTYt9ImPkERTI4xInDhwCxUYRL4ZvWfsetzWrzQlPecwdQ8Z6lyQV9b8xe1xYB5CE14D9DBdagPjzwqfFPjAe5b5Yq9ndfL2zT6qbp0xYk3ArNryIiTkl7jLy%2BB694S1iXWR&X-Amz-Signature=96cdc084c97c2b8b5a81601868af1fd1a77e8f07523a4ec0f618220e731e8209&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
