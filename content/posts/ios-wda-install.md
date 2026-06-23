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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VSDRFHBC%2F20260623%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260623T020926Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEoaCXVzLXdlc3QtMiJHMEUCIQClYgXauQ5l7mipJ0wU%2F%2BMs07JXM72Eft9sDeoUJEry7QIgMOPpOpq9SauM2THsq3rX9JW%2FfIi%2F1L8dukTLVFmMqucq%2FwMIExAAGgw2Mzc0MjMxODM4MDUiDB%2FGTjzHxx0kjcLBZSrcAxDr20QqH%2FTHSTyG7AI6wIYSyRy24yCLR22wgGz4ufCmwprglOn1KKIR0UxcA25LF80FUtnDSLozRnCHGCdcUS%2FT56IOJGJMFu2D%2BmrGVJwnDDKgNdWcZK7cFaC1FwdX8g%2FLe1cRei2I5ZbZsYVN711zoMQYCzyVemqLII%2BsMXIsvKj6ahNYIUyJvQS55y77FcqZYK7kRUWa3v5H81LjP1HJzEqYJrqo%2BeXOVOyL34Zy4mZiaNKI0zx%2BtZetKuES4KAU8OQIYD%2FjXhAhYMXie3Uv1nfq8taPXy2ojC8mlCQKAnuXhF3kyelA7YaPcZbt4S6VDjAh2uM3aoAPUyfS6oRR5p9dB%2BI0remntMUup5Npby71E%2BEQv%2BN0jx3Hxvy1rhPfz2DP%2FSKwOuzibOXIMl%2B1VJkgiewEGwWJm5ly00JJcNKoSMYwHnDiytjxffeb1L4T9l4oS%2FC5oAlOtwxovZp9x50BWw8Wev91tv3OGf3EDRZsH9AWovr%2FLSRysIB09YshELdDHMhP8WscgG6oz6q%2FqTLmzQDE5GvTITotuymk%2FaWKd0nC%2BzIq1%2FFt%2BiV7u1G%2FHet6uZwC0LTEO3DxSF6bi3nxkRb%2FpFwEG%2BR6%2FXRy%2F72jlOqhEFBM2%2BhNMKTH59EGOqUBTfaLL%2FmZ%2Bn5PsdPhnbpA1ZdX%2BjnaS2T3xtic3C8e%2Ft%2FG%2BpABMTri7d7sqyN7%2FoWL%2BRBQPzbO5sU6zr0YEeXgJptmTkD5xObu5YjilJvVc36eWOuqAiHe9%2BzTgIpfW5%2Bf8HBs4%2FA%2FovtY9m1zoKoKuRtp24705Gd7D8ex3OwaeEDbaxPoc5aEZf6KrXEG0MWTG656z2cVnhYQcfQrgurbcni6K9KJ&X-Amz-Signature=06c72c7f3abafc58fe4a9667e3cda10f8ba769d34d945635e21d7088e4d3cd71&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VSDRFHBC%2F20260623%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260623T020926Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEoaCXVzLXdlc3QtMiJHMEUCIQClYgXauQ5l7mipJ0wU%2F%2BMs07JXM72Eft9sDeoUJEry7QIgMOPpOpq9SauM2THsq3rX9JW%2FfIi%2F1L8dukTLVFmMqucq%2FwMIExAAGgw2Mzc0MjMxODM4MDUiDB%2FGTjzHxx0kjcLBZSrcAxDr20QqH%2FTHSTyG7AI6wIYSyRy24yCLR22wgGz4ufCmwprglOn1KKIR0UxcA25LF80FUtnDSLozRnCHGCdcUS%2FT56IOJGJMFu2D%2BmrGVJwnDDKgNdWcZK7cFaC1FwdX8g%2FLe1cRei2I5ZbZsYVN711zoMQYCzyVemqLII%2BsMXIsvKj6ahNYIUyJvQS55y77FcqZYK7kRUWa3v5H81LjP1HJzEqYJrqo%2BeXOVOyL34Zy4mZiaNKI0zx%2BtZetKuES4KAU8OQIYD%2FjXhAhYMXie3Uv1nfq8taPXy2ojC8mlCQKAnuXhF3kyelA7YaPcZbt4S6VDjAh2uM3aoAPUyfS6oRR5p9dB%2BI0remntMUup5Npby71E%2BEQv%2BN0jx3Hxvy1rhPfz2DP%2FSKwOuzibOXIMl%2B1VJkgiewEGwWJm5ly00JJcNKoSMYwHnDiytjxffeb1L4T9l4oS%2FC5oAlOtwxovZp9x50BWw8Wev91tv3OGf3EDRZsH9AWovr%2FLSRysIB09YshELdDHMhP8WscgG6oz6q%2FqTLmzQDE5GvTITotuymk%2FaWKd0nC%2BzIq1%2FFt%2BiV7u1G%2FHet6uZwC0LTEO3DxSF6bi3nxkRb%2FpFwEG%2BR6%2FXRy%2F72jlOqhEFBM2%2BhNMKTH59EGOqUBTfaLL%2FmZ%2Bn5PsdPhnbpA1ZdX%2BjnaS2T3xtic3C8e%2Ft%2FG%2BpABMTri7d7sqyN7%2FoWL%2BRBQPzbO5sU6zr0YEeXgJptmTkD5xObu5YjilJvVc36eWOuqAiHe9%2BzTgIpfW5%2Bf8HBs4%2FA%2FovtY9m1zoKoKuRtp24705Gd7D8ex3OwaeEDbaxPoc5aEZf6KrXEG0MWTG656z2cVnhYQcfQrgurbcni6K9KJ&X-Amz-Signature=b058337613623cf686435e0d09245439889dd172d83dc85f42a118a51d141fb6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
