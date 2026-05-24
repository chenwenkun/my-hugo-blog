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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466S7UT6DK6%2F20260524%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260524T020904Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHoaCXVzLXdlc3QtMiJIMEYCIQD6MvBki2Kdf2zFFVfjIsidy7z8jIwJWrSEbqbCLLvuRQIhAO5%2FMMyt%2BCF0L8RwXXqcJFgkkbK58anJoovKueaLVWTnKv8DCEMQABoMNjM3NDIzMTgzODA1IgzTFNS7JUvS2YtZAjsq3APNrej6M4c0OiVdEmDvlC2g0wNrSlX95thEzSfDJ3fgXYWtUWBGlJjDFFOV8z%2Bx51svkB93gk%2BcOjIYwfbAyxlP8QQS91rHtloZPTg8613Ke%2F57Kg3iGbyZ%2BTxQYgPVfVHVVdyb%2B%2F3mQHCPElTTuTYdXTGVZA0eiOg4AMfi5xYQspPzFjoYk5FmSgvUS1lZt%2BreCiMhNz7HX9GfjPWvRL1nmDPikrJOJjg1mOhzY%2B1WxBMsqjcK0A20CU7rOXsUEKkAmwY9ynaq6hbkE8qe%2Bi4i%2FRRVMh9XfSHpgZ12sO%2F8Y9S1IIOqjzsST9jZFzP%2FR7Zg87JHg1h6J2M0DGY3BNSzZf0WAKUhvqfN85lc5gTqZo2qm10tVg19%2B0FdDgPIzwTLpsulYiakhJXckXv3oIVzdfKo26AEoYXHJZr%2FGJeHK9nvB0U16ZsLpU%2Bbm6k5bllOktPrlJasZDLWGuFn5gzubakbakZt%2FZKaI04s86jAgKhsJk6bo1VP8k2aki5YpSMhQlPixHyZSHjibkoGFQmkvlRMC2N94IaWDVyAEtTOaicLG7ZQjUvSDbbztDqNSAkFfRnYqyvotz%2FkvoAikzkn9ySuxfy1jAy39OfDZ3bXVRzl8dAZpUJ17p%2BFnDD4qMnQBjqkAZXgrndj94UmnZ3xfsf8Q40mrEtV6PHy61iQCD6XgHeQmLaiXzRo18ZJ1EWNdiM44yEqd7it79zG9cAlF3PiRl2MXHnF%2BR1siQNnIojwRuJ5lwT789uVCqjGQ%2B%2B5yQ0Hm%2F2e5Zq87%2FovsoFZeyIexCgHWnYcSKJ7SUEYysjebgdCKmwkC%2FVHm3T%2FrRVn0Fl%2FOIQrZqbSZ92921rIF1wKzMNloXu3&X-Amz-Signature=ac5ef5cab5a73fa468575a7bb8147b42af0c5b838c00c29e4ad92fb100af4009&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466S7UT6DK6%2F20260524%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260524T020904Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHoaCXVzLXdlc3QtMiJIMEYCIQD6MvBki2Kdf2zFFVfjIsidy7z8jIwJWrSEbqbCLLvuRQIhAO5%2FMMyt%2BCF0L8RwXXqcJFgkkbK58anJoovKueaLVWTnKv8DCEMQABoMNjM3NDIzMTgzODA1IgzTFNS7JUvS2YtZAjsq3APNrej6M4c0OiVdEmDvlC2g0wNrSlX95thEzSfDJ3fgXYWtUWBGlJjDFFOV8z%2Bx51svkB93gk%2BcOjIYwfbAyxlP8QQS91rHtloZPTg8613Ke%2F57Kg3iGbyZ%2BTxQYgPVfVHVVdyb%2B%2F3mQHCPElTTuTYdXTGVZA0eiOg4AMfi5xYQspPzFjoYk5FmSgvUS1lZt%2BreCiMhNz7HX9GfjPWvRL1nmDPikrJOJjg1mOhzY%2B1WxBMsqjcK0A20CU7rOXsUEKkAmwY9ynaq6hbkE8qe%2Bi4i%2FRRVMh9XfSHpgZ12sO%2F8Y9S1IIOqjzsST9jZFzP%2FR7Zg87JHg1h6J2M0DGY3BNSzZf0WAKUhvqfN85lc5gTqZo2qm10tVg19%2B0FdDgPIzwTLpsulYiakhJXckXv3oIVzdfKo26AEoYXHJZr%2FGJeHK9nvB0U16ZsLpU%2Bbm6k5bllOktPrlJasZDLWGuFn5gzubakbakZt%2FZKaI04s86jAgKhsJk6bo1VP8k2aki5YpSMhQlPixHyZSHjibkoGFQmkvlRMC2N94IaWDVyAEtTOaicLG7ZQjUvSDbbztDqNSAkFfRnYqyvotz%2FkvoAikzkn9ySuxfy1jAy39OfDZ3bXVRzl8dAZpUJ17p%2BFnDD4qMnQBjqkAZXgrndj94UmnZ3xfsf8Q40mrEtV6PHy61iQCD6XgHeQmLaiXzRo18ZJ1EWNdiM44yEqd7it79zG9cAlF3PiRl2MXHnF%2BR1siQNnIojwRuJ5lwT789uVCqjGQ%2B%2B5yQ0Hm%2F2e5Zq87%2FovsoFZeyIexCgHWnYcSKJ7SUEYysjebgdCKmwkC%2FVHm3T%2FrRVn0Fl%2FOIQrZqbSZ92921rIF1wKzMNloXu3&X-Amz-Signature=44f9ffe0ae7c7a4063f8cdfe40cb7d94925d677718a0d357144d84283f31db2d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
