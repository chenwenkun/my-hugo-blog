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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VGINIDBI%2F20260512%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260512T020015Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFgaCXVzLXdlc3QtMiJHMEUCIQC3VE%2BMDM0guVFUj0t1b%2B2VKLjhnqADp8XISn9Y5lEkLgIgB1Hj7F%2FCsGyJswjXWcyrSWDh3e4mtipTASjlydAwguYq%2FwMIIRAAGgw2Mzc0MjMxODM4MDUiDEUcRHnhr5u%2FYtRUbyrcA3Sia9dRsS5ZIPD80f2I6gbhGjnc9SZobmq%2FkEI0P56QHHSj1VMaQfJaJ%2F5RtKGGwKjx8s1FqGDevvzZI4BOzXy%2BZyK49rCfYoW6E6gLHExug4MhWEv95qVJxUuYS4hn3rH97KY1IQB%2F9rqORjX5t7ZJRvaRgP9zrm%2FxNPyd0Y8%2FmlDaW6PIQon9lZ9y7HsErgmSKV2V3oMaUgUQ19RjF5wFMuWeVwbMbFltkdHBD0SzmKMgdvsMt2KP8g4ueBGu9oSF0LjwkO088sc4fKDTT5XznVp2cNDgCA2K6dr4%2BAGznBXWCtPROULJ0UKenLU8pXkbQaD8SAG%2FjoicXtY568%2BAxaQ9iXpaSUHSJ%2BOrg4JcwKX3PR7dyLdLmm%2FhHCONCb4Vh0e%2BQDA8tJW%2FOqge8Om%2BNVLEtdlzHSZJGUwvqwhsJ%2F7u6N6iOxcG9dZ6ka%2FN7u3Fc8hPfXB757j4rvGk0td2tNUV0V9BravGg3I%2BF4XvheXCudNESHaiGOwGTKCks8GDXyWFL7uNGneY1BgtpbRyD8Rr%2FZ35SVytTS0YBKVTtHRplHKm4d%2FOBemiDmvH1vKhO9Fd7ZDW0VV7F5tbJHFvRI4dwt%2B8sikJMVz4gakJe0XBLcPL68QLck5wMObNidAGOqUBGQOJUBztWv%2F1XvdWnHNOmZ6vhkAsPYfEsRfHhmEqc2PxE4iors4UN%2BG38uqJwIeU%2FoWOO%2B6haxLE4wSsfAZGkOMexOXI3aYfHzLaeTHIsy4W38n%2FBNF4H7XbuZOAEJA1PCaE7%2B5Z9WyowFZ3G7J6yWBpM85cx4Ocd%2BfeEgc1FDYPIdzDxXGbekmUKlZNuLB7nRJ4RCtM1fMxKI5lyCDKVlNgSC5u&X-Amz-Signature=a2cd513ca75620349e656694d6e7b679374b51dffbadaf07e2e9788c15dc72a3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VGINIDBI%2F20260512%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260512T020015Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFgaCXVzLXdlc3QtMiJHMEUCIQC3VE%2BMDM0guVFUj0t1b%2B2VKLjhnqADp8XISn9Y5lEkLgIgB1Hj7F%2FCsGyJswjXWcyrSWDh3e4mtipTASjlydAwguYq%2FwMIIRAAGgw2Mzc0MjMxODM4MDUiDEUcRHnhr5u%2FYtRUbyrcA3Sia9dRsS5ZIPD80f2I6gbhGjnc9SZobmq%2FkEI0P56QHHSj1VMaQfJaJ%2F5RtKGGwKjx8s1FqGDevvzZI4BOzXy%2BZyK49rCfYoW6E6gLHExug4MhWEv95qVJxUuYS4hn3rH97KY1IQB%2F9rqORjX5t7ZJRvaRgP9zrm%2FxNPyd0Y8%2FmlDaW6PIQon9lZ9y7HsErgmSKV2V3oMaUgUQ19RjF5wFMuWeVwbMbFltkdHBD0SzmKMgdvsMt2KP8g4ueBGu9oSF0LjwkO088sc4fKDTT5XznVp2cNDgCA2K6dr4%2BAGznBXWCtPROULJ0UKenLU8pXkbQaD8SAG%2FjoicXtY568%2BAxaQ9iXpaSUHSJ%2BOrg4JcwKX3PR7dyLdLmm%2FhHCONCb4Vh0e%2BQDA8tJW%2FOqge8Om%2BNVLEtdlzHSZJGUwvqwhsJ%2F7u6N6iOxcG9dZ6ka%2FN7u3Fc8hPfXB757j4rvGk0td2tNUV0V9BravGg3I%2BF4XvheXCudNESHaiGOwGTKCks8GDXyWFL7uNGneY1BgtpbRyD8Rr%2FZ35SVytTS0YBKVTtHRplHKm4d%2FOBemiDmvH1vKhO9Fd7ZDW0VV7F5tbJHFvRI4dwt%2B8sikJMVz4gakJe0XBLcPL68QLck5wMObNidAGOqUBGQOJUBztWv%2F1XvdWnHNOmZ6vhkAsPYfEsRfHhmEqc2PxE4iors4UN%2BG38uqJwIeU%2FoWOO%2B6haxLE4wSsfAZGkOMexOXI3aYfHzLaeTHIsy4W38n%2FBNF4H7XbuZOAEJA1PCaE7%2B5Z9WyowFZ3G7J6yWBpM85cx4Ocd%2BfeEgc1FDYPIdzDxXGbekmUKlZNuLB7nRJ4RCtM1fMxKI5lyCDKVlNgSC5u&X-Amz-Signature=744a555f4d12efe52560c69d2f817985d035fa89bb10898e56e44cada4077d5a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
