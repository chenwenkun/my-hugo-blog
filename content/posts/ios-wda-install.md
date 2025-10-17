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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665ZMPALMX%2F20251017%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251017T005022Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDbPsBptqS%2FWA%2FnzORt3I%2FbT5dTFbQbktOuxVep1Fz6EAIgXOu83s4jtx9iS8HAPfbaDKrdNLj%2BE%2FJ8vuvVae2Nw3gqiAQImf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDPG9BZsJDX8sk8nJFSrcA0suYOKvVocgWcsECbg38ndIhIArV2uoPid0C3AkRLp%2B5cQHZhqXRNUFfs69FDw9PSCUFeDii2cQSxp0SVvwq67FNw3%2B2uiS1xerZIEqrc7vi25wph4vg%2F7z0yjyOT9rvVSYQJsuXoG%2BvBuRobruVwSKjNCR6PioNDcNNv3Qm%2FYKUJRLlR8RjsZGr8PqMANCKPyDChxfZNb5Q8mno3gb8EjRoFiw46XIpIuJLiOJ6WBIVJ5a06C0cunwhIAnI2%2BL8D%2F9EOwuxOGc6FajZgEGbJSDiI62qMgVdRBROoE8CO4rON2wSf0FiKOD94o%2FK2gml22AE9d1g%2BjuPDZwPIS9cRfDcQgZqePXv3GFQERONIx7ZjXmzCa%2BpDd0AISiebmvIBeDXd3KncBOsX3UTduwRvX1mjL2cnWMB5kRhpGQ%2BFCk%2BZvKeIyTs3lzoTQ7T5WP2p3WdtaGZbsxMjQjyxvgxfJTQj70%2BLO5xyRa9%2Fd%2Bw9x4e%2FRr67i6Ccqi%2Bpgbyvfivy3PJisjts%2FWuymLlckDPV3dYqG2xHvUa9lnv8d5ZCfvjm3%2F%2Bhtg1m%2FSZD2PhMBbkNBrtzinwjmQS%2BMmc%2FUhdHDjz5ltcow%2F6Z10I%2FR5kAJputuPIVdOOoAuzlT3MMqRxscGOqUBJyUtr%2F1g3GP4ej2vS1sfF5FwPTqMHsdhiTKfwt1DGyNEEaCHjZ3k2zcwBdUS2lHOJLCOo2cV4zgWhJrp3i4p4tkkvRQcfR68RIHKLFHgB7RMkWbLzLty0sOMPqsBg3xvQ1JQIZHF%2Bm2%2FJh3dy7eZYAm593KGfi5LKisUiuiaWm7QM9yScaV86Z%2By3cutSk8H551izdwMZtEzlzjpMyyx7qjXUfek&X-Amz-Signature=fee6321c8f77ba53aa30caa1706e546bc45f00deea9060e63f49c90944556666&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665ZMPALMX%2F20251017%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251017T005022Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDbPsBptqS%2FWA%2FnzORt3I%2FbT5dTFbQbktOuxVep1Fz6EAIgXOu83s4jtx9iS8HAPfbaDKrdNLj%2BE%2FJ8vuvVae2Nw3gqiAQImf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDPG9BZsJDX8sk8nJFSrcA0suYOKvVocgWcsECbg38ndIhIArV2uoPid0C3AkRLp%2B5cQHZhqXRNUFfs69FDw9PSCUFeDii2cQSxp0SVvwq67FNw3%2B2uiS1xerZIEqrc7vi25wph4vg%2F7z0yjyOT9rvVSYQJsuXoG%2BvBuRobruVwSKjNCR6PioNDcNNv3Qm%2FYKUJRLlR8RjsZGr8PqMANCKPyDChxfZNb5Q8mno3gb8EjRoFiw46XIpIuJLiOJ6WBIVJ5a06C0cunwhIAnI2%2BL8D%2F9EOwuxOGc6FajZgEGbJSDiI62qMgVdRBROoE8CO4rON2wSf0FiKOD94o%2FK2gml22AE9d1g%2BjuPDZwPIS9cRfDcQgZqePXv3GFQERONIx7ZjXmzCa%2BpDd0AISiebmvIBeDXd3KncBOsX3UTduwRvX1mjL2cnWMB5kRhpGQ%2BFCk%2BZvKeIyTs3lzoTQ7T5WP2p3WdtaGZbsxMjQjyxvgxfJTQj70%2BLO5xyRa9%2Fd%2Bw9x4e%2FRr67i6Ccqi%2Bpgbyvfivy3PJisjts%2FWuymLlckDPV3dYqG2xHvUa9lnv8d5ZCfvjm3%2F%2Bhtg1m%2FSZD2PhMBbkNBrtzinwjmQS%2BMmc%2FUhdHDjz5ltcow%2F6Z10I%2FR5kAJputuPIVdOOoAuzlT3MMqRxscGOqUBJyUtr%2F1g3GP4ej2vS1sfF5FwPTqMHsdhiTKfwt1DGyNEEaCHjZ3k2zcwBdUS2lHOJLCOo2cV4zgWhJrp3i4p4tkkvRQcfR68RIHKLFHgB7RMkWbLzLty0sOMPqsBg3xvQ1JQIZHF%2Bm2%2FJh3dy7eZYAm593KGfi5LKisUiuiaWm7QM9yScaV86Z%2By3cutSk8H551izdwMZtEzlzjpMyyx7qjXUfek&X-Amz-Signature=9753faffe13eb23cf8317268d4f2e75a64b41df5f329fd32fc226d1b38a12c8a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
