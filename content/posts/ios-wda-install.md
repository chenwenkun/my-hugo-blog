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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666CQL5WSW%2F20251119%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251119T181646Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBoaCXVzLXdlc3QtMiJHMEUCIEvefaWAwLMr6cKcUlAMsgymPT2yDgPOVHlaVikTj5L1AiEArW%2FIb%2FWzAwPO5Cpy%2BsEptzU%2FaEXLUIP%2Fyk1I227lfFEqiAQI4v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDKhGFDn%2BPso7Pdu9fyrcA%2F6w78hcL76qSvgJVcULnvdExYb5dBcqBTzCKgzzfl2PG0RGBgI2QBa1yW3prurH61IFoDzGRdkmxZkadHDhUHvSs2lvAtkRqyLKHJCwMlMcaG9RGUbl3kGgDyFNuWxHelRxNoaPL4VnMzw6ugp8Nentj69oEZKGbPt0JljYd2LKpVPHeuSUUGcUlgVyjq0pLWlagk3WB2euvC01LuZd5zmyk1EJ3urYknvEAAam7Syq%2F88lYXOCfCYkp4uPlk8Yex%2FL%2BWvtokYR%2FiMzc7fUqs8haQCJm8I6DiyAnFYTSW80KscwZf8svTclZ6PauPY%2FJ%2Bn1zDbzlU8cBeUnYSbgFrBgB1kZ1vnQXf22mJkNXbZtUGHgN1t9JsdNgMg%2BZ9IAZmLGpmClSnJR8JuwR6cmC7%2F2EpIBbVYAjPgy86rORKwLm4YiNNpPtjzBbfatySkzLtkJPmTlS8zGTT8jTZ%2BFjsf9k6lP0J0jjpT3Xt%2BhOB7TlzwzIceS8lMQZ9RnT2O0CNepZB3WpdHtmrK7wZ4poJ3ykl%2BX%2FsKsJ1oZvgniikTSVdSS%2FfY6aWMWqCQYxM19v04Pur2laYY%2BU4HDfw6h6pa2947k%2BRk4GSwlmdJU3lo4mu%2BVRSlpzKEZ7xZOMPf398gGOqUBoPVBNTne08fmvYAnr%2BeQt55H5LirB45YlOX%2BS0%2B7tkiWgZNUe5DeTwxZs23U%2BJpl1kkE%2BxBJCPTF3bTYpeoc02dgafIXhKCaKjXGC1%2FWyFXt1pNPdbFEZOUMec%2F3EW4tKUVw3CefiDsIzOnUATtKNoafwrpNg7yC%2FbiZPPP3y1v%2BvsbZwmcR%2BlyEOGxcIM8PGYd8smllxS%2FIXwLQ0engL%2BInD5%2FT&X-Amz-Signature=ef2f099488f27e96994cdc44e73daa370d923a48fcf26014a33a80d0efea062a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666CQL5WSW%2F20251119%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251119T181646Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBoaCXVzLXdlc3QtMiJHMEUCIEvefaWAwLMr6cKcUlAMsgymPT2yDgPOVHlaVikTj5L1AiEArW%2FIb%2FWzAwPO5Cpy%2BsEptzU%2FaEXLUIP%2Fyk1I227lfFEqiAQI4v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDKhGFDn%2BPso7Pdu9fyrcA%2F6w78hcL76qSvgJVcULnvdExYb5dBcqBTzCKgzzfl2PG0RGBgI2QBa1yW3prurH61IFoDzGRdkmxZkadHDhUHvSs2lvAtkRqyLKHJCwMlMcaG9RGUbl3kGgDyFNuWxHelRxNoaPL4VnMzw6ugp8Nentj69oEZKGbPt0JljYd2LKpVPHeuSUUGcUlgVyjq0pLWlagk3WB2euvC01LuZd5zmyk1EJ3urYknvEAAam7Syq%2F88lYXOCfCYkp4uPlk8Yex%2FL%2BWvtokYR%2FiMzc7fUqs8haQCJm8I6DiyAnFYTSW80KscwZf8svTclZ6PauPY%2FJ%2Bn1zDbzlU8cBeUnYSbgFrBgB1kZ1vnQXf22mJkNXbZtUGHgN1t9JsdNgMg%2BZ9IAZmLGpmClSnJR8JuwR6cmC7%2F2EpIBbVYAjPgy86rORKwLm4YiNNpPtjzBbfatySkzLtkJPmTlS8zGTT8jTZ%2BFjsf9k6lP0J0jjpT3Xt%2BhOB7TlzwzIceS8lMQZ9RnT2O0CNepZB3WpdHtmrK7wZ4poJ3ykl%2BX%2FsKsJ1oZvgniikTSVdSS%2FfY6aWMWqCQYxM19v04Pur2laYY%2BU4HDfw6h6pa2947k%2BRk4GSwlmdJU3lo4mu%2BVRSlpzKEZ7xZOMPf398gGOqUBoPVBNTne08fmvYAnr%2BeQt55H5LirB45YlOX%2BS0%2B7tkiWgZNUe5DeTwxZs23U%2BJpl1kkE%2BxBJCPTF3bTYpeoc02dgafIXhKCaKjXGC1%2FWyFXt1pNPdbFEZOUMec%2F3EW4tKUVw3CefiDsIzOnUATtKNoafwrpNg7yC%2FbiZPPP3y1v%2BvsbZwmcR%2BlyEOGxcIM8PGYd8smllxS%2FIXwLQ0engL%2BInD5%2FT&X-Amz-Signature=9be348e5834fd25758162fef93fa71b59bcc7dc43750047ea06e24d728cc598d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
