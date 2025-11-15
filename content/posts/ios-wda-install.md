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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663QC2KXP7%2F20251115%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251115T061540Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEK3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFSynTQGFc9a%2BCEe0nKPzTGpqRpV6bjIjvAx0UuSHJifAiEA%2BIbtQLyMQxnvEfMJlW5RwnZLc1V1%2FNvCU%2FRLyY%2F4uloq%2FwMIdhAAGgw2Mzc0MjMxODM4MDUiDDclPdwfqecsdrX0zSrcA0yOasvL%2FKX9wV1wBl%2Bex%2FRfBFbeyLA9ng8uSjlW2MrPjc7EhppT0hiL1XZx%2B%2FwkOX4G0XM6n%2FZm8SQ5%2BCWZlSTuYAagwNHFLsTfVgCDcRQiF26WNHzpEU%2BMC8Y9MN5hEklZfM8F7A6gkELVBygokcdLy62O1uY8Bw40Re3ZL28xD456T89%2B5WHcdHVm7Fsfn0vBSrvY0Ro6XpAwAix%2FW2KM20fGsURpAQxj%2FvkLgGTm2b2N5fW291bKi3DvI%2FVxYaO2tOGGxaP%2Fgn%2FJxiXYxDpJ%2FKVBih6J3URoInR6nDHn8FZIdpTOQQcxCqwlKWDhL2lOmeog5YQw%2FX3Pl8NVHnaAJaqyXglh5QqkWwzeSwEU5zB51F0iXK1ZIpyY9sZZi4AFKN%2FWcK4SdwboZHcR1A4KVBFJTaUlDSoqlGAS9qgMyDO6lOkAAbfMXfrWZKRXzuKbEKGnuX1NZb2%2B4RhtDjd4EpKVbmuJHNiypfMPZhq5vwhIbpqRAsyHi0iVnggBsu3x92%2FzZelTzYiypN6o2358HnSNCyyaIg8haEEyTPllSv83x5a5XR%2B1acgJNFHL0s%2B3%2BCG3aQZ82Sv%2BgKy7kh0wrh6sJQb6JmWySPWgemtGqU0UU5FntWnD4DNPMNaX4MgGOqUBZXvXAfiFQ4lKf%2BskPWbUo34xUz53EjgUfnu25itWqbHMbeEIYllsMu7uIjG34iz5G1vTO7ttwLmgfjEUh5b7jWHLDsK0TXYn8%2B5beH53tW2XR%2FEvLylkVOzW57KuTvtmrEnDHdi%2BrSL%2F9iKEUUUQxB9kP8NkkQj%2BtUJaMvgiUntuXD8SdJt0UE17MjEMf6XMBh2p1kcIpR4sGEdj5vVEvEWPv34b&X-Amz-Signature=7b0b46fabadd0d344e5fbed0d586cd8f3d6b8bc626af046b8a83d51f2385254a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663QC2KXP7%2F20251115%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251115T061540Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEK3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFSynTQGFc9a%2BCEe0nKPzTGpqRpV6bjIjvAx0UuSHJifAiEA%2BIbtQLyMQxnvEfMJlW5RwnZLc1V1%2FNvCU%2FRLyY%2F4uloq%2FwMIdhAAGgw2Mzc0MjMxODM4MDUiDDclPdwfqecsdrX0zSrcA0yOasvL%2FKX9wV1wBl%2Bex%2FRfBFbeyLA9ng8uSjlW2MrPjc7EhppT0hiL1XZx%2B%2FwkOX4G0XM6n%2FZm8SQ5%2BCWZlSTuYAagwNHFLsTfVgCDcRQiF26WNHzpEU%2BMC8Y9MN5hEklZfM8F7A6gkELVBygokcdLy62O1uY8Bw40Re3ZL28xD456T89%2B5WHcdHVm7Fsfn0vBSrvY0Ro6XpAwAix%2FW2KM20fGsURpAQxj%2FvkLgGTm2b2N5fW291bKi3DvI%2FVxYaO2tOGGxaP%2Fgn%2FJxiXYxDpJ%2FKVBih6J3URoInR6nDHn8FZIdpTOQQcxCqwlKWDhL2lOmeog5YQw%2FX3Pl8NVHnaAJaqyXglh5QqkWwzeSwEU5zB51F0iXK1ZIpyY9sZZi4AFKN%2FWcK4SdwboZHcR1A4KVBFJTaUlDSoqlGAS9qgMyDO6lOkAAbfMXfrWZKRXzuKbEKGnuX1NZb2%2B4RhtDjd4EpKVbmuJHNiypfMPZhq5vwhIbpqRAsyHi0iVnggBsu3x92%2FzZelTzYiypN6o2358HnSNCyyaIg8haEEyTPllSv83x5a5XR%2B1acgJNFHL0s%2B3%2BCG3aQZ82Sv%2BgKy7kh0wrh6sJQb6JmWySPWgemtGqU0UU5FntWnD4DNPMNaX4MgGOqUBZXvXAfiFQ4lKf%2BskPWbUo34xUz53EjgUfnu25itWqbHMbeEIYllsMu7uIjG34iz5G1vTO7ttwLmgfjEUh5b7jWHLDsK0TXYn8%2B5beH53tW2XR%2FEvLylkVOzW57KuTvtmrEnDHdi%2BrSL%2F9iKEUUUQxB9kP8NkkQj%2BtUJaMvgiUntuXD8SdJt0UE17MjEMf6XMBh2p1kcIpR4sGEdj5vVEvEWPv34b&X-Amz-Signature=2964b915b8a7a261935f8a21382f4c1b1411c2f386b2d6e07bc385758cf821f4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
