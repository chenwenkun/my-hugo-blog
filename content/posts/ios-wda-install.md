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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XCQSYXVA%2F20260708%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260708T080619Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIBexYKYnbwhKR7QA1lY1LooRLR9A%2FWBVH1dCzKJav18RAiBWhmrVq%2FWJj%2FCSg%2F5VDne%2F6to0gBFmLAnOOex8KlNPrSqIBAiB%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMmkWodEOpQQ09uQmCKtwDEnc89tTwy7BMkxwoU7POWWBECtK%2BkbisxwAh0xq5RuAO9ozj%2Bi97bZ%2FnzU5FJADdjheRwkqQxCBqSOp6i7UDJ0dfHPGbpC8zkyYe2wivXIzrRRhhnSZiyrUWhZ6hX84n9fisYtBYNzdSrrrZCi5jlIChPDSksMiBIaIuasKRmplwNr2dDkPjBg6H%2FNyiHcNfqRKG%2F24Gm9Fp8N7jnuQNVNtagskq%2B5eRtchLWFPYlOijfuxuIbQawRiQB%2BAH5qqZ8QCi5u9RtkPgb5jTXQwGHMM%2BRgHRlRyQKkaitUtB6jgezkmzgJY9VsSOUahCwZk5%2FVN8yb14hrtTRE0ADAwC%2FPdFetMy9DHPDupG7ilL6b5n%2FSfS95L6yUPY2un7K20Xd7x5NccpwzCbrQUzW3JS9oRTSWCpjHRq%2B1rft%2Bb4AsIIfuUABaMZek7gi9MILYXALOzMMvI%2FGsZIQ1ThhOMEU%2F0Qy106aGihxwikg9Ec%2BJfSmxECQ8OJREXzNeSvfOtbLjNStleNdCQub2%2BM2jHcqtqsTSUhCbW0F8LfZh1ugKVmCWjeNNVZ0y09svPrYWCNTGroBh%2FYvYnGLtKq%2Bkh0m6ZfrPSpyUOT7vlMOirwEILZ8d%2BN8Fafyh8FbBMw9oa40gY6pgEyNeaQkjT%2BSPrXacBXyXFFAAkbHo9uozoekCGPQYxah2MWHIzlz83Wi57iIBMPuUg5rGQERYQnQZRTInu7nRXKurfo4QGnHpHHIWhIN2ycg%2BRskPzPzfK9upr5bSmEOMpp%2B0c4W3tGPzAKA%2FSHH%2FdMX93ek9CrmCzXxGEbT7Dgxxq1AscAXWsOvvHKGtbd35IbsnNsemJloKy67PPLKqoAoQNvPjSt&X-Amz-Signature=ab19e780534ea2b8adde631ab7fbdae0e10c2337287e6b37f3eb548c58fca403&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XCQSYXVA%2F20260708%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260708T080619Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIBexYKYnbwhKR7QA1lY1LooRLR9A%2FWBVH1dCzKJav18RAiBWhmrVq%2FWJj%2FCSg%2F5VDne%2F6to0gBFmLAnOOex8KlNPrSqIBAiB%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMmkWodEOpQQ09uQmCKtwDEnc89tTwy7BMkxwoU7POWWBECtK%2BkbisxwAh0xq5RuAO9ozj%2Bi97bZ%2FnzU5FJADdjheRwkqQxCBqSOp6i7UDJ0dfHPGbpC8zkyYe2wivXIzrRRhhnSZiyrUWhZ6hX84n9fisYtBYNzdSrrrZCi5jlIChPDSksMiBIaIuasKRmplwNr2dDkPjBg6H%2FNyiHcNfqRKG%2F24Gm9Fp8N7jnuQNVNtagskq%2B5eRtchLWFPYlOijfuxuIbQawRiQB%2BAH5qqZ8QCi5u9RtkPgb5jTXQwGHMM%2BRgHRlRyQKkaitUtB6jgezkmzgJY9VsSOUahCwZk5%2FVN8yb14hrtTRE0ADAwC%2FPdFetMy9DHPDupG7ilL6b5n%2FSfS95L6yUPY2un7K20Xd7x5NccpwzCbrQUzW3JS9oRTSWCpjHRq%2B1rft%2Bb4AsIIfuUABaMZek7gi9MILYXALOzMMvI%2FGsZIQ1ThhOMEU%2F0Qy106aGihxwikg9Ec%2BJfSmxECQ8OJREXzNeSvfOtbLjNStleNdCQub2%2BM2jHcqtqsTSUhCbW0F8LfZh1ugKVmCWjeNNVZ0y09svPrYWCNTGroBh%2FYvYnGLtKq%2Bkh0m6ZfrPSpyUOT7vlMOirwEILZ8d%2BN8Fafyh8FbBMw9oa40gY6pgEyNeaQkjT%2BSPrXacBXyXFFAAkbHo9uozoekCGPQYxah2MWHIzlz83Wi57iIBMPuUg5rGQERYQnQZRTInu7nRXKurfo4QGnHpHHIWhIN2ycg%2BRskPzPzfK9upr5bSmEOMpp%2B0c4W3tGPzAKA%2FSHH%2FdMX93ek9CrmCzXxGEbT7Dgxxq1AscAXWsOvvHKGtbd35IbsnNsemJloKy67PPLKqoAoQNvPjSt&X-Amz-Signature=18fdfe7ad2b84a2276f503a0fe2dd96c1a503a3a96a76c012262142764cdf9e1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
