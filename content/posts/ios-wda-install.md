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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SRVSJ4RN%2F20260526%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260526T020748Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIAsuXM2raIvoX8WYO4XREmog29E%2F5HdN2CbEojQfyJR8AiEAsXISd%2FIkriO%2FwRlYt6lXwGJ9mjA6NtIjYC%2FJj4AsDv0q%2FwMIcxAAGgw2Mzc0MjMxODM4MDUiDJRoA6Duz7zFKNBLfyrcA2XkFpsqge7yTcm%2Bu8dTk24deGlSg2XK7l11YjjeJNqZ%2BWYZbGjgLr1w33uCT7LmznvIeYwRKdn3GrrWilUdMMqppJhQ%2FqP%2BJbt6SRmraflvEd2jxwUeRyTmcBIKhAqgcvGzHbLzfLQBJ0QGN9D4k6BPcSOUWyXsDtV78%2BYg4gCh%2FDIJQTfYTTxIdufBeradu9aFqvHkwS2OyT2Hft18zaZg%2FDUZuiIA%2Br9Ry9bsguXFib4IdxVA3i02eL6MCz%2FMT4a%2FU1SawBasSIEGaKIlqInfsh5Mo%2FLaF%2B8ZLwBKLChG9VUJuYkCe%2BAoU6RkimaWKk7djlzdQBdnlTMdijfRqtVhn6wr6Vx7EjhNvVFEyVe%2FFmoK%2FCL4DODexBrIA%2BN4flXxUoqy%2FFcWmA1Ph9XxddBpbKM4AA%2BJKwClwbUj93JYC%2Bs75OqrEf8HX8ISwZf3cytIsLh13NOZEjlaSgDx6Ad3Vb%2BGRVBX%2FopeQJj18cOSPScdPcTj455UYrEMsyIReSyPdpZedxF1ENMoEe9fsMDc10dIro5Xv4oN%2BEy0OEA6M4yZrJu7u6Grnpb30iZI8TCk7FazjAKp8XKfdK%2FdPs69o12Ue1%2BoLTv40Sxq4Ej4%2FrsTQahh3V7%2FE129MJ7409AGOqUBUcGMV4lsRRKIYn9cihjPBfAikIvTqHeEwUT912%2B37bTANgf4ShyebSUDwe3Q7%2ByYY4YfuW7srMWS5yVMk9%2BE6Jn9sVN4CJFTshFg8zi%2FuJeTQ8XbD9hjuq9KxcuwEkNYk%2BynaytdKTE%2Bi5CU4aj57LMxTU6YiHBuIaEFvj9x%2BH2WWQMRR1PE6UXJ9o2z%2BbmiiAexbseua8xoGK3lcggNGV7wsnC9&X-Amz-Signature=96c1ecf7cce935ddece82ce97b12e5658a950ea62136b57b005a29a4647c4575&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SRVSJ4RN%2F20260526%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260526T020748Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIAsuXM2raIvoX8WYO4XREmog29E%2F5HdN2CbEojQfyJR8AiEAsXISd%2FIkriO%2FwRlYt6lXwGJ9mjA6NtIjYC%2FJj4AsDv0q%2FwMIcxAAGgw2Mzc0MjMxODM4MDUiDJRoA6Duz7zFKNBLfyrcA2XkFpsqge7yTcm%2Bu8dTk24deGlSg2XK7l11YjjeJNqZ%2BWYZbGjgLr1w33uCT7LmznvIeYwRKdn3GrrWilUdMMqppJhQ%2FqP%2BJbt6SRmraflvEd2jxwUeRyTmcBIKhAqgcvGzHbLzfLQBJ0QGN9D4k6BPcSOUWyXsDtV78%2BYg4gCh%2FDIJQTfYTTxIdufBeradu9aFqvHkwS2OyT2Hft18zaZg%2FDUZuiIA%2Br9Ry9bsguXFib4IdxVA3i02eL6MCz%2FMT4a%2FU1SawBasSIEGaKIlqInfsh5Mo%2FLaF%2B8ZLwBKLChG9VUJuYkCe%2BAoU6RkimaWKk7djlzdQBdnlTMdijfRqtVhn6wr6Vx7EjhNvVFEyVe%2FFmoK%2FCL4DODexBrIA%2BN4flXxUoqy%2FFcWmA1Ph9XxddBpbKM4AA%2BJKwClwbUj93JYC%2Bs75OqrEf8HX8ISwZf3cytIsLh13NOZEjlaSgDx6Ad3Vb%2BGRVBX%2FopeQJj18cOSPScdPcTj455UYrEMsyIReSyPdpZedxF1ENMoEe9fsMDc10dIro5Xv4oN%2BEy0OEA6M4yZrJu7u6Grnpb30iZI8TCk7FazjAKp8XKfdK%2FdPs69o12Ue1%2BoLTv40Sxq4Ej4%2FrsTQahh3V7%2FE129MJ7409AGOqUBUcGMV4lsRRKIYn9cihjPBfAikIvTqHeEwUT912%2B37bTANgf4ShyebSUDwe3Q7%2ByYY4YfuW7srMWS5yVMk9%2BE6Jn9sVN4CJFTshFg8zi%2FuJeTQ8XbD9hjuq9KxcuwEkNYk%2BynaytdKTE%2Bi5CU4aj57LMxTU6YiHBuIaEFvj9x%2BH2WWQMRR1PE6UXJ9o2z%2BbmiiAexbseua8xoGK3lcggNGV7wsnC9&X-Amz-Signature=5623e770c3eec04a73d2b623d06a0fc80fc0e4f5197c2e0bbb9bcce4db9425e6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
