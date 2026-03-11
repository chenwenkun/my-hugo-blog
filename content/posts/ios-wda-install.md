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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZWTQUCW6%2F20260311%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260311T063842Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDsh5cq%2FEd43n7BZK6oooFc%2FCdofYa%2BqKs3nMOmYiOzMgIgRVVCFkdICnbSc0zRPPP2%2F56gwGWFtBP%2FBwhWatkIYxgq%2FwMIVxAAGgw2Mzc0MjMxODM4MDUiDF7odJJeYEiCW9c5FCrcAxMPL85F1%2F48gv1DUNE%2BBN1qIBzBfgA7T2RqqDOr2QTB7Ynuot3fYCmdZWzlexMv1lUorATzfJbqaEJTvIZM42WasSE0bMrl%2FyzcMI3EqmBY65hpi6qtLht8%2F%2B67cqPvj1xhAt500C%2BKYu60sRqSzLpf5ygPHHEz5ARrcn%2Br9aZ07O1nzJfXZzgZT%2F32%2F6hxrGerOT%2FQzsU%2BgLmJZLdddgxXR8NLS7i%2F56knPnOxqnp3pUt%2BjIeDNpodLeG2%2FbU5hP%2BIIfBguOUf4p3csv2ir2bLyMSzhUALMpkEmBkWH%2FYR4Igbd%2FSPB%2B0fk0N6TCGa0dVvvKyAiqq2AeNay%2FfPE%2BEXHSXkmBeYTz1%2BbNFqg190wrOKHTiWaZI5Hak%2B6Pyjvkv7RUwtftS68BCJMHIzh9I2kw7qDLebzE1HZdrkv0Pqfkvm8XptFjJwWN16m1AqrcEhk39KviVJ7h2YVYLTfYwqXYnJ3Rmx2owkCDs9t8UZcuFhojUYejLwuHCRRLIFiddnIzqfH9tVobYB4nW9mp3DpIRDVqS3uj7BZdvFmA0XC26hiz2RWO9zoP8%2BRlqn%2FbvbSUP8UZ8BmhlrQKIh3TKHPtcAY7vP1X8N3mc7LCuG%2BiqCL6yX%2BdKTyFXTMP6LxM0GOqUB5Rou4jSjyB0pVLjH25xtbK1zNQUr5FlruPytQ9nYAWGc8fMKmVA6You8t4n53tfNZU70%2Bq3chdAPW28tokBwlPfxLjwfaI7Obk%2FqvayuXCejS68G7%2B1UaWewcYXXrC0FgJzB7dMet%2BwpwqJ0G9mnPNFbeX7TW2UiOTb7bqm7NbWNJ66CFVeK8hZrbr7wltIInsDKaUR6Gyv9OcpU1lfAvfgAF1b1&X-Amz-Signature=a118318866b4f35f5fa945eade29764c0d60fd56253b65ae165969404fbdcaf3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZWTQUCW6%2F20260311%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260311T063842Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDsh5cq%2FEd43n7BZK6oooFc%2FCdofYa%2BqKs3nMOmYiOzMgIgRVVCFkdICnbSc0zRPPP2%2F56gwGWFtBP%2FBwhWatkIYxgq%2FwMIVxAAGgw2Mzc0MjMxODM4MDUiDF7odJJeYEiCW9c5FCrcAxMPL85F1%2F48gv1DUNE%2BBN1qIBzBfgA7T2RqqDOr2QTB7Ynuot3fYCmdZWzlexMv1lUorATzfJbqaEJTvIZM42WasSE0bMrl%2FyzcMI3EqmBY65hpi6qtLht8%2F%2B67cqPvj1xhAt500C%2BKYu60sRqSzLpf5ygPHHEz5ARrcn%2Br9aZ07O1nzJfXZzgZT%2F32%2F6hxrGerOT%2FQzsU%2BgLmJZLdddgxXR8NLS7i%2F56knPnOxqnp3pUt%2BjIeDNpodLeG2%2FbU5hP%2BIIfBguOUf4p3csv2ir2bLyMSzhUALMpkEmBkWH%2FYR4Igbd%2FSPB%2B0fk0N6TCGa0dVvvKyAiqq2AeNay%2FfPE%2BEXHSXkmBeYTz1%2BbNFqg190wrOKHTiWaZI5Hak%2B6Pyjvkv7RUwtftS68BCJMHIzh9I2kw7qDLebzE1HZdrkv0Pqfkvm8XptFjJwWN16m1AqrcEhk39KviVJ7h2YVYLTfYwqXYnJ3Rmx2owkCDs9t8UZcuFhojUYejLwuHCRRLIFiddnIzqfH9tVobYB4nW9mp3DpIRDVqS3uj7BZdvFmA0XC26hiz2RWO9zoP8%2BRlqn%2FbvbSUP8UZ8BmhlrQKIh3TKHPtcAY7vP1X8N3mc7LCuG%2BiqCL6yX%2BdKTyFXTMP6LxM0GOqUB5Rou4jSjyB0pVLjH25xtbK1zNQUr5FlruPytQ9nYAWGc8fMKmVA6You8t4n53tfNZU70%2Bq3chdAPW28tokBwlPfxLjwfaI7Obk%2FqvayuXCejS68G7%2B1UaWewcYXXrC0FgJzB7dMet%2BwpwqJ0G9mnPNFbeX7TW2UiOTb7bqm7NbWNJ66CFVeK8hZrbr7wltIInsDKaUR6Gyv9OcpU1lfAvfgAF1b1&X-Amz-Signature=dedc29dfe9d957de65dd58559a6923b31fabe5a0018a3f2017020f93b3d99fd3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
