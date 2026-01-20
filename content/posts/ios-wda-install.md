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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QP652Z6W%2F20260120%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260120T182157Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDVEBzAzEi6IEpmgR4IKW8H5dPL3QpRDwunCaOINw3mPAiB6oVe9X9ywtUL1UDu9rln6wZhprj08kEvd7jt5i6lxAiqIBAiy%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMLkHSjBbdaa4LfltXKtwDH%2Fuw2LS4ewWq6BjtAO0dyVOkCpEA7WcfN3QY346Q3dBIL01cAiISrQvPsJF47AxEIIaATHn4K1r%2FGqMNVyuLT04vkv9twIeF8SB0CS65at3ERQcnvMFd2cJa5cSMtTRhDP6uCnJEXVLfIlnKjoMR8rAgYorSKzNeaS%2BXY3bj8271seOAQycpkpEZZhE956kZA0P442CwrKfwzJn6psre85c9e9SD5ZueFH49Iqa1Uci6jtycek0%2FPE2%2BKD8XJYDXbrWiHTc%2Bt7jeC8ugDBxdZmwzx9W4UmCIRFvyypK3X4AdGu0yh%2FfGpU7b6NELQWHTQIEPH2TxtkAQggGfo1G8fjagPFCO1T9exMYPw0632yi1yMDNpss2zeS0TaIWEec6H%2Fp9BwWZxhwJpC2c3ty7eQ7oO%2FYEINfYqSmNr4lQvi3Eaw3eVXB6DPjSlMw%2F3JPtqCNa0%2FTjhwxvW4%2F6xxNtBsYq3kDR4LAuQIX1OvYVrj9q0PirAeUhCKwzDVo46FPt9EKGG6mJb1ogaYajm1rEO%2F9UxHi2Nw7IQS5MTyJsLX%2FQ6HjvaNcde%2FYuvItno4FiOS7qEA6momajSisc1uJWL%2FqX5ZlyAeH71s0ADzdIksEC2Dk3qJjbDndC5M4wxvG%2BywY6pgE8ncXNZ4%2Fz2evC%2BzKJxoEVIWCHYMTCdHwr%2FJhKlcTRGsyutCKazp59EnA14TRHqeoQVNqZt%2BAnsPUcsgO0vsrDL4AxvVARpvSFPpZ6ClH58Ytnhk6EOaFyq2AnDsMoRgPs0YHT7i3J4UV%2BzC6HIlHpwg0o6JsUaEza3B8IIBmxlKCo52BBIKwP0FYUbx%2FpxeFPwvos2CpizmQitR6%2B11Iq13Xu9bbH&X-Amz-Signature=bf9338da0b1dbfdf1b2991ae304b7051c21946b33a8169ecb3ce38c283b8d40b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QP652Z6W%2F20260120%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260120T182157Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDVEBzAzEi6IEpmgR4IKW8H5dPL3QpRDwunCaOINw3mPAiB6oVe9X9ywtUL1UDu9rln6wZhprj08kEvd7jt5i6lxAiqIBAiy%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMLkHSjBbdaa4LfltXKtwDH%2Fuw2LS4ewWq6BjtAO0dyVOkCpEA7WcfN3QY346Q3dBIL01cAiISrQvPsJF47AxEIIaATHn4K1r%2FGqMNVyuLT04vkv9twIeF8SB0CS65at3ERQcnvMFd2cJa5cSMtTRhDP6uCnJEXVLfIlnKjoMR8rAgYorSKzNeaS%2BXY3bj8271seOAQycpkpEZZhE956kZA0P442CwrKfwzJn6psre85c9e9SD5ZueFH49Iqa1Uci6jtycek0%2FPE2%2BKD8XJYDXbrWiHTc%2Bt7jeC8ugDBxdZmwzx9W4UmCIRFvyypK3X4AdGu0yh%2FfGpU7b6NELQWHTQIEPH2TxtkAQggGfo1G8fjagPFCO1T9exMYPw0632yi1yMDNpss2zeS0TaIWEec6H%2Fp9BwWZxhwJpC2c3ty7eQ7oO%2FYEINfYqSmNr4lQvi3Eaw3eVXB6DPjSlMw%2F3JPtqCNa0%2FTjhwxvW4%2F6xxNtBsYq3kDR4LAuQIX1OvYVrj9q0PirAeUhCKwzDVo46FPt9EKGG6mJb1ogaYajm1rEO%2F9UxHi2Nw7IQS5MTyJsLX%2FQ6HjvaNcde%2FYuvItno4FiOS7qEA6momajSisc1uJWL%2FqX5ZlyAeH71s0ADzdIksEC2Dk3qJjbDndC5M4wxvG%2BywY6pgE8ncXNZ4%2Fz2evC%2BzKJxoEVIWCHYMTCdHwr%2FJhKlcTRGsyutCKazp59EnA14TRHqeoQVNqZt%2BAnsPUcsgO0vsrDL4AxvVARpvSFPpZ6ClH58Ytnhk6EOaFyq2AnDsMoRgPs0YHT7i3J4UV%2BzC6HIlHpwg0o6JsUaEza3B8IIBmxlKCo52BBIKwP0FYUbx%2FpxeFPwvos2CpizmQitR6%2B11Iq13Xu9bbH&X-Amz-Signature=d9f817fd583fde0e1c8c08e9e48108ac3e4c65488f1a4a2c381066baeab286f1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
