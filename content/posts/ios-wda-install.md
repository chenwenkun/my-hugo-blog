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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46655QRB6Q3%2F20251124%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251124T061828Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDw%2FOZS7EGXvyWqkU1wBClnBDHqV5SuUG9znFn5GNTxNgIhAJwGD5HPUtHa%2BDz8cxWndI3sSGrQN5akXkPXFlwFKnp7Kv8DCE8QABoMNjM3NDIzMTgzODA1IgxOheWlnvqY1NZ20l4q3AN1VZZvon%2FBTAq83nFMZXXNyj%2BjEbsKcrZRHFANp59spLg0nAfcZpkV3cRjM0mGzLaZF2HraqchVFsKUg8QUV90GoO05G%2Fdlztzs11p4JoEuiLGF0Ah6WwSYAeDw2KU2QZUJVHAmsuVn80djwxqvHMVgu%2BBZUOBipWTHUuh3hHMe9376oTb7AK46QmSaRx4oP7Mwuz%2FSzeh5trFOokUpx4vEmX5mWXDhLdjxcdIVPnZ3%2BtFZRhnNBPKLEWQx18dCqo0X6Pevr1%2FoMeAZK%2Bomnvy%2FW8PNWvk%2BOi0yN%2FBe8cbtN%2FbCEusjpo7mcUSldCM4uG1DG1pIG0E7iAm0aA1LT5pEQoEaL1%2F634wJfNNxUgqAo778%2BgrO1P%2FhUbyfPWMUWdt9TyYFEPw%2F%2BxjS47kU1GBpMFJjGTOKoEYUV2ZDENC3BHTMKeEmw7wy45QAJJcnrIF7adbKpwoXFVdKgAWY6lx6cksptoHBZjFKCaqm7XqZnojV3gg%2Bb9vc5ld00bdlmEGHSPfeI%2F0E6dKAzVVx0ML3ELVcuLira1uPq4dua%2BunZBK5%2BUv%2Bdyn6G5M1Fi6YjzEMg6VI%2B7xVFKemqBBiu%2B154loLKOWVpATOUjB7Nc3LOrriyAFY6%2B1fk4PmTDl2Y%2FJBjqkAfOeswd1ghRMN7ENdu6OBxP%2FbYaIFBbJxBpcuBCiHmMEnkXDidjWBhrLA6%2Fyz%2FsIz9%2FyfBr05BhGwf3cRucxvQF5EDvT3jOjopGdmgwqHuB8pIujt7Ibp3rlsm9KybULiXRbhCHqTTWjK53vjFk6WCvszwurx4Ey7jYm3SoWqHeAED8oS0L6UvmRjLJyamhoxcGyqbBxNflv0SM9S19Oahrgc5q8&X-Amz-Signature=c6015ac4f530256879ed4ee21409df174acb0c5630d67093e9a6423e8a45de90&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46655QRB6Q3%2F20251124%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251124T061828Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDw%2FOZS7EGXvyWqkU1wBClnBDHqV5SuUG9znFn5GNTxNgIhAJwGD5HPUtHa%2BDz8cxWndI3sSGrQN5akXkPXFlwFKnp7Kv8DCE8QABoMNjM3NDIzMTgzODA1IgxOheWlnvqY1NZ20l4q3AN1VZZvon%2FBTAq83nFMZXXNyj%2BjEbsKcrZRHFANp59spLg0nAfcZpkV3cRjM0mGzLaZF2HraqchVFsKUg8QUV90GoO05G%2Fdlztzs11p4JoEuiLGF0Ah6WwSYAeDw2KU2QZUJVHAmsuVn80djwxqvHMVgu%2BBZUOBipWTHUuh3hHMe9376oTb7AK46QmSaRx4oP7Mwuz%2FSzeh5trFOokUpx4vEmX5mWXDhLdjxcdIVPnZ3%2BtFZRhnNBPKLEWQx18dCqo0X6Pevr1%2FoMeAZK%2Bomnvy%2FW8PNWvk%2BOi0yN%2FBe8cbtN%2FbCEusjpo7mcUSldCM4uG1DG1pIG0E7iAm0aA1LT5pEQoEaL1%2F634wJfNNxUgqAo778%2BgrO1P%2FhUbyfPWMUWdt9TyYFEPw%2F%2BxjS47kU1GBpMFJjGTOKoEYUV2ZDENC3BHTMKeEmw7wy45QAJJcnrIF7adbKpwoXFVdKgAWY6lx6cksptoHBZjFKCaqm7XqZnojV3gg%2Bb9vc5ld00bdlmEGHSPfeI%2F0E6dKAzVVx0ML3ELVcuLira1uPq4dua%2BunZBK5%2BUv%2Bdyn6G5M1Fi6YjzEMg6VI%2B7xVFKemqBBiu%2B154loLKOWVpATOUjB7Nc3LOrriyAFY6%2B1fk4PmTDl2Y%2FJBjqkAfOeswd1ghRMN7ENdu6OBxP%2FbYaIFBbJxBpcuBCiHmMEnkXDidjWBhrLA6%2Fyz%2FsIz9%2FyfBr05BhGwf3cRucxvQF5EDvT3jOjopGdmgwqHuB8pIujt7Ibp3rlsm9KybULiXRbhCHqTTWjK53vjFk6WCvszwurx4Ey7jYm3SoWqHeAED8oS0L6UvmRjLJyamhoxcGyqbBxNflv0SM9S19Oahrgc5q8&X-Amz-Signature=de8dce8d50dd1be7b50ac31db02e7931167f7d945cf417b1909b4c5cae46f0b6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
