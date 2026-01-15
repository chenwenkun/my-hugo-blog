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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VUZKET3I%2F20260115%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260115T005654Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGAaCXVzLXdlc3QtMiJGMEQCIAHcqCG%2BxMhFEIC5rmwjF06OKcamt3RlJGILhDWoAAMMAiB2iLOO19DEKYrVsYTRjKPY4lbQEXud5k3PotjuEYKDfSr%2FAwgpEAAaDDYzNzQyMzE4MzgwNSIM5cRXSDLenscP2yqoKtwDXjmsgfrhahz4Eldoby06maUPDBWkGZ2f%2F5KwI8nXg0%2Fv2yrOeiTagkmoeydz%2FYXZDMNWLja34r4FRBDNBF13ZMjrmMs0xSgcUmIy6Ed4TEBgItfh4yaiMnl%2FBi4fpKiXv7DhOmTh8T%2FpdceiJXS2jREdRDYXQBTSYQpMBorERACrfAGdhXgwq56DvaojAZ8X0EMJgs8shBsPYfzqw2AiyRC0PlEKIdeCjdtA2H4oHOZ4MOqWcsb2PghjPPq5BuIwXQUqKm7CBwWR5v0sW5OTF69SC6KlA6YJIk8bLQfFevWF3J8a6e71ixQejpryHnsh%2FS0pNAJ1rqG9i1lnqyupFY%2BImMaqvvubPDia%2Fo0TLupVuBYuMBkWxFR7HG0ZrYADYzA8XgoMi3IIw2PYAX4it4DqYKYT%2FUfdHKopfHZwK1bCvhgVlYGX2ZpLd63g7sf6bcpxH9NCmDVfvrTtU7h7OA1yeIPSacKQt8cD%2BcUN3u8Z%2BTiYfKvo5jcNmy4ywz3lh60FjxsTHyhmxqrwPgrnJJ6VHR9ShXnlWpMhV6xd3HAOx2WTG6OXqaR9N3t7w12rKe5Um3uN7qdVqbhFUQTy8S0GBXVAxCgmrtDgGjH6jwOmpPJg9nrHgUPgmpIw2%2BCgywY6pgG%2F4O%2Fyt%2BXf8roe3Y9rZsb29hyjJzqw83wuVZzXtZU3%2FLi38wcF7V%2Fo1iJyIhqzJ1FOdBek7ah2iuQH%2FdwzuLL6ySni8AOd2%2BLEeIqYHzRvmBwt2H0wFqG%2Fu0nrRmxk66sF0NR%2FhJMJE%2BzcAXRFOae9Da0suQURqI0AbYbBXnCo%2Fj9a2aNyOMkCDEi4B0VxurWew8V6M1Gv%2FM6R4XF2ghVkNY8lJ6uz&X-Amz-Signature=d3d2908043cc45d8646d7192aa4153753ff859360701504ce11afc061370d324&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VUZKET3I%2F20260115%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260115T005654Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGAaCXVzLXdlc3QtMiJGMEQCIAHcqCG%2BxMhFEIC5rmwjF06OKcamt3RlJGILhDWoAAMMAiB2iLOO19DEKYrVsYTRjKPY4lbQEXud5k3PotjuEYKDfSr%2FAwgpEAAaDDYzNzQyMzE4MzgwNSIM5cRXSDLenscP2yqoKtwDXjmsgfrhahz4Eldoby06maUPDBWkGZ2f%2F5KwI8nXg0%2Fv2yrOeiTagkmoeydz%2FYXZDMNWLja34r4FRBDNBF13ZMjrmMs0xSgcUmIy6Ed4TEBgItfh4yaiMnl%2FBi4fpKiXv7DhOmTh8T%2FpdceiJXS2jREdRDYXQBTSYQpMBorERACrfAGdhXgwq56DvaojAZ8X0EMJgs8shBsPYfzqw2AiyRC0PlEKIdeCjdtA2H4oHOZ4MOqWcsb2PghjPPq5BuIwXQUqKm7CBwWR5v0sW5OTF69SC6KlA6YJIk8bLQfFevWF3J8a6e71ixQejpryHnsh%2FS0pNAJ1rqG9i1lnqyupFY%2BImMaqvvubPDia%2Fo0TLupVuBYuMBkWxFR7HG0ZrYADYzA8XgoMi3IIw2PYAX4it4DqYKYT%2FUfdHKopfHZwK1bCvhgVlYGX2ZpLd63g7sf6bcpxH9NCmDVfvrTtU7h7OA1yeIPSacKQt8cD%2BcUN3u8Z%2BTiYfKvo5jcNmy4ywz3lh60FjxsTHyhmxqrwPgrnJJ6VHR9ShXnlWpMhV6xd3HAOx2WTG6OXqaR9N3t7w12rKe5Um3uN7qdVqbhFUQTy8S0GBXVAxCgmrtDgGjH6jwOmpPJg9nrHgUPgmpIw2%2BCgywY6pgG%2F4O%2Fyt%2BXf8roe3Y9rZsb29hyjJzqw83wuVZzXtZU3%2FLi38wcF7V%2Fo1iJyIhqzJ1FOdBek7ah2iuQH%2FdwzuLL6ySni8AOd2%2BLEeIqYHzRvmBwt2H0wFqG%2Fu0nrRmxk66sF0NR%2FhJMJE%2BzcAXRFOae9Da0suQURqI0AbYbBXnCo%2Fj9a2aNyOMkCDEi4B0VxurWew8V6M1Gv%2FM6R4XF2ghVkNY8lJ6uz&X-Amz-Signature=ee4d11088d826662d98c668f605658e9c560995750d9f3b864add68718fab7e3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
