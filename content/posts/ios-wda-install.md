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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664G7MJXPE%2F20250928%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20250928T005506Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECYaCXVzLXdlc3QtMiJHMEUCIQDjtAmKkxTvn1zmxeOgpdD%2FIV4X%2BDLQaLBhYSwSwkqXOQIgUtJHIQIkxExNZA2Tw3jUasfYgrS5itM%2FcSfxWqnSCuQqiAQIr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFECXEy782DkT81avyrcAx80%2BUIlwxvoM4tPba1oF8JMjmJzO3GWekiOALGkJHH98aO57o4jdIHza1lStTdZ8YHwjYe5L62fPdzgqxv5Ok9NCg2mDyeUS6X0lSkUiPK8lsiuo1c3BwFwHYA0AsZcKHyJm7SivMsV%2BxXeewmdady3NULV%2BcVOKYxJVimRbZS52ab62URiz39Yk41wdBKJgaD7zI%2FLK7O%2BcPo8CBS3IBGdLL%2B8SxlL7pfNrgUFOoS%2B1YRApasUxivVgxqEbd4OttRbUSvV3GFgdJad%2F7LduQGZgBE%2B2WQnBXKgNl3JJPrmb2%2FYMz7upi27s2IJAGBAhPJQTen3AEWM4%2BVnCFnaFcFfvfLXkC%2BH0tt49V5SQmU%2BjMD2oX8G63PDaBz8rcYAF4ZGoKaXqxd%2FWlO656Xca3CbqzZp29D1ye5NZ6SNyoO2cqQ0uJpvtayhE2tAs8PTZ2ZK8wYlVfI8cvNsxEPDcjWlZlQKWanIdLYj928S7DxikyxG6X749PK7TcnVAZJ1Y0psiGohzLOJp%2FjNH1GjppahkKSCr4tMp5xyWUnc4XTNigQ3O8CLKc7PVqrv8WGuNJILGLrWlD6znSud9CxGMLajgVtCKoGmLJHiDLZRI%2BrTXKH6u7q7bOaNch6iMJ6%2F4cYGOqUBHKPX24xddM7nol%2FuY2fcBSkHMksvK778Rn7AqMqW%2FZU1LadKg0eKbRCHFFLgIc8vBuRm1KZTzq4KU89kpDZU1wPX1qktTdByz%2Fg67T5JBNsk%2FogebdqBnqu3QKRrVN7t15nCV%2B2zqbSolF6xgmbvsLNrQ5%2F%2BPJb5GfVL30lLMi61%2BcJjr%2Fb6nD%2BYevPoaOYkGZ3j6IyafM7KWTIWK0c1w8jKKeA3&X-Amz-Signature=2e670c16bcc7c2bfe8031d9bc303477283f2a3c9e2e2cbb303641ef052c18550&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664G7MJXPE%2F20250928%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20250928T005506Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECYaCXVzLXdlc3QtMiJHMEUCIQDjtAmKkxTvn1zmxeOgpdD%2FIV4X%2BDLQaLBhYSwSwkqXOQIgUtJHIQIkxExNZA2Tw3jUasfYgrS5itM%2FcSfxWqnSCuQqiAQIr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFECXEy782DkT81avyrcAx80%2BUIlwxvoM4tPba1oF8JMjmJzO3GWekiOALGkJHH98aO57o4jdIHza1lStTdZ8YHwjYe5L62fPdzgqxv5Ok9NCg2mDyeUS6X0lSkUiPK8lsiuo1c3BwFwHYA0AsZcKHyJm7SivMsV%2BxXeewmdady3NULV%2BcVOKYxJVimRbZS52ab62URiz39Yk41wdBKJgaD7zI%2FLK7O%2BcPo8CBS3IBGdLL%2B8SxlL7pfNrgUFOoS%2B1YRApasUxivVgxqEbd4OttRbUSvV3GFgdJad%2F7LduQGZgBE%2B2WQnBXKgNl3JJPrmb2%2FYMz7upi27s2IJAGBAhPJQTen3AEWM4%2BVnCFnaFcFfvfLXkC%2BH0tt49V5SQmU%2BjMD2oX8G63PDaBz8rcYAF4ZGoKaXqxd%2FWlO656Xca3CbqzZp29D1ye5NZ6SNyoO2cqQ0uJpvtayhE2tAs8PTZ2ZK8wYlVfI8cvNsxEPDcjWlZlQKWanIdLYj928S7DxikyxG6X749PK7TcnVAZJ1Y0psiGohzLOJp%2FjNH1GjppahkKSCr4tMp5xyWUnc4XTNigQ3O8CLKc7PVqrv8WGuNJILGLrWlD6znSud9CxGMLajgVtCKoGmLJHiDLZRI%2BrTXKH6u7q7bOaNch6iMJ6%2F4cYGOqUBHKPX24xddM7nol%2FuY2fcBSkHMksvK778Rn7AqMqW%2FZU1LadKg0eKbRCHFFLgIc8vBuRm1KZTzq4KU89kpDZU1wPX1qktTdByz%2Fg67T5JBNsk%2FogebdqBnqu3QKRrVN7t15nCV%2B2zqbSolF6xgmbvsLNrQ5%2F%2BPJb5GfVL30lLMi61%2BcJjr%2Fb6nD%2BYevPoaOYkGZ3j6IyafM7KWTIWK0c1w8jKKeA3&X-Amz-Signature=a6cba4e29f9779bcebdebf4491d45d4a6cf04cd4218ee650d98f7bb9f7a0fe59&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
