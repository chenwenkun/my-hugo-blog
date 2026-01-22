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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665TYTTSJ7%2F20260122%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260122T005934Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAgaCXVzLXdlc3QtMiJHMEUCIBLWpWPQGyz7HNAD%2FnibAIaK5rTbQ%2FaD4W1tBpwM4aKxAiEAjixP%2BPXST%2B2MZAmceOgz%2BrKxaq%2FyXbK9d5Mj%2BPMTSMwqiAQI0f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOBzi1yQ%2BcFZZLfDPSrcA85peGU%2FTzqI6raFWoGJa%2FeXd7JIJuttiLgZiNfiTt%2FlreyHIPd4%2Bevl4YJCdMuAw9ciQtOZzto8wSAuDoeUWXgEIkwrInBO4sXH5GBX2aCQG%2BwQ47Neah81hjGk2HEp61Ag0wA1Wc27l29JTBeedpsWvoxA%2FC6hxWyTCbHJHDjH191h2P1EG19w35yRj%2BImJjo3HfUC261f%2BPZ8FjmbTHpwpMS9mbi0ygNXxVVJSp62vjzen5vs1deAXsPN7GFZbQAM8HhTs8korEzXiWokSROKW4UQwp1%2BXCHyooDWfMybu42AP7OKbdN8GtWHedNaTdcAH04G3xO2ASYjjA8FL4x5HhjSqkGcWUqJ1cr5f3w%2FQRhR4EUgtYDC9g%2FbiU7sXJxgTXOiF5UPGqRNUsqDmel0ZCg4yXfl%2FZ%2F0eKuaTO8QjiIVa%2FYK7cEcE7kGFN7tg4cIYCBDbzyXXk9iusQaAJi43HBqoJreGOpZF2O37egWl75u64dOCTb6N6%2BSVqtJMbYzR%2FfWNVIsYdoa9xJnEMxq09wjx448LQICMa5LQ%2Bxr3Zn0tm2it2wPUvbB8xkH1oyaOpjr73PW%2F9oA5jdKzmtbiFaV%2F63CUXGofvLNEfZ2L8fDxZhvjubeKck4MKfYxcsGOqUBVh%2BL65rN3%2FUNQb9ZCxoO7m%2FwXJOGXOJyfIwS82070UEUeETML1Eqkf05m02wythY%2BqpWoRKLNpjkOjYe%2FC5nqvg0lNxDdNyviQIaw8sm0xt%2BiTVXL8%2FRDL8r6PMMqXYs2xgJ6nCcyubiHYT987l%2B%2F%2FiVCebZzVpHC1%2FneeLjyMBUX9lOW86QpBWHN0hwvBF7ySbu%2BpW8eXpj9EHyrX9EzA3SrU8W&X-Amz-Signature=d64dc2536c8e7582bef77ce062dc4d566211f8dfaa1473e10a64fad8bd347231&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665TYTTSJ7%2F20260122%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260122T005934Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAgaCXVzLXdlc3QtMiJHMEUCIBLWpWPQGyz7HNAD%2FnibAIaK5rTbQ%2FaD4W1tBpwM4aKxAiEAjixP%2BPXST%2B2MZAmceOgz%2BrKxaq%2FyXbK9d5Mj%2BPMTSMwqiAQI0f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOBzi1yQ%2BcFZZLfDPSrcA85peGU%2FTzqI6raFWoGJa%2FeXd7JIJuttiLgZiNfiTt%2FlreyHIPd4%2Bevl4YJCdMuAw9ciQtOZzto8wSAuDoeUWXgEIkwrInBO4sXH5GBX2aCQG%2BwQ47Neah81hjGk2HEp61Ag0wA1Wc27l29JTBeedpsWvoxA%2FC6hxWyTCbHJHDjH191h2P1EG19w35yRj%2BImJjo3HfUC261f%2BPZ8FjmbTHpwpMS9mbi0ygNXxVVJSp62vjzen5vs1deAXsPN7GFZbQAM8HhTs8korEzXiWokSROKW4UQwp1%2BXCHyooDWfMybu42AP7OKbdN8GtWHedNaTdcAH04G3xO2ASYjjA8FL4x5HhjSqkGcWUqJ1cr5f3w%2FQRhR4EUgtYDC9g%2FbiU7sXJxgTXOiF5UPGqRNUsqDmel0ZCg4yXfl%2FZ%2F0eKuaTO8QjiIVa%2FYK7cEcE7kGFN7tg4cIYCBDbzyXXk9iusQaAJi43HBqoJreGOpZF2O37egWl75u64dOCTb6N6%2BSVqtJMbYzR%2FfWNVIsYdoa9xJnEMxq09wjx448LQICMa5LQ%2Bxr3Zn0tm2it2wPUvbB8xkH1oyaOpjr73PW%2F9oA5jdKzmtbiFaV%2F63CUXGofvLNEfZ2L8fDxZhvjubeKck4MKfYxcsGOqUBVh%2BL65rN3%2FUNQb9ZCxoO7m%2FwXJOGXOJyfIwS82070UEUeETML1Eqkf05m02wythY%2BqpWoRKLNpjkOjYe%2FC5nqvg0lNxDdNyviQIaw8sm0xt%2BiTVXL8%2FRDL8r6PMMqXYs2xgJ6nCcyubiHYT987l%2B%2F%2FiVCebZzVpHC1%2FneeLjyMBUX9lOW86QpBWHN0hwvBF7ySbu%2BpW8eXpj9EHyrX9EzA3SrU8W&X-Amz-Signature=b85d2a55e277bf3d0ab3740220a830520c48f85d515d6c338c333f53529fb5f7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
