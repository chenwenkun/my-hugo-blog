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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YZM7KJA6%2F20251129%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251129T005218Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIEMZYvrXpD3RvDMqd7r0Z3uhPEIwY5kgYBHW00lrzd59AiEA%2ByMQtlczN43MDurmrkG16oO2iPSJ72OqbT%2Beog5hcxYqiAQIvf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNEabpe070haOMI%2BZSrcA2saE%2BNLpsEubWfYSRKir%2FG1DWg%2FELG1rpEYS8ncWeym9skaGUK3hOP0IUCn42sNQvdd4914JvEosbyn6dKh%2FQs3rcB%2B3gcvwpjo4jcuInZcpzfLEUBGKR1nn1Mkt8cFvdjXiFlGKvBbT2ryJu7126809Ez6Dwjq0TcHZDinQt0r0ac0d5TOlTMUUvdvmq%2Fi1KmGFCl1CeIHoR9GG3ZrjZ8vEcXkAqhDlSYpP3DVRWbqaGvjBmFz6Dxjh%2F5HxnnbwF7P0l1TQ%2F3zx0to6sHCwh5Ox0PaUDn%2BpOcZezFKv0XAO5ruuCvN6ZvF46N%2B%2FeIs0pf5F8g%2BoD2WQLOmNt0PIqPWVyAHxB%2FrzGYm9bUBeYZ%2FBhtVUSUzSG12GGOQF7TfQAsQLNkH6AK0KGlOwxPillZCRIOcV3RrfFwikciPF1LLH57XbpIahFHyT9yqwvsdkO%2Bu3q6k%2FGYuepyIkeES9p5rb%2F6An9FQFqnAGmJ65qjGvr5sfsZHmB587hIScTurqXuXnCmoV4FN%2BpATo%2BAexCCAzSuCM6sylfFL8HEMDiyFe0LMq815lgJNBDYzVf95eYzDfA1XaxpDXds0BHfNE4SCleNb0wpXD3ilRmVyT%2Fn8CY%2FX75o%2FgbgPvbAFMNPzp8kGOqUBAC6Jdk0op4JEcEBoW7IVGlpoQidgaSQYCnmxWJes5Q1SDAjUcMHzbyZn3D1MCXn%2FfigEM9QUNSjBEkkQV9Bx0HSvRpIvGqjCYcAT7SWJKlThNCjAkMZDPUD%2BduEgZUhHMnbW5I14AEAS2yAMUHPjKdhg4pl3kLIXCwbDJ9wmm3yrohwvzTZU5Fgg0Ptakmzkeute42dl4JGYgN5fBKUJSQsJ%2FJxS&X-Amz-Signature=957a236d3bc164c5aed03c5aaf8655b4d02da620abf69367d037f2a5a9912141&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YZM7KJA6%2F20251129%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251129T005218Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIEMZYvrXpD3RvDMqd7r0Z3uhPEIwY5kgYBHW00lrzd59AiEA%2ByMQtlczN43MDurmrkG16oO2iPSJ72OqbT%2Beog5hcxYqiAQIvf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNEabpe070haOMI%2BZSrcA2saE%2BNLpsEubWfYSRKir%2FG1DWg%2FELG1rpEYS8ncWeym9skaGUK3hOP0IUCn42sNQvdd4914JvEosbyn6dKh%2FQs3rcB%2B3gcvwpjo4jcuInZcpzfLEUBGKR1nn1Mkt8cFvdjXiFlGKvBbT2ryJu7126809Ez6Dwjq0TcHZDinQt0r0ac0d5TOlTMUUvdvmq%2Fi1KmGFCl1CeIHoR9GG3ZrjZ8vEcXkAqhDlSYpP3DVRWbqaGvjBmFz6Dxjh%2F5HxnnbwF7P0l1TQ%2F3zx0to6sHCwh5Ox0PaUDn%2BpOcZezFKv0XAO5ruuCvN6ZvF46N%2B%2FeIs0pf5F8g%2BoD2WQLOmNt0PIqPWVyAHxB%2FrzGYm9bUBeYZ%2FBhtVUSUzSG12GGOQF7TfQAsQLNkH6AK0KGlOwxPillZCRIOcV3RrfFwikciPF1LLH57XbpIahFHyT9yqwvsdkO%2Bu3q6k%2FGYuepyIkeES9p5rb%2F6An9FQFqnAGmJ65qjGvr5sfsZHmB587hIScTurqXuXnCmoV4FN%2BpATo%2BAexCCAzSuCM6sylfFL8HEMDiyFe0LMq815lgJNBDYzVf95eYzDfA1XaxpDXds0BHfNE4SCleNb0wpXD3ilRmVyT%2Fn8CY%2FX75o%2FgbgPvbAFMNPzp8kGOqUBAC6Jdk0op4JEcEBoW7IVGlpoQidgaSQYCnmxWJes5Q1SDAjUcMHzbyZn3D1MCXn%2FfigEM9QUNSjBEkkQV9Bx0HSvRpIvGqjCYcAT7SWJKlThNCjAkMZDPUD%2BduEgZUhHMnbW5I14AEAS2yAMUHPjKdhg4pl3kLIXCwbDJ9wmm3yrohwvzTZU5Fgg0Ptakmzkeute42dl4JGYgN5fBKUJSQsJ%2FJxS&X-Amz-Signature=c427db7c789a49fe72614666b81f60b174d279187cd0a16cba6f4ece51c44977&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
