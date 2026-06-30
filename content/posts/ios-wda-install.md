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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664UYUFPMQ%2F20260630%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260630T021329Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIF7%2B7MbpOh07CzKhj7IASRwRMxBHaU0j9GwmobrXSVmoAiEA3KWs%2B1GBGJAj0CACNKuDOdws2%2F0Obq85stS3fqMCXTcqiAQIu%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDIum8PhPDZtzQuVnDircAx22%2F2lLL76De%2FnCaRLVOXhkU4Fzu2zI9Echtozd%2FKtUlgR0Jv%2FAIcpbLkio8l7Dxnlcq0%2FNM1%2BTEuFGX9PmtrjD%2BYtZLsxCjgsvJu7DFWfw3q0e7O4agjdZ8n5VcAOEmxvPbqky8d4UwoZgVetgJ1QMjbzLcgRgWZvlKAAtW2VmIc%2B4wj6Cz1KIj9uitkS5dkTRZcFXyW%2F%2F77%2FvdjuQyo%2B2jf1qYA9q9qbs1%2FSst7oUwt7YFl87x4Bd9bm7RcePgGlkne%2FrzIu%2FREZ5LJji7iLo3zlNvVPpMS4Pt4eHZvHhwYwqeyKM%2F98EdNPckXDo3eGgxXNjRh7%2F4TYJ9Ibmqg3yrx5e3QOiOeb%2Ba0hk%2BXL7uSTctAIFh30D7%2BhE64ds9x0lRHmsqRwir6d4Dr%2F4svG39j63pJypS7BVW9xi4uWO82VBOcgiWvsfx06WUQFPYNHu19uaQLLWduvzyPJYHKMLbOn%2BPIo1L03TWQW19%2FldQ1HTSAoVVa%2FAsQsNL0FUM2%2F6AexV4ZKm03YuUHwnP5OJTiJyZ4pUXPUhka7ElP6PG5Sd5gpuk74I%2Fn5I%2Boro%2F%2FAvHloFT%2Bq%2BueKGXYL60gf2JmxoshiugOzWBkE9P42A2ZQsFBXO80MfVEj7MMm2jNIGOqUBcjRYRq6ed0IdXPhv94VmiLi1M%2BQlRR6nR34mX8eCDPmhcB6scoIXZ1B9mnoLjYe9LMVC50L%2B3Ejt93%2B62pGozCzomay2QFWYUSraUB7bh8b90fcscENYj1jf0R62Ax32IaWLaUAR%2BH2FohsmU5jQg0otvYsUxd8wqhCJpCUIbmPNEQG618ESBYa2nmn35YBE2IYjSdWh%2BscxqhktSkdWSEeD1qY9&X-Amz-Signature=907cc596febe0a4cc6cd3d641d56d2bc88e0093c23de2a1b642b6380e86c5142&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664UYUFPMQ%2F20260630%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260630T021329Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIF7%2B7MbpOh07CzKhj7IASRwRMxBHaU0j9GwmobrXSVmoAiEA3KWs%2B1GBGJAj0CACNKuDOdws2%2F0Obq85stS3fqMCXTcqiAQIu%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDIum8PhPDZtzQuVnDircAx22%2F2lLL76De%2FnCaRLVOXhkU4Fzu2zI9Echtozd%2FKtUlgR0Jv%2FAIcpbLkio8l7Dxnlcq0%2FNM1%2BTEuFGX9PmtrjD%2BYtZLsxCjgsvJu7DFWfw3q0e7O4agjdZ8n5VcAOEmxvPbqky8d4UwoZgVetgJ1QMjbzLcgRgWZvlKAAtW2VmIc%2B4wj6Cz1KIj9uitkS5dkTRZcFXyW%2F%2F77%2FvdjuQyo%2B2jf1qYA9q9qbs1%2FSst7oUwt7YFl87x4Bd9bm7RcePgGlkne%2FrzIu%2FREZ5LJji7iLo3zlNvVPpMS4Pt4eHZvHhwYwqeyKM%2F98EdNPckXDo3eGgxXNjRh7%2F4TYJ9Ibmqg3yrx5e3QOiOeb%2Ba0hk%2BXL7uSTctAIFh30D7%2BhE64ds9x0lRHmsqRwir6d4Dr%2F4svG39j63pJypS7BVW9xi4uWO82VBOcgiWvsfx06WUQFPYNHu19uaQLLWduvzyPJYHKMLbOn%2BPIo1L03TWQW19%2FldQ1HTSAoVVa%2FAsQsNL0FUM2%2F6AexV4ZKm03YuUHwnP5OJTiJyZ4pUXPUhka7ElP6PG5Sd5gpuk74I%2Fn5I%2Boro%2F%2FAvHloFT%2Bq%2BueKGXYL60gf2JmxoshiugOzWBkE9P42A2ZQsFBXO80MfVEj7MMm2jNIGOqUBcjRYRq6ed0IdXPhv94VmiLi1M%2BQlRR6nR34mX8eCDPmhcB6scoIXZ1B9mnoLjYe9LMVC50L%2B3Ejt93%2B62pGozCzomay2QFWYUSraUB7bh8b90fcscENYj1jf0R62Ax32IaWLaUAR%2BH2FohsmU5jQg0otvYsUxd8wqhCJpCUIbmPNEQG618ESBYa2nmn35YBE2IYjSdWh%2BscxqhktSkdWSEeD1qY9&X-Amz-Signature=bb14d48239a35e472f5ce58083d76074486967d4cef8fd3472d48aadf599d221&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
