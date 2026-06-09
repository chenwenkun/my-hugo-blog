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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666RDHTMQ6%2F20260609%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260609T142314Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAYaCXVzLXdlc3QtMiJGMEQCICIMtRdqkX%2B5c43umgeCbWjzivb%2FK8tv3jDbJ8RGrK4bAiBbpZnDUDdDKTGnYwBw2On%2Fd0de9kFXdiuF7jCnxV2xHSqIBAjP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMkmHwi2Xt7MyCBzTXKtwDZPHtuOXm%2BIhc4P5UODodnmkOZBOi03Fn6suvFyoZASDfNGCltatadx9J3cte9jbEeDXzX2UzYBrbTAp29XJ7OySeJIXibr7%2Bpex%2FyRkf5oqgzlRmkrNnz%2FFselo0no3otNoAkGK16oHr7MJ8951%2FWjTqlV6y5AfBha2de5wSkHoHNLk6atTh9%2FYaL4xKQ6FY8LEZJgCjjqRmhjhCpT0zFCC90SdYUAtKTfyWU1sfoqL429uNAOSKy30B8CHNjPgNpxflHxAqG89S%2BAOJ1PjxACilJPT37ba4Y%2BIMCjhcmlgN40Jwn5KWb5AesCamrbfxgD%2BaHHjp9%2Bia1oCI1f7bo1hlLVvppmXEabRSI2D3ZLioM89X314ADOZD5meo9R7poiUkUlxTKdaQaqRNqaGlKjZhKnPHyv%2BmxHPKCP0aaYSzHhxK9B5SBZ%2BZFoZrfEmsmeGNUduMlBv0povqoVt%2FNufuYplGoHnAxh1Zv9KsZPIR9zHTlIvuzl%2FUZ2eT2kH9DZJBDHP8zGnI7JmufJhjbmxkKv3ixuE3rH40gm9rMJyeTzBVuRk9VcA%2BiLhuWGzZxdBeMdJpeP6p%2BHzC9GVSA5BhFbPHiVGEe7jTTgKaMzVBh%2FPtMz5y2Qkga%2FwwmLig0QY6pgFr9LoD52iykuN3RFpgvHuw8902kDu7bFgwN2CXlxaRSJMmuCwkVlImUycZIfvQK7%2FZ%2BCQZ5o5iZjtbaIZKcU3i6ocPfhiBKKy8Jot34QxKWEIvmsJ51v7Bvl8ESqAEi8d%2BOUJY8KMUZdgvzl90LB2Q7C3b7g2SEMKXcRZD2n8Zi%2FwnGFiTvJs5xYyexamKEycb80H8675r1GF39vtNIuqIzFJqIYst&X-Amz-Signature=9d5010ba0f863cc4098b996edeab8badb743a238e224b97a73e20991c198fc4b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666RDHTMQ6%2F20260609%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260609T142314Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAYaCXVzLXdlc3QtMiJGMEQCICIMtRdqkX%2B5c43umgeCbWjzivb%2FK8tv3jDbJ8RGrK4bAiBbpZnDUDdDKTGnYwBw2On%2Fd0de9kFXdiuF7jCnxV2xHSqIBAjP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMkmHwi2Xt7MyCBzTXKtwDZPHtuOXm%2BIhc4P5UODodnmkOZBOi03Fn6suvFyoZASDfNGCltatadx9J3cte9jbEeDXzX2UzYBrbTAp29XJ7OySeJIXibr7%2Bpex%2FyRkf5oqgzlRmkrNnz%2FFselo0no3otNoAkGK16oHr7MJ8951%2FWjTqlV6y5AfBha2de5wSkHoHNLk6atTh9%2FYaL4xKQ6FY8LEZJgCjjqRmhjhCpT0zFCC90SdYUAtKTfyWU1sfoqL429uNAOSKy30B8CHNjPgNpxflHxAqG89S%2BAOJ1PjxACilJPT37ba4Y%2BIMCjhcmlgN40Jwn5KWb5AesCamrbfxgD%2BaHHjp9%2Bia1oCI1f7bo1hlLVvppmXEabRSI2D3ZLioM89X314ADOZD5meo9R7poiUkUlxTKdaQaqRNqaGlKjZhKnPHyv%2BmxHPKCP0aaYSzHhxK9B5SBZ%2BZFoZrfEmsmeGNUduMlBv0povqoVt%2FNufuYplGoHnAxh1Zv9KsZPIR9zHTlIvuzl%2FUZ2eT2kH9DZJBDHP8zGnI7JmufJhjbmxkKv3ixuE3rH40gm9rMJyeTzBVuRk9VcA%2BiLhuWGzZxdBeMdJpeP6p%2BHzC9GVSA5BhFbPHiVGEe7jTTgKaMzVBh%2FPtMz5y2Qkga%2FwwmLig0QY6pgFr9LoD52iykuN3RFpgvHuw8902kDu7bFgwN2CXlxaRSJMmuCwkVlImUycZIfvQK7%2FZ%2BCQZ5o5iZjtbaIZKcU3i6ocPfhiBKKy8Jot34QxKWEIvmsJ51v7Bvl8ESqAEi8d%2BOUJY8KMUZdgvzl90LB2Q7C3b7g2SEMKXcRZD2n8Zi%2FwnGFiTvJs5xYyexamKEycb80H8675r1GF39vtNIuqIzFJqIYst&X-Amz-Signature=f33a85d6432062f27d4a7d73a4cc6d8b142444300471476ccd7769c9aceaf807&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
