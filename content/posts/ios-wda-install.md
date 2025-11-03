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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SYTI3O2C%2F20251103%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251103T061813Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDgnPJiLH%2Foc1Ybflta9F7QQn3N5RnVmOAmvZy7eDMskwIhAKR3kOod3ZTSnGSWrhS8kFlcJBgtd4PMvoYv566LWlwCKv8DCFcQABoMNjM3NDIzMTgzODA1Igwxn2M9SKUqvrwX3xAq3ANAyeGbhNEP%2FhMSwcn0KkzTsek0chgnj3cuxge0%2Foix18ftK4s5rRseYbSrfx8g3YGlrE%2F6wQZhcXNF0Ysl8zE2K3Y%2BxVtJgY%2BIw53gtCR4xnVUFY7Zqe%2FTbqffkn8WY3W6ElUR9chiXbhB8fZM7GZ%2BtQRBL%2B6v9nBlYBgnX8gUvrYlgh99jWJT2QTKczaxvwpiC7W6jSmEvlRdMccRYgU7BY3SVwgQzOsRiMMmTkqnz4IXbzfu6qGsqsaWEC4WeXJ3ZSCiYnBalJVFJAzahyJXvMjLODWmeGX9ui5xcJlxmYCWiq9HuWnj8M737ytuU%2B%2Bt%2FAEawpOQm8PGtrzqhvDCaiLJPjmMaxbdft%2FLpWn83Cp%2FMVU1EzMvkHTRX9oAsiofT3VpVR7ec7QCwHpXauozaY6nmNQSkbnoYCs2DV%2FIlah0ZZBEV5b%2BIMlXJ%2BgcDDV4etAlNSinyf%2FnB0sUKnpxPi8tUzWGoT0LLka4OEkxbMepoFQyjJc3hgJ2OcDjaqih8K65L%2BMuVn4AksyuD4KX7tzkehhRsm7JvWwLIWQeEDo7DDtmtJNxLs1k3Xq%2Fz83Ev70FpTcc%2BgmknTwPY3dMdzX9sB2aiik%2B54pUxbQQtBEFhDBoRJC04ADTtjC7gaHIBjqkAfy7JJXzzhSEdOBbk%2FVkfIyDCLYoAHVt0pJI1St4iZlg7ilHw7mn0Y8HFkYnWKOj6hltduXBHhljFZJLIo%2FKJzF94SJ%2B3JKgcufkRuravsoaSRAVJJiv9UkTJr3ILuJmcChF7MsbH5Pt7L9cV15ASE%2BsqviQAPVgcVClpTyHY5UOLwnFb1ruT8%2B05tm4AH95RWbzxejWfpphnFTkUMKXCN1p8Zgy&X-Amz-Signature=1c1d4a088bd7250aa82401b92b9761c683d08284f5d301f840edf0f1df7388a9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SYTI3O2C%2F20251103%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251103T061813Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDgnPJiLH%2Foc1Ybflta9F7QQn3N5RnVmOAmvZy7eDMskwIhAKR3kOod3ZTSnGSWrhS8kFlcJBgtd4PMvoYv566LWlwCKv8DCFcQABoMNjM3NDIzMTgzODA1Igwxn2M9SKUqvrwX3xAq3ANAyeGbhNEP%2FhMSwcn0KkzTsek0chgnj3cuxge0%2Foix18ftK4s5rRseYbSrfx8g3YGlrE%2F6wQZhcXNF0Ysl8zE2K3Y%2BxVtJgY%2BIw53gtCR4xnVUFY7Zqe%2FTbqffkn8WY3W6ElUR9chiXbhB8fZM7GZ%2BtQRBL%2B6v9nBlYBgnX8gUvrYlgh99jWJT2QTKczaxvwpiC7W6jSmEvlRdMccRYgU7BY3SVwgQzOsRiMMmTkqnz4IXbzfu6qGsqsaWEC4WeXJ3ZSCiYnBalJVFJAzahyJXvMjLODWmeGX9ui5xcJlxmYCWiq9HuWnj8M737ytuU%2B%2Bt%2FAEawpOQm8PGtrzqhvDCaiLJPjmMaxbdft%2FLpWn83Cp%2FMVU1EzMvkHTRX9oAsiofT3VpVR7ec7QCwHpXauozaY6nmNQSkbnoYCs2DV%2FIlah0ZZBEV5b%2BIMlXJ%2BgcDDV4etAlNSinyf%2FnB0sUKnpxPi8tUzWGoT0LLka4OEkxbMepoFQyjJc3hgJ2OcDjaqih8K65L%2BMuVn4AksyuD4KX7tzkehhRsm7JvWwLIWQeEDo7DDtmtJNxLs1k3Xq%2Fz83Ev70FpTcc%2BgmknTwPY3dMdzX9sB2aiik%2B54pUxbQQtBEFhDBoRJC04ADTtjC7gaHIBjqkAfy7JJXzzhSEdOBbk%2FVkfIyDCLYoAHVt0pJI1St4iZlg7ilHw7mn0Y8HFkYnWKOj6hltduXBHhljFZJLIo%2FKJzF94SJ%2B3JKgcufkRuravsoaSRAVJJiv9UkTJr3ILuJmcChF7MsbH5Pt7L9cV15ASE%2BsqviQAPVgcVClpTyHY5UOLwnFb1ruT8%2B05tm4AH95RWbzxejWfpphnFTkUMKXCN1p8Zgy&X-Amz-Signature=143ce58bc9b19ef748ce9bb33def37a533f570c8dd75c835637feb3d15f8c389&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
