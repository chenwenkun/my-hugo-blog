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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664LSLTHZA%2F20260611%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260611T023654Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECoaCXVzLXdlc3QtMiJIMEYCIQDbV92yiQb8IjWZM9xyWY1%2BLzzIMGbpEv14msq5DH9jHgIhAJFczYmddoPK5bgYCsbXO9FyHeQL52lxidXnCpTyN4iJKogECPP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgysrdTe1J0zjtIhek0q3AMWfyq6%2BuohjBRbGkO%2BTIQyoL10KdfV9F7YdHCX48fvWbOb%2B97UT283IaXqSHDQKcKtZUlc56js7nDYqYXwlRAOTWe%2FJIWLuIjaMQ6ppaO9GD8L%2BRYryxQxB21fbiQukFX59Ubr1XIE5eK7ilqY%2BE8xYQw9q5bwYyRoZNYmhkFQnTqF6vrHmy9T%2BiIsGBfg9F%2F7%2BurbCyaxxYyNZ2q3Wksnv13Uv2HSpw9%2ByXu%2BsgKYehp09SQDaYN9il1qScNkP0eo9tvaxHdKavEnP4CySarZ6FfSTRZID5cAfb26L5X1bHpfUsiNzbWBwai6NIpZEsWBZspDQLXgbtRcydDqZkivyamF5ltjwEaLckEG7Ex%2FKsIC6JS2C3utK9VrDmxO8FBd%2BFm7or1AZn%2FVXnOu4KOtab%2F65PgHXM2B%2BG%2FjrraMOvbXEsv6AJd3o3RFo%2Bxpp1M4ITM8GdUBi5VvuoFbiZH6FI0iOplZWgzL5uLVQ3nMh1dKXXqBV1Zl7h%2BPANWp2Eex6EmSyryqzhLzVcf8XAT2qI%2F2J7FqeMPRCrHBhLSq2%2BNgkEDG4XLupjyBgRqqcNyiskGVTE9YlxOL0uCaJqbRQCz8VyDGqRdWIMutz3C%2F69vsG9Lly4O39ZlCFTDSp6jRBjqkAaRbA7Dz4mIHq9D8dcJzjUAiX%2ByLjS1LHnK%2Bt2OWZHGh%2FSr8o9OIOgS9jlp87szo1QFzOvNZ%2F%2Fc2Y%2BgEK4MugAmx0tPRWC3nBmOTH9dbTPgzcRlNqDTDfK7LiviCgPrMrn6eB06CDiQIAe2kziza3P92zDRlgdADz0Vco36mcbWFwxQdOhHcgSaog0a%2FdCQSRIVSP%2FVVG9217okyAt5qTlON7z5h&X-Amz-Signature=99fb46c80e546c50fa9d7868c052eb89a8b3aa9e5d801d719361cf009fa37917&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664LSLTHZA%2F20260611%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260611T023654Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECoaCXVzLXdlc3QtMiJIMEYCIQDbV92yiQb8IjWZM9xyWY1%2BLzzIMGbpEv14msq5DH9jHgIhAJFczYmddoPK5bgYCsbXO9FyHeQL52lxidXnCpTyN4iJKogECPP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgysrdTe1J0zjtIhek0q3AMWfyq6%2BuohjBRbGkO%2BTIQyoL10KdfV9F7YdHCX48fvWbOb%2B97UT283IaXqSHDQKcKtZUlc56js7nDYqYXwlRAOTWe%2FJIWLuIjaMQ6ppaO9GD8L%2BRYryxQxB21fbiQukFX59Ubr1XIE5eK7ilqY%2BE8xYQw9q5bwYyRoZNYmhkFQnTqF6vrHmy9T%2BiIsGBfg9F%2F7%2BurbCyaxxYyNZ2q3Wksnv13Uv2HSpw9%2ByXu%2BsgKYehp09SQDaYN9il1qScNkP0eo9tvaxHdKavEnP4CySarZ6FfSTRZID5cAfb26L5X1bHpfUsiNzbWBwai6NIpZEsWBZspDQLXgbtRcydDqZkivyamF5ltjwEaLckEG7Ex%2FKsIC6JS2C3utK9VrDmxO8FBd%2BFm7or1AZn%2FVXnOu4KOtab%2F65PgHXM2B%2BG%2FjrraMOvbXEsv6AJd3o3RFo%2Bxpp1M4ITM8GdUBi5VvuoFbiZH6FI0iOplZWgzL5uLVQ3nMh1dKXXqBV1Zl7h%2BPANWp2Eex6EmSyryqzhLzVcf8XAT2qI%2F2J7FqeMPRCrHBhLSq2%2BNgkEDG4XLupjyBgRqqcNyiskGVTE9YlxOL0uCaJqbRQCz8VyDGqRdWIMutz3C%2F69vsG9Lly4O39ZlCFTDSp6jRBjqkAaRbA7Dz4mIHq9D8dcJzjUAiX%2ByLjS1LHnK%2Bt2OWZHGh%2FSr8o9OIOgS9jlp87szo1QFzOvNZ%2F%2Fc2Y%2BgEK4MugAmx0tPRWC3nBmOTH9dbTPgzcRlNqDTDfK7LiviCgPrMrn6eB06CDiQIAe2kziza3P92zDRlgdADz0Vco36mcbWFwxQdOhHcgSaog0a%2FdCQSRIVSP%2FVVG9217okyAt5qTlON7z5h&X-Amz-Signature=2072b81e6fde1b95f2498f9dfe459c3701061de6acfd0f2020d335066cc5783d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
