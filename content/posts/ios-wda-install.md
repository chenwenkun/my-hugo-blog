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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662OWETU6Y%2F20260501%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260501T015852Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFEaCXVzLXdlc3QtMiJIMEYCIQDue3DFskUcBOB%2BwVht7wTDxqjBOufKqA5mttOEXBvT2wIhAPr46Or4UV9YqjKPfXCASBdS7cHVkqvQDcpaaNDpozhAKv8DCBoQABoMNjM3NDIzMTgzODA1IgzqdUmOZEiUrwBffj8q3AP79fzoTc9AZK%2FRGocVLrIe%2BqEKZWovQx3eIWpMtadj6UluglsU1910hxlQqiPdAWRpdK0j9uk31Ji1l3gIHdjMROpB8pEbmAhQkaBckQSa0zpT4xLKJmtgWrQgObrJrfXigEhfiHiHrIHbPTIVi7XCEq1uBai7WTMkDxdS1RIb7jljvBHld3kioB2hLaF4NBaqI8%2B%2FGJ81k%2B8FvNedXOsLJsiPb4w%2Bre4ugjtj%2BGHpbalMajyVvT2lp3RKYn1urc0zeXounWD81NrGPNyrfzDbMoq%2FEiEuUdbxVkwkNEK7edWI3qfr21owza46G6B3nxvYS2UyKyShE2wD8CW553MNgk7xO14Gt1NPBqVzWaTibwiHlR4%2FH0lhDz82SM%2FHJ7Jov83m4MqUmJSSZ7dp%2FrkHgHD04hYqvRogrHOKkeqUq25gL7lVEZjl%2BhIt0TJoaWdeGhSSD3ar3217%2Fz1PdRBPpk%2FjqhDF51zvKsXEP9dJysBc83z6TcKDXAsB2FPmRxKa8xU8A0nbub1Jh3mzgItohb6fJluVEzWLfg6vA3nPPFKSkHD2CdZAxr5rOTLXB%2F7VOT6bu2%2FWn64ePJRtJOssiKtygH0woaJuqdyhxekZGXx7Gzim%2BkSMjkhdeDD3%2Fc%2FPBjqkATOs%2FBQsrRPwJazmACKBINFXgVwQHpFwn0EI2K1G3nnh2FPSlntvtFE2jGJ%2FEqYtGnIvagwVrzba7wJWRGovqMpM67I99rANo6XSgVwDAFqj215oie1O06DIoWdN5QFFwV4MOjjoXxCX1NtYbPzVKfXu%2F6GDesFiOt3Wt2ouDeJpkUYwiCrfYy2uRe%2Bpg0Dv0P3JIIzsoBJLoMYRGpnKPEGwNBzR&X-Amz-Signature=a86fe1f05a8449d566fcb097742ea565d4ffbbeb3bbd263089371607f605e68b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662OWETU6Y%2F20260501%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260501T015852Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFEaCXVzLXdlc3QtMiJIMEYCIQDue3DFskUcBOB%2BwVht7wTDxqjBOufKqA5mttOEXBvT2wIhAPr46Or4UV9YqjKPfXCASBdS7cHVkqvQDcpaaNDpozhAKv8DCBoQABoMNjM3NDIzMTgzODA1IgzqdUmOZEiUrwBffj8q3AP79fzoTc9AZK%2FRGocVLrIe%2BqEKZWovQx3eIWpMtadj6UluglsU1910hxlQqiPdAWRpdK0j9uk31Ji1l3gIHdjMROpB8pEbmAhQkaBckQSa0zpT4xLKJmtgWrQgObrJrfXigEhfiHiHrIHbPTIVi7XCEq1uBai7WTMkDxdS1RIb7jljvBHld3kioB2hLaF4NBaqI8%2B%2FGJ81k%2B8FvNedXOsLJsiPb4w%2Bre4ugjtj%2BGHpbalMajyVvT2lp3RKYn1urc0zeXounWD81NrGPNyrfzDbMoq%2FEiEuUdbxVkwkNEK7edWI3qfr21owza46G6B3nxvYS2UyKyShE2wD8CW553MNgk7xO14Gt1NPBqVzWaTibwiHlR4%2FH0lhDz82SM%2FHJ7Jov83m4MqUmJSSZ7dp%2FrkHgHD04hYqvRogrHOKkeqUq25gL7lVEZjl%2BhIt0TJoaWdeGhSSD3ar3217%2Fz1PdRBPpk%2FjqhDF51zvKsXEP9dJysBc83z6TcKDXAsB2FPmRxKa8xU8A0nbub1Jh3mzgItohb6fJluVEzWLfg6vA3nPPFKSkHD2CdZAxr5rOTLXB%2F7VOT6bu2%2FWn64ePJRtJOssiKtygH0woaJuqdyhxekZGXx7Gzim%2BkSMjkhdeDD3%2Fc%2FPBjqkATOs%2FBQsrRPwJazmACKBINFXgVwQHpFwn0EI2K1G3nnh2FPSlntvtFE2jGJ%2FEqYtGnIvagwVrzba7wJWRGovqMpM67I99rANo6XSgVwDAFqj215oie1O06DIoWdN5QFFwV4MOjjoXxCX1NtYbPzVKfXu%2F6GDesFiOt3Wt2ouDeJpkUYwiCrfYy2uRe%2Bpg0Dv0P3JIIzsoBJLoMYRGpnKPEGwNBzR&X-Amz-Signature=7779c77cccd7bea188c36029b204fbb30f14174b33323aab0e801398130c58aa&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
