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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RTANT3SF%2F20260622%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260622T203232Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEMaCXVzLXdlc3QtMiJHMEUCIHFeqoT2SwqT5jsKthdvu%2BW48h0kp3FcVuyyf9qeTfTqAiEAwx89E2zg8xnkIPR0zeDD6uYFF2%2F%2FMFNws9ZspGTlDzIq%2FwMICxAAGgw2Mzc0MjMxODM4MDUiDGUMLjL6nWikgwbI9ircA7TruLt1kw3Vr5rvPNPBhfDwiw3fUL3tmmdyCCOBmxJNsu4krUGUnuTrVHSTMR8j9gbvcTnFiSlBf0Mj6Iu3TKoZi1GsCmWAKCUu%2Bd%2FD3gLwhJcUCwmldtBvw8V6cFQeje1pzPindyQv5%2Fu5XUpqw2%2FydG0ZY2TnG2jNxBRa2QYeD%2B7T3%2Bbkw%2BlR%2BAplGTbH1IsQ%2F7nQKxZAlSxKTJSgLuIeYzYG6zkqJvxuEFRaFZWeueOzqkOc9JdFuYA3zw%2Bg%2FFdDVgcWqQLOuZPAdlkrra9ybdeTIp40EKvmSHK3%2FkIXRHCu%2B4aC9vN1%2FbJi3k5Zi5rxYrLvpjUlTbjbHlW1TGxqsQBXKqe8sOSP4qF66hphMVSQZ6xiqwChxdE2UF3DkBJFPa3ziRmGP5bhS9zhzG4uIIMopg4BBDyw8YD1RHNOivcnLCAgxHHaEtvvIgSwOPlN8YwL2%2BLBg4GSlUXjRKY6NbwJMboLWyewhgdddFxNDdAwyr6SSzeulsoa2BWRkL7vtuS6Aweb9rFR0rSvAgCRl54ianThYzHN8Cr77oDzxWnLBHz%2BgwJzA3g8sYVUN8fcMnLtlAP61JqLv0m6OI2x4xQBMUA2DgbpKvRaOc8voBLpgBtVzT4%2BoVmWMJL65dEGOqUBYRmRVwM7jf4iuHNyTgwcAAh3FHwd%2B5bIju8G%2B7Ks5l1%2FdZc7Ki07idDUdNtF7eSyQrzgvr%2FMw5YvNQsVmSLVn9Xe47y59wiyhd5EEvc7EkgOlxo3fjQZWkmOCvHEZ4H%2Bohjmaq%2F9XJXAYh2muDMKbS3J4y5YwVZSU5necHgnoEJfSyns%2Bg5Q4aoufaagstMXgunIivO4nq9qT3LOFsLg1w7OQrxw&X-Amz-Signature=dd69184c073bd3e1b0b6293892bff2c3e131ddcae114bbdf75383b67ce852689&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RTANT3SF%2F20260622%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260622T203232Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEMaCXVzLXdlc3QtMiJHMEUCIHFeqoT2SwqT5jsKthdvu%2BW48h0kp3FcVuyyf9qeTfTqAiEAwx89E2zg8xnkIPR0zeDD6uYFF2%2F%2FMFNws9ZspGTlDzIq%2FwMICxAAGgw2Mzc0MjMxODM4MDUiDGUMLjL6nWikgwbI9ircA7TruLt1kw3Vr5rvPNPBhfDwiw3fUL3tmmdyCCOBmxJNsu4krUGUnuTrVHSTMR8j9gbvcTnFiSlBf0Mj6Iu3TKoZi1GsCmWAKCUu%2Bd%2FD3gLwhJcUCwmldtBvw8V6cFQeje1pzPindyQv5%2Fu5XUpqw2%2FydG0ZY2TnG2jNxBRa2QYeD%2B7T3%2Bbkw%2BlR%2BAplGTbH1IsQ%2F7nQKxZAlSxKTJSgLuIeYzYG6zkqJvxuEFRaFZWeueOzqkOc9JdFuYA3zw%2Bg%2FFdDVgcWqQLOuZPAdlkrra9ybdeTIp40EKvmSHK3%2FkIXRHCu%2B4aC9vN1%2FbJi3k5Zi5rxYrLvpjUlTbjbHlW1TGxqsQBXKqe8sOSP4qF66hphMVSQZ6xiqwChxdE2UF3DkBJFPa3ziRmGP5bhS9zhzG4uIIMopg4BBDyw8YD1RHNOivcnLCAgxHHaEtvvIgSwOPlN8YwL2%2BLBg4GSlUXjRKY6NbwJMboLWyewhgdddFxNDdAwyr6SSzeulsoa2BWRkL7vtuS6Aweb9rFR0rSvAgCRl54ianThYzHN8Cr77oDzxWnLBHz%2BgwJzA3g8sYVUN8fcMnLtlAP61JqLv0m6OI2x4xQBMUA2DgbpKvRaOc8voBLpgBtVzT4%2BoVmWMJL65dEGOqUBYRmRVwM7jf4iuHNyTgwcAAh3FHwd%2B5bIju8G%2B7Ks5l1%2FdZc7Ki07idDUdNtF7eSyQrzgvr%2FMw5YvNQsVmSLVn9Xe47y59wiyhd5EEvc7EkgOlxo3fjQZWkmOCvHEZ4H%2Bohjmaq%2F9XJXAYh2muDMKbS3J4y5YwVZSU5necHgnoEJfSyns%2Bg5Q4aoufaagstMXgunIivO4nq9qT3LOFsLg1w7OQrxw&X-Amz-Signature=d08bdace938083eea4eacd86373c44e033231bd414f223886abd27c701224cb5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
