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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TP2LG5GQ%2F20260520%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260520T085201Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECAaCXVzLXdlc3QtMiJHMEUCICbqq4fvC0fcT1yl9rQmdG%2FANedoMfwmeYdaIfZ5Yul5AiEA09VmkLaYmT9v0tPXVf%2FleolH7mmhvd%2FAceTsMpzN%2B60qiAQI6f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDKMJNyrgVWd%2BhFEQOSrcA%2FeypOQJZQYjHczqVd9M7izxyQzULyFLubpiCSAdvee6o8cBXdT8h4HD4xrbqribPwmXTZWwmViYmxrG4as%2BfAkir99KvKyvg%2F2jTvHvE%2BdfNmwELo3OyzL%2BGELW1HMr%2BvbPCY4Y2BbuHfL9AhaCX5fu9tTV%2Fvri0K4WukdzqlitKNn651aCiHFwe%2B2oX4iotCjceg8nuX7Wr%2B4vcsRINlyQ0SgoDQZ1Hj7t5PCj7fwOZW7SQPe9GAL4j7m9NF5Nwj0Fv%2FxKE28OryogsMkA21TyKo%2Bj10%2FXc9USSFfrJLp3F4jROJBMFXEeM9AlaPmxfCpEROjunqyznWQebYuUuYNMtEsUJUjrMMzTSrgI%2ForwyWPZs1ZD2w6Fn8qcfMQhOvdsInKWVfStokaEJqHYHMxpuZ1sVi9Wmn8pq7jcHq%2FKTHhiuWB1zgjhWCwco3V2LWpd4Txdl9wlbWXyu3h1N4i5lRJJMd6LmeSu5%2FudOOfJCHu1qToH4LwF7vDP%2Fh9L%2BYTRUHH6W1qvd%2B%2BuLC3%2BQyzChrTbLfHjY%2BoijaIbVkHjKd68k1eMdKisZAZPHziNptyP5L01Bsk22%2BKwQTvpL8o4iyuo8qYk2eUEF1uFaoucfVPKHuMdUjSKY13JMLXQtdAGOqUBqx6tBLfBFZuttR7V5o3IoCjC%2FCeQ2Icp4KJVaMIDWpKJdu8I6NwgCY9t%2BJUiRUo3ZudPKbjcP53xjIHjB0wicsXlGHByhHZ1UGa%2B%2B8AFtRux%2Fkn4B9Ke0LxgTN8ao3rVtxc0aQQRSi2Kw%2F5JVmpJvu93B7juu07Ts4CwH3Dh1zhidQQLYvXU2jUvbY9%2B6Wmm2qS4XsrY50omD3KKrU5xRJCCIesf&X-Amz-Signature=8794e7601b0e862e975f44e50776a1f52cdc1c61edb04446b7a5868e63dabbcc&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TP2LG5GQ%2F20260520%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260520T085201Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECAaCXVzLXdlc3QtMiJHMEUCICbqq4fvC0fcT1yl9rQmdG%2FANedoMfwmeYdaIfZ5Yul5AiEA09VmkLaYmT9v0tPXVf%2FleolH7mmhvd%2FAceTsMpzN%2B60qiAQI6f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDKMJNyrgVWd%2BhFEQOSrcA%2FeypOQJZQYjHczqVd9M7izxyQzULyFLubpiCSAdvee6o8cBXdT8h4HD4xrbqribPwmXTZWwmViYmxrG4as%2BfAkir99KvKyvg%2F2jTvHvE%2BdfNmwELo3OyzL%2BGELW1HMr%2BvbPCY4Y2BbuHfL9AhaCX5fu9tTV%2Fvri0K4WukdzqlitKNn651aCiHFwe%2B2oX4iotCjceg8nuX7Wr%2B4vcsRINlyQ0SgoDQZ1Hj7t5PCj7fwOZW7SQPe9GAL4j7m9NF5Nwj0Fv%2FxKE28OryogsMkA21TyKo%2Bj10%2FXc9USSFfrJLp3F4jROJBMFXEeM9AlaPmxfCpEROjunqyznWQebYuUuYNMtEsUJUjrMMzTSrgI%2ForwyWPZs1ZD2w6Fn8qcfMQhOvdsInKWVfStokaEJqHYHMxpuZ1sVi9Wmn8pq7jcHq%2FKTHhiuWB1zgjhWCwco3V2LWpd4Txdl9wlbWXyu3h1N4i5lRJJMd6LmeSu5%2FudOOfJCHu1qToH4LwF7vDP%2Fh9L%2BYTRUHH6W1qvd%2B%2BuLC3%2BQyzChrTbLfHjY%2BoijaIbVkHjKd68k1eMdKisZAZPHziNptyP5L01Bsk22%2BKwQTvpL8o4iyuo8qYk2eUEF1uFaoucfVPKHuMdUjSKY13JMLXQtdAGOqUBqx6tBLfBFZuttR7V5o3IoCjC%2FCeQ2Icp4KJVaMIDWpKJdu8I6NwgCY9t%2BJUiRUo3ZudPKbjcP53xjIHjB0wicsXlGHByhHZ1UGa%2B%2B8AFtRux%2Fkn4B9Ke0LxgTN8ao3rVtxc0aQQRSi2Kw%2F5JVmpJvu93B7juu07Ts4CwH3Dh1zhidQQLYvXU2jUvbY9%2B6Wmm2qS4XsrY50omD3KKrU5xRJCCIesf&X-Amz-Signature=bde3cfc18bffcfabd232ad9f29bb04a1b133df64370d12fd5223eccb04f4290e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
