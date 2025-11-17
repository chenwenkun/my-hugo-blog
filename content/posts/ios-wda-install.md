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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XMHLRQPX%2F20251117%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251117T122221Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCfli2f32j5Yn0mSxz%2F6jn8mYpO7dLLl6IrPJBtwhHknAIgZDvB2Baq%2BgckBXDUswH%2BR9UvhWZe0ouAGrqQbs9aP0wqiAQIrf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDE1rTpDLCEYHalBNWCrcAwB2FSeEyxAmxa7h6Ukt%2FsyETOfuMh5bgY0y61bl9NtKp8tLhepQdvdriWeZs8BzCxYcHe70H77lyACchAaXxb8sgF39MENds4AZ3BmBmh1m3wP7vu5784IG3yoSV8WvqAgbfErjUoqregZEkLi0h77vF3QtPQBYqrkexOixjgd4EgjBzA6dmN4LvcjiO9OG6QF7Tg48hm74mJ%2B6eeLr%2Fv%2FLTfWOBsTVVrAthrVPfdyYErKEOAnH%2BYXgEOuikxovgd%2FiKpT7emPJ8mkZXrNuUXY6kFW%2Bk2Kzu2WAvEk6SXoMFFS9QmBsq1nH4D18O8I4K%2BXJmWdvJ98lv4RE1lWu5WqzZUxxa9fIomQpEZrQ2n%2FB0jVeYyVDlnKhIIfKtblJN1wpTmSDldImF70D9wYSPcdHXgiMw%2FoVrNJtWIUAabxO7QiUNBfWGye%2BFqb6VOQBNiTz%2Fkt3nBxAI065yA50ImydgHuGPZJhQF8kfHRE5Y3sGsx9Su6%2B0EWunjq3h%2BCPrQcUSZbBVjDu89nbBN5tLkc%2FmR%2BBw7pMrQy41LQIXZ%2BKHv%2BPMXmbzp5blqn%2Fm9buOZnkkeRw%2BYw6USVxfxNItD013sYy5D8byK%2BqCHlC8ALNqfyoyqm1jq0r5%2FPZMNqi7MgGOqUBfhB7VPzovsiRd%2FNdQNLo%2B47ctvT6QuLQdiansCpgKKNoOmK49qsG24BMgaz9jtwwWCB%2FO7Hr84T0jCV4PVBECvkqecylUA5BHVR4ONFPqVrz24LezcxhrS0MphgqmnoEU7ZShGobUdS3GHGQDBEHtDwmNSKk0mpiw43Y2SDdzGqNRJdx07wen5O4aZ7MnfHwyxqIhQ%2Fbs%2FRamnBkpeqlLWqtR5tn&X-Amz-Signature=fdccdad71f01896e591ede9f749e6cfbe2a952f1d7ae9e3036e9898388a6eebd&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XMHLRQPX%2F20251117%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251117T122221Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCfli2f32j5Yn0mSxz%2F6jn8mYpO7dLLl6IrPJBtwhHknAIgZDvB2Baq%2BgckBXDUswH%2BR9UvhWZe0ouAGrqQbs9aP0wqiAQIrf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDE1rTpDLCEYHalBNWCrcAwB2FSeEyxAmxa7h6Ukt%2FsyETOfuMh5bgY0y61bl9NtKp8tLhepQdvdriWeZs8BzCxYcHe70H77lyACchAaXxb8sgF39MENds4AZ3BmBmh1m3wP7vu5784IG3yoSV8WvqAgbfErjUoqregZEkLi0h77vF3QtPQBYqrkexOixjgd4EgjBzA6dmN4LvcjiO9OG6QF7Tg48hm74mJ%2B6eeLr%2Fv%2FLTfWOBsTVVrAthrVPfdyYErKEOAnH%2BYXgEOuikxovgd%2FiKpT7emPJ8mkZXrNuUXY6kFW%2Bk2Kzu2WAvEk6SXoMFFS9QmBsq1nH4D18O8I4K%2BXJmWdvJ98lv4RE1lWu5WqzZUxxa9fIomQpEZrQ2n%2FB0jVeYyVDlnKhIIfKtblJN1wpTmSDldImF70D9wYSPcdHXgiMw%2FoVrNJtWIUAabxO7QiUNBfWGye%2BFqb6VOQBNiTz%2Fkt3nBxAI065yA50ImydgHuGPZJhQF8kfHRE5Y3sGsx9Su6%2B0EWunjq3h%2BCPrQcUSZbBVjDu89nbBN5tLkc%2FmR%2BBw7pMrQy41LQIXZ%2BKHv%2BPMXmbzp5blqn%2Fm9buOZnkkeRw%2BYw6USVxfxNItD013sYy5D8byK%2BqCHlC8ALNqfyoyqm1jq0r5%2FPZMNqi7MgGOqUBfhB7VPzovsiRd%2FNdQNLo%2B47ctvT6QuLQdiansCpgKKNoOmK49qsG24BMgaz9jtwwWCB%2FO7Hr84T0jCV4PVBECvkqecylUA5BHVR4ONFPqVrz24LezcxhrS0MphgqmnoEU7ZShGobUdS3GHGQDBEHtDwmNSKk0mpiw43Y2SDdzGqNRJdx07wen5O4aZ7MnfHwyxqIhQ%2Fbs%2FRamnBkpeqlLWqtR5tn&X-Amz-Signature=966fd7820ab20c8cc5c1e6a491d4b35589e8022d35b6fce5d6b31362adde12d5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
