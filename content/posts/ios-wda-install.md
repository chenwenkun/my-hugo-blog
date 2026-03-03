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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666QLHQSPT%2F20260303%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260303T063726Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCICYJVdMZcyuu%2BLV8O%2F66DrjIbvTlSvkHQJSEHatvLy6zAiBjeGAvw8zgglNq%2FF9o6fVjhfAKZrYqzP1bwgNadRldRyqIBAiX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMi0%2BcM5YkfcK%2BRkjFKtwDepbIRU8v2F2CNMe0t%2FM3c1WwPP4f9nVp2%2FXSQjlb7b3sxTPq7fqt6vfiheY80BrtCgMs%2BnXf0v1zbxzhPo%2F7OaogUfRHHcid3TlQdOocx0KCi1aSA4o4uvy%2FQdsMmQ%2B6pP0ODVJfHbXRMddwc7h8uusvJqjTQ63zbmUPNjSyqGKAZJoRS5RZ0tmXOHSFt0jaK1bwnlwVhdrOmTbweuzMNjX%2B98Oq3fwWdsHVYFHPLYDZwu2CkTMfr8yruHBm5F43Q%2BNnn43HQspqTKi9ctzXpvUt4BdyohYjwtHcIqzht%2BmOjSa5kpbnUqNN356HzPB7QDqMaIndYUTOMrop5lzEJcvQQZP994ayG7hZinHq5Z1y5ku3CKLODj1D%2BD2SmqoQxW37%2BT63bLKpdbKBYxdPj0l2R9sgMusrDNU9BRQ%2F122c%2Bqu7rHax6hdeyTYtk%2BWTVVopbQu2yjHeil0nTJfg1O%2Fw4snln2xs4oHhXgO0y5C%2BElgtC%2BNdySDYnrLqjwaN6ZEOh51HBc4euSFmiVIF0QZftLfTAF2ZqGb1qzjf1E4BMxFcWQPevNuxQZWTEe1cup6wxl9BFQO4osDjuWWVeYdAPQx8MirtCmXziGhN8uOelGr2UKISihHKujgwjuGZzQY6pgHZmD20rRERMkAFsve4Q3jYx9EFRpM%2BFoa5VpLHQIFOVE5aXPTaMyyP1vERcH32npCWNiB2MEGDc4yNJfZYUwyDK9h9QAXHbdUqPrWy50ra9XQ0KRVx4PRNrn01L6q97%2Bku1vMRnYYu%2B817Us0XQN5aVPILUEIz5Mkrv%2F2cNvyqrPmzpQ7ZKuX9afuicvaqOTR2c%2FjkFag8sAiSTEkxeiCEyjX61u0G&X-Amz-Signature=88b0e69a77b24280f0e4e0f651455abdecef22792eff300c81d3fd29a64b2c4a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666QLHQSPT%2F20260303%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260303T063726Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCICYJVdMZcyuu%2BLV8O%2F66DrjIbvTlSvkHQJSEHatvLy6zAiBjeGAvw8zgglNq%2FF9o6fVjhfAKZrYqzP1bwgNadRldRyqIBAiX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMi0%2BcM5YkfcK%2BRkjFKtwDepbIRU8v2F2CNMe0t%2FM3c1WwPP4f9nVp2%2FXSQjlb7b3sxTPq7fqt6vfiheY80BrtCgMs%2BnXf0v1zbxzhPo%2F7OaogUfRHHcid3TlQdOocx0KCi1aSA4o4uvy%2FQdsMmQ%2B6pP0ODVJfHbXRMddwc7h8uusvJqjTQ63zbmUPNjSyqGKAZJoRS5RZ0tmXOHSFt0jaK1bwnlwVhdrOmTbweuzMNjX%2B98Oq3fwWdsHVYFHPLYDZwu2CkTMfr8yruHBm5F43Q%2BNnn43HQspqTKi9ctzXpvUt4BdyohYjwtHcIqzht%2BmOjSa5kpbnUqNN356HzPB7QDqMaIndYUTOMrop5lzEJcvQQZP994ayG7hZinHq5Z1y5ku3CKLODj1D%2BD2SmqoQxW37%2BT63bLKpdbKBYxdPj0l2R9sgMusrDNU9BRQ%2F122c%2Bqu7rHax6hdeyTYtk%2BWTVVopbQu2yjHeil0nTJfg1O%2Fw4snln2xs4oHhXgO0y5C%2BElgtC%2BNdySDYnrLqjwaN6ZEOh51HBc4euSFmiVIF0QZftLfTAF2ZqGb1qzjf1E4BMxFcWQPevNuxQZWTEe1cup6wxl9BFQO4osDjuWWVeYdAPQx8MirtCmXziGhN8uOelGr2UKISihHKujgwjuGZzQY6pgHZmD20rRERMkAFsve4Q3jYx9EFRpM%2BFoa5VpLHQIFOVE5aXPTaMyyP1vERcH32npCWNiB2MEGDc4yNJfZYUwyDK9h9QAXHbdUqPrWy50ra9XQ0KRVx4PRNrn01L6q97%2Bku1vMRnYYu%2B817Us0XQN5aVPILUEIz5Mkrv%2F2cNvyqrPmzpQ7ZKuX9afuicvaqOTR2c%2FjkFag8sAiSTEkxeiCEyjX61u0G&X-Amz-Signature=cf6dcc36902247adabf6e0a55d92db75e4e097f6f72209940c45ff7544e6d99d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
