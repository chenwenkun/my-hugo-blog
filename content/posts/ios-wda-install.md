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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QC3IZ5XU%2F20251007%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251007T061631Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAYaCXVzLXdlc3QtMiJIMEYCIQCDbd8kLejgBK2QkpxfmpSoM1qGrKS%2F2gjsK7A9f4o%2FGQIhAJeeDiC4M68ZH6JfoxDjO%2FRZM3l5%2BDZNBXJ2%2Fg6mmZX6KogECJ%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxTf6KLY6RmI1bzHl4q3AN4Uxik89%2BA7FYjLw03RprVWCyL32AvcNCLnEKbMYumyMbgYJXhtPQLLA6SFi5v95O%2BXek1899NseTebU8%2FFxg%2BNPFvnt81fUzRaBrWiSj0P57oAL%2BUgIIPcvbs8z2WliNuEGoSTv%2FLZqWjo7kxW5oAlcE8ydPsxw2Yc%2BO9xV5GUXPtiK1FuHvJjTMn15PVC8ixHHEW4onc1CCahLxVQWwZn8vTnqUcvBkByn7rVr89I9ys4A1LIk6xjARuv55KDj3bOxdBb30Jr2DR3HHKD7HiJ2xqNUejcVynYn05hdLo9eXsfYjPvF5sCQG%2BRc%2B%2FQ5CdRjyTxmrFEwzgzUJtBAfGOrQuJEeM4DDVhSqpNC3aaKukzzzdUPakPgB61T36HuEvb%2FQuD5f8YlaTb68cr2i4BMhReehrmMDewcrtmTaV4xwTIRsd5xz82j9IECJvgZea5VTG5diEG6NtfSmpbwXDrebGr%2FLAI1uEjKkYIQWdr%2BPW5lfdlls64CcrFi%2FTr0bEJbkwXEItx5%2FKEGWgLRnU3Rz3hr87heLKg96ojHCusH6%2FVEk%2B1%2FN7h2YkX7aMfch7Jl3jo8TBv8CEogWvBczj1UFFi7uLmnd%2BuCcz%2F21BTHT9hjSfVTAcsagrejDuyJLHBjqkAY8%2BFpGkq%2BFNUv5L74qxBfjmNnISdrCqBFQL0yNb3o4QuCUuwLggATe%2F5kvPfECn9oww1sjbepbaxr0S9CXIy2gvmFQx392L%2FyRmyCymR665XjSkNYBLYQn0X9gRf7klodMkJxtOM0fAaIMnbdzv%2BERuX6xFuKnpGohl71foB%2F%2B%2FmCSytPqJBayHL0H2ucSkIAFpS%2FGfTytYfC7a00WqZke3ZZDw&X-Amz-Signature=27fedc58cca31bc5cd580ca8c3ee67a54029e3db359cc214f0ede743ff53f345&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QC3IZ5XU%2F20251007%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251007T061631Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAYaCXVzLXdlc3QtMiJIMEYCIQCDbd8kLejgBK2QkpxfmpSoM1qGrKS%2F2gjsK7A9f4o%2FGQIhAJeeDiC4M68ZH6JfoxDjO%2FRZM3l5%2BDZNBXJ2%2Fg6mmZX6KogECJ%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxTf6KLY6RmI1bzHl4q3AN4Uxik89%2BA7FYjLw03RprVWCyL32AvcNCLnEKbMYumyMbgYJXhtPQLLA6SFi5v95O%2BXek1899NseTebU8%2FFxg%2BNPFvnt81fUzRaBrWiSj0P57oAL%2BUgIIPcvbs8z2WliNuEGoSTv%2FLZqWjo7kxW5oAlcE8ydPsxw2Yc%2BO9xV5GUXPtiK1FuHvJjTMn15PVC8ixHHEW4onc1CCahLxVQWwZn8vTnqUcvBkByn7rVr89I9ys4A1LIk6xjARuv55KDj3bOxdBb30Jr2DR3HHKD7HiJ2xqNUejcVynYn05hdLo9eXsfYjPvF5sCQG%2BRc%2B%2FQ5CdRjyTxmrFEwzgzUJtBAfGOrQuJEeM4DDVhSqpNC3aaKukzzzdUPakPgB61T36HuEvb%2FQuD5f8YlaTb68cr2i4BMhReehrmMDewcrtmTaV4xwTIRsd5xz82j9IECJvgZea5VTG5diEG6NtfSmpbwXDrebGr%2FLAI1uEjKkYIQWdr%2BPW5lfdlls64CcrFi%2FTr0bEJbkwXEItx5%2FKEGWgLRnU3Rz3hr87heLKg96ojHCusH6%2FVEk%2B1%2FN7h2YkX7aMfch7Jl3jo8TBv8CEogWvBczj1UFFi7uLmnd%2BuCcz%2F21BTHT9hjSfVTAcsagrejDuyJLHBjqkAY8%2BFpGkq%2BFNUv5L74qxBfjmNnISdrCqBFQL0yNb3o4QuCUuwLggATe%2F5kvPfECn9oww1sjbepbaxr0S9CXIy2gvmFQx392L%2FyRmyCymR665XjSkNYBLYQn0X9gRf7klodMkJxtOM0fAaIMnbdzv%2BERuX6xFuKnpGohl71foB%2F%2B%2FmCSytPqJBayHL0H2ucSkIAFpS%2FGfTytYfC7a00WqZke3ZZDw&X-Amz-Signature=0d778bdbe51e5517109395e18584724ba68ca15dea40b2df72077f90d66db511&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
