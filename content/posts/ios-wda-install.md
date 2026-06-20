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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466R6V4ANSQ%2F20260620%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260620T021505Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAIaCXVzLXdlc3QtMiJIMEYCIQChvE1cw7prUd2QD2XTe9EX1h%2FSOyNMsojsIwpE5hlL0AIhAMfX4AjS6%2Bwnz5wTKt5h7j%2BLN0M95wYcdlcYKMlqEHH8KogECMr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzTordI34IKRboUM%2BIq3AN%2B%2Bv8WxCmenNOzr25Y8mOCvnOYRpGb9B1REl8iXFQThqx0LjhyDuGiS1uEaQ%2BfmLYb8dfglHmHir%2BmKN56QUu%2FsOOk2V%2B%2BjJwxG4GqnQqrFkwyw137fnhlYAup9AhgM5sELI3TgldbKPrDO0C3xwpM6gC%2FolaNr4ykBp4Oy1fhdKYXqVYsDWDuxb%2FgmDzmvYUjyzUs2M%2Fe%2BB3Dnwdgy0YMWFjL%2Ba9HHPuNDjmyGFzA212kuBXMVC4u%2FFtMZIlf2WZp5VOF%2Bwu1pPGpqTPyDxGspnEaYwFFgngfGodoC39YOC3BQB4x%2BjqQddJW%2FAulGPB%2BvjguyZ8zpUR59q6CoKf5DN5lRGXRuC5jbHABzxR7cpdhNxm2fisbhWESDLz8PtLgGO2%2FfDu04cn7gH7IAbuBMw4MOf0l8endV9Ic%2FijH7zE64wqZ5XXmd6tctXCBF06N2xDpeg2TSHgnujRphFlKAodKGcPjZKGkKPqENtiJ26Wp5EJH6bZO%2BqBqh6z7VwOhqMdUDpB35BbHRV21V1fqDkvR1w9QTwM69xFhn8g611DVTtVdPai16MavnYZh2t%2BWHfWuQc%2FyXGlqMCAM8zt1vWx3cZvlZ3kPkJ%2FfbF%2BdXPq4DLlZmzzs8d5sBjCl1dfRBjqkAWLFMjOu%2FqJ7pmIHnK7bOpj7B4oxTiVSpMxR4R47zmnuK5%2BrLB7i2wQhmNh2WPB3LZ6USJ2gz4E6oFTKivShoqn0r6GEIm4rkaUOGd3lha%2BVq1TFLTL9EtE8iOwtApI7gszX5P%2BRIx9dYWCNU32sBrnVcYINjo8nGJUQbr8zXWZX2Ji5NMRrN8ZzQzNeAwPLZiiG%2BfnmgMFJEILcd2aajJCVO1%2BC&X-Amz-Signature=097324f42f300025f5bca94dc20fab98b6fdc993c1e51ac76ad1d629436eb4a4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466R6V4ANSQ%2F20260620%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260620T021505Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAIaCXVzLXdlc3QtMiJIMEYCIQChvE1cw7prUd2QD2XTe9EX1h%2FSOyNMsojsIwpE5hlL0AIhAMfX4AjS6%2Bwnz5wTKt5h7j%2BLN0M95wYcdlcYKMlqEHH8KogECMr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzTordI34IKRboUM%2BIq3AN%2B%2Bv8WxCmenNOzr25Y8mOCvnOYRpGb9B1REl8iXFQThqx0LjhyDuGiS1uEaQ%2BfmLYb8dfglHmHir%2BmKN56QUu%2FsOOk2V%2B%2BjJwxG4GqnQqrFkwyw137fnhlYAup9AhgM5sELI3TgldbKPrDO0C3xwpM6gC%2FolaNr4ykBp4Oy1fhdKYXqVYsDWDuxb%2FgmDzmvYUjyzUs2M%2Fe%2BB3Dnwdgy0YMWFjL%2Ba9HHPuNDjmyGFzA212kuBXMVC4u%2FFtMZIlf2WZp5VOF%2Bwu1pPGpqTPyDxGspnEaYwFFgngfGodoC39YOC3BQB4x%2BjqQddJW%2FAulGPB%2BvjguyZ8zpUR59q6CoKf5DN5lRGXRuC5jbHABzxR7cpdhNxm2fisbhWESDLz8PtLgGO2%2FfDu04cn7gH7IAbuBMw4MOf0l8endV9Ic%2FijH7zE64wqZ5XXmd6tctXCBF06N2xDpeg2TSHgnujRphFlKAodKGcPjZKGkKPqENtiJ26Wp5EJH6bZO%2BqBqh6z7VwOhqMdUDpB35BbHRV21V1fqDkvR1w9QTwM69xFhn8g611DVTtVdPai16MavnYZh2t%2BWHfWuQc%2FyXGlqMCAM8zt1vWx3cZvlZ3kPkJ%2FfbF%2BdXPq4DLlZmzzs8d5sBjCl1dfRBjqkAWLFMjOu%2FqJ7pmIHnK7bOpj7B4oxTiVSpMxR4R47zmnuK5%2BrLB7i2wQhmNh2WPB3LZ6USJ2gz4E6oFTKivShoqn0r6GEIm4rkaUOGd3lha%2BVq1TFLTL9EtE8iOwtApI7gszX5P%2BRIx9dYWCNU32sBrnVcYINjo8nGJUQbr8zXWZX2Ji5NMRrN8ZzQzNeAwPLZiiG%2BfnmgMFJEILcd2aajJCVO1%2BC&X-Amz-Signature=8eaf183bb693d6a370b572fcf71735e6ad734391c50e8c85bb9ee764fa92ca74&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
