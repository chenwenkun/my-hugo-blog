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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WLCP2MR5%2F20260609%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260609T020225Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDdGzZeWv7PwvKghGrP9HhzDbcG7Mnh9CDOQm23TnalWwIgU4qDqgZXdm940E1yGINVVnnFKp7624HXGY0xQgADEYIqiAQIw%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNOMjkHMfH9cYZ3HNSrcAzKGy1oX%2FwLGsNsAlM4jPxMklhqQE0D%2F2rVHlDXmQGYiytbRArowxiWoHQeAX0CHms9%2BFQdEun5z%2BBK8AOQ4owIRzgOuwUVcsmb7tM8prMfbMwkTtilTnGwnlMrYrJU3kiQ1vSnfAVnvvJKlFNyQuYcCIPESWYB9H1p8qEXIvV0igZkijcBuwUlTCJFWSMmXUDhd5etQjto7Sx2vRCXWa0gdql1YQJHTbIxHuxcY4erZas7IGotKMTXKUm0IjGS26WMVia1Nk7Mph9OjCYdK2Ry5svpDOypss8rV%2FfvV8cVjdrBGdGDgdH60NtB1Q0d6SZvdd3zp92DysMTwcS%2BpiszXAfMjJEnaANK0eBoNu0THSvSOaP%2B%2B5tTtB9739VVbkCjXoZlrVGS6h0fjKrg5fdSPcwRUxw4wK4zyYUwn0qQs3xSJej%2F2b6ZQAFsKcaTCdJ9RGbvoXaxbNn2Ok%2B3xG93U4NmT3iw9j6ABNB2Fbdn9TSsDwwG8576pp1896mrUPbbJEBEYl52pf%2FCkWaPf%2FVEQT3oIIA60rV%2BSbD390Mu2eHGFaITG1QjOZP6KcviqKytSRHMdljSd%2FacGuNSxUUK2ek4ntKxeS2pZaFIlKEzXyanL%2B1z9ohFSXXiXMK3ZndEGOqUB7cRPRrTQzSbjFMktxT57MFWXZHk5ZxoFDJhxwGn91iOTmK40GNlqLufF0WxHlKPZ%2B4IcAfeDeTi8f5GazvWwBzFJUIMPI%2FitDYD%2Fi7%2B2udtvmbeiZ8Yh55c2CTjKuh2gFDZG8U2dg0y3sg6JVTgUujj3wl6ZNaDPja28CMxD1ndFXkFOAuywJFEBRpOWlJANTO4vb8XJKauyF28Q%2F%2FUqrIpvdCPo&X-Amz-Signature=bf8ce968114c63be0852120fa8b4607f10b16c98d8bb2ab23e58d5613640afc3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WLCP2MR5%2F20260609%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260609T020225Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDdGzZeWv7PwvKghGrP9HhzDbcG7Mnh9CDOQm23TnalWwIgU4qDqgZXdm940E1yGINVVnnFKp7624HXGY0xQgADEYIqiAQIw%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNOMjkHMfH9cYZ3HNSrcAzKGy1oX%2FwLGsNsAlM4jPxMklhqQE0D%2F2rVHlDXmQGYiytbRArowxiWoHQeAX0CHms9%2BFQdEun5z%2BBK8AOQ4owIRzgOuwUVcsmb7tM8prMfbMwkTtilTnGwnlMrYrJU3kiQ1vSnfAVnvvJKlFNyQuYcCIPESWYB9H1p8qEXIvV0igZkijcBuwUlTCJFWSMmXUDhd5etQjto7Sx2vRCXWa0gdql1YQJHTbIxHuxcY4erZas7IGotKMTXKUm0IjGS26WMVia1Nk7Mph9OjCYdK2Ry5svpDOypss8rV%2FfvV8cVjdrBGdGDgdH60NtB1Q0d6SZvdd3zp92DysMTwcS%2BpiszXAfMjJEnaANK0eBoNu0THSvSOaP%2B%2B5tTtB9739VVbkCjXoZlrVGS6h0fjKrg5fdSPcwRUxw4wK4zyYUwn0qQs3xSJej%2F2b6ZQAFsKcaTCdJ9RGbvoXaxbNn2Ok%2B3xG93U4NmT3iw9j6ABNB2Fbdn9TSsDwwG8576pp1896mrUPbbJEBEYl52pf%2FCkWaPf%2FVEQT3oIIA60rV%2BSbD390Mu2eHGFaITG1QjOZP6KcviqKytSRHMdljSd%2FacGuNSxUUK2ek4ntKxeS2pZaFIlKEzXyanL%2B1z9ohFSXXiXMK3ZndEGOqUB7cRPRrTQzSbjFMktxT57MFWXZHk5ZxoFDJhxwGn91iOTmK40GNlqLufF0WxHlKPZ%2B4IcAfeDeTi8f5GazvWwBzFJUIMPI%2FitDYD%2Fi7%2B2udtvmbeiZ8Yh55c2CTjKuh2gFDZG8U2dg0y3sg6JVTgUujj3wl6ZNaDPja28CMxD1ndFXkFOAuywJFEBRpOWlJANTO4vb8XJKauyF28Q%2F%2FUqrIpvdCPo&X-Amz-Signature=7f22b1a7b1e02a86c4f77913cbe3c45922bc43e2701986bac7a89dcb0218df2a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
