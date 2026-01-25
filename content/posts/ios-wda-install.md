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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663JPMQ35L%2F20260125%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260125T010504Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFEaCXVzLXdlc3QtMiJIMEYCIQDEw91M7viOBJioFSnzJfE8T76l3yuP23WTmG0mDX7HngIhAJAjL27fRYQuBuZQxdOG5iNA6zBZXJztFCjSSk2BfqJfKv8DCBoQABoMNjM3NDIzMTgzODA1IgzbDil%2FNbS%2Fmi486noq3AOzjmmbC1Jwn7dUPpqGekrYbsiCRLcdmWTqrS84hJ87HzG8sTPOEOMkKvzALUzmRSEP8TdqC4gREVmj2JEO%2FLqeoWrJcq9YYT9RDP1Ihw97zXVemSex2HE1vs8cxLmMm4IApeH6IKmD3gg42Y7TtG128MnlUYxdbUwIg%2FjQOn6cp5ZPVi0EhEXNay0q3AaTziI4R1F4zWSJ7e1DowTFYXN4w%2Fxu1WP4c8vGwLtdPv9%2BrF4SFTt9JEP6awrzoW0i8DpwKKA97qPoTtPXjWpgtJXA1Gfj3jChNHzbixslmcvvDGtWD%2BaXgWJ42t%2F9OI8uia1zXmbFRcphfjjXOhBjn6rTxTqhIPt%2Fd33hRo%2BG1j4A5NX6l616Vd112JprYZ0ze0d2HNNehIjXsKPA8RHj0MbOwX3RoNVNgQDBCzgJHLMeOya1zfuCxz1pjziDMzQCULmX3q2AEF6ElZgD%2FHttLNeIAFfKIftRcDkCZc2BgqHB2lYWsoTIxw7Q1PDJlZkzvq5TfaptN4fS%2BxeBYo8ATSGZ09W%2BVLjEX8cbIpkW7rmvtVwS9tFypbC0z776ZDdGhFWY%2B5PtE1Yi6KrPMDYkrH2Tf1P0WSE3ZruEZr8tnDleoTx1OqWxT%2BeKbgJ3NTDvztXLBjqkAWbJXFpKpFwTS2M%2BzWK%2Fzivp6kpFFhL%2ByG%2BMlrZtyzfrwxcSj5MUTDrBnR%2FMdv%2BxyMts1k9AGrTm0u%2B3qsMqI2WvH2YNszQBXDHxVukigmVa84BcIhWJM5FNg2RpZO9hRx0t6iUbYDZ%2F%2F0jdzCnX9sUYLZo25WlgG%2BZUeu%2B5S70wmofEMxPHRyUrDOnkkk92mZdUlRsjB8PNUI0wvofKR1O08d18&X-Amz-Signature=3a834591f84c2065d59061ffe52e72d4111743af590a34b5be16b1029b4e8b9b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663JPMQ35L%2F20260125%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260125T010504Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFEaCXVzLXdlc3QtMiJIMEYCIQDEw91M7viOBJioFSnzJfE8T76l3yuP23WTmG0mDX7HngIhAJAjL27fRYQuBuZQxdOG5iNA6zBZXJztFCjSSk2BfqJfKv8DCBoQABoMNjM3NDIzMTgzODA1IgzbDil%2FNbS%2Fmi486noq3AOzjmmbC1Jwn7dUPpqGekrYbsiCRLcdmWTqrS84hJ87HzG8sTPOEOMkKvzALUzmRSEP8TdqC4gREVmj2JEO%2FLqeoWrJcq9YYT9RDP1Ihw97zXVemSex2HE1vs8cxLmMm4IApeH6IKmD3gg42Y7TtG128MnlUYxdbUwIg%2FjQOn6cp5ZPVi0EhEXNay0q3AaTziI4R1F4zWSJ7e1DowTFYXN4w%2Fxu1WP4c8vGwLtdPv9%2BrF4SFTt9JEP6awrzoW0i8DpwKKA97qPoTtPXjWpgtJXA1Gfj3jChNHzbixslmcvvDGtWD%2BaXgWJ42t%2F9OI8uia1zXmbFRcphfjjXOhBjn6rTxTqhIPt%2Fd33hRo%2BG1j4A5NX6l616Vd112JprYZ0ze0d2HNNehIjXsKPA8RHj0MbOwX3RoNVNgQDBCzgJHLMeOya1zfuCxz1pjziDMzQCULmX3q2AEF6ElZgD%2FHttLNeIAFfKIftRcDkCZc2BgqHB2lYWsoTIxw7Q1PDJlZkzvq5TfaptN4fS%2BxeBYo8ATSGZ09W%2BVLjEX8cbIpkW7rmvtVwS9tFypbC0z776ZDdGhFWY%2B5PtE1Yi6KrPMDYkrH2Tf1P0WSE3ZruEZr8tnDleoTx1OqWxT%2BeKbgJ3NTDvztXLBjqkAWbJXFpKpFwTS2M%2BzWK%2Fzivp6kpFFhL%2ByG%2BMlrZtyzfrwxcSj5MUTDrBnR%2FMdv%2BxyMts1k9AGrTm0u%2B3qsMqI2WvH2YNszQBXDHxVukigmVa84BcIhWJM5FNg2RpZO9hRx0t6iUbYDZ%2F%2F0jdzCnX9sUYLZo25WlgG%2BZUeu%2B5S70wmofEMxPHRyUrDOnkkk92mZdUlRsjB8PNUI0wvofKR1O08d18&X-Amz-Signature=ad0859c36b95796a5078b98f58205c5868f7ac585d229bbbc03b57c4e61268d9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
