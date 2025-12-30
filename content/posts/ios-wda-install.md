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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TL4JP4L4%2F20251230%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251230T181825Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIHwH0iFfLlY2utZjucFTtYBwKmcu2HGP8cHrK%2B7sHkV3AiBlF9x9FQMM5VD%2Bl2BJMCTxEz8fStKIz%2FlKEpUeBf0oDCqIBAi3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMaIN0F%2FwiTSNIrO2KKtwDbeyjEMBKPK9HGqhG6FipdeXMuhf9gsz9RQxBrZIinPPPf0BSYx7qFNMpOp1p7QZ835bW1XwI8m2UJSsg6FBSuZA1XnBJEvJ8rcBjqR5yFq85NBhWvss%2BOZeD6NYD2hcWkGzKcK4miCHWP0%2F2VOzODdSuzdrmvtX6trYQWkHCrrM3PLPKdcn6h%2BMiv4K7rJsgNtO%2BdbLijsM5wF1%2FnnqQyjrmNMXL0X1sa20h%2BOAUPpHQ3LTuPy5SOGh%2F3J4NfCWM6aCh7DqCedkdKgLsvXTdwzWgQSVLXM4%2FqghbOmb918wng4gFZINbn4JI7dkFDToG7984p%2FUpumQgXDd5%2BbC0fcqnJdL8MKHqRYijxgsLknGOBHiioN84sRvygfpei%2BjfDEPbhtkXvy0FGSymLl5ONFpDCg9ZQNMx1F28KLz2PPAh%2Bz16F7P1XFJfwvNshyDV3KwgPymZImvX%2Bgmk3%2Bzpc7h6CGfPyv0nz8%2BX1fdvGehDLV3Sb%2BVpkgamR6zfY0aMG7IRHEGJWOiAaYTvwX%2FoypCEm8UvtsTY8UOHdnSV4UAecs7UQGxwaq%2FjBqLKJkXNdVUd8QPPLU3Txt%2BV3hzucT2ANR4SCcr02XEM1Pd9l9GvQOriGuhQw2HENZEw57PPygY6pgEG1ViXC%2FO63UkbsdjLgAHewanEIdCc6YfXzqYQPUzOYpK1jClU1Ko%2FL8om8zvdwEYLNgyTU59wgP21ocA5%2F38JItf0rJWGApvlayyIdI%2F8ytDbqLhhBB0mM4vnH3bEABJ3RAbXKNrE%2BGHfxLURMXJPr03FtO43GNYTt4uVFPRGPF5YMOEpmxjaYcLT88GD1KgiF9P51c9ZOwNysvBC2Pn1G%2BDNh79H&X-Amz-Signature=0ec7eee3b24f0c49170a826de4a07d3e5cbc7a8effba34691511ee01c4007180&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TL4JP4L4%2F20251230%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251230T181825Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIHwH0iFfLlY2utZjucFTtYBwKmcu2HGP8cHrK%2B7sHkV3AiBlF9x9FQMM5VD%2Bl2BJMCTxEz8fStKIz%2FlKEpUeBf0oDCqIBAi3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMaIN0F%2FwiTSNIrO2KKtwDbeyjEMBKPK9HGqhG6FipdeXMuhf9gsz9RQxBrZIinPPPf0BSYx7qFNMpOp1p7QZ835bW1XwI8m2UJSsg6FBSuZA1XnBJEvJ8rcBjqR5yFq85NBhWvss%2BOZeD6NYD2hcWkGzKcK4miCHWP0%2F2VOzODdSuzdrmvtX6trYQWkHCrrM3PLPKdcn6h%2BMiv4K7rJsgNtO%2BdbLijsM5wF1%2FnnqQyjrmNMXL0X1sa20h%2BOAUPpHQ3LTuPy5SOGh%2F3J4NfCWM6aCh7DqCedkdKgLsvXTdwzWgQSVLXM4%2FqghbOmb918wng4gFZINbn4JI7dkFDToG7984p%2FUpumQgXDd5%2BbC0fcqnJdL8MKHqRYijxgsLknGOBHiioN84sRvygfpei%2BjfDEPbhtkXvy0FGSymLl5ONFpDCg9ZQNMx1F28KLz2PPAh%2Bz16F7P1XFJfwvNshyDV3KwgPymZImvX%2Bgmk3%2Bzpc7h6CGfPyv0nz8%2BX1fdvGehDLV3Sb%2BVpkgamR6zfY0aMG7IRHEGJWOiAaYTvwX%2FoypCEm8UvtsTY8UOHdnSV4UAecs7UQGxwaq%2FjBqLKJkXNdVUd8QPPLU3Txt%2BV3hzucT2ANR4SCcr02XEM1Pd9l9GvQOriGuhQw2HENZEw57PPygY6pgEG1ViXC%2FO63UkbsdjLgAHewanEIdCc6YfXzqYQPUzOYpK1jClU1Ko%2FL8om8zvdwEYLNgyTU59wgP21ocA5%2F38JItf0rJWGApvlayyIdI%2F8ytDbqLhhBB0mM4vnH3bEABJ3RAbXKNrE%2BGHfxLURMXJPr03FtO43GNYTt4uVFPRGPF5YMOEpmxjaYcLT88GD1KgiF9P51c9ZOwNysvBC2Pn1G%2BDNh79H&X-Amz-Signature=0d8a8137d17fd215f8a458ac950df3f3f163b18e3daa7003262a136273c2ef19&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
