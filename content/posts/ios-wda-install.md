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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664MVJPQCJ%2F20260430%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260430T131904Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEUaCXVzLXdlc3QtMiJHMEUCIQCDNwFNidSv5yYdIZFTsP%2Fq1zusrImWys11v9WDTTBj4wIgeC3IC2asWSI1HwU1DABZeZZsMiiY5VHaq3MXnp%2F6imkq%2FwMIDhAAGgw2Mzc0MjMxODM4MDUiDMSuR748Bca3P%2F8w7CrcA1tX22lC%2BUZoAudLUIIXd7RhmjJ6wdUbJNSDbXQoC8Z93qJ3Q9FY4F4CqpdkgCzkxBcH3NXIuFDi0NZPhnSqhQSlrmyZvHYCBrvmpGanNSW46XUggXuYWKo1HczAkgGJIy5iFHsoCP40Yy0gNI%2BW8yfEHr%2FtQqFWLefyyma%2FhBMQv3JmE0oWO25j2aM%2FwUX9h7mfz7YSExSW3Y%2Bl43o6ixyCy4%2F9pH%2ByRibQQ5E%2FfCUjAgaH769B5RoFUWyxQ%2B5wMNkPXL5cYI6soWuf93wudwKxPurK8xAVKXr5CH33%2FAfgkZ7uyobmu8T%2Fa5oQzh%2BxnPxkGCLVARzcJaUg6Q2KfltUpMggO2ccsyTnDsrNGNfBI7KsQwON58sZdfYLCjaLruKvPAgT8JiRNCVpK35Qc3jVARRB19knZKSQhqQSMlaj%2BRpFYz9%2Flo1DfVt459d9PKl2QMleT1vqGw9hK4e3Vu%2FpLCloMKI2n2LBBNkMwFhwpkLvZGs2Jsojg1v%2BMRABdqXSuIszAy9J26OHM0FgOLz387TU9UfQp9XhjmEJV7aL8yIhq%2FgBYPw8xap3lmAPVCwxFNqrXLoXdeG%2FWVLGGdln0Y6sUJHvaiDsExUL1eDS1XHfCNcBSqzrh42fMKiozc8GOqUBQhTzAGz2H3Gg1FtQGCayvkRml%2Bz5uZF18IIFVTPv6Ms4MHxNRgf0z9m%2FEq%2FNJsIQ3d3hRUxjNXkvkrnbuSheAWJWMLp5vmc7pbgiv3M2y3DdxWJkUCoVxsgAp6iEqNQ0tZ3auLAWgAQFHVscf4ABrBNzwx7d%2FFymHwbOXs63opw7JU%2Fp4u8s7%2B6egLtdtrR44WMP1kUv3CWyAF2mlUvCbPr6Hbwf&X-Amz-Signature=2b10309b0b73d162373058c31be53f5c516d001be34afab4ad5cda5bbcde9427&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664MVJPQCJ%2F20260430%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260430T131904Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEUaCXVzLXdlc3QtMiJHMEUCIQCDNwFNidSv5yYdIZFTsP%2Fq1zusrImWys11v9WDTTBj4wIgeC3IC2asWSI1HwU1DABZeZZsMiiY5VHaq3MXnp%2F6imkq%2FwMIDhAAGgw2Mzc0MjMxODM4MDUiDMSuR748Bca3P%2F8w7CrcA1tX22lC%2BUZoAudLUIIXd7RhmjJ6wdUbJNSDbXQoC8Z93qJ3Q9FY4F4CqpdkgCzkxBcH3NXIuFDi0NZPhnSqhQSlrmyZvHYCBrvmpGanNSW46XUggXuYWKo1HczAkgGJIy5iFHsoCP40Yy0gNI%2BW8yfEHr%2FtQqFWLefyyma%2FhBMQv3JmE0oWO25j2aM%2FwUX9h7mfz7YSExSW3Y%2Bl43o6ixyCy4%2F9pH%2ByRibQQ5E%2FfCUjAgaH769B5RoFUWyxQ%2B5wMNkPXL5cYI6soWuf93wudwKxPurK8xAVKXr5CH33%2FAfgkZ7uyobmu8T%2Fa5oQzh%2BxnPxkGCLVARzcJaUg6Q2KfltUpMggO2ccsyTnDsrNGNfBI7KsQwON58sZdfYLCjaLruKvPAgT8JiRNCVpK35Qc3jVARRB19knZKSQhqQSMlaj%2BRpFYz9%2Flo1DfVt459d9PKl2QMleT1vqGw9hK4e3Vu%2FpLCloMKI2n2LBBNkMwFhwpkLvZGs2Jsojg1v%2BMRABdqXSuIszAy9J26OHM0FgOLz387TU9UfQp9XhjmEJV7aL8yIhq%2FgBYPw8xap3lmAPVCwxFNqrXLoXdeG%2FWVLGGdln0Y6sUJHvaiDsExUL1eDS1XHfCNcBSqzrh42fMKiozc8GOqUBQhTzAGz2H3Gg1FtQGCayvkRml%2Bz5uZF18IIFVTPv6Ms4MHxNRgf0z9m%2FEq%2FNJsIQ3d3hRUxjNXkvkrnbuSheAWJWMLp5vmc7pbgiv3M2y3DdxWJkUCoVxsgAp6iEqNQ0tZ3auLAWgAQFHVscf4ABrBNzwx7d%2FFymHwbOXs63opw7JU%2Fp4u8s7%2B6egLtdtrR44WMP1kUv3CWyAF2mlUvCbPr6Hbwf&X-Amz-Signature=a1114ca54a98fc9fe86ac071cd7937b8d94c12f7f0dc362d6d5fbdd5ff33d44a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
