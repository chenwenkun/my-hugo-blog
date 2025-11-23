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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U4WZMJVM%2F20251123%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251123T010038Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGkaCXVzLXdlc3QtMiJHMEUCIDhwgD4Ys3omY%2FQIoqLHeVR9qmn5jPkUPS39lXlncDNNAiEAnn2HXUp4J1Rk0cqV%2B6N5TZ3ri%2Fy1whTxwe80HMPgHD0q%2FwMIMhAAGgw2Mzc0MjMxODM4MDUiDIOjdX6Re7gN%2FhA30yrcA0dGuE%2FINhTArNwDfb2zbktSmTuXt7im3HelgtVT4EQuuFGK33I7U3Xk9nTCG8NAeUGlNsoeCQt%2BY13uPWRmnJu63E0rNN932JoVFAHsiAaIhScBE5%2BTKauez8fi2v7aSWomQY8eCqzVDb7c9gx1cTGs4AGTftPHy7BHzGdhmcjgDYY9EXKEggMozootbRrXEHfzmM43KoCXnkXcp61jWFPJ7qR8b2fSEFrpoweX%2Bb75PLur7oa4nHtinHK40pMsK3OSqeZKhyLkX0DuKxMXJy3g%2BOf8f5DzSVqFQ1aQiVnyxGA6dBjQI0sze%2BvllBAsx%2Fen3prvmBIeKiCHXYtEHKcTP7%2FJcaHnJi2uumipOcMUy7cmKwq2i9QaXYd5uEYwz6s48R6VGwqTzJBftOxS9%2BOzplfRC5P8lYX%2F1J5mosLbrwlX5U9hvkjOxNuomBoY%2F7pisMpieyUNSXj2JgQ56jKLUw3eQGMtEmdZDY6EtUlkfu4MWS%2FwNUQO5GshH4ywbtwpubxe32VD6IlfzLfkpelkx%2FLMwGlrj5PMGF5xYTVE8Bh%2BQxoIGg5vU6i5fiIUbXjLj2oItgNmAB%2FEmV4DcW0TVBI300iOIpnorcf9mIQxmhrvvzi1U7sG23%2FSMIOxickGOqUBNRQzLTd3%2FEm9XScyVzoR137WwYcZ0QAWb9gwK6%2BEV7%2FWknFBMfgEXx%2FS8Ne0wgjaDQM14XCRrsXO5U3YgQe1eZ%2FC5SRW7NsLZ4qgteVimaG9LsH1FjCPsF6eLOmdtekEeLLEKcXsCkathd7vPWku%2F4q66brvfLWJh%2FWZKPJeooEwRrO4Lb9ig8Vqp3g%2FDtBhc3X3e0A%2FI8dNGJiqPCK9Ij9Cy0Iv&X-Amz-Signature=4b2580c63cc4c0c79e11bdd24ac0bc68c636f450327b0b63c1035dc553c2ea8a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U4WZMJVM%2F20251123%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251123T010038Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGkaCXVzLXdlc3QtMiJHMEUCIDhwgD4Ys3omY%2FQIoqLHeVR9qmn5jPkUPS39lXlncDNNAiEAnn2HXUp4J1Rk0cqV%2B6N5TZ3ri%2Fy1whTxwe80HMPgHD0q%2FwMIMhAAGgw2Mzc0MjMxODM4MDUiDIOjdX6Re7gN%2FhA30yrcA0dGuE%2FINhTArNwDfb2zbktSmTuXt7im3HelgtVT4EQuuFGK33I7U3Xk9nTCG8NAeUGlNsoeCQt%2BY13uPWRmnJu63E0rNN932JoVFAHsiAaIhScBE5%2BTKauez8fi2v7aSWomQY8eCqzVDb7c9gx1cTGs4AGTftPHy7BHzGdhmcjgDYY9EXKEggMozootbRrXEHfzmM43KoCXnkXcp61jWFPJ7qR8b2fSEFrpoweX%2Bb75PLur7oa4nHtinHK40pMsK3OSqeZKhyLkX0DuKxMXJy3g%2BOf8f5DzSVqFQ1aQiVnyxGA6dBjQI0sze%2BvllBAsx%2Fen3prvmBIeKiCHXYtEHKcTP7%2FJcaHnJi2uumipOcMUy7cmKwq2i9QaXYd5uEYwz6s48R6VGwqTzJBftOxS9%2BOzplfRC5P8lYX%2F1J5mosLbrwlX5U9hvkjOxNuomBoY%2F7pisMpieyUNSXj2JgQ56jKLUw3eQGMtEmdZDY6EtUlkfu4MWS%2FwNUQO5GshH4ywbtwpubxe32VD6IlfzLfkpelkx%2FLMwGlrj5PMGF5xYTVE8Bh%2BQxoIGg5vU6i5fiIUbXjLj2oItgNmAB%2FEmV4DcW0TVBI300iOIpnorcf9mIQxmhrvvzi1U7sG23%2FSMIOxickGOqUBNRQzLTd3%2FEm9XScyVzoR137WwYcZ0QAWb9gwK6%2BEV7%2FWknFBMfgEXx%2FS8Ne0wgjaDQM14XCRrsXO5U3YgQe1eZ%2FC5SRW7NsLZ4qgteVimaG9LsH1FjCPsF6eLOmdtekEeLLEKcXsCkathd7vPWku%2F4q66brvfLWJh%2FWZKPJeooEwRrO4Lb9ig8Vqp3g%2FDtBhc3X3e0A%2FI8dNGJiqPCK9Ij9Cy0Iv&X-Amz-Signature=8765405edc02f169cfa56c64585c0e56f66f255024d310f30a24201401e22833&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
