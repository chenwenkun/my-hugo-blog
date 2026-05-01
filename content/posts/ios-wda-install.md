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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RIGYZRYW%2F20260501%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260501T080031Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFgaCXVzLXdlc3QtMiJIMEYCIQCk40p%2BmhWiLyufCottn4fFFeZ7y6%2BqXiNvdbicSeQcPQIhAMFcjr81r9cT5SYvSumoqmgt4Mt8nmBdCgQI2AO3ir1zKv8DCCEQABoMNjM3NDIzMTgzODA1Igx1d%2BfTlct0WnkGhVMq3AOj67pJDgXzRDABs6vhaZBXo%2B5pU0vmygd%2FkM%2FWPauiMt%2BxzatYvPqS42am9PPddPTVqSzYIrqUPJyUyxK4ZEw5KiiP%2Fbma%2B5JuU42qWFvl%2FuC9J7sVbYO7u7%2BN2NstIxJsh2eE%2F31lnm57FAGGEOAms3XDd8zx9vh3%2BfzNq%2B1B3s9ouPlnlB7aMFtQiH8F2v0MbLE5gtk1oW3wztB1ZYc4hlpMqMqFS8OTn3sIU%2FGMfmgzJvJpWWbP3AsARYQguO32L3US1piLLdwzw%2Ffm058t%2FC5Jj%2F%2FxMMakUa0zFpD%2FYXpwLaWvpkDeMnKTWiUOqBrNJA8i6GMf%2FZ5p3%2BtxbP%2BCvjFThTby%2F21qmpZVOP1BP4LfkF51Erm3c%2BBsgLG7Nle5tCTpfbzl9f7RaFnfVTvrS3FgcNKKPLZy5AG1nbA7PwxfPeMxLAfUW1zoa9931bjyr4c1tdbFRB%2BCpUZy1LDW3LTnKpLABp2C7%2FB6KbIEWx%2Fml9GrgKxZPNsn4ZBN9EkAAMFPy0zXzBSLwi5tNv7OrNfAsivfvIh4t2iuSsFaSyekMwM9oJDlvq8r96H1YrKgU1XgyCnL%2B1YGdwBTlmiTnUvxjV1t7GzK9JwUdL5XV1ZkbdemcHy8aSh7aDDytNHPBjqkAYptodKGhyOfzla32oZBjBYSOu6kpZWp%2BuLCI7hu68v8Lem5s4eGOLWCv3YVOIvOef9N57f6GlR04GSZ0RVJlIdWXTNGrLRWAmweLlapwKOwuDq8wE6ZKgtvL3FRviGB5hZDwANB5EtoDTDt6Mj7o%2BIbfYSwPzVd9YzVQiJLobi88sjiOti6XTavzeakdBJwjEj%2B1D7Vv%2BEytkpOU4EEyFgQdoMB&X-Amz-Signature=62cdbcf2fa13a1a02e1f5bbc8ef625871122d27548016cc0b830aa0b98cf7a59&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RIGYZRYW%2F20260501%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260501T080031Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFgaCXVzLXdlc3QtMiJIMEYCIQCk40p%2BmhWiLyufCottn4fFFeZ7y6%2BqXiNvdbicSeQcPQIhAMFcjr81r9cT5SYvSumoqmgt4Mt8nmBdCgQI2AO3ir1zKv8DCCEQABoMNjM3NDIzMTgzODA1Igx1d%2BfTlct0WnkGhVMq3AOj67pJDgXzRDABs6vhaZBXo%2B5pU0vmygd%2FkM%2FWPauiMt%2BxzatYvPqS42am9PPddPTVqSzYIrqUPJyUyxK4ZEw5KiiP%2Fbma%2B5JuU42qWFvl%2FuC9J7sVbYO7u7%2BN2NstIxJsh2eE%2F31lnm57FAGGEOAms3XDd8zx9vh3%2BfzNq%2B1B3s9ouPlnlB7aMFtQiH8F2v0MbLE5gtk1oW3wztB1ZYc4hlpMqMqFS8OTn3sIU%2FGMfmgzJvJpWWbP3AsARYQguO32L3US1piLLdwzw%2Ffm058t%2FC5Jj%2F%2FxMMakUa0zFpD%2FYXpwLaWvpkDeMnKTWiUOqBrNJA8i6GMf%2FZ5p3%2BtxbP%2BCvjFThTby%2F21qmpZVOP1BP4LfkF51Erm3c%2BBsgLG7Nle5tCTpfbzl9f7RaFnfVTvrS3FgcNKKPLZy5AG1nbA7PwxfPeMxLAfUW1zoa9931bjyr4c1tdbFRB%2BCpUZy1LDW3LTnKpLABp2C7%2FB6KbIEWx%2Fml9GrgKxZPNsn4ZBN9EkAAMFPy0zXzBSLwi5tNv7OrNfAsivfvIh4t2iuSsFaSyekMwM9oJDlvq8r96H1YrKgU1XgyCnL%2B1YGdwBTlmiTnUvxjV1t7GzK9JwUdL5XV1ZkbdemcHy8aSh7aDDytNHPBjqkAYptodKGhyOfzla32oZBjBYSOu6kpZWp%2BuLCI7hu68v8Lem5s4eGOLWCv3YVOIvOef9N57f6GlR04GSZ0RVJlIdWXTNGrLRWAmweLlapwKOwuDq8wE6ZKgtvL3FRviGB5hZDwANB5EtoDTDt6Mj7o%2BIbfYSwPzVd9YzVQiJLobi88sjiOti6XTavzeakdBJwjEj%2B1D7Vv%2BEytkpOU4EEyFgQdoMB&X-Amz-Signature=93bfc2289237ee4896793d3fcbf6cb4eb5a1f8f7659bb697a9185e19ddef72b0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
