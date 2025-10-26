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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466726EGXPP%2F20251026%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251026T061450Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCMTFvRv6ghTT%2FiwYDvM5C0Ih2RLDCr%2FBZy0JcBiU0R8AIhAPn6LQT0lPk4N2EunKhb8PPGcBZR62n1mSqAt2Jzf%2BgSKogECIP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgybgRbur5pN3UZYW2Iq3AM5hxrsf5%2BSv6pCl%2FA1tEk3bnfefiwVHQptv0%2BCAQc5%2Fcv1WizLdSf5HjhTUlqragHInO3Z4%2BlvwuOAr2mCnJV2qFiLiH6Xtg5KIjsqrhfYB%2FotwYjLSFfBy%2F6%2F%2F50ZkbgcyVJqFa4%2FFIvQeJvUD2pZu%2BidMYK7viK%2FPje9UY3FhnShEKtAIt4wwIB64qXU43u1cdEHYMdLl68LcsGLMap%2FOCGRcCYuaiC4LptD3FLUgwFMVehl2ZJTryfdKGTXUwHP3P2kpXBBhsgkRc6LQdfzhre8MALaWb3oTXwfokehBDU48FoEr6odfBj4VaUrtvBmuGLXZLzPiL1VF1ikuH8ZK5OM3vXX1iQPd58QE1mXlFIEjlaa9ROW9e9KcRxuDowjTUocYEiJr8Xqidd2lQbVO4r%2FcVAA4e%2BUCZrhHms%2BEOrxUXTyjAZfa1FiEbYY5X2zYKdk%2FK8bRyfahK7TUFgRnh3nljpLjbkaEoj8OV7HolHCHyddGI5G4DurEmubOFQSUsXjSuNclhyb8XTMV4E3lXDDsKiIXHe17NQtZdA6974%2F%2B5%2FbQevSHRgzUSWk4fLgUqExIPG8IDaABwhL8Yk3UP1fqsCHpvypG4wWgkK9gyDmDlDt6X7nbzXIRjCFhvbHBjqkAQqPBbz6fJ3CTHr5wN6rDTwKM27fIMpKXt0KBTu%2BXwIx18%2BFJTFGJUwtBA5tjHFi6%2FsHhCLWoL3ggYrKXW7zlQqcmdq6t%2BvFkYmGasySLwf%2FlFegywCLhxjK1VEnSoIa%2BApa9hiZRf9Na12tbSWtW0aqfEyhuVY8HJbAeUo94x0xRPBCoBtyPPj%2FzaF0YcboqVeDve2TCIk4HYjSs9DfHpsdRblR&X-Amz-Signature=4ff62fea034490e2ed71f04afd66cd3c79089663dd9847d5f610ec9dd2db11f2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466726EGXPP%2F20251026%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251026T061450Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCMTFvRv6ghTT%2FiwYDvM5C0Ih2RLDCr%2FBZy0JcBiU0R8AIhAPn6LQT0lPk4N2EunKhb8PPGcBZR62n1mSqAt2Jzf%2BgSKogECIP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgybgRbur5pN3UZYW2Iq3AM5hxrsf5%2BSv6pCl%2FA1tEk3bnfefiwVHQptv0%2BCAQc5%2Fcv1WizLdSf5HjhTUlqragHInO3Z4%2BlvwuOAr2mCnJV2qFiLiH6Xtg5KIjsqrhfYB%2FotwYjLSFfBy%2F6%2F%2F50ZkbgcyVJqFa4%2FFIvQeJvUD2pZu%2BidMYK7viK%2FPje9UY3FhnShEKtAIt4wwIB64qXU43u1cdEHYMdLl68LcsGLMap%2FOCGRcCYuaiC4LptD3FLUgwFMVehl2ZJTryfdKGTXUwHP3P2kpXBBhsgkRc6LQdfzhre8MALaWb3oTXwfokehBDU48FoEr6odfBj4VaUrtvBmuGLXZLzPiL1VF1ikuH8ZK5OM3vXX1iQPd58QE1mXlFIEjlaa9ROW9e9KcRxuDowjTUocYEiJr8Xqidd2lQbVO4r%2FcVAA4e%2BUCZrhHms%2BEOrxUXTyjAZfa1FiEbYY5X2zYKdk%2FK8bRyfahK7TUFgRnh3nljpLjbkaEoj8OV7HolHCHyddGI5G4DurEmubOFQSUsXjSuNclhyb8XTMV4E3lXDDsKiIXHe17NQtZdA6974%2F%2B5%2FbQevSHRgzUSWk4fLgUqExIPG8IDaABwhL8Yk3UP1fqsCHpvypG4wWgkK9gyDmDlDt6X7nbzXIRjCFhvbHBjqkAQqPBbz6fJ3CTHr5wN6rDTwKM27fIMpKXt0KBTu%2BXwIx18%2BFJTFGJUwtBA5tjHFi6%2FsHhCLWoL3ggYrKXW7zlQqcmdq6t%2BvFkYmGasySLwf%2FlFegywCLhxjK1VEnSoIa%2BApa9hiZRf9Na12tbSWtW0aqfEyhuVY8HJbAeUo94x0xRPBCoBtyPPj%2FzaF0YcboqVeDve2TCIk4HYjSs9DfHpsdRblR&X-Amz-Signature=081efdad9416874b361b741e639467cf248aca7d0bc5d4871970b29af4597ee3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
