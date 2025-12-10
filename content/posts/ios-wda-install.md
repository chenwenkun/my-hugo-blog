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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UZYIS7YJ%2F20251210%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251210T061910Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAYaCXVzLXdlc3QtMiJHMEUCIBQpuz8MF8GVrWnC0vjddjtsyIDo0dQ6DQaiNoIwfZw2AiEA1Ic8LC9rzlWq9b4nwW00aQvaZhOt4uPOD1crlVbX5U0qiAQIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNg%2ByAIMxiVF5uhJ6ircAz5A%2B1t2P4Rubx0NNsfECKiky8%2FPNKXOKXybjcQ%2B03x7pgHCjrREtc%2BK4JLGLJ7%2Fy3QdlCZAttRW1jtRRHrOoZW1fu0ylUP9hitPruB6DO170eP6hQQWEQ%2FoA02aNG9ZuAUbIsvzfW5tRyw%2FCXAVFQhmUazx14HykoAzZ3NxhK3YIvpJlBa7bPQj2ojLOmGiIzXCZmD207GQSEqZNuNe4EzsUlj4YaXRrJ6gCFZqfD3fvYgL4wtBlKbtyYu6CFzBtny2gag1Kunko%2BQ0xo5mn5YLsYc7xr3eFsGvNhQ%2F%2BbGFgwT%2BfMpdSOdfVKwYW5DA4FKtYgRPxOV5BhyFCDqzKtYZ1kI7jQ%2BYV8joZFpkYqFmqrgePx1hGbb9QuOIMLHmnKFt%2FBBHNWPvf5w%2FXQj230bUQ3yNN3bzymLx8XKo56EUD0YcMepObIZhUlKBYe46KuQBwJXJ7ldPwz6wex3Pti3VUvZBanRXnLZQ6DJfkvCJk6pSrh30t91IzBTN%2FhkjEqONZlhC5jQ9BN77h9GVXhlcSSOtZAxFRbZAVxEk%2Br%2FIbsRZ22dbYs7men1%2FOtEuXuPzn8BUgcu1SeODt%2BNm28mdIQnsDtN3mOqnmTlecdPOGP5dbaFamek10zm8MM2R5MkGOqUBSEkonKm90P2LpKQoABNhG8jS4dbPEpg%2BDENwFXvyiQ7hq1a8StjlnjaM6al0MrzQ6W8umkp%2Fl884j2cAQpzxRznsOC7c9iME638DWnWoH9MVH0X1uIQwmIeqT7rkIIfEakNwde4OysaUISor7Td%2FyeAm6VUVYiVTnu1tYgdnJRD4LiydGvNIVplbCzQaU6EgpumhEo2e81DcjHdESKVdphYdAZvK&X-Amz-Signature=223c02e5e1fbe9c8ada0ee89088ba3a93c73ec7c3fbacc3d61d3228370611d1c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UZYIS7YJ%2F20251210%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251210T061910Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAYaCXVzLXdlc3QtMiJHMEUCIBQpuz8MF8GVrWnC0vjddjtsyIDo0dQ6DQaiNoIwfZw2AiEA1Ic8LC9rzlWq9b4nwW00aQvaZhOt4uPOD1crlVbX5U0qiAQIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNg%2ByAIMxiVF5uhJ6ircAz5A%2B1t2P4Rubx0NNsfECKiky8%2FPNKXOKXybjcQ%2B03x7pgHCjrREtc%2BK4JLGLJ7%2Fy3QdlCZAttRW1jtRRHrOoZW1fu0ylUP9hitPruB6DO170eP6hQQWEQ%2FoA02aNG9ZuAUbIsvzfW5tRyw%2FCXAVFQhmUazx14HykoAzZ3NxhK3YIvpJlBa7bPQj2ojLOmGiIzXCZmD207GQSEqZNuNe4EzsUlj4YaXRrJ6gCFZqfD3fvYgL4wtBlKbtyYu6CFzBtny2gag1Kunko%2BQ0xo5mn5YLsYc7xr3eFsGvNhQ%2F%2BbGFgwT%2BfMpdSOdfVKwYW5DA4FKtYgRPxOV5BhyFCDqzKtYZ1kI7jQ%2BYV8joZFpkYqFmqrgePx1hGbb9QuOIMLHmnKFt%2FBBHNWPvf5w%2FXQj230bUQ3yNN3bzymLx8XKo56EUD0YcMepObIZhUlKBYe46KuQBwJXJ7ldPwz6wex3Pti3VUvZBanRXnLZQ6DJfkvCJk6pSrh30t91IzBTN%2FhkjEqONZlhC5jQ9BN77h9GVXhlcSSOtZAxFRbZAVxEk%2Br%2FIbsRZ22dbYs7men1%2FOtEuXuPzn8BUgcu1SeODt%2BNm28mdIQnsDtN3mOqnmTlecdPOGP5dbaFamek10zm8MM2R5MkGOqUBSEkonKm90P2LpKQoABNhG8jS4dbPEpg%2BDENwFXvyiQ7hq1a8StjlnjaM6al0MrzQ6W8umkp%2Fl884j2cAQpzxRznsOC7c9iME638DWnWoH9MVH0X1uIQwmIeqT7rkIIfEakNwde4OysaUISor7Td%2FyeAm6VUVYiVTnu1tYgdnJRD4LiydGvNIVplbCzQaU6EgpumhEo2e81DcjHdESKVdphYdAZvK&X-Amz-Signature=c2bc9518c996abb8e2f50175a3b019e483dcbb7dbe2d21725e4c44788cf306ce&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
