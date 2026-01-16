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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664MVJUXSX%2F20260116%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260116T181851Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFc%2FCNN%2FLxdfxFylkNunPHGZJjcKdzSbxUkxQbdau%2F2hAiBg39xdhXViTFaNzpYJLOhd6PF8lYVewddvA4jJnhZrEir%2FAwhTEAAaDDYzNzQyMzE4MzgwNSIMQIep1H%2FnWtqHTavIKtwD7F%2F%2Bgjv0mLboiqtxc32WZeddGSYTV8sLJ4DPWLI26zoyZYhzjMPcj%2BOtCCZ1E%2BuqkQFHJTnwpMaFiMkyZWs8Cu%2BmOB1Htc3ho2QvP1jPdPABToCQ6wk0YxvozIW3r7puzh24j2WNPj0%2BdilwtTgOjeLrwyLKe%2FzGXaeec8qbBs1RDIBFzws3od5a4DsVSU7KV0b9nP%2FUUPhlSVGZX%2FVaQE6GKW3lCclR0XsvrT1Tj5k4hhlTkwVVLS1gLUHmw3BboxlnVoRE4Md73SEfvZIgdey%2Bvdolez3buaj%2BZKm9e6lNMuTA55xFIHTBZoewSs1fdNJ49HetNQdliR8MPgh%2BZ0VuytnSrumQdP1oTuHL6Qke9cDiZJZJK704Kmn04H3LI1%2F2RBo1HP2gcTuvmaommpMDd0fT7ezx5xanSfMxYssRrjR2kzoAPqXNf2IsNFrBA%2FXDCJjUYLJB9PXef1MLZgtPwh8NPwl0m5NMCmUct%2BUa4cJD0bSlNkKO9WlNKB9XKRl5wYKaIgtkWTrEB%2BYzC6MwMxzoPT4jWJ0igisXZaxfz2IhQGdxV2qNp9jsbF3dvnjIPlJXhT0f%2BfG2b0gI9TAaLLc2KaUJm5srNWEYxV3HlZR%2BBnt66RWcwEwwgPOpywY6pgGnQQkhZo%2BZgHeUXgUjjIWzrljpUStw%2B0F1Hmpv2ty8H5nY8UYBuZ8jdllSGVhf4SEqgz%2Br%2Fjd0SfbSHT9m3phcYAVfvm%2FvFX35urvbUYMki5id1NrLJ2EZ78z%2BTXFRujf6ZAfo33W8g92iGPOecT3Ivp7EAzE61Z2k5Scii4HLHPSEdrC15cB3OBaZDJcMZzhY1gLO6XkaRv533tWjXn8kmll9o7za&X-Amz-Signature=aadebad1b7ff1070d2e440470d3b4cd112ee6525ce099b4d0604fe2e430c59e4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664MVJUXSX%2F20260116%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260116T181851Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFc%2FCNN%2FLxdfxFylkNunPHGZJjcKdzSbxUkxQbdau%2F2hAiBg39xdhXViTFaNzpYJLOhd6PF8lYVewddvA4jJnhZrEir%2FAwhTEAAaDDYzNzQyMzE4MzgwNSIMQIep1H%2FnWtqHTavIKtwD7F%2F%2Bgjv0mLboiqtxc32WZeddGSYTV8sLJ4DPWLI26zoyZYhzjMPcj%2BOtCCZ1E%2BuqkQFHJTnwpMaFiMkyZWs8Cu%2BmOB1Htc3ho2QvP1jPdPABToCQ6wk0YxvozIW3r7puzh24j2WNPj0%2BdilwtTgOjeLrwyLKe%2FzGXaeec8qbBs1RDIBFzws3od5a4DsVSU7KV0b9nP%2FUUPhlSVGZX%2FVaQE6GKW3lCclR0XsvrT1Tj5k4hhlTkwVVLS1gLUHmw3BboxlnVoRE4Md73SEfvZIgdey%2Bvdolez3buaj%2BZKm9e6lNMuTA55xFIHTBZoewSs1fdNJ49HetNQdliR8MPgh%2BZ0VuytnSrumQdP1oTuHL6Qke9cDiZJZJK704Kmn04H3LI1%2F2RBo1HP2gcTuvmaommpMDd0fT7ezx5xanSfMxYssRrjR2kzoAPqXNf2IsNFrBA%2FXDCJjUYLJB9PXef1MLZgtPwh8NPwl0m5NMCmUct%2BUa4cJD0bSlNkKO9WlNKB9XKRl5wYKaIgtkWTrEB%2BYzC6MwMxzoPT4jWJ0igisXZaxfz2IhQGdxV2qNp9jsbF3dvnjIPlJXhT0f%2BfG2b0gI9TAaLLc2KaUJm5srNWEYxV3HlZR%2BBnt66RWcwEwwgPOpywY6pgGnQQkhZo%2BZgHeUXgUjjIWzrljpUStw%2B0F1Hmpv2ty8H5nY8UYBuZ8jdllSGVhf4SEqgz%2Br%2Fjd0SfbSHT9m3phcYAVfvm%2FvFX35urvbUYMki5id1NrLJ2EZ78z%2BTXFRujf6ZAfo33W8g92iGPOecT3Ivp7EAzE61Z2k5Scii4HLHPSEdrC15cB3OBaZDJcMZzhY1gLO6XkaRv533tWjXn8kmll9o7za&X-Amz-Signature=76f2bb2d4b9cdbf1063bb460c9664bbdf1e9f14c9853d4f99937a17a2e9628b8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
