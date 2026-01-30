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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667THBJU7C%2F20260130%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260130T010726Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDdPz9hhCqrpKNXyVzuvtaISWcZRO0ALkjVtEpduuk0FAIhAMuXNIBv1lD%2FZBzBgq9Noz%2FyAELmSb%2FXbm0ukkuj%2FMlIKogECJL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzowWqe1FTOVHlbuZ4q3AP3v%2B%2BwUAOvxpL0C%2Bpx4bdm0zyR1EWj9wYlFEWKJyaqigQh7%2B%2Bh62YkCuG7BXztrrqbHxJif78d73SmKvhTdKJ7ZB2OSp5w1HALmGxkja2lF15FVq3C0%2BqfcbwcS4D0wR94cRLNJP2kDDr2WsRNiirfsx5kmjyZYEj%2BElaCDOvY2NoOY5AssDxRrRYnnT50ylJPQN3MdWlKY2WF7I4mNpj0ghLU4YQWh4nvjz0PT5mLbJYRQBCkTMLE3knqSgGB2Ap6qHqdDbLnm1UJy7L6N3MQxIxmdDWZLkZHGGdSOyjF1Y47uZuE9o3xkFFSPD7LswQKTFH0mB67AJml6ODyG9MvzgPbyd8gf6I4QlNB6xVQearfQ4%2B15XMpWcePS7kdSt2Fv4cQqXOUfSNf0qf2LchdGIIA7m5Ya9aPz6EDCBRSvgITXy9lP06P77UbvB%2BJ99fYO4RhIvfI5gJtsxU21VIfMa6s%2B3yEMMFD6IKrlTBp8yf6zUNYWiPCc3ppmTJvwYAdswwpuXXQXl57KFtD394IE3KyOePfPCgnW%2Ba0183Rt2e5VhaTxQtDxSl3JTH6C9YupIyme3HXFSMs35JLdxxC8qccyvXZv2D0uRNsWgqCMJ8X1PBlY5j%2BddedtjDHgfDLBjqkAWwE69KjZ%2FdHgj95wT%2FVr3r4%2Bio3PpqOxqgA%2Fr44D7fhVbSPY5otScfVLoIR1sFISJ%2BEthVbYx2nxQrWRc6NJkdw15TYK%2F7HgAJhqC477jAUGiw3JkIGAlo%2F%2FEMMJImmdJBNCjkMwXMEg9ACfez5IvjEhznq5jiXRhKPPZe2QEGG8lmsLtGu8JeuzLUPLcA5jdbYeAiNxJljE6I2Cvjtj8K5dg9Q&X-Amz-Signature=ce26dcf3b317205ef102b1aa25fd5ce8776441c4631147e610d65e34fda64872&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667THBJU7C%2F20260130%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260130T010726Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDdPz9hhCqrpKNXyVzuvtaISWcZRO0ALkjVtEpduuk0FAIhAMuXNIBv1lD%2FZBzBgq9Noz%2FyAELmSb%2FXbm0ukkuj%2FMlIKogECJL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzowWqe1FTOVHlbuZ4q3AP3v%2B%2BwUAOvxpL0C%2Bpx4bdm0zyR1EWj9wYlFEWKJyaqigQh7%2B%2Bh62YkCuG7BXztrrqbHxJif78d73SmKvhTdKJ7ZB2OSp5w1HALmGxkja2lF15FVq3C0%2BqfcbwcS4D0wR94cRLNJP2kDDr2WsRNiirfsx5kmjyZYEj%2BElaCDOvY2NoOY5AssDxRrRYnnT50ylJPQN3MdWlKY2WF7I4mNpj0ghLU4YQWh4nvjz0PT5mLbJYRQBCkTMLE3knqSgGB2Ap6qHqdDbLnm1UJy7L6N3MQxIxmdDWZLkZHGGdSOyjF1Y47uZuE9o3xkFFSPD7LswQKTFH0mB67AJml6ODyG9MvzgPbyd8gf6I4QlNB6xVQearfQ4%2B15XMpWcePS7kdSt2Fv4cQqXOUfSNf0qf2LchdGIIA7m5Ya9aPz6EDCBRSvgITXy9lP06P77UbvB%2BJ99fYO4RhIvfI5gJtsxU21VIfMa6s%2B3yEMMFD6IKrlTBp8yf6zUNYWiPCc3ppmTJvwYAdswwpuXXQXl57KFtD394IE3KyOePfPCgnW%2Ba0183Rt2e5VhaTxQtDxSl3JTH6C9YupIyme3HXFSMs35JLdxxC8qccyvXZv2D0uRNsWgqCMJ8X1PBlY5j%2BddedtjDHgfDLBjqkAWwE69KjZ%2FdHgj95wT%2FVr3r4%2Bio3PpqOxqgA%2Fr44D7fhVbSPY5otScfVLoIR1sFISJ%2BEthVbYx2nxQrWRc6NJkdw15TYK%2F7HgAJhqC477jAUGiw3JkIGAlo%2F%2FEMMJImmdJBNCjkMwXMEg9ACfez5IvjEhznq5jiXRhKPPZe2QEGG8lmsLtGu8JeuzLUPLcA5jdbYeAiNxJljE6I2Cvjtj8K5dg9Q&X-Amz-Signature=fb96bc0dc88ef2291706450466e264f98468f987be578646e4c89900b0c7bd93&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
