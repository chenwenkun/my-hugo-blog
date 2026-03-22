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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46667NC4TUT%2F20260322%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260322T011437Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCqvu5%2Fj7mtkJ9f7Mpy0sArMBalcSx2nZFmmOfDHM%2BOhwIgFD%2FUgZwTC2n%2BQJJ5qmR%2BBsrUUxX0Vjq84yA2sz4cfyIq%2FwMIWRAAGgw2Mzc0MjMxODM4MDUiDKOIaShOl1iJRY%2BL9SrcA%2BWx26WUj9fCARUu7CQXiH9JLQx8MJ6lPegU6lqaeCw2NSbkNYcbKmzHMyH2XJCjbb1Cv0KNWQ5fiVZnSgxcEKyIxHcJbQ6Ys55mE9%2FCpqW45wsEj8YCfkF3GmSRQ3HA4RAXCsekjkuAEogEf%2Fm6Xs0Bp6RJQHhI3KM0yYvaJgmSLqQCKb%2BTN3p3v9zgDdiW%2FXluQ2VLBYkZNLitYY%2FDsLCGSNoIKKoYyKsDCFkkaA3l6QEKl%2BV%2BOgSlpmALKZBq3wkkLrDzgNUSPC3kxyBkSgm%2BoC0zO5hYEbG4v9%2BI7z5ZoGkEkYj3hHtixpfN2NB%2B0zqCAnBiNyuiGxrSIbMGDAlUlq1N7URJSRqbftdGyw43sXOd%2BoHQpyJL1TdQh33uFFD5a1U7kQ2F2aZBx%2FolbgZpPh5xapWkYZZ8ag8xTgkk8dj9aP7euEHylWgwL05X9BSrLjjm2HAM1oR2jj9MEgsSrT54f9mPSaK26%2BaBbtVCsH6vvq6U0nxM%2BpUBEGxJn38LK8G47vOJr7Ts3p117XYZb8CniocbnB4NRabHKpusE0JPOuYY8WMqiuYApqkSBMY30oOmwMFjaxgSNIPGlu10%2F%2FhRccCA%2F2fzRLBiJ0ydwIENoZ941GL7REQYMNbl%2FM0GOqUBLM4OYcDFtLI4QzE8fzPzPUicYzGfPZF4%2B3Y9jcpNGt3QlAYZKxd7S3WQY7uupxpuaiRRBc3BrgjJtUuGFbpPp%2BUeQyTFx5wPn%2BQdlskeKIz%2FiGP5iZOcTG6oHcUax9ZtzPJcvCUYjFZJnHn8bFHVTn7MhsHADUc2ea21W6BwXRoNGtgHeRTAf%2BZaAnW6CNBfGceA5KeZZ0ALvouE5yWrbyEJsYJM&X-Amz-Signature=309f13740b8caed585c958cfa7d9c4f0b2f4543ed9ede95468c9b168e9e89f5a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46667NC4TUT%2F20260322%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260322T011437Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCqvu5%2Fj7mtkJ9f7Mpy0sArMBalcSx2nZFmmOfDHM%2BOhwIgFD%2FUgZwTC2n%2BQJJ5qmR%2BBsrUUxX0Vjq84yA2sz4cfyIq%2FwMIWRAAGgw2Mzc0MjMxODM4MDUiDKOIaShOl1iJRY%2BL9SrcA%2BWx26WUj9fCARUu7CQXiH9JLQx8MJ6lPegU6lqaeCw2NSbkNYcbKmzHMyH2XJCjbb1Cv0KNWQ5fiVZnSgxcEKyIxHcJbQ6Ys55mE9%2FCpqW45wsEj8YCfkF3GmSRQ3HA4RAXCsekjkuAEogEf%2Fm6Xs0Bp6RJQHhI3KM0yYvaJgmSLqQCKb%2BTN3p3v9zgDdiW%2FXluQ2VLBYkZNLitYY%2FDsLCGSNoIKKoYyKsDCFkkaA3l6QEKl%2BV%2BOgSlpmALKZBq3wkkLrDzgNUSPC3kxyBkSgm%2BoC0zO5hYEbG4v9%2BI7z5ZoGkEkYj3hHtixpfN2NB%2B0zqCAnBiNyuiGxrSIbMGDAlUlq1N7URJSRqbftdGyw43sXOd%2BoHQpyJL1TdQh33uFFD5a1U7kQ2F2aZBx%2FolbgZpPh5xapWkYZZ8ag8xTgkk8dj9aP7euEHylWgwL05X9BSrLjjm2HAM1oR2jj9MEgsSrT54f9mPSaK26%2BaBbtVCsH6vvq6U0nxM%2BpUBEGxJn38LK8G47vOJr7Ts3p117XYZb8CniocbnB4NRabHKpusE0JPOuYY8WMqiuYApqkSBMY30oOmwMFjaxgSNIPGlu10%2F%2FhRccCA%2F2fzRLBiJ0ydwIENoZ941GL7REQYMNbl%2FM0GOqUBLM4OYcDFtLI4QzE8fzPzPUicYzGfPZF4%2B3Y9jcpNGt3QlAYZKxd7S3WQY7uupxpuaiRRBc3BrgjJtUuGFbpPp%2BUeQyTFx5wPn%2BQdlskeKIz%2FiGP5iZOcTG6oHcUax9ZtzPJcvCUYjFZJnHn8bFHVTn7MhsHADUc2ea21W6BwXRoNGtgHeRTAf%2BZaAnW6CNBfGceA5KeZZ0ALvouE5yWrbyEJsYJM&X-Amz-Signature=9985aefaf8fc1b24ec3ad157e017f3c374407b16edaecd30e9f2d012e36afe52&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
