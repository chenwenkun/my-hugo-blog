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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RW3SDVRH%2F20260401%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260401T184448Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCF3aX00PEEl47%2F%2F5K%2FAYhvJn483ftb7KprQz9upzMqYwIhAOEH8uzT2D8Nd5g8IL3ghhTbLET9JMp%2FK9WDIbppJUorKv8DCFwQABoMNjM3NDIzMTgzODA1IgzHahFyj3ZlYTlCdagq3AM7LYTPRMM2oRqvxrLEZ4iil3UhsYrrBmZpbefMrP6fGI4Q0NzkEhzm5b5v64z3ACjPiHF4JfLAu3Wrjp149jwgTT2TFV6JYPxW5ffKBTgTrChY6Ij6zPJb2qLA16oVkvAl7zWCE0tN9CX5F2mH0dNkpMKHvx0wjmg2dk3NoVmwWmoOJzN26jD4OmRnHaMaMh6yJnpGEQ3EMGIV7MOWIBc1UDtKYHMRZUeEw%2BNKiAZicdqC3Gheyc11v7USP%2Faukp%2FcDsWaKuuLMo4BC2oVX2b8ye621ppNLDbp7UVokSBcavI97wxenS%2FlTXFbDpUdINDK1TY0hp4qcDRJqblJbvsai4KtuQX2qYh2r3y5iTFivE%2B6RaFp9KsKepP%2FbqY0JWzs7xkTjWhNHFMMHJbbUqgbJQE9%2F8ytHT2LST%2B9Bvh4mYo%2BX5Dsofj8l0Tbmj5piiwHZJW9QAalHM%2BLD1Uh2K1ymzvPekshfnXR7ydD0X8G6ovWZllNsO0xWZxNLGaN0qkIpM12ZjXWlXl8cpAsfIY48BKyLEYI9mi1MT6qq2PjX%2BXagmlC1J7UQVc8wmDudXGp2%2BAPoARIsgt09DgRCm4z1T1R7eVuQLlSIRR60XPnD7atXaYgzbHIt%2BPnHzDDy7XOBjqkAdjezRSrlM1I%2BezkjJI2PJxjcM5rDnfBu%2BtacpetiTnh2GSVOxWR2D9SKLRvLHPxuJONVGBlbBEpY05DrrdJDBzvVCh8JmrdqSE4jCj41Nw7Ds1KU3nlsXpKECr%2FQcmggSRttAFxmdRtrblyjVYZlktDSrMTj2hgZykZpeUjF8LpqIhZfg%2BZkLRd3fzZGH9dTb7UzxtCaEckLk7oTOttxoiqzo1X&X-Amz-Signature=a673629c7ac2e2a3184d06ecff16741febf63784864cf56ae4c20a25bba63f5b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RW3SDVRH%2F20260401%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260401T184449Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCF3aX00PEEl47%2F%2F5K%2FAYhvJn483ftb7KprQz9upzMqYwIhAOEH8uzT2D8Nd5g8IL3ghhTbLET9JMp%2FK9WDIbppJUorKv8DCFwQABoMNjM3NDIzMTgzODA1IgzHahFyj3ZlYTlCdagq3AM7LYTPRMM2oRqvxrLEZ4iil3UhsYrrBmZpbefMrP6fGI4Q0NzkEhzm5b5v64z3ACjPiHF4JfLAu3Wrjp149jwgTT2TFV6JYPxW5ffKBTgTrChY6Ij6zPJb2qLA16oVkvAl7zWCE0tN9CX5F2mH0dNkpMKHvx0wjmg2dk3NoVmwWmoOJzN26jD4OmRnHaMaMh6yJnpGEQ3EMGIV7MOWIBc1UDtKYHMRZUeEw%2BNKiAZicdqC3Gheyc11v7USP%2Faukp%2FcDsWaKuuLMo4BC2oVX2b8ye621ppNLDbp7UVokSBcavI97wxenS%2FlTXFbDpUdINDK1TY0hp4qcDRJqblJbvsai4KtuQX2qYh2r3y5iTFivE%2B6RaFp9KsKepP%2FbqY0JWzs7xkTjWhNHFMMHJbbUqgbJQE9%2F8ytHT2LST%2B9Bvh4mYo%2BX5Dsofj8l0Tbmj5piiwHZJW9QAalHM%2BLD1Uh2K1ymzvPekshfnXR7ydD0X8G6ovWZllNsO0xWZxNLGaN0qkIpM12ZjXWlXl8cpAsfIY48BKyLEYI9mi1MT6qq2PjX%2BXagmlC1J7UQVc8wmDudXGp2%2BAPoARIsgt09DgRCm4z1T1R7eVuQLlSIRR60XPnD7atXaYgzbHIt%2BPnHzDDy7XOBjqkAdjezRSrlM1I%2BezkjJI2PJxjcM5rDnfBu%2BtacpetiTnh2GSVOxWR2D9SKLRvLHPxuJONVGBlbBEpY05DrrdJDBzvVCh8JmrdqSE4jCj41Nw7Ds1KU3nlsXpKECr%2FQcmggSRttAFxmdRtrblyjVYZlktDSrMTj2hgZykZpeUjF8LpqIhZfg%2BZkLRd3fzZGH9dTb7UzxtCaEckLk7oTOttxoiqzo1X&X-Amz-Signature=a29c2718a06699684f56d9959f9d22027cb8ba37c786f9c2c96714782757258a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
