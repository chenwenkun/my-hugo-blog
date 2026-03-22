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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RZB4TOGB%2F20260322%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260322T182233Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDESJTW31VqcW8EEUUQbZEYb0zTZ6dFBrmoUD6h1f%2BpUgIgb5sQNgs1o%2BhsW4Iaul0w9WIOuqge6QuyQd%2Bt0qvWvS8q%2FwMIaxAAGgw2Mzc0MjMxODM4MDUiDC0QHt3ML0vkSYcH2yrcA0UBekjh32J70kg9JM4nt6jESdl4poVE3SqdfPyjJVdQ3K%2F3yOoNNJ%2ByrCmDqIF1FaCfjhvoKjvrmGP7kanfR72d7Dc71BX%2FvP%2ByJk1qNT6pc3lE%2B4yGc8t6aK4lfyY%2FsgAt7TnJlka5gKYRV3vNOGPx6f%2FIN2PlzOBEK3rxui6bNLBfzbDetslaafwVkxoebzP0BB9oiH0hDlPxy3UP%2B7i%2BKsMWuwJ7GQe7IcF2XO8OInQTI8BH31TNec15J%2BGNB58VE4g2JsXiMC2y09IBJVhyn74tHzBEok6vwJjI0siOqE%2Fz1HsAcm%2FHC3npD9cole1hTzOVWtqlq%2Fzz3%2FiefyGvk0dFmSaydyLzxDgefcEOIh7IzcjNSi9yDrwtevV8ecuU%2FA1nztAYTa%2Fn%2Fj0ypHtKd3G8Xy8qQGAA2JCvHJK4pYAck7Bfmc8DpDWk9G0eaIId6qlgsUN5yIP0sb4VztLdNEhNQ5TWXhtV5J%2BUuYk43V6shN4%2B0D%2BZZbtOA4xSvbf4sPX6tH2UX7%2BtG1xU2FM4ikOe4ybCeeEAcZwOJZUHAzELAcTrnQUHS4Mk3AS%2BWL%2B%2BRHmhATppki12rTzhCANbzqJ4E2282vmJIUZ2%2FkwcV8skfuRMCZY%2FKgV%2FMNvdgM4GOqUBWmGeHVXvGXH%2FS8a7G59lCKeoJAYBkTF7ebwTfnduhH%2FJ3NLhjl%2FA24gJaFIXHMGKVea32XGkEFP3ZSOJoFPGP%2Fh2A17Xf6Ept6ZUs%2BUheEc6FuLsPx7Zlwm79StK4ZWYhTPRf3XSnxlslPGc6VmUa9AGPlDU79mrW2TjYGa9P332sV9X%2FZ6SYFbjKO7nAN76Xoq3sgGYg%2BufYzsDk5oS6egkMdiF&X-Amz-Signature=51dba2e08ba03595d337a2e8f67d5dc92b228c6fd5770c80f80a0708355640ae&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RZB4TOGB%2F20260322%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260322T182233Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDESJTW31VqcW8EEUUQbZEYb0zTZ6dFBrmoUD6h1f%2BpUgIgb5sQNgs1o%2BhsW4Iaul0w9WIOuqge6QuyQd%2Bt0qvWvS8q%2FwMIaxAAGgw2Mzc0MjMxODM4MDUiDC0QHt3ML0vkSYcH2yrcA0UBekjh32J70kg9JM4nt6jESdl4poVE3SqdfPyjJVdQ3K%2F3yOoNNJ%2ByrCmDqIF1FaCfjhvoKjvrmGP7kanfR72d7Dc71BX%2FvP%2ByJk1qNT6pc3lE%2B4yGc8t6aK4lfyY%2FsgAt7TnJlka5gKYRV3vNOGPx6f%2FIN2PlzOBEK3rxui6bNLBfzbDetslaafwVkxoebzP0BB9oiH0hDlPxy3UP%2B7i%2BKsMWuwJ7GQe7IcF2XO8OInQTI8BH31TNec15J%2BGNB58VE4g2JsXiMC2y09IBJVhyn74tHzBEok6vwJjI0siOqE%2Fz1HsAcm%2FHC3npD9cole1hTzOVWtqlq%2Fzz3%2FiefyGvk0dFmSaydyLzxDgefcEOIh7IzcjNSi9yDrwtevV8ecuU%2FA1nztAYTa%2Fn%2Fj0ypHtKd3G8Xy8qQGAA2JCvHJK4pYAck7Bfmc8DpDWk9G0eaIId6qlgsUN5yIP0sb4VztLdNEhNQ5TWXhtV5J%2BUuYk43V6shN4%2B0D%2BZZbtOA4xSvbf4sPX6tH2UX7%2BtG1xU2FM4ikOe4ybCeeEAcZwOJZUHAzELAcTrnQUHS4Mk3AS%2BWL%2B%2BRHmhATppki12rTzhCANbzqJ4E2282vmJIUZ2%2FkwcV8skfuRMCZY%2FKgV%2FMNvdgM4GOqUBWmGeHVXvGXH%2FS8a7G59lCKeoJAYBkTF7ebwTfnduhH%2FJ3NLhjl%2FA24gJaFIXHMGKVea32XGkEFP3ZSOJoFPGP%2Fh2A17Xf6Ept6ZUs%2BUheEc6FuLsPx7Zlwm79StK4ZWYhTPRf3XSnxlslPGc6VmUa9AGPlDU79mrW2TjYGa9P332sV9X%2FZ6SYFbjKO7nAN76Xoq3sgGYg%2BufYzsDk5oS6egkMdiF&X-Amz-Signature=9a956de510cbc9335565eca2fcf9559742c43c6457e024c473a1103eb82e9c7e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
