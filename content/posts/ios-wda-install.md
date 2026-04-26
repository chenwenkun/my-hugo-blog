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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466746QFVTB%2F20260426%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260426T014354Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIEAB6PdffccVTZVLpcV2WbkZzdE%2FpSg2guikyEIPGqYRAiBl2uZ4KmTyYCjJ2SuLfVCRae4VCtmc%2BTb0YIRBviqCciqIBAii%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMg%2FIJJz7ilM1ENAlzKtwDuYg1iNPY2HqiCc6cw4067GZRZE%2FJvwu74b0AR9DnZiO5l0dCjo7PWBseFFqBpU7NeQnDc31DSeeuhDXyh0mslyXEJSJX%2FvBepREf2FS%2B5egRS1I%2Bvtq0IFbAUlhJlGrdVq8NkBJ9cttH7Jfj0QaXeCg5JStnwygS%2FwPZYYGexN5KiG292ooMUqfGpXY4ExFUngZYhkJ1rOhhi%2Fm6qQ4uBPiYS41YIQfznxL4nfjl%2Fxw2NX6C4w2%2B%2FSug7kdFOX95DgI0qFQqi60kHLSefoue8sfruVYhzdzLYQp%2FmOOmYsoJAuaj4OrmLA9YfYJkBTGbEiTgem%2FHfas7g%2FLcmVVR23hWNlzHE5FtYD0ogkzjHzyO8Y8ktTO6gqfKZXJuCX6kZN%2Bg7WS%2BkheuU4qW6nv%2B53gs%2F2K%2FS8Qu14bxmdfBcheul67J683puHb35vwCB04YfWMFcw9K1qz4b0qQN%2BUNl7%2FM8%2FzE5j5tO5nOhyughojE7PtaRuOe%2FkXdEB4XScz1cX8hmRkA5PN%2FyJzi%2B3z8B0RCsTZNLrzw7D%2FYm3%2FMt%2BMg59y5WCptAcB6%2Fn8LHTciZLeaBA5OxT9qGrVik6PSwvu7WBQT5jnweuKg29Kjlhi91eUbmDomXn3vzqgw6sy1zwY6pgH4RmFMCE8izAtWba6wKLGJA%2FX%2BsK0qDA5dwF8lvZRMxQTgtUSsu2qJ1ej75DAROJfqsiHFGLA3IiSsZlPnFB3d5AFgvFftQdcCB2E6QQ1fQq%2F85vAT2gM%2BH1wtqPZrqxG5NlN9DtaFHjjw2erw8bn7Hl8yqKtkUkKZ1lFGkV4Xfu1bWxJo30Nh%2FYZfvkQiYGydZ9ZBNZos3FO53TDX9FTpRvG5qCHS&X-Amz-Signature=14a80595d82e4af7b55907c3a85e96867af63f813851b355ab963c9a0546cb6d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466746QFVTB%2F20260426%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260426T014354Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIEAB6PdffccVTZVLpcV2WbkZzdE%2FpSg2guikyEIPGqYRAiBl2uZ4KmTyYCjJ2SuLfVCRae4VCtmc%2BTb0YIRBviqCciqIBAii%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMg%2FIJJz7ilM1ENAlzKtwDuYg1iNPY2HqiCc6cw4067GZRZE%2FJvwu74b0AR9DnZiO5l0dCjo7PWBseFFqBpU7NeQnDc31DSeeuhDXyh0mslyXEJSJX%2FvBepREf2FS%2B5egRS1I%2Bvtq0IFbAUlhJlGrdVq8NkBJ9cttH7Jfj0QaXeCg5JStnwygS%2FwPZYYGexN5KiG292ooMUqfGpXY4ExFUngZYhkJ1rOhhi%2Fm6qQ4uBPiYS41YIQfznxL4nfjl%2Fxw2NX6C4w2%2B%2FSug7kdFOX95DgI0qFQqi60kHLSefoue8sfruVYhzdzLYQp%2FmOOmYsoJAuaj4OrmLA9YfYJkBTGbEiTgem%2FHfas7g%2FLcmVVR23hWNlzHE5FtYD0ogkzjHzyO8Y8ktTO6gqfKZXJuCX6kZN%2Bg7WS%2BkheuU4qW6nv%2B53gs%2F2K%2FS8Qu14bxmdfBcheul67J683puHb35vwCB04YfWMFcw9K1qz4b0qQN%2BUNl7%2FM8%2FzE5j5tO5nOhyughojE7PtaRuOe%2FkXdEB4XScz1cX8hmRkA5PN%2FyJzi%2B3z8B0RCsTZNLrzw7D%2FYm3%2FMt%2BMg59y5WCptAcB6%2Fn8LHTciZLeaBA5OxT9qGrVik6PSwvu7WBQT5jnweuKg29Kjlhi91eUbmDomXn3vzqgw6sy1zwY6pgH4RmFMCE8izAtWba6wKLGJA%2FX%2BsK0qDA5dwF8lvZRMxQTgtUSsu2qJ1ej75DAROJfqsiHFGLA3IiSsZlPnFB3d5AFgvFftQdcCB2E6QQ1fQq%2F85vAT2gM%2BH1wtqPZrqxG5NlN9DtaFHjjw2erw8bn7Hl8yqKtkUkKZ1lFGkV4Xfu1bWxJo30Nh%2FYZfvkQiYGydZ9ZBNZos3FO53TDX9FTpRvG5qCHS&X-Amz-Signature=9e24ee10e3d8d87458bf5cdbe89280a7aa1a1035fcacc44c054ae45af6dc157a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
