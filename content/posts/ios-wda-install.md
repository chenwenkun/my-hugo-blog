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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RDDBUINA%2F20260414%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260414T185819Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAQqhi7Dv9w%2BVFJlkcHX6vNlIFwRwMhZbalnrJHrqxc%2FAiBHaQKP4lNQ8IzSfP61Jqlo8vVsjjv3taPJT1Px%2BQ3vESqIBAiT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM69ruDqpNzAtlXo2zKtwDFzcK5eh%2BtYX4uoHCN%2F4FeVwyNbEa26y3Ioe1GYIOglAz6dLDg%2BrKkBGbmJsmhPRi0Rc5usk0NWDNi2NyV7HSM%2Fm6DbM00K7MKCrL8LvSl0pdlYcjSA%2BfpAGBHQxWxrYG9nvVjKR8eG8dv6cMOOXcKLqgrnsV7UtR8KT%2BL31S1%2BqLld24cYlNeI3q%2Bx6rFRUeKmovvvvP1SOZfE%2BjdNmloowF7YHHHBgFmOuJqU%2B5etIVbz%2BWbo4vOEQsxf7u5U%2BnFR%2BI82eO3cHnA3j2aBq%2FeRQdRQey8aJMgQ2C4LL2U6EdJub%2Bx%2FB7bpWMWHJu10RB5UFJEF0vToxqGkLkPq3BM5IvCG6FaiLezhoJZZNdWE6ni8EM1RM7ulsGsSjzS7WY8Xg14eKvgLhBEN934Za1ygtgiRoCA8JXz6Uo8obd5%2FaaQTB1%2BEDzDh1uAWjMR0nOsm3Jq%2FS6j%2FqgSClqEo8qlcXEbyl8yrrwwWyHv%2FxYRwXtDv9re%2BMvu%2FmGRK0u69foigLU2RdtENS51tMlpWu7tpXPqPAmprtCZFoVneN6vu8bjIRBdKbQbsFqTOk30ugjdBKvNsF554CYueJRFCc8TKFAcfLNFl7TNURf%2B%2BNkINsFc2FQjZN93ClUoqgwofX5zgY6pgGBF0t40AEdXQ1m%2B7kDsXXSGzsoQ2ioLfSiD9qStoBSQ445nkLVMujKwRpBV1nhi6py9Skikwsriw5VT%2BAjSplnh%2BLBAy5Cd7dhOLKBhlDEB3ypjnZemzfaw85hEPlcSzE7mqEu2ku8BGrZPwF16e7D%2FrXBZF%2FBPPJ34UkkqhEmPfZgWnrUUvVP0C%2FvS%2FCGwPpkuSpOz1fecKK7E4oGryIIUASVXaPb&X-Amz-Signature=0781199c355298835e63d38acc3a58fbeaef966a13a89b9300c0d69c8fac9b1e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RDDBUINA%2F20260414%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260414T185819Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAQqhi7Dv9w%2BVFJlkcHX6vNlIFwRwMhZbalnrJHrqxc%2FAiBHaQKP4lNQ8IzSfP61Jqlo8vVsjjv3taPJT1Px%2BQ3vESqIBAiT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM69ruDqpNzAtlXo2zKtwDFzcK5eh%2BtYX4uoHCN%2F4FeVwyNbEa26y3Ioe1GYIOglAz6dLDg%2BrKkBGbmJsmhPRi0Rc5usk0NWDNi2NyV7HSM%2Fm6DbM00K7MKCrL8LvSl0pdlYcjSA%2BfpAGBHQxWxrYG9nvVjKR8eG8dv6cMOOXcKLqgrnsV7UtR8KT%2BL31S1%2BqLld24cYlNeI3q%2Bx6rFRUeKmovvvvP1SOZfE%2BjdNmloowF7YHHHBgFmOuJqU%2B5etIVbz%2BWbo4vOEQsxf7u5U%2BnFR%2BI82eO3cHnA3j2aBq%2FeRQdRQey8aJMgQ2C4LL2U6EdJub%2Bx%2FB7bpWMWHJu10RB5UFJEF0vToxqGkLkPq3BM5IvCG6FaiLezhoJZZNdWE6ni8EM1RM7ulsGsSjzS7WY8Xg14eKvgLhBEN934Za1ygtgiRoCA8JXz6Uo8obd5%2FaaQTB1%2BEDzDh1uAWjMR0nOsm3Jq%2FS6j%2FqgSClqEo8qlcXEbyl8yrrwwWyHv%2FxYRwXtDv9re%2BMvu%2FmGRK0u69foigLU2RdtENS51tMlpWu7tpXPqPAmprtCZFoVneN6vu8bjIRBdKbQbsFqTOk30ugjdBKvNsF554CYueJRFCc8TKFAcfLNFl7TNURf%2B%2BNkINsFc2FQjZN93ClUoqgwofX5zgY6pgGBF0t40AEdXQ1m%2B7kDsXXSGzsoQ2ioLfSiD9qStoBSQ445nkLVMujKwRpBV1nhi6py9Skikwsriw5VT%2BAjSplnh%2BLBAy5Cd7dhOLKBhlDEB3ypjnZemzfaw85hEPlcSzE7mqEu2ku8BGrZPwF16e7D%2FrXBZF%2FBPPJ34UkkqhEmPfZgWnrUUvVP0C%2FvS%2FCGwPpkuSpOz1fecKK7E4oGryIIUASVXaPb&X-Amz-Signature=cb5dbf16c769d06865d803b026cfdbc9b8eb11c291d4753ddda51c30190a0e63&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
