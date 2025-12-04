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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SO46TY3F%2F20251204%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251204T061839Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHYaCXVzLXdlc3QtMiJIMEYCIQCzQofiU6PSvzZkY017pUCcJj0PWLr%2F4LQ%2F8u2AoepAxgIhANzuS4UbP%2FqhaiECeGaeqWeLLv2iw6KB1JhNmGuXZmfoKv8DCD8QABoMNjM3NDIzMTgzODA1IgzA0xRJjRiLzxAXUpAq3AO3hd%2Fp2yPnLur2eGW%2BV6Nuq6LkWyNl6oBF1AewOxTLRPw3PtY7mY6VuDDQ4QUNdVlbH84ccXNJVbPgXr8Vgq%2BZtZVX%2Boc1Jz1Le38JGh0XK44nheW7ZBkZKZevbzWgCpaRcNPymn9rIAwn7xzImLeVQjA14NDluPfZUCIPK8edPsmlzb2nh0ghnk%2B60fFzGB%2BF9XAIuI2kRw1HpukkvCpxEMpHh3sl3iVGXE6gJiGhs0bbr8sYi2Pa60lf85lt5GWW6SUX0iGH0kj8afcNCnBgZkeVo4kR1IlykW3HIQ9%2F9xby2vDk3JTGsjLOIADUGHkZxTdNpsRQ5A13Du4ylMyO8hJiyjIDm5RWHi8KQuiBd1QWfUiN%2BKAIfo5LQ91OWfuyQmxnsWN%2Bv35I8oTX4GdIC5hZ2sqs6hQ%2BDh%2BfRYMYJvO2NO9U8XyxVMnI9IFG8nOa9VLtR9LFVz4Je%2BbF%2BG2qQYs2I02RFojqsyBhVe6yWpWggeloxXXQOUj1YO4yxl8GpdYqkxOTDphs7btF%2BZnYUOEliANqdCW9DLUVsTMGTVPZefLdGdtQ25INkOUtHFAgC%2FeZS3rZbMg2SsU9krLpE4R8d5iqHIa%2BR8sA2Rd0D%2FmspaPisPYaYdUKSzCjysTJBjqkAbWR%2BbTb554nL8p9nJu%2FG%2FN3dhuBG%2FDnkkVgCTMVs38yHmOFi2pGPUTEP3Nk4odRMtVzxRvNrvtZP3DLItMZ1FT8ncSx5oqDiqhadSA4ZsUbzIb22bLcajtfaJq0Y5OHCwQjDq1sdjUjuCN5xhmvuWPU3Iv8ERNc6FMfMPRKokALXnoT0ScovWV%2FLpOZDJbmw%2F7MX%2BovhynnBQUXlT4YzIMRdlPY&X-Amz-Signature=164891bcfcaa2502d540dcfe022a639fa846726722ea208b082434e91c45872b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SO46TY3F%2F20251204%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251204T061839Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHYaCXVzLXdlc3QtMiJIMEYCIQCzQofiU6PSvzZkY017pUCcJj0PWLr%2F4LQ%2F8u2AoepAxgIhANzuS4UbP%2FqhaiECeGaeqWeLLv2iw6KB1JhNmGuXZmfoKv8DCD8QABoMNjM3NDIzMTgzODA1IgzA0xRJjRiLzxAXUpAq3AO3hd%2Fp2yPnLur2eGW%2BV6Nuq6LkWyNl6oBF1AewOxTLRPw3PtY7mY6VuDDQ4QUNdVlbH84ccXNJVbPgXr8Vgq%2BZtZVX%2Boc1Jz1Le38JGh0XK44nheW7ZBkZKZevbzWgCpaRcNPymn9rIAwn7xzImLeVQjA14NDluPfZUCIPK8edPsmlzb2nh0ghnk%2B60fFzGB%2BF9XAIuI2kRw1HpukkvCpxEMpHh3sl3iVGXE6gJiGhs0bbr8sYi2Pa60lf85lt5GWW6SUX0iGH0kj8afcNCnBgZkeVo4kR1IlykW3HIQ9%2F9xby2vDk3JTGsjLOIADUGHkZxTdNpsRQ5A13Du4ylMyO8hJiyjIDm5RWHi8KQuiBd1QWfUiN%2BKAIfo5LQ91OWfuyQmxnsWN%2Bv35I8oTX4GdIC5hZ2sqs6hQ%2BDh%2BfRYMYJvO2NO9U8XyxVMnI9IFG8nOa9VLtR9LFVz4Je%2BbF%2BG2qQYs2I02RFojqsyBhVe6yWpWggeloxXXQOUj1YO4yxl8GpdYqkxOTDphs7btF%2BZnYUOEliANqdCW9DLUVsTMGTVPZefLdGdtQ25INkOUtHFAgC%2FeZS3rZbMg2SsU9krLpE4R8d5iqHIa%2BR8sA2Rd0D%2FmspaPisPYaYdUKSzCjysTJBjqkAbWR%2BbTb554nL8p9nJu%2FG%2FN3dhuBG%2FDnkkVgCTMVs38yHmOFi2pGPUTEP3Nk4odRMtVzxRvNrvtZP3DLItMZ1FT8ncSx5oqDiqhadSA4ZsUbzIb22bLcajtfaJq0Y5OHCwQjDq1sdjUjuCN5xhmvuWPU3Iv8ERNc6FMfMPRKokALXnoT0ScovWV%2FLpOZDJbmw%2F7MX%2BovhynnBQUXlT4YzIMRdlPY&X-Amz-Signature=a55315d8c333572fd959c69e3dfd607cd81ffd8911d18d14f2f18ca737268b29&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
