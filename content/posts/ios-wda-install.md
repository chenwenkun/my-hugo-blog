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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664NRHQT6Y%2F20260126%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260126T122648Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHQaCXVzLXdlc3QtMiJHMEUCID3tdMVS38LEm97IOZcezm1xQCJi6yXSKGX6hQ3MBz%2FFAiEAt291Qf6N0wC5901CV%2BF8oqzL%2BVLEeNoqIWRFOCb6yUsq%2FwMIPRAAGgw2Mzc0MjMxODM4MDUiDHt%2Br5f%2Br%2B%2FpH6EKoCrcAyYpP34jJQCWImB8EQLyjGFwSygFXqPZC1WyuRAOg7jEPXw5%2BsJrRRcMypgbEfZGpPEM7OEOD41h%2BIF%2BbXx5VlrsmxMkWdU5ydGYCSH7vgwAeqAgs5aDMAWp%2B9qS0QjvMkRU0sDVa5SiKyQAsb24JOl9b2llmqx0dqVX%2FkJ2EzwCM0kQ6nXu3eDnUgMHaStN9QEUyekWu4%2Fmau%2FfL4fO0SaamheAlrXkMNTtmvv7BCMPxOloZpNgzIXC%2BdE%2FHzemRiAVX%2BgxXqq3T96umk22rw31Scl9m742CSr3Aw9jq9TrO1WesdmPCghNlLxAcmVa6qJxU9JV1%2B1R3fYQM8XR5LoTMd9%2FDh1QhtVMwdNTvIAybKRZDXImGyq5SOqQ%2BZ9hWTRWr1WMG3WVDJHcDy0bSOSt9s7%2FC2cgU4yE%2F1QDy2Du15TNNgUXSK5lCnzFg2gxfd%2Bc7PsNKDuTrUncfHUJPNXp%2BOUsTKt%2Bpg%2FNUruzyZtDqG%2BRYc6CAtYh1EYrtGo5HaFhv%2Bqc0V6JWO0tTk1NEzzmkUcVOnaYRdQQ5EF5jJJznZ6p%2B%2BNy0Khf2MMcpJZ4SLw259auq0fhMWsyykJTPiFTpoH460k0Z0tvQzglh7iCoTi6q5i%2FeW4Zg9gcMOy03csGOqUBAtyqgtD2xD1XKxehlDBDRbqpRqiwacJE3AY1PiSi1ICxBBOJy5Mh1arS3GgEL0nTKn7qBqbnQn6TUhu6j4diZg6j9jGH9xxS9kHNguEE42FI6075a3FRw0nRB8F%2BPaJTh9IhfcUlF2JhT7BGhJQTUybDGOjIAJBUN8HKVsrqTGMI9llyVUKZb7Do8zXgOQga0suvID3IiJTfDATdZRXiTGZ6Gdg0&X-Amz-Signature=6114a592da067b8ce5f2eb4ef949eebeb29603e9b1335b30755d7eb585655f80&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664NRHQT6Y%2F20260126%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260126T122648Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHQaCXVzLXdlc3QtMiJHMEUCID3tdMVS38LEm97IOZcezm1xQCJi6yXSKGX6hQ3MBz%2FFAiEAt291Qf6N0wC5901CV%2BF8oqzL%2BVLEeNoqIWRFOCb6yUsq%2FwMIPRAAGgw2Mzc0MjMxODM4MDUiDHt%2Br5f%2Br%2B%2FpH6EKoCrcAyYpP34jJQCWImB8EQLyjGFwSygFXqPZC1WyuRAOg7jEPXw5%2BsJrRRcMypgbEfZGpPEM7OEOD41h%2BIF%2BbXx5VlrsmxMkWdU5ydGYCSH7vgwAeqAgs5aDMAWp%2B9qS0QjvMkRU0sDVa5SiKyQAsb24JOl9b2llmqx0dqVX%2FkJ2EzwCM0kQ6nXu3eDnUgMHaStN9QEUyekWu4%2Fmau%2FfL4fO0SaamheAlrXkMNTtmvv7BCMPxOloZpNgzIXC%2BdE%2FHzemRiAVX%2BgxXqq3T96umk22rw31Scl9m742CSr3Aw9jq9TrO1WesdmPCghNlLxAcmVa6qJxU9JV1%2B1R3fYQM8XR5LoTMd9%2FDh1QhtVMwdNTvIAybKRZDXImGyq5SOqQ%2BZ9hWTRWr1WMG3WVDJHcDy0bSOSt9s7%2FC2cgU4yE%2F1QDy2Du15TNNgUXSK5lCnzFg2gxfd%2Bc7PsNKDuTrUncfHUJPNXp%2BOUsTKt%2Bpg%2FNUruzyZtDqG%2BRYc6CAtYh1EYrtGo5HaFhv%2Bqc0V6JWO0tTk1NEzzmkUcVOnaYRdQQ5EF5jJJznZ6p%2B%2BNy0Khf2MMcpJZ4SLw259auq0fhMWsyykJTPiFTpoH460k0Z0tvQzglh7iCoTi6q5i%2FeW4Zg9gcMOy03csGOqUBAtyqgtD2xD1XKxehlDBDRbqpRqiwacJE3AY1PiSi1ICxBBOJy5Mh1arS3GgEL0nTKn7qBqbnQn6TUhu6j4diZg6j9jGH9xxS9kHNguEE42FI6075a3FRw0nRB8F%2BPaJTh9IhfcUlF2JhT7BGhJQTUybDGOjIAJBUN8HKVsrqTGMI9llyVUKZb7Do8zXgOQga0suvID3IiJTfDATdZRXiTGZ6Gdg0&X-Amz-Signature=60ee9796b5a735290b0f29b87b5d29600a7fa2275496f7b403799ab56bb65a0a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
