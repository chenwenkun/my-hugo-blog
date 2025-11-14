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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664T5MIOLC%2F20251114%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251114T061737Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCICySEfO1S6401RdVgjau6vW2ZcHQBKruixRAxTBUttsyAiBZ40HtOmwuCIKUEFb6S28E0qgfdmy4RTF6tyzoNHtDLir%2FAwheEAAaDDYzNzQyMzE4MzgwNSIM4InBZDzJfn9xHH6dKtwDKkFbT0icSuCcfRhPU%2ByPx5WjnOfO7weyejFPIyxW9spAuyFQixg%2BJORUfrksiNyIs7G9JH%2F2t%2BBuSePUSJXhpyk%2BJF3M7UMjSGP%2F0yfCDkCV1NN%2FIOSQz2dErrj8lvYrFpkUlb4WbsWNF6%2FKkTgYiubTUvF0uBQiIRoh%2ByF8%2FwCamSr9ksmDnohHe58NV8uio7JFZaFnMrsG5MrUcG5uyYSqAnRQmsSc0yeJ06hdZ1EXjzPV8sEtbhQaIJKkOSVMOmQCvB%2F1xo8MhPfBiO5mlr58nPOwO8NfI9JuMJtboSLGbHaN0d1BpJ2gXsF0sjvsClj6OLi8FRBDmSPkmWIWSGKVKJKztD3aB7Hq4DYKirZiehM%2BE80UzZJVact%2FIbqioY63si9L4EUWG%2F5hM%2BdxzrFNLzqyttHYgh%2BstzE5r0IfiRlpDsAkBy44UXeJpXOqQTVP6ZYmWK20JBieJIKixO3Epo4A6izq32%2BknrRy6bVSIrezpyneLWt3CTFV1cWFx23cT59S7JVByXAmQGyRYts1KnTVn2BCzdGhkDCN%2BjHNXvi4%2BOkpqOFVdUEf2p0jc6xfUvQnxNegPZOqvGaE9TmiHM7YP1G1ewD%2B9%2FOCFck154s%2BzAuIjLr8Nvsw%2FfHayAY6pgF7lvafptd2wliSZ9msbbGSMf5f6MG6tlfGjdCP34N6dy54Dbgv%2F8egcMqqc74mIMA9Uh9q5yMuvUS%2B2n3Pi0PZ%2B3klwsStVdLTwsgZqRqj6IHAxBJVDyEtV5QDgQz7DDW2VD%2Bi%2Bx7P5hOvnEb1%2B5KTNRCrk0nJ3dGA6QZx%2FdziQlRCORpqKHMJ%2Frww72JmrztpkMKziUSthrqhW2p8UIcRhlehmFhC&X-Amz-Signature=8de3b932c00e622812ad5d82c5b23616a857e8eaebd5ae529c13b078df7871ec&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664T5MIOLC%2F20251114%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251114T061737Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCICySEfO1S6401RdVgjau6vW2ZcHQBKruixRAxTBUttsyAiBZ40HtOmwuCIKUEFb6S28E0qgfdmy4RTF6tyzoNHtDLir%2FAwheEAAaDDYzNzQyMzE4MzgwNSIM4InBZDzJfn9xHH6dKtwDKkFbT0icSuCcfRhPU%2ByPx5WjnOfO7weyejFPIyxW9spAuyFQixg%2BJORUfrksiNyIs7G9JH%2F2t%2BBuSePUSJXhpyk%2BJF3M7UMjSGP%2F0yfCDkCV1NN%2FIOSQz2dErrj8lvYrFpkUlb4WbsWNF6%2FKkTgYiubTUvF0uBQiIRoh%2ByF8%2FwCamSr9ksmDnohHe58NV8uio7JFZaFnMrsG5MrUcG5uyYSqAnRQmsSc0yeJ06hdZ1EXjzPV8sEtbhQaIJKkOSVMOmQCvB%2F1xo8MhPfBiO5mlr58nPOwO8NfI9JuMJtboSLGbHaN0d1BpJ2gXsF0sjvsClj6OLi8FRBDmSPkmWIWSGKVKJKztD3aB7Hq4DYKirZiehM%2BE80UzZJVact%2FIbqioY63si9L4EUWG%2F5hM%2BdxzrFNLzqyttHYgh%2BstzE5r0IfiRlpDsAkBy44UXeJpXOqQTVP6ZYmWK20JBieJIKixO3Epo4A6izq32%2BknrRy6bVSIrezpyneLWt3CTFV1cWFx23cT59S7JVByXAmQGyRYts1KnTVn2BCzdGhkDCN%2BjHNXvi4%2BOkpqOFVdUEf2p0jc6xfUvQnxNegPZOqvGaE9TmiHM7YP1G1ewD%2B9%2FOCFck154s%2BzAuIjLr8Nvsw%2FfHayAY6pgF7lvafptd2wliSZ9msbbGSMf5f6MG6tlfGjdCP34N6dy54Dbgv%2F8egcMqqc74mIMA9Uh9q5yMuvUS%2B2n3Pi0PZ%2B3klwsStVdLTwsgZqRqj6IHAxBJVDyEtV5QDgQz7DDW2VD%2Bi%2Bx7P5hOvnEb1%2B5KTNRCrk0nJ3dGA6QZx%2FdziQlRCORpqKHMJ%2Frww72JmrztpkMKziUSthrqhW2p8UIcRhlehmFhC&X-Amz-Signature=ef3a0055d2b5ae29db4ad88a897055bd66b31247bdc8e6c1fd98f6246c559dc8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
