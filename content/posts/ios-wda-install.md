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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RXN2SPAH%2F20260304%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260304T123256Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC8jAV4IqCIbSa2ww2HZZ4ZY4JEDLo502vUl8h8ifKERgIgPfqUgzendbzXpb%2Fokr8hnXhqhPJngho1FXa8na2827sqiAQItv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDA2kIN6%2FLbkOz2nA2SrcA29g08OVdb4YP6YZ7vXfKMQ9YOzUynjxFwEH6YUn7h0CAN5S2ixE6k5ycFRM%2BH0q2tHJsg46jMIIhZ3p4r96DpjKHiLmxaj9XTihU9oEb1RpXVj%2B8KMZvZ%2BMiRR5Soc%2F6P1gosQNhol8Wme130Hh%2FkGBpqaZgG4YYdiDO85QZ5OalYVCnc0P1C07%2BeyGFUB7dzEl1Nuc%2FtxNhZsGppeBETAwfXo%2B%2BhnReiki%2BXWrMWiCY85F8t5PQEm2gpB%2FuRwqtsuUFEYshrhPtHWgpv%2FalPss7eVSsd7kDwApIUKcuXpRGzjGOJBk22zo2hNDv6QvLsFYDq0Izs0AjvapX3s6Ee05KTN%2BTtVNa%2BDDYDQaOYtkBt3oVozzUFQG2FtAW%2Bq%2BmCj8u7zaO3yaw6p1SAAaAcszR2Qny0%2BATmS6YnpumspHZiHfSwBbV8DY1zzkwwTNqFL2h5fn6ybdPmD%2FW2RUp33u4KxxiTvgHdyLPXh1RYzAzj%2BCCAqDj1NK54PI%2BX3lMgWq5pFOym2s6%2BJ8%2BxJLEf4m%2BzlPIS5a1iU1kHxxOOOGo392NaiRGw5FUS8cnwTqjAQCVK5lo%2F7A6VRGnHaRLaPSUy7tMd6NcOmqK7d31IDSUeM%2B5KBbp1ssFbxHMKnLoM0GOqUBH8Swyenx60U2pw9WYud36kbTAv7nhoNAIPlzYC2YKR7%2B1ygNvBJwCd68oY45b%2BbHHdB%2FHC3YHDQ8fOD0Ms2vrHNhEoOs5WnsFbyDVdC%2F0KKipYEbL%2FHzxRGoRWsjcQNKB5xc3hksnnJd%2BeTywbQHbHS7AIKmFqCz%2BEpyCTHpPAp075H0TXRMCx79JRn8DIqvh1%2Fu%2Fi4QyhCsox%2BsjNgdJyt56RGm&X-Amz-Signature=0ee1ec3ac96d7f837b946399246e2ae3aecf1eaa550d3e205f56decbe1b93daf&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RXN2SPAH%2F20260304%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260304T123256Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC8jAV4IqCIbSa2ww2HZZ4ZY4JEDLo502vUl8h8ifKERgIgPfqUgzendbzXpb%2Fokr8hnXhqhPJngho1FXa8na2827sqiAQItv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDA2kIN6%2FLbkOz2nA2SrcA29g08OVdb4YP6YZ7vXfKMQ9YOzUynjxFwEH6YUn7h0CAN5S2ixE6k5ycFRM%2BH0q2tHJsg46jMIIhZ3p4r96DpjKHiLmxaj9XTihU9oEb1RpXVj%2B8KMZvZ%2BMiRR5Soc%2F6P1gosQNhol8Wme130Hh%2FkGBpqaZgG4YYdiDO85QZ5OalYVCnc0P1C07%2BeyGFUB7dzEl1Nuc%2FtxNhZsGppeBETAwfXo%2B%2BhnReiki%2BXWrMWiCY85F8t5PQEm2gpB%2FuRwqtsuUFEYshrhPtHWgpv%2FalPss7eVSsd7kDwApIUKcuXpRGzjGOJBk22zo2hNDv6QvLsFYDq0Izs0AjvapX3s6Ee05KTN%2BTtVNa%2BDDYDQaOYtkBt3oVozzUFQG2FtAW%2Bq%2BmCj8u7zaO3yaw6p1SAAaAcszR2Qny0%2BATmS6YnpumspHZiHfSwBbV8DY1zzkwwTNqFL2h5fn6ybdPmD%2FW2RUp33u4KxxiTvgHdyLPXh1RYzAzj%2BCCAqDj1NK54PI%2BX3lMgWq5pFOym2s6%2BJ8%2BxJLEf4m%2BzlPIS5a1iU1kHxxOOOGo392NaiRGw5FUS8cnwTqjAQCVK5lo%2F7A6VRGnHaRLaPSUy7tMd6NcOmqK7d31IDSUeM%2B5KBbp1ssFbxHMKnLoM0GOqUBH8Swyenx60U2pw9WYud36kbTAv7nhoNAIPlzYC2YKR7%2B1ygNvBJwCd68oY45b%2BbHHdB%2FHC3YHDQ8fOD0Ms2vrHNhEoOs5WnsFbyDVdC%2F0KKipYEbL%2FHzxRGoRWsjcQNKB5xc3hksnnJd%2BeTywbQHbHS7AIKmFqCz%2BEpyCTHpPAp075H0TXRMCx79JRn8DIqvh1%2Fu%2Fi4QyhCsox%2BsjNgdJyt56RGm&X-Amz-Signature=375c2a76c95fbf090b6a671f1556132012dc65c956cc298346b548ecd7134b5a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
