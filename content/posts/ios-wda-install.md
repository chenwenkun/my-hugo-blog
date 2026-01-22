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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UPQFBN6L%2F20260122%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260122T122714Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBUaCXVzLXdlc3QtMiJHMEUCIAFLSGdaZzHRxOebfo80nUQZfMsZliyq3egE0nfRTTuYAiEA7M6F0uwut6FlCC2mSUGofwvnNLSKmmHVYn1xJoB0f2YqiAQI3v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNCi9iNL%2FNOatgCINircAzPZnIhfszcY9oDnDCBY1tnPj%2BwjqIDUQwjnaStyM1I1TsS%2B0td9XZmLauZvWITcU%2F12pVYRNv%2FdGc5ppsDQICFliSoEF9sqItNLWndk4AQ8WTF8tsK3xUGu1wkim%2BKYhvDVZSmbe8QF1lyFukATQzUnW6GsIdPNeaNM7nsz1MlDy%2Fz8TXu1C7tJLktiUjcGYeLy8doHKeZnqxml1Buau5h0gJitSyFOUEv8HPlWRAb4fDnDyiS96KxARy75ahOEk6SajM74jjp2qEQpP60M5d081udbBTBfmhDwienFnCWO9TzWLV1megZOig%2FfFuWPuXXbtSHQI%2FkwJotR3wxU0NNh0h6wqITWpYF6cRuouzh462um2%2B8rxC7Nxme7RaxPmcddCNjgBvtfVjyUO3lIMLZxGaCwyFm0EkVg0fnSuBD6HceOEzGSZ3mmMj5PQ0Gam0kYFZ%2FOedEcSFhikNsVJAV%2FCcHrRAGJV6gVTXCy%2FvJLMQWGJAfeRDKhB%2BTwJhaIGpvBJBCb%2FNQVzQYy9ezhJCjL5lEk2m%2BadiJSNchyxTJTAbyvO69YaUxN1rNRFRzumZCc3wXMDh8AjPCOiD%2BLEAzP0XFCfDgKyYvcRxE5NAaXwnBsOEew5ItSknbkMMquyMsGOqUBQ7nNsYqFVFizwtF%2BPcLHxhEOu9IhlT7lDZFzykblnQ%2BNRJPLlKDcM1mCksjdgci3a2e1wpeDGHOt5B7K91biNbBUgHBTYDsRqz8ADJLL8beiZgnM%2BiRdsddf5fVx56Ea3oJeXC7YpNRtlzcX8ibJ4owEMUZ46XKaLssrUp%2BnBZw%2F2F8weC5qPamQ2%2BEd45j0F6LpigFIeqAfiijJyZqOHbtKpr9g&X-Amz-Signature=3b1c62d15648cfc8a61a25411474bf2785aecb0594b5cef977868c139f4b03ed&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UPQFBN6L%2F20260122%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260122T122715Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBUaCXVzLXdlc3QtMiJHMEUCIAFLSGdaZzHRxOebfo80nUQZfMsZliyq3egE0nfRTTuYAiEA7M6F0uwut6FlCC2mSUGofwvnNLSKmmHVYn1xJoB0f2YqiAQI3v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNCi9iNL%2FNOatgCINircAzPZnIhfszcY9oDnDCBY1tnPj%2BwjqIDUQwjnaStyM1I1TsS%2B0td9XZmLauZvWITcU%2F12pVYRNv%2FdGc5ppsDQICFliSoEF9sqItNLWndk4AQ8WTF8tsK3xUGu1wkim%2BKYhvDVZSmbe8QF1lyFukATQzUnW6GsIdPNeaNM7nsz1MlDy%2Fz8TXu1C7tJLktiUjcGYeLy8doHKeZnqxml1Buau5h0gJitSyFOUEv8HPlWRAb4fDnDyiS96KxARy75ahOEk6SajM74jjp2qEQpP60M5d081udbBTBfmhDwienFnCWO9TzWLV1megZOig%2FfFuWPuXXbtSHQI%2FkwJotR3wxU0NNh0h6wqITWpYF6cRuouzh462um2%2B8rxC7Nxme7RaxPmcddCNjgBvtfVjyUO3lIMLZxGaCwyFm0EkVg0fnSuBD6HceOEzGSZ3mmMj5PQ0Gam0kYFZ%2FOedEcSFhikNsVJAV%2FCcHrRAGJV6gVTXCy%2FvJLMQWGJAfeRDKhB%2BTwJhaIGpvBJBCb%2FNQVzQYy9ezhJCjL5lEk2m%2BadiJSNchyxTJTAbyvO69YaUxN1rNRFRzumZCc3wXMDh8AjPCOiD%2BLEAzP0XFCfDgKyYvcRxE5NAaXwnBsOEew5ItSknbkMMquyMsGOqUBQ7nNsYqFVFizwtF%2BPcLHxhEOu9IhlT7lDZFzykblnQ%2BNRJPLlKDcM1mCksjdgci3a2e1wpeDGHOt5B7K91biNbBUgHBTYDsRqz8ADJLL8beiZgnM%2BiRdsddf5fVx56Ea3oJeXC7YpNRtlzcX8ibJ4owEMUZ46XKaLssrUp%2BnBZw%2F2F8weC5qPamQ2%2BEd45j0F6LpigFIeqAfiijJyZqOHbtKpr9g&X-Amz-Signature=03773c0e38e632048532f9e75d60325c5f451b8aa5034f521ceeab34d197645b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
