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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WWLUH6A3%2F20251222%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251222T062007Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECYaCXVzLXdlc3QtMiJHMEUCIQDGVboccfRvl638x35FDYdzccENrMKDpt57Uc5tzcdbkgIgSb4NlIcLXqxW1Pfe3EFc3GYzSorBQN7jFaAkqVf05FcqiAQI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDGIc19qL2GXJ7pJ3cyrcA6Q%2FHo%2FvsGUjpfuaYudsCtg4pdcEBCpqluMO5IOe8%2FSIFtBDeMBYOmR1rPZrXfLi7niI1DPtp7veiKUK7XlpN446tF3HUa%2F9AWJEW021JJztL7UHVDOTF5o4UBeEoV0kQ3%2BSICoVbb5v8C5rUehVnl2v1JLxqs00QIobo1uPyVbh1koFoJ7ZypmYPmVoYAisawqernQi%2FYsY%2Fr8FGLh5KxtNrCil6Ui1wE7B5iJD5cWpEZziJ%2BCOjINpZxbrYuHaflfCRuK1ciu3S9%2BXM0QC9SGWzbaVjkfCCK3duCOSPQF1nV3lhZrznISUtqccNKQ9fKXZPNeguw1fvfsfMD1u278Mmbzk%2F7WzuVWHbZ5kyl%2FXYJdeyTUvDnijPm6Lf0%2FjCG0bivgvgmxnqXALdNj5OdV9J9z1LDS3ZyjkqyWeSj5Sgb%2FSqQXCVvygUZFaIs5fZo67%2Bnijy8zLtxUCODhIIRv%2Bhm3kKdQA3n4oe0ffMTEEyijuNa93hDVpdZYwDci0UFWp2B9uAzyWcdDyX5VnEHa4uHQpSqjGHvDL37zArD2ixCxxdoa1aL%2Bke2IDSOejthHqqJMbf%2FjGIO6s3BvyALJmutTGfwueyUXBM5ZCYKxUp0MGCCtSh5B9ij8WMPy9o8oGOqUBmurlUbN1E1aRRVddyi140rfasGazXzmD5sIkocAR79Te9mKzc6wLX7VA%2FrmvNXJ8y0UF1hqUoI9IYZh%2Fi826PHdlZLPSQSP5DHGCHpK%2Fbc8AD0%2Br4FFH%2BuU4IxoFzCjUy%2FWbmdbqIRx83HyBjLzDVgm900kXnUOcgKuIhy4pbBtormBgdA6VCrhmyEWYp66JjsRqlZw%2B5BwBkn%2FiFSIcgoY8Fs1G&X-Amz-Signature=8f996b3e78c23bc717edaf5ff200e7cf15e1569256e9ece93c1253a8a0d35cba&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WWLUH6A3%2F20251222%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251222T062008Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECYaCXVzLXdlc3QtMiJHMEUCIQDGVboccfRvl638x35FDYdzccENrMKDpt57Uc5tzcdbkgIgSb4NlIcLXqxW1Pfe3EFc3GYzSorBQN7jFaAkqVf05FcqiAQI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDGIc19qL2GXJ7pJ3cyrcA6Q%2FHo%2FvsGUjpfuaYudsCtg4pdcEBCpqluMO5IOe8%2FSIFtBDeMBYOmR1rPZrXfLi7niI1DPtp7veiKUK7XlpN446tF3HUa%2F9AWJEW021JJztL7UHVDOTF5o4UBeEoV0kQ3%2BSICoVbb5v8C5rUehVnl2v1JLxqs00QIobo1uPyVbh1koFoJ7ZypmYPmVoYAisawqernQi%2FYsY%2Fr8FGLh5KxtNrCil6Ui1wE7B5iJD5cWpEZziJ%2BCOjINpZxbrYuHaflfCRuK1ciu3S9%2BXM0QC9SGWzbaVjkfCCK3duCOSPQF1nV3lhZrznISUtqccNKQ9fKXZPNeguw1fvfsfMD1u278Mmbzk%2F7WzuVWHbZ5kyl%2FXYJdeyTUvDnijPm6Lf0%2FjCG0bivgvgmxnqXALdNj5OdV9J9z1LDS3ZyjkqyWeSj5Sgb%2FSqQXCVvygUZFaIs5fZo67%2Bnijy8zLtxUCODhIIRv%2Bhm3kKdQA3n4oe0ffMTEEyijuNa93hDVpdZYwDci0UFWp2B9uAzyWcdDyX5VnEHa4uHQpSqjGHvDL37zArD2ixCxxdoa1aL%2Bke2IDSOejthHqqJMbf%2FjGIO6s3BvyALJmutTGfwueyUXBM5ZCYKxUp0MGCCtSh5B9ij8WMPy9o8oGOqUBmurlUbN1E1aRRVddyi140rfasGazXzmD5sIkocAR79Te9mKzc6wLX7VA%2FrmvNXJ8y0UF1hqUoI9IYZh%2Fi826PHdlZLPSQSP5DHGCHpK%2Fbc8AD0%2Br4FFH%2BuU4IxoFzCjUy%2FWbmdbqIRx83HyBjLzDVgm900kXnUOcgKuIhy4pbBtormBgdA6VCrhmyEWYp66JjsRqlZw%2B5BwBkn%2FiFSIcgoY8Fs1G&X-Amz-Signature=0a83aa7610c95507700a6a3aea4301a105c006091e074fa3a7d68d7213683071&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
