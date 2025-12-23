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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666YXWBH2L%2F20251223%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251223T122321Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEQaCXVzLXdlc3QtMiJHMEUCIQDR%2BPkwEdch%2BmWygtZcGNyGLgeCJaEMl8TLGx2VqsMIMgIgLss4Lg%2BKNU4I4aYMxnm%2BeJri3foqrvaz6IoHlLEeKM0q%2FwMIDRAAGgw2Mzc0MjMxODM4MDUiDPIDlQpnwIJBtT%2FeEircAwFYw1uGf6YNLw0%2Be%2BgQuL8IP1tePPoMleXG7YAibIxKuCHTm0Gs%2FQ2kJUkuHzHXFwV09u%2F8mhGIhMmagteJBDt9a8mCMJdl2%2B7ZJBhfctjzwj4G7gdHC3AkMTGxZiBeuTOOAx3P5TfC3VHZ095pvpSmcCczuIAEIXl%2FBnrkHVi%2Fg6vhJRSWf6rIv8klRdXEVzn93HztheFHQO0oE2lLKgYSyzwpZBEFVikFV%2F6topuuxsfjPZs8AbE9VhGL%2BYIZ4J9pt%2FL7ZRsTNGcGChp1pvEY01tX21fTxKWhCDa7g%2F4yr9AKSWXaEePfa1s57dJjByG3yekawZ7SysY4i2%2FXphl4b%2FRDpIDFk5658rUSY%2F339FdXozk2NmUdCEht7g8myLhJE4Icdjpef07oJGoZZCLgHRwQ3yqS8wDR8XIRp05GRFTE1KulC0nMp0RZNlsvz0VJPBRGtNSnTaDwYlVfDv%2BCvCAW9wgo5mO3BxRvdQi%2FRHOM%2FuKhv48Dvx26VZRESj2%2BSV3qMXXBvsxsuLm%2FmmTfrApL61M5fLtDN9csGQsOVcyrPU505IEWbllAi9OzOaRUvpqA5z6N75FJbO8pJ3auxrPZlsdsMLWn9PzwLLewiG%2BKVJ3B%2Bi6%2BSgTtMNaBqsoGOqUB9xpSxgnxfTHCArLKxlXEG2CIxD7UJfYWYFVENKgVrAWJGK8%2BsVfi9Zobj3k7KJMRFNcCsjvWfCagIA3y3X0k0wcPmHSyB9w6VDiu4GAFsK0%2Bm7i8iVhf%2Fh0G8ftN7yZm8hAFi3L6BkQW17no4Kg9d2Di7TAYzu6%2B%2FONkfjKJVBEOJtynXAAURzV0XzRK7%2BUfkTl5K8OAWJtj6IbJop05e3dUOPkO&X-Amz-Signature=3fd56fa624039896b8083cca3bb3d5dcd432bab70a27cf8687866915db755aee&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666YXWBH2L%2F20251223%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251223T122321Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEQaCXVzLXdlc3QtMiJHMEUCIQDR%2BPkwEdch%2BmWygtZcGNyGLgeCJaEMl8TLGx2VqsMIMgIgLss4Lg%2BKNU4I4aYMxnm%2BeJri3foqrvaz6IoHlLEeKM0q%2FwMIDRAAGgw2Mzc0MjMxODM4MDUiDPIDlQpnwIJBtT%2FeEircAwFYw1uGf6YNLw0%2Be%2BgQuL8IP1tePPoMleXG7YAibIxKuCHTm0Gs%2FQ2kJUkuHzHXFwV09u%2F8mhGIhMmagteJBDt9a8mCMJdl2%2B7ZJBhfctjzwj4G7gdHC3AkMTGxZiBeuTOOAx3P5TfC3VHZ095pvpSmcCczuIAEIXl%2FBnrkHVi%2Fg6vhJRSWf6rIv8klRdXEVzn93HztheFHQO0oE2lLKgYSyzwpZBEFVikFV%2F6topuuxsfjPZs8AbE9VhGL%2BYIZ4J9pt%2FL7ZRsTNGcGChp1pvEY01tX21fTxKWhCDa7g%2F4yr9AKSWXaEePfa1s57dJjByG3yekawZ7SysY4i2%2FXphl4b%2FRDpIDFk5658rUSY%2F339FdXozk2NmUdCEht7g8myLhJE4Icdjpef07oJGoZZCLgHRwQ3yqS8wDR8XIRp05GRFTE1KulC0nMp0RZNlsvz0VJPBRGtNSnTaDwYlVfDv%2BCvCAW9wgo5mO3BxRvdQi%2FRHOM%2FuKhv48Dvx26VZRESj2%2BSV3qMXXBvsxsuLm%2FmmTfrApL61M5fLtDN9csGQsOVcyrPU505IEWbllAi9OzOaRUvpqA5z6N75FJbO8pJ3auxrPZlsdsMLWn9PzwLLewiG%2BKVJ3B%2Bi6%2BSgTtMNaBqsoGOqUB9xpSxgnxfTHCArLKxlXEG2CIxD7UJfYWYFVENKgVrAWJGK8%2BsVfi9Zobj3k7KJMRFNcCsjvWfCagIA3y3X0k0wcPmHSyB9w6VDiu4GAFsK0%2Bm7i8iVhf%2Fh0G8ftN7yZm8hAFi3L6BkQW17no4Kg9d2Di7TAYzu6%2B%2FONkfjKJVBEOJtynXAAURzV0XzRK7%2BUfkTl5K8OAWJtj6IbJop05e3dUOPkO&X-Amz-Signature=40a8915aaad214d36be238f8a12101191a481862767e673af64bfe319c0996b6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
