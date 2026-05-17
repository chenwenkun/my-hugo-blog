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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664ADTRIIH%2F20260517%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260517T020006Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIHF39EWBosjb6b9dohooB2Pa7zODTovzePXbjs%2FBZ83IAiEAyxaXA4XJ4FN7b7F7667kqcrNYSZHy7nVapI7FsJ8EoYqiAQIlv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDPMHnMiWhO%2FCja%2BMmCrcA3j6GHFd%2BTINvlXEHB1WdeytjdypgYiAw2L5Eys4FZ8kSceV86SqznjDSGkkhtd21zZxEmVIsG9Ut0cOXAr7UKyJzR20D%2FS%2FDSHOAm1mhBKNaUbxPFROzja8yAlsXDOjwn4qyzEpNBYQVYt91A1lHH80Ibsl72rm7V7xpa0tzfU5bJmdt%2F8npWZL1r9jZtYwchOeVKbQ4%2FZcX80plGsiry6h8apMAB8sf5ZwBVSW7W9ajv3R%2FnGBDSxCvjys2XmV%2BsVLgcs930rZc9yHrjhyvSubt7qDItqpJA2NosIAfDjICi1dzYjyi5NreAcZ0nUtbsHAebSJlhp1kOLUkVrCINlxfgCtQEuAPNy8Hy0qSUjxmNw6FBSLGpCgr9eaELIxeM%2FkLrMot4Lrzttg5QMWWjPXzAPIK11FuZS37xdyTBEEmjc1l%2Bg5bZoUTvgNg8vPYA2kLg4f6rMbM1LLmi3FDILAHmVeOpIdicqfi5lUOyEx%2FXpuA6%2BemhKKdtIbRUC8h08%2Btum6p2%2BBXiC2R9t%2F0Z8ikpJGCsmO3FAJgiDz1baNit7LRTyLYE2kNaxgmWLLjzTOwtMvLZmPJNfDkY0dl6m2%2BxqFfXhMbhkGx89V%2Fsbda7X8YhCACIF7jnryMOy%2Bo9AGOqUBW%2BxiZCFWl1Y49AS4LPWX55LNGiUBcIP4YCUkeRF6OYDHvUAzeL2H%2FU3BAo3awLi9O5p%2Bo4DdtU41ERgmxLzTaeMRQdurJicl18r%2F4ZzOb5QLjLG1Hrm7XyEQk%2B0%2BrnCm8A2mWfPwpkDSA9RWo%2Bk6l5lePQXNTxepF9SLOxYtcbFWdx9JAZJscmO%2F%2FmxwpB40dadYnAcLJGzANk6OFqF4rTjiVyI1&X-Amz-Signature=876653151bd1ff784e5d2ea6ddafb7c278d235e140da6c259b0c71fa436a0e2b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664ADTRIIH%2F20260517%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260517T020006Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIHF39EWBosjb6b9dohooB2Pa7zODTovzePXbjs%2FBZ83IAiEAyxaXA4XJ4FN7b7F7667kqcrNYSZHy7nVapI7FsJ8EoYqiAQIlv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDPMHnMiWhO%2FCja%2BMmCrcA3j6GHFd%2BTINvlXEHB1WdeytjdypgYiAw2L5Eys4FZ8kSceV86SqznjDSGkkhtd21zZxEmVIsG9Ut0cOXAr7UKyJzR20D%2FS%2FDSHOAm1mhBKNaUbxPFROzja8yAlsXDOjwn4qyzEpNBYQVYt91A1lHH80Ibsl72rm7V7xpa0tzfU5bJmdt%2F8npWZL1r9jZtYwchOeVKbQ4%2FZcX80plGsiry6h8apMAB8sf5ZwBVSW7W9ajv3R%2FnGBDSxCvjys2XmV%2BsVLgcs930rZc9yHrjhyvSubt7qDItqpJA2NosIAfDjICi1dzYjyi5NreAcZ0nUtbsHAebSJlhp1kOLUkVrCINlxfgCtQEuAPNy8Hy0qSUjxmNw6FBSLGpCgr9eaELIxeM%2FkLrMot4Lrzttg5QMWWjPXzAPIK11FuZS37xdyTBEEmjc1l%2Bg5bZoUTvgNg8vPYA2kLg4f6rMbM1LLmi3FDILAHmVeOpIdicqfi5lUOyEx%2FXpuA6%2BemhKKdtIbRUC8h08%2Btum6p2%2BBXiC2R9t%2F0Z8ikpJGCsmO3FAJgiDz1baNit7LRTyLYE2kNaxgmWLLjzTOwtMvLZmPJNfDkY0dl6m2%2BxqFfXhMbhkGx89V%2Fsbda7X8YhCACIF7jnryMOy%2Bo9AGOqUBW%2BxiZCFWl1Y49AS4LPWX55LNGiUBcIP4YCUkeRF6OYDHvUAzeL2H%2FU3BAo3awLi9O5p%2Bo4DdtU41ERgmxLzTaeMRQdurJicl18r%2F4ZzOb5QLjLG1Hrm7XyEQk%2B0%2BrnCm8A2mWfPwpkDSA9RWo%2Bk6l5lePQXNTxepF9SLOxYtcbFWdx9JAZJscmO%2F%2FmxwpB40dadYnAcLJGzANk6OFqF4rTjiVyI1&X-Amz-Signature=c9e9ff8220b4cb8a448db70e2c04768d5f0bad2b20cbffd5411375f00a4a5b5e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
