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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466X2MB33PT%2F20251028%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251028T005032Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDj8wRngJFK3Br7%2Fv0VI9dr6AuTq5p8j1z8k5AAYKPR0QIhAN%2B%2FahQRUvHTzPNh4I6JIM0u3eu6bjEGq0Zl0d2Mp3aiKogECLH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwLwcrJIzjHwL0vaPMq3AOONeoR79xn09v%2Bj%2B94kinp9oFp8YCaUYdGHjD4O1cvOO1OIcDzARmTHRWcCnH8hMebtSyaQEQU8FBoZh1OmSVWew2lPnq3ha7HvdtMnQTwi8DnDsFOeq2Ab34ja7GOB7alMcNDUQ%2FwTo1zQ4r%2BUo05Au8ba48Qu2ouX9P3LYTqZIgHWsnrUaiJy9ITtSmSAZTqW0xUskBvKhNZMsEORjF6F02%2FXcDGurSYPfUIdy9jUXw01WtVwOQRw9C9Pt5R58svEIEcLF44R6xw3K2jTA8iirCagrzSWs7gxHY3HouqxjwvIgFLeXMK4WDDBtUW6pagLQaGrEuVGFA5tbb4pUp0m%2BVbEicalEkcl1fnMRrUWrUjZY59Xljw6j%2BrfspsL5tgsEEohwULOf9Y6B%2BKCOi3Hwi7viHDG8yYN5IrRByNp8evoy%2B4RGclgBZ9y%2BE5tin6MTr6GVi9jAZ3i8ogKCY5jJRevQP01AWrOQD70dqc%2BkZl91ftjsEW7Nc78UxMWkRqzXqRayMVTN2VHAluBPV29vvykpNx7ubSn1MLcJUzxoLv9tNN2OIrENvMmRwbtJpddcMiP68VtOnoW2WxgT90WU3MYCDGKy24yQG83M%2F%2BKjh3yqZQh%2FH5VP5b7DCIk4DIBjqkASHrc6UPFlkDb3hkBfQRGjg2%2FU3AsyIDnsXtA95gA5C4ql0R5%2Bja3oKasXYi19phh4M8GH%2FQWC9bhfn%2FabjQZf7AeYuB52CfZO%2FcRIH38TtWBrftfV157QvbKiuRA2vRNBqgfsVz9EhaLSnDQriNMJsC7XXROiDx%2FQ5X7gW2CZdIwiaMg7OgO%2BtRzlOBM54vxh2XcwfKJ4tpuIFJgSHYmKF3sXrS&X-Amz-Signature=eda2b25b807283322aa43369b61348f4a27d12ac6120f6dbd1d57fb3eddc5af5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466X2MB33PT%2F20251028%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251028T005032Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDj8wRngJFK3Br7%2Fv0VI9dr6AuTq5p8j1z8k5AAYKPR0QIhAN%2B%2FahQRUvHTzPNh4I6JIM0u3eu6bjEGq0Zl0d2Mp3aiKogECLH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwLwcrJIzjHwL0vaPMq3AOONeoR79xn09v%2Bj%2B94kinp9oFp8YCaUYdGHjD4O1cvOO1OIcDzARmTHRWcCnH8hMebtSyaQEQU8FBoZh1OmSVWew2lPnq3ha7HvdtMnQTwi8DnDsFOeq2Ab34ja7GOB7alMcNDUQ%2FwTo1zQ4r%2BUo05Au8ba48Qu2ouX9P3LYTqZIgHWsnrUaiJy9ITtSmSAZTqW0xUskBvKhNZMsEORjF6F02%2FXcDGurSYPfUIdy9jUXw01WtVwOQRw9C9Pt5R58svEIEcLF44R6xw3K2jTA8iirCagrzSWs7gxHY3HouqxjwvIgFLeXMK4WDDBtUW6pagLQaGrEuVGFA5tbb4pUp0m%2BVbEicalEkcl1fnMRrUWrUjZY59Xljw6j%2BrfspsL5tgsEEohwULOf9Y6B%2BKCOi3Hwi7viHDG8yYN5IrRByNp8evoy%2B4RGclgBZ9y%2BE5tin6MTr6GVi9jAZ3i8ogKCY5jJRevQP01AWrOQD70dqc%2BkZl91ftjsEW7Nc78UxMWkRqzXqRayMVTN2VHAluBPV29vvykpNx7ubSn1MLcJUzxoLv9tNN2OIrENvMmRwbtJpddcMiP68VtOnoW2WxgT90WU3MYCDGKy24yQG83M%2F%2BKjh3yqZQh%2FH5VP5b7DCIk4DIBjqkASHrc6UPFlkDb3hkBfQRGjg2%2FU3AsyIDnsXtA95gA5C4ql0R5%2Bja3oKasXYi19phh4M8GH%2FQWC9bhfn%2FabjQZf7AeYuB52CfZO%2FcRIH38TtWBrftfV157QvbKiuRA2vRNBqgfsVz9EhaLSnDQriNMJsC7XXROiDx%2FQ5X7gW2CZdIwiaMg7OgO%2BtRzlOBM54vxh2XcwfKJ4tpuIFJgSHYmKF3sXrS&X-Amz-Signature=6e2fc2baeda1ec91db5936938d18390c05b90150ee30d1572cf91a6ed0355d65&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
