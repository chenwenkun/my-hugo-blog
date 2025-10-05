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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665PVDHAV3%2F20251005%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251005T181315Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIGSPkdqAQbkrDbXif04E0N9ZXfQNXhTtEuXM8TCqfdlHAiEAjosyMPuymXyys5kyaTrg7%2BrUXjh09uj%2FjlVU20LUUsIq%2FwMIehAAGgw2Mzc0MjMxODM4MDUiDPoTF1%2BHBiWEh1N8uyrcAw7sIBCZEq%2FZub1kQoeq7yWyvaMlo3qmSnyVjJG2xs6YwopI9%2Bf3txl5iLRnuNvSnN8zaZuFKiHSRbH3cWy%2FL3GtKfwyTQ39qMHJpeoShgtcWuxuupYJ%2FMlEKlvPQBwIJogfs9aUiAJupLwntAOE6dnkQX2Pe7vDy4zL%2FcZ0tU5zxvRZ7GC7By42XWeUp5L062qQvhxaGagBkRb4z1eQd3vTf2SqLbj0w8YwhAEKUfQ%2B%2F3Ua2A1%2FXYuCdDQTfQaaUFzcjCLhx3EIadiE3xI%2FHU5moGiZCOtNP6FKQX7hjzfIB6rJwSzFFI6mxPlfhDETCUmgCZirLVSruI%2FSZRfZt5Mi%2B2UdOc5gnEKK65%2FrMiXlg%2BM5QU59hfRc%2FgCtTwNd8Dj2chgocQM21oe%2BviFH3dLMc9sPlGWG3oX4NSUmFVU7Qhy5LKfWrAW16vbr4iCFlUixmTzNvr0sP6qI58iO%2BB1lxx3YYBchLTKa1rwWmkyC9%2F4We5SYjaBULZ6obdM7LKiZPQT5D3bzdELHcoyxSl11lM%2FAU8OG3vfxXtyiGD2i2IoM1UHgJmN9Br30QoxyeJKA9T6uKQHdi1DPSaGdq9TNdTgZEe%2BI8X1pIIz9nEDrHWBvfqm%2FfR2mLjHKMIPLiscGOqUBVJ2ejFh1gNTYE1lW%2BPNBxCKkVYsTG1HmfIK7aLanQkSIKy3xvKUIO5QGRSWAL4kBkmwjZNLCGHlgUApjaD%2BG4ur57LUD5VBLBucxwPCHCy80zlrVxuBIJUpQIcsXuJQ96IuMwcvoTGBRyTNpy5rB%2F8f%2FxfIczsGz3deKRGGRBYnmdMFuB6hdV9SlCkslXQKkFQ7pxXj2jXL808WXfwdsbUuU1qAA&X-Amz-Signature=83b133ea36ca9bde9c9eb3354f976f5d942d180e8c923acd6a848ac3b4b8ccb9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665PVDHAV3%2F20251005%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251005T181315Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIGSPkdqAQbkrDbXif04E0N9ZXfQNXhTtEuXM8TCqfdlHAiEAjosyMPuymXyys5kyaTrg7%2BrUXjh09uj%2FjlVU20LUUsIq%2FwMIehAAGgw2Mzc0MjMxODM4MDUiDPoTF1%2BHBiWEh1N8uyrcAw7sIBCZEq%2FZub1kQoeq7yWyvaMlo3qmSnyVjJG2xs6YwopI9%2Bf3txl5iLRnuNvSnN8zaZuFKiHSRbH3cWy%2FL3GtKfwyTQ39qMHJpeoShgtcWuxuupYJ%2FMlEKlvPQBwIJogfs9aUiAJupLwntAOE6dnkQX2Pe7vDy4zL%2FcZ0tU5zxvRZ7GC7By42XWeUp5L062qQvhxaGagBkRb4z1eQd3vTf2SqLbj0w8YwhAEKUfQ%2B%2F3Ua2A1%2FXYuCdDQTfQaaUFzcjCLhx3EIadiE3xI%2FHU5moGiZCOtNP6FKQX7hjzfIB6rJwSzFFI6mxPlfhDETCUmgCZirLVSruI%2FSZRfZt5Mi%2B2UdOc5gnEKK65%2FrMiXlg%2BM5QU59hfRc%2FgCtTwNd8Dj2chgocQM21oe%2BviFH3dLMc9sPlGWG3oX4NSUmFVU7Qhy5LKfWrAW16vbr4iCFlUixmTzNvr0sP6qI58iO%2BB1lxx3YYBchLTKa1rwWmkyC9%2F4We5SYjaBULZ6obdM7LKiZPQT5D3bzdELHcoyxSl11lM%2FAU8OG3vfxXtyiGD2i2IoM1UHgJmN9Br30QoxyeJKA9T6uKQHdi1DPSaGdq9TNdTgZEe%2BI8X1pIIz9nEDrHWBvfqm%2FfR2mLjHKMIPLiscGOqUBVJ2ejFh1gNTYE1lW%2BPNBxCKkVYsTG1HmfIK7aLanQkSIKy3xvKUIO5QGRSWAL4kBkmwjZNLCGHlgUApjaD%2BG4ur57LUD5VBLBucxwPCHCy80zlrVxuBIJUpQIcsXuJQ96IuMwcvoTGBRyTNpy5rB%2F8f%2FxfIczsGz3deKRGGRBYnmdMFuB6hdV9SlCkslXQKkFQ7pxXj2jXL808WXfwdsbUuU1qAA&X-Amz-Signature=8073909cb946236c83142a597003f46707b61e940485fbb057354441c0951b58&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
