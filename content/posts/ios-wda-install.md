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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665VULF26C%2F20251229%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251229T122444Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIB9hKt4NBSzappiHkcF%2BMpMP1dQQs%2FvPwslQqPEFzOJzAiAWg6Bk46Y32nPp2B1pZ44G8%2BCn%2Bs%2BsT%2F2KSxbb7FaTSiqIBAid%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMpPuTGV7H%2FQiSPrC6KtwDPfkLsZ26TYdNFDLCdbXlTzVq1qPk8fWxpJxUMpnL%2FBj%2FrdR7Sy3phABHucnYYVuIHBCyHKvQO2lXxrEBE7CwZ47SM0xPuyO3hlsNdn2SkSLbzSkogert%2FDxQTrqYy6XisQGwAuy5ZqBQjncGRdURxu%2FaHeqXt3vK3wlK9mJ70ZNgZfQfyK8NTZEt%2Bou1acZwbvl5tF3oabGahNLRj9j0EVwsFrOO0k286WWiuNWMBrCaN0T3Mw5n69FjdYyX6bpJLvthblLhWgS42gATuOnzrjlNxkQUs1dQLTx9D6b%2BAajFuhz%2Fsu%2F8kY15RD0BV2QBBwvZHkUgrC7cSvR24M1DxBkbNe7CFZhPHEvyMHmHmwD2GnEYKXsuPRm095xnGTf%2BAKyXI5QAm2EoynMTQziIPnoHIMzGgSzZfSu4GGP8JdMW3lRIBdVy8E1QnVqk%2BAA6B0EMPrkkt67vfhPhO2uLItXEbUNRkD1shnCZJaoxixLTVK2uIhUI9hXmujnOhvWL37%2FNbIK74Q4nGzbOgsB0vLPvnfxFMmu6jreabHnsXWHqkXtEmS556%2Fn11WmM3r2TLjiORD4lnfUVpETPMmTEOcR%2F%2BNEQXpg4FL3lMPXVYctNZFxy7qQqXZnZEMYw3d%2FJygY6pgHXNv6XfpjS%2BOiANMYmjkPAgPvJjaRTSR5iq0vI7x0DIhCyuuyZbuXhOjYjirFp5NYii4ETGukTREwa1vk1JcNcsfdx9K95A17nrAhg1g79%2FVsFnqe%2BFwF2lOZn0shwpBdo6ROgpTLzC7igW2cKm%2FTGPp4DdsUYJOiZzaMa%2FvR%2BugtoyBSYPztq68ME0LMFTz7FHNV7vfhURJtJ28O0JVIri1HTo6GD&X-Amz-Signature=afd5afea41f4a62f856d7f229e8f1889685dd0a4af4391201dc0e2fa722574bc&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665VULF26C%2F20251229%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251229T122443Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIB9hKt4NBSzappiHkcF%2BMpMP1dQQs%2FvPwslQqPEFzOJzAiAWg6Bk46Y32nPp2B1pZ44G8%2BCn%2Bs%2BsT%2F2KSxbb7FaTSiqIBAid%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMpPuTGV7H%2FQiSPrC6KtwDPfkLsZ26TYdNFDLCdbXlTzVq1qPk8fWxpJxUMpnL%2FBj%2FrdR7Sy3phABHucnYYVuIHBCyHKvQO2lXxrEBE7CwZ47SM0xPuyO3hlsNdn2SkSLbzSkogert%2FDxQTrqYy6XisQGwAuy5ZqBQjncGRdURxu%2FaHeqXt3vK3wlK9mJ70ZNgZfQfyK8NTZEt%2Bou1acZwbvl5tF3oabGahNLRj9j0EVwsFrOO0k286WWiuNWMBrCaN0T3Mw5n69FjdYyX6bpJLvthblLhWgS42gATuOnzrjlNxkQUs1dQLTx9D6b%2BAajFuhz%2Fsu%2F8kY15RD0BV2QBBwvZHkUgrC7cSvR24M1DxBkbNe7CFZhPHEvyMHmHmwD2GnEYKXsuPRm095xnGTf%2BAKyXI5QAm2EoynMTQziIPnoHIMzGgSzZfSu4GGP8JdMW3lRIBdVy8E1QnVqk%2BAA6B0EMPrkkt67vfhPhO2uLItXEbUNRkD1shnCZJaoxixLTVK2uIhUI9hXmujnOhvWL37%2FNbIK74Q4nGzbOgsB0vLPvnfxFMmu6jreabHnsXWHqkXtEmS556%2Fn11WmM3r2TLjiORD4lnfUVpETPMmTEOcR%2F%2BNEQXpg4FL3lMPXVYctNZFxy7qQqXZnZEMYw3d%2FJygY6pgHXNv6XfpjS%2BOiANMYmjkPAgPvJjaRTSR5iq0vI7x0DIhCyuuyZbuXhOjYjirFp5NYii4ETGukTREwa1vk1JcNcsfdx9K95A17nrAhg1g79%2FVsFnqe%2BFwF2lOZn0shwpBdo6ROgpTLzC7igW2cKm%2FTGPp4DdsUYJOiZzaMa%2FvR%2BugtoyBSYPztq68ME0LMFTz7FHNV7vfhURJtJ28O0JVIri1HTo6GD&X-Amz-Signature=3b5ce83b76120bbc4ec5a480084871abd70559dd23ca4a231357963add669b5c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
