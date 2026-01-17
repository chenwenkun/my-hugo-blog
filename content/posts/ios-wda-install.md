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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663UHZCITM%2F20260117%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260117T005617Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIGAEQudzjwRxeud2sz4o75xhFEYFW9amIcOnnawKm48yAiEArz%2FqExSOv0PdzW5%2BbQH5HWWf6XJJNi%2ByjsOFCunop4cq%2FwMIWhAAGgw2Mzc0MjMxODM4MDUiDJ%2BzPp1Gb%2BBD6ymDWCrcA%2F0TCTwWEtm0GB%2BGhxNF3Ms6U68XRhG5lfamuvVcwdWH5dgmjRKn5rCGHu2LLBs67nmJJh2BM943W5ukRClRvzZWImow0ML0o4MFNA3n9aNVahLfwNRRSAD9l1WAikOFwMrbJh5YDoJfldC5Pp5fzaVOwU7T8nVq3RPJOpGk8DvWVmE6pcIT%2BxgzwWhidqsAAgGIQBGwbXW9jqr4HPqXksh9B3QMyyRYXgG6UwgODI56X3JBI8ClCcz6m0YIxpHkX9hPvQqIgmyCio4E2IBOzKKjuWe1%2BZtDDbWDd0N40pgZndbIURDi1eO2%2BmnqC6tyiAkYK2qx0AqDTR%2Fq2B7c4Wppk%2FrRKvf7EL%2FG%2BEr%2FUx944OAy7xo4B5MOTnlTDMGpQGrGIPZSI5TLPxvEfx8ShAaGZLg3hsY7HKnOAQuRGbVsl9%2BdeZMzt1IDVkSrfQOTcCohqD0nHWGfnwnvuShOM7cEyDKh7E4skKCUtgGBzX6xlp%2F%2FyCJpffWUGMQv%2FzLcA%2BwmlnDMHBvAOw2c3Y3RVXbIupHPB3XTz9BmvRqXiyDt4w1KCiziR7Xs5lq8tZ2RL6%2BzcZbnsKhqYoglxyfWizLw2yYxpgxaqDvu68jL%2FgTmh1aSKJqNpIrvaJ3JMISvq8sGOqUBifvorBeBI%2BHTKy3qJ78EQjVEC3qVPYbN0lsX62J1LHYZEL0CJsuUnM6ii94Kcu5uRX50J2grYvi9lmMz%2FFxJUhI64FjWAYqRpk26kTJBD61f%2F2zjr1YAW362rffKWn9Z60JZJFcuHRDIbvQPrAWWCN0M2mFiwihL4fxaZxvZFme%2Bk6QgorVxkPGVoHR5X9yHFp0bfki6mOr%2FKmG9HZWgJIHOQ%2B4%2F&X-Amz-Signature=87e0242ddc71046fd7688a01d684768b8f5f989ebe21ee7f955e70eddb51e48a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663UHZCITM%2F20260117%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260117T005617Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIGAEQudzjwRxeud2sz4o75xhFEYFW9amIcOnnawKm48yAiEArz%2FqExSOv0PdzW5%2BbQH5HWWf6XJJNi%2ByjsOFCunop4cq%2FwMIWhAAGgw2Mzc0MjMxODM4MDUiDJ%2BzPp1Gb%2BBD6ymDWCrcA%2F0TCTwWEtm0GB%2BGhxNF3Ms6U68XRhG5lfamuvVcwdWH5dgmjRKn5rCGHu2LLBs67nmJJh2BM943W5ukRClRvzZWImow0ML0o4MFNA3n9aNVahLfwNRRSAD9l1WAikOFwMrbJh5YDoJfldC5Pp5fzaVOwU7T8nVq3RPJOpGk8DvWVmE6pcIT%2BxgzwWhidqsAAgGIQBGwbXW9jqr4HPqXksh9B3QMyyRYXgG6UwgODI56X3JBI8ClCcz6m0YIxpHkX9hPvQqIgmyCio4E2IBOzKKjuWe1%2BZtDDbWDd0N40pgZndbIURDi1eO2%2BmnqC6tyiAkYK2qx0AqDTR%2Fq2B7c4Wppk%2FrRKvf7EL%2FG%2BEr%2FUx944OAy7xo4B5MOTnlTDMGpQGrGIPZSI5TLPxvEfx8ShAaGZLg3hsY7HKnOAQuRGbVsl9%2BdeZMzt1IDVkSrfQOTcCohqD0nHWGfnwnvuShOM7cEyDKh7E4skKCUtgGBzX6xlp%2F%2FyCJpffWUGMQv%2FzLcA%2BwmlnDMHBvAOw2c3Y3RVXbIupHPB3XTz9BmvRqXiyDt4w1KCiziR7Xs5lq8tZ2RL6%2BzcZbnsKhqYoglxyfWizLw2yYxpgxaqDvu68jL%2FgTmh1aSKJqNpIrvaJ3JMISvq8sGOqUBifvorBeBI%2BHTKy3qJ78EQjVEC3qVPYbN0lsX62J1LHYZEL0CJsuUnM6ii94Kcu5uRX50J2grYvi9lmMz%2FFxJUhI64FjWAYqRpk26kTJBD61f%2F2zjr1YAW362rffKWn9Z60JZJFcuHRDIbvQPrAWWCN0M2mFiwihL4fxaZxvZFme%2Bk6QgorVxkPGVoHR5X9yHFp0bfki6mOr%2FKmG9HZWgJIHOQ%2B4%2F&X-Amz-Signature=77917b66e03fd1e557648c0c75267b9740224201033a897afbb5b1038c037945&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
