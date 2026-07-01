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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RENRKPIN%2F20260701%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260701T140618Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBEaCXVzLXdlc3QtMiJHMEUCIC1jWVxIVmgjFKWaJH5ds4o3xFumRtPwwSuTYGR3axctAiEA7T6EyX1uVBzFCmubtY8yA%2FRRkZ%2BC4bvzoq7a1B%2BhBhoqiAQI2v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDC2mkn08Kl7sNXt8OSrcA8HSD9q3t14QPvPPmrJq36g2K%2FOcgS%2BVXUnYGSjY%2FTisJRMGaS8CBVFVjESjhfYVizX0w%2F56QURG92A9%2BYbxw2GS8J7cpyStQKA4PmL5ZEse%2BUJT972SPrm7ZfRPCw6CVqziR8%2BVoFs%2B%2B1rVRzqn9p5jwxtg6w6hE0qH0UKmIEeZ8OTuaQ33BipUUKX%2FEcpb5O%2FHOd7nEWWsFCG9ZRn0eGhMsrT5Ml1%2BjB8Hq4kohqmNjKPk8ejn84GNlEJpBoCnhFe41eHRn7Jvj1HswLvWVL%2BRPu1MQ03PU29R5AeKWTI%2FFwxoQWu35VD5ZV8d1ipgD2LyD5c4Z0p730bUtfqSwAone7zZz%2BJ76PZBACaXcEEnvuWplDz3HLRxU6KL1YOBj2gKPFtNv2mqR0nEiv6qCaNqR0759gxlKxzZUs3h4iimjLiVg73OFBp14P%2FuwtimAKCL5nsYYSe%2FokDLQ0Pts652bkI5WaMw33V1X%2B87e3KZ74z18I5KPhKgo2ydhfunOF0nVYoWGJqRC3rDOigsO7Tk48A%2FLZ1Hy89zi%2FNjOQUQ1SGn7Oql4%2BZRlxWR1Hnn1KGwd8jXL5dU2ciBxhowgy6zP%2Fc%2FXkqySpnGOb0%2Fs28JVpGqSNMaVQUr5WaOMPGhk9IGOqUBFCrsas5NA30ys78v3Z7E9XavWSnAbTFvvXLX04iv5a%2BIKH7bp%2FrNEkyfaUo2PzPW%2B9xD8qCHF2SVjyRYlCcMxVjQn0LOQcuXWKUxtfWBaNVG2PwzL26yONEbt7wxjszlFGoofXu%2B3Xtdo4M%2FRlvysGeC7cK2Tq11FCumFcith%2FqlOKpS3kMcay4FmAujl2p8ERc6oFZbRjUP2bQlxNKq%2Bvyza%2BV8&X-Amz-Signature=9664bf052181f96b9ae6c5f9208e329cc56fe34eef137584c65cb86f191362c5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RENRKPIN%2F20260701%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260701T140618Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBEaCXVzLXdlc3QtMiJHMEUCIC1jWVxIVmgjFKWaJH5ds4o3xFumRtPwwSuTYGR3axctAiEA7T6EyX1uVBzFCmubtY8yA%2FRRkZ%2BC4bvzoq7a1B%2BhBhoqiAQI2v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDC2mkn08Kl7sNXt8OSrcA8HSD9q3t14QPvPPmrJq36g2K%2FOcgS%2BVXUnYGSjY%2FTisJRMGaS8CBVFVjESjhfYVizX0w%2F56QURG92A9%2BYbxw2GS8J7cpyStQKA4PmL5ZEse%2BUJT972SPrm7ZfRPCw6CVqziR8%2BVoFs%2B%2B1rVRzqn9p5jwxtg6w6hE0qH0UKmIEeZ8OTuaQ33BipUUKX%2FEcpb5O%2FHOd7nEWWsFCG9ZRn0eGhMsrT5Ml1%2BjB8Hq4kohqmNjKPk8ejn84GNlEJpBoCnhFe41eHRn7Jvj1HswLvWVL%2BRPu1MQ03PU29R5AeKWTI%2FFwxoQWu35VD5ZV8d1ipgD2LyD5c4Z0p730bUtfqSwAone7zZz%2BJ76PZBACaXcEEnvuWplDz3HLRxU6KL1YOBj2gKPFtNv2mqR0nEiv6qCaNqR0759gxlKxzZUs3h4iimjLiVg73OFBp14P%2FuwtimAKCL5nsYYSe%2FokDLQ0Pts652bkI5WaMw33V1X%2B87e3KZ74z18I5KPhKgo2ydhfunOF0nVYoWGJqRC3rDOigsO7Tk48A%2FLZ1Hy89zi%2FNjOQUQ1SGn7Oql4%2BZRlxWR1Hnn1KGwd8jXL5dU2ciBxhowgy6zP%2Fc%2FXkqySpnGOb0%2Fs28JVpGqSNMaVQUr5WaOMPGhk9IGOqUBFCrsas5NA30ys78v3Z7E9XavWSnAbTFvvXLX04iv5a%2BIKH7bp%2FrNEkyfaUo2PzPW%2B9xD8qCHF2SVjyRYlCcMxVjQn0LOQcuXWKUxtfWBaNVG2PwzL26yONEbt7wxjszlFGoofXu%2B3Xtdo4M%2FRlvysGeC7cK2Tq11FCumFcith%2FqlOKpS3kMcay4FmAujl2p8ERc6oFZbRjUP2bQlxNKq%2Bvyza%2BV8&X-Amz-Signature=d841ff1bb0d042aa75c98742c517766935c0f4ae6d98494924ea08e0369f607d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
