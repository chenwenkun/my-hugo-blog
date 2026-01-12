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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TLV67BAG%2F20260112%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260112T181904Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECoaCXVzLXdlc3QtMiJIMEYCIQDLkI5Y7rgybGSj5Zm4wJqef3TFGWcOnurFPGaIiebBYAIhAJ%2FfpBBWFIZwQBs577yNy8Jt%2Bo%2BYFo9kLn7IZ8bwdA5VKogECPL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxyG1blAlKFMAD1m4sq3AM0o%2BO4yUgRoq32KSn7TJgA2I%2B1Mkm6t4Bd4128lv5tz263MjkosuvauRoR72e2bCG%2B7NHCmcodNzfE1tucFjv6uojn%2FlW5EQleZLfMmLoKw4D2bs7keVz4UtF%2FzSSZ5TQLlLeflTyna7LrTyx%2F2INPh0qzHeg8tTGbtQdHfw1R7YTzG%2FNNZmWuORZRhcp80Kk%2BWi%2BBa8meZxYXqgKzdqVEw6KR%2F2b6RcIRIXB%2BJ9dw%2Fga%2FYpQQOSfZ0zF6CYPGAubOvfQjOt94brSIcpzm%2BwGnK1elIv0VMvFx%2FGRci4QW5VT1uMGQrjLVbuiUTNTCMbYuIQi%2FihdZq95s7IOz2AbF0Gr5S1UjL%2B5wc0SpLQR0o5LehvRueEm6lxxu91EDeCDf6dY5cyBTU9lC4b%2BjLvj99e4UGCGUz0Q3W2TRNKZ2tHsTWn9sKNa2n9RyvR8M6%2BBNgd%2FSXnYM8sIb6lm82ClrwEof8749uTm6vznK45x8yN2%2Fd4KU0vz0Szjc9kaC3VDp9JAQFloOGnZtKPM%2BZzIaEYYeEy3XfMQxiArnKxWEjR%2BWVBazvin71S%2FVGEoE3%2FzVz9R607ojTRhk0HIGdfW0JbiyJepdYH8EGqTZSgfIxwszTkCzixn6fkqmSDDF3JTLBjqkAahOkyh0cA%2FRX2sirzK9dPD4FdXa6zKyG1EdII1alTP%2BSxUdhzB9zvjxpE8%2FvAkhA3%2B2ogePSAY4hZ718q7XAYFdqpaRRJw1qfyG8V%2BPpXb%2BBeB5yjkiN456H8FewZ0affDTEXE62%2FNjpir77vkjQgjf2jSYxhnK%2BB1eSdCwH8FLpSuL35l43iLCld5KqY9zzzWgPkHTGbp1zJvGmk6bFu2eYgkA&X-Amz-Signature=7f1de903375794ca39531c73c43329221af178d00253319e4521e2ede8ad5bfd&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TLV67BAG%2F20260112%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260112T181904Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECoaCXVzLXdlc3QtMiJIMEYCIQDLkI5Y7rgybGSj5Zm4wJqef3TFGWcOnurFPGaIiebBYAIhAJ%2FfpBBWFIZwQBs577yNy8Jt%2Bo%2BYFo9kLn7IZ8bwdA5VKogECPL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxyG1blAlKFMAD1m4sq3AM0o%2BO4yUgRoq32KSn7TJgA2I%2B1Mkm6t4Bd4128lv5tz263MjkosuvauRoR72e2bCG%2B7NHCmcodNzfE1tucFjv6uojn%2FlW5EQleZLfMmLoKw4D2bs7keVz4UtF%2FzSSZ5TQLlLeflTyna7LrTyx%2F2INPh0qzHeg8tTGbtQdHfw1R7YTzG%2FNNZmWuORZRhcp80Kk%2BWi%2BBa8meZxYXqgKzdqVEw6KR%2F2b6RcIRIXB%2BJ9dw%2Fga%2FYpQQOSfZ0zF6CYPGAubOvfQjOt94brSIcpzm%2BwGnK1elIv0VMvFx%2FGRci4QW5VT1uMGQrjLVbuiUTNTCMbYuIQi%2FihdZq95s7IOz2AbF0Gr5S1UjL%2B5wc0SpLQR0o5LehvRueEm6lxxu91EDeCDf6dY5cyBTU9lC4b%2BjLvj99e4UGCGUz0Q3W2TRNKZ2tHsTWn9sKNa2n9RyvR8M6%2BBNgd%2FSXnYM8sIb6lm82ClrwEof8749uTm6vznK45x8yN2%2Fd4KU0vz0Szjc9kaC3VDp9JAQFloOGnZtKPM%2BZzIaEYYeEy3XfMQxiArnKxWEjR%2BWVBazvin71S%2FVGEoE3%2FzVz9R607ojTRhk0HIGdfW0JbiyJepdYH8EGqTZSgfIxwszTkCzixn6fkqmSDDF3JTLBjqkAahOkyh0cA%2FRX2sirzK9dPD4FdXa6zKyG1EdII1alTP%2BSxUdhzB9zvjxpE8%2FvAkhA3%2B2ogePSAY4hZ718q7XAYFdqpaRRJw1qfyG8V%2BPpXb%2BBeB5yjkiN456H8FewZ0affDTEXE62%2FNjpir77vkjQgjf2jSYxhnK%2BB1eSdCwH8FLpSuL35l43iLCld5KqY9zzzWgPkHTGbp1zJvGmk6bFu2eYgkA&X-Amz-Signature=99d3059c7bbc5701b2905f7f77f8fa0e24567dc3ee5c8ebdbf75f81f38de14ad&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
