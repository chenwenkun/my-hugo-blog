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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667QK3JF7L%2F20260128%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260128T122743Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCICOL%2F3SMWbp%2B7FzAoMAhNvPH23Kl2pSrXTx%2B2D22YAXNAiEA9M0Z1gsBu7z1Iu%2BUbD64fCF%2F6rI8zk5Wmd8L%2F7AjgLgq%2FwMIbRAAGgw2Mzc0MjMxODM4MDUiDERjRlHK8r9TeKDCESrcAxZ0OrP59cxIKsR%2Bmi1S07b7MK42qD9AunObNFOjUSUUbLIY9yqG0vCb4%2B5HdIMGnFCWG6QkKjPvkus4RfslAbtDpZvVloT%2B3%2FhiaC0Spr62ZkTPu7Pv20%2BIrzN3IHvmZGc8ap%2BdvhskyGFlpCYs5Qw312DjjB7aX7ktSJpA5x%2FEduuC6lenFURxv%2B8QHA1IdhtUfDOGMizzj7ucN0eH5KZoUTSzyzGeFXe7lpTPb9glfwcryvhA%2FXlbkz1hAPiblBkIosA2oq%2F8v2iUQsWb%2B2nSzGqChZ7aYJXzZvz1wo7SoUxwXth%2BaLCuKT4Sves2WwnL7dnDSGoWZCsLqraxIevBSWH00kk1wB3Sr1V1i7mEz2qoWNujSSjIBmkCYp66B9KbHpd4Slh03iSc9F1kJPUHQp1adhNc6dBgpR8MyaOwaqVod0UbwO%2BtRkkloOEMlsl0Tfuai7WureyooD%2B1k%2FaLkCQM2bLKRuNvHevgWTryU7E55%2BqKHsUOb5%2FmrzYu6R0HygqeeFT0qI%2B1zEMHx%2FRIlaWleb3itc96uXu%2F9Lyw9FAPMP8LiPTYLClJmaclX0YT5z7EMyBGdj%2FV0irFCS8GopPy524NRsIcRYn5M5YY49mfjhA79bePfRP8MOX358sGOqUBwuSaM%2FgWrk%2BzZdGNukJqUeL%2FzX6nSmiROuV%2Bx8%2FrgUZ4Jt0GSBvj%2By6GC%2BcxaRjm3kv1R81xZCWvkWlh%2FTOdvW8u7DvOJInKwwCimOv0Wm0VVbFMyTlAJHMm5k%2BpYYVU8RFnDT3cv2FD7eVUXtFPvfBCtR5FrjgF4i1lczKPTBuA%2FovuPWcP3ssrxWJBF1LohowNHNki%2FQRFCxGtcQYygOSupclo&X-Amz-Signature=d33e97d60e7ca31d88a4be202003bc481a37413d065cb04370b202fc63b85b94&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667QK3JF7L%2F20260128%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260128T122743Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCICOL%2F3SMWbp%2B7FzAoMAhNvPH23Kl2pSrXTx%2B2D22YAXNAiEA9M0Z1gsBu7z1Iu%2BUbD64fCF%2F6rI8zk5Wmd8L%2F7AjgLgq%2FwMIbRAAGgw2Mzc0MjMxODM4MDUiDERjRlHK8r9TeKDCESrcAxZ0OrP59cxIKsR%2Bmi1S07b7MK42qD9AunObNFOjUSUUbLIY9yqG0vCb4%2B5HdIMGnFCWG6QkKjPvkus4RfslAbtDpZvVloT%2B3%2FhiaC0Spr62ZkTPu7Pv20%2BIrzN3IHvmZGc8ap%2BdvhskyGFlpCYs5Qw312DjjB7aX7ktSJpA5x%2FEduuC6lenFURxv%2B8QHA1IdhtUfDOGMizzj7ucN0eH5KZoUTSzyzGeFXe7lpTPb9glfwcryvhA%2FXlbkz1hAPiblBkIosA2oq%2F8v2iUQsWb%2B2nSzGqChZ7aYJXzZvz1wo7SoUxwXth%2BaLCuKT4Sves2WwnL7dnDSGoWZCsLqraxIevBSWH00kk1wB3Sr1V1i7mEz2qoWNujSSjIBmkCYp66B9KbHpd4Slh03iSc9F1kJPUHQp1adhNc6dBgpR8MyaOwaqVod0UbwO%2BtRkkloOEMlsl0Tfuai7WureyooD%2B1k%2FaLkCQM2bLKRuNvHevgWTryU7E55%2BqKHsUOb5%2FmrzYu6R0HygqeeFT0qI%2B1zEMHx%2FRIlaWleb3itc96uXu%2F9Lyw9FAPMP8LiPTYLClJmaclX0YT5z7EMyBGdj%2FV0irFCS8GopPy524NRsIcRYn5M5YY49mfjhA79bePfRP8MOX358sGOqUBwuSaM%2FgWrk%2BzZdGNukJqUeL%2FzX6nSmiROuV%2Bx8%2FrgUZ4Jt0GSBvj%2By6GC%2BcxaRjm3kv1R81xZCWvkWlh%2FTOdvW8u7DvOJInKwwCimOv0Wm0VVbFMyTlAJHMm5k%2BpYYVU8RFnDT3cv2FD7eVUXtFPvfBCtR5FrjgF4i1lczKPTBuA%2FovuPWcP3ssrxWJBF1LohowNHNki%2FQRFCxGtcQYygOSupclo&X-Amz-Signature=138841b003096c1ee002c97363adfbafb14ae3c9c1e6b67b195107277f9195c5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
