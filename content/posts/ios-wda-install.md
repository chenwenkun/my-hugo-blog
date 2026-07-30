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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QBWOV4VM%2F20260730%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260730T012156Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCTt3Cz4yYDxoRND9NJNZUJkc8cFu%2F1Q2TF4T0QDqpqKQIgXyCpA3tsnHJq9wUPLp%2FV0oYFUlzrdoIEtHIyt3Zs92IqiAQIif%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFIF%2FvawGOWBs6ITGSrcAxawL%2B9Nh%2B2GTvK9j9%2FGfDLrJvoQpE%2FNeBM7E01D54rJlWDKENa1hA4JbyGjJPLyKNBk696Q%2BfZ0HCMoQYSuAsD%2FTkoNt9QRt7ORxCP%2BmNPoXVx3qmr02XjvEDqA3%2Fh%2BDew7yxGjOQgEuimQVJiK%2Bm2hWHgZUAI5JH%2BLfURQK1PlD5fzD65dcZ5LXKzFbYgO4IfkCkZeSmIQ%2BQ%2FLaQcqCgLPHC8PKg7hPKNvFKjGxiEnkuzjxHKX00CBmsqM2i5bILOxIuXL78Ww%2BeVKdy4eq%2FC%2BbhFz0mnPYXPuR%2FXpECZ8gz9AMrqV9evT3OiJ0w5%2B%2BrSyuNvwNGAZhBy1iOYpm0F7v6RubQc%2FdGs6Onqb2Lh8sKhmyG5LwgZtCgEW8T2ioBVQ7jemDQqi9oipv2n7FZojW2HtPQ8upWLJFT%2F%2FmEtxCZkqjnFIlSI9F9lMyy8v%2B%2Fbsju8yZCIFh0DcuV2xbG4n7EkMn3O%2FS3b%2B6XM2GQI9wqt%2FmRex5Ndlxc1wJTI10Gf9Shq3w2%2Bl7yHSivE3LH2gv%2BSx1OZKYfMEmrBpMkvmfFF2wTO9X1Tctv8Cq%2Ffrqz4fNuqH6Y%2FUSUcfJGzqwny8rQXyns6c6598IbkHDD2qIg0L%2FU%2FQ3d1HsBXOMPmmqtMGOqUBwG5ZEX080ZRrXU6vaAso8arzk4FppVV74JYrxEVzfv6glztAQJLj1Ma%2FKBVPI6qI9exmf%2FCBri2Wv67fs3lwEOyjFHz8C1bUXdXzVKdJpIe4MnxCRhu9v5sb9v0RuNBnF8gmRi36U3WyvMxd7SKsJMM3yYIDjP6XlA21uF0VG%2BYKxWfsT96WxiacLfEV4fn%2F7DGTKOMQdubijXoaSJEZLEJb80VA&X-Amz-Signature=d4163885161991feb6d5485b14e6ab5b096a4c1ded091ddb0e9a4a29fa46577c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QBWOV4VM%2F20260730%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260730T012156Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCTt3Cz4yYDxoRND9NJNZUJkc8cFu%2F1Q2TF4T0QDqpqKQIgXyCpA3tsnHJq9wUPLp%2FV0oYFUlzrdoIEtHIyt3Zs92IqiAQIif%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFIF%2FvawGOWBs6ITGSrcAxawL%2B9Nh%2B2GTvK9j9%2FGfDLrJvoQpE%2FNeBM7E01D54rJlWDKENa1hA4JbyGjJPLyKNBk696Q%2BfZ0HCMoQYSuAsD%2FTkoNt9QRt7ORxCP%2BmNPoXVx3qmr02XjvEDqA3%2Fh%2BDew7yxGjOQgEuimQVJiK%2Bm2hWHgZUAI5JH%2BLfURQK1PlD5fzD65dcZ5LXKzFbYgO4IfkCkZeSmIQ%2BQ%2FLaQcqCgLPHC8PKg7hPKNvFKjGxiEnkuzjxHKX00CBmsqM2i5bILOxIuXL78Ww%2BeVKdy4eq%2FC%2BbhFz0mnPYXPuR%2FXpECZ8gz9AMrqV9evT3OiJ0w5%2B%2BrSyuNvwNGAZhBy1iOYpm0F7v6RubQc%2FdGs6Onqb2Lh8sKhmyG5LwgZtCgEW8T2ioBVQ7jemDQqi9oipv2n7FZojW2HtPQ8upWLJFT%2F%2FmEtxCZkqjnFIlSI9F9lMyy8v%2B%2Fbsju8yZCIFh0DcuV2xbG4n7EkMn3O%2FS3b%2B6XM2GQI9wqt%2FmRex5Ndlxc1wJTI10Gf9Shq3w2%2Bl7yHSivE3LH2gv%2BSx1OZKYfMEmrBpMkvmfFF2wTO9X1Tctv8Cq%2Ffrqz4fNuqH6Y%2FUSUcfJGzqwny8rQXyns6c6598IbkHDD2qIg0L%2FU%2FQ3d1HsBXOMPmmqtMGOqUBwG5ZEX080ZRrXU6vaAso8arzk4FppVV74JYrxEVzfv6glztAQJLj1Ma%2FKBVPI6qI9exmf%2FCBri2Wv67fs3lwEOyjFHz8C1bUXdXzVKdJpIe4MnxCRhu9v5sb9v0RuNBnF8gmRi36U3WyvMxd7SKsJMM3yYIDjP6XlA21uF0VG%2BYKxWfsT96WxiacLfEV4fn%2F7DGTKOMQdubijXoaSJEZLEJb80VA&X-Amz-Signature=4f5334a034d06f59c180acd34a79d37f6a083d0ed777910c47b36395c69cb0cc&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
