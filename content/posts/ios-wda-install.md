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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SQ3HC5LU%2F20251225%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251225T122232Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHMaCXVzLXdlc3QtMiJHMEUCIQDMXkN6%2BeuiI0FWhrA%2B8u43jcDVY%2Fln%2FA8lgwJe30JlWAIgZ4n9KSOA%2BCxFfEF0Xp0E%2FSFho2NHt6aFjGR2z1L1o40q%2FwMIPBAAGgw2Mzc0MjMxODM4MDUiDBJeWS1F1ICO7FQ0HircAyLynE%2BZyAVyVQQ2kEruykTMKbKOINMXEhOcthZJICwkIbvwg3S30f7sAVHu4BjTblX8qdgNXXbW8aw6bEhuBhLeG2Up%2BfRC%2BfvRuErPojlt4%2F3AWKdsDGq298vNP%2BmuCIfGM6%2FK1JI%2Ba5EdF%2ByrJIU7DnojlawNWouaFtDBPr3yqxZr3xIgl49Dmp2GdAHvJB7v3HSF8zxb%2Fit4PbFOOlzGtHf90oGbY3jNaj83VqlW50pqPgSCpGSAuK2d%2BiagnfB8lmPheZfIf7KFtNHaimdZMJ8MAor%2FcGW5k7ME7a7X7uu0aJ0aX8yH%2Fqwc%2FM6kg6f23Y9Qe51G%2BdvsIQVDALi02vqP7ESavwG9y8mQkhVFzvCMOD8apwVOvdnweRS0THJ%2BDEcwQz%2FdaVHjMEym2IT0XEtVley79nPtGiNPkfaur%2BoxT41yNZYjp6Kpefq2L6WR%2BfRW4WKvFvATJNIE3BtxGvgmdDk4N2ly4cExpptXeIf%2B6L0agCkIMm64e4fLhJP0CQjbIB03ngYb09kuu3%2BZdzhDe5OeJ%2FFWZfH4yqv24t9Kur23CjrmUJhjCtS96bw08mtRGqAIPTyDE%2BK1%2FYwHCJPmHdxi27cFKvE5VuI%2FFnNkUAhEokzNq%2FXnMOmltMoGOqUBtOfW%2B%2BP0IluXHl3hl8uui8ZUl5CShxb%2Fc8zQR1eaWDKWgzMn98WKe0HPNXubZpBgwc37i%2FbvWHDXFWCQmf9kHNR9mQDJsNuGePLDeXExX%2BYwde40cOxNdNxMDIxjIVwdTefE3WnEJcrCeMZfdiuUnA%2FxOxNJZgR6r1a4dC3nZjZDd7f0xB7KrgzABUHVmTSRP%2FuRP6%2FQjVnuJ2NpWss3uLaQ0J4R&X-Amz-Signature=7d540dfa9fb6f4fe25213e795f90bcc275a95e49fdecd30f96d1dc76a2cca349&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SQ3HC5LU%2F20251225%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251225T122232Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHMaCXVzLXdlc3QtMiJHMEUCIQDMXkN6%2BeuiI0FWhrA%2B8u43jcDVY%2Fln%2FA8lgwJe30JlWAIgZ4n9KSOA%2BCxFfEF0Xp0E%2FSFho2NHt6aFjGR2z1L1o40q%2FwMIPBAAGgw2Mzc0MjMxODM4MDUiDBJeWS1F1ICO7FQ0HircAyLynE%2BZyAVyVQQ2kEruykTMKbKOINMXEhOcthZJICwkIbvwg3S30f7sAVHu4BjTblX8qdgNXXbW8aw6bEhuBhLeG2Up%2BfRC%2BfvRuErPojlt4%2F3AWKdsDGq298vNP%2BmuCIfGM6%2FK1JI%2Ba5EdF%2ByrJIU7DnojlawNWouaFtDBPr3yqxZr3xIgl49Dmp2GdAHvJB7v3HSF8zxb%2Fit4PbFOOlzGtHf90oGbY3jNaj83VqlW50pqPgSCpGSAuK2d%2BiagnfB8lmPheZfIf7KFtNHaimdZMJ8MAor%2FcGW5k7ME7a7X7uu0aJ0aX8yH%2Fqwc%2FM6kg6f23Y9Qe51G%2BdvsIQVDALi02vqP7ESavwG9y8mQkhVFzvCMOD8apwVOvdnweRS0THJ%2BDEcwQz%2FdaVHjMEym2IT0XEtVley79nPtGiNPkfaur%2BoxT41yNZYjp6Kpefq2L6WR%2BfRW4WKvFvATJNIE3BtxGvgmdDk4N2ly4cExpptXeIf%2B6L0agCkIMm64e4fLhJP0CQjbIB03ngYb09kuu3%2BZdzhDe5OeJ%2FFWZfH4yqv24t9Kur23CjrmUJhjCtS96bw08mtRGqAIPTyDE%2BK1%2FYwHCJPmHdxi27cFKvE5VuI%2FFnNkUAhEokzNq%2FXnMOmltMoGOqUBtOfW%2B%2BP0IluXHl3hl8uui8ZUl5CShxb%2Fc8zQR1eaWDKWgzMn98WKe0HPNXubZpBgwc37i%2FbvWHDXFWCQmf9kHNR9mQDJsNuGePLDeXExX%2BYwde40cOxNdNxMDIxjIVwdTefE3WnEJcrCeMZfdiuUnA%2FxOxNJZgR6r1a4dC3nZjZDd7f0xB7KrgzABUHVmTSRP%2FuRP6%2FQjVnuJ2NpWss3uLaQ0J4R&X-Amz-Signature=1149d3314769c5589c884935adc376203ca49022c88ff4b0db4464ea99e9265a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
