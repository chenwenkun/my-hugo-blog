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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666XR6AIAC%2F20260620%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260620T083906Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAgaCXVzLXdlc3QtMiJHMEUCICjqLE0G%2BRKWQCNxjqTZuajh4rOiNYP2UueW2bhWrg%2BtAiEAwj2BuDKIYCS3sSOMLMCCSzOCk4rWoHorbZ2Vt30bzd0qiAQI0f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDMi3YJhf0U5b0reDpSrcA%2BGICGWX8mG2IQSyx%2F12hf67GYO45Pa7%2BDGNwIBKUUOCeOA5T8LhSyk7ONpthLNlyoNX6XhjpHONEIuETuh6rzSj1EjxP77R5lkGKwZqIEaVhiwM5y5rH7ROOa06f6u5KcbKY4jzVmrO%2BOKJJTnODm8TPetaXZfNH4t2RdQPbRY4WKpTl3uBq%2F%2FZwrUlGpYMcsTenen0hCmC056RACY%2B1O4yH29deddeuOEFQ52Le5UyDziF%2FUjWg6t3oo7Cr6aKBBd4HMOpjjAR3FJg1SyNGT1qGDw%2FM8%2BjAFKC3m%2FLJGSwK0P3N7S%2F6CQS3FWBzFLGIg7PQIUAjHmO%2BVG6WcIj28dK%2FCYhClHqFFaYa1W6iYXhJtRwLtvb8%2Bdr71EVHYgPAjBkDoT0UJTZp3M2B%2BYn7COBAweO9eboVkrDW4fLgUncoT0kYjIA2Gisv7nWirGO2Wlg825BOemPsgirvkmZbkN7lmt2vSX5YefjojzWwHpWjsoVocH4yOPLWH1QxO0aVUrJ6DMV63K4pSbgSAbj9rzx6E1cntKNIaz0W6X5f3nSjXeZTCo3UsefwOmKZw6obbqV695DaqII%2BJqCrg%2BD5A%2FEf29tppgg%2By%2BP6Zsg09g8enrdlNBsBcDW1YKXML6R2dEGOqUBzEsl2qePPHXVG3xU89eLNKP2V5DQ5BPLR2%2FQc3JanoMeybIyRsfG1qE5dIBdHJkaGFkRiqC8z1deU1cAbTkf4fTs4NwcWAQoKSvVkQTccRrInzSToe%2F3mFtv499qhxIbhXaiS8N6FUO3ebfbx5ZGxy9%2BuLFcE8pbLjjvTVaajHxi4EhyOq6U97UhU%2F92eYjNjsGT3f4c13UzwJVLpZfiHbMpDpVC&X-Amz-Signature=6e662e6a141972c1697ef0b5fd61342a01af5e5b9a67af97b4fb7482873b98b5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666XR6AIAC%2F20260620%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260620T083906Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAgaCXVzLXdlc3QtMiJHMEUCICjqLE0G%2BRKWQCNxjqTZuajh4rOiNYP2UueW2bhWrg%2BtAiEAwj2BuDKIYCS3sSOMLMCCSzOCk4rWoHorbZ2Vt30bzd0qiAQI0f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDMi3YJhf0U5b0reDpSrcA%2BGICGWX8mG2IQSyx%2F12hf67GYO45Pa7%2BDGNwIBKUUOCeOA5T8LhSyk7ONpthLNlyoNX6XhjpHONEIuETuh6rzSj1EjxP77R5lkGKwZqIEaVhiwM5y5rH7ROOa06f6u5KcbKY4jzVmrO%2BOKJJTnODm8TPetaXZfNH4t2RdQPbRY4WKpTl3uBq%2F%2FZwrUlGpYMcsTenen0hCmC056RACY%2B1O4yH29deddeuOEFQ52Le5UyDziF%2FUjWg6t3oo7Cr6aKBBd4HMOpjjAR3FJg1SyNGT1qGDw%2FM8%2BjAFKC3m%2FLJGSwK0P3N7S%2F6CQS3FWBzFLGIg7PQIUAjHmO%2BVG6WcIj28dK%2FCYhClHqFFaYa1W6iYXhJtRwLtvb8%2Bdr71EVHYgPAjBkDoT0UJTZp3M2B%2BYn7COBAweO9eboVkrDW4fLgUncoT0kYjIA2Gisv7nWirGO2Wlg825BOemPsgirvkmZbkN7lmt2vSX5YefjojzWwHpWjsoVocH4yOPLWH1QxO0aVUrJ6DMV63K4pSbgSAbj9rzx6E1cntKNIaz0W6X5f3nSjXeZTCo3UsefwOmKZw6obbqV695DaqII%2BJqCrg%2BD5A%2FEf29tppgg%2By%2BP6Zsg09g8enrdlNBsBcDW1YKXML6R2dEGOqUBzEsl2qePPHXVG3xU89eLNKP2V5DQ5BPLR2%2FQc3JanoMeybIyRsfG1qE5dIBdHJkaGFkRiqC8z1deU1cAbTkf4fTs4NwcWAQoKSvVkQTccRrInzSToe%2F3mFtv499qhxIbhXaiS8N6FUO3ebfbx5ZGxy9%2BuLFcE8pbLjjvTVaajHxi4EhyOq6U97UhU%2F92eYjNjsGT3f4c13UzwJVLpZfiHbMpDpVC&X-Amz-Signature=0b47ac13c6e919101442b3d2991208e9beff4b087cd5d5b0f129775c1574a499&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
