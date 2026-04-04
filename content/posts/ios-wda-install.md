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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46672BGO7CQ%2F20260404%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260404T011408Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDpsFIzvxz7jFJZW6F%2Fx1WzKxpt%2FvsLMuxSn0TeRPtL8gIgR2Fgny5Nb4cENgaiFFtJqP8FU9R08BNtMrbG5O6k7WkqiAQIkv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDI1OHyzUMmqza3OACCrcA99v2yn%2BlhzEpTEfGbJ1QEiAYBUHhjhTXIGTbSCCUXcCRqxxoCOkw19p%2Fvq9NA8Y2W4LMkoxCWN5IkZt6s%2BgDXiC9FSHB0LMg6mvVlGtfvH5ROHV8Ij%2FtddX5XyVLB4S6yGzPV%2FjeAh60BfHbNgOYZF82v%2B2tePR64yxYMIXbo%2F9agNfF3AKVOmcHVeIPl7Yslm8Ck6OFjazP87uYuJKjRMsLklJ7RRxYEhsxY%2FmCiuNz%2FMtuF%2F%2FvJNJXEbGXwhdq%2BLmQ343iw0uqYX0QvZyhVfo2S%2FNNfPZhCUYvRjxbZ7DIdY743M7cBTCeehzycsAzm%2BWZ4UwOsrPQjZ9ppQ28B76LuO2JR0i5b6bhKyH82cCz6f5OeQuRxyFVz8h%2B80cQ6dcWYlhWkRFdpwYZeIVN3XQMNnWa%2BXqLjCW%2BdyU%2FS2ZBEQ45ttRV%2BXfCegG7XcVKcaHRviEGstOE6n0%2BXqWrTguuxgXDJR4N5CorzfkfkX14ZO4at9mh50SGv3wPWaiZlm2smrInw5MNPtnlkoGVW98h2I95a6s9N5KE58Cc5Xko%2FYk4MvlWnaBvJz5JraKjy8Rncm9rA7u9GM84bpc6TJTKs7%2BdEolm3ZcVufQmRP%2BxDJGvElRlsrGDyJmMLO8wc4GOqUBnC37HOOxmhXr7aPlvW%2FvFx2kwLqEWW%2Fl4kYrgkdYH3%2BM9nPiR%2FncAxo82x8UXGdTlOurFXYqkZ1pCo%2BVuyeQ2%2F2a9WxV6%2BXeZ%2FhqhlZYMJ%2FHgiaFU8%2B%2B1ra%2FEe63k2dzRk94ldIu1MxlDRQB9Y%2FDA34TvYX4ahxlMGzbk1qvtmINiC03sRk7EO7bNrb9fnPNR45IE5e3GJ%2F9ccwxinXx80b5zs7b&X-Amz-Signature=15dd311ac088ff8dd1b15dc4871d500c2dc09249b836984e030fe76e12ae220e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46672BGO7CQ%2F20260404%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260404T011408Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDpsFIzvxz7jFJZW6F%2Fx1WzKxpt%2FvsLMuxSn0TeRPtL8gIgR2Fgny5Nb4cENgaiFFtJqP8FU9R08BNtMrbG5O6k7WkqiAQIkv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDI1OHyzUMmqza3OACCrcA99v2yn%2BlhzEpTEfGbJ1QEiAYBUHhjhTXIGTbSCCUXcCRqxxoCOkw19p%2Fvq9NA8Y2W4LMkoxCWN5IkZt6s%2BgDXiC9FSHB0LMg6mvVlGtfvH5ROHV8Ij%2FtddX5XyVLB4S6yGzPV%2FjeAh60BfHbNgOYZF82v%2B2tePR64yxYMIXbo%2F9agNfF3AKVOmcHVeIPl7Yslm8Ck6OFjazP87uYuJKjRMsLklJ7RRxYEhsxY%2FmCiuNz%2FMtuF%2F%2FvJNJXEbGXwhdq%2BLmQ343iw0uqYX0QvZyhVfo2S%2FNNfPZhCUYvRjxbZ7DIdY743M7cBTCeehzycsAzm%2BWZ4UwOsrPQjZ9ppQ28B76LuO2JR0i5b6bhKyH82cCz6f5OeQuRxyFVz8h%2B80cQ6dcWYlhWkRFdpwYZeIVN3XQMNnWa%2BXqLjCW%2BdyU%2FS2ZBEQ45ttRV%2BXfCegG7XcVKcaHRviEGstOE6n0%2BXqWrTguuxgXDJR4N5CorzfkfkX14ZO4at9mh50SGv3wPWaiZlm2smrInw5MNPtnlkoGVW98h2I95a6s9N5KE58Cc5Xko%2FYk4MvlWnaBvJz5JraKjy8Rncm9rA7u9GM84bpc6TJTKs7%2BdEolm3ZcVufQmRP%2BxDJGvElRlsrGDyJmMLO8wc4GOqUBnC37HOOxmhXr7aPlvW%2FvFx2kwLqEWW%2Fl4kYrgkdYH3%2BM9nPiR%2FncAxo82x8UXGdTlOurFXYqkZ1pCo%2BVuyeQ2%2F2a9WxV6%2BXeZ%2FhqhlZYMJ%2FHgiaFU8%2B%2B1ra%2FEe63k2dzRk94ldIu1MxlDRQB9Y%2FDA34TvYX4ahxlMGzbk1qvtmINiC03sRk7EO7bNrb9fnPNR45IE5e3GJ%2F9ccwxinXx80b5zs7b&X-Amz-Signature=cc73db2b22cf79b3efe445fa78fae9d3dccba5931e353cf140d90d8cc16752a1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
