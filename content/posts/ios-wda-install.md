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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466S7GHTI6F%2F20260802%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260802T125623Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBAaCXVzLXdlc3QtMiJHMEUCIAw7oXYidV%2Fmf03Q3jdBVi71zpmnB%2BhgLVPoxinsGC33AiEAoYsU52P6U95Gybxwu1FMw%2Bbccvz368fAlsX%2Fy1AaNkYqiAQI2f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJMDqIJWkhUhhnggJircA4mSL1M6GJANB8acPfWDvoJz%2FnyyCaD34egyjZEZxebx%2BT1j18a8k921JgWSdoFUJN0QBaTPolCihIWP1Ody%2BRkWX3O2cmZZr%2BCZJajHkGBmqNjGmIvmsvFnBpOdOSRO7bSjvODg30Afwol8dA8uBkrep3b%2FyHbPd%2BPMfAYLE95nkDjJm9fGBIhExePAA4o6cqBoHj69jckF5akaLw0%2BLyuHFmjO97mDWeQaMBxUYiQLUJTI0c7aR90hAlmGJZXsR8M0u%2F09mMLwTGMjDMjIS1OLz6sosRRnXCJ%2Fj69kLj80hPePqDUg0yNhvfGefg32hEv1iFUZ1p7auDPXDDckzyiBCDx79upJTxzrpE%2B7PvCcgxrmr%2B6ib6aYslUoDk42pPfhKhfB%2F9u%2FadWoJ9SEbAnSWjWAaNnpOJSXSqGBEdnyFIk0kOOHPYhnTcExar7KmOUtB004Tf2%2Fml%2B2w5IIY5nT4hVsub3T2dkAhZQXTFBK1G0aSzMjUmhb4QvbcOF9txdSBLGF6kCozbR%2BIOVR1u4jiV8I8tmV13Q5kcOiorTQXxcy9V5av4YJmK4WrNw6S8XI47eqZZbrU87oav9hmrCSUJdwc266%2BhsMBUFPIHOgVZSVaxpNWxj7rt3yMKzyu9MGOqUBJTwyyPkOoh1B4K0OwIX6vEcbEO1BWpUdGvwxew%2FFhohM4ltQldRwn249qD5vOBWFQBxRYvobDsRBGVMqOeOK%2Blfqtrg7V%2BZdwRb4sQjPGlNM7YcoKVqsWqak18Dn%2BRyPBmvst%2Fw6AK5hcQ7mfq%2FejZsnv%2B4EJ3uSpMrevpn76BRKHT%2FSiSI47ncEf6pWw%2FvIIRcBD0lvBjxA%2FzsfgbozWh3dzG9K&X-Amz-Signature=43eec3b6a9415064f46acb06deeeddf65dbd695da61bebe5102c00d44d5e8d12&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466S7GHTI6F%2F20260802%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260802T125623Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBAaCXVzLXdlc3QtMiJHMEUCIAw7oXYidV%2Fmf03Q3jdBVi71zpmnB%2BhgLVPoxinsGC33AiEAoYsU52P6U95Gybxwu1FMw%2Bbccvz368fAlsX%2Fy1AaNkYqiAQI2f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJMDqIJWkhUhhnggJircA4mSL1M6GJANB8acPfWDvoJz%2FnyyCaD34egyjZEZxebx%2BT1j18a8k921JgWSdoFUJN0QBaTPolCihIWP1Ody%2BRkWX3O2cmZZr%2BCZJajHkGBmqNjGmIvmsvFnBpOdOSRO7bSjvODg30Afwol8dA8uBkrep3b%2FyHbPd%2BPMfAYLE95nkDjJm9fGBIhExePAA4o6cqBoHj69jckF5akaLw0%2BLyuHFmjO97mDWeQaMBxUYiQLUJTI0c7aR90hAlmGJZXsR8M0u%2F09mMLwTGMjDMjIS1OLz6sosRRnXCJ%2Fj69kLj80hPePqDUg0yNhvfGefg32hEv1iFUZ1p7auDPXDDckzyiBCDx79upJTxzrpE%2B7PvCcgxrmr%2B6ib6aYslUoDk42pPfhKhfB%2F9u%2FadWoJ9SEbAnSWjWAaNnpOJSXSqGBEdnyFIk0kOOHPYhnTcExar7KmOUtB004Tf2%2Fml%2B2w5IIY5nT4hVsub3T2dkAhZQXTFBK1G0aSzMjUmhb4QvbcOF9txdSBLGF6kCozbR%2BIOVR1u4jiV8I8tmV13Q5kcOiorTQXxcy9V5av4YJmK4WrNw6S8XI47eqZZbrU87oav9hmrCSUJdwc266%2BhsMBUFPIHOgVZSVaxpNWxj7rt3yMKzyu9MGOqUBJTwyyPkOoh1B4K0OwIX6vEcbEO1BWpUdGvwxew%2FFhohM4ltQldRwn249qD5vOBWFQBxRYvobDsRBGVMqOeOK%2Blfqtrg7V%2BZdwRb4sQjPGlNM7YcoKVqsWqak18Dn%2BRyPBmvst%2Fw6AK5hcQ7mfq%2FejZsnv%2B4EJ3uSpMrevpn76BRKHT%2FSiSI47ncEf6pWw%2FvIIRcBD0lvBjxA%2FzsfgbozWh3dzG9K&X-Amz-Signature=0aa996f260020ef7cbf2247efdf8266e0b1f5368726e04bee037c6c924887925&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
