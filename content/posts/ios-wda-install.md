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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZZ7O2SVH%2F20260128%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260128T062212Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCSchnSNIOyqvAdkrPsSJt%2BhTWqVHywj3xR0HiCyjBLCQIhAIHqIn9fpp4bD9A76VvhkAJLb7xVQbbs5oWINufyuNW3Kv8DCGYQABoMNjM3NDIzMTgzODA1IgyUEgJXornW%2BvDcNT8q3ANB8dwZUIyLJHw0ElklwfBnksO09AekaKwl5kKYhRGJMtykn7c4mu9nwCu8yBJQosxVePUi3QJ2NuLvL0c1pSS7tBEMwuHYeueHcD8gAQXED%2BlAUXD8SF5WR3G7rN2DQyWYDozR5VPKsUAmlzSE1TDX65r9Wp5D6cXjKiAofUagMtdEkIa9S970KBN2qbRHq89N2gPhhrabTDOzoYj8jTF%2Fe8FDCW3lSVxcYGNWHUxCPKUtuVAMtI2MDliT80HzNA0zxdPKZLmSTCATMhSrW3RNxQyOQdN%2Bd1sJlg1HeSXMtrNNBiPFD7dhK4Pg4eF811pfylBxdbwpB%2BnKm6W%2FBHYPxfD8Mj%2FhmgHCFLHV%2F89u43HTzKYbjUtW%2BfZ0gip9zCxGTlsGcjRsi8J380%2B8cblgv1DWuJGAhXBVKuGRXxJ7pQlDB6cL0XmNQA%2F9EScrtKJeomuSM1R4MkxeyHRsk43Wo5MX6bgkVfopZXy3iOL5ePtQKZ7s8oFE656i0tcFWCy17ALcYnviqJUWf1Qq7mj3HQwv7DSdoY6Cf5h3jCo44B8SL6lqoXkwU9UBx9d2EDrcM9xNoWGlW2YcdibTPbwK99mZ04TEf3tBypax9a957OAUs8rRirN%2BTYsnDzDAsubLBjqkAUlAHVi%2FQ9O6KFbxoklHzlnnimUBem%2FIkUOZTP2WCrgQzViKVsW3fZtwcM7C%2BUcdW%2FYd1r6ztrWK5iURsNlo8hOpg%2BDVavcl%2BbskW4bJerDK9%2B2cGX0zXaOOxc7ETDo0H1BKJGdzRyO76ol%2F3OjEJagSipJDY5NGmjkDhhgCQoOWQGSL27jLDrrXlw61kPngks%2B%2BxJFyAA9i1eESv9wzz9BVMhR%2B&X-Amz-Signature=1364e09062510acf3e0cc6c82b2ab861872d234bc05242d3a21523e64332e5c5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZZ7O2SVH%2F20260128%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260128T062212Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCSchnSNIOyqvAdkrPsSJt%2BhTWqVHywj3xR0HiCyjBLCQIhAIHqIn9fpp4bD9A76VvhkAJLb7xVQbbs5oWINufyuNW3Kv8DCGYQABoMNjM3NDIzMTgzODA1IgyUEgJXornW%2BvDcNT8q3ANB8dwZUIyLJHw0ElklwfBnksO09AekaKwl5kKYhRGJMtykn7c4mu9nwCu8yBJQosxVePUi3QJ2NuLvL0c1pSS7tBEMwuHYeueHcD8gAQXED%2BlAUXD8SF5WR3G7rN2DQyWYDozR5VPKsUAmlzSE1TDX65r9Wp5D6cXjKiAofUagMtdEkIa9S970KBN2qbRHq89N2gPhhrabTDOzoYj8jTF%2Fe8FDCW3lSVxcYGNWHUxCPKUtuVAMtI2MDliT80HzNA0zxdPKZLmSTCATMhSrW3RNxQyOQdN%2Bd1sJlg1HeSXMtrNNBiPFD7dhK4Pg4eF811pfylBxdbwpB%2BnKm6W%2FBHYPxfD8Mj%2FhmgHCFLHV%2F89u43HTzKYbjUtW%2BfZ0gip9zCxGTlsGcjRsi8J380%2B8cblgv1DWuJGAhXBVKuGRXxJ7pQlDB6cL0XmNQA%2F9EScrtKJeomuSM1R4MkxeyHRsk43Wo5MX6bgkVfopZXy3iOL5ePtQKZ7s8oFE656i0tcFWCy17ALcYnviqJUWf1Qq7mj3HQwv7DSdoY6Cf5h3jCo44B8SL6lqoXkwU9UBx9d2EDrcM9xNoWGlW2YcdibTPbwK99mZ04TEf3tBypax9a957OAUs8rRirN%2BTYsnDzDAsubLBjqkAUlAHVi%2FQ9O6KFbxoklHzlnnimUBem%2FIkUOZTP2WCrgQzViKVsW3fZtwcM7C%2BUcdW%2FYd1r6ztrWK5iURsNlo8hOpg%2BDVavcl%2BbskW4bJerDK9%2B2cGX0zXaOOxc7ETDo0H1BKJGdzRyO76ol%2F3OjEJagSipJDY5NGmjkDhhgCQoOWQGSL27jLDrrXlw61kPngks%2B%2BxJFyAA9i1eESv9wzz9BVMhR%2B&X-Amz-Signature=a4000230c47ea7017d157da97874f52fe2643b7309965070a35304ba115b0ab4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
