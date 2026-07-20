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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UH2JHLAB%2F20260720%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260720T083802Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDh7dT3TEegdxCMNAkIHcOesobIUS%2BSfPoZEkgokhAK%2FgIgbbDeJup9uJDH7CgY85cKw%2FDVX9WUYDHjSa7uajH7NS0qiAQIof%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNYQw5KneOdfRkQqDyrcA1HiVQKfidirK2uAZl1nKkZLx91ckp7TjKPUH7JEnpm9WEHcqD0ZtDqi5xxwbpX%2FIoMQAiQaLASAC6Q3sQ7ApkCcV9MSnv2%2Bnk83AlSsdKb6d6INtjown0U98eSWvaPGMbjyoUE2Btq6qoX5EveKwTYyC9%2FYZRK%2F2PkeWLhznS%2BWtxxQJJPSvAhw5IAtXyELLpbIMqiNi8WPAeMnXXUTzKpgpZRoVYa0%2B%2BEI0nyoON4vgXDXs%2F28ZfiA5XRQcP26L1B2znxFPpJ2N%2BaXiVkeMjxNFT%2BdS9%2FntgfK9qbBEojTuTwpURq8rjQHDI3ANP%2BEjZ6JFZVw7Bx8nHZDMMMYTW3aJHqlEbLf5AMgry7lJJGSrOobMj%2BaK%2BHq2BX4CGGXlxAIA%2FV%2FouSC6Aqd1zgweEEznJB6TzBseJqo6hWW0BILp6ceam2touLglwNP05%2BA1BuFDiek4VTl4KTjdTPAxUcjqwWo25H0XWUNvPi9ijhdIKVK%2F3VIY%2BDpogozvw3PdudUBvKAwX%2FxDISXhdC9utNoo%2BVGcUUGNdG9h5RO%2FB7WR4uZqsBjfmXQ3WvgSYzOgmpwraFf9Wu%2F4v%2F27R5CFnFRGLkBoWEprbtjvlELt9eIoNWgep%2B%2F9EzNYteKMMGc99IGOqUBhJqdkUZjP4JUw7njfwA%2F19hma4dNrL%2B4xVZGnBVhNpPetHRsAytUVfUo2LQdneXwGELQNkZ9AcHAVUKfV84A4350JNiKmdF0SXrz6ONMUPJ7CM2q33rObP5Ixfbz9LyxzdrterttN%2FrjmL9EWes68USzVe9LgETe1%2FhMuaUtZBENUNSlFYxBbW4tbldeSsyGEW2KPd2AxGxQgcfo9MK6WlxC1Vl5&X-Amz-Signature=722a6f5d0f1fc6d1d1dc2e0c316207301cb601775296eb9984710095e7b0f303&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UH2JHLAB%2F20260720%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260720T083802Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDh7dT3TEegdxCMNAkIHcOesobIUS%2BSfPoZEkgokhAK%2FgIgbbDeJup9uJDH7CgY85cKw%2FDVX9WUYDHjSa7uajH7NS0qiAQIof%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNYQw5KneOdfRkQqDyrcA1HiVQKfidirK2uAZl1nKkZLx91ckp7TjKPUH7JEnpm9WEHcqD0ZtDqi5xxwbpX%2FIoMQAiQaLASAC6Q3sQ7ApkCcV9MSnv2%2Bnk83AlSsdKb6d6INtjown0U98eSWvaPGMbjyoUE2Btq6qoX5EveKwTYyC9%2FYZRK%2F2PkeWLhznS%2BWtxxQJJPSvAhw5IAtXyELLpbIMqiNi8WPAeMnXXUTzKpgpZRoVYa0%2B%2BEI0nyoON4vgXDXs%2F28ZfiA5XRQcP26L1B2znxFPpJ2N%2BaXiVkeMjxNFT%2BdS9%2FntgfK9qbBEojTuTwpURq8rjQHDI3ANP%2BEjZ6JFZVw7Bx8nHZDMMMYTW3aJHqlEbLf5AMgry7lJJGSrOobMj%2BaK%2BHq2BX4CGGXlxAIA%2FV%2FouSC6Aqd1zgweEEznJB6TzBseJqo6hWW0BILp6ceam2touLglwNP05%2BA1BuFDiek4VTl4KTjdTPAxUcjqwWo25H0XWUNvPi9ijhdIKVK%2F3VIY%2BDpogozvw3PdudUBvKAwX%2FxDISXhdC9utNoo%2BVGcUUGNdG9h5RO%2FB7WR4uZqsBjfmXQ3WvgSYzOgmpwraFf9Wu%2F4v%2F27R5CFnFRGLkBoWEprbtjvlELt9eIoNWgep%2B%2F9EzNYteKMMGc99IGOqUBhJqdkUZjP4JUw7njfwA%2F19hma4dNrL%2B4xVZGnBVhNpPetHRsAytUVfUo2LQdneXwGELQNkZ9AcHAVUKfV84A4350JNiKmdF0SXrz6ONMUPJ7CM2q33rObP5Ixfbz9LyxzdrterttN%2FrjmL9EWes68USzVe9LgETe1%2FhMuaUtZBENUNSlFYxBbW4tbldeSsyGEW2KPd2AxGxQgcfo9MK6WlxC1Vl5&X-Amz-Signature=04c4c632cc9776a62d99e3e10ad6a0ce44bba6a59ebb7273488c494742aa2daa&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
