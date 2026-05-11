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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662BWTZXV3%2F20260511%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260511T020408Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEIaCXVzLXdlc3QtMiJIMEYCIQCedeu58rTlltnt5rzlWCG4hZbLJZ6IQ1UcB16j9cVa4AIhAKk72nem21qRLpOzQNP0Pelt7mvWaf5SY9uNlnT8PFV7Kv8DCAsQABoMNjM3NDIzMTgzODA1IgyERN%2FGStZIKMWa9gYq3AOaNa8MJimBU8rJA150WmToqOm6Qhp6OkXjulMcORA4lt1r%2FpebVW4fbGvcrqfhQs0vMVt%2F%2FANpTIvU4VhZbPOP1Op%2FI5YOgD3tnIe9EIuPWW8c0I4lue%2FAYYKKV8Rwz7CptgOLRorBP6njh0eHjol9lF4EnX8Hf8jky7EtxXHFDlH2CVSxQOG574xOzYnFTsqZD1rjBx8oIppagTl2biSr96MW1bUQDfXqjhtISD3PXrQHz1iNap%2F66KrtZTYd8nbP7hccSnFnATR3Vtjpm%2BI2P0%2FkmPuqfB2ttmNDK5HA154GZIxnuFGGkBDt6TSi3l93A4KWiQ0PyLucdI2nfb%2Bo05tuwWei0mF1L2C2v8w15DdmYxkbTvPsSAi18akWS%2F3TJ2HPHTxdeWqVY5hTgdjbjAyTqfLrx%2BAtvfcxDqkGyWwjG9cYQhvlOLIvC1RXMRWRTnWwYTxeKe%2FDg2hJKnPbxKC1AvmBXowvse0k%2BDxy%2F62YdOOZ8kK0ahGIb2KAcV9ex%2FgOFXqMb9y0jFvh3jBilRsEGJR4zLyBzua5Z4NIqvaVLq7B8lOIagCsdAHfhVA2varpR5wOwJz0N%2Bd5ZKNav4qnkrXSDoRaXe2OUTyZDEOOhRIf76z1PYZJPDCp4YTQBjqkAduiSglNxeq%2BvBx9%2FcaiXu6phjSpMGX0SUZ3TsA8IIXegL0NGiUG4AU3u%2Fe9FiS48xJsI2kW8V0FCtqiEoke%2BxzjpM9E5bB6K%2FJOgjgXeSXMiLIVajZwBBSWodSYmlSd5g615xrwK2%2F%2B4cufpJ%2BYDtJmZr%2F41RNE0HTiPSp3%2BP58svRvABhPdLe%2FnYIxBn8tAU8gQ7St9%2FnY5XJtuEI%2FRkLct03Q&X-Amz-Signature=6c6c92b9e1c9fa8f2408d96953207a9a46a20201aca9601ecaf7d29e99d29b7a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662BWTZXV3%2F20260511%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260511T020408Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEIaCXVzLXdlc3QtMiJIMEYCIQCedeu58rTlltnt5rzlWCG4hZbLJZ6IQ1UcB16j9cVa4AIhAKk72nem21qRLpOzQNP0Pelt7mvWaf5SY9uNlnT8PFV7Kv8DCAsQABoMNjM3NDIzMTgzODA1IgyERN%2FGStZIKMWa9gYq3AOaNa8MJimBU8rJA150WmToqOm6Qhp6OkXjulMcORA4lt1r%2FpebVW4fbGvcrqfhQs0vMVt%2F%2FANpTIvU4VhZbPOP1Op%2FI5YOgD3tnIe9EIuPWW8c0I4lue%2FAYYKKV8Rwz7CptgOLRorBP6njh0eHjol9lF4EnX8Hf8jky7EtxXHFDlH2CVSxQOG574xOzYnFTsqZD1rjBx8oIppagTl2biSr96MW1bUQDfXqjhtISD3PXrQHz1iNap%2F66KrtZTYd8nbP7hccSnFnATR3Vtjpm%2BI2P0%2FkmPuqfB2ttmNDK5HA154GZIxnuFGGkBDt6TSi3l93A4KWiQ0PyLucdI2nfb%2Bo05tuwWei0mF1L2C2v8w15DdmYxkbTvPsSAi18akWS%2F3TJ2HPHTxdeWqVY5hTgdjbjAyTqfLrx%2BAtvfcxDqkGyWwjG9cYQhvlOLIvC1RXMRWRTnWwYTxeKe%2FDg2hJKnPbxKC1AvmBXowvse0k%2BDxy%2F62YdOOZ8kK0ahGIb2KAcV9ex%2FgOFXqMb9y0jFvh3jBilRsEGJR4zLyBzua5Z4NIqvaVLq7B8lOIagCsdAHfhVA2varpR5wOwJz0N%2Bd5ZKNav4qnkrXSDoRaXe2OUTyZDEOOhRIf76z1PYZJPDCp4YTQBjqkAduiSglNxeq%2BvBx9%2FcaiXu6phjSpMGX0SUZ3TsA8IIXegL0NGiUG4AU3u%2Fe9FiS48xJsI2kW8V0FCtqiEoke%2BxzjpM9E5bB6K%2FJOgjgXeSXMiLIVajZwBBSWodSYmlSd5g615xrwK2%2F%2B4cufpJ%2BYDtJmZr%2F41RNE0HTiPSp3%2BP58svRvABhPdLe%2FnYIxBn8tAU8gQ7St9%2FnY5XJtuEI%2FRkLct03Q&X-Amz-Signature=211ab0518d96ed42649517d69c333ed58d04824f1de3934ced232c20713dde40&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
