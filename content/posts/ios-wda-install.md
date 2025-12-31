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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VRSLDVK3%2F20251231%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251231T181735Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAYaCXVzLXdlc3QtMiJHMEUCIAyqKKs5EMqMj%2Fjq11myG%2FbYUVRyFhhfdSDSYg38oDT8AiEAnBUMvt4K7bH75r32QQXH9KB%2Bw7LbyOFJzODABLMyfzQqiAQIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDO9dudEtHBTjmyiVmCrcA%2BO2lLDWHzZWxGfvs6ibNqXDCFYPfxPBiyQy0xRezEJQSmZgb8fHr15DNO27f8HiAbk0wY7b%2BHlVs%2BZ8%2FL44wmeJKXK16du4NS983klxPm3LKBdFSCc9NLu0Gr0GzSl7BEAKtRNV8ZPTlKKoImGx%2Fn3vxzNucQAQ2O9EEN2F%2F3qiU%2FxJH4nqT8AFKuEa5UwW%2B3IIipaijAqomSMcX983%2Fn4SQsnvN%2FD81HZb9kuwstERWAU9MCWrXaMfoNzgVgVyksXOQrRVMg2J54BjkjEiIClWuN1Vl%2BE6MoMt761EJuAzL2Gy4FeG%2BmnlxYrVJQ438DyS6BJsnm%2BlEA9RLowhv4gSvCmHwNWFO79u03PwMu9%2FL8uITZ6MDp9BG%2FJp0CvCvoYDAcZCIPuNWVNM1SDty6pp6rtOjNd7V%2FqdDDrz29quaZs3eoLvU4IgSUVxoS3PUH4Esh8pCpAqvFWxPyBxKhIMT6SJ2%2Fsy%2FQ6MynZAtBs1tdT54tTwbHID%2FTmCoK71Cb%2FlVVwNanrcEmw3AIfbnXYSZQ6tyTT5tzp9xfJ89eZuH988MuF2%2FHC2TsAKejpK7qmW%2FKYonGwa4NPU3VNn6FpFd9GvHLk4epyFkj%2FevvSlApDU1i15my8oXGd8MMva1MoGOqUBkivpDusjVFzEhW7S8keAZjfnkhrEfYJ3ZrUF4rXNqkIDWsWU7bVG%2F5KC4gt8bD%2FPHGoG%2BmUYdrHYTo%2Fr0T2iKvBgdt%2BN9VtTLSn9wTN0tceFK05eyzBS3Z9VJnC3FWX2fLAqZaspC8N4rues78%2F34Cg31X7KhgANJ2%2B333stqFhrVYc4%2BNGMmFhkcO6IIg8F%2B%2FMrfHzpj9escTmqcosFhh4JJUQf&X-Amz-Signature=cd787856631c4fe59395ce930b80ceafff96ccf68d27d1b2985bf958fc9a2296&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VRSLDVK3%2F20251231%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251231T181735Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAYaCXVzLXdlc3QtMiJHMEUCIAyqKKs5EMqMj%2Fjq11myG%2FbYUVRyFhhfdSDSYg38oDT8AiEAnBUMvt4K7bH75r32QQXH9KB%2Bw7LbyOFJzODABLMyfzQqiAQIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDO9dudEtHBTjmyiVmCrcA%2BO2lLDWHzZWxGfvs6ibNqXDCFYPfxPBiyQy0xRezEJQSmZgb8fHr15DNO27f8HiAbk0wY7b%2BHlVs%2BZ8%2FL44wmeJKXK16du4NS983klxPm3LKBdFSCc9NLu0Gr0GzSl7BEAKtRNV8ZPTlKKoImGx%2Fn3vxzNucQAQ2O9EEN2F%2F3qiU%2FxJH4nqT8AFKuEa5UwW%2B3IIipaijAqomSMcX983%2Fn4SQsnvN%2FD81HZb9kuwstERWAU9MCWrXaMfoNzgVgVyksXOQrRVMg2J54BjkjEiIClWuN1Vl%2BE6MoMt761EJuAzL2Gy4FeG%2BmnlxYrVJQ438DyS6BJsnm%2BlEA9RLowhv4gSvCmHwNWFO79u03PwMu9%2FL8uITZ6MDp9BG%2FJp0CvCvoYDAcZCIPuNWVNM1SDty6pp6rtOjNd7V%2FqdDDrz29quaZs3eoLvU4IgSUVxoS3PUH4Esh8pCpAqvFWxPyBxKhIMT6SJ2%2Fsy%2FQ6MynZAtBs1tdT54tTwbHID%2FTmCoK71Cb%2FlVVwNanrcEmw3AIfbnXYSZQ6tyTT5tzp9xfJ89eZuH988MuF2%2FHC2TsAKejpK7qmW%2FKYonGwa4NPU3VNn6FpFd9GvHLk4epyFkj%2FevvSlApDU1i15my8oXGd8MMva1MoGOqUBkivpDusjVFzEhW7S8keAZjfnkhrEfYJ3ZrUF4rXNqkIDWsWU7bVG%2F5KC4gt8bD%2FPHGoG%2BmUYdrHYTo%2Fr0T2iKvBgdt%2BN9VtTLSn9wTN0tceFK05eyzBS3Z9VJnC3FWX2fLAqZaspC8N4rues78%2F34Cg31X7KhgANJ2%2B333stqFhrVYc4%2BNGMmFhkcO6IIg8F%2B%2FMrfHzpj9escTmqcosFhh4JJUQf&X-Amz-Signature=50417dd9b5f8f5198c988eb3614f84a555a38971b32f23be88d1349f7037c3a1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
