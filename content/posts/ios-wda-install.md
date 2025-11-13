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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VSPG7JGG%2F20251113%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251113T005351Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHkaCXVzLXdlc3QtMiJHMEUCIQDnzYpTVnxr9xm2xZcuKnA2LZPDqaoOu%2BvDA%2FJ7ZMCdWwIgZtuyfKFnRPGBIoH9Q%2BwQBz0DAIridkjmPgJHiv%2BKrrQq%2FwMIQhAAGgw2Mzc0MjMxODM4MDUiDPqxxwylUn5SEyuNOyrcAznQ6qWlc3xOIKVRUeYRCo4WXSwy32Qc5%2FLs6xTAvgeQZit2VAwExaE1oqurDGepRZt1%2BAAEXtNIFrGk3IG4JutgW77guqMsu9f8kJStfJ74Rm6kbdU2CIlnse3CJGv0RHEOBl14MUzgQwXiN6xMfhyxWvNXp1j%2F3kTrL6IdZaCDjt%2BDihTi2umeNmxrNcOxL9ZAymP85RwnDbaMh4jPa7W7dEKrqug8ggee%2FYvCEcj%2BFGOiIG8MaMNOMtwdzkw9YYUpYa0nKzAjPdhe1YzJDSKYPQy%2BtGMc1V5LSKovvemsrUdmwOp8gf6MUwB%2BPZVNtcHHrWHceu%2FU2n2uVPzdLMUVb56qxhekxggL68hLtV3VX9BkB22nuJWZK25WrVaG%2Fo6he%2BtcB5sufMIJKovwxBVi5gcEek3bMCE6fm4nomjknwD23JJnl336dN9pvv%2BrTi%2BM4PsOOXf4gXYwANxx%2FDOB30sgBA2uL4yOw%2BSSujIZw3YUPAWhNPqDmB9Gt0gFF25zLtwEZw4eZwo7kyH7P88fvCyND9Z%2F%2BdH7xugm61nztk%2FxibQYLT%2BucV4ouL8pPpFoQguPgzEDjvB8OmMcXwvppzZ7Pv%2FXHAIDoddJfaEh6yfMLBbrffu2jcJcMOHO1MgGOqUB33SwUbPrUh%2BW0VwsU89jpTZrWn5WtFizM73CXkDjyHRswgVX1s0KoU640Iwst%2FkcbWBAk0SxHiBAiMW7qNV9doY0ZRHMx3BUjFQEEtwC0ScpIAbsv4qRJ7WHkMNkP3CTjqTckBxZLRMY0R7jnEp8HIhbEk3FHu9P6slo%2BkFMpAoACLCC%2FlV4k4sLXt4i7LGE8OMK8DJOq4NpBCV%2B9Ak%2F40nCZl%2FW&X-Amz-Signature=7e5e34da9f80cc98551dd4e895f28511c0fcccad748aa4dc4bf9929e5723b6e3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VSPG7JGG%2F20251113%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251113T005351Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHkaCXVzLXdlc3QtMiJHMEUCIQDnzYpTVnxr9xm2xZcuKnA2LZPDqaoOu%2BvDA%2FJ7ZMCdWwIgZtuyfKFnRPGBIoH9Q%2BwQBz0DAIridkjmPgJHiv%2BKrrQq%2FwMIQhAAGgw2Mzc0MjMxODM4MDUiDPqxxwylUn5SEyuNOyrcAznQ6qWlc3xOIKVRUeYRCo4WXSwy32Qc5%2FLs6xTAvgeQZit2VAwExaE1oqurDGepRZt1%2BAAEXtNIFrGk3IG4JutgW77guqMsu9f8kJStfJ74Rm6kbdU2CIlnse3CJGv0RHEOBl14MUzgQwXiN6xMfhyxWvNXp1j%2F3kTrL6IdZaCDjt%2BDihTi2umeNmxrNcOxL9ZAymP85RwnDbaMh4jPa7W7dEKrqug8ggee%2FYvCEcj%2BFGOiIG8MaMNOMtwdzkw9YYUpYa0nKzAjPdhe1YzJDSKYPQy%2BtGMc1V5LSKovvemsrUdmwOp8gf6MUwB%2BPZVNtcHHrWHceu%2FU2n2uVPzdLMUVb56qxhekxggL68hLtV3VX9BkB22nuJWZK25WrVaG%2Fo6he%2BtcB5sufMIJKovwxBVi5gcEek3bMCE6fm4nomjknwD23JJnl336dN9pvv%2BrTi%2BM4PsOOXf4gXYwANxx%2FDOB30sgBA2uL4yOw%2BSSujIZw3YUPAWhNPqDmB9Gt0gFF25zLtwEZw4eZwo7kyH7P88fvCyND9Z%2F%2BdH7xugm61nztk%2FxibQYLT%2BucV4ouL8pPpFoQguPgzEDjvB8OmMcXwvppzZ7Pv%2FXHAIDoddJfaEh6yfMLBbrffu2jcJcMOHO1MgGOqUB33SwUbPrUh%2BW0VwsU89jpTZrWn5WtFizM73CXkDjyHRswgVX1s0KoU640Iwst%2FkcbWBAk0SxHiBAiMW7qNV9doY0ZRHMx3BUjFQEEtwC0ScpIAbsv4qRJ7WHkMNkP3CTjqTckBxZLRMY0R7jnEp8HIhbEk3FHu9P6slo%2BkFMpAoACLCC%2FlV4k4sLXt4i7LGE8OMK8DJOq4NpBCV%2B9Ak%2F40nCZl%2FW&X-Amz-Signature=769a2463b101e887e7f7daf0db389b7bb4aa1b274c6a1f765a5bd9576d54804e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
