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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZMBIZQC2%2F20260731%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260731T014901Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDBToWwhp1flj%2FRJzNcK%2FOILmvzpbDo2HiaBSdHVFUe%2BwIgBD48J%2BQEsPZXBfAxnTyMcy1uE9H8tiI8e%2FdHpenS0zcqiAQIov%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJwZGtOKfyA3U0c3CSrcA0hHg3KvMjRjI9nhM3%2FB%2FLTLQrV2rJA7HHguRhZMUwfIjrjWzfSqK8oenmZTaKGlVQWJcjRZ%2BjmBXI14KWQplFw49tKU25qX0FtaTCCD97WtxgNTaXlVdo5C4mX3xVJGIueAUOGTVRyhjJggeR1qVuX0t8XpAs8kkjjW5icW12eHodRoHCZ7NXCEUhB9cu7U2YaS85DaZj%2Bo4yN9CQjtAcWhpIe%2BUJHRbNdHQpTTmdk1sZ1SIBpIxetg%2BUb4NWlOuGJ9IlPTdHxzaVugX%2B8zJF07BFdbLN7oFnvApS8VCegTBFWr9v6UTnbnskMv%2Bg%2FXk%2FI32n0%2Bndui8HT2Sor692v5%2Figkk1OPex6Dp6Pk9ss2eoyRKRWS%2FMMlacMxcbG4wP5JVDNzxAr972WO%2FOzNFsGHym9IWiseCZWp1n0lA3IktdtSBo5Hu4sM7sxwkrg%2BMqe3ZHQjaJ05g6LtTqRQYNscJjUP60hFrQXge6ZN8%2Fie4U5TyWwehH%2FCkVRMYICLDgZ4waCuMIUhUl7sHBV71r54Cjl6fprchY%2Bkvn6xzAcBlaYDFifYq8R21tQ8IsPRqtsFb21IudKPSG6LK3KmSJR2JklQIJh%2B7g2BAthkurwbIyNRdVmh4wUUhB86MMDvr9MGOqUBJZS0h7DtfU5i55FHascrt09L6vkQ5sJ1FkPZYC7Z10C5wF3ZMeYhjdF7Lqww%2Fp%2FOp2vHDHLmOi1%2BucQS6n6YDxfyFAMKTkprysUVBjsJh3USITAWecuY0NScLYT9YKuK00m33h1yoBKm%2FiIEwiMptpB3SMjYRr6WMX0oLuZOUtE18qRp3d%2FDZVTpVDEPz%2B8V0ffO3YhMWr%2FTH%2FD4aKy54ZBJHQTB&X-Amz-Signature=cae07957c93970a24c9e4eae1f9ae49b585310b7efebbb89840d0ca805f6e418&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZMBIZQC2%2F20260731%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260731T014901Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDBToWwhp1flj%2FRJzNcK%2FOILmvzpbDo2HiaBSdHVFUe%2BwIgBD48J%2BQEsPZXBfAxnTyMcy1uE9H8tiI8e%2FdHpenS0zcqiAQIov%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJwZGtOKfyA3U0c3CSrcA0hHg3KvMjRjI9nhM3%2FB%2FLTLQrV2rJA7HHguRhZMUwfIjrjWzfSqK8oenmZTaKGlVQWJcjRZ%2BjmBXI14KWQplFw49tKU25qX0FtaTCCD97WtxgNTaXlVdo5C4mX3xVJGIueAUOGTVRyhjJggeR1qVuX0t8XpAs8kkjjW5icW12eHodRoHCZ7NXCEUhB9cu7U2YaS85DaZj%2Bo4yN9CQjtAcWhpIe%2BUJHRbNdHQpTTmdk1sZ1SIBpIxetg%2BUb4NWlOuGJ9IlPTdHxzaVugX%2B8zJF07BFdbLN7oFnvApS8VCegTBFWr9v6UTnbnskMv%2Bg%2FXk%2FI32n0%2Bndui8HT2Sor692v5%2Figkk1OPex6Dp6Pk9ss2eoyRKRWS%2FMMlacMxcbG4wP5JVDNzxAr972WO%2FOzNFsGHym9IWiseCZWp1n0lA3IktdtSBo5Hu4sM7sxwkrg%2BMqe3ZHQjaJ05g6LtTqRQYNscJjUP60hFrQXge6ZN8%2Fie4U5TyWwehH%2FCkVRMYICLDgZ4waCuMIUhUl7sHBV71r54Cjl6fprchY%2Bkvn6xzAcBlaYDFifYq8R21tQ8IsPRqtsFb21IudKPSG6LK3KmSJR2JklQIJh%2B7g2BAthkurwbIyNRdVmh4wUUhB86MMDvr9MGOqUBJZS0h7DtfU5i55FHascrt09L6vkQ5sJ1FkPZYC7Z10C5wF3ZMeYhjdF7Lqww%2Fp%2FOp2vHDHLmOi1%2BucQS6n6YDxfyFAMKTkprysUVBjsJh3USITAWecuY0NScLYT9YKuK00m33h1yoBKm%2FiIEwiMptpB3SMjYRr6WMX0oLuZOUtE18qRp3d%2FDZVTpVDEPz%2B8V0ffO3YhMWr%2FTH%2FD4aKy54ZBJHQTB&X-Amz-Signature=bcad0a774c91e4b1055260b0c43b79e3de1fce14ec9e40d66cd35fd31b78322e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
