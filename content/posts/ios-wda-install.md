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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SFEIH2C5%2F20260513%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260513T083252Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHgaCXVzLXdlc3QtMiJHMEUCIQCKxofzFn6CFcT35%2BdLZBuTJgm5%2FdZpoKzdjPG52T7cPwIgGQv%2Bo3u0JiHlyQTyWSykWu6p1MIbBnQF7%2B5mprl6nAkq%2FwMIQRAAGgw2Mzc0MjMxODM4MDUiDKTJX93wI7Y7uullZSrcA3wilwdmmw1tRcqTOipRX4D4pHhENvJjWdVjSO4F7REF%2F3okeJtfIqijKDHyKD10IMER7DOmmW9z%2BrqiwU95jLPBoUdiIqFO0VRd5EkwOhMswIqFkYJI9sGYIet3Jl2RH9AokhuI094e5j4dILXFZ1%2F7N%2F4RthasSM1DuZmxI4JsomRyOFVYFWRvY0zSqL3hjB5M5ZM9aFyqHRwLI4PF4VX7cT4AvypGTy3VILfnsyvQE0QJFzH7Uq3gHMNQKzbspWdN7%2BRMdvdw3yUczfAh8ZNeR%2FDuyOXDb4nkrTc6yJ09A00mK1rzbVs4v%2BfF%2FMkHtU3xRfyRRoEM7p2ipkq1qO2FoxM91RbigP4uJcuEWfJhqdwXA1TqviyS8xo0y29%2BK5dXM4m4CLIjQ7WrYuqz0x6AAEQvgDSBKkDAKDLH2XHQ92lE1SO5Dd%2FuzNCRPRumKjCSyx0FMjlFMqhMmIO1wqSnqnLle%2BMDWovwicya%2BUPxS%2Fhpvt5pvF82nqeu89qwq8D0IbJ8DvEoLiaQLkLA0Tg%2B87xXrgVJsKzkn%2B1qZm47Mq50EyxjPZHsbbDDQqbo4Irzcs30CGR9M9UPX4djHiE3DFUp7r8Ay3m0tEmi2v%2BqWwNvGdoogjaes%2B8QMNPdkNAGOqUBCAqT9t4Bx0s75vAd0%2B7uZJ7ZZmQ4z7zVOagRxpkcoTy56m3qsx19zuVxy82SGCYqU%2BFw%2BYgrdc5qGuA3bcHaSHe%2F329Mq%2FpjQyy8XlTalIYFl9SO1Iy4yK8gxODi0pfa7OdboO9gFayZmV5AR1xB7RZe0wTJjMr3fAgRszK12KvatwaiuNhFe%2BbGSpybAhHmv%2Fdm%2F86Jnuxmp00TSouRIaaI%2BMfV&X-Amz-Signature=0a125d8df420ee9800cb8215556c2150f3a2deaee5aaac22f7320650a1034b91&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SFEIH2C5%2F20260513%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260513T083252Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHgaCXVzLXdlc3QtMiJHMEUCIQCKxofzFn6CFcT35%2BdLZBuTJgm5%2FdZpoKzdjPG52T7cPwIgGQv%2Bo3u0JiHlyQTyWSykWu6p1MIbBnQF7%2B5mprl6nAkq%2FwMIQRAAGgw2Mzc0MjMxODM4MDUiDKTJX93wI7Y7uullZSrcA3wilwdmmw1tRcqTOipRX4D4pHhENvJjWdVjSO4F7REF%2F3okeJtfIqijKDHyKD10IMER7DOmmW9z%2BrqiwU95jLPBoUdiIqFO0VRd5EkwOhMswIqFkYJI9sGYIet3Jl2RH9AokhuI094e5j4dILXFZ1%2F7N%2F4RthasSM1DuZmxI4JsomRyOFVYFWRvY0zSqL3hjB5M5ZM9aFyqHRwLI4PF4VX7cT4AvypGTy3VILfnsyvQE0QJFzH7Uq3gHMNQKzbspWdN7%2BRMdvdw3yUczfAh8ZNeR%2FDuyOXDb4nkrTc6yJ09A00mK1rzbVs4v%2BfF%2FMkHtU3xRfyRRoEM7p2ipkq1qO2FoxM91RbigP4uJcuEWfJhqdwXA1TqviyS8xo0y29%2BK5dXM4m4CLIjQ7WrYuqz0x6AAEQvgDSBKkDAKDLH2XHQ92lE1SO5Dd%2FuzNCRPRumKjCSyx0FMjlFMqhMmIO1wqSnqnLle%2BMDWovwicya%2BUPxS%2Fhpvt5pvF82nqeu89qwq8D0IbJ8DvEoLiaQLkLA0Tg%2B87xXrgVJsKzkn%2B1qZm47Mq50EyxjPZHsbbDDQqbo4Irzcs30CGR9M9UPX4djHiE3DFUp7r8Ay3m0tEmi2v%2BqWwNvGdoogjaes%2B8QMNPdkNAGOqUBCAqT9t4Bx0s75vAd0%2B7uZJ7ZZmQ4z7zVOagRxpkcoTy56m3qsx19zuVxy82SGCYqU%2BFw%2BYgrdc5qGuA3bcHaSHe%2F329Mq%2FpjQyy8XlTalIYFl9SO1Iy4yK8gxODi0pfa7OdboO9gFayZmV5AR1xB7RZe0wTJjMr3fAgRszK12KvatwaiuNhFe%2BbGSpybAhHmv%2Fdm%2F86Jnuxmp00TSouRIaaI%2BMfV&X-Amz-Signature=a4d8ad3157f9e87f59d57d56ffea99fa545a905d386f77bf544941086d00481a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
