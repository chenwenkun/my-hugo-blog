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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466232NXA6F%2F20251102%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251102T181318Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIDaNe8WAzSZErr2grVq598E3L8w%2BttseSXXRa4d6mASvAiEAxbg2l64OYzFZqEv9XIN4NpLEamXQ4T1KTV30Zx%2Fr50wq%2FwMISxAAGgw2Mzc0MjMxODM4MDUiDLUD3RZmkz6UsOczWCrcA2nRua8p%2F62tfXp9rpWvn487Y%2FxmPqe7Y0oak6MW62yupewFRlQXZFm0ZEK7i%2B8KiJryZM52em4GCo%2Ft9sfnrQP8bE4Aku8YDSQZIVSIoKbwXwRbJ2Y2NymYvekO%2B8T1nLKDJGldv9aOqNPamhd6Zrc7BO9TVXozibJK470vvNpHprSznfcWklpR5tV4EsD15%2B16B405fvLQC7i9Q%2B72hiE9kTgCAe5i665mevpC%2BD8A3p8dddjmxrDiYzgxVfp68Zjkl5ASrTpcJiPsWnRXVuEMRqcIzlmBvTUgDBu5zv4XC27CKcU5MIKQh0EJUGJatemI032zHiPm21TWSR040J%2Fdzf0JmazrvPzWHcbPJCEQrYabTupHxvE6KUJStIct0wiOSPjYI1o66nM6jShnsutKqYfPy0TuWLlC1toAvGsyx3LhZvE4G64fPf6t8yQMxf8SwE2PxpGzayviOMGNZdXwqj2%2Fn0YrEvC7QWrwmaJm3rmqIUpwA2105D2s2L5cU1QdZVw70EJAAsJ01ijN3XhXAQMv3A41Iq7FcLEyhUa7ai8dtdet1NhA%2F7biFgJWrLYP%2B8ksy8nWaHfjyrXyBz4Hk0SIeW4WQ9UhsZFbG1PBSgM1plFZ%2FZexbJRgMP%2B0nsgGOqUBnQB0rjGPaZBmfG01Hdfsyy0TYcl6hCXm0v9eqp88mCSOTBH%2FQUdEKX3YRLwdShnUf1lNsTQd2O3h26ae7IJ6dj45bC5Oa62SiZE02KGpbjsUkIEr5X%2Fen7Upl2oW6%2B8qmz8fTpnkU4EWaunKKZ%2FkatQsIxgDJjIJ8tq13i2q5UePTF0S9pMykhZwb4H3G2wXCdtAlpmOEmCArIRviGekc3niPkDI&X-Amz-Signature=3ad7bd3a0a0633f13d62ca7ad9ccd13993baf43bfb049daf45a41dd4b325cf2a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466232NXA6F%2F20251102%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251102T181318Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIDaNe8WAzSZErr2grVq598E3L8w%2BttseSXXRa4d6mASvAiEAxbg2l64OYzFZqEv9XIN4NpLEamXQ4T1KTV30Zx%2Fr50wq%2FwMISxAAGgw2Mzc0MjMxODM4MDUiDLUD3RZmkz6UsOczWCrcA2nRua8p%2F62tfXp9rpWvn487Y%2FxmPqe7Y0oak6MW62yupewFRlQXZFm0ZEK7i%2B8KiJryZM52em4GCo%2Ft9sfnrQP8bE4Aku8YDSQZIVSIoKbwXwRbJ2Y2NymYvekO%2B8T1nLKDJGldv9aOqNPamhd6Zrc7BO9TVXozibJK470vvNpHprSznfcWklpR5tV4EsD15%2B16B405fvLQC7i9Q%2B72hiE9kTgCAe5i665mevpC%2BD8A3p8dddjmxrDiYzgxVfp68Zjkl5ASrTpcJiPsWnRXVuEMRqcIzlmBvTUgDBu5zv4XC27CKcU5MIKQh0EJUGJatemI032zHiPm21TWSR040J%2Fdzf0JmazrvPzWHcbPJCEQrYabTupHxvE6KUJStIct0wiOSPjYI1o66nM6jShnsutKqYfPy0TuWLlC1toAvGsyx3LhZvE4G64fPf6t8yQMxf8SwE2PxpGzayviOMGNZdXwqj2%2Fn0YrEvC7QWrwmaJm3rmqIUpwA2105D2s2L5cU1QdZVw70EJAAsJ01ijN3XhXAQMv3A41Iq7FcLEyhUa7ai8dtdet1NhA%2F7biFgJWrLYP%2B8ksy8nWaHfjyrXyBz4Hk0SIeW4WQ9UhsZFbG1PBSgM1plFZ%2FZexbJRgMP%2B0nsgGOqUBnQB0rjGPaZBmfG01Hdfsyy0TYcl6hCXm0v9eqp88mCSOTBH%2FQUdEKX3YRLwdShnUf1lNsTQd2O3h26ae7IJ6dj45bC5Oa62SiZE02KGpbjsUkIEr5X%2Fen7Upl2oW6%2B8qmz8fTpnkU4EWaunKKZ%2FkatQsIxgDJjIJ8tq13i2q5UePTF0S9pMykhZwb4H3G2wXCdtAlpmOEmCArIRviGekc3niPkDI&X-Amz-Signature=7d9ff65811a51c905b113aeb55f6abf5260ab109bbb2d1e813be173a504f9afe&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
