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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466W2ZC7HH7%2F20260215%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260215T011523Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEgaCXVzLXdlc3QtMiJGMEQCIHCCYRJSNFA%2BoNxjoysjulG%2FvAGGymIVaBv1G%2BCvITu8AiAkMVsmgmPzZWMv7i0KbRJ99ACljga%2BamQTJBd7nQN%2Fkir%2FAwgREAAaDDYzNzQyMzE4MzgwNSIMcGIQzWLu3LZ8NcKYKtwDCPZwhXTwVcIP87h0YgbjFvVhGTtuz7oyF6lJMMaw4M4Eh%2B7WxhpXeZYeFNHs%2FDdcBSLONj3DvvnvkLTd6DqcEbQtlW3%2Fq4CudMsqudbC7j1dhsyxol5YeLLfOV3pE3qNu6FNE6xd2cJ2IxTwNCCAU8K0uow23pEBSz6U9U5lFt2EVOxTBoHfYUpbKzzncX7tLrI1ivQ%2Br7U1mhVo4qTT079x5r72pphMSP0vylXyrWkEsujYaZmf9d1jZehcTS1ttjgVLNJKgvC8TuNqvXDoD%2FR312%2B5ydjehox%2F%2BC2D4eMnw%2BNtqyM4Ezm0lucvgFQ4k%2BqRRDNw%2BNqcGKFOs22nC3YPTKMcFIRaXcnyTrmcJNsL%2BftajWcQpN1bblFz%2F6IX6yAmtM%2BHo9vQ3hVT8Jd7o5%2Bxbq2gS6pL3rlBLEjZYbBcp4wuoFNbbTPV5rn5fm57mU152O5%2FBREg2bOPhxQhfaoESEyXmJePuG8Hs3MxrmmqnhEm8hqL2EUefTf1Stcz7%2BFHHcw5BC31dhV4eO3u9wBLwQXXJUXIpbeOl3t1JIp8H9IC6GEUcF8RSeHWPJH5R3Aiv8yelHiR36JeXpUs36oTr9BmiTOKK2lzsWTST3sXhJgieS0TOZ3z25kwhJ7EzAY6pgFdKxZFiaXFMc0UifTK%2BYX3llmSUx55Pr7zV7VPuw0YNl8As4XVF1IyLgK64QJno0FArHgP9CtgApQ%2FMufUPqfAK%2FzXJCdJh7qGAg3mR78vYbwOr0jC%2FfP%2FifNapfwv0nFVYPsfmcwU9%2BiUDO%2F9pvyrgWXYIsp4e5Q5YNJgk8YXkchYixu%2BFxXDbrZwROM1pKtD125TaqNRMd6xWvI07ALuG3aTKj6z&X-Amz-Signature=5a6258867c80b1de31d749da42a3973ce85b9f87df40919423a5ef9fc6815f6f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466W2ZC7HH7%2F20260215%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260215T011523Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEgaCXVzLXdlc3QtMiJGMEQCIHCCYRJSNFA%2BoNxjoysjulG%2FvAGGymIVaBv1G%2BCvITu8AiAkMVsmgmPzZWMv7i0KbRJ99ACljga%2BamQTJBd7nQN%2Fkir%2FAwgREAAaDDYzNzQyMzE4MzgwNSIMcGIQzWLu3LZ8NcKYKtwDCPZwhXTwVcIP87h0YgbjFvVhGTtuz7oyF6lJMMaw4M4Eh%2B7WxhpXeZYeFNHs%2FDdcBSLONj3DvvnvkLTd6DqcEbQtlW3%2Fq4CudMsqudbC7j1dhsyxol5YeLLfOV3pE3qNu6FNE6xd2cJ2IxTwNCCAU8K0uow23pEBSz6U9U5lFt2EVOxTBoHfYUpbKzzncX7tLrI1ivQ%2Br7U1mhVo4qTT079x5r72pphMSP0vylXyrWkEsujYaZmf9d1jZehcTS1ttjgVLNJKgvC8TuNqvXDoD%2FR312%2B5ydjehox%2F%2BC2D4eMnw%2BNtqyM4Ezm0lucvgFQ4k%2BqRRDNw%2BNqcGKFOs22nC3YPTKMcFIRaXcnyTrmcJNsL%2BftajWcQpN1bblFz%2F6IX6yAmtM%2BHo9vQ3hVT8Jd7o5%2Bxbq2gS6pL3rlBLEjZYbBcp4wuoFNbbTPV5rn5fm57mU152O5%2FBREg2bOPhxQhfaoESEyXmJePuG8Hs3MxrmmqnhEm8hqL2EUefTf1Stcz7%2BFHHcw5BC31dhV4eO3u9wBLwQXXJUXIpbeOl3t1JIp8H9IC6GEUcF8RSeHWPJH5R3Aiv8yelHiR36JeXpUs36oTr9BmiTOKK2lzsWTST3sXhJgieS0TOZ3z25kwhJ7EzAY6pgFdKxZFiaXFMc0UifTK%2BYX3llmSUx55Pr7zV7VPuw0YNl8As4XVF1IyLgK64QJno0FArHgP9CtgApQ%2FMufUPqfAK%2FzXJCdJh7qGAg3mR78vYbwOr0jC%2FfP%2FifNapfwv0nFVYPsfmcwU9%2BiUDO%2F9pvyrgWXYIsp4e5Q5YNJgk8YXkchYixu%2BFxXDbrZwROM1pKtD125TaqNRMd6xWvI07ALuG3aTKj6z&X-Amz-Signature=350bf8df0daa0770635b9ba4d727d48cc8a7b910e7b50d6a28738dd150ef3c3d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
