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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664AL6NYYP%2F20251211%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251211T122443Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECQaCXVzLXdlc3QtMiJIMEYCIQD2YPD%2BfvvK1bgUImb%2BQdF%2B7lbERjuCwUIxbEH9yBcGXwIhAJaSO1vGsPmjtAJswuXCLO8SP3evwOz%2BamviGl%2FQwvbYKogECO3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgyYBtE1dW3yTRX0dJgq3AMiVNrIgHTPMq8tmCm6VcpzM6D7GAl7IFueEk82ILjpa5OIypU0bY8qAjwce3UgT2LysPa1iubi0cssil4wEMbyZ3y8vw6Hvb%2B%2BLxJrCan6pMVhmlxcG2MbG%2B8Ij2FF6sYP9ZlMrPzxFGzqXOf1imgto70yPqNudQ4so%2FTpVzhLnUq4ZJuh2TsYipSFp4yvI4%2BfuL6vaxHCYf6vunbHYQUsgXhLuxBmHM7ZNHFFCDU6KHj1b%2FcfjqazRjPY9XqzsPbNlFEDIbpaCTtmCxobbGUvbsUWkSbsWnkeoss%2BYeWfeMRG5rnwnEKFjTS1gGNsx5Op5f5c63nVP47fkF8QnVp3rMs1xqlMB9Q0MxVClqWEnrH6Ts2J%2FKsDApbmNJtsN7TsgJ1qofHatRYGt9erjiuO6l0CZUO7SgoAVZtAxLzwhQVACWjeml8jDhJJRN2AlwF6w12mh%2FIvr29PHxeyXbsACoTpxlaD5NWWstFvNMKomxRA6PyjVbnmREyMlTyVtbUyMPhzugA6%2FBOJ3FqCgxuuZ%2B50IBEnc0z%2FXJbT7anvtNkwbNMrJXedA6ZGq7lbPlKIqXk22UJn1R2vKpJ%2FYC%2BkYppdqXh3AxgtDNfRhSCPTsyrgJpLPA6LHeFY%2BzC43OrJBjqkAc3QSq25NqO5DfLHvuC8Bts%2FmyG7k%2F9qnd%2FC4mNSZl16IOtKzKWuyazlzhyYOZBm38NFLxFotQ3RmZBDqfnOT3FVaJSJaoQBtrLUyQcXLLd20QAy2xF7wOba6ytydpuWc6egn1XdCTxFwZ3zH0kY4IY9WK8SRJvq1WRc6SBx96vcqlt6wfqz7u%2B%2BD0cK6Qd%2FAfCcG6kgkBEotYX6YhTPW7A7vYt%2B&X-Amz-Signature=74695ac938afc260b3fda72489c5b7933b083172a38765de96376efa475a156a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664AL6NYYP%2F20251211%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251211T122443Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECQaCXVzLXdlc3QtMiJIMEYCIQD2YPD%2BfvvK1bgUImb%2BQdF%2B7lbERjuCwUIxbEH9yBcGXwIhAJaSO1vGsPmjtAJswuXCLO8SP3evwOz%2BamviGl%2FQwvbYKogECO3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgyYBtE1dW3yTRX0dJgq3AMiVNrIgHTPMq8tmCm6VcpzM6D7GAl7IFueEk82ILjpa5OIypU0bY8qAjwce3UgT2LysPa1iubi0cssil4wEMbyZ3y8vw6Hvb%2B%2BLxJrCan6pMVhmlxcG2MbG%2B8Ij2FF6sYP9ZlMrPzxFGzqXOf1imgto70yPqNudQ4so%2FTpVzhLnUq4ZJuh2TsYipSFp4yvI4%2BfuL6vaxHCYf6vunbHYQUsgXhLuxBmHM7ZNHFFCDU6KHj1b%2FcfjqazRjPY9XqzsPbNlFEDIbpaCTtmCxobbGUvbsUWkSbsWnkeoss%2BYeWfeMRG5rnwnEKFjTS1gGNsx5Op5f5c63nVP47fkF8QnVp3rMs1xqlMB9Q0MxVClqWEnrH6Ts2J%2FKsDApbmNJtsN7TsgJ1qofHatRYGt9erjiuO6l0CZUO7SgoAVZtAxLzwhQVACWjeml8jDhJJRN2AlwF6w12mh%2FIvr29PHxeyXbsACoTpxlaD5NWWstFvNMKomxRA6PyjVbnmREyMlTyVtbUyMPhzugA6%2FBOJ3FqCgxuuZ%2B50IBEnc0z%2FXJbT7anvtNkwbNMrJXedA6ZGq7lbPlKIqXk22UJn1R2vKpJ%2FYC%2BkYppdqXh3AxgtDNfRhSCPTsyrgJpLPA6LHeFY%2BzC43OrJBjqkAc3QSq25NqO5DfLHvuC8Bts%2FmyG7k%2F9qnd%2FC4mNSZl16IOtKzKWuyazlzhyYOZBm38NFLxFotQ3RmZBDqfnOT3FVaJSJaoQBtrLUyQcXLLd20QAy2xF7wOba6ytydpuWc6egn1XdCTxFwZ3zH0kY4IY9WK8SRJvq1WRc6SBx96vcqlt6wfqz7u%2B%2BD0cK6Qd%2FAfCcG6kgkBEotYX6YhTPW7A7vYt%2B&X-Amz-Signature=4586869d32e98a422805bb336ddca91e89b5a01200617882119711df56c8c952&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
