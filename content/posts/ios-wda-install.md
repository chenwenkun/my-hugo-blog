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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46655QNNOYV%2F20260704%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260704T125759Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFoaCXVzLXdlc3QtMiJHMEUCIQDvNfC1NiaMLA5L%2BX6F4xPRGsFA2uvCbW64cv54eAxiXwIgUmYJJv6wIQ%2BZG7awdDaUcemk%2FBOKhjeEfKsz2dd%2F64cq%2FwMIIhAAGgw2Mzc0MjMxODM4MDUiDOd%2FlKPpOwisrj9WDyrcAwMwvgP%2FB6TkYG1tJqZMTASQv6d6r4c5B8dFQIT4xcihLG%2FseBktYAHFnOmmmBpwcPkgxzzsxZMtF%2FXOqkbQA2AcbMywRd2oGlSAXezGbxI9lbq1tzaUb2vO81r%2Fef7iEYlEm%2FRRNIMe77lYKgwqMMDBmF1DWBaZrm7WjuywsfCZqjeevmufyva%2BjB0qthMbyIf48%2BpTCzs0RwC8Dv5omEYmHZdSWvXFlh5i1%2BUwDRTRRiVuYUSkqmvkmC1ASLHaz8ngAGruNo%2FUxNfveKvhQkhVFvHfyDruEeR7dTSdsqg7XHjj8Vek90JZuZb1PcObbhTPQbub8homptYaduVk528%2FKibMObNVwdx6GPs8RUVsLOvXDS%2B%2FPvuJwJSyljjExHKrNQ7OyXXXtvHh%2Ffnw%2FHMWoIg5h79rfrN2P2AgHVWUVoRxRDdAhOviSxJMQmw9VuYImPaLxUipQ5xJQ4G2xDni1XSSasRsZcViqkpIW%2F0vPJrP%2BROeh5PggMBMzFS8QP3K5LW131s6cJYejA%2B%2FLL8sIWM5DIW66uUJabLUGmwYjVWUwyPhhQpx82y4DbzqhmIY4VbKmnLsbRHL%2BO0STG1iRuuO7vBZtyNeX23x1pMbvbQfRIR%2B9cZDwNnSMO2fo9IGOqUBSUBRtx0ngCi5oMkxtq1Oe%2FoYys2ZSE6DUDSQ3kcggVWjmfd%2Buanz3WuRdbn%2FM3Y7c6W4Zy6Hk%2BlqWwePsD9swOzX7mGu5SDQxdUUuB32NQ%2FO3G%2BbRAZerQa5hf0a0aivZA9q9GyMp57Hi5Sd%2FZYefrwtx4%2BWf%2BSAP%2B4tTPylozQYWXR0mUVAIPriM5sObPQwGLlvS2HBtTrYq2Nfx54Uuz6dB9eb&X-Amz-Signature=358ef660c82ce4571e9edb153417380bb5f01319d8f2334258a51bd55d719a06&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46655QNNOYV%2F20260704%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260704T125759Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFoaCXVzLXdlc3QtMiJHMEUCIQDvNfC1NiaMLA5L%2BX6F4xPRGsFA2uvCbW64cv54eAxiXwIgUmYJJv6wIQ%2BZG7awdDaUcemk%2FBOKhjeEfKsz2dd%2F64cq%2FwMIIhAAGgw2Mzc0MjMxODM4MDUiDOd%2FlKPpOwisrj9WDyrcAwMwvgP%2FB6TkYG1tJqZMTASQv6d6r4c5B8dFQIT4xcihLG%2FseBktYAHFnOmmmBpwcPkgxzzsxZMtF%2FXOqkbQA2AcbMywRd2oGlSAXezGbxI9lbq1tzaUb2vO81r%2Fef7iEYlEm%2FRRNIMe77lYKgwqMMDBmF1DWBaZrm7WjuywsfCZqjeevmufyva%2BjB0qthMbyIf48%2BpTCzs0RwC8Dv5omEYmHZdSWvXFlh5i1%2BUwDRTRRiVuYUSkqmvkmC1ASLHaz8ngAGruNo%2FUxNfveKvhQkhVFvHfyDruEeR7dTSdsqg7XHjj8Vek90JZuZb1PcObbhTPQbub8homptYaduVk528%2FKibMObNVwdx6GPs8RUVsLOvXDS%2B%2FPvuJwJSyljjExHKrNQ7OyXXXtvHh%2Ffnw%2FHMWoIg5h79rfrN2P2AgHVWUVoRxRDdAhOviSxJMQmw9VuYImPaLxUipQ5xJQ4G2xDni1XSSasRsZcViqkpIW%2F0vPJrP%2BROeh5PggMBMzFS8QP3K5LW131s6cJYejA%2B%2FLL8sIWM5DIW66uUJabLUGmwYjVWUwyPhhQpx82y4DbzqhmIY4VbKmnLsbRHL%2BO0STG1iRuuO7vBZtyNeX23x1pMbvbQfRIR%2B9cZDwNnSMO2fo9IGOqUBSUBRtx0ngCi5oMkxtq1Oe%2FoYys2ZSE6DUDSQ3kcggVWjmfd%2Buanz3WuRdbn%2FM3Y7c6W4Zy6Hk%2BlqWwePsD9swOzX7mGu5SDQxdUUuB32NQ%2FO3G%2BbRAZerQa5hf0a0aivZA9q9GyMp57Hi5Sd%2FZYefrwtx4%2BWf%2BSAP%2B4tTPylozQYWXR0mUVAIPriM5sObPQwGLlvS2HBtTrYq2Nfx54Uuz6dB9eb&X-Amz-Signature=3e0eca33fbd411b8a1d9d3065bcdc097e01a634fe15576a4428888c9b8f84a22&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
