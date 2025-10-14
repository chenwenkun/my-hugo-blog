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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466W7DWKXA4%2F20251014%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251014T181620Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBZSRtrQJ34HwKewZIVLyIO8YoklJjqXC9shLArz5FRZAiEA%2B36pqleG%2FhIznNyi4IyBJIQZPlkyln3beeHMOr8qC3Mq%2FwMIYhAAGgw2Mzc0MjMxODM4MDUiDKW1BUS9ZUBAZLmyaircA2sHgjl7Kc6vgaY%2BglcT4fYdi95No1jjOsBmFLH45XLQ6bwod0iVB8ZxyD4JOos76sTbJCaTghWQTLsg5WzbuBgQBjFpWUOKwj%2BqXX1BL8gn0hj1wOXXQ8TeQvga6ufjDYiWeOA1gqoPhFel5K4bVwOh5UE7yMJ6ubiT%2BaehmdBxgkt4qk%2F40U7AReMd9MU%2FRQkY4ep%2FInghiyGHjWeAmld8HuKIbwDwml6DNlwUl2PIdni1ldhAWwbeNkaDmSk90d65M9WuAyAeUfVIXC%2BrAHFGNx2KCQAWiRq3aiBwbWj%2BzHOkADhEXglKheXwBQV2VBbaF%2BqmVTfvNEZAsYamh1CkXJs6ZHsnUTTFEZiNpMLhb68h2yYZrr82Okegyum5ISM01J3b5yKOYqeJPhYnF8Mk131FZIQ9gYnThwey44NEY3NG2WkDCMj3MaWy%2BuIp7g0SLCWM6Sg6uS6ekxYGK5KiLSvJ9UBhSPktzGm4GOHZCmaEzyZS%2FiBESxqyVZ6%2F3fQVpV73fiFa8yaRxgwO3LB4EKrfFuEmXN2NOPMdY0Mw7EbXkrpr3o4wTzWP90cd8kQxg2S1UQx7Kk9vmwBV63L%2Fixu1OnyL2B%2BBWOlEF61hEGvQ10J6Bduyv0O%2FMIqMuscGOqUBi%2BXYz6xIr64XqJSMCniy2HdQWPkYoLHK9oSsB3AHN8pCDfz7FcOvQA3jrHosUX%2B6QTI1tgmkshD86Dh5FTZPtRk4YCYJO2FaRU1XYO5XTewlHwGgCTb9rb0jCHh34W0GhqzAhEcNGqKrgNiJHFK6ZSJAn487ey%2F3mlQCK4BWrMKBx1DFbuVeUwnYXX0TA4k8MT6FoFOZsmBhZ1Hnh2KW9N3fGvy5&X-Amz-Signature=64d051970f70e41ba4112e61f474e7b216ed51e3f8e6cdfe4b48de447580bff7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466W7DWKXA4%2F20251014%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251014T181620Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBZSRtrQJ34HwKewZIVLyIO8YoklJjqXC9shLArz5FRZAiEA%2B36pqleG%2FhIznNyi4IyBJIQZPlkyln3beeHMOr8qC3Mq%2FwMIYhAAGgw2Mzc0MjMxODM4MDUiDKW1BUS9ZUBAZLmyaircA2sHgjl7Kc6vgaY%2BglcT4fYdi95No1jjOsBmFLH45XLQ6bwod0iVB8ZxyD4JOos76sTbJCaTghWQTLsg5WzbuBgQBjFpWUOKwj%2BqXX1BL8gn0hj1wOXXQ8TeQvga6ufjDYiWeOA1gqoPhFel5K4bVwOh5UE7yMJ6ubiT%2BaehmdBxgkt4qk%2F40U7AReMd9MU%2FRQkY4ep%2FInghiyGHjWeAmld8HuKIbwDwml6DNlwUl2PIdni1ldhAWwbeNkaDmSk90d65M9WuAyAeUfVIXC%2BrAHFGNx2KCQAWiRq3aiBwbWj%2BzHOkADhEXglKheXwBQV2VBbaF%2BqmVTfvNEZAsYamh1CkXJs6ZHsnUTTFEZiNpMLhb68h2yYZrr82Okegyum5ISM01J3b5yKOYqeJPhYnF8Mk131FZIQ9gYnThwey44NEY3NG2WkDCMj3MaWy%2BuIp7g0SLCWM6Sg6uS6ekxYGK5KiLSvJ9UBhSPktzGm4GOHZCmaEzyZS%2FiBESxqyVZ6%2F3fQVpV73fiFa8yaRxgwO3LB4EKrfFuEmXN2NOPMdY0Mw7EbXkrpr3o4wTzWP90cd8kQxg2S1UQx7Kk9vmwBV63L%2Fixu1OnyL2B%2BBWOlEF61hEGvQ10J6Bduyv0O%2FMIqMuscGOqUBi%2BXYz6xIr64XqJSMCniy2HdQWPkYoLHK9oSsB3AHN8pCDfz7FcOvQA3jrHosUX%2B6QTI1tgmkshD86Dh5FTZPtRk4YCYJO2FaRU1XYO5XTewlHwGgCTb9rb0jCHh34W0GhqzAhEcNGqKrgNiJHFK6ZSJAn487ey%2F3mlQCK4BWrMKBx1DFbuVeUwnYXX0TA4k8MT6FoFOZsmBhZ1Hnh2KW9N3fGvy5&X-Amz-Signature=a7051efbc2998411f6dfea53f497bcbe6f1310603bd03bf5017e2284018ee29d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
