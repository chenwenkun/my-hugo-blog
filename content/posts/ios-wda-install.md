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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RSNSZJS6%2F20260726%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260726T185437Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHEaCXVzLXdlc3QtMiJIMEYCIQDQeOIic3Lc%2BFVzr%2FKcYxjsyfRTbuMBh7x516%2BoHjDEJAIhAL%2FvKJVCIZ9ZCNcgY01fJDLyOdoGRc04ytofHhqCywagKv8DCDoQABoMNjM3NDIzMTgzODA1IgwzwGCWbDBIyuI%2BfHUq3AO%2FYiRIZ5e%2F7Ppr%2FCoMKBZR%2B2jsp%2BoX%2FsrGytDd4Z%2FIPQ2qV7eLOJVQ5ygnwT1bA6dMA8tSeQAMtF%2FJuPalfSkC1Npcjv0GExU5wwVdJQZeNZ8laI57BTVeO4%2FIDoG97IAoyA3HWPgiL3Q8tdT36xQGtdl3OTbJQHsfgCfNZsUsoVn2avKtw6Lde7NzfqQScZ7K8rqykUtTQezQRe1%2BgAjl8kjSQ5oxtJHC1iWidtmlfRKL%2FKAoNPQDW4lpbUR2DgXwgtzwdndmRrnEu6kvkdVHsn4aZQUtF8HKkYtv13XRMvnSZgiis2eAdWeXwBoF7klvbZ87qk%2B%2Bfurn1IA6IOinH7odCeaJhoTgJQxlqpESclXWZlTnSUyqyJZJBacsj4fMGT8L9uMajAXKjenjNLfNniTbuHQTuj%2BA7RjD34nDZ62MSDHpdS8wccMuyM0xTFV5wpErneY3SIrYzcPMbkrJ2KmCS5Nvx1dkOcaWImdwDw11gpnMpAgdTS3zmf%2Bc6ALyQmNbCpS%2BAc17d3HHh6dQc9BQX%2BymJN9YwCPF9VXzMt0AMdfPSEocoi65qh14H0Ho1oGBiHpq9YVKPLn7MLekR034q%2BcCSDR5ZNWn7Ga7NpE4rq4Enn1N0lAttjCb65jTBjqkAVN9gx0EpPK%2BC76eDVIMDFACP2yc0pQZTtRXmjD2oz2yq7GDsA1hk8rOAPlaIK76lAaI3MU4sVKFVG%2B0tr2EimCQsBlEAVTi71pNY5q3oIsfRSRGudxruZ7LFzDAAgrC8q8JvIYWSqTPvhdk%2Br4IAmu2jDPiSSR3dz1EpvH3lK9mzV01O2oRCphrafrplfhOHLwJOalSPboZwbnI%2B5H2ADFMJ3CS&X-Amz-Signature=d6ad723c764bfd07b82ffa7ef5835ce499f18a64aa4072d275ba72a740e064f2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RSNSZJS6%2F20260726%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260726T185437Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHEaCXVzLXdlc3QtMiJIMEYCIQDQeOIic3Lc%2BFVzr%2FKcYxjsyfRTbuMBh7x516%2BoHjDEJAIhAL%2FvKJVCIZ9ZCNcgY01fJDLyOdoGRc04ytofHhqCywagKv8DCDoQABoMNjM3NDIzMTgzODA1IgwzwGCWbDBIyuI%2BfHUq3AO%2FYiRIZ5e%2F7Ppr%2FCoMKBZR%2B2jsp%2BoX%2FsrGytDd4Z%2FIPQ2qV7eLOJVQ5ygnwT1bA6dMA8tSeQAMtF%2FJuPalfSkC1Npcjv0GExU5wwVdJQZeNZ8laI57BTVeO4%2FIDoG97IAoyA3HWPgiL3Q8tdT36xQGtdl3OTbJQHsfgCfNZsUsoVn2avKtw6Lde7NzfqQScZ7K8rqykUtTQezQRe1%2BgAjl8kjSQ5oxtJHC1iWidtmlfRKL%2FKAoNPQDW4lpbUR2DgXwgtzwdndmRrnEu6kvkdVHsn4aZQUtF8HKkYtv13XRMvnSZgiis2eAdWeXwBoF7klvbZ87qk%2B%2Bfurn1IA6IOinH7odCeaJhoTgJQxlqpESclXWZlTnSUyqyJZJBacsj4fMGT8L9uMajAXKjenjNLfNniTbuHQTuj%2BA7RjD34nDZ62MSDHpdS8wccMuyM0xTFV5wpErneY3SIrYzcPMbkrJ2KmCS5Nvx1dkOcaWImdwDw11gpnMpAgdTS3zmf%2Bc6ALyQmNbCpS%2BAc17d3HHh6dQc9BQX%2BymJN9YwCPF9VXzMt0AMdfPSEocoi65qh14H0Ho1oGBiHpq9YVKPLn7MLekR034q%2BcCSDR5ZNWn7Ga7NpE4rq4Enn1N0lAttjCb65jTBjqkAVN9gx0EpPK%2BC76eDVIMDFACP2yc0pQZTtRXmjD2oz2yq7GDsA1hk8rOAPlaIK76lAaI3MU4sVKFVG%2B0tr2EimCQsBlEAVTi71pNY5q3oIsfRSRGudxruZ7LFzDAAgrC8q8JvIYWSqTPvhdk%2Br4IAmu2jDPiSSR3dz1EpvH3lK9mzV01O2oRCphrafrplfhOHLwJOalSPboZwbnI%2B5H2ADFMJ3CS&X-Amz-Signature=3e6443287780d1a7375d665f8b9e9ee052171a1802a9ae4b9bc96c92612ad844&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
