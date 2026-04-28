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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665XH5EL3K%2F20260428%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260428T015514Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAoaCXVzLXdlc3QtMiJGMEQCIDRBEz4qb9lYDWNFgRIkHlvS4Y5Hu%2Fmbs39HZA1TizVOAiB8gCuvm%2Fm6Eg5szvBhlPeF4qO0FtkkJ9UaZqbsyBTFoyqIBAjT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMQLrLkhakvXmrjcUcKtwDzK%2BDbuCGtTn%2FutYzZTZp4kJicO9yIwG3DOoInvBboo18uf3%2Fhi7n0vScwHc1SnnVTIyEdsaWQvJTTOXLeR%2BuD%2BGPTuXBhZHVHoNzzQTqhCnJgZrhyL%2FaerApt6uabd9ierZOSfOp%2Bhc77m6VNcjGRKj2sGj69MzhyY0paeAVUnRDQgIAuZl8gzCAqmwf6Vt6KZE%2BXctk825YSQPzzWvJEtrZByMbDesi12eVJTlXaaEKgwVqqE2A505g270TBxaLjECWopBoxtugDty%2F4RnHyIjl5waFqvoLwUTY1RRjF02eT3UtHOB1suN33q22fKFtWojhq3%2BErQN2NgO%2FvA3nVOyXcwt1lAO2vJ6MTjq3E%2FrbP9RDRBNGvqZ0zJs1%2BptCPeuPjFdcwSgEpMR8KCEki1LNngdlt7BL8bwet6sN7HmJlcwmW8nWCuy2pegDaeQIbMH3vy9nRndtR%2BuLl1p6goYC9umfHZKwAOgyYHGpr0zKo65BwpV6NTNuLyT%2FE91IoAtdt5axrGEb%2BnHXSbwBnUrQiicDNyHyIes5yUfLShpkUVE75SMry2da4Zqt3fAECnPTjb4jKKss5h3QXe81I0vr2halsl%2Bc7ynpV%2FFdq6YfFol8ZLaf54Agce8w6qTAzwY6pgGdi5UJZtXUvR8v8zDmjd8zCR3iQsoFuwazZn7yQCWoGc4Vl9fve6V2c93Xz%2FAAYoXPZFGK8HmJwwQ6aIfZUAGvJY88u%2B6kdl%2BLK%2B%2FG93Rq5wefP9Uv%2Bxijon7D88dmVvODH7JN0KIR%2B5ApPTJQv5kU%2FT40KvEjZtUKoz%2Ff4MJUuXrYRllGXKqqh7VqhgFLei8MDSaaKya1WaYC907HOI1JrO87oGa4&X-Amz-Signature=3d6c579fac9480eefcad369039e36bddf77e52e47d4c000e41789ff2f14590f0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665XH5EL3K%2F20260428%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260428T015514Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAoaCXVzLXdlc3QtMiJGMEQCIDRBEz4qb9lYDWNFgRIkHlvS4Y5Hu%2Fmbs39HZA1TizVOAiB8gCuvm%2Fm6Eg5szvBhlPeF4qO0FtkkJ9UaZqbsyBTFoyqIBAjT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMQLrLkhakvXmrjcUcKtwDzK%2BDbuCGtTn%2FutYzZTZp4kJicO9yIwG3DOoInvBboo18uf3%2Fhi7n0vScwHc1SnnVTIyEdsaWQvJTTOXLeR%2BuD%2BGPTuXBhZHVHoNzzQTqhCnJgZrhyL%2FaerApt6uabd9ierZOSfOp%2Bhc77m6VNcjGRKj2sGj69MzhyY0paeAVUnRDQgIAuZl8gzCAqmwf6Vt6KZE%2BXctk825YSQPzzWvJEtrZByMbDesi12eVJTlXaaEKgwVqqE2A505g270TBxaLjECWopBoxtugDty%2F4RnHyIjl5waFqvoLwUTY1RRjF02eT3UtHOB1suN33q22fKFtWojhq3%2BErQN2NgO%2FvA3nVOyXcwt1lAO2vJ6MTjq3E%2FrbP9RDRBNGvqZ0zJs1%2BptCPeuPjFdcwSgEpMR8KCEki1LNngdlt7BL8bwet6sN7HmJlcwmW8nWCuy2pegDaeQIbMH3vy9nRndtR%2BuLl1p6goYC9umfHZKwAOgyYHGpr0zKo65BwpV6NTNuLyT%2FE91IoAtdt5axrGEb%2BnHXSbwBnUrQiicDNyHyIes5yUfLShpkUVE75SMry2da4Zqt3fAECnPTjb4jKKss5h3QXe81I0vr2halsl%2Bc7ynpV%2FFdq6YfFol8ZLaf54Agce8w6qTAzwY6pgGdi5UJZtXUvR8v8zDmjd8zCR3iQsoFuwazZn7yQCWoGc4Vl9fve6V2c93Xz%2FAAYoXPZFGK8HmJwwQ6aIfZUAGvJY88u%2B6kdl%2BLK%2B%2FG93Rq5wefP9Uv%2Bxijon7D88dmVvODH7JN0KIR%2B5ApPTJQv5kU%2FT40KvEjZtUKoz%2Ff4MJUuXrYRllGXKqqh7VqhgFLei8MDSaaKya1WaYC907HOI1JrO87oGa4&X-Amz-Signature=054f1a3ded2e4380a0d3f397b89a5f9d00f6eee4cf1fed4300d6c87fbc621a81&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
