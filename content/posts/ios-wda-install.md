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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466353DXEPN%2F20260509%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260509T125219Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBkaCXVzLXdlc3QtMiJHMEUCIQCCVJkE5fOqMtgCn3p8lfuY4xlnZXjWf85WhpcTsHlGMgIgebhbQBzjc%2FUhc68GCp5ts6vMj5VELAzI%2BYEsHygtoXYqiAQI4v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDGeBnkEaYISXgITbQSrcA7FBZqP2EnCkiVSV%2BNSdx7wEIDhj7Sc92xru6UHpuYL%2BHQjKOlrmflAn9rYz48FBgp6R0wmS8iw9O0AKudWZl2MfSs%2B7AgPhxmgS1OVBk8jNVlws49HwUZl9wFh0Xl2AEopVlQz%2BERboAcIuhl6hsFqmGi7gOhLaiFt2heSKsp5prdLf%2BPeMjh38GWV8KGfslnGFiZrU5%2FXGftW5eAIKJki9WJQ1NDoVMAC9J7VAMkfENKkptb5a0q8MbQlVTbqkpdD3hHg8KjGQqXLV4FnS46PkkVEIKciu7pj9hbvZTJ5%2BiEaa8Ihtw6MFY9zy3vCpu262%2FaC%2BqZDZgk0u4FNQshAC%2FbzGhLvNZCVYFHObaMroOkEhcuypro9KrMXNo1wIk%2B9H6WcEHm%2BxzO9KeE3raRebU2OF3G0cPv5YQ6l56PFTmgZ78xB0nGVm4WHlEB0WtyqBhqdut9vRu2Q%2BOg2TUM2NMNIOAG29Bo2%2FiuVDD%2BMa6ky7Ph8%2Ff%2Fq611ilTrxvVwPwZarBARDowCxPG6CwIWXS6Yf7oAxW9MpXsdJfC4pSKufnLZT3z18m76kncmV8icsiDY%2FfjEZI%2FsBas78XtZcKlW48mtczCy4H0lyLUcbKbFk9Amgjdbt3xg9QMMz2%2B88GOqUBNO9tKMdRScCptBh2Kb5uXEgKB5YtxWZrGjkB0j0tx9BACdXJAWXv1EjTOntwkTSEwiMe5Cd3fpnsEVmHP6xad%2Fn9%2BOAL7AgwErL68ujLhye%2F0IJwa7m1tEou6JGI8lD0LwWRWJKODhAm%2FB5hWR93HUQxv91PSsUE1q8VQV%2BcacNAM2ZBRWtX4hyk2w0SEKCOrvzgzb9wGtAn94wyMceCREZMzGaW&X-Amz-Signature=8d619095f947389617f615d78edb9c1cb699174eb19310570660cb1cd4f2fabf&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466353DXEPN%2F20260509%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260509T125219Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBkaCXVzLXdlc3QtMiJHMEUCIQCCVJkE5fOqMtgCn3p8lfuY4xlnZXjWf85WhpcTsHlGMgIgebhbQBzjc%2FUhc68GCp5ts6vMj5VELAzI%2BYEsHygtoXYqiAQI4v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDGeBnkEaYISXgITbQSrcA7FBZqP2EnCkiVSV%2BNSdx7wEIDhj7Sc92xru6UHpuYL%2BHQjKOlrmflAn9rYz48FBgp6R0wmS8iw9O0AKudWZl2MfSs%2B7AgPhxmgS1OVBk8jNVlws49HwUZl9wFh0Xl2AEopVlQz%2BERboAcIuhl6hsFqmGi7gOhLaiFt2heSKsp5prdLf%2BPeMjh38GWV8KGfslnGFiZrU5%2FXGftW5eAIKJki9WJQ1NDoVMAC9J7VAMkfENKkptb5a0q8MbQlVTbqkpdD3hHg8KjGQqXLV4FnS46PkkVEIKciu7pj9hbvZTJ5%2BiEaa8Ihtw6MFY9zy3vCpu262%2FaC%2BqZDZgk0u4FNQshAC%2FbzGhLvNZCVYFHObaMroOkEhcuypro9KrMXNo1wIk%2B9H6WcEHm%2BxzO9KeE3raRebU2OF3G0cPv5YQ6l56PFTmgZ78xB0nGVm4WHlEB0WtyqBhqdut9vRu2Q%2BOg2TUM2NMNIOAG29Bo2%2FiuVDD%2BMa6ky7Ph8%2Ff%2Fq611ilTrxvVwPwZarBARDowCxPG6CwIWXS6Yf7oAxW9MpXsdJfC4pSKufnLZT3z18m76kncmV8icsiDY%2FfjEZI%2FsBas78XtZcKlW48mtczCy4H0lyLUcbKbFk9Amgjdbt3xg9QMMz2%2B88GOqUBNO9tKMdRScCptBh2Kb5uXEgKB5YtxWZrGjkB0j0tx9BACdXJAWXv1EjTOntwkTSEwiMe5Cd3fpnsEVmHP6xad%2Fn9%2BOAL7AgwErL68ujLhye%2F0IJwa7m1tEou6JGI8lD0LwWRWJKODhAm%2FB5hWR93HUQxv91PSsUE1q8VQV%2BcacNAM2ZBRWtX4hyk2w0SEKCOrvzgzb9wGtAn94wyMceCREZMzGaW&X-Amz-Signature=2d8556e4e332294bd02ddad775af66ebc2f682f814b53cf1a08575de5ee9377d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
