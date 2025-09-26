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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SO6LE5HR%2F20250926%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20250926T004836Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCm2PVAFR45WNNHeOlRFdGcctoMpLpiH5N55g5aDdkNUAIhAKkuTX2G%2FcgOk3chO2eotZcFWdF7CsuU%2FDe4p5Ppsqb3KogECIH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igy8sYttDpoh3YW9jBYq3AOm2zkextkeVjO0bmVqBG8AgqGfK1xusYyPTYMPg28cTZ%2FQiJPJh9sumONKi%2FwGirLw8lZFYsxKgY6pZBVhcazFqN0guUp3gh5BDYo%2FQRW6s%2Fb%2BIvElYns%2Fh7F0Od5I2sKZMEdH8nUJEpoqqZcSNoaXpHd%2FI8Xa5LGc0zS90GQ4XN3GNWg562leUV6ew0MC5gluWOWHZ8UBxLUkHN3%2BqiJ8F3EV3Io895%2BfzXiroKqrxe4Mlv0WtthpVqBxZI4B6zXXN%2FzKL1H91gSBdzFELawIrscCMjBIiauRsW%2Bju9ViveVZJmH%2BEMJ%2Fb487DEZwx7u8n6podJsPh2EWchs4GrnAWu2fFZiGdU0Ki985VQbcWX%2FaaQfR6BWGjh9AIKyp6uqSMshud%2FuSBJdfCEdhNiFXrLVEBoo%2FHdSFOdMJT2CqzC0fJ%2FOi9nt4P%2FctB4%2Fg7fsJ36KpjEoWN%2Fj%2FPMhVNhGLlAjKRdAgywh8iTuYxDn8LOf%2F7iXl1diZb0Dx7fF9AgD1%2F%2F%2Bn3PPeOlA2W7BK3d%2BW88nWERSkZpBq58TURGYjAQ4nBg2OnnJHqnkQ6weFHJjSu91IJb%2BugqRZ0AJ2oEgJ5zGyWC33W7Pe6UFqynytM7FkCj61lqBsrl1egzCCqNfGBjqkAQ96SkHH%2BLRgoIRFck6uCUZg%2BXna43kAFZYHm6EdrqqGXrSgh4WXHWsAhb3GlpRIh4hbjgNoz8U9NwcKDcqm5o2rvM2ZfspyHT5J0npWixZ5R%2B6%2FfdazP3F9LXvmurZ6Dc3SrUZ5rpU6CRBKGd8kkbsxUKZhNbmgwx6xTYyaSC9bGBFKltuI11x91lRFwmAucdabzdLXdz%2BMsTrV5TlOiz13KnIB&X-Amz-Signature=6d03913f442540dd48564e6ce8cfa222c135842a2a83a2d5809cbf3781da524e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SO6LE5HR%2F20250926%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20250926T004836Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCm2PVAFR45WNNHeOlRFdGcctoMpLpiH5N55g5aDdkNUAIhAKkuTX2G%2FcgOk3chO2eotZcFWdF7CsuU%2FDe4p5Ppsqb3KogECIH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igy8sYttDpoh3YW9jBYq3AOm2zkextkeVjO0bmVqBG8AgqGfK1xusYyPTYMPg28cTZ%2FQiJPJh9sumONKi%2FwGirLw8lZFYsxKgY6pZBVhcazFqN0guUp3gh5BDYo%2FQRW6s%2Fb%2BIvElYns%2Fh7F0Od5I2sKZMEdH8nUJEpoqqZcSNoaXpHd%2FI8Xa5LGc0zS90GQ4XN3GNWg562leUV6ew0MC5gluWOWHZ8UBxLUkHN3%2BqiJ8F3EV3Io895%2BfzXiroKqrxe4Mlv0WtthpVqBxZI4B6zXXN%2FzKL1H91gSBdzFELawIrscCMjBIiauRsW%2Bju9ViveVZJmH%2BEMJ%2Fb487DEZwx7u8n6podJsPh2EWchs4GrnAWu2fFZiGdU0Ki985VQbcWX%2FaaQfR6BWGjh9AIKyp6uqSMshud%2FuSBJdfCEdhNiFXrLVEBoo%2FHdSFOdMJT2CqzC0fJ%2FOi9nt4P%2FctB4%2Fg7fsJ36KpjEoWN%2Fj%2FPMhVNhGLlAjKRdAgywh8iTuYxDn8LOf%2F7iXl1diZb0Dx7fF9AgD1%2F%2F%2Bn3PPeOlA2W7BK3d%2BW88nWERSkZpBq58TURGYjAQ4nBg2OnnJHqnkQ6weFHJjSu91IJb%2BugqRZ0AJ2oEgJ5zGyWC33W7Pe6UFqynytM7FkCj61lqBsrl1egzCCqNfGBjqkAQ96SkHH%2BLRgoIRFck6uCUZg%2BXna43kAFZYHm6EdrqqGXrSgh4WXHWsAhb3GlpRIh4hbjgNoz8U9NwcKDcqm5o2rvM2ZfspyHT5J0npWixZ5R%2B6%2FfdazP3F9LXvmurZ6Dc3SrUZ5rpU6CRBKGd8kkbsxUKZhNbmgwx6xTYyaSC9bGBFKltuI11x91lRFwmAucdabzdLXdz%2BMsTrV5TlOiz13KnIB&X-Amz-Signature=fa6f3db5f20682d42b8e3b3e83cb5919a8d004032cee9b54b012bac8c43f0c6b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
