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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SMT33UYL%2F20260727%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260727T140856Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIHvi7J21IazNmhsJ6PkhodHHXs%2Bw3oDWZJMMtIm5frYVAiEA25SdzSNBLIF3SFv29EAR%2F2xzcIZ8G3LnbWSwXvZSdekq%2FwMITxAAGgw2Mzc0MjMxODM4MDUiDN66mJWtRINt48lhJCrcA5ob32BehWd4y03ypFnRVN8otSt78pwFVJU5BOzLtgnXuqJlj2O0%2BJnDNrzr7b9yPZwF6rq5yit0tUe%2FiUBgHeawbTr14Ibg2xdV11SyUHsaP6iEGQE%2BjJQqt71GdABPD3I1ZBQJuG7ner5OEyu38N3z9RzQ%2FoytYfh8PITmRc0pTlxNRvkE32Jr41TkrCEVtS0Iigf1wSCm5iF0dhFuaAjvuSkshNCPCYNdh1h4eKCkZ7%2BaudBrOnhb60BYyjXi1uFUUU63SaA1fmhUnTmdaMUP5D%2FDyU%2F2hJMyOnrVQh%2BVRWbuv5BqQWgL6zBHh0XtGEn4dCi7tsXjp1QnsF1Xh4N5fWGipP8E5AroOCr9mpiwHjtpqMIv9eV6PxokRvG%2FLxEnLuMrLAYSsCczSCPGqBq23uA7gml1KjWU5j6a3%2Bpp%2FHXcY10P9%2FlM3VcAH9zlADVt33C5x%2BMFO2ZLNjEnFPN0mN7LCnKfUHGiKMJiPSFeMcDVT%2FHDAj1MGx66m6eujRt4z4HgtDIiBHNHsqzR1TPUrKinvIoeaVwfVYlGKJtXqWvpBnUoZYwJI6KZzGGv0dPWUpkS1yj6MKjdTOitJ66O1L6DFACglMPvShwO7%2FCnRFlzFfsgMs7EI4nyMKK4ndMGOqUB1uHBU3Y257IhbdwFkVl9wCgO9TaepmBMnWpEI3cQ%2FV13hF%2FZYe6WNEjBCWst%2FL1FdkH70iwoXw0FVVkvv8WxSJezMubPtNxcjK452QnFxpkeX9CVCxA9fGdk2PXzobdhiOk8X0T9VP8AzK42MVxjFk0AcqeNt1NyuJnM6rD76GpZbb2lWw14ofW4T9TZwWgy18zySZs%2FitDjSATR%2FRlM%2FA6mzkgZ&X-Amz-Signature=3ec06c4f84d48937bc25f048b0a52b589f0a278f4b81337107d5263be8e9448d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SMT33UYL%2F20260727%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260727T140856Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIHvi7J21IazNmhsJ6PkhodHHXs%2Bw3oDWZJMMtIm5frYVAiEA25SdzSNBLIF3SFv29EAR%2F2xzcIZ8G3LnbWSwXvZSdekq%2FwMITxAAGgw2Mzc0MjMxODM4MDUiDN66mJWtRINt48lhJCrcA5ob32BehWd4y03ypFnRVN8otSt78pwFVJU5BOzLtgnXuqJlj2O0%2BJnDNrzr7b9yPZwF6rq5yit0tUe%2FiUBgHeawbTr14Ibg2xdV11SyUHsaP6iEGQE%2BjJQqt71GdABPD3I1ZBQJuG7ner5OEyu38N3z9RzQ%2FoytYfh8PITmRc0pTlxNRvkE32Jr41TkrCEVtS0Iigf1wSCm5iF0dhFuaAjvuSkshNCPCYNdh1h4eKCkZ7%2BaudBrOnhb60BYyjXi1uFUUU63SaA1fmhUnTmdaMUP5D%2FDyU%2F2hJMyOnrVQh%2BVRWbuv5BqQWgL6zBHh0XtGEn4dCi7tsXjp1QnsF1Xh4N5fWGipP8E5AroOCr9mpiwHjtpqMIv9eV6PxokRvG%2FLxEnLuMrLAYSsCczSCPGqBq23uA7gml1KjWU5j6a3%2Bpp%2FHXcY10P9%2FlM3VcAH9zlADVt33C5x%2BMFO2ZLNjEnFPN0mN7LCnKfUHGiKMJiPSFeMcDVT%2FHDAj1MGx66m6eujRt4z4HgtDIiBHNHsqzR1TPUrKinvIoeaVwfVYlGKJtXqWvpBnUoZYwJI6KZzGGv0dPWUpkS1yj6MKjdTOitJ66O1L6DFACglMPvShwO7%2FCnRFlzFfsgMs7EI4nyMKK4ndMGOqUB1uHBU3Y257IhbdwFkVl9wCgO9TaepmBMnWpEI3cQ%2FV13hF%2FZYe6WNEjBCWst%2FL1FdkH70iwoXw0FVVkvv8WxSJezMubPtNxcjK452QnFxpkeX9CVCxA9fGdk2PXzobdhiOk8X0T9VP8AzK42MVxjFk0AcqeNt1NyuJnM6rD76GpZbb2lWw14ofW4T9TZwWgy18zySZs%2FitDjSATR%2FRlM%2FA6mzkgZ&X-Amz-Signature=d9fcf5c7beaa9f76e73e8153611201da92f71ee2c6f62931cc6d7313d806a643&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
