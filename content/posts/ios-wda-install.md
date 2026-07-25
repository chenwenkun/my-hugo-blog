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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TXXVL2VG%2F20260725%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260725T185110Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFoaCXVzLXdlc3QtMiJHMEUCIQDB2QkAfrqD2JNTgQYx6kJAwtj2zH9fmXRAg8svlFu9GQIgNeyayLNoOh23zuC%2BG1A7U8ZRz%2FwTi1cujGS02hAtHD0q%2FwMIIxAAGgw2Mzc0MjMxODM4MDUiDIebZoq1omI1%2FZOzKSrcA6Shg1OVJfD8QmoyUEqTyEebGUoAZosnoVBaqPbNfnG%2BkY4Q3J9gtquDX1E15MVEvJfURfTmBwE71%2BATFkVl96%2Fa1xXVGJRhfsocgADi0WCtatxAmFgnAEjOrdBi4YgRyRMenIQjUnYu93c6C8tA24BsbNgU5nvPAbAMJhLuKyHRBSHunHtnYbNif2ebXGxYQYEnvrun9K9HORLH19Bo4C9Fu7jvJhT22KIgTdhFCzjxPkTqIuAIKHeiM64GtzLqUpnVKHOjDgSplb1IUTGX1KKTIDl2bLWMG%2FXpkeU%2FVRazwm6TcXZkGF9e78RT2fgUVIuhepE7GK%2FI61VSu4t8nclXYY%2FVPO%2Fe5VnI530xlpczbGhMNRaYaHKXd061BAfKQj%2BM1US%2BRQjiqylLd5tJcEAzWobMB2eZmTGDLmG22ILW7UW8R6Xa2l89GcpdzscIPgi7cSiGuDZbtK5CFeDnEtMKMzFnRKfIrH4StKIuGqnDuS0APFWEVHXG2BW8xSUfGd9HWasSqucGWe%2FEXUCj14MV9TbpB7o8EWgcLT9jnSyG%2F%2BmMNklbONVtdv3uPv6sHp%2BT6hsu7aEX4s3Vx%2FGf9vh7Z9C1hN81KDu%2FtOuZ9R6qNmjYiIB3yjdyXGpJMJfxk9MGOqUBckIYcvpJtcNe6tvGj8oPQtMYYzQYxGAN9zevHSLLuad%2BW0iYsh8NlRJAnKFkVsrO7v5XR4vOghtm8DT4c5FJKHZ5Bwp95ThRx%2B8Fgt1ar8KgGankl7HOFqjk4mcD0rrDre6M3H7A9%2FwL7Kl%2FTYSbHjPbhBiXUG8fgqasK%2F1JRrKd2DNc0ga0T%2B%2FCwNtA4wafNL6wA2w%2BUnZN5PZcxR5sO7C9thUx&X-Amz-Signature=df060f009388821095d0ecc2df0d1b2993b06ee028e7ce20f9a3c61c4926ef81&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TXXVL2VG%2F20260725%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260725T185110Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFoaCXVzLXdlc3QtMiJHMEUCIQDB2QkAfrqD2JNTgQYx6kJAwtj2zH9fmXRAg8svlFu9GQIgNeyayLNoOh23zuC%2BG1A7U8ZRz%2FwTi1cujGS02hAtHD0q%2FwMIIxAAGgw2Mzc0MjMxODM4MDUiDIebZoq1omI1%2FZOzKSrcA6Shg1OVJfD8QmoyUEqTyEebGUoAZosnoVBaqPbNfnG%2BkY4Q3J9gtquDX1E15MVEvJfURfTmBwE71%2BATFkVl96%2Fa1xXVGJRhfsocgADi0WCtatxAmFgnAEjOrdBi4YgRyRMenIQjUnYu93c6C8tA24BsbNgU5nvPAbAMJhLuKyHRBSHunHtnYbNif2ebXGxYQYEnvrun9K9HORLH19Bo4C9Fu7jvJhT22KIgTdhFCzjxPkTqIuAIKHeiM64GtzLqUpnVKHOjDgSplb1IUTGX1KKTIDl2bLWMG%2FXpkeU%2FVRazwm6TcXZkGF9e78RT2fgUVIuhepE7GK%2FI61VSu4t8nclXYY%2FVPO%2Fe5VnI530xlpczbGhMNRaYaHKXd061BAfKQj%2BM1US%2BRQjiqylLd5tJcEAzWobMB2eZmTGDLmG22ILW7UW8R6Xa2l89GcpdzscIPgi7cSiGuDZbtK5CFeDnEtMKMzFnRKfIrH4StKIuGqnDuS0APFWEVHXG2BW8xSUfGd9HWasSqucGWe%2FEXUCj14MV9TbpB7o8EWgcLT9jnSyG%2F%2BmMNklbONVtdv3uPv6sHp%2BT6hsu7aEX4s3Vx%2FGf9vh7Z9C1hN81KDu%2FtOuZ9R6qNmjYiIB3yjdyXGpJMJfxk9MGOqUBckIYcvpJtcNe6tvGj8oPQtMYYzQYxGAN9zevHSLLuad%2BW0iYsh8NlRJAnKFkVsrO7v5XR4vOghtm8DT4c5FJKHZ5Bwp95ThRx%2B8Fgt1ar8KgGankl7HOFqjk4mcD0rrDre6M3H7A9%2FwL7Kl%2FTYSbHjPbhBiXUG8fgqasK%2F1JRrKd2DNc0ga0T%2B%2FCwNtA4wafNL6wA2w%2BUnZN5PZcxR5sO7C9thUx&X-Amz-Signature=c2fa17f1c1f25fd807ebc5d7a1c0d38a39a66ab085c5a52710e8672542956fd6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
