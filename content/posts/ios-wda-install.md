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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UZRRBIPB%2F20251113%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251113T061807Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEH0aCXVzLXdlc3QtMiJHMEUCIE2rUIdY8%2Fp1A86ENXJ8KsKGakY%2F0dU%2BXZ3bqCLNuhlEAiEAna4Nww2y8Q%2Bt%2Bhiu4dMpJL8lQb%2BK8iNtsPa9%2Fea45S4q%2FwMIRhAAGgw2Mzc0MjMxODM4MDUiDJINVhJFcvzpXlJWlSrcA31KLsoZGlctCSFiJwjgnVMJjd%2FHUsAoCHRKUaSXfr7aT6kq5L6x2%2FZwgX0GKhp4hbeZTB1AtpMhXA%2F4V7AGXe3xbxeiJ1l1%2FZql3xtKXDis4k4lqiM0q38syDIzWijfkhylzt4cVQ52HBRFKbjgntV08rVQ3IaJfMaskBXuNNsdlbDW3Q0EvlPSPbHhHp4nKoTtHZoF5ZbwU5kqUzQjXPTI0JM5mQmiRU9vW4kdGaw0aH3GATVKiR78oc0fxhKN1f2U%2B%2Fh26uGL79c0ha%2BZIKMkFA5EX5bxlz7oO77tmf6dYE8M%2FtjHmFeIgBS688k1wS5ZdH0H92dVqH%2BKHh7pkys%2BW3Fd4Mi9gSRHr%2FWsw2IbgkcoE2M4VpDhiyxFu24ChXbtZodkx7sTBX5wX3FtwmtnqN%2BnlGxGr6vqxTARuH%2FrX48rTgCYTYIM3rrNsQbJBlVCa5TfO%2B04NLMduA3kH%2BF0Lm0chn7RR6MWCrlcZBUtW6UcGHyRz9uIbXvGTFcKuxljzf%2BBECWdPJBzGG6VbboYCyXmp%2FJNKA9Kw7op42caJGJScFAGJ5S346VdkWmwJ8RqIq2ru1J7EivdDnhT7NdzgQOvUQhQWaYVXexFgRF1xJOeEujz8VIfIbQgMJPK1cgGOqUBVaN46CY39iHtK85qaaCL02knIqKldblQmfM%2BsM2N652czyORqFqM0cQkx5XgSswxVRGs0qnVJd%2FMQcMFkb31LyUAlFcvWGniOc%2FL6FdtlI3tIfI3FZez3dCZCb6HAunySJPEwM7I8cGbx4FjNiKj7mJxV0e60nRQePNoWLDpRKOzdd%2FH2fFK5BIi1lwOIyYw59LKQsVED0S7E2xIZ9wLAeOnpzAO&X-Amz-Signature=16989fb1f219d2e1aaaade1927062ee586dcb0be686446a2b1d2eaadc0f4172f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UZRRBIPB%2F20251113%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251113T061807Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEH0aCXVzLXdlc3QtMiJHMEUCIE2rUIdY8%2Fp1A86ENXJ8KsKGakY%2F0dU%2BXZ3bqCLNuhlEAiEAna4Nww2y8Q%2Bt%2Bhiu4dMpJL8lQb%2BK8iNtsPa9%2Fea45S4q%2FwMIRhAAGgw2Mzc0MjMxODM4MDUiDJINVhJFcvzpXlJWlSrcA31KLsoZGlctCSFiJwjgnVMJjd%2FHUsAoCHRKUaSXfr7aT6kq5L6x2%2FZwgX0GKhp4hbeZTB1AtpMhXA%2F4V7AGXe3xbxeiJ1l1%2FZql3xtKXDis4k4lqiM0q38syDIzWijfkhylzt4cVQ52HBRFKbjgntV08rVQ3IaJfMaskBXuNNsdlbDW3Q0EvlPSPbHhHp4nKoTtHZoF5ZbwU5kqUzQjXPTI0JM5mQmiRU9vW4kdGaw0aH3GATVKiR78oc0fxhKN1f2U%2B%2Fh26uGL79c0ha%2BZIKMkFA5EX5bxlz7oO77tmf6dYE8M%2FtjHmFeIgBS688k1wS5ZdH0H92dVqH%2BKHh7pkys%2BW3Fd4Mi9gSRHr%2FWsw2IbgkcoE2M4VpDhiyxFu24ChXbtZodkx7sTBX5wX3FtwmtnqN%2BnlGxGr6vqxTARuH%2FrX48rTgCYTYIM3rrNsQbJBlVCa5TfO%2B04NLMduA3kH%2BF0Lm0chn7RR6MWCrlcZBUtW6UcGHyRz9uIbXvGTFcKuxljzf%2BBECWdPJBzGG6VbboYCyXmp%2FJNKA9Kw7op42caJGJScFAGJ5S346VdkWmwJ8RqIq2ru1J7EivdDnhT7NdzgQOvUQhQWaYVXexFgRF1xJOeEujz8VIfIbQgMJPK1cgGOqUBVaN46CY39iHtK85qaaCL02knIqKldblQmfM%2BsM2N652czyORqFqM0cQkx5XgSswxVRGs0qnVJd%2FMQcMFkb31LyUAlFcvWGniOc%2FL6FdtlI3tIfI3FZez3dCZCb6HAunySJPEwM7I8cGbx4FjNiKj7mJxV0e60nRQePNoWLDpRKOzdd%2FH2fFK5BIi1lwOIyYw59LKQsVED0S7E2xIZ9wLAeOnpzAO&X-Amz-Signature=1fd0968bace59690cc78222c9b5ed3fbccf70adf87661b68827b7432b76134a0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
