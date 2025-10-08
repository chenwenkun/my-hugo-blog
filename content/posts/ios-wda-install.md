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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QEUUKOXL%2F20251008%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251008T004826Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBkaCXVzLXdlc3QtMiJGMEQCIFfqVictpj9kq%2Btf7sHGKZhkR8LupW4W7sEi3%2BJNd94rAiA7cxAOX8D1%2FfmSxNpAD0q2lXUwX%2FWdns%2FHjVGI%2FW4pUiqIBAiy%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMvDjEvzE0WW%2BD7%2BHoKtwD%2F9TVolUIqLgGJ1t5r3HyoyTxvCzMlPPm9nWqiKU93yO%2F%2FiZAHjvVpATc6I%2FW8rhlHT%2B%2F4r2pbwj7cJaNnTUoz1BGtyFG0Zu6TOA18RIqw7i1dv5Vj3tx3iZdqqYQm9u8TGnrWi5irU2yElpn5yiu5FgiHV6RCArMoSTZAY0xI1SusAthZPTMaq1k9YzAkZkuNyucB8PIOyHhA15CUlS%2B1q3QyUgD85BqJcuqFS5kei98TXhdeEYOBoBGlscL58bhZj8gGzOmaImhl%2BXdpukZIWbSZHIFO1RM7X25XytvZ6dj0RK5nY4N1GlEcS8Rv%2BkLKp%2BXoQdnO3EqmYRrS8ns6EqsqFOgQvUUeL3bSx8xodSR6XASMGO0KtD4IKQ8AXFt5GoNRpoIAOAYeTtAmKq9POkif1IiwhEx8FIHYie3tXswNcmZEZtUT5RyWL0%2BjoCJLa8dAavgwFCusCy9UPPV3EkHYrU2KFBzRrp7Ay5dI7K4Z9PyHKaTHvUnoqrAh%2B3WNlrrVgpj6vQ8%2BkCj5J54xXrZX3AxJujOvSrivmLxBLWfDyNBNCfNLrhi7Y8cmO3zk7ka%2FdrQNHsD0STJPJZx%2FBfpTSVlFB5Mzbb2MJd2ASDXfXxDlr2bq%2FwQq%2BMw%2F%2BaWxwY6pgEHuUAkc4%2BdpGo9%2FariPkyiZcmjRDpmVOa9o2e6DknwjZbjTiON7j1wkot1ohyIgs4W%2BNvsl7q5j3xdHlk8IaAYk7f00UY5n%2B%2FJar1qF20phCAvhyiGI35j85GKtQ%2FPRQaVJ9yO3B4e2TyOVjDrEjF5YHNGfFbXrxO4JA5tS9lsPHPOzv4Ot8B5VdIW7MEMqiR6y38e3tCB4RyxLGuIrQc0ke7HrTdT&X-Amz-Signature=c673dea47f6f47f5b3e74161eedaf201e5e7dfd55507c46a4137adb40225a4d7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QEUUKOXL%2F20251008%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251008T004826Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBkaCXVzLXdlc3QtMiJGMEQCIFfqVictpj9kq%2Btf7sHGKZhkR8LupW4W7sEi3%2BJNd94rAiA7cxAOX8D1%2FfmSxNpAD0q2lXUwX%2FWdns%2FHjVGI%2FW4pUiqIBAiy%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMvDjEvzE0WW%2BD7%2BHoKtwD%2F9TVolUIqLgGJ1t5r3HyoyTxvCzMlPPm9nWqiKU93yO%2F%2FiZAHjvVpATc6I%2FW8rhlHT%2B%2F4r2pbwj7cJaNnTUoz1BGtyFG0Zu6TOA18RIqw7i1dv5Vj3tx3iZdqqYQm9u8TGnrWi5irU2yElpn5yiu5FgiHV6RCArMoSTZAY0xI1SusAthZPTMaq1k9YzAkZkuNyucB8PIOyHhA15CUlS%2B1q3QyUgD85BqJcuqFS5kei98TXhdeEYOBoBGlscL58bhZj8gGzOmaImhl%2BXdpukZIWbSZHIFO1RM7X25XytvZ6dj0RK5nY4N1GlEcS8Rv%2BkLKp%2BXoQdnO3EqmYRrS8ns6EqsqFOgQvUUeL3bSx8xodSR6XASMGO0KtD4IKQ8AXFt5GoNRpoIAOAYeTtAmKq9POkif1IiwhEx8FIHYie3tXswNcmZEZtUT5RyWL0%2BjoCJLa8dAavgwFCusCy9UPPV3EkHYrU2KFBzRrp7Ay5dI7K4Z9PyHKaTHvUnoqrAh%2B3WNlrrVgpj6vQ8%2BkCj5J54xXrZX3AxJujOvSrivmLxBLWfDyNBNCfNLrhi7Y8cmO3zk7ka%2FdrQNHsD0STJPJZx%2FBfpTSVlFB5Mzbb2MJd2ASDXfXxDlr2bq%2FwQq%2BMw%2F%2BaWxwY6pgEHuUAkc4%2BdpGo9%2FariPkyiZcmjRDpmVOa9o2e6DknwjZbjTiON7j1wkot1ohyIgs4W%2BNvsl7q5j3xdHlk8IaAYk7f00UY5n%2B%2FJar1qF20phCAvhyiGI35j85GKtQ%2FPRQaVJ9yO3B4e2TyOVjDrEjF5YHNGfFbXrxO4JA5tS9lsPHPOzv4Ot8B5VdIW7MEMqiR6y38e3tCB4RyxLGuIrQc0ke7HrTdT&X-Amz-Signature=f4db8df56597490069419a70ab1f2d052a1f25f37bb4a29469bfd858463938ca&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
