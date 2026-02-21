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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Z4TPDXEG%2F20260221%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260221T062943Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC8RiQNs%2B0Cc1F2yQGgKirvstHqd77BkhiqKya78mQ62QIgMd6U7F8d1ds1T%2FTe6RD53O0WA2iGzzbO1uo9qEOHxCYqiAQIpv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDCieO4wEzK%2Fh%2FY8CjCrcA7XPzjPYcxT8KTM35VVY8AGwqBnyoyDS4pWjZtBTiXNC2tneatjkydwrlA6O4GtB1LmevK591tSL%2F1m1PMzBqMH4BlRZz7i2iGIXuTg24wrdmV4aKl3N1ZYreGY4mQbfvGX1BCx4gpqyybej%2FRS%2FFhF8tt9b57L9KWWa%2FP0zjNZBolryiKOtWjM4IawYGNfU684YC1dnA1Pil%2B5CTzPFkRX49zmqGUwq9B6CUDegrSYAry%2BJYNPLQhAnPpaM8bB5%2BzsNkAo3ZlHm3u%2F4FVLAr5zTaJpTABUga0YbZ9HOlywYIIZvvN7jJhuKN1yFAZTBS0U64PBrMUDTVLV3UXsZwkf0ulsKFalB0ltCwg845b2jZ6Qk4vjw3sg7Rh%2FNEHZWeaeVuCLDlC2TGQvu569Ys8n8afBHLf6WmJ%2F%2BH20L5nLvPc7KalOy%2BXknH0MuVKTw6Yoh8LwBArPxhgwaKJrJaHLaSuEIBjQoAWbfhflunQcKAKaGXjGmSzb1N0AwEHxY09%2FRI4%2FWDL6niOPpNk8mA4Cp25uOeGuPJdkfCi2OZB5H5Hv21eQ83SFO26PfwyWheGkbWemBL3q2j9uOjVTB2EVClfN9olJJgk6wZ%2FOBYUEML6nwcWBs4A8QoIQTMOX85MwGOqUBqXOno5GI9%2BYUSheggGwEFLN05EJ6uFAKCtj815mj2rddjW0tGk3SPeW%2BrWe4zVSitcMDgRNE6jgs6fP56PNAr12P7%2BWtuzyUlk9qZFXiNQiII9PV8sp1vH8KmtALVHfYNOgcpcSaRGfrPdC3A6lE3uR5Ik2rR0o5fTqMcqnhWjXIb1nYSc%2BiWtmUHJVYexE7mHohXxFIXMTxoLMfzF3spwTSNQ1t&X-Amz-Signature=82a533145b510e7024af93b2041a6090f23af1ab9026c919fcf3e33fd6fcca37&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Z4TPDXEG%2F20260221%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260221T062943Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC8RiQNs%2B0Cc1F2yQGgKirvstHqd77BkhiqKya78mQ62QIgMd6U7F8d1ds1T%2FTe6RD53O0WA2iGzzbO1uo9qEOHxCYqiAQIpv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDCieO4wEzK%2Fh%2FY8CjCrcA7XPzjPYcxT8KTM35VVY8AGwqBnyoyDS4pWjZtBTiXNC2tneatjkydwrlA6O4GtB1LmevK591tSL%2F1m1PMzBqMH4BlRZz7i2iGIXuTg24wrdmV4aKl3N1ZYreGY4mQbfvGX1BCx4gpqyybej%2FRS%2FFhF8tt9b57L9KWWa%2FP0zjNZBolryiKOtWjM4IawYGNfU684YC1dnA1Pil%2B5CTzPFkRX49zmqGUwq9B6CUDegrSYAry%2BJYNPLQhAnPpaM8bB5%2BzsNkAo3ZlHm3u%2F4FVLAr5zTaJpTABUga0YbZ9HOlywYIIZvvN7jJhuKN1yFAZTBS0U64PBrMUDTVLV3UXsZwkf0ulsKFalB0ltCwg845b2jZ6Qk4vjw3sg7Rh%2FNEHZWeaeVuCLDlC2TGQvu569Ys8n8afBHLf6WmJ%2F%2BH20L5nLvPc7KalOy%2BXknH0MuVKTw6Yoh8LwBArPxhgwaKJrJaHLaSuEIBjQoAWbfhflunQcKAKaGXjGmSzb1N0AwEHxY09%2FRI4%2FWDL6niOPpNk8mA4Cp25uOeGuPJdkfCi2OZB5H5Hv21eQ83SFO26PfwyWheGkbWemBL3q2j9uOjVTB2EVClfN9olJJgk6wZ%2FOBYUEML6nwcWBs4A8QoIQTMOX85MwGOqUBqXOno5GI9%2BYUSheggGwEFLN05EJ6uFAKCtj815mj2rddjW0tGk3SPeW%2BrWe4zVSitcMDgRNE6jgs6fP56PNAr12P7%2BWtuzyUlk9qZFXiNQiII9PV8sp1vH8KmtALVHfYNOgcpcSaRGfrPdC3A6lE3uR5Ik2rR0o5fTqMcqnhWjXIb1nYSc%2BiWtmUHJVYexE7mHohXxFIXMTxoLMfzF3spwTSNQ1t&X-Amz-Signature=9dfa8b4fae89394deb8910a3d8a2ae4e2d3434305b22d2edde555f8393e6a745&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
