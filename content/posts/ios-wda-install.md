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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZHPU2EJX%2F20260119%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260119T122637Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCID6VXMK%2BfLlX5SPnw%2B0j07jJwTApjrBiqWsxIF7wwEeaAiEA3HSiI6W2JVO3bNd1qlTd5i4Lj02R%2F6%2F5fqOFrLu%2Btc8qiAQIlf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJF2dTWadvZMUX1uOyrcA96seDbyDSkzZ5qVffV8w6KJvGpIMtVEMHsT93CdljNOubl8zppAm8GlX8bA6w22lNBui%2BpJDPo1uLfVy30IUD9mrQ0EtC6MkK%2FIRoP41BgYhoGFy%2FRacEq%2Bsk3AsY49sOY6Wx8Fl8v%2BKPOyI7k2501kNX6he1Wg6TKHLGDMQP16fcIFJqcJcbj7vd9jRQjyjb%2Fis3JzSKeC7cviFfFHnzv3Is984zDvk1YZ4J9dCTJ3LjyQMuxKDlvBkpHofm%2FrGZ7%2FWi1o%2BEbM2LDQQdppIXxrd0rQTIK2dcCeW5orVWKMXR8Xi%2BJql1I3v%2FHXxL8om92ktyv2URC9b%2BazC0Juf4C6Gj4UrF1%2B4Zh5LVyAX7eF37r4qxgxGR6qmrrby8sYnjvZMPUGH7%2BMKtyh3UKiCsugEwbT5t%2F%2B0iOUaRxhgY3LfgWwIdSX58SRK8AsCczoVGR3Iry53kV4ZxcxM44P1x%2FPEGYgvJUdjgmSjwqfMsyXj5cBiDdcR792TujI7tr7vwl4JFyTZcQ2o46jvzb8G7Qk0jyTIob1scFkIXg3xmLDSt8K6gLDIo4NkkHyyiqxESQ9k2ZTol5fOqY6zABygyUwj9yPLvPaOoclWjFw0gyBfqymUr1UnuQSEBRmMJKyuMsGOqUBjXu%2BgnlI%2FM%2Bq8BzeePgQjvDHhg%2FVu%2F%2FoikPaRDTdmEcVuGsP6FCyjZR9d1N3rq9LQBoLJ4w2C1ZJLCNTygtTxxinSPcOhTJQkydNbwM8SxC3WXs4jdA%2F2wnVTSYQL5RMwkp9qJxIS8Jhxowq%2By%2BNQmI8UfWHC%2F8nWtoOnP8Vdx4RO05%2BHYhwx72%2BWRwpIkC8cbzldxDrn%2Brgo1aqrD1%2B9CbHkkND&X-Amz-Signature=83ab5a6831a9ecf6290e23ba24cee108e07bec87b7188c18b25381027fb9da58&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZHPU2EJX%2F20260119%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260119T122637Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCID6VXMK%2BfLlX5SPnw%2B0j07jJwTApjrBiqWsxIF7wwEeaAiEA3HSiI6W2JVO3bNd1qlTd5i4Lj02R%2F6%2F5fqOFrLu%2Btc8qiAQIlf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJF2dTWadvZMUX1uOyrcA96seDbyDSkzZ5qVffV8w6KJvGpIMtVEMHsT93CdljNOubl8zppAm8GlX8bA6w22lNBui%2BpJDPo1uLfVy30IUD9mrQ0EtC6MkK%2FIRoP41BgYhoGFy%2FRacEq%2Bsk3AsY49sOY6Wx8Fl8v%2BKPOyI7k2501kNX6he1Wg6TKHLGDMQP16fcIFJqcJcbj7vd9jRQjyjb%2Fis3JzSKeC7cviFfFHnzv3Is984zDvk1YZ4J9dCTJ3LjyQMuxKDlvBkpHofm%2FrGZ7%2FWi1o%2BEbM2LDQQdppIXxrd0rQTIK2dcCeW5orVWKMXR8Xi%2BJql1I3v%2FHXxL8om92ktyv2URC9b%2BazC0Juf4C6Gj4UrF1%2B4Zh5LVyAX7eF37r4qxgxGR6qmrrby8sYnjvZMPUGH7%2BMKtyh3UKiCsugEwbT5t%2F%2B0iOUaRxhgY3LfgWwIdSX58SRK8AsCczoVGR3Iry53kV4ZxcxM44P1x%2FPEGYgvJUdjgmSjwqfMsyXj5cBiDdcR792TujI7tr7vwl4JFyTZcQ2o46jvzb8G7Qk0jyTIob1scFkIXg3xmLDSt8K6gLDIo4NkkHyyiqxESQ9k2ZTol5fOqY6zABygyUwj9yPLvPaOoclWjFw0gyBfqymUr1UnuQSEBRmMJKyuMsGOqUBjXu%2BgnlI%2FM%2Bq8BzeePgQjvDHhg%2FVu%2F%2FoikPaRDTdmEcVuGsP6FCyjZR9d1N3rq9LQBoLJ4w2C1ZJLCNTygtTxxinSPcOhTJQkydNbwM8SxC3WXs4jdA%2F2wnVTSYQL5RMwkp9qJxIS8Jhxowq%2By%2BNQmI8UfWHC%2F8nWtoOnP8Vdx4RO05%2BHYhwx72%2BWRwpIkC8cbzldxDrn%2Brgo1aqrD1%2B9CbHkkND&X-Amz-Signature=7201979b81290bf6838f4ab8f7c91cb7736e53025f932370745e8c7c27400eb7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
