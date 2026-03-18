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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZWCK7TFZ%2F20260318%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260318T011522Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDEaCXVzLXdlc3QtMiJGMEQCIA6IuzA%2FuiYjysCRxgXEiTn%2FL3ZJKj%2FEpfeQMVde5MSFAiB7RvlY%2B0G0nIzdkY1drrDXUAvCuj5eNv8jetoCgeIzAiqIBAj6%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM7gKSoN6s9BX%2B5iAsKtwDfxsh7CwdHJ6ZBqpZJMAqZEh36E3575sHlS1R9sZtDWHOXzum8qI2j%2BNLtwHLZ7m%2FXuC%2BgU5VYv40wzHYrj9PpkPVcB%2Fb2hJJCzgaawqNLlSk55V2lsQ6zvzEEBdPsq56u9D%2BoyBdhKA1T3aEjEDMu4zXejfoytWkPIZW9yx7QjDtwg4Pjx6UttMwd3%2FF3ph3%2BAw5g5bXywgioh47OfzVygSx%2F1d%2B9bK7nUR5XkWqc6lEQa9lUr054vM66ufTc6Kwwpz8w1RCK3mi4HOy9mPJtd4BCr2kIczPfkAmXPiITcZJ2TgAiGmMkHjzpQtgqyfCDVgfKDiXjN5RwxEF1vOQ7zilxsxxsyLRThdX7lwzAvB04Cgav5PDnWAZZmpwiiuFw6LR%2BsL2YnYeZz4w7w3gnKkTSdRST7H2CYoY8vzz8CAWEAjB1s10xAuNIPD3xAWEre5at%2FSgkNYY5Atu6QRJMKuGqViBVnAHiS6zxwfCJfrdF1EkpzMf%2Bke18kdOl%2BC4bVebSLAyCLbwV5ZYFgjBogVwOAkXcbjVqbJXfJ%2BJSK%2B0S6J5omFrIr6TovRy0C4GCnohGPv1hgQY%2BO1xVadYKa5db7zNehZWKeZORFB0L6BfCfh41BaFB02JtFMw5%2BnnzQY6pgGZU3Y8pT%2F7rAzE3Q%2BEHz40BJ7NpSxWNIRQjCrdQYIDzOyQs4Xv7%2FvV9Qmk4Kvjn7%2BF2X4DPwhyl4VFaZN0BWrFiQd9B72Csp%2FlAJIs%2FGCQyd3nILtPgbxH6kXFl01Y9nM8o3SwI5rLXLG8BeoBhrAiF1VpLo%2BKLpdkcakX6XnVhd%2FsyHSLVzIBJGpp9HbwG3OjUF0g8qMY%2Bj%2FCGtVUM2rqM%2Bgr%2F%2F%2BG&X-Amz-Signature=7ad0d96af398c745a86fefa7b8d636b994b2165f2406b7934426be28fd9245d2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZWCK7TFZ%2F20260318%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260318T011522Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDEaCXVzLXdlc3QtMiJGMEQCIA6IuzA%2FuiYjysCRxgXEiTn%2FL3ZJKj%2FEpfeQMVde5MSFAiB7RvlY%2B0G0nIzdkY1drrDXUAvCuj5eNv8jetoCgeIzAiqIBAj6%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM7gKSoN6s9BX%2B5iAsKtwDfxsh7CwdHJ6ZBqpZJMAqZEh36E3575sHlS1R9sZtDWHOXzum8qI2j%2BNLtwHLZ7m%2FXuC%2BgU5VYv40wzHYrj9PpkPVcB%2Fb2hJJCzgaawqNLlSk55V2lsQ6zvzEEBdPsq56u9D%2BoyBdhKA1T3aEjEDMu4zXejfoytWkPIZW9yx7QjDtwg4Pjx6UttMwd3%2FF3ph3%2BAw5g5bXywgioh47OfzVygSx%2F1d%2B9bK7nUR5XkWqc6lEQa9lUr054vM66ufTc6Kwwpz8w1RCK3mi4HOy9mPJtd4BCr2kIczPfkAmXPiITcZJ2TgAiGmMkHjzpQtgqyfCDVgfKDiXjN5RwxEF1vOQ7zilxsxxsyLRThdX7lwzAvB04Cgav5PDnWAZZmpwiiuFw6LR%2BsL2YnYeZz4w7w3gnKkTSdRST7H2CYoY8vzz8CAWEAjB1s10xAuNIPD3xAWEre5at%2FSgkNYY5Atu6QRJMKuGqViBVnAHiS6zxwfCJfrdF1EkpzMf%2Bke18kdOl%2BC4bVebSLAyCLbwV5ZYFgjBogVwOAkXcbjVqbJXfJ%2BJSK%2B0S6J5omFrIr6TovRy0C4GCnohGPv1hgQY%2BO1xVadYKa5db7zNehZWKeZORFB0L6BfCfh41BaFB02JtFMw5%2BnnzQY6pgGZU3Y8pT%2F7rAzE3Q%2BEHz40BJ7NpSxWNIRQjCrdQYIDzOyQs4Xv7%2FvV9Qmk4Kvjn7%2BF2X4DPwhyl4VFaZN0BWrFiQd9B72Csp%2FlAJIs%2FGCQyd3nILtPgbxH6kXFl01Y9nM8o3SwI5rLXLG8BeoBhrAiF1VpLo%2BKLpdkcakX6XnVhd%2FsyHSLVzIBJGpp9HbwG3OjUF0g8qMY%2Bj%2FCGtVUM2rqM%2Bgr%2F%2F%2BG&X-Amz-Signature=e5bd28849b0e5bf4de6a4634753d7ef034319e8e6c6917dc973432521832e5dc&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
