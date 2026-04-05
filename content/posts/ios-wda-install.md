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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466732VXML3%2F20260405%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260405T065418Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQC6dxrxQZYo5d1rSYUCtrlWJPLZX45Zt4ms2Lspg8gH4AIhAPJmf7n6AWqI0ThulUs12iSyxR4%2Bs1LZ20xUTQ13Q9hJKogECK7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igycotzr%2BAUMFPbzdKsq3APZK72pidRJl%2F%2BsMWgNrHg7QQLnX39l00yAws%2BTMXbF0nWdjqj56YTzIFPcG7QMI3qXkcUQZTfW9rtP%2B46zVejopEB08LcObeXgvvzCA6sSfI1W%2B5ySzsjsnUxTQL9HAvwA0olThKGyMmO7NQZLxUkIojEZtyGeNQNjf7wheKbSkjs%2BPAscqdq%2BRvLNgNbEh2mcUof7aFAB9FQrImK85OHz2zYpqoIYkOaDbPXUcpKS0Eebdb4CShYXleAx3Xh4qsFolxre34BNNumQ7Ve%2BF24VVy9OkuZuqwBMd%2Bmb9pjgnX91zNcN7Q1aY9tmb%2FD32lkx9tcHOnLKWcMQVgPhDfPwx67OT9zSDWXMuH%2BpThsX2AgLkH6u5hxgiTZWTs2HmfPIBQ%2Ba13YSnSRSSzir3aLg8JKCNrSgWwQxYcFSuJjz6HdUQAdT9Mg%2F%2FcAFwxnLH1Jf8x3CN5Dx3Qagu364D0c6vQyXyBWRQF7KdN8ugL8BZCuKMUJ6BzUmm9rjnzdzpMB2xGib27Sj54SQJP0g767TgADsGjlX59BE8npTaQkiq7528TpRjrNjsRM9PXRxMocT7L%2B2CYjv0nwo9boSCq76nPkbCWbxOTrr6trq4f7Ojnw3XZR6rnqbnGWktjCOzMfOBjqkATnYBbQPMdQFqKQrBYyrNzBC5tWc8rxRoog35DSeDED9FANFh8eYCstWMPM23%2Fwz2QtJuX7up%2BysjXccL2fqNv8n7aSyXAY0yXnyUt%2FcblfP16d3KlE%2F2jHgdjXZQicjyy7YtyTUhQg9byuoA0ht1PWGfEooC2V9dOjkLfK2ocSniiojelACYKV48rcg2XzTgY2DiigJu%2BcSCjgXOA1I%2Bo4AmFk%2B&X-Amz-Signature=49f967fac636485590c2d90e6fba2b8d8141613290832fb7799d61b964039d46&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466732VXML3%2F20260405%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260405T065418Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQC6dxrxQZYo5d1rSYUCtrlWJPLZX45Zt4ms2Lspg8gH4AIhAPJmf7n6AWqI0ThulUs12iSyxR4%2Bs1LZ20xUTQ13Q9hJKogECK7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igycotzr%2BAUMFPbzdKsq3APZK72pidRJl%2F%2BsMWgNrHg7QQLnX39l00yAws%2BTMXbF0nWdjqj56YTzIFPcG7QMI3qXkcUQZTfW9rtP%2B46zVejopEB08LcObeXgvvzCA6sSfI1W%2B5ySzsjsnUxTQL9HAvwA0olThKGyMmO7NQZLxUkIojEZtyGeNQNjf7wheKbSkjs%2BPAscqdq%2BRvLNgNbEh2mcUof7aFAB9FQrImK85OHz2zYpqoIYkOaDbPXUcpKS0Eebdb4CShYXleAx3Xh4qsFolxre34BNNumQ7Ve%2BF24VVy9OkuZuqwBMd%2Bmb9pjgnX91zNcN7Q1aY9tmb%2FD32lkx9tcHOnLKWcMQVgPhDfPwx67OT9zSDWXMuH%2BpThsX2AgLkH6u5hxgiTZWTs2HmfPIBQ%2Ba13YSnSRSSzir3aLg8JKCNrSgWwQxYcFSuJjz6HdUQAdT9Mg%2F%2FcAFwxnLH1Jf8x3CN5Dx3Qagu364D0c6vQyXyBWRQF7KdN8ugL8BZCuKMUJ6BzUmm9rjnzdzpMB2xGib27Sj54SQJP0g767TgADsGjlX59BE8npTaQkiq7528TpRjrNjsRM9PXRxMocT7L%2B2CYjv0nwo9boSCq76nPkbCWbxOTrr6trq4f7Ojnw3XZR6rnqbnGWktjCOzMfOBjqkATnYBbQPMdQFqKQrBYyrNzBC5tWc8rxRoog35DSeDED9FANFh8eYCstWMPM23%2Fwz2QtJuX7up%2BysjXccL2fqNv8n7aSyXAY0yXnyUt%2FcblfP16d3KlE%2F2jHgdjXZQicjyy7YtyTUhQg9byuoA0ht1PWGfEooC2V9dOjkLfK2ocSniiojelACYKV48rcg2XzTgY2DiigJu%2BcSCjgXOA1I%2Bo4AmFk%2B&X-Amz-Signature=dcad31b276a0dfc8c0c7a2c2d77272cebe774e9cddab27908533fe2557d3d11f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
