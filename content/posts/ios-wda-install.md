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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466T4CMAILA%2F20260601%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260601T110653Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjED4aCXVzLXdlc3QtMiJIMEYCIQCLCjpRKOWp3iZ9IMRNtBm9oedFez0I80rAmkprchCO6wIhAIvtQyHDjgihy%2BBl62euuYtkGV2s1DDbDceJcSf%2FJP4lKv8DCAcQABoMNjM3NDIzMTgzODA1IgwTmmEv1%2FIlEuE%2B%2BQ4q3APBXhe6afmMgFN01fICFNcX3Vi8v0TtNgAAUi8PvZHWRWYrlOFDO65yLe9pV41SqTqV%2BdvgXoc0Y3mY%2F5X4ujMJf%2BC7ZHIcPywmENBk0qwWr0RiPeeAW%2F%2FYeI89nq7tB%2BZpnmH99u85HqZ%2BsufkONfqstozB8bwZ3iaRW9rPz%2FFltdRiQwnCdu6BYg1kBEkWxDEQAVwAo3PZf8EnWZdHC5uDIluQwleC%2FS4ESgy5D0sP8jExZSXCqXYX0mTFzlvYSMgow%2BQWtefkLIIespo4r5A%2BJp2BUuNKw4D8%2F%2FPEzJSQS10jDyhVrhz9JvNfzbLaaXlYxMEyMI6eusjiLyPv2qrXIy1XpZLOR4fausM47YQosVvmc%2BG%2BQbeI8bf9tX9eoh%2BTrKBYQSGX%2BTZDpGbIH5qoKuBOBS7Ih%2BNpUMy5ImocLAhp3R0AYv5XgcrsG2kZ8pVTOKAc8V%2F3PhrJesce%2BqPh5bH6eTxNZo6Y1twkcfGPdcmhpVDL2k%2BS5kv%2FaKxP7lA2ZqIsW8gjagCkAXzXZ%2BAHOuGzTA5jELKZXIUHDeL4gSqh0vHN0qpL2eg%2FqdkQxcR0tSSI7gz2nGZFfpYpn0efM761jTWVGAN3Xt3ISQwKBMMoBxMFAPwhjlaOzDcwvTQBjqkAaI8%2BV7IO1yLZHEbW6z80Dvc579wr%2Bra1rvH49GrB9CnIKke8FYfqnJBxKRBikSV2BAADy5sIfo5X6mO2soq%2FNlJiztQJ5kGghoiFSFZxVaAnvCRGHQ7ewAZ0xMjaR3Rt73uL25R%2FPUNA34%2FlevIisyx2WYOuKUiiBR9J%2BaUHfy0BOVClaQEMMcWrrghu57REOk%2F2Gz%2Fddvt1OSjqrMz3N0IT%2BXB&X-Amz-Signature=8065bf5aa9f73a277ff978e19c608066666e84a2edabd6e7f8d889c13f199255&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466T4CMAILA%2F20260601%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260601T110653Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjED4aCXVzLXdlc3QtMiJIMEYCIQCLCjpRKOWp3iZ9IMRNtBm9oedFez0I80rAmkprchCO6wIhAIvtQyHDjgihy%2BBl62euuYtkGV2s1DDbDceJcSf%2FJP4lKv8DCAcQABoMNjM3NDIzMTgzODA1IgwTmmEv1%2FIlEuE%2B%2BQ4q3APBXhe6afmMgFN01fICFNcX3Vi8v0TtNgAAUi8PvZHWRWYrlOFDO65yLe9pV41SqTqV%2BdvgXoc0Y3mY%2F5X4ujMJf%2BC7ZHIcPywmENBk0qwWr0RiPeeAW%2F%2FYeI89nq7tB%2BZpnmH99u85HqZ%2BsufkONfqstozB8bwZ3iaRW9rPz%2FFltdRiQwnCdu6BYg1kBEkWxDEQAVwAo3PZf8EnWZdHC5uDIluQwleC%2FS4ESgy5D0sP8jExZSXCqXYX0mTFzlvYSMgow%2BQWtefkLIIespo4r5A%2BJp2BUuNKw4D8%2F%2FPEzJSQS10jDyhVrhz9JvNfzbLaaXlYxMEyMI6eusjiLyPv2qrXIy1XpZLOR4fausM47YQosVvmc%2BG%2BQbeI8bf9tX9eoh%2BTrKBYQSGX%2BTZDpGbIH5qoKuBOBS7Ih%2BNpUMy5ImocLAhp3R0AYv5XgcrsG2kZ8pVTOKAc8V%2F3PhrJesce%2BqPh5bH6eTxNZo6Y1twkcfGPdcmhpVDL2k%2BS5kv%2FaKxP7lA2ZqIsW8gjagCkAXzXZ%2BAHOuGzTA5jELKZXIUHDeL4gSqh0vHN0qpL2eg%2FqdkQxcR0tSSI7gz2nGZFfpYpn0efM761jTWVGAN3Xt3ISQwKBMMoBxMFAPwhjlaOzDcwvTQBjqkAaI8%2BV7IO1yLZHEbW6z80Dvc579wr%2Bra1rvH49GrB9CnIKke8FYfqnJBxKRBikSV2BAADy5sIfo5X6mO2soq%2FNlJiztQJ5kGghoiFSFZxVaAnvCRGHQ7ewAZ0xMjaR3Rt73uL25R%2FPUNA34%2FlevIisyx2WYOuKUiiBR9J%2BaUHfy0BOVClaQEMMcWrrghu57REOk%2F2Gz%2Fddvt1OSjqrMz3N0IT%2BXB&X-Amz-Signature=863e1137eee4f39ad6b98577760c40279b440f0ecfc9c2869cf7be3f9a52ef56&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
