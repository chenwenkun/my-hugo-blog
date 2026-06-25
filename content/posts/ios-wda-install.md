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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SAWFYVQX%2F20260625%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260625T140152Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIDY7uipZ%2FaLdZZ%2F6%2FAOGbETZ%2FOqfexk5xt0IYAq21uG7AiEA%2B8HoSD6pOdjrwps6DT1G%2BQt1qpBWDZffPHuSyg%2FtkB8q%2FwMITxAAGgw2Mzc0MjMxODM4MDUiDAhY%2BGR4rStIhAnAXSrcA0InYzhdW16Y4PMRumjCYsL0DfQgpxbt8QG9PXPnpeMhuu6OFn%2F0glL6qsl2h4Q9QRcmjWpmxkUp6A0t9nVkKtLGZMSm0KQ9g8FOZV5CtofrdSJX7y5vqc0BxNjcwnsw9omRCd8UcBB%2BZ0vTX5YzuSleENJ31WyNbOV8iMwmqgFW6RqF7hyZR3zOSKP2dz%2B1QTq%2FcK%2FYzXYzozeFXcj6wxSb9kYpw8DQ05WcM7hCrVXbDph6aMvlgYPxHAa%2FegAI%2B63qpzzXAGcLOUzt3hio9OVEC4JuZ%2BgrtTLzlMwpoPOQ05JYlh7tT0qK71ro9wl5%2F4WE7ZRmYU0%2FFgYGYLzVf82InBkMd7uZ0ME%2FUjJV6vYyrRz9Q%2B7NzBSEs99%2FZdxuOAXf5pjY8fZwhcFOM3CtRdFQFB5VzMqlhax%2BG%2FlDOl9WSxFaGYBINWKqsV5uJBZLBLODHy9CPuobl2oEDaEMhG5LEc6Fo0Z6nJSvgbAi4cmhdRjOjDT5GjOyf9DNaZ7NDlhqsBq0OLqJplRs%2FsW5Rjfg8J9ciPv3MT%2BLUPcda68HuxQvJxoX9ViE4oEpm4osveUmONwhZF1mXeg71J1Qe5GyJ0BevxHoZHANvFrBI5iMnenG5EqDfJbHqV8iMLHb9NEGOqUBvsBSyytSjaYA%2BOel%2FfM4t%2F1C%2BDIIpMKQFvLdykM8Jkz5luYZ9JaXNYE7nXS3sQkPrNM7dlxegmo1coMxHB%2FmpMXUy8BnKakzbfU0OOuGiGXrBcoFqcZV2JF1laNErf3QFkWus55xXSOe5H%2F93QzUSv06tyyX5%2BV%2BlpeMA9yXPIvnyG9bP7dmLVXbZSUqRNw3WZCP2TIZa8Lkr148ChfV3uiQAeFt&X-Amz-Signature=c325d7e8548fc117cfde78c74e0aff758c603b40787a4a178c9dece089631c68&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SAWFYVQX%2F20260625%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260625T140152Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIDY7uipZ%2FaLdZZ%2F6%2FAOGbETZ%2FOqfexk5xt0IYAq21uG7AiEA%2B8HoSD6pOdjrwps6DT1G%2BQt1qpBWDZffPHuSyg%2FtkB8q%2FwMITxAAGgw2Mzc0MjMxODM4MDUiDAhY%2BGR4rStIhAnAXSrcA0InYzhdW16Y4PMRumjCYsL0DfQgpxbt8QG9PXPnpeMhuu6OFn%2F0glL6qsl2h4Q9QRcmjWpmxkUp6A0t9nVkKtLGZMSm0KQ9g8FOZV5CtofrdSJX7y5vqc0BxNjcwnsw9omRCd8UcBB%2BZ0vTX5YzuSleENJ31WyNbOV8iMwmqgFW6RqF7hyZR3zOSKP2dz%2B1QTq%2FcK%2FYzXYzozeFXcj6wxSb9kYpw8DQ05WcM7hCrVXbDph6aMvlgYPxHAa%2FegAI%2B63qpzzXAGcLOUzt3hio9OVEC4JuZ%2BgrtTLzlMwpoPOQ05JYlh7tT0qK71ro9wl5%2F4WE7ZRmYU0%2FFgYGYLzVf82InBkMd7uZ0ME%2FUjJV6vYyrRz9Q%2B7NzBSEs99%2FZdxuOAXf5pjY8fZwhcFOM3CtRdFQFB5VzMqlhax%2BG%2FlDOl9WSxFaGYBINWKqsV5uJBZLBLODHy9CPuobl2oEDaEMhG5LEc6Fo0Z6nJSvgbAi4cmhdRjOjDT5GjOyf9DNaZ7NDlhqsBq0OLqJplRs%2FsW5Rjfg8J9ciPv3MT%2BLUPcda68HuxQvJxoX9ViE4oEpm4osveUmONwhZF1mXeg71J1Qe5GyJ0BevxHoZHANvFrBI5iMnenG5EqDfJbHqV8iMLHb9NEGOqUBvsBSyytSjaYA%2BOel%2FfM4t%2F1C%2BDIIpMKQFvLdykM8Jkz5luYZ9JaXNYE7nXS3sQkPrNM7dlxegmo1coMxHB%2FmpMXUy8BnKakzbfU0OOuGiGXrBcoFqcZV2JF1laNErf3QFkWus55xXSOe5H%2F93QzUSv06tyyX5%2BV%2BlpeMA9yXPIvnyG9bP7dmLVXbZSUqRNw3WZCP2TIZa8Lkr148ChfV3uiQAeFt&X-Amz-Signature=8a119af23b74a35447e11b05f33d6dda04c40b95d9eec6fe8f6eaf5df343a664&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
