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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UTDZTXWC%2F20260225%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260225T123845Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEQaCXVzLXdlc3QtMiJHMEUCIBHUvKw2d%2FPFjmVX9oKDN%2FLvx21y4S25IWOfByGVIL1kAiEArqyEcgzYcjNuYrA%2BZoXWfFrTk6%2BLTsGy%2BVjoBt5IOJEq%2FwMIDRAAGgw2Mzc0MjMxODM4MDUiDPrSEbby6r70cg7soCrcA4ao3jgYl%2BSTV5LVvLuwFsxoIPwD7YKMaLNF517a7TNKf6pq3RwXwkpZ1L1eOESpq32saGeBnUDXpKPJtbEdx%2FgvKNoo%2BODsn%2Fo%2BxRPeAI0ETyy0Xh6FGdzROz1FQuVY1yttPwcVUUN%2BCi07v2odLuOXGjPo6HSG52t5qKhMf7%2Bn3Awb1O8viBKV%2BHvfT9kkfA4ihGSdldDl5IgZp9lTwWUU3AlGfuS1I%2FlGzNd6Q08yrEgxcqYH73N1bq1g%2B6Tg1JLHYyGInAKWG4HWczepx3azFiqDlDmZ0r8hr13I4261RoDK3K29Hr909o6%2F44WhxSYZYjKJsTDNrH4pHbhf8gxfpxA8sFXM8vjb4lxtkqAy7zJ4jseyBhUfcI9yTWgLog4lDpDc7r7ZNdnyF%2FpsXdS9HtZe%2Bak44n%2FGXRxIjV%2BHMf7NA4QQwYFFiwvcUxZ0ZmTBCxTZ3tbTUmXNwrSv110uqUSITc5D5v%2BnTs7Pzft4IzpXvxRTzt%2BSH0ievi35%2Fo0cb34YTk5goyeG%2ByYDSuYUhR0rjkxAqxdyU9peKHuKkAM2gcomIF4R2vbXo%2B47crZdQDInjEPjaRADdAqNS7yANSHQBV%2BH6wyiMvUF%2F7lJtSoDYBeKZh%2FEJ7KwMN7A%2B8wGOqUBDzNGtEQ9JzPPwkvpFTG7nzAtSrDsOE5aMyMUrg2laz8KAtkxIYHpn3onqV3IHMZMk%2F4wo1PzyUcBvBESfGNNUATMLQ3JrAWuPh5ivhrOjMQfC9G2zU%2BzaTOZgvfPFXGtpWPCY7%2Bwe3XaBNCvQzb7%2F9yVT1lD9tJPjVKRrqBxYK6kArsh8%2FZkUOFE83uovmqqAFebndmIo2MBG0KNfKdy5DSqcFJk&X-Amz-Signature=b43358880376ed9911c0dcec85ad51c95fc81f781faec9964ad6f98634dfa704&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UTDZTXWC%2F20260225%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260225T123845Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEQaCXVzLXdlc3QtMiJHMEUCIBHUvKw2d%2FPFjmVX9oKDN%2FLvx21y4S25IWOfByGVIL1kAiEArqyEcgzYcjNuYrA%2BZoXWfFrTk6%2BLTsGy%2BVjoBt5IOJEq%2FwMIDRAAGgw2Mzc0MjMxODM4MDUiDPrSEbby6r70cg7soCrcA4ao3jgYl%2BSTV5LVvLuwFsxoIPwD7YKMaLNF517a7TNKf6pq3RwXwkpZ1L1eOESpq32saGeBnUDXpKPJtbEdx%2FgvKNoo%2BODsn%2Fo%2BxRPeAI0ETyy0Xh6FGdzROz1FQuVY1yttPwcVUUN%2BCi07v2odLuOXGjPo6HSG52t5qKhMf7%2Bn3Awb1O8viBKV%2BHvfT9kkfA4ihGSdldDl5IgZp9lTwWUU3AlGfuS1I%2FlGzNd6Q08yrEgxcqYH73N1bq1g%2B6Tg1JLHYyGInAKWG4HWczepx3azFiqDlDmZ0r8hr13I4261RoDK3K29Hr909o6%2F44WhxSYZYjKJsTDNrH4pHbhf8gxfpxA8sFXM8vjb4lxtkqAy7zJ4jseyBhUfcI9yTWgLog4lDpDc7r7ZNdnyF%2FpsXdS9HtZe%2Bak44n%2FGXRxIjV%2BHMf7NA4QQwYFFiwvcUxZ0ZmTBCxTZ3tbTUmXNwrSv110uqUSITc5D5v%2BnTs7Pzft4IzpXvxRTzt%2BSH0ievi35%2Fo0cb34YTk5goyeG%2ByYDSuYUhR0rjkxAqxdyU9peKHuKkAM2gcomIF4R2vbXo%2B47crZdQDInjEPjaRADdAqNS7yANSHQBV%2BH6wyiMvUF%2F7lJtSoDYBeKZh%2FEJ7KwMN7A%2B8wGOqUBDzNGtEQ9JzPPwkvpFTG7nzAtSrDsOE5aMyMUrg2laz8KAtkxIYHpn3onqV3IHMZMk%2F4wo1PzyUcBvBESfGNNUATMLQ3JrAWuPh5ivhrOjMQfC9G2zU%2BzaTOZgvfPFXGtpWPCY7%2Bwe3XaBNCvQzb7%2F9yVT1lD9tJPjVKRrqBxYK6kArsh8%2FZkUOFE83uovmqqAFebndmIo2MBG0KNfKdy5DSqcFJk&X-Amz-Signature=13e1ae4922ad7e4975b7d510e81b01021ffdc944fcf930955079dd83e069ddb5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
