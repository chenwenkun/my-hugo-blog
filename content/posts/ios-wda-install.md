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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZXLFMB4N%2F20260320%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260320T011054Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGEaCXVzLXdlc3QtMiJGMEQCIEJnk%2BmJLIZpUXt3H%2F9yvjJynLNYNv6IrybrkTe2EWH9AiAGyV1nuHELli6dcy1IDekMDtkhxqWllmLABg0xxdsk%2BCr%2FAwgqEAAaDDYzNzQyMzE4MzgwNSIMo44DlbxqSzMxCM7NKtwDha8pCluomNco81EZIwd2lbAULJ3QiX%2FUv%2FkCXgbpo482wE1RW5gIKs7HtuH3H7snsWZmObbm95fb%2B150yC4rKxJfnSygW9V1Q0Df8%2BcPz1WefNiqpDS3h7OXWg9H6TuNsmaJph587NnguM2ZgstjTwRNrSuAaysOMAInwVHfu0oNMyj2SHmK%2FwhhX%2BmKO%2FNQm0ggDZkdS6Z9DvIKlVwoP39%2Fk%2F%2F5rRlUXxIzi5F68aVPwoG7XvB4%2FPGNnq%2FmZRzGTmm4FsV0Wr6lJU8pkoqWmmoSGji%2BXKR5fJv%2FFF9DuPXOBJnMMIaolnWb7WuJieqYk5L%2F8fXHUdW4IWUkAKKAbAKFMKY20iF2eTgqnPEvnQdPmt12pz1kKVag3eDOzlBTalq2kmF5KSLToO%2F1ZFDs0vEmTUKcejfefv6DsVELRqMZdIoApbe5WEDLZ3GP7OFM8xvVIQXaQu3WOsL%2F%2B8qBre%2BtjGzfY9hax0BREKhpagItXQ4YZIsNh6Gi%2FuLJ2h3gvcXKPZEDOSW%2BO2fT9KNqIglS%2BTZrDrLcKo88SbJ%2FeNtyKA7F2EuH8rBgLpSZCZm7%2FvEptDUE8U9nVesyc3IJbF8evumI8xvYZb23tTel2aQLSyr%2FREgDW%2FZgZ%2B4wy7fyzQY6pgHzxg5z%2BlqndGzq4VK3P39HXpvU5RWjq97OJUAgP1O%2FnbQL7cQC0iQFT2QT9d8iLZkpp5jj2Fvt3dhiY1IyMroXjWYZo%2FNW7izNP03FabkEsVXIrzV5oBVnqINdWoEoGPuUzF%2Bb7SZenim3h4kk2we0nmqut%2BiXoGT%2FyDVznkDjW2ZcjQE0OlcNYxxv6SuDx2iOCFSVdgej9PTWzyaTW0fed80nlGpF&X-Amz-Signature=7beb999023a4ea9d293f667d287be91dd55bb58c626c2e7748fc3c8dba9d81b5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZXLFMB4N%2F20260320%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260320T011054Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGEaCXVzLXdlc3QtMiJGMEQCIEJnk%2BmJLIZpUXt3H%2F9yvjJynLNYNv6IrybrkTe2EWH9AiAGyV1nuHELli6dcy1IDekMDtkhxqWllmLABg0xxdsk%2BCr%2FAwgqEAAaDDYzNzQyMzE4MzgwNSIMo44DlbxqSzMxCM7NKtwDha8pCluomNco81EZIwd2lbAULJ3QiX%2FUv%2FkCXgbpo482wE1RW5gIKs7HtuH3H7snsWZmObbm95fb%2B150yC4rKxJfnSygW9V1Q0Df8%2BcPz1WefNiqpDS3h7OXWg9H6TuNsmaJph587NnguM2ZgstjTwRNrSuAaysOMAInwVHfu0oNMyj2SHmK%2FwhhX%2BmKO%2FNQm0ggDZkdS6Z9DvIKlVwoP39%2Fk%2F%2F5rRlUXxIzi5F68aVPwoG7XvB4%2FPGNnq%2FmZRzGTmm4FsV0Wr6lJU8pkoqWmmoSGji%2BXKR5fJv%2FFF9DuPXOBJnMMIaolnWb7WuJieqYk5L%2F8fXHUdW4IWUkAKKAbAKFMKY20iF2eTgqnPEvnQdPmt12pz1kKVag3eDOzlBTalq2kmF5KSLToO%2F1ZFDs0vEmTUKcejfefv6DsVELRqMZdIoApbe5WEDLZ3GP7OFM8xvVIQXaQu3WOsL%2F%2B8qBre%2BtjGzfY9hax0BREKhpagItXQ4YZIsNh6Gi%2FuLJ2h3gvcXKPZEDOSW%2BO2fT9KNqIglS%2BTZrDrLcKo88SbJ%2FeNtyKA7F2EuH8rBgLpSZCZm7%2FvEptDUE8U9nVesyc3IJbF8evumI8xvYZb23tTel2aQLSyr%2FREgDW%2FZgZ%2B4wy7fyzQY6pgHzxg5z%2BlqndGzq4VK3P39HXpvU5RWjq97OJUAgP1O%2FnbQL7cQC0iQFT2QT9d8iLZkpp5jj2Fvt3dhiY1IyMroXjWYZo%2FNW7izNP03FabkEsVXIrzV5oBVnqINdWoEoGPuUzF%2Bb7SZenim3h4kk2we0nmqut%2BiXoGT%2FyDVznkDjW2ZcjQE0OlcNYxxv6SuDx2iOCFSVdgej9PTWzyaTW0fed80nlGpF&X-Amz-Signature=7af532b75513e3c21b0e63b9b391cd5c808c8a060b5844c92e8e6637b36b8b64&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
