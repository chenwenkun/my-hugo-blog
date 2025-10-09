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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SGHHPQCH%2F20251009%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251009T122128Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDsaCXVzLXdlc3QtMiJHMEUCIQC9g2NOntJYBhnTRao0Dw3mS7EC%2FUq9Yvl2H7ERjeXtugIgASAMkZVbOM%2BcQdtIBqOb1dsandD0JnV40M7ACokVMiwqiAQI1P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDHiRr9Z2Xm7GYtmulCrcA7n26G%2Fisg1BDlLtdND2WfkZY9dX5Ug1jsTtH2d3memjSQxE3KbwscomCU7LGB8FIhBH0TplYA4lAgEqcUmHO3gNsR%2F7D2XbKF5oRous00yIN8b56LKPPhD5lV3uj3vAZTFkpYSDPjJV9Ep%2FpefiSQwArShplghZYmXIRZepvNpCh1IjUozUfRFth9TGKIvqevHUBGptFb4vx%2BphlKkADZLbuwgTmGpJTdZBn9V%2FoinwZWxzATXpKsA1%2FivO9IedO8aJ2BGxLCWJ3IQBMu8cAAg2228FomGVPvTmS21bnr8upjSV0PfGdufcazyCR7q8GAIrq3LiyjTleAT3ip5Ytnu9tNv7Zkq%2FlfA5X147C%2B0OPCV9KQ3ZqNh%2BOhF3HuJX1eD4mTXIIUBjStqdLHQ8X13v%2BrtpspdWKM7TIWJj8Zn4GwFu4gimROi00L02j1AeN8Kd7fouhb95Y8rhMufuw9myRktgvEX3efU9RKXwixqttR3xQ8ZYdGR8vCzCxSN%2Ffj0eEmNf3N2Pwslvb3thDF1exWCYDXu3Zj8HmNqKb72l%2BPy%2F9n8AaPGXgmfXq950%2FSjWOZrhrkpG3W8uIEiuUO0hSzpINVdqxj5whRmAg6zBk%2BPxTdGPXnvlWHjDMMqsnscGOqUBKAs%2FoaZQvE1ZpgZz1ilIqFqLkNnHBELhcFtNjg8xCuBKGhzOTDCCVBVpW%2BuuCjBBXLl%2Fvtd9uTUeudul6AD2%2BCH3T18%2FRg5C%2BbiwSSnTjVRn7GRb2XbGOdoE6t75McrOBjQ2tKdS5SFVBHgl4Ysd6UYjbkt1qiI0%2BWNGqY%2BjBoilsSnToodzIavrMrvIuqa3dcku9xYh66WjqCv3IFEpH5Fhixyc&X-Amz-Signature=74333bdde5602ffd60d37809362f83477a8b955247ba45c08724a149ac2c9d26&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SGHHPQCH%2F20251009%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251009T122128Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDsaCXVzLXdlc3QtMiJHMEUCIQC9g2NOntJYBhnTRao0Dw3mS7EC%2FUq9Yvl2H7ERjeXtugIgASAMkZVbOM%2BcQdtIBqOb1dsandD0JnV40M7ACokVMiwqiAQI1P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDHiRr9Z2Xm7GYtmulCrcA7n26G%2Fisg1BDlLtdND2WfkZY9dX5Ug1jsTtH2d3memjSQxE3KbwscomCU7LGB8FIhBH0TplYA4lAgEqcUmHO3gNsR%2F7D2XbKF5oRous00yIN8b56LKPPhD5lV3uj3vAZTFkpYSDPjJV9Ep%2FpefiSQwArShplghZYmXIRZepvNpCh1IjUozUfRFth9TGKIvqevHUBGptFb4vx%2BphlKkADZLbuwgTmGpJTdZBn9V%2FoinwZWxzATXpKsA1%2FivO9IedO8aJ2BGxLCWJ3IQBMu8cAAg2228FomGVPvTmS21bnr8upjSV0PfGdufcazyCR7q8GAIrq3LiyjTleAT3ip5Ytnu9tNv7Zkq%2FlfA5X147C%2B0OPCV9KQ3ZqNh%2BOhF3HuJX1eD4mTXIIUBjStqdLHQ8X13v%2BrtpspdWKM7TIWJj8Zn4GwFu4gimROi00L02j1AeN8Kd7fouhb95Y8rhMufuw9myRktgvEX3efU9RKXwixqttR3xQ8ZYdGR8vCzCxSN%2Ffj0eEmNf3N2Pwslvb3thDF1exWCYDXu3Zj8HmNqKb72l%2BPy%2F9n8AaPGXgmfXq950%2FSjWOZrhrkpG3W8uIEiuUO0hSzpINVdqxj5whRmAg6zBk%2BPxTdGPXnvlWHjDMMqsnscGOqUBKAs%2FoaZQvE1ZpgZz1ilIqFqLkNnHBELhcFtNjg8xCuBKGhzOTDCCVBVpW%2BuuCjBBXLl%2Fvtd9uTUeudul6AD2%2BCH3T18%2FRg5C%2BbiwSSnTjVRn7GRb2XbGOdoE6t75McrOBjQ2tKdS5SFVBHgl4Ysd6UYjbkt1qiI0%2BWNGqY%2BjBoilsSnToodzIavrMrvIuqa3dcku9xYh66WjqCv3IFEpH5Fhixyc&X-Amz-Signature=0b22232cc243c27e95657ba2a9a4316a7cb17a6d5f484c3df7bdc6d7052fb2cf&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
