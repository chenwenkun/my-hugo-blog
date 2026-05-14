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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TAFBLDBK%2F20260514%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260514T082603Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCmdFuYzYRa6Qw6JbTzNWT7%2FSCqbaiy76QPYLffRdX4ggIgFsQjjFJsj2rc3pLsRPu2QlmcZ7U5X25g0Jkd7lOgMYAq%2FwMIVxAAGgw2Mzc0MjMxODM4MDUiDHY%2BVc8JWm%2Fs5t%2FrESrcAxzt1yIzRvALNvyRY%2B9L53Bpw9ZVVRNGT2K13AcKwva0pbnx8TpgBZK9VPk912rtvDS0kI5xPL0cV6yjtYRSG%2BcRGGg5oYrIfTluD0xnw8dVbndf4ZIyQ4KSthY%2BXFBIf0S7oCnNMguA%2BocBrQ7ZKEKQd9B3pP9MorTNMTBE605%2FiCbiv1rjwGZX8ZQ1QeLhulsKg8MN51%2F5FCKtu0m7i6%2F95bxSrOZ%2FROc5ZTw8PFmRct5J1cFR4byeRQQ%2Bx2iZmHLuEXGVhnAWkPIj%2F5oSZvQowLb1bM7gW6gXJYig%2FDILSrFPvHQoXKCEG7tYKn7fIRDL2Z8p2HqeE8WZ7eleuNj4rJEboz%2Bh4NPxXpAYg36HDbAtbmoQERaDC5IFzw1DsunoG9Z7L7TlYXvJN4ws99NFp6S%2BJuHrDqmzac6tH4%2BonX81swuX17X6JhOCCGo7s4AOwpNqH9889CYEZGRLNbldRkfwy3%2BFmXCMdc089GW2tMCDBtWP6hEpHfRqRMwlz26HV5nxGAIUi%2FIpC6giabY9GZm%2FI05oWF%2BmwEqhHXOX7JFEvZazNmeB0E6K9KDTrNe3qwJnScF9X2SIarrEf5ljKqunz7%2BhFq%2Bv2c0UCpI8daoMOQHtEmLo3vyoMK7RldAGOqUBMMI3n8OhhRg%2FId3jtd977O25HusHknADoRbJJS2K1DjRn2%2BfWyfnWIOOLIGl47TtpAr9pqDLdNeDme91QSDSJY9leUBmG9%2Fkj0%2BTfu9WptRLDuBkYD7AkgFVuIiUgt56CDTrlWpcaASCI9ieqWKowTdhTw6HfozWYFVoRT3M2KwumhdJadlCmQ7VjxLXFt3oR1rJX2u1e%2FjPOAcb7eaNxAF0i7QV&X-Amz-Signature=975cd71a0229df24aeb600bd9c5d6b15247ff70a1eed65d875ce0cd2bbc29995&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TAFBLDBK%2F20260514%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260514T082603Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCmdFuYzYRa6Qw6JbTzNWT7%2FSCqbaiy76QPYLffRdX4ggIgFsQjjFJsj2rc3pLsRPu2QlmcZ7U5X25g0Jkd7lOgMYAq%2FwMIVxAAGgw2Mzc0MjMxODM4MDUiDHY%2BVc8JWm%2Fs5t%2FrESrcAxzt1yIzRvALNvyRY%2B9L53Bpw9ZVVRNGT2K13AcKwva0pbnx8TpgBZK9VPk912rtvDS0kI5xPL0cV6yjtYRSG%2BcRGGg5oYrIfTluD0xnw8dVbndf4ZIyQ4KSthY%2BXFBIf0S7oCnNMguA%2BocBrQ7ZKEKQd9B3pP9MorTNMTBE605%2FiCbiv1rjwGZX8ZQ1QeLhulsKg8MN51%2F5FCKtu0m7i6%2F95bxSrOZ%2FROc5ZTw8PFmRct5J1cFR4byeRQQ%2Bx2iZmHLuEXGVhnAWkPIj%2F5oSZvQowLb1bM7gW6gXJYig%2FDILSrFPvHQoXKCEG7tYKn7fIRDL2Z8p2HqeE8WZ7eleuNj4rJEboz%2Bh4NPxXpAYg36HDbAtbmoQERaDC5IFzw1DsunoG9Z7L7TlYXvJN4ws99NFp6S%2BJuHrDqmzac6tH4%2BonX81swuX17X6JhOCCGo7s4AOwpNqH9889CYEZGRLNbldRkfwy3%2BFmXCMdc089GW2tMCDBtWP6hEpHfRqRMwlz26HV5nxGAIUi%2FIpC6giabY9GZm%2FI05oWF%2BmwEqhHXOX7JFEvZazNmeB0E6K9KDTrNe3qwJnScF9X2SIarrEf5ljKqunz7%2BhFq%2Bv2c0UCpI8daoMOQHtEmLo3vyoMK7RldAGOqUBMMI3n8OhhRg%2FId3jtd977O25HusHknADoRbJJS2K1DjRn2%2BfWyfnWIOOLIGl47TtpAr9pqDLdNeDme91QSDSJY9leUBmG9%2Fkj0%2BTfu9WptRLDuBkYD7AkgFVuIiUgt56CDTrlWpcaASCI9ieqWKowTdhTw6HfozWYFVoRT3M2KwumhdJadlCmQ7VjxLXFt3oR1rJX2u1e%2FjPOAcb7eaNxAF0i7QV&X-Amz-Signature=751a6748317d40c649e5f10e17765fd0dab518db33e35670adc020308cd60d03&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
