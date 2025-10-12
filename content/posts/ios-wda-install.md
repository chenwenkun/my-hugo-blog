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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663Y6O22PH%2F20251012%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251012T005235Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHcaCXVzLXdlc3QtMiJHMEUCIQDt6OxbLkS1hK54G2lbJW7NUw%2B41d99LrwvFNW4pW6jcQIgQzXSZsctEEPvTy7qz2klgcPp0WBnERiAq0VJ%2Fn2YnEkq%2FwMIIBAAGgw2Mzc0MjMxODM4MDUiDB8fiY%2BTZGuO%2BshnfSrcAzTBanDpmIbp3xE0qJpyxZ6%2B0brn4tCbnhlnRQEc4fSbPVP5PH9sXzkjvATqC0idb1s%2FnxYFuc0uwN%2BEz46x3HQlJQxYLzfjHEQrphtZpsRAYTTHB7f2uq7nmLXg2ScOuLs7rZ5jeS%2B8fUsav%2B%2Byo33%2Fy8yC5RgK8RJtnd2mX7UUxHsxz%2BFg8wYQmf8uI%2FHnABs5VNNEAAePlPrk5GJ6KEnfaNKIxGA8HWZPMgAl%2Bvx5otb9PG0xnnzrrFGsTTly13w%2Fv3v2yQGnFvAh5xLNP4%2BFxEzlOI5oS7uhNqIy91dqSB9hMVDXAIMpR2uB5XsMOdBlPNIhQtNzgR1cnIxoKgxvhV%2FfdlMbfS6WckanZ90lNIhFblgOUnBBve4qM65rWTLVXObsFjEP0RP8Vku4XPeRIDYwJ6i0PQbhhdC621A75H3qk9b0pM7cBLLCzQUH7ccp%2B8xHzSEvVpV9OGGoBg30bch%2BdYgVglo%2BmotaO8tRpeH0hajhr15h1ZabjDJTHfd91qlWGj05eGujAkpRvzwjL8HCa%2FKWdCZJSD9F5Mpvq%2BPQRzu4f8kGxMDrNh%2FvsVesDvn%2FD5tXNKQEF6qDh6PsD2Wo0%2BzlZKa7wMyHAhekLF6mWzynO6VcYAGIMLW4q8cGOqUBJfy8Y%2BBKwsNv9V5ejPWt%2Bp%2FywWs9h%2FjjUJMr5dB96UADWhrqxeitSf0us1SOxLQqKxysS9QulC9bo0kzR0bE2VCUAqJzZ7yRNjBdwv4UmOtcAfMajzJJlU7WpcqEWlnAkqdY0%2BPjkWPO8xF9fUaev2wxfWbSXI0np9bpSzE3TJFV7k9ref1OWvE9tEBHACkn6cy%2FOuLKmxAWGA%2FCDV6GxceO%2BR%2BE&X-Amz-Signature=f4fabbbfb23bfdfe33e0c4b1490de64d8aac464d711b02179a4e89029ef050f3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663Y6O22PH%2F20251012%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251012T005235Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHcaCXVzLXdlc3QtMiJHMEUCIQDt6OxbLkS1hK54G2lbJW7NUw%2B41d99LrwvFNW4pW6jcQIgQzXSZsctEEPvTy7qz2klgcPp0WBnERiAq0VJ%2Fn2YnEkq%2FwMIIBAAGgw2Mzc0MjMxODM4MDUiDB8fiY%2BTZGuO%2BshnfSrcAzTBanDpmIbp3xE0qJpyxZ6%2B0brn4tCbnhlnRQEc4fSbPVP5PH9sXzkjvATqC0idb1s%2FnxYFuc0uwN%2BEz46x3HQlJQxYLzfjHEQrphtZpsRAYTTHB7f2uq7nmLXg2ScOuLs7rZ5jeS%2B8fUsav%2B%2Byo33%2Fy8yC5RgK8RJtnd2mX7UUxHsxz%2BFg8wYQmf8uI%2FHnABs5VNNEAAePlPrk5GJ6KEnfaNKIxGA8HWZPMgAl%2Bvx5otb9PG0xnnzrrFGsTTly13w%2Fv3v2yQGnFvAh5xLNP4%2BFxEzlOI5oS7uhNqIy91dqSB9hMVDXAIMpR2uB5XsMOdBlPNIhQtNzgR1cnIxoKgxvhV%2FfdlMbfS6WckanZ90lNIhFblgOUnBBve4qM65rWTLVXObsFjEP0RP8Vku4XPeRIDYwJ6i0PQbhhdC621A75H3qk9b0pM7cBLLCzQUH7ccp%2B8xHzSEvVpV9OGGoBg30bch%2BdYgVglo%2BmotaO8tRpeH0hajhr15h1ZabjDJTHfd91qlWGj05eGujAkpRvzwjL8HCa%2FKWdCZJSD9F5Mpvq%2BPQRzu4f8kGxMDrNh%2FvsVesDvn%2FD5tXNKQEF6qDh6PsD2Wo0%2BzlZKa7wMyHAhekLF6mWzynO6VcYAGIMLW4q8cGOqUBJfy8Y%2BBKwsNv9V5ejPWt%2Bp%2FywWs9h%2FjjUJMr5dB96UADWhrqxeitSf0us1SOxLQqKxysS9QulC9bo0kzR0bE2VCUAqJzZ7yRNjBdwv4UmOtcAfMajzJJlU7WpcqEWlnAkqdY0%2BPjkWPO8xF9fUaev2wxfWbSXI0np9bpSzE3TJFV7k9ref1OWvE9tEBHACkn6cy%2FOuLKmxAWGA%2FCDV6GxceO%2BR%2BE&X-Amz-Signature=67b225b284314167ee930be186a453de7ff39443e44006ef22d96d0aae8ff30c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
