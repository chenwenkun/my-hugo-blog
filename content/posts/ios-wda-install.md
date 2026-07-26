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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663OPQYQNZ%2F20260726%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260726T014645Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGIaCXVzLXdlc3QtMiJHMEUCIQDoqVM26ir12kHVb0%2FmsU3gAcNHi3ACF1Ul%2BfVdhPbWeQIgOUnYytIaT1HhzBJZ9d3vpRrBmnIWQCCy3hfO9Za%2F6Lgq%2FwMIKxAAGgw2Mzc0MjMxODM4MDUiDBNUNwjD4OnB%2Bwd7UircA2olvrRrLnQ74E9zDlGsetKExB%2BYHIN%2B5cCG5e0LGtXanWw54xKK2KKLsxzRN%2BAUFs52plobW85banEYNoE41eSo8nKx3OHdB%2FbJR8prqr1IvqGFVgm0fkz%2BNTUEi0lWo7wn18Lww0fcc43di6TRDRV8IX9N9bVU3WXLrcNizeNzJH0f%2FECPeoLFMDdD%2Bwnq6%2FbdccrCxNeMyvwmCR%2BxJ9frF99FAlHjWFIR436%2BNq%2Fch2xDKS%2FOtVvRsMlFsUUeMP%2B%2BeWnWmAdseoSvMtxKrROb8ct8Pp18584ixt9i0zYH0FmwMn60R%2FUC29hCOhU2WzHO6uh86xQ42hLKWEPVjBmnqKUZ7Q39eIfny4aNYQvhA0hmcQdXVyZPgqMyLk0JW2wsxTb8cHVLBFEK1XnQkXLinvVOMbeEK4FjtZBgiqLjMNEtkbLt4JccuTFZxHpldzEfwuZceSiv1%2BGLErXNJDDFvuooUfKWzCYvmCwfHh5Uus28jbudCtgw%2Bv799eGDN5gVUCZS4Ek%2Fqiuf%2FAVxMCXLtWHnIzQHld8JnNm2CbDLfwy06tINnxxcTTDbob0owjS9zPHTR5dGoJbs8au8wvRWUSk5brALYmGHqCv938OMev%2Fth2vdUp6e00nMMKTLldMGOqUB9m4rsUmtCZTW%2Bt03ZCyVBn0smL5aNrIi9HZNgn8Y689lb7Mle2vN7VpdW6ucMrGhx8QKFgtyuFvRnD8D9Ihf4L71zF%2FRqwJHja9gqgPNBkMNsCFF%2BDHOwWQTkdkTXnS5mXTvRXr4%2BgcTyxJkOWmhrRHfSxBXCJkhzt4%2Br4mgg5esZN8fl3SDkcBlWvxb4IN%2FXH043n2fqIh0V75qwAOq9FzB0BYF&X-Amz-Signature=39068db25c78ab3654c27d4b640a28f296d39a7ea1465def00721a45e439e579&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663OPQYQNZ%2F20260726%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260726T014645Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGIaCXVzLXdlc3QtMiJHMEUCIQDoqVM26ir12kHVb0%2FmsU3gAcNHi3ACF1Ul%2BfVdhPbWeQIgOUnYytIaT1HhzBJZ9d3vpRrBmnIWQCCy3hfO9Za%2F6Lgq%2FwMIKxAAGgw2Mzc0MjMxODM4MDUiDBNUNwjD4OnB%2Bwd7UircA2olvrRrLnQ74E9zDlGsetKExB%2BYHIN%2B5cCG5e0LGtXanWw54xKK2KKLsxzRN%2BAUFs52plobW85banEYNoE41eSo8nKx3OHdB%2FbJR8prqr1IvqGFVgm0fkz%2BNTUEi0lWo7wn18Lww0fcc43di6TRDRV8IX9N9bVU3WXLrcNizeNzJH0f%2FECPeoLFMDdD%2Bwnq6%2FbdccrCxNeMyvwmCR%2BxJ9frF99FAlHjWFIR436%2BNq%2Fch2xDKS%2FOtVvRsMlFsUUeMP%2B%2BeWnWmAdseoSvMtxKrROb8ct8Pp18584ixt9i0zYH0FmwMn60R%2FUC29hCOhU2WzHO6uh86xQ42hLKWEPVjBmnqKUZ7Q39eIfny4aNYQvhA0hmcQdXVyZPgqMyLk0JW2wsxTb8cHVLBFEK1XnQkXLinvVOMbeEK4FjtZBgiqLjMNEtkbLt4JccuTFZxHpldzEfwuZceSiv1%2BGLErXNJDDFvuooUfKWzCYvmCwfHh5Uus28jbudCtgw%2Bv799eGDN5gVUCZS4Ek%2Fqiuf%2FAVxMCXLtWHnIzQHld8JnNm2CbDLfwy06tINnxxcTTDbob0owjS9zPHTR5dGoJbs8au8wvRWUSk5brALYmGHqCv938OMev%2Fth2vdUp6e00nMMKTLldMGOqUB9m4rsUmtCZTW%2Bt03ZCyVBn0smL5aNrIi9HZNgn8Y689lb7Mle2vN7VpdW6ucMrGhx8QKFgtyuFvRnD8D9Ihf4L71zF%2FRqwJHja9gqgPNBkMNsCFF%2BDHOwWQTkdkTXnS5mXTvRXr4%2BgcTyxJkOWmhrRHfSxBXCJkhzt4%2Br4mgg5esZN8fl3SDkcBlWvxb4IN%2FXH043n2fqIh0V75qwAOq9FzB0BYF&X-Amz-Signature=382c2727e556bc13eb97f3ed73d4b9a9a675ff13e49d10d9386d6c3ade8146cc&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
