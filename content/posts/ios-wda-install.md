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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YCPHB7QG%2F20260425%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260425T123814Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQD2U7ZBM34AVthb9aAiExg67mGLL6rvfyJQvnMg8BNG1gIgfE%2FqmG4wYxj%2BQORtUQIzbb3%2BOfZesBzx5%2FcypU7abuEqiAQIkf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDIvzaXuupgkHxs0OfCrcA21cgEGK4hNl7EJgogSLT9L23WVzOBtsTO5UNo93iQi2Q2QgqSGigOshEbb8bhZXSf3C%2BehiDZadf9cAhxBD181Oz0vvYfn9aEf6Y6GpNQjGzBwzJ6YvZp9gBbZNUpyDjdLDoKIIpy1Ly4P9JPpLyD5Y7UK3aJHf1Bub8OrXA9zu66bOCoOrjR40Q0%2Fw9%2BkDagZf2OpUWtph9OwWyB9g9a%2FZSauBg4FK7MOOui3Iux8INkecw7bYbOEzOq%2FKAwyX2FZqHVCuDqU3Wy1zLZtV5K4dqm5jjzoJCyDlAGmix%2FVnprWoCHSRq2jhButgW21WpNN1zsaGngG1ppgDafC1Eh0A5x%2FOMzCWXE9fABZhQib%2BanLLXEIgQHemWUHocIFNw5DwCr%2F5Gg2YWCEdxdbjpOUW4wYde2kmE3eg9V8FL4vYZNw9Mk2i3Qd27hiKDokHhjYy5T7Wgq33%2FXqRCCISEAM%2F9dCorZCtkktP8EkrgUqb0JFDS6MXXFtoQITMV9iuux5AYNpmd3Pos88ahCCoqlFqOtAPCmq2sBmkc95%2BJaqH7Kwk1VI8mfmm44ULLG%2BDgm%2BhCewJ3Vr%2Bzi%2BUPW0wFSv49ap40%2BJcTNosGWhcTbfoPU5S3xdP9VXSf9ZGMKnfsc8GOqUBmeSwLzi%2Bw1Cfj0rJADw6g2KxY9EAPAHOau9RFGeLC1xltIs5mmiisx8YpALeSifODhnSFaMQdn6IWY3aq%2FmE6IURnuZKOOyz2LtV25WFEoZsUzznm%2B6JffcyultuOz18p%2FlUnKQkbEovExRgaQ9l7T4A7VTeKUCDHqu6LwlUkoRgZCoHJvmq5SXzkLo2BT%2BFa2rLDnXNqsvshS6UWNUXS8tzV1Zz&X-Amz-Signature=66370e0a098a1e83a4afafa3cf0089798ba5e82c5439f0b382d894b23bd9b5e4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YCPHB7QG%2F20260425%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260425T123814Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQD2U7ZBM34AVthb9aAiExg67mGLL6rvfyJQvnMg8BNG1gIgfE%2FqmG4wYxj%2BQORtUQIzbb3%2BOfZesBzx5%2FcypU7abuEqiAQIkf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDIvzaXuupgkHxs0OfCrcA21cgEGK4hNl7EJgogSLT9L23WVzOBtsTO5UNo93iQi2Q2QgqSGigOshEbb8bhZXSf3C%2BehiDZadf9cAhxBD181Oz0vvYfn9aEf6Y6GpNQjGzBwzJ6YvZp9gBbZNUpyDjdLDoKIIpy1Ly4P9JPpLyD5Y7UK3aJHf1Bub8OrXA9zu66bOCoOrjR40Q0%2Fw9%2BkDagZf2OpUWtph9OwWyB9g9a%2FZSauBg4FK7MOOui3Iux8INkecw7bYbOEzOq%2FKAwyX2FZqHVCuDqU3Wy1zLZtV5K4dqm5jjzoJCyDlAGmix%2FVnprWoCHSRq2jhButgW21WpNN1zsaGngG1ppgDafC1Eh0A5x%2FOMzCWXE9fABZhQib%2BanLLXEIgQHemWUHocIFNw5DwCr%2F5Gg2YWCEdxdbjpOUW4wYde2kmE3eg9V8FL4vYZNw9Mk2i3Qd27hiKDokHhjYy5T7Wgq33%2FXqRCCISEAM%2F9dCorZCtkktP8EkrgUqb0JFDS6MXXFtoQITMV9iuux5AYNpmd3Pos88ahCCoqlFqOtAPCmq2sBmkc95%2BJaqH7Kwk1VI8mfmm44ULLG%2BDgm%2BhCewJ3Vr%2Bzi%2BUPW0wFSv49ap40%2BJcTNosGWhcTbfoPU5S3xdP9VXSf9ZGMKnfsc8GOqUBmeSwLzi%2Bw1Cfj0rJADw6g2KxY9EAPAHOau9RFGeLC1xltIs5mmiisx8YpALeSifODhnSFaMQdn6IWY3aq%2FmE6IURnuZKOOyz2LtV25WFEoZsUzznm%2B6JffcyultuOz18p%2FlUnKQkbEovExRgaQ9l7T4A7VTeKUCDHqu6LwlUkoRgZCoHJvmq5SXzkLo2BT%2BFa2rLDnXNqsvshS6UWNUXS8tzV1Zz&X-Amz-Signature=260b4fd682117a2c7dcbff0ae1569c514ddb1866bdbc147a8690f6cf28cdfa46&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
