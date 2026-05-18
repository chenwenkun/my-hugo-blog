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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SYWXL3DS%2F20260518%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260518T021206Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIGatD2HLrRRtPTOtWArAAlxC3JSRo3wMBR9nEBeOK0VDAiEAs0Frku3Nnohj9uJVT4iEx%2Fx2JNmT%2BXTpnFTlAVngZwYqiAQIsf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDIjj2Kk0o%2B%2FaCkhQ1SrcA%2FC9JYh362YKqwQ%2F0ZedtzZGzJoib0Vnj5GD%2FCuT4KC%2BJGFM0qyDNwCU31m1hoqA%2F3xgnoTrJvWXSfW%2FEADSPNTdx%2FVOS7KcsH7EQcJ10Pa1b70Vu8l%2F51gi%2Ffkxq7Ka4wW%2F4Nt9uLxsjgXNb%2BmnxMkPCGH%2BCfzgYmomiB2XbJc6jwjmBWaTxKK7%2BEtc22Ct%2F1vTQ%2FsU5uu22z5q%2FikJbiUcUVywg2HyTULJsNpDfbCqZrn6MRDR3cvoAjLhtVzDLCCmB2ZYcRRBmBXj20WV8NattVrCWrHmBYi9OIUCkhXCZzUk4iOwHZw8l%2B%2BihaV61DreiWdF%2BZydgb0qEPdYi3L24V%2FSwIHezweVAgRwlAsob%2FcWM0H%2BAnNuLCK%2FYhxgVR%2B0GYSpS5AbJmelfc8KfFThW0EFBaZ2JbeMR5CThwkCdPDtVBfVED6EaAv2ObEvBBIUy0OwoOsRY9sjG0KfFEGCs3bss9uH0UXZ56EScPl4FOBz3pP5VYHRNAN2Jv2KT%2BTldJ1lj3zp0a6tWUOz%2BvqtbjhLH6iMt36jCNzicCDdbRIsBUqAEmW8wx1DCiqK%2Br96BeOW3PSoDLzzFlWh0mxbb5SPVSpuIthuH4o80%2FZuoEit2XNcJHLkOB76MKWsqdAGOqUB9clN2qhrUgsiIB9RM0qozbKt6IhdHADDZ1F3PDSt6MFtz03OuoPqry6lEdRZnSI%2BhbLi90KT70E4AT0Kka3ZIykhNaDz1T4ga6AmxeTwjCBzxl2nz5ys3MykRdVb5tcTZ%2FpAGZ18twboz%2FmYv8JMOXf7bQK9BzJI085Fw82nJCgbwirAb7fkMIufKtQxIFsbR%2B7CTRTir1lN0GkyJR9NX7uF1T%2Fp&X-Amz-Signature=8f3f9c9ccd4f6cdc28c54c0258f47e74839e882fddf6f4c6535327380cc8eb63&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SYWXL3DS%2F20260518%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260518T021206Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIGatD2HLrRRtPTOtWArAAlxC3JSRo3wMBR9nEBeOK0VDAiEAs0Frku3Nnohj9uJVT4iEx%2Fx2JNmT%2BXTpnFTlAVngZwYqiAQIsf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDIjj2Kk0o%2B%2FaCkhQ1SrcA%2FC9JYh362YKqwQ%2F0ZedtzZGzJoib0Vnj5GD%2FCuT4KC%2BJGFM0qyDNwCU31m1hoqA%2F3xgnoTrJvWXSfW%2FEADSPNTdx%2FVOS7KcsH7EQcJ10Pa1b70Vu8l%2F51gi%2Ffkxq7Ka4wW%2F4Nt9uLxsjgXNb%2BmnxMkPCGH%2BCfzgYmomiB2XbJc6jwjmBWaTxKK7%2BEtc22Ct%2F1vTQ%2FsU5uu22z5q%2FikJbiUcUVywg2HyTULJsNpDfbCqZrn6MRDR3cvoAjLhtVzDLCCmB2ZYcRRBmBXj20WV8NattVrCWrHmBYi9OIUCkhXCZzUk4iOwHZw8l%2B%2BihaV61DreiWdF%2BZydgb0qEPdYi3L24V%2FSwIHezweVAgRwlAsob%2FcWM0H%2BAnNuLCK%2FYhxgVR%2B0GYSpS5AbJmelfc8KfFThW0EFBaZ2JbeMR5CThwkCdPDtVBfVED6EaAv2ObEvBBIUy0OwoOsRY9sjG0KfFEGCs3bss9uH0UXZ56EScPl4FOBz3pP5VYHRNAN2Jv2KT%2BTldJ1lj3zp0a6tWUOz%2BvqtbjhLH6iMt36jCNzicCDdbRIsBUqAEmW8wx1DCiqK%2Br96BeOW3PSoDLzzFlWh0mxbb5SPVSpuIthuH4o80%2FZuoEit2XNcJHLkOB76MKWsqdAGOqUB9clN2qhrUgsiIB9RM0qozbKt6IhdHADDZ1F3PDSt6MFtz03OuoPqry6lEdRZnSI%2BhbLi90KT70E4AT0Kka3ZIykhNaDz1T4ga6AmxeTwjCBzxl2nz5ys3MykRdVb5tcTZ%2FpAGZ18twboz%2FmYv8JMOXf7bQK9BzJI085Fw82nJCgbwirAb7fkMIufKtQxIFsbR%2B7CTRTir1lN0GkyJR9NX7uF1T%2Fp&X-Amz-Signature=af63bf6452f95ced284068bc006b91b921032ac9cee7f2caf360160f1002800f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
