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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VTYO6EYM%2F20260301%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260301T063341Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDe2wzXjPMMnRl4F7eTLtilF%2FepkS1rdR%2Bq74WBEXkr%2FQIgEn565Cf9iTJISgZiFV%2BG%2BuS08EbHp9%2BpV%2BpET3DYYU8q%2FwMIZBAAGgw2Mzc0MjMxODM4MDUiDFSB5dpX9DoMKF0OsSrcAxBCh1PoawSDmvnD7%2FTqXhrxiQKt%2BSTyrjyVcfMPSbhhhX8npkGk95rvgPsIwhN0PrIGZxMoBja4U3VgduvXcbiaI4W8DvPrR43o1N5CklFUS%2BS3IQUA7thyOWo9rgpixei2hanYk3Z%2B%2FE9yCJZO7noX%2FfnYfU9CCP6KRwLfTGRVWsO3IYCyp8aSEY%2FDzSf%2Fmqgxx9T5szYgA9QJHqoNLZuwzsNwlimmC4G%2FCmlVMEViuS8KL6Gm9%2B5QQTaYE6z%2FW6gqO2irodztyZMojVu19lCS0Pg5S80wHoe74vLTRXXXoqA3G%2BfGpaIFp9M2R0L%2FaiCQFSplOTzdkT%2BqSeb4Ilo%2BLnq3%2Bn7Ras62GsfwpG7CrOa9QMiweles37kzYHUCvPXrRuYQPO%2FsEhIZFaomxQHK9x9XwnBrrcd06wwIATuog2SgUfO0BczjT7c5r49NdRMW1oTyiSIP%2FllG9V0qbRwSQzzTsR8JUt%2FCjNUSUgRk0GEVPfr3X7PGUmGNiwWh9aJFKe86XsgPBTRfYSQAqr4QmN%2BOB7002nn25YlhQljr0%2BuCTGFyiyYrLsG5TijCofTLhoJaHEBNJgUL3FEKnDViolpzrjFC8lh4KYFonKA3hiZKX3dnprX4kafpMKHOjs0GOqUBEB7xjDqLLtnSqic0MYyS5r%2Fw1pMzt9rShNUjuZtd5JOdTwCMEuNty8ywFCLgrowJ%2F2G8rQ99o1JKLvb1mknJ92e0ZewHDaZrlD4oZ7oy1O%2B7KwgE7GHM7OZYWPAhDyLgD9DUsUeekddjOxOI3CFoP56d2Ap7KszKWlCcLDIdK%2F%2B3TVQhiay3x4M0gI%2F9%2F3xIu%2F18WwHSEVsYVzCXOmJk6G%2Fqfmz8&X-Amz-Signature=f0e9ec5d87b8e8b97fefbceb86b654408531b78273fa23fa5ebbcb9bb55e0d57&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VTYO6EYM%2F20260301%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260301T063341Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDe2wzXjPMMnRl4F7eTLtilF%2FepkS1rdR%2Bq74WBEXkr%2FQIgEn565Cf9iTJISgZiFV%2BG%2BuS08EbHp9%2BpV%2BpET3DYYU8q%2FwMIZBAAGgw2Mzc0MjMxODM4MDUiDFSB5dpX9DoMKF0OsSrcAxBCh1PoawSDmvnD7%2FTqXhrxiQKt%2BSTyrjyVcfMPSbhhhX8npkGk95rvgPsIwhN0PrIGZxMoBja4U3VgduvXcbiaI4W8DvPrR43o1N5CklFUS%2BS3IQUA7thyOWo9rgpixei2hanYk3Z%2B%2FE9yCJZO7noX%2FfnYfU9CCP6KRwLfTGRVWsO3IYCyp8aSEY%2FDzSf%2Fmqgxx9T5szYgA9QJHqoNLZuwzsNwlimmC4G%2FCmlVMEViuS8KL6Gm9%2B5QQTaYE6z%2FW6gqO2irodztyZMojVu19lCS0Pg5S80wHoe74vLTRXXXoqA3G%2BfGpaIFp9M2R0L%2FaiCQFSplOTzdkT%2BqSeb4Ilo%2BLnq3%2Bn7Ras62GsfwpG7CrOa9QMiweles37kzYHUCvPXrRuYQPO%2FsEhIZFaomxQHK9x9XwnBrrcd06wwIATuog2SgUfO0BczjT7c5r49NdRMW1oTyiSIP%2FllG9V0qbRwSQzzTsR8JUt%2FCjNUSUgRk0GEVPfr3X7PGUmGNiwWh9aJFKe86XsgPBTRfYSQAqr4QmN%2BOB7002nn25YlhQljr0%2BuCTGFyiyYrLsG5TijCofTLhoJaHEBNJgUL3FEKnDViolpzrjFC8lh4KYFonKA3hiZKX3dnprX4kafpMKHOjs0GOqUBEB7xjDqLLtnSqic0MYyS5r%2Fw1pMzt9rShNUjuZtd5JOdTwCMEuNty8ywFCLgrowJ%2F2G8rQ99o1JKLvb1mknJ92e0ZewHDaZrlD4oZ7oy1O%2B7KwgE7GHM7OZYWPAhDyLgD9DUsUeekddjOxOI3CFoP56d2Ap7KszKWlCcLDIdK%2F%2B3TVQhiay3x4M0gI%2F9%2F3xIu%2F18WwHSEVsYVzCXOmJk6G%2Fqfmz8&X-Amz-Signature=8964ccfd8705c3c07d5b7c7a5a05ce3c1448273a013cb5f8e298b6607c81634f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
