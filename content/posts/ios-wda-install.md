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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SUWV7FWK%2F20251210%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251210T122347Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAwaCXVzLXdlc3QtMiJHMEUCIFquhZSFOj7vx7p8t6evQOqol%2F%2F3rZP%2BHHPxIpAkgijmAiEA0FIbz4bj7TduzA13U6MbsCpBN24Odcw1hTLCY9NPZZ0qiAQI1f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDGiNRmUaD0t8F9YZYSrcA7wLC9yqQxS5XBGsRYvrDUD%2BZ4KaNfwc4%2Fpr%2BedD%2FlHZDv1NYMYaE%2FP4vzkz6O821X%2FYPkXjsvNmfv8qQ3OtaXs4%2F2N7dVaC1rwyyAosIOGrRXMbYEHh%2BxBSkTC6zk6cmISCQTKjGiMvw4Q4APGr8OjDQdMpR3bCf1bqZfaB%2BdKjE4bUbq8U4guSR5QSKcBSnZPOYQ8pVrbeJc9PpsR0uHPqC%2FETxSZ4bIdxJ3G77azN1OrEmiHadieZRnFUC3%2BLWoi8UFL%2F1e1vebbNSHiRBJiykzu7yRQ1dUqBZV5HqAiSr631uDdPFPZu2S9%2B8%2Bm6w2O1WyfoOwOc6m8s9jii6N4OwHHvbY%2F2uK3tpCuxSpQZ5pZumqhXX5IO%2FbIPtfS3uV7UWvPn11WkGG38RB0%2FxeomXwVcLlsljVj4Fmo%2BMCUC1i81V0SOAA1h6U82jYdCMo8oLjz3IFHH8e6pjw6ywYMlPUA4DJDeuTlzMlXU87XGZ4yioEEdjssHAvwXkXXDhY30rRryO6SE4SijMZ4VfovNt0R5iiPaFqQTEjpyXZmJVxYsZBvbUY%2BRnLabsy2tSShY7%2BxzlRuta0KYQkxoncytsphV2LjPDycyNCKJ6VnqzuXFuwQUa62k8xCcMODE5ckGOqUBLzuvDdkTdwiTmda9tnKVvxfxqTy%2FnIQh0JByD9UloODuvDHjw4BjZ0i9%2FjjKUKZFqzCFu9QMPamFIM8Beq5xaJzImYjO5V%2FwZSsjBKL15OdQKitN1QU8sTUWDVQusyrqcvkJYNOdRDgz4TjFWDoouW15uGEWwSTO1ckQIPKGbvCc60ZJH0MWPpxiEm%2F23wudzUNVqiT5gtmmUyi%2F2MoeK%2BYtlgDe&X-Amz-Signature=72f7a7c8ce41b4d977aaaea1263631f85cea93fd26987e6bd09393444e91a089&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SUWV7FWK%2F20251210%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251210T122347Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAwaCXVzLXdlc3QtMiJHMEUCIFquhZSFOj7vx7p8t6evQOqol%2F%2F3rZP%2BHHPxIpAkgijmAiEA0FIbz4bj7TduzA13U6MbsCpBN24Odcw1hTLCY9NPZZ0qiAQI1f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDGiNRmUaD0t8F9YZYSrcA7wLC9yqQxS5XBGsRYvrDUD%2BZ4KaNfwc4%2Fpr%2BedD%2FlHZDv1NYMYaE%2FP4vzkz6O821X%2FYPkXjsvNmfv8qQ3OtaXs4%2F2N7dVaC1rwyyAosIOGrRXMbYEHh%2BxBSkTC6zk6cmISCQTKjGiMvw4Q4APGr8OjDQdMpR3bCf1bqZfaB%2BdKjE4bUbq8U4guSR5QSKcBSnZPOYQ8pVrbeJc9PpsR0uHPqC%2FETxSZ4bIdxJ3G77azN1OrEmiHadieZRnFUC3%2BLWoi8UFL%2F1e1vebbNSHiRBJiykzu7yRQ1dUqBZV5HqAiSr631uDdPFPZu2S9%2B8%2Bm6w2O1WyfoOwOc6m8s9jii6N4OwHHvbY%2F2uK3tpCuxSpQZ5pZumqhXX5IO%2FbIPtfS3uV7UWvPn11WkGG38RB0%2FxeomXwVcLlsljVj4Fmo%2BMCUC1i81V0SOAA1h6U82jYdCMo8oLjz3IFHH8e6pjw6ywYMlPUA4DJDeuTlzMlXU87XGZ4yioEEdjssHAvwXkXXDhY30rRryO6SE4SijMZ4VfovNt0R5iiPaFqQTEjpyXZmJVxYsZBvbUY%2BRnLabsy2tSShY7%2BxzlRuta0KYQkxoncytsphV2LjPDycyNCKJ6VnqzuXFuwQUa62k8xCcMODE5ckGOqUBLzuvDdkTdwiTmda9tnKVvxfxqTy%2FnIQh0JByD9UloODuvDHjw4BjZ0i9%2FjjKUKZFqzCFu9QMPamFIM8Beq5xaJzImYjO5V%2FwZSsjBKL15OdQKitN1QU8sTUWDVQusyrqcvkJYNOdRDgz4TjFWDoouW15uGEWwSTO1ckQIPKGbvCc60ZJH0MWPpxiEm%2F23wudzUNVqiT5gtmmUyi%2F2MoeK%2BYtlgDe&X-Amz-Signature=1282aa476e926df154f634c8f600c36e12c5ae5076908bc74671674888e4549c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
