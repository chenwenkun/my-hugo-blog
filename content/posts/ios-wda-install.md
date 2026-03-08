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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662MD7KB7L%2F20260308%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260308T181949Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFEaCXVzLXdlc3QtMiJIMEYCIQCBreIpPJEuqPq9MxurnNYy%2FKPcUoMRw22VyMmO3lEVDAIhAJJXwrnB5%2FFLHoK358R4gYkvk9h4J1WOOJcd%2Fsf7Jlz5Kv8DCBoQABoMNjM3NDIzMTgzODA1IgyPsta2d0a6db7gTeMq3APenv1Cbp7FOkYuD9fspDQ5YRadVAx2sBDeNWzuBWTyYyLWVj25mqW7jbfg7dXUgV%2BZqS1a3IN8Qp4YNmE8Z51GxBlcd69yTEMm14Y286p%2FzC%2FZAJeW%2BynArYYhj36xeK3t84OOlQJRTHTkYt4eH348KfctOSHNh4FUQuG8JZqwVPwBRlqTHbulZXEkgrphy%2BW%2BE3JvAEggZ3L%2FZ%2FEM75SUpzvNav%2Bse2qhtWC5wZvb0WHTGzP69ZcAvTlaz5SLn9MLvNTRGUktAYe4xixAlEpX8B7rJrScdC9Qb%2B8%2FAlc3jV9AJuUFm6IMX51fVs1fOKFS9qMhHmgoe2AJnn0cumClD%2BXvnufA9DDQkhKwd2AdLWrIf%2BXzIIV9PCeYTncAfNa3c6HXJ6QyuebzhdtTZMLlqZhufKuBsb64xK9okO%2FORoTSsakExq7zoVMcyFAcer3ph9SgbTqQvE2t3MebAGf8jFm0RguZNZ%2ByOZLylJws%2F6r%2BGCEFcO8idETo1oCv0rbOtvUGAdZV7OzdYE6J5hxW4ksITRvMDvd0tnRSc9uViBa2LnhXkOWlDycboGnHhwl9v4EBFom0d1AXQzegM0MaLywzBBU8BHi060ahIOQBAsZAsAIAHE8AfPbuyTCj3bbNBjqkAeagtWeuUFmd2wt9wjAuzYQwiF99LRSeFSWPV7JvZg%2F69%2BdQbsp595epmUUxFKX6TDuvtqOS8bVAcTKL4eiG1Fp4PWjnPZh2Dg1R7Rdzk2%2FLxBg5%2FUabut2YaZKszjuk5c9PTYSmkhR2CdVIWgujW6vN9RFrif8JgJ2LrowFkkiwKRc8v3SR7Z80%2FIS1inSl%2F%2FHzRowfUjNfwN2d%2FkocaCS01%2B16&X-Amz-Signature=f8540e8f225db9f9424ea440f18a9e8fbbfad5903ba51c39168f765eef015c76&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662MD7KB7L%2F20260308%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260308T181949Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFEaCXVzLXdlc3QtMiJIMEYCIQCBreIpPJEuqPq9MxurnNYy%2FKPcUoMRw22VyMmO3lEVDAIhAJJXwrnB5%2FFLHoK358R4gYkvk9h4J1WOOJcd%2Fsf7Jlz5Kv8DCBoQABoMNjM3NDIzMTgzODA1IgyPsta2d0a6db7gTeMq3APenv1Cbp7FOkYuD9fspDQ5YRadVAx2sBDeNWzuBWTyYyLWVj25mqW7jbfg7dXUgV%2BZqS1a3IN8Qp4YNmE8Z51GxBlcd69yTEMm14Y286p%2FzC%2FZAJeW%2BynArYYhj36xeK3t84OOlQJRTHTkYt4eH348KfctOSHNh4FUQuG8JZqwVPwBRlqTHbulZXEkgrphy%2BW%2BE3JvAEggZ3L%2FZ%2FEM75SUpzvNav%2Bse2qhtWC5wZvb0WHTGzP69ZcAvTlaz5SLn9MLvNTRGUktAYe4xixAlEpX8B7rJrScdC9Qb%2B8%2FAlc3jV9AJuUFm6IMX51fVs1fOKFS9qMhHmgoe2AJnn0cumClD%2BXvnufA9DDQkhKwd2AdLWrIf%2BXzIIV9PCeYTncAfNa3c6HXJ6QyuebzhdtTZMLlqZhufKuBsb64xK9okO%2FORoTSsakExq7zoVMcyFAcer3ph9SgbTqQvE2t3MebAGf8jFm0RguZNZ%2ByOZLylJws%2F6r%2BGCEFcO8idETo1oCv0rbOtvUGAdZV7OzdYE6J5hxW4ksITRvMDvd0tnRSc9uViBa2LnhXkOWlDycboGnHhwl9v4EBFom0d1AXQzegM0MaLywzBBU8BHi060ahIOQBAsZAsAIAHE8AfPbuyTCj3bbNBjqkAeagtWeuUFmd2wt9wjAuzYQwiF99LRSeFSWPV7JvZg%2F69%2BdQbsp595epmUUxFKX6TDuvtqOS8bVAcTKL4eiG1Fp4PWjnPZh2Dg1R7Rdzk2%2FLxBg5%2FUabut2YaZKszjuk5c9PTYSmkhR2CdVIWgujW6vN9RFrif8JgJ2LrowFkkiwKRc8v3SR7Z80%2FIS1inSl%2F%2FHzRowfUjNfwN2d%2FkocaCS01%2B16&X-Amz-Signature=7a47de430117d61793a1ed5634aed2c8b22e69fe28bd12065a0addfdf79bb131&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
