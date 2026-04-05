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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663KIEPGGZ%2F20260405%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260405T182819Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCcietHs5zqpvBAe%2BkzfkS91lHLYIeFm94br5hUhFUJ%2BAIgZYkhXE3s8wZWjcmV38h89bAxW7XkvBDuUfjJgWlD%2FtcqiAQIuP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDGfBtTftZpVrA5M43CrcAw6sN8%2BMsDB1opPP9c2dWTzxrVbgOtWFq06dtYxHbT8gxnEcwyVfqSbpckCxzlScTL9azOevlIkSxy1hqjOH1IdyQloVjNFypueCJx0edgNme850RSB0gyUa2wz0XOakAv54WRfNjnBmDv34TECQ%2BMY0ChyZxkQKi7Gn8BBfGno3pJ%2Bga2Y0So7nqSuOWIiCAo09CXf0Cjq13yliy6aHNbkC0UNoPGUgCfRAIKG5cKHVUNTxvxKiyOkJnPE0ZwaCg6Vth4qzLBo3kQPCfuPzUsPkknFjSbouoby0XWh4ChpwwjRq6Jc1bKeRYOjcbMk%2B3fN9M7t5pnUDO%2BZyBYvJ%2BZ7hAGMQ4xjImRdw4IqbRz4RhtoEOdgQlUdRx1500hUSwxNsTbTH82D4yOx7o2yyvvV4CI120Wf6lk9X2KQxLFpYn4ZHV1rl4u%2BxvJes6CPgBNV3blL0UhhlXXYrCV5l9cX9BkTiqYITPRgLooCQi0vCImkGc%2Ft223MHytWVZu7l65WKoTnsByVZxI71Q5vIBE48VG9AWfXPZXcjSx%2F94Ic8F0wUnfqHyw1SuJsI2AAZoSNVfM2%2FtM1Q2lBWb3qzVEVW24EZ8dUtREamT%2B8gi91ZY%2F5lrMolvIkyJliWMI%2Fryc4GOqUB5FzzOD7izovUzNoDsI4DjPsXisFIEKvvULEEVlt6%2BGpvCZj4T%2FoM28rSk%2FxfZtR6H8D1DI%2B7UqWWmPocQqCHknV4hpSXGlJHNtHwcY%2BbY5jxYqsQ4d71PgRApmBaO%2BA0ocJiXPHEPmd5Z1pH9sxO2yuU5JuIhay%2BdeO7M18Q%2FvKY%2FQ6RXiIeJxiON39HqcsIZdRCRnhOLl0TOYbxlGyhLte1SOua&X-Amz-Signature=0d4bbbe2b2f5d897e883f0c07eda2697236526cd93107a9580c17ce498928608&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663KIEPGGZ%2F20260405%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260405T182819Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCcietHs5zqpvBAe%2BkzfkS91lHLYIeFm94br5hUhFUJ%2BAIgZYkhXE3s8wZWjcmV38h89bAxW7XkvBDuUfjJgWlD%2FtcqiAQIuP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDGfBtTftZpVrA5M43CrcAw6sN8%2BMsDB1opPP9c2dWTzxrVbgOtWFq06dtYxHbT8gxnEcwyVfqSbpckCxzlScTL9azOevlIkSxy1hqjOH1IdyQloVjNFypueCJx0edgNme850RSB0gyUa2wz0XOakAv54WRfNjnBmDv34TECQ%2BMY0ChyZxkQKi7Gn8BBfGno3pJ%2Bga2Y0So7nqSuOWIiCAo09CXf0Cjq13yliy6aHNbkC0UNoPGUgCfRAIKG5cKHVUNTxvxKiyOkJnPE0ZwaCg6Vth4qzLBo3kQPCfuPzUsPkknFjSbouoby0XWh4ChpwwjRq6Jc1bKeRYOjcbMk%2B3fN9M7t5pnUDO%2BZyBYvJ%2BZ7hAGMQ4xjImRdw4IqbRz4RhtoEOdgQlUdRx1500hUSwxNsTbTH82D4yOx7o2yyvvV4CI120Wf6lk9X2KQxLFpYn4ZHV1rl4u%2BxvJes6CPgBNV3blL0UhhlXXYrCV5l9cX9BkTiqYITPRgLooCQi0vCImkGc%2Ft223MHytWVZu7l65WKoTnsByVZxI71Q5vIBE48VG9AWfXPZXcjSx%2F94Ic8F0wUnfqHyw1SuJsI2AAZoSNVfM2%2FtM1Q2lBWb3qzVEVW24EZ8dUtREamT%2B8gi91ZY%2F5lrMolvIkyJliWMI%2Fryc4GOqUB5FzzOD7izovUzNoDsI4DjPsXisFIEKvvULEEVlt6%2BGpvCZj4T%2FoM28rSk%2FxfZtR6H8D1DI%2B7UqWWmPocQqCHknV4hpSXGlJHNtHwcY%2BbY5jxYqsQ4d71PgRApmBaO%2BA0ocJiXPHEPmd5Z1pH9sxO2yuU5JuIhay%2BdeO7M18Q%2FvKY%2FQ6RXiIeJxiON39HqcsIZdRCRnhOLl0TOYbxlGyhLte1SOua&X-Amz-Signature=112e2669243ecf52134418756f648800312c9c532e8b64dc95f8ea424e488f35&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
