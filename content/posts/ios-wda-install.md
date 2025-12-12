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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UAK5MHPE%2F20251212%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251212T005628Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDAaCXVzLXdlc3QtMiJGMEQCIAxzN9HreWlx5pDaMsmmL0fFumyaKcdEaPB4MfNzPmqGAiBm293myVuR70W5YLDQ%2FFXUMJANLGDFRcecYzuCIy0MuyqIBAj5%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM9JA23Oxuzh6307NbKtwDGQAoIL65Acrxf5%2FZ4Gad2VRiT0C7aftzSy%2FtEMdMGSlqhbbT0w2pqaZHihLuAnWGIiLCv%2BuSziA5ss6H8RMZOQbA40xNjTBmWscnCNtu6y14hCcbh9wvUhw10Aynjhj7zGKGG29%2BzhbpMyCnH4k9wZ4DVht8SjPGiib9XIiec7nQthAKbgzRPbgPISOcWmRmy90in0DPqYoCwCiM0ERF4hdiAt8nBT9hgFsvYkTIdeLM9ELpJUj0NQxk9e1ck9C3tZl4hAzA2lf8ItkrilwWlqBwojiQxqMns37ps4X4b7ygM9BJbO7FrIphWse2Jf%2Bn9Hdf%2FMk5itylS3WOoMRh8P8ivBXmKZJBQLkr9JdA4ZEKEqSWunVFf8LXuJLyCQ0mq1Y%2BTTa0aA%2FtY44fA37IS9X3NJvWaxKtGmZJ%2Fh63laT28pchKZmIc7bfkG3rZF%2B7g4YPqyEBmt%2Fllu8KO05DfIvZ%2Bj8sHZ2Z5x%2FUa1gFAu8od8LoIXCaxyV7d35wyDiSa%2ByJiovjjEqgWkbm9J4QxU7brEsz7skcGHf8OBzIZZXBUDGvWxTLehN6h8OAiS0ncG9MbgnPiXrKOUoreC0VkZ2QgUvIiZQ1AQyI3Mkc4HmFgVRkYL%2FCKoQdilUwhrbtyQY6pgGb12nZ3SG57xgLvflTq%2B8YSbQkeH1GJ9pL77LXWyY61XsEl9lnHrAB62XtVNwFqndJQLwItsxv4TSbP7kpc%2FYloNKuq8%2B96lMsBwpvhiyqk2TDdHa6iQjuJwyT58mjY%2BFj0BzWn6qt3QovSfQDI7BSB1zd8F6li1M85EwS7Oj0ttgGSIusGnMa%2BDDd4SOe0m%2F7FenmTR2vx0%2FrTRH7PIN91QOLtIBc&X-Amz-Signature=989d10b114ff7fb5eb4907763105b2d83df2a920f7d2a5858cc880faed208aee&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UAK5MHPE%2F20251212%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251212T005628Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDAaCXVzLXdlc3QtMiJGMEQCIAxzN9HreWlx5pDaMsmmL0fFumyaKcdEaPB4MfNzPmqGAiBm293myVuR70W5YLDQ%2FFXUMJANLGDFRcecYzuCIy0MuyqIBAj5%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM9JA23Oxuzh6307NbKtwDGQAoIL65Acrxf5%2FZ4Gad2VRiT0C7aftzSy%2FtEMdMGSlqhbbT0w2pqaZHihLuAnWGIiLCv%2BuSziA5ss6H8RMZOQbA40xNjTBmWscnCNtu6y14hCcbh9wvUhw10Aynjhj7zGKGG29%2BzhbpMyCnH4k9wZ4DVht8SjPGiib9XIiec7nQthAKbgzRPbgPISOcWmRmy90in0DPqYoCwCiM0ERF4hdiAt8nBT9hgFsvYkTIdeLM9ELpJUj0NQxk9e1ck9C3tZl4hAzA2lf8ItkrilwWlqBwojiQxqMns37ps4X4b7ygM9BJbO7FrIphWse2Jf%2Bn9Hdf%2FMk5itylS3WOoMRh8P8ivBXmKZJBQLkr9JdA4ZEKEqSWunVFf8LXuJLyCQ0mq1Y%2BTTa0aA%2FtY44fA37IS9X3NJvWaxKtGmZJ%2Fh63laT28pchKZmIc7bfkG3rZF%2B7g4YPqyEBmt%2Fllu8KO05DfIvZ%2Bj8sHZ2Z5x%2FUa1gFAu8od8LoIXCaxyV7d35wyDiSa%2ByJiovjjEqgWkbm9J4QxU7brEsz7skcGHf8OBzIZZXBUDGvWxTLehN6h8OAiS0ncG9MbgnPiXrKOUoreC0VkZ2QgUvIiZQ1AQyI3Mkc4HmFgVRkYL%2FCKoQdilUwhrbtyQY6pgGb12nZ3SG57xgLvflTq%2B8YSbQkeH1GJ9pL77LXWyY61XsEl9lnHrAB62XtVNwFqndJQLwItsxv4TSbP7kpc%2FYloNKuq8%2B96lMsBwpvhiyqk2TDdHa6iQjuJwyT58mjY%2BFj0BzWn6qt3QovSfQDI7BSB1zd8F6li1M85EwS7Oj0ttgGSIusGnMa%2BDDd4SOe0m%2F7FenmTR2vx0%2FrTRH7PIN91QOLtIBc&X-Amz-Signature=e66092b45ba25e470b147ebcaffb772ab7c939f717f58ea0da999e82b4267414&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
