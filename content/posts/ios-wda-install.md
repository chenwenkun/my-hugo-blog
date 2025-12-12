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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664GBEI2H5%2F20251212%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251212T122303Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDwaCXVzLXdlc3QtMiJGMEQCIB2PLp0dxpR8vrgwkJK%2FMn5MomAU7Cj8zq7mV0Eu50nLAiBsGiw9UQDy9dJdSJ0nsqriF4%2FpGsS8hIY7tIMHccZ48Sr%2FAwgFEAAaDDYzNzQyMzE4MzgwNSIMsHwri9JsylEujZwBKtwDXoLBIlWLwSY4W33AgCRIhT7KPmVqo%2Fqvb5wJwsePQ%2Fxhw%2FmPDVYI%2BBMOzB%2BvIumUsCEQReqej7DMyccyQ1aMdS6GtXGWBGF%2B7PNNI%2B%2BgDjzq07BAQ3Ou%2B%2BHmzSdtqPcMJqDLB%2BZV36dm0eeC4B8wB0mHZ5w0Tlh0mALoc9YNrdz5gO1zKKcdTgBbTNRJ8fsD%2FItpP51%2BzZcVcHXmYH0QSgZjjJInre3%2B6176sbgS90H%2Bg77KwQw8HD3e%2BQ%2FJ7gSfiEh5QCbo8arX%2Be3vbNkN445Zb6ydTBL%2FQ35jubzmUIJElWD3MRxWLLHUvARk0STl0pXeE9pIgRVpAQc%2FWCq2jE7YRtJIsDFmjfmmhWzKtYW5jx5tztSQWtcvSGDqMN2PlJPjfAoLOP01Ckce9pz2K7EB7OGrLvlNK9EKReRkTDfqxItxoz%2F3GcuvRuxwLwZgehk1pech91T8Ehcr%2F%2FBX8ynbkY6ijKZbq2p1aN%2FnTGd4zo5EOiYWcBHVR%2FlPiqyC0SAgK9rgVpfg8rbJ0MbL0LTokgdhVeqOPpRmuw0w72s4IO3oOetOZr7xNzg1xiAbc%2BFEBeT5Bwp2QRbAba6GCTtRc4l8gT56PQJQ4%2BkgmGT0aCwN17RKpJ3dzMcw3vvvyQY6pgHWt9WpIGoyjop9tEJntgRcGOzcRfgQ96MolE5gW8Y5XDYef2ekIZNoajWA9cVYALfOcozHd2usmua9%2BdTZ%2Fg1Xo5lhgQHY%2Bu4qNiQ%2Bwq%2FVm3cXb9n6t0%2BWQF5tn1YC95Ml10T1q3kOSMui9qzfIr98McxEpr57HuBnQoAMjC7VeJpuX%2Bj9BiPS2Is3WCpZ%2BcUjWVkLZ8nXWWGPhq%2FhbOZgNHIq%2FON9&X-Amz-Signature=eb586d4ea4f5c08e6631cb5d3a89f320bc539bfddb4aa96e5f85c48716df5b56&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664GBEI2H5%2F20251212%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251212T122303Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDwaCXVzLXdlc3QtMiJGMEQCIB2PLp0dxpR8vrgwkJK%2FMn5MomAU7Cj8zq7mV0Eu50nLAiBsGiw9UQDy9dJdSJ0nsqriF4%2FpGsS8hIY7tIMHccZ48Sr%2FAwgFEAAaDDYzNzQyMzE4MzgwNSIMsHwri9JsylEujZwBKtwDXoLBIlWLwSY4W33AgCRIhT7KPmVqo%2Fqvb5wJwsePQ%2Fxhw%2FmPDVYI%2BBMOzB%2BvIumUsCEQReqej7DMyccyQ1aMdS6GtXGWBGF%2B7PNNI%2B%2BgDjzq07BAQ3Ou%2B%2BHmzSdtqPcMJqDLB%2BZV36dm0eeC4B8wB0mHZ5w0Tlh0mALoc9YNrdz5gO1zKKcdTgBbTNRJ8fsD%2FItpP51%2BzZcVcHXmYH0QSgZjjJInre3%2B6176sbgS90H%2Bg77KwQw8HD3e%2BQ%2FJ7gSfiEh5QCbo8arX%2Be3vbNkN445Zb6ydTBL%2FQ35jubzmUIJElWD3MRxWLLHUvARk0STl0pXeE9pIgRVpAQc%2FWCq2jE7YRtJIsDFmjfmmhWzKtYW5jx5tztSQWtcvSGDqMN2PlJPjfAoLOP01Ckce9pz2K7EB7OGrLvlNK9EKReRkTDfqxItxoz%2F3GcuvRuxwLwZgehk1pech91T8Ehcr%2F%2FBX8ynbkY6ijKZbq2p1aN%2FnTGd4zo5EOiYWcBHVR%2FlPiqyC0SAgK9rgVpfg8rbJ0MbL0LTokgdhVeqOPpRmuw0w72s4IO3oOetOZr7xNzg1xiAbc%2BFEBeT5Bwp2QRbAba6GCTtRc4l8gT56PQJQ4%2BkgmGT0aCwN17RKpJ3dzMcw3vvvyQY6pgHWt9WpIGoyjop9tEJntgRcGOzcRfgQ96MolE5gW8Y5XDYef2ekIZNoajWA9cVYALfOcozHd2usmua9%2BdTZ%2Fg1Xo5lhgQHY%2Bu4qNiQ%2Bwq%2FVm3cXb9n6t0%2BWQF5tn1YC95Ml10T1q3kOSMui9qzfIr98McxEpr57HuBnQoAMjC7VeJpuX%2Bj9BiPS2Is3WCpZ%2BcUjWVkLZ8nXWWGPhq%2FhbOZgNHIq%2FON9&X-Amz-Signature=d4a6ee5a42190bd0fb44f64e083e2f66f8b8e61f84212b64d45ec914bcb68cf7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
