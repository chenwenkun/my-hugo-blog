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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XJXESINN%2F20260616%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260616T024424Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFownitSA0ahRwJ4TB21jfoYRO7H2hmvaKm6NwqFoFFpAiAC89fONVbc72NAVEzNikOAUughGTTe40mGd8EgUif9NCr%2FAwhrEAAaDDYzNzQyMzE4MzgwNSIM6%2BNRu08NinZExmEEKtwDcnpy513E3PmLaNufpqlpUlftgRf0rAL1CS%2FsYfYWJgW7PW%2BomqZkOvuYhHhW4cNvC4jFzkrKjDoVcforVY%2BNu8DoimeC2ds%2BR2Bs%2Bwv2O5O8aGBXerw1I%2BsYHdQHiCfI5LSe9%2F%2FIV0QpHSkgPo4y1JvKfr8CyiCPxUFjELJkNxUwzwBXX1bt66nkZy98VcRlfifj3zwRo%2F2kAqZ6iLrhbD%2BwDqnmvy9N9dCRPQi4EOWzCzlXWk7p9mX7TEXXOmiHu4SFJZqchmOsOUDR8uWt2gVmdWM13iGO51MTAGRPlWz5f3fxK2sefB4FJQCtM9TkOgZe1FBx%2B0ps0758u6wvBG6mK2t%2BmO0R%2B6uWCnOWVkAVjIlXAjI%2FLg8NY7tEGcjMXZEC7v7XoSjf3LEcC6iX3p7cuFlEnJwkyrMDHQsEfzk8hzPVc6Eo45jLCehaM%2B8Y08oq%2BE%2FEBu8OZmz0R%2BSS%2FnSA3tdVPxxlKD2PRCy%2BgYdZFAJFGYLwBptznmo8wUr8Ek%2FZ2KW4DQIp9TQt4TkAHLhIjck93k%2FSyYsXTk2EPTGvlp6BnhxYHvz1jcpGl4HCOLBwwe6Qj%2BSyhUdd3XcHoNjfgCN1u5rWpNyrjPPjmtNRrhOlKgWzWPL3GVgw9t7C0QY6pgFpfn1WutlD6jWq%2BwAJnrxpaOBxYN%2Bca8siJJZLlg2uJ6qKVvvRoWU2I42GzbaAkovx%2Fc4WVdST7yoAnnpzGNdeCgO7hmswolQYklfK7jW82LkKc%2F%2Bc%2F5PTh9Z%2BEcyG44jgIYURhh%2BqtLpz5XdmNnKhXBpGoWY7QfzXlR8SQS1Tppk22%2FCtyOD3wtJn6iKocwIMIG2k%2F56QKToSZnUPsP%2FsHoBF%2BIiL&X-Amz-Signature=2dfe718afc663684c44fbd388839139fdee83593264a9a9553fe627666af1236&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XJXESINN%2F20260616%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260616T024424Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFownitSA0ahRwJ4TB21jfoYRO7H2hmvaKm6NwqFoFFpAiAC89fONVbc72NAVEzNikOAUughGTTe40mGd8EgUif9NCr%2FAwhrEAAaDDYzNzQyMzE4MzgwNSIM6%2BNRu08NinZExmEEKtwDcnpy513E3PmLaNufpqlpUlftgRf0rAL1CS%2FsYfYWJgW7PW%2BomqZkOvuYhHhW4cNvC4jFzkrKjDoVcforVY%2BNu8DoimeC2ds%2BR2Bs%2Bwv2O5O8aGBXerw1I%2BsYHdQHiCfI5LSe9%2F%2FIV0QpHSkgPo4y1JvKfr8CyiCPxUFjELJkNxUwzwBXX1bt66nkZy98VcRlfifj3zwRo%2F2kAqZ6iLrhbD%2BwDqnmvy9N9dCRPQi4EOWzCzlXWk7p9mX7TEXXOmiHu4SFJZqchmOsOUDR8uWt2gVmdWM13iGO51MTAGRPlWz5f3fxK2sefB4FJQCtM9TkOgZe1FBx%2B0ps0758u6wvBG6mK2t%2BmO0R%2B6uWCnOWVkAVjIlXAjI%2FLg8NY7tEGcjMXZEC7v7XoSjf3LEcC6iX3p7cuFlEnJwkyrMDHQsEfzk8hzPVc6Eo45jLCehaM%2B8Y08oq%2BE%2FEBu8OZmz0R%2BSS%2FnSA3tdVPxxlKD2PRCy%2BgYdZFAJFGYLwBptznmo8wUr8Ek%2FZ2KW4DQIp9TQt4TkAHLhIjck93k%2FSyYsXTk2EPTGvlp6BnhxYHvz1jcpGl4HCOLBwwe6Qj%2BSyhUdd3XcHoNjfgCN1u5rWpNyrjPPjmtNRrhOlKgWzWPL3GVgw9t7C0QY6pgFpfn1WutlD6jWq%2BwAJnrxpaOBxYN%2Bca8siJJZLlg2uJ6qKVvvRoWU2I42GzbaAkovx%2Fc4WVdST7yoAnnpzGNdeCgO7hmswolQYklfK7jW82LkKc%2F%2Bc%2F5PTh9Z%2BEcyG44jgIYURhh%2BqtLpz5XdmNnKhXBpGoWY7QfzXlR8SQS1Tppk22%2FCtyOD3wtJn6iKocwIMIG2k%2F56QKToSZnUPsP%2FsHoBF%2BIiL&X-Amz-Signature=3256c17d6247afd8405135fe50eddae7c88e46407d811f47d77e79eaa6fc6c6a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
