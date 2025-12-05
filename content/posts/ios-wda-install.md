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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665JHSEXVE%2F20251205%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251205T122301Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDoSSJEipxACzf%2FaF7QYcIrqgZfiVADDRdAVKhXc2tvAgIhANYpHxYOlJaGiZqH8s72wYWnZRRQoti%2BYfYIvWPXuuePKv8DCFoQABoMNjM3NDIzMTgzODA1Igw%2FyHCGCADa%2Fz1jj04q3AOw8vF3eLK46qXukfS%2Bl5uGyZCch9WJvxIRfxuLVkCePWrPveyDRNcy6ba7VxxatSL9kOGAyQAepg4YxRIg%2FlGethApuVkUxvxpirTb4Z1MmepeEPkd%2F%2BiJTo%2FlqvU0zVWOVyAngYwYsZjLWTp0Nl202CsB8fon7TP%2BLXEdGesJBcnwxrgcwNrXe2fyLrz0cBxxRySrHlaBvBSPoQtJQVsVZukOkePfh%2Bg0qXDBRgCjHhBdb%2FSJCc6y4geH%2FlJpPt%2BjRK7unXzBe7SXlxp9fkZmhyHBR%2FSYmCyAYHM33MJpYyvrrr8J2UTo1xh4uOMmxXm7ZTYWCWc%2B4bmPpuJuRxUiie2%2BrVXxtu3IitAhSB2MCuavnNEfWiGRm9XOOvhZZNhbowlrjdGoedrGFJxWtz313zRiohK2kSHbuAbpC5%2BjxC48%2F3L73twgmROG5hSDzPb25%2BG4ODAb6Q51ABFUWxc6NY8%2Bpn5g9YKKEFzYeG8q0GMyRAd1LQepXgCbFaT1CPE9VnlKBi5nlmZiLxMMlJ8XRfMITabLrjPwzna7%2F3dpPW2mHG8aDa4xgja%2BWbxrh2qXUWWnjJAAumyk6OxQql4p6eY6jQZiezeiP9NFnH7wv4yx%2FKrxrGzJPUo5ajDeyMrJBjqkAb8%2FbPMLWwqtRvtHbOKRkY4oMEX9Rd6joIenWv19os5Sn9ETEx%2B%2Fuh6XBuaIXvr4%2BlJygEgv4oLU0vfkR2ccAGkZMCM3KpAeOn8RBYeZR2%2BBfj392lHT12T%2F2nwyx8x%2FdWPJ9nQkcpY5pu2IuviUos6B8ju7TU4XfCRLXvxfxeY%2F6rLkjpiVXBr6iOOiuvDyV7aBtAtcwV9eNP0ukg7iagFM9K2m&X-Amz-Signature=757ca4ab33694ae919570ac6cce805f3a382377376609116ae77a1a3953c1dd5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665JHSEXVE%2F20251205%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251205T122301Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDoSSJEipxACzf%2FaF7QYcIrqgZfiVADDRdAVKhXc2tvAgIhANYpHxYOlJaGiZqH8s72wYWnZRRQoti%2BYfYIvWPXuuePKv8DCFoQABoMNjM3NDIzMTgzODA1Igw%2FyHCGCADa%2Fz1jj04q3AOw8vF3eLK46qXukfS%2Bl5uGyZCch9WJvxIRfxuLVkCePWrPveyDRNcy6ba7VxxatSL9kOGAyQAepg4YxRIg%2FlGethApuVkUxvxpirTb4Z1MmepeEPkd%2F%2BiJTo%2FlqvU0zVWOVyAngYwYsZjLWTp0Nl202CsB8fon7TP%2BLXEdGesJBcnwxrgcwNrXe2fyLrz0cBxxRySrHlaBvBSPoQtJQVsVZukOkePfh%2Bg0qXDBRgCjHhBdb%2FSJCc6y4geH%2FlJpPt%2BjRK7unXzBe7SXlxp9fkZmhyHBR%2FSYmCyAYHM33MJpYyvrrr8J2UTo1xh4uOMmxXm7ZTYWCWc%2B4bmPpuJuRxUiie2%2BrVXxtu3IitAhSB2MCuavnNEfWiGRm9XOOvhZZNhbowlrjdGoedrGFJxWtz313zRiohK2kSHbuAbpC5%2BjxC48%2F3L73twgmROG5hSDzPb25%2BG4ODAb6Q51ABFUWxc6NY8%2Bpn5g9YKKEFzYeG8q0GMyRAd1LQepXgCbFaT1CPE9VnlKBi5nlmZiLxMMlJ8XRfMITabLrjPwzna7%2F3dpPW2mHG8aDa4xgja%2BWbxrh2qXUWWnjJAAumyk6OxQql4p6eY6jQZiezeiP9NFnH7wv4yx%2FKrxrGzJPUo5ajDeyMrJBjqkAb8%2FbPMLWwqtRvtHbOKRkY4oMEX9Rd6joIenWv19os5Sn9ETEx%2B%2Fuh6XBuaIXvr4%2BlJygEgv4oLU0vfkR2ccAGkZMCM3KpAeOn8RBYeZR2%2BBfj392lHT12T%2F2nwyx8x%2FdWPJ9nQkcpY5pu2IuviUos6B8ju7TU4XfCRLXvxfxeY%2F6rLkjpiVXBr6iOOiuvDyV7aBtAtcwV9eNP0ukg7iagFM9K2m&X-Amz-Signature=0ff90c43c77a23f3607e61ef7eab1fd5a4ddb82e98cb364cedd82ef78a097c88&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
