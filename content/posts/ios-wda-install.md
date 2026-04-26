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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Q2NRGTGS%2F20260426%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260426T124026Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCrPAqF5cdopAxYKjSUq3K4YoalbPwjktDMx5WRl6%2FHxgIgCxCfLzs9mxcDiYl91C5r7XVQxWbh68V%2B5oguBbHeZa8qiAQIqP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDLFVclkJ6SXGFpqR4ircAy%2FKIu7RFvZL%2BKGvf7EPyfJv9UBgGsYmE3SuVHTQSgbY%2FMlLLNhA6ZS5uApy0ow3qbvQKPu0tHiDFoBCmbOnoajHzyAqHeNrD3zV%2FJpA5xkv8B4103grFG%2FnPSiTQYQita40S8yjuKKDWF20RSo61hspSEsva7M%2FfieyVJO3AO3XJj7ZDYSOWqU7tAq%2B7ORyN7d1zlJUH8S1ol2Gncz6%2B9HiVvQFxplS04YXtEY4%2B1kFAEAUKsClE97BXD1saXt91nmdhS0NPoQLqS1nXI%2BBHE%2FlFYbgs9V8qcbxJiXbdnImWj0LXVi26eb7DnviyLLwzQzNnT4YBYvk4kG8Ll7IP8BIpmLwwb6RkgBU%2BdbEvVNLV0%2B54jnNbU%2BCMSuYxKoq7xR2oktrfLR%2B6Gkym6MWJh5THC70zosPjiedAtoDLooQjgW5oUqYo0UTPMezI7KOWPFtxMDpHTzACdVvI9HRz5hMflJRYsTtC5CqfyH0fAymzP9gyzXM9q5JY8M4QDMxTKz9BJnHmjxUICPqz2xCDR%2Bvjvmzt%2B2wZi6oUap7VIlslKWdbD6XdypVexuElB%2F1G97VrXsIEo38E24Z8jhNottQ1WUr7Q%2Bo2snYOqWKnysgi8oggHw%2Bx9rE4S2DMPjxts8GOqUBcQ1%2BKXXzFtGfpQT0y46OPQpQho7jMvRhg5TbjL4XBgMLwvgAQ5GiFW1XwP9z0zceLd8doGe2SDeJL6X0MzQUso05O7E5bZjXiE09eWOkydrSVrFn9c3%2FUN7Ht3jk5Fc0owQc4Xr%2FTgjgk0YLXuu%2BLfbSq0wLYcuuilRkOTW1ljfPe5SRj92at44yrN%2BQJr%2FP3GnwVLblYUKuDlHePDL0okJ%2BvC95&X-Amz-Signature=6af66b0618d55a00b10a4e021a700e2b457f72b128ab7435c9cab62969e5daac&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Q2NRGTGS%2F20260426%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260426T124026Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCrPAqF5cdopAxYKjSUq3K4YoalbPwjktDMx5WRl6%2FHxgIgCxCfLzs9mxcDiYl91C5r7XVQxWbh68V%2B5oguBbHeZa8qiAQIqP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDLFVclkJ6SXGFpqR4ircAy%2FKIu7RFvZL%2BKGvf7EPyfJv9UBgGsYmE3SuVHTQSgbY%2FMlLLNhA6ZS5uApy0ow3qbvQKPu0tHiDFoBCmbOnoajHzyAqHeNrD3zV%2FJpA5xkv8B4103grFG%2FnPSiTQYQita40S8yjuKKDWF20RSo61hspSEsva7M%2FfieyVJO3AO3XJj7ZDYSOWqU7tAq%2B7ORyN7d1zlJUH8S1ol2Gncz6%2B9HiVvQFxplS04YXtEY4%2B1kFAEAUKsClE97BXD1saXt91nmdhS0NPoQLqS1nXI%2BBHE%2FlFYbgs9V8qcbxJiXbdnImWj0LXVi26eb7DnviyLLwzQzNnT4YBYvk4kG8Ll7IP8BIpmLwwb6RkgBU%2BdbEvVNLV0%2B54jnNbU%2BCMSuYxKoq7xR2oktrfLR%2B6Gkym6MWJh5THC70zosPjiedAtoDLooQjgW5oUqYo0UTPMezI7KOWPFtxMDpHTzACdVvI9HRz5hMflJRYsTtC5CqfyH0fAymzP9gyzXM9q5JY8M4QDMxTKz9BJnHmjxUICPqz2xCDR%2Bvjvmzt%2B2wZi6oUap7VIlslKWdbD6XdypVexuElB%2F1G97VrXsIEo38E24Z8jhNottQ1WUr7Q%2Bo2snYOqWKnysgi8oggHw%2Bx9rE4S2DMPjxts8GOqUBcQ1%2BKXXzFtGfpQT0y46OPQpQho7jMvRhg5TbjL4XBgMLwvgAQ5GiFW1XwP9z0zceLd8doGe2SDeJL6X0MzQUso05O7E5bZjXiE09eWOkydrSVrFn9c3%2FUN7Ht3jk5Fc0owQc4Xr%2FTgjgk0YLXuu%2BLfbSq0wLYcuuilRkOTW1ljfPe5SRj92at44yrN%2BQJr%2FP3GnwVLblYUKuDlHePDL0okJ%2BvC95&X-Amz-Signature=7517a0c53f18297a4968155725fe6a0f4b36878f73251f405e478253280d291c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
