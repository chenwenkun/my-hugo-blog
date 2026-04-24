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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662OYG272N%2F20260424%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260424T074830Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDyz7Xxs6tKfQl8TEjBmInwZb0G1NwAYcyEyUUq6ZZpCgIgGsrDGQD2lkOEVAvplXWepq8m80Cmv7p9YE1J4ZXbuEYq%2FwMIdBAAGgw2Mzc0MjMxODM4MDUiDG5ExdrZ4YzRMOefLyrcA3j%2ForezmiUauhDrWrduOvNbnWYCEgIyCWZ4GnjgsGWeSYydF2pgMD2pg5HYVRKh83EnWmFvmv%2BtBfhn%2B8Q2atnGCKJj2rw28PuWNay%2BR%2FnMOxAt4WZyfaCXwc9cnqB0uTHEb29%2FjC%2FSUmhLuCBVDY8mwcSWnKqgOK3J4n%2Bu%2BSZBw%2FqJ3uqVAmce5L8K5PjhWgQ%2Bq2pG7w1631c0cDmN6oKfA2HoCEiV5RF9Se8%2BIWqrlmv7jBX8wLYO%2BpCe9j1yJHudI%2FHSSHpMxUD1nc1IG7Zxa7fE0j8EvoGn9xwBcgpGmoVoDRHW3iE9DtYES93kRG7s2X6qK1W6MuI67rW2obORLvnyrhYDTooX0sByrTmVvn80syfwM8stljOm4JThikJ0Cvs050KvI1QFUrlBtWgo%2BLjvOdec28A4P6p4mWHuOh2kpMyjJY%2Bgav%2Fmdg2dko7e0U4R7HziPrlzU2Izk1SCDWl4k7vVljRW06FO3%2Bk%2FN3MXzli%2F5fIHFKXYr%2ByvinFQ9K%2Br0xblrYc6jU1WsO8JvFWXIOQaGJjAnlkt%2F%2BwjahZvI5kHgLkYBicJleE2YeI57gMSzp1zyjpVAnkHUCXB1SbkXOStQnw7keqmPxxJqzVlR2yIz4NBZpS9MNaxq88GOqUBC9IHDKRtrKWQ6MSW7i4lF0J1v00zK%2Bqs7UOqPURvJkrgvROag2vwc7KU89H4cbvaimbJOnlXI284Zu%2FAFXA2ie9u6wKfT6BtpVWEVJD45vaoIm7Ke28s0d%2FFey98%2BQXeFSWxHWWnbsBaDpfVCoY2DjiQVxzeCG44dc7Pcv%2BYeT4kmDtwvY38OKVJ24Vox0k6h9J7yXOgLwhDHWp4Fw1olYNIwHcr&X-Amz-Signature=dfff319068f1e627a20d0454379d6778903cc67596184fc0dc918dccc63911a6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662OYG272N%2F20260424%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260424T074830Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDyz7Xxs6tKfQl8TEjBmInwZb0G1NwAYcyEyUUq6ZZpCgIgGsrDGQD2lkOEVAvplXWepq8m80Cmv7p9YE1J4ZXbuEYq%2FwMIdBAAGgw2Mzc0MjMxODM4MDUiDG5ExdrZ4YzRMOefLyrcA3j%2ForezmiUauhDrWrduOvNbnWYCEgIyCWZ4GnjgsGWeSYydF2pgMD2pg5HYVRKh83EnWmFvmv%2BtBfhn%2B8Q2atnGCKJj2rw28PuWNay%2BR%2FnMOxAt4WZyfaCXwc9cnqB0uTHEb29%2FjC%2FSUmhLuCBVDY8mwcSWnKqgOK3J4n%2Bu%2BSZBw%2FqJ3uqVAmce5L8K5PjhWgQ%2Bq2pG7w1631c0cDmN6oKfA2HoCEiV5RF9Se8%2BIWqrlmv7jBX8wLYO%2BpCe9j1yJHudI%2FHSSHpMxUD1nc1IG7Zxa7fE0j8EvoGn9xwBcgpGmoVoDRHW3iE9DtYES93kRG7s2X6qK1W6MuI67rW2obORLvnyrhYDTooX0sByrTmVvn80syfwM8stljOm4JThikJ0Cvs050KvI1QFUrlBtWgo%2BLjvOdec28A4P6p4mWHuOh2kpMyjJY%2Bgav%2Fmdg2dko7e0U4R7HziPrlzU2Izk1SCDWl4k7vVljRW06FO3%2Bk%2FN3MXzli%2F5fIHFKXYr%2ByvinFQ9K%2Br0xblrYc6jU1WsO8JvFWXIOQaGJjAnlkt%2F%2BwjahZvI5kHgLkYBicJleE2YeI57gMSzp1zyjpVAnkHUCXB1SbkXOStQnw7keqmPxxJqzVlR2yIz4NBZpS9MNaxq88GOqUBC9IHDKRtrKWQ6MSW7i4lF0J1v00zK%2Bqs7UOqPURvJkrgvROag2vwc7KU89H4cbvaimbJOnlXI284Zu%2FAFXA2ie9u6wKfT6BtpVWEVJD45vaoIm7Ke28s0d%2FFey98%2BQXeFSWxHWWnbsBaDpfVCoY2DjiQVxzeCG44dc7Pcv%2BYeT4kmDtwvY38OKVJ24Vox0k6h9J7yXOgLwhDHWp4Fw1olYNIwHcr&X-Amz-Signature=481b16138dce4b38140b2a5b62b536da1142f5dd312f419a2e3f309f18b60780&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
