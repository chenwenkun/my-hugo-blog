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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VUQOIUGW%2F20251004%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251004T121742Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAhuuZf%2FtITXU4zDo3Hojd7QbxXBRVynUbh5OY30Kod6AiBMAqw6UzBj1gBkmYu9ZFS%2BsdchTNpkd9NNPPDIwOqRqyr%2FAwhcEAAaDDYzNzQyMzE4MzgwNSIMkjLGW8tOEukMdfqiKtwDUsFAIQzmBiXWLW0M1T3SqzNzNvdjvMZpIfF8aL0aHtBLvX8dwLsvdZXNpA0F45C28Cq6CQgnvZ1uJSju%2BgnDCpJ6Wd0ZEelyeUw0SAj7XWHv6%2Bl1%2FMaZDaxZKukYGtvwE4bDILJHmYAT1gzvnSNio9SpyCaNzMixsyqKWx5j4j5hGp7mWVCrf9La30N3VKlkx489NCxce23bsq5gSL2IF01IhPJn5fS4S9kHbAmjXStjnqp4b4cKwES7Wp%2FbPueOO4Iem9yiN2rYRKBxHZQpuk47gR5UnzD8H8%2BcoYRbVPdeXuY4Z53acm6EfOS9xJPgk0XZAcbzcJK70KdeuPIPAxKJgFA%2FyVTBwCxoVHTId4op1hl65ujsacoTy6jIbXRkMY0loHodVqHmYtaJpGGYaEehC%2B9T2mP2%2BwtD7HunIKfwObr7urwavUa%2BDuvFS9jq%2Br4vUHMvd4opMYpNMghmQycjRWQ7%2FtyCYM68SzXpGpyH0D6d7gpkamoBo0Ghb9Y7g090SATy%2BzSltm3LF8%2FzGaZr5R1Y0tGPqik9BNQfpmEQ8h9YxFKesnpPPecoonBMMufYYUgG2om2C%2FW%2BAAxS%2BBUM%2FYsuYS9IPOGgal1MPd3Yj%2BihMTN6iwMhL50wuPiDxwY6pgF0vj94gfjHxWcJZdTBn9V5LwRfqvxRn%2BmbkzmzP0FsJypj9DEqen7X1egItWLOy58K77KmSKJTi76HjYy752yO5VmCIPsSwib4ZQr6xq4B4l4pZ6xRetDj31CD7g13rbpzqhfYAi7RxaoYrfUHU3%2FzEQQtq92LMW0OL7stZb4EdnYbuPRbG%2BcjD0kG4OD2wCBXQJyCm4sn5jfHsWUXIqUIv3cZU2Nl&X-Amz-Signature=133b11e4f4bfadc4a5bf88fe1790861cf43783be7cdbb04443eb39f3b5eb590e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VUQOIUGW%2F20251004%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251004T121742Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAhuuZf%2FtITXU4zDo3Hojd7QbxXBRVynUbh5OY30Kod6AiBMAqw6UzBj1gBkmYu9ZFS%2BsdchTNpkd9NNPPDIwOqRqyr%2FAwhcEAAaDDYzNzQyMzE4MzgwNSIMkjLGW8tOEukMdfqiKtwDUsFAIQzmBiXWLW0M1T3SqzNzNvdjvMZpIfF8aL0aHtBLvX8dwLsvdZXNpA0F45C28Cq6CQgnvZ1uJSju%2BgnDCpJ6Wd0ZEelyeUw0SAj7XWHv6%2Bl1%2FMaZDaxZKukYGtvwE4bDILJHmYAT1gzvnSNio9SpyCaNzMixsyqKWx5j4j5hGp7mWVCrf9La30N3VKlkx489NCxce23bsq5gSL2IF01IhPJn5fS4S9kHbAmjXStjnqp4b4cKwES7Wp%2FbPueOO4Iem9yiN2rYRKBxHZQpuk47gR5UnzD8H8%2BcoYRbVPdeXuY4Z53acm6EfOS9xJPgk0XZAcbzcJK70KdeuPIPAxKJgFA%2FyVTBwCxoVHTId4op1hl65ujsacoTy6jIbXRkMY0loHodVqHmYtaJpGGYaEehC%2B9T2mP2%2BwtD7HunIKfwObr7urwavUa%2BDuvFS9jq%2Br4vUHMvd4opMYpNMghmQycjRWQ7%2FtyCYM68SzXpGpyH0D6d7gpkamoBo0Ghb9Y7g090SATy%2BzSltm3LF8%2FzGaZr5R1Y0tGPqik9BNQfpmEQ8h9YxFKesnpPPecoonBMMufYYUgG2om2C%2FW%2BAAxS%2BBUM%2FYsuYS9IPOGgal1MPd3Yj%2BihMTN6iwMhL50wuPiDxwY6pgF0vj94gfjHxWcJZdTBn9V5LwRfqvxRn%2BmbkzmzP0FsJypj9DEqen7X1egItWLOy58K77KmSKJTi76HjYy752yO5VmCIPsSwib4ZQr6xq4B4l4pZ6xRetDj31CD7g13rbpzqhfYAi7RxaoYrfUHU3%2FzEQQtq92LMW0OL7stZb4EdnYbuPRbG%2BcjD0kG4OD2wCBXQJyCm4sn5jfHsWUXIqUIv3cZU2Nl&X-Amz-Signature=33d3ba18c477104bb92661c4be8858edd55c65ffd34e01565ecc4c7cb85e3eda&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
