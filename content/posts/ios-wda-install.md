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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RAXJBD2Y%2F20251223%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251223T005654Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDkaCXVzLXdlc3QtMiJIMEYCIQDuQD%2F1Aq6ZihgZGMkhdaYrwhatQLhLiKvNPKgKpJMbYAIhANe%2FQfdAYxzpNTTi3ilLg6qlJtRx6o%2FSB%2B58wHJUo0BjKv8DCAIQABoMNjM3NDIzMTgzODA1IgymrUqbcti1Utl857Yq3AOUoLr5zIZJA9MMkwmsLkDljCYaV8YoOY4ogWTdFjYx0tbRCuT1LQkSO%2FurYY7R%2BCLTeq5fvHPxFY4NvqoO9%2B0mwQDDy6XprBrt%2Fi4hhS30cMFkaBeGSv%2FR8nkBPnVh7283RCDCS8Xnb1i6dxOLQ9MoQCzE9BX8T4niXI4rumTS%2FzIroUPJ5LbdvNE1iP51NhxedcvAeGUIJWVRBlSMqlWvUMjijbJmgb0eCTMDqqBShZeGFUUNKF2vqBKPcRq80QPr8hyEOv00adk9FaTEhrfv1OOr6f0O9YXWtGdwg%2BxH%2FxO0NJ8%2BPRaPIemFW1DqI21VVRkX9IFJSzbghm2cTyFVSK%2BfrrLjWuN7BxAeiAAWYLagQYxpckRtssLxlhCEpBN8SoOIXSQhHKE%2BC2AYQvQ500znIj455wazUHHa0Yr2HXmeS%2FB7%2BCUJSQxINgh1J9Dk4SzNnilIZgPq0voDSalAZMoL3%2FAvYs%2FO%2FdsVqEav9lz%2FkdPKv9XN0PC9%2Fee9%2BGSXZbYOgby7vfzp3sTz9gbt27X1W4ocJJ7K%2FD8M%2BGubaovP0XbjwTX0Imupk%2BFR%2Bk7sAgY%2FG4BnIoK7ZxvLyL%2BxabC895zofna7F28Hem298UIPB9Cuv0bilP7nrjCPxafKBjqkAXc27Pipec5sA6ymVWdHOLK0Kxc1UT8JrVJYg%2FJ7cbRQf5yrmUdvG9l0bUKkmTIrNXkd8I5WbMjR4mRPxyqVrw1SUoFrMpzxXsa7o4AQ45QgpiCOn7xx0mKyf7EceBIEPhksvoGW69wE1HJzgZViiPy%2BfPU4tRNKzeCiFvTTg7qbYoh1v2ZnIRKjDLG%2FAGCZXZS3%2FYEg3V0GeeRFmSz1Rd9YFYXG&X-Amz-Signature=404734f745aa4275bb40a001fcdb3d7592527892cefebef2d9e94aeac610b1dd&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RAXJBD2Y%2F20251223%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251223T005654Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDkaCXVzLXdlc3QtMiJIMEYCIQDuQD%2F1Aq6ZihgZGMkhdaYrwhatQLhLiKvNPKgKpJMbYAIhANe%2FQfdAYxzpNTTi3ilLg6qlJtRx6o%2FSB%2B58wHJUo0BjKv8DCAIQABoMNjM3NDIzMTgzODA1IgymrUqbcti1Utl857Yq3AOUoLr5zIZJA9MMkwmsLkDljCYaV8YoOY4ogWTdFjYx0tbRCuT1LQkSO%2FurYY7R%2BCLTeq5fvHPxFY4NvqoO9%2B0mwQDDy6XprBrt%2Fi4hhS30cMFkaBeGSv%2FR8nkBPnVh7283RCDCS8Xnb1i6dxOLQ9MoQCzE9BX8T4niXI4rumTS%2FzIroUPJ5LbdvNE1iP51NhxedcvAeGUIJWVRBlSMqlWvUMjijbJmgb0eCTMDqqBShZeGFUUNKF2vqBKPcRq80QPr8hyEOv00adk9FaTEhrfv1OOr6f0O9YXWtGdwg%2BxH%2FxO0NJ8%2BPRaPIemFW1DqI21VVRkX9IFJSzbghm2cTyFVSK%2BfrrLjWuN7BxAeiAAWYLagQYxpckRtssLxlhCEpBN8SoOIXSQhHKE%2BC2AYQvQ500znIj455wazUHHa0Yr2HXmeS%2FB7%2BCUJSQxINgh1J9Dk4SzNnilIZgPq0voDSalAZMoL3%2FAvYs%2FO%2FdsVqEav9lz%2FkdPKv9XN0PC9%2Fee9%2BGSXZbYOgby7vfzp3sTz9gbt27X1W4ocJJ7K%2FD8M%2BGubaovP0XbjwTX0Imupk%2BFR%2Bk7sAgY%2FG4BnIoK7ZxvLyL%2BxabC895zofna7F28Hem298UIPB9Cuv0bilP7nrjCPxafKBjqkAXc27Pipec5sA6ymVWdHOLK0Kxc1UT8JrVJYg%2FJ7cbRQf5yrmUdvG9l0bUKkmTIrNXkd8I5WbMjR4mRPxyqVrw1SUoFrMpzxXsa7o4AQ45QgpiCOn7xx0mKyf7EceBIEPhksvoGW69wE1HJzgZViiPy%2BfPU4tRNKzeCiFvTTg7qbYoh1v2ZnIRKjDLG%2FAGCZXZS3%2FYEg3V0GeeRFmSz1Rd9YFYXG&X-Amz-Signature=6e169ec74dc5561a53961d9fa51c7f8e8d635c28e7c9b46a8a43e4916776e120&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
