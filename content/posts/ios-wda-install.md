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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XK3JN5OY%2F20251007%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251007T122134Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAwaCXVzLXdlc3QtMiJHMEUCICywPk2Oi%2F3XnFe1dc%2FIWpkf5AhMYHo2I%2FyEIa67yo9XAiEA9EBVnlUTxJ6t6jVW1ITK6USpH%2Bsff8vOUu%2B1gffCCiwqiAQIpf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJ98lNlxO2lH1UomZyrcA33AKkjvmbtJeDslqrGHgqJ%2F8KfMzHbbeBqz49Jk59%2FwNnDMCQ3Jk6gRmJyfgbGzQGjL8AZSFjDGeUuaSESEPVdrHf0C4PL1OdRQLf4AH4ijgx7RLazEVtv5wRPOG9G%2FHRkHuxt5iA1E8DqChZq5lZnO%2FSXxJ5pZ0jFEOypcO8sfVMU3KAqZZWaZX%2FAY3qCbLZiJXUjOkr2Vj8IAeqKay4T%2FpzvHCt2ZjZPxe%2FjUTeAsoFgif5l80HhorXF%2FiRKHcj2m%2ByXPWtSgWID8MJ4J2yszelaOua3jQdCeJ89IB5%2BQ%2FfzUju5nL1BZKzoH9PlLTfNyPgguLE%2B39c1fhekUkuWbxAVeVBuQZgnBtjnq3RJeW%2BB3r4BFD9U30UcjGNTgztCNafiXyCZ9HxFhm8haS8gfG7vlKkwiRqXw%2FNx0UH5vhybSMx0nHBP6UViRJGRysDxY5T435wngT0T9ufxGszgkQyHKRvuhW%2B9KryBFlQztcFbREIj%2FLYxWhpgtI0iRfLubp%2FFnCnKFWdCWChviBFlbyQRB6mlWElkGbmWNft1AcKQhWRDk%2F0zMb093aM1tExjc%2FBpkTpy2sReGCI2edLuXUKlsUr%2Ffb%2FGg3yAyb30pdzHfQXqD%2BGrcZtJdMIzzk8cGOqUBEFwxS5OWVv%2FelW0N9mYJVYgLKDByvIhMf%2FvebYJLGkQcP%2FOYLbbRt78joT9RufdlL6NcGbb6JLFdMzm4QkoqVuIWgGKJ%2F554fg%2B55KVczDkVJ69fU4qmrYi4hSnYCkx9sVmKLbFclmAuF1RjNEtLuaf8CyZuKy1g9x%2BDcGjXUkZybhSFMxShf9Tvxohd2xu64tZQb4NxpQ4s6tPE014hYGnR%2FF7r&X-Amz-Signature=9d224fbb0bd98ef3b50ae844a525adb8326acb9dcb03342e0de3149bc4acdc16&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XK3JN5OY%2F20251007%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251007T122134Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAwaCXVzLXdlc3QtMiJHMEUCICywPk2Oi%2F3XnFe1dc%2FIWpkf5AhMYHo2I%2FyEIa67yo9XAiEA9EBVnlUTxJ6t6jVW1ITK6USpH%2Bsff8vOUu%2B1gffCCiwqiAQIpf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJ98lNlxO2lH1UomZyrcA33AKkjvmbtJeDslqrGHgqJ%2F8KfMzHbbeBqz49Jk59%2FwNnDMCQ3Jk6gRmJyfgbGzQGjL8AZSFjDGeUuaSESEPVdrHf0C4PL1OdRQLf4AH4ijgx7RLazEVtv5wRPOG9G%2FHRkHuxt5iA1E8DqChZq5lZnO%2FSXxJ5pZ0jFEOypcO8sfVMU3KAqZZWaZX%2FAY3qCbLZiJXUjOkr2Vj8IAeqKay4T%2FpzvHCt2ZjZPxe%2FjUTeAsoFgif5l80HhorXF%2FiRKHcj2m%2ByXPWtSgWID8MJ4J2yszelaOua3jQdCeJ89IB5%2BQ%2FfzUju5nL1BZKzoH9PlLTfNyPgguLE%2B39c1fhekUkuWbxAVeVBuQZgnBtjnq3RJeW%2BB3r4BFD9U30UcjGNTgztCNafiXyCZ9HxFhm8haS8gfG7vlKkwiRqXw%2FNx0UH5vhybSMx0nHBP6UViRJGRysDxY5T435wngT0T9ufxGszgkQyHKRvuhW%2B9KryBFlQztcFbREIj%2FLYxWhpgtI0iRfLubp%2FFnCnKFWdCWChviBFlbyQRB6mlWElkGbmWNft1AcKQhWRDk%2F0zMb093aM1tExjc%2FBpkTpy2sReGCI2edLuXUKlsUr%2Ffb%2FGg3yAyb30pdzHfQXqD%2BGrcZtJdMIzzk8cGOqUBEFwxS5OWVv%2FelW0N9mYJVYgLKDByvIhMf%2FvebYJLGkQcP%2FOYLbbRt78joT9RufdlL6NcGbb6JLFdMzm4QkoqVuIWgGKJ%2F554fg%2B55KVczDkVJ69fU4qmrYi4hSnYCkx9sVmKLbFclmAuF1RjNEtLuaf8CyZuKy1g9x%2BDcGjXUkZybhSFMxShf9Tvxohd2xu64tZQb4NxpQ4s6tPE014hYGnR%2FF7r&X-Amz-Signature=eed8c27e38db935e9c286cbbba0f3a75d49194f3e5bba2b314998721eab7181e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
