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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VHD4KNDK%2F20260417%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260417T012637Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCB1JBx4nbYFkhelDXn3Tjrzj7I9U1%2BjmCtKY94JHGzPQIhAJEQoWm9ehX8zusIsYJ1VyFuMs6QcFIWYOG4Ho8F6SbrKogECMj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzyPbwkazjEoqznFYQq3AMeWPleBFj5PdTjNQDMm2cuTUROuJNSldmtX2WSz2vO6LLS%2FJFEdpsSOd3Jgvrvj%2BYA7lsc8bayGxWl7Cpl%2BFMQp37D5DLN1Tg9%2BEmHDz9gz2iysDn4m3Vx7gL8NfFMN5giQ6l2mlNQja0AVkX5jbGCk%2B%2BuzXbnDpgLT9q%2B7pfcMQnvlHBMNppbzdEACZLoCqXb3%2FCTAf98W6KmtjkCf1E8GWL5WDwP6%2FMptzIlB%2Fy1s1QVS8gtfnsO3GSulekxeRkpGesZTEuGYDVX%2FCvYkM7hnCzuNfbuJRsY7K88i5f7570BHlzX%2BoLD%2BWMrF8%2FO0rdK1ofDCcDjOa8oF6TiFIkOXwyakMcZULu9RJZ9L%2F5PdZKo3beqnAYjLAyE2RSce6a1jEQly10sFoP3irmgQoTvg%2BbZi5y%2B2F%2BcZQK6nFcWJgatYkut9GI191G70cPhpPGKdH9ThlRYEaJ9N1HWAHMwCNy25hS%2BspNdgx6mctdgC1MPgw0kv%2FjryAMuAKjPpM%2F0V%2BnXSjXcyXQvSPme%2FOI%2BKjFyTgs133Ts1T5sH4CfMP4OjgNEGPqFPFW8KQn45Y0FRykBkRpv8Z22mHiHD6Ww%2FZWqpZfL6OH6UN3Q5AUuOJlshn%2BVHndV4OXryDCl2oXPBjqkASYDUTakkZFg6xnOwbjV8sAcWYFBR8IjmqKvCKl5uTwBqICKIo1U4BetGbnAfEV64XLhHaTN5FJOXi0a4aDoOlVaUjQ1LsFqpZlJvPs2TYPDsIde0Qrhy4datpa4dN9vwEHkQFPhTAnpzKBerH3qyNMbrKw7ObqmWGe43bvwKPkU%2BPJD83lqBgM7nZWrK6bKlUNnygRBmC3PJtFJ1ViNrgol7wRU&X-Amz-Signature=ee28ef44a11511eb16ea9900dfc06998a1f02fc4fd38a9501d868e037e311a63&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VHD4KNDK%2F20260417%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260417T012637Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCB1JBx4nbYFkhelDXn3Tjrzj7I9U1%2BjmCtKY94JHGzPQIhAJEQoWm9ehX8zusIsYJ1VyFuMs6QcFIWYOG4Ho8F6SbrKogECMj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzyPbwkazjEoqznFYQq3AMeWPleBFj5PdTjNQDMm2cuTUROuJNSldmtX2WSz2vO6LLS%2FJFEdpsSOd3Jgvrvj%2BYA7lsc8bayGxWl7Cpl%2BFMQp37D5DLN1Tg9%2BEmHDz9gz2iysDn4m3Vx7gL8NfFMN5giQ6l2mlNQja0AVkX5jbGCk%2B%2BuzXbnDpgLT9q%2B7pfcMQnvlHBMNppbzdEACZLoCqXb3%2FCTAf98W6KmtjkCf1E8GWL5WDwP6%2FMptzIlB%2Fy1s1QVS8gtfnsO3GSulekxeRkpGesZTEuGYDVX%2FCvYkM7hnCzuNfbuJRsY7K88i5f7570BHlzX%2BoLD%2BWMrF8%2FO0rdK1ofDCcDjOa8oF6TiFIkOXwyakMcZULu9RJZ9L%2F5PdZKo3beqnAYjLAyE2RSce6a1jEQly10sFoP3irmgQoTvg%2BbZi5y%2B2F%2BcZQK6nFcWJgatYkut9GI191G70cPhpPGKdH9ThlRYEaJ9N1HWAHMwCNy25hS%2BspNdgx6mctdgC1MPgw0kv%2FjryAMuAKjPpM%2F0V%2BnXSjXcyXQvSPme%2FOI%2BKjFyTgs133Ts1T5sH4CfMP4OjgNEGPqFPFW8KQn45Y0FRykBkRpv8Z22mHiHD6Ww%2FZWqpZfL6OH6UN3Q5AUuOJlshn%2BVHndV4OXryDCl2oXPBjqkASYDUTakkZFg6xnOwbjV8sAcWYFBR8IjmqKvCKl5uTwBqICKIo1U4BetGbnAfEV64XLhHaTN5FJOXi0a4aDoOlVaUjQ1LsFqpZlJvPs2TYPDsIde0Qrhy4datpa4dN9vwEHkQFPhTAnpzKBerH3qyNMbrKw7ObqmWGe43bvwKPkU%2BPJD83lqBgM7nZWrK6bKlUNnygRBmC3PJtFJ1ViNrgol7wRU&X-Amz-Signature=2b47babdced08da3d41438da4c0acd871c5d577d4506d5bdc171ae48771b3cd6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
