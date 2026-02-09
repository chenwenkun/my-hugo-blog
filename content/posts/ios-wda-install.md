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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WEUS2CBW%2F20260209%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260209T124239Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCP3IgDFclbQ5IBHzqVZeLBsKY6as0rLJgzJsL3kEU4MAIhAOwQZCp%2BZQGk28YvjWguX8cnv1YvdFNsAP9HchYnrSsDKogECI3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igyg%2FzqjFuaHkiKAOqoq3APKQW78BUFjZbMzpdqe1VgXXI0fg6Ca6rL3Vaw6YcMR9VhWERPh8Tj2SbPuzJzgoN40MK7prLQlvPmbP2C6z1Iiowd%2BjGG6g8Cy%2BUGBxMPk5HhSx8HXLYiSj2j7MMreMsf815vycwvOvCzHwCBeRDdkQVR0G5U0n7dx7JGLiJCQ%2FfhUX6MGE6%2FY01fNBA%2BM%2FU7IWIcoU30NN7PKiSev1c72vCbsEsMpeJsoMGhhdMoNKAUZQwfi9svfaQt99BRyn8sgPy4wSRIg%2FVx8Z%2B%2Frl11bEfquKwlV1wQh6iuTYMx74w%2B2BkHDvDdbQ77fzf49tLPFQDF%2FsQ7Zs74lWRyHXrcEgz7%2BewhEwd38AvXFRCDjv0EcrdK%2BQX1x2Ych1NK5YS7dwKt09SmMg4XSNFrDXinakwbC2eC7td6Bl8rCHT1Euys9%2BeCc90dYNuqlRwVvSJiAHG2KX0GLBwjDmTlJ2hhojqbFSEG2Zen6wsKqF3xHC69warineLj2AXW339c5wcfoSr25pQkLfr0cU%2BQ3%2BczYS7JODa1rN4lv7ICoj4G8Ea0ZBnUFhhq3gty06fk1i9W4oofW7wOGmevONzX6k9c3Og4457hDoC47KDVcRxjp%2FwQOZEgE%2BqJfCvXyFzCZkKfMBjqkAdpaBZxjcScl6Vfqpps98uPHpFwaFNsAHL4oPiCIG3%2BRJEkzfuC0h1dSxO%2F1Bsuynj9M8AHmD%2FVWq%2B1%2FTwIopTaYhMICt38ejsqZv5k7Z9b7USyoZ52ewCPeRBbIkbKxPZlTnrax2rtNEmW40vlBdOu0jLUBDApaS5qat7D13%2BPFvJVMVxDu7qPvlOg4HX9GoTgOg2BLXoTaMkMhEjF31nx9Ln3X&X-Amz-Signature=e25bf04f4428daeb3e9ddd4bbef9313ed73ea404fad8c41503c5d5a4af7b1e87&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WEUS2CBW%2F20260209%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260209T124239Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCP3IgDFclbQ5IBHzqVZeLBsKY6as0rLJgzJsL3kEU4MAIhAOwQZCp%2BZQGk28YvjWguX8cnv1YvdFNsAP9HchYnrSsDKogECI3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igyg%2FzqjFuaHkiKAOqoq3APKQW78BUFjZbMzpdqe1VgXXI0fg6Ca6rL3Vaw6YcMR9VhWERPh8Tj2SbPuzJzgoN40MK7prLQlvPmbP2C6z1Iiowd%2BjGG6g8Cy%2BUGBxMPk5HhSx8HXLYiSj2j7MMreMsf815vycwvOvCzHwCBeRDdkQVR0G5U0n7dx7JGLiJCQ%2FfhUX6MGE6%2FY01fNBA%2BM%2FU7IWIcoU30NN7PKiSev1c72vCbsEsMpeJsoMGhhdMoNKAUZQwfi9svfaQt99BRyn8sgPy4wSRIg%2FVx8Z%2B%2Frl11bEfquKwlV1wQh6iuTYMx74w%2B2BkHDvDdbQ77fzf49tLPFQDF%2FsQ7Zs74lWRyHXrcEgz7%2BewhEwd38AvXFRCDjv0EcrdK%2BQX1x2Ych1NK5YS7dwKt09SmMg4XSNFrDXinakwbC2eC7td6Bl8rCHT1Euys9%2BeCc90dYNuqlRwVvSJiAHG2KX0GLBwjDmTlJ2hhojqbFSEG2Zen6wsKqF3xHC69warineLj2AXW339c5wcfoSr25pQkLfr0cU%2BQ3%2BczYS7JODa1rN4lv7ICoj4G8Ea0ZBnUFhhq3gty06fk1i9W4oofW7wOGmevONzX6k9c3Og4457hDoC47KDVcRxjp%2FwQOZEgE%2BqJfCvXyFzCZkKfMBjqkAdpaBZxjcScl6Vfqpps98uPHpFwaFNsAHL4oPiCIG3%2BRJEkzfuC0h1dSxO%2F1Bsuynj9M8AHmD%2FVWq%2B1%2FTwIopTaYhMICt38ejsqZv5k7Z9b7USyoZ52ewCPeRBbIkbKxPZlTnrax2rtNEmW40vlBdOu0jLUBDApaS5qat7D13%2BPFvJVMVxDu7qPvlOg4HX9GoTgOg2BLXoTaMkMhEjF31nx9Ln3X&X-Amz-Signature=ec950ee45a2d0e79c9b6a08c897e39febca6931c8fd6d8030c3ee9c2e24b0650&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
