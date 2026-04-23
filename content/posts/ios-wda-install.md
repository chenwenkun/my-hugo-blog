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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V27AIZVN%2F20260423%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260423T014317Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIDkf0DRp5S8VBiwi%2BScYjoN7ftLHWd5SO5txgUwogLdrAiEAsRW1223FxHrs%2FNDobkvOjnNt9dnP6PLyhljO9kdiYsgq%2FwMIVxAAGgw2Mzc0MjMxODM4MDUiDHRXz4UrRe3orQ%2Bb1yrcA8YZ7Rb%2BCAaVjQaUgIf0cyWVi%2FzLp4qRo0BYsM8pHffaTq7ggq4kXAbiQ9iaV8v6UIxa6DKMusINdoQHK7sP2v2%2FvlwbgrDvG1FAPrU%2FguSXv%2FIlOKQD48YcEzOM4USedfS1B2aKSPN8FZqmqZH6EtSuRglxoucO2YHJpx1Y6ZN7clasnYox5hgvyQwtQD8oqExIUGiWK049BqWTt50xIzAAgmZM%2Fzhs6pgfm93QgSJRKVnmc0FVrVV0ZbfquOt%2FcW9gRFXN8WNSvvmkOhNMOyQK7NfHrZYTYDZreT0zvXFjbJpHCGQhlnZJzGM61z4NrSX95K05ilgsgG%2FekR8oRkC22hlFC9QsXEq7hAVrZ8%2BqVwpY%2Fz%2FxEbfPCFe%2BvTbhmfK6vIgMHSTDF5yIX6pAZKd3Wq7g6QNnUvxJl%2B0W2bA2PG5Gifwr28IpRiVczn%2BbvE3EtjsVkOTb8DEFKqZFSS2zRy7GSzR2Oqr3hNYCZocOLx4oUB0cMXeoiI61yRMhe3A5dPjG4vQJ1qcNUEO2yf95997Bz6%2FX9pCWx8AcvEoGwQWAesmDnGociWFpPHxBEMzDUoPNc4oaZZ7J6VbLKwXO8BDiuk%2BjeGB3hvi7eMVZblEqvkZiQ%2BsSZikeMNv%2BpM8GOqUB0SIzITzmNHazsf5iXP3zmf3q4wcVCGxu9eelDfI2aUhzQ4tneUf2weqb2gsyPcP%2BM9LpGGU0G6%2FC9Q7c2UNyIDkXJ42dxEAVkGdMoM1C2IzskXtv%2Byy4RSZi05pO7uSaiK96kSD77v0B7Nc0ESW2RvlVVfp1ZnszP9i8NrZrhJ12P5RvDCnpCw1o%2FrPAe8z02ojVQk8DH2XQl8r7EV2cbvWxF6T3&X-Amz-Signature=3313400a06018fad353c76df10125f699b7d948f0c176387d7df3af1d1398e1d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V27AIZVN%2F20260423%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260423T014317Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIDkf0DRp5S8VBiwi%2BScYjoN7ftLHWd5SO5txgUwogLdrAiEAsRW1223FxHrs%2FNDobkvOjnNt9dnP6PLyhljO9kdiYsgq%2FwMIVxAAGgw2Mzc0MjMxODM4MDUiDHRXz4UrRe3orQ%2Bb1yrcA8YZ7Rb%2BCAaVjQaUgIf0cyWVi%2FzLp4qRo0BYsM8pHffaTq7ggq4kXAbiQ9iaV8v6UIxa6DKMusINdoQHK7sP2v2%2FvlwbgrDvG1FAPrU%2FguSXv%2FIlOKQD48YcEzOM4USedfS1B2aKSPN8FZqmqZH6EtSuRglxoucO2YHJpx1Y6ZN7clasnYox5hgvyQwtQD8oqExIUGiWK049BqWTt50xIzAAgmZM%2Fzhs6pgfm93QgSJRKVnmc0FVrVV0ZbfquOt%2FcW9gRFXN8WNSvvmkOhNMOyQK7NfHrZYTYDZreT0zvXFjbJpHCGQhlnZJzGM61z4NrSX95K05ilgsgG%2FekR8oRkC22hlFC9QsXEq7hAVrZ8%2BqVwpY%2Fz%2FxEbfPCFe%2BvTbhmfK6vIgMHSTDF5yIX6pAZKd3Wq7g6QNnUvxJl%2B0W2bA2PG5Gifwr28IpRiVczn%2BbvE3EtjsVkOTb8DEFKqZFSS2zRy7GSzR2Oqr3hNYCZocOLx4oUB0cMXeoiI61yRMhe3A5dPjG4vQJ1qcNUEO2yf95997Bz6%2FX9pCWx8AcvEoGwQWAesmDnGociWFpPHxBEMzDUoPNc4oaZZ7J6VbLKwXO8BDiuk%2BjeGB3hvi7eMVZblEqvkZiQ%2BsSZikeMNv%2BpM8GOqUB0SIzITzmNHazsf5iXP3zmf3q4wcVCGxu9eelDfI2aUhzQ4tneUf2weqb2gsyPcP%2BM9LpGGU0G6%2FC9Q7c2UNyIDkXJ42dxEAVkGdMoM1C2IzskXtv%2Byy4RSZi05pO7uSaiK96kSD77v0B7Nc0ESW2RvlVVfp1ZnszP9i8NrZrhJ12P5RvDCnpCw1o%2FrPAe8z02ojVQk8DH2XQl8r7EV2cbvWxF6T3&X-Amz-Signature=8a2bf7d921d647c4666279ea2d538ca9f81103e2446a96589c18f1f4e1846700&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
