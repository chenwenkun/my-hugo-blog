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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664E3V45UM%2F20251030%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251030T181539Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDkaCXVzLXdlc3QtMiJGMEQCIEbd3X0ykrqJZPUR2H4v7wb%2FFl793urh11S9GKkbaln3AiAr9fuyjvVoDNTe6VMVDgXnq5gKcLcrkncc1DQ1B1yTmiqIBAjy%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMCcG3kFwgn5h5EUKGKtwD0JRufDbCwGCcyQV2FfA0OgEsajwHv%2FENPLqv%2B0VaOZHq4P036gkiUsjFyzQyuhHRR9RMKPvQ%2F62LSTvjbJWESffyUe6PmUTgm%2FwOLLCcw0rOrzpTFGd0%2Fyq3f7q3o0mgWpUy3ZUUoniSsTPLkF94lU4XY%2FN16ryQLhDQib7cmMOjQFyguxWuXycZX7Rf8qyK3IRoQB6OGCYFxxeNCBE5QA6J2DL6%2FIoNXfvcY5GlrPbtytRlxUz9mHomYJBnZzGd2dEIkazE8jQrx0J9Ua87hIydrpto2x9WE4V4NCQN6qMMj0d1U1cBhN9cWyxex6DMJmk5heaBb%2FOX9vViMJZUqPiHEe5yBL%2BeayQyf8aRyAvl2PclpfpqLo19vlbXR4dW2VQrU1QzRGona%2BtfvTDGl6m3gyq64%2FU8bAelg2MIrnP4f2t5thxEANoAu51xTu3z%2FryHD7yeubzPldzjfTc8xQT3Ge%2BPEL9MdZmIi7vr8ecclIqguGYpv46i4ydWQOc3EevKELGPhqVGDUwgvFrxmFvs%2BeJDmRqJhtZTHkaBmDke08b6na4Su5EVipBc4PdGCrf%2FVh01DY1Pk5Yyhyh3Q%2BqSSq2DR1oVjZcBCkmEqKy6JklFSF5%2BzgbXj0EwjrWOyAY6pgGihcBXyHg%2FcJ0lERkZeFix5dajHjrEqQQ8N5Rh0OHiG08DzUaZUWh9ffa3sXz9scLf3EERjcHENGKdarDFaGQnnpHG7x8n208FHyCRlSSJ%2B1csmh8PGiJnwcNPxY8yg3HhS8dAxjmXYajTJrmVdgNsLgpHTt2JUMZt7QpPncqqR3LGwKK%2B2arkJS9esDYAa5%2Bl%2FHIusKh8WfHrN%2FpS2YpWu04ndj7J&X-Amz-Signature=e2a016842e66fe8672a474a4a56da1760746becda82a7e65644879d1c2c78ef4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664E3V45UM%2F20251030%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251030T181539Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDkaCXVzLXdlc3QtMiJGMEQCIEbd3X0ykrqJZPUR2H4v7wb%2FFl793urh11S9GKkbaln3AiAr9fuyjvVoDNTe6VMVDgXnq5gKcLcrkncc1DQ1B1yTmiqIBAjy%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMCcG3kFwgn5h5EUKGKtwD0JRufDbCwGCcyQV2FfA0OgEsajwHv%2FENPLqv%2B0VaOZHq4P036gkiUsjFyzQyuhHRR9RMKPvQ%2F62LSTvjbJWESffyUe6PmUTgm%2FwOLLCcw0rOrzpTFGd0%2Fyq3f7q3o0mgWpUy3ZUUoniSsTPLkF94lU4XY%2FN16ryQLhDQib7cmMOjQFyguxWuXycZX7Rf8qyK3IRoQB6OGCYFxxeNCBE5QA6J2DL6%2FIoNXfvcY5GlrPbtytRlxUz9mHomYJBnZzGd2dEIkazE8jQrx0J9Ua87hIydrpto2x9WE4V4NCQN6qMMj0d1U1cBhN9cWyxex6DMJmk5heaBb%2FOX9vViMJZUqPiHEe5yBL%2BeayQyf8aRyAvl2PclpfpqLo19vlbXR4dW2VQrU1QzRGona%2BtfvTDGl6m3gyq64%2FU8bAelg2MIrnP4f2t5thxEANoAu51xTu3z%2FryHD7yeubzPldzjfTc8xQT3Ge%2BPEL9MdZmIi7vr8ecclIqguGYpv46i4ydWQOc3EevKELGPhqVGDUwgvFrxmFvs%2BeJDmRqJhtZTHkaBmDke08b6na4Su5EVipBc4PdGCrf%2FVh01DY1Pk5Yyhyh3Q%2BqSSq2DR1oVjZcBCkmEqKy6JklFSF5%2BzgbXj0EwjrWOyAY6pgGihcBXyHg%2FcJ0lERkZeFix5dajHjrEqQQ8N5Rh0OHiG08DzUaZUWh9ffa3sXz9scLf3EERjcHENGKdarDFaGQnnpHG7x8n208FHyCRlSSJ%2B1csmh8PGiJnwcNPxY8yg3HhS8dAxjmXYajTJrmVdgNsLgpHTt2JUMZt7QpPncqqR3LGwKK%2B2arkJS9esDYAa5%2Bl%2FHIusKh8WfHrN%2FpS2YpWu04ndj7J&X-Amz-Signature=aa62f2443b9e792160bf8ace45f6dea3348393dafd6425b487e841ca5c557c11&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
