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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466USOZZRFI%2F20260529%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260529T143729Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEP7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCICAgK1adT7K99Yk3vvhFt7aauO%2B1F6oBJC91Ze9ZTVj6AiA1UwPQPqoqEI%2B0Mhm59ODKlNxjnm03SP7f%2FbZVtBkGtSqIBAjH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMMeGOeRF4rTZDS3vAKtwDWJXyPQcgJTrmo3uPL7bLjBGQqVjaIHqt7ujiie%2BFGoRu5xo6Bch3mP8o55e5XeLl%2Bw1p9l0kAZhLWK1pvGqfGR57OYj1%2BKPKDu9H%2FBbL90wPdqeXXYX5zCPH%2B8N6B9Nrvr9gio2YT3X8gd3IKKH4WzIjoFkzaI1RkWz%2Brdn%2FDjzjX8QjSkxrV%2BMhwekMwAeHpQ8KoYFNlvUXTJnS8tWbR%2FLPLFFv2DxjuQChI63AVd2J0QCc6znnA%2FdjPj0q%2FeFeNghPDsixG1gYoMX7PjkFavjrRon68lC%2FdPCnPVpooxEciwMsaEX1jA9FzMtNFlEf5W9Hsmi9cIJkDigK3fhpaJOhs%2F9VqMg7R1PCrN%2FWWY0E48QSsAPsLC2Bfu7efYmHm0VKsxaqTR3tSl%2F0p70d1LZ7h88uPA9oGlFzdwA7I08c4PRvV%2FNUSOsiEvtog67Cy3fv0NF%2BfI0RKBgdSAshLS%2B5KS%2Fj3O%2BJZ6oUg14y%2BNJkQu1Jm8%2BBYJO%2BYanleW%2FnEBTZ18SC5EBP%2Bd%2Bbg2sOEfPw4ZEkr0jEu6oI96MLhev1qZegOm3Nd6N%2BLPR036aDeP%2Ft42nigl8ILZcCU%2BmxaEPypq1aPiCpq%2BMYBIMTGpbjMYoi3AHmGYnSKBMwi7Dm0AY6pgEjgFqXH1KZLoNUfq2n7ei7gR1zoC9U%2FQctLkI21KGW741SKlA%2Bb2qiWFi13TFFtOYdQ2SiQDmccmNs3rfvDnDe5SfC8QmnxGIbB9Syqf78vkwg%2FVgaacpAVmuCTr%2BD%2F%2FLiqVQM%2Fa0gTEj64yvs3zbNQ5NDZq%2FnTtt65GDrCmF91YsAH333qXBxmLujH1mI1J8STEk7zrvykxakguGm%2BQDr%2FBxVBydm&X-Amz-Signature=4493fb3504f93c179d7409894dde241c817b2643811ed6e57f3b3c7e2be9112e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466USOZZRFI%2F20260529%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260529T143729Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEP7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCICAgK1adT7K99Yk3vvhFt7aauO%2B1F6oBJC91Ze9ZTVj6AiA1UwPQPqoqEI%2B0Mhm59ODKlNxjnm03SP7f%2FbZVtBkGtSqIBAjH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMMeGOeRF4rTZDS3vAKtwDWJXyPQcgJTrmo3uPL7bLjBGQqVjaIHqt7ujiie%2BFGoRu5xo6Bch3mP8o55e5XeLl%2Bw1p9l0kAZhLWK1pvGqfGR57OYj1%2BKPKDu9H%2FBbL90wPdqeXXYX5zCPH%2B8N6B9Nrvr9gio2YT3X8gd3IKKH4WzIjoFkzaI1RkWz%2Brdn%2FDjzjX8QjSkxrV%2BMhwekMwAeHpQ8KoYFNlvUXTJnS8tWbR%2FLPLFFv2DxjuQChI63AVd2J0QCc6znnA%2FdjPj0q%2FeFeNghPDsixG1gYoMX7PjkFavjrRon68lC%2FdPCnPVpooxEciwMsaEX1jA9FzMtNFlEf5W9Hsmi9cIJkDigK3fhpaJOhs%2F9VqMg7R1PCrN%2FWWY0E48QSsAPsLC2Bfu7efYmHm0VKsxaqTR3tSl%2F0p70d1LZ7h88uPA9oGlFzdwA7I08c4PRvV%2FNUSOsiEvtog67Cy3fv0NF%2BfI0RKBgdSAshLS%2B5KS%2Fj3O%2BJZ6oUg14y%2BNJkQu1Jm8%2BBYJO%2BYanleW%2FnEBTZ18SC5EBP%2Bd%2Bbg2sOEfPw4ZEkr0jEu6oI96MLhev1qZegOm3Nd6N%2BLPR036aDeP%2Ft42nigl8ILZcCU%2BmxaEPypq1aPiCpq%2BMYBIMTGpbjMYoi3AHmGYnSKBMwi7Dm0AY6pgEjgFqXH1KZLoNUfq2n7ei7gR1zoC9U%2FQctLkI21KGW741SKlA%2Bb2qiWFi13TFFtOYdQ2SiQDmccmNs3rfvDnDe5SfC8QmnxGIbB9Syqf78vkwg%2FVgaacpAVmuCTr%2BD%2F%2FLiqVQM%2Fa0gTEj64yvs3zbNQ5NDZq%2FnTtt65GDrCmF91YsAH333qXBxmLujH1mI1J8STEk7zrvykxakguGm%2BQDr%2FBxVBydm&X-Amz-Signature=eb61374d79b42426ee20ea1acccd20f2d07b613eea3299b4517b7e8063747d15&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
