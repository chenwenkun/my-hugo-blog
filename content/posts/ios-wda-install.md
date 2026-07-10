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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YRDWLTVJ%2F20260710%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260710T191402Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDzoqZAjZTQFndz3cPjdk%2FNaGOo%2ByBYqmm7ZUKlRo4VQAIgHYgCo3lluaN%2Bud7eYmfRYxScqYuciaPP5tMIwIcIy4kqiAQIu%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDPCBTtqA%2BiEgT86sFyrcA8OsEYhCeirQa7D4KSbOEm6UezyNVJdvOIUrfwPUCQVzjWnqMl1CyNvlG5WTbb1XGfO7QQCK9Zr1QhW88ZjesEBupoQEBwE0%2BwH7KOOxIgrHy4gOhTet4mqx0%2Fw%2FO1CZZ5XxA%2B1Hpbw2MnGqhhhxOcMJGzUxdVJ%2Fq%2Fj9w3e1cZEOn0joGF4XzDJccKW2jrE%2FFYr%2BD6mornhydVt9CjMUv3ji2aG4fO6K%2BNswMRQox2DVaasYDSB79F3CINSrzk3enmnxfkLJZPLMDGqk82KAw4Q%2Fk1U%2Fe9rlabJ0W32lkOICgAN6eCCFvRUcygU0wcNsit2p1wSSNC8BkYhQOL%2BVpRn0khUiPAal3dSuvma6Y6fx5ns%2FbufMFraiZeTRtfaYlgRElfdKzfaG8zL7jqKGE27P0OqX%2BOR9uLkbYBASWMxfTGdjs1HH2mGkIQkMMleJllJFbxyts%2BhzhxS9j3rnkjBCv%2FaIoGOUHNuCaYVh8UOZaNI6goi9vS%2Fsb2I44eeu11ILSp1fViZi7U9wOShlsD6dtll60RWEi6E9v4px%2BPlbNFabkoOlxCDzyJlwIvJESADY6Ca4%2BaLqInZ8FPk52Q1hz4j%2FQSQnaWa2cdbycOnWikBK2lQMBahICPMRMIfuxNIGOqUB8tsl0EJ315WEAbb6UdnDviZoW9SDhkMGjGYaXBVmIM4h4O71p70mdmFmn2Tnf31ONlUO%2B13KoV3I%2Fgbd3Zc7ZqIxZEWwDGZaarwPijsXaXCIXgYfeJr%2B2vE%2BuOotU3wikaUQaOr1e%2BZ%2BblEv67jqwXpf4ZZItCYWaVssek8FfhtdizLsCRjV6eXHW0yy50tuFIv8GhziPdVkO6%2F15Zvm5o15zz4c&X-Amz-Signature=781db704051a92796dc6a782d7659b1dfea8a01a87b5a25a9bad19458f446896&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YRDWLTVJ%2F20260710%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260710T191402Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDzoqZAjZTQFndz3cPjdk%2FNaGOo%2ByBYqmm7ZUKlRo4VQAIgHYgCo3lluaN%2Bud7eYmfRYxScqYuciaPP5tMIwIcIy4kqiAQIu%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDPCBTtqA%2BiEgT86sFyrcA8OsEYhCeirQa7D4KSbOEm6UezyNVJdvOIUrfwPUCQVzjWnqMl1CyNvlG5WTbb1XGfO7QQCK9Zr1QhW88ZjesEBupoQEBwE0%2BwH7KOOxIgrHy4gOhTet4mqx0%2Fw%2FO1CZZ5XxA%2B1Hpbw2MnGqhhhxOcMJGzUxdVJ%2Fq%2Fj9w3e1cZEOn0joGF4XzDJccKW2jrE%2FFYr%2BD6mornhydVt9CjMUv3ji2aG4fO6K%2BNswMRQox2DVaasYDSB79F3CINSrzk3enmnxfkLJZPLMDGqk82KAw4Q%2Fk1U%2Fe9rlabJ0W32lkOICgAN6eCCFvRUcygU0wcNsit2p1wSSNC8BkYhQOL%2BVpRn0khUiPAal3dSuvma6Y6fx5ns%2FbufMFraiZeTRtfaYlgRElfdKzfaG8zL7jqKGE27P0OqX%2BOR9uLkbYBASWMxfTGdjs1HH2mGkIQkMMleJllJFbxyts%2BhzhxS9j3rnkjBCv%2FaIoGOUHNuCaYVh8UOZaNI6goi9vS%2Fsb2I44eeu11ILSp1fViZi7U9wOShlsD6dtll60RWEi6E9v4px%2BPlbNFabkoOlxCDzyJlwIvJESADY6Ca4%2BaLqInZ8FPk52Q1hz4j%2FQSQnaWa2cdbycOnWikBK2lQMBahICPMRMIfuxNIGOqUB8tsl0EJ315WEAbb6UdnDviZoW9SDhkMGjGYaXBVmIM4h4O71p70mdmFmn2Tnf31ONlUO%2B13KoV3I%2Fgbd3Zc7ZqIxZEWwDGZaarwPijsXaXCIXgYfeJr%2B2vE%2BuOotU3wikaUQaOr1e%2BZ%2BblEv67jqwXpf4ZZItCYWaVssek8FfhtdizLsCRjV6eXHW0yy50tuFIv8GhziPdVkO6%2F15Zvm5o15zz4c&X-Amz-Signature=14a20326da098edd66d1bfe96e733f4a6a7ce201c4ce8fd1c35b4da025633724&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
