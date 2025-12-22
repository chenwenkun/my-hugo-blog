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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZHZ2AV3D%2F20251222%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251222T181753Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDIaCXVzLXdlc3QtMiJGMEQCIDo9Uinss4gqPxhSPyVBmIrJyIBFCghls%2BtMpvnyyGQKAiBpl5%2Fe%2Bj%2FOxQVkWABR3X2v12MUFR0m7zg8qcAGgLHssCqIBAj7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMS1k3vCTO5pT6iVwUKtwDq%2FT0YVS71%2Fb5XAm3emJQDtBrx%2BXQnS7ltRB3xwPady%2BSiPKHhVw9ybwGRLEuubtxfvygimoUyaAHCN2VcP7gr88irsK%2BrCQTA2vI03XmoZH1JGYpe96xLyD1eduBLvwBHX19GFG97qLMyURM2%2BYCm0pC26ob%2FEsXDthSfBC7QbFj%2FEbGpJWvYWwLfiUETld5IUVP5q%2BK%2BSs6YKPvckmtJiG77FXLz6RvPtSd3mGz0iaTI6m9hQRaZcyGT567YAP55QD14q18JKWO8U9LM%2BS4kYHtrjKqTY228cvaLAVdNgp3t3FcwPCmHvA4NQFCZySTE9kc2LeiuOtT4tab8%2FKHg%2B5MUjGqGgeDhazdNXSqaONTpXyU0ZUgjdnBg5bm0Wrq%2BBF%2F2QrZ3XgZX1sT5S9p%2Bov7iD3XnmpAickyQDd3syTEo%2Fyvf5OV6t75ZQqVjK0pnl5YQ1W7iquRBpu2FkIyhwn3Ul7tC9S%2BAxQZrqp0qA%2FxUK6CTq1H1%2FBN34vamA0qnxxPJyCc3wX7kM42HHfuD1ULZkztvY3cZhhKWknZJ93Pjb034Vp%2F4tgmu4MwmpC25CtJXmaJpY%2Bqi1JilUl5URtG9whOs44%2FB9Na72dToRFpurUEIaHXUpu6lXAw%2F4KmygY6pgFINAGIxiWd5S64zcVuRggFTlLG6NXHmG8wh7Ro%2Bm%2By5N9z9vR4FI4nlMCoMaz4v4Zk7VJWBCEV23EIezAiK6XhBN5Syuh9a6YtHHzqvLLqxIaDvBjOsewccM04wRM%2BH2S1SIM6wxfXXxKN%2BVVmtfedWwr3OUeBicssOtpAmM4sP8c7hNrtZsXHTYWjxMSxNFQDFiBjJRwHmsV3hETwCYaDWwNvH%2F71&X-Amz-Signature=64a4b611ce088faf760cb63fa2f3848a73f14d2e17da4f32d0b51d9882403779&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZHZ2AV3D%2F20251222%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251222T181753Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDIaCXVzLXdlc3QtMiJGMEQCIDo9Uinss4gqPxhSPyVBmIrJyIBFCghls%2BtMpvnyyGQKAiBpl5%2Fe%2Bj%2FOxQVkWABR3X2v12MUFR0m7zg8qcAGgLHssCqIBAj7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMS1k3vCTO5pT6iVwUKtwDq%2FT0YVS71%2Fb5XAm3emJQDtBrx%2BXQnS7ltRB3xwPady%2BSiPKHhVw9ybwGRLEuubtxfvygimoUyaAHCN2VcP7gr88irsK%2BrCQTA2vI03XmoZH1JGYpe96xLyD1eduBLvwBHX19GFG97qLMyURM2%2BYCm0pC26ob%2FEsXDthSfBC7QbFj%2FEbGpJWvYWwLfiUETld5IUVP5q%2BK%2BSs6YKPvckmtJiG77FXLz6RvPtSd3mGz0iaTI6m9hQRaZcyGT567YAP55QD14q18JKWO8U9LM%2BS4kYHtrjKqTY228cvaLAVdNgp3t3FcwPCmHvA4NQFCZySTE9kc2LeiuOtT4tab8%2FKHg%2B5MUjGqGgeDhazdNXSqaONTpXyU0ZUgjdnBg5bm0Wrq%2BBF%2F2QrZ3XgZX1sT5S9p%2Bov7iD3XnmpAickyQDd3syTEo%2Fyvf5OV6t75ZQqVjK0pnl5YQ1W7iquRBpu2FkIyhwn3Ul7tC9S%2BAxQZrqp0qA%2FxUK6CTq1H1%2FBN34vamA0qnxxPJyCc3wX7kM42HHfuD1ULZkztvY3cZhhKWknZJ93Pjb034Vp%2F4tgmu4MwmpC25CtJXmaJpY%2Bqi1JilUl5URtG9whOs44%2FB9Na72dToRFpurUEIaHXUpu6lXAw%2F4KmygY6pgFINAGIxiWd5S64zcVuRggFTlLG6NXHmG8wh7Ro%2Bm%2By5N9z9vR4FI4nlMCoMaz4v4Zk7VJWBCEV23EIezAiK6XhBN5Syuh9a6YtHHzqvLLqxIaDvBjOsewccM04wRM%2BH2S1SIM6wxfXXxKN%2BVVmtfedWwr3OUeBicssOtpAmM4sP8c7hNrtZsXHTYWjxMSxNFQDFiBjJRwHmsV3hETwCYaDWwNvH%2F71&X-Amz-Signature=fe018fa58ad47c8eb6b3ac5ebd87f6ec4ee132c86b812fcb01684c220b4e5ea1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
