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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RFLENOWS%2F20260523%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260523T080502Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGgaCXVzLXdlc3QtMiJIMEYCIQDX35tfI1IkLA579mN7q0JKTRCZn9yjREyitr1F7xklnwIhANEDuYuX7EyqERh8%2F1EX2PKm6eDjJ3EYn3%2Fx0pIkFDF6Kv8DCDEQABoMNjM3NDIzMTgzODA1IgwmrSsiVtHWEbH3g0Iq3ANsXuO%2FV9dFXaOMDBsdYBf%2BandGjUHBZPRCLm%2BDyO0eZOtkKhiHTMEt0DTWg8X4r9jU1Z6ivjgWfs8wBYa1FGX1IhGzpWv75xvgj97x%2BGrd3p6RiXR1712hHlf5ZaOm7gxKyrfAuQjJ4YcPX%2FUl%2BDwhU1toVmiP4RG%2FitOcBPjarUvvNK4E8YYQP0STnZzemoDtn9mJgcsYP2%2FYk3nmqtSaoHeFaUndjxbWV7qs44%2FPGU1EjVKE2D4RUp4YsU2gopDQLMFzExtAWVVNlMvni4qN2kYicoO9un7KNxbjaXZ5LcuKX10UjVmU8TRBo%2Fq9qcBZMZ0fx5f5vj9YqSS9DFiLUVPYgzdRbPM%2BVj%2Ft9%2B2oZZJAtFbhqf0avMD%2Brhm9n%2BSRrwELX1Kc0u2XKq9OiHE0Mo0edqDe67VTNLYHft0cLBso6PH7OQfQKw7ysXiguPrc5NCTQnzB7M%2B7V7SL%2Bva3YZW4LUjBkUSF8eK76FclCorJ0tVQNx1yEZP7pTDv73%2BEU28r8d2dSjbppAqxJ1giT010%2B0WXYwh5X1P4MMZHFG1NZE9an%2BADB%2FbDSsqvjnW5nfC2sv%2FYoRIM3cn6gYE43I1Uu%2BR4D7OBEtqE5kWcEYHU%2FmkqnizHddnXJDDjtsXQBjqkAVKBZ9zdlBsdD1a1wFTWmKREBOY%2BCpgBJhUB%2BmBkCtvwpZk2Bp%2Bejn4cf0gvFAzF1azIQ2R%2B330QCtqFTuNNZpWEDH49MpAeI8RY3%2BNYuI78aswUqJEySmjeRuu7%2B07SSSWg7jYdPTvmTbd5JQ%2BqjkbBh4iefxm84iaZIdxlT0nii%2BOt2N2p%2F5bLexYGv6MNt4QL1%2B3OOclr7GFm%2BSSe60NL6v7o&X-Amz-Signature=099cc034f439721e3f7ced13b362c3e9786c0fee17cf8e8b65c841616b1f23ed&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RFLENOWS%2F20260523%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260523T080502Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGgaCXVzLXdlc3QtMiJIMEYCIQDX35tfI1IkLA579mN7q0JKTRCZn9yjREyitr1F7xklnwIhANEDuYuX7EyqERh8%2F1EX2PKm6eDjJ3EYn3%2Fx0pIkFDF6Kv8DCDEQABoMNjM3NDIzMTgzODA1IgwmrSsiVtHWEbH3g0Iq3ANsXuO%2FV9dFXaOMDBsdYBf%2BandGjUHBZPRCLm%2BDyO0eZOtkKhiHTMEt0DTWg8X4r9jU1Z6ivjgWfs8wBYa1FGX1IhGzpWv75xvgj97x%2BGrd3p6RiXR1712hHlf5ZaOm7gxKyrfAuQjJ4YcPX%2FUl%2BDwhU1toVmiP4RG%2FitOcBPjarUvvNK4E8YYQP0STnZzemoDtn9mJgcsYP2%2FYk3nmqtSaoHeFaUndjxbWV7qs44%2FPGU1EjVKE2D4RUp4YsU2gopDQLMFzExtAWVVNlMvni4qN2kYicoO9un7KNxbjaXZ5LcuKX10UjVmU8TRBo%2Fq9qcBZMZ0fx5f5vj9YqSS9DFiLUVPYgzdRbPM%2BVj%2Ft9%2B2oZZJAtFbhqf0avMD%2Brhm9n%2BSRrwELX1Kc0u2XKq9OiHE0Mo0edqDe67VTNLYHft0cLBso6PH7OQfQKw7ysXiguPrc5NCTQnzB7M%2B7V7SL%2Bva3YZW4LUjBkUSF8eK76FclCorJ0tVQNx1yEZP7pTDv73%2BEU28r8d2dSjbppAqxJ1giT010%2B0WXYwh5X1P4MMZHFG1NZE9an%2BADB%2FbDSsqvjnW5nfC2sv%2FYoRIM3cn6gYE43I1Uu%2BR4D7OBEtqE5kWcEYHU%2FmkqnizHddnXJDDjtsXQBjqkAVKBZ9zdlBsdD1a1wFTWmKREBOY%2BCpgBJhUB%2BmBkCtvwpZk2Bp%2Bejn4cf0gvFAzF1azIQ2R%2B330QCtqFTuNNZpWEDH49MpAeI8RY3%2BNYuI78aswUqJEySmjeRuu7%2B07SSSWg7jYdPTvmTbd5JQ%2BqjkbBh4iefxm84iaZIdxlT0nii%2BOt2N2p%2F5bLexYGv6MNt4QL1%2B3OOclr7GFm%2BSSe60NL6v7o&X-Amz-Signature=2f6f7c3108be8795dc63e8a292b388200860cd4415dce53e7a934d1249862ef8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
