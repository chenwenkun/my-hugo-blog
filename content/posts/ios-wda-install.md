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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664JM4ETJJ%2F20260211%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260211T012002Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIE1GXYH8G7RXp2qnrFzuOJNWQLyGm0dNFg2qKZC9D441AiBa3loXVgOn5i1nsp2YBmFgvYiQjj%2F1W%2BD5E33xYPby6yqIBAiy%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMyqKC6xbiTSZ90n%2BrKtwDrlkeeYbQp8lkgPZQVsYQmE3IXdUierlfXrB%2BqWWK9%2BVq9ccfY7snSr%2FC94ttqvm%2B5Ncc4Xc4lics08zRyULdQgLjwBWRQsPoAGk87viFd7tCxPHaSmrob%2FPuJBXZDDEeMGi599WmYi1zpBTRJy%2ByoFk3O%2BhfTBRjDK9mSDg90VT3riFc0T2S5uvNVhOvuD1KwGDIDwjLh6NSnjk6arPkI7rTCMOBxEMDZhHcR1YC2uDOLtFmDgVu8VWn5C9pbzjlfeMnDiphl9nEurbILtzxEMKLMi%2BdvqZMN9gPJ%2B4L6jOqRs0PZPrBGosHOCJ4sbQP8UHD4iC%2FLAILjad%2BXyJe4OSE9qhh%2BCbJHAIaooZgV4%2F30obBVsiz99TE8ecWA7pH2HMd2R8IK5yp3CRLDzBPCj4qzAdm4y0wbOIFmE0Lj0DM%2BV1ZtewJUHOZs%2Bmiz%2Bf1t%2FzxGiu7zoFQ%2F9kQjR5N9Mj6SAz%2BPwCmtjJDz%2FArXh3zuDHEEcsXMHDW7bQOHLA3ANEcoeHfrKrLVxsm%2Bh%2BtPD%2BJ%2F90XhoLUBoZrZkO%2FG4e6SjL0QeRdgbQbeE98czozIDfUlUJmxInMUdT%2B3YKK%2FWTrd7p1FjvL91b70cNWbt%2BRsqTLMeBfJ%2BJ6HecwsKWvzAY6pgHV9qmlvuERmMkyUISzGHHkzN6uiYlwlGFlw8rmj2QRyYN7aBrcYPViTNCaNT43vVjfGjp8S0gsckSYwG069cWzM89YAEYPpdzBCjYnXDrjm4scQJ7vAh%2F1Q%2FW9HbhJu3WQSUOLqEMPXhvpWiu%2BJumklO7eX4mv%2BPY%2B1I9yXTZUPi307VM9UShzq%2F1L2C9yBA22LxDLLgJybIP3XkzK5IfJP8gHvuz6&X-Amz-Signature=ca667bcea747aa944d5ae1f62b2a9a5da8d9f4c69c2577dafbb70d9e983755e3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664JM4ETJJ%2F20260211%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260211T012002Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIE1GXYH8G7RXp2qnrFzuOJNWQLyGm0dNFg2qKZC9D441AiBa3loXVgOn5i1nsp2YBmFgvYiQjj%2F1W%2BD5E33xYPby6yqIBAiy%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMyqKC6xbiTSZ90n%2BrKtwDrlkeeYbQp8lkgPZQVsYQmE3IXdUierlfXrB%2BqWWK9%2BVq9ccfY7snSr%2FC94ttqvm%2B5Ncc4Xc4lics08zRyULdQgLjwBWRQsPoAGk87viFd7tCxPHaSmrob%2FPuJBXZDDEeMGi599WmYi1zpBTRJy%2ByoFk3O%2BhfTBRjDK9mSDg90VT3riFc0T2S5uvNVhOvuD1KwGDIDwjLh6NSnjk6arPkI7rTCMOBxEMDZhHcR1YC2uDOLtFmDgVu8VWn5C9pbzjlfeMnDiphl9nEurbILtzxEMKLMi%2BdvqZMN9gPJ%2B4L6jOqRs0PZPrBGosHOCJ4sbQP8UHD4iC%2FLAILjad%2BXyJe4OSE9qhh%2BCbJHAIaooZgV4%2F30obBVsiz99TE8ecWA7pH2HMd2R8IK5yp3CRLDzBPCj4qzAdm4y0wbOIFmE0Lj0DM%2BV1ZtewJUHOZs%2Bmiz%2Bf1t%2FzxGiu7zoFQ%2F9kQjR5N9Mj6SAz%2BPwCmtjJDz%2FArXh3zuDHEEcsXMHDW7bQOHLA3ANEcoeHfrKrLVxsm%2Bh%2BtPD%2BJ%2F90XhoLUBoZrZkO%2FG4e6SjL0QeRdgbQbeE98czozIDfUlUJmxInMUdT%2B3YKK%2FWTrd7p1FjvL91b70cNWbt%2BRsqTLMeBfJ%2BJ6HecwsKWvzAY6pgHV9qmlvuERmMkyUISzGHHkzN6uiYlwlGFlw8rmj2QRyYN7aBrcYPViTNCaNT43vVjfGjp8S0gsckSYwG069cWzM89YAEYPpdzBCjYnXDrjm4scQJ7vAh%2F1Q%2FW9HbhJu3WQSUOLqEMPXhvpWiu%2BJumklO7eX4mv%2BPY%2B1I9yXTZUPi307VM9UShzq%2F1L2C9yBA22LxDLLgJybIP3XkzK5IfJP8gHvuz6&X-Amz-Signature=3f3e1c73e37ce5a168eb122e2e202366af1208eed5cbafa46121c8007198e09a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
