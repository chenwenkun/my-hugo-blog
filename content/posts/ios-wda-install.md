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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WZHEUXDT%2F20250927%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20250927T061407Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBYaCXVzLXdlc3QtMiJIMEYCIQC12kLHM%2BKR5jjn5K%2Bfd9C7wLtom5xrvr%2FcONGZIK5FZwIhAIoMwDWTPnJhTIEgGK7hO1WXgJK1ywlk9wFXm2Iz0oSDKogECJ%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzOKVQQcVPwl6GXhCQq3AMYscheyyfofhJTsqAsxAZWwn4%2B%2F%2FgpHTgFY2mlv0fNQuEiWtoWNb1SXE%2FgZJIbUbEF5resU3dgFTe5%2BCSMNDT0rPSMuoOiSpi%2FPIIg6pjm2t8mqXI0Vt92B97bX3UJpJh1bPWs2QA8xBKc7LmMH6MY0AXGkwnYfDEEyZ4WPUITBReKdG%2BLEkpLsnfVCWdznrq9xb5o7etVHMG9U5khDU7Qq6K2%2F5G907De1uxl6OIyGuqzW7fJtAh3vYOLcAzJMEucd96pnvzfml0%2FkoB%2Fg5u0h60mYSqxzrMqxtmJZt76yyj%2FqDE5VqykdEmb5RSoEBPfkasD8djeE%2FS%2BibBXPxR8BClcBkMI6LiA5jU4%2B92k1%2Ba83%2FwMgGSjnjR7QNLffpLf6zuEWZnX3W4SThziuBiDk2eWRllsDhPu89mtOn%2B7Uo9PFubIqdkEXCflzUwH%2FtMIQoPMec11F7dEJ6%2BVB8cnp7bHNRE2%2FG4dAAg0kTJNof8gGgQsIXrZcB5pTKIMtFKuAH4bZXd1U5T74oM3605V%2FUNtLTIKGsUlWmjd8Th296%2BvgfX3f1mFJsvfz%2FSCm1hNc9FHNXQka7SiLjP17dAs1Pokl0bNR9Kaw8y7LK7oPNs%2BHka%2B3hptw5lbwjCh8t3GBjqkARmTOrLHqOGkc36pxk5%2FfWZHKmSQPCwW%2FjmsiOx5VLffPE454Yi9Q67%2FSwzzRXRubc12UZBv3YwOGlJq3HfY8giMJlJVRuK2fH%2BU1gsJAn%2FSh3Lqh58KGgwrrxvqCnqH%2Fv3f%2FWNwtT7BC7TtpVjyP5gKee7XjWJBsEr%2BSEfTLm4O30v54WsH2rxG8w%2FCC0TWXnDY3ie06BSyDbXHXzJA2a6Tz8t8&X-Amz-Signature=0d83d1df076b898889abaecf43aea3aeaba13d3a53c22a02174de6686c5da15b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WZHEUXDT%2F20250927%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20250927T061407Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBYaCXVzLXdlc3QtMiJIMEYCIQC12kLHM%2BKR5jjn5K%2Bfd9C7wLtom5xrvr%2FcONGZIK5FZwIhAIoMwDWTPnJhTIEgGK7hO1WXgJK1ywlk9wFXm2Iz0oSDKogECJ%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzOKVQQcVPwl6GXhCQq3AMYscheyyfofhJTsqAsxAZWwn4%2B%2F%2FgpHTgFY2mlv0fNQuEiWtoWNb1SXE%2FgZJIbUbEF5resU3dgFTe5%2BCSMNDT0rPSMuoOiSpi%2FPIIg6pjm2t8mqXI0Vt92B97bX3UJpJh1bPWs2QA8xBKc7LmMH6MY0AXGkwnYfDEEyZ4WPUITBReKdG%2BLEkpLsnfVCWdznrq9xb5o7etVHMG9U5khDU7Qq6K2%2F5G907De1uxl6OIyGuqzW7fJtAh3vYOLcAzJMEucd96pnvzfml0%2FkoB%2Fg5u0h60mYSqxzrMqxtmJZt76yyj%2FqDE5VqykdEmb5RSoEBPfkasD8djeE%2FS%2BibBXPxR8BClcBkMI6LiA5jU4%2B92k1%2Ba83%2FwMgGSjnjR7QNLffpLf6zuEWZnX3W4SThziuBiDk2eWRllsDhPu89mtOn%2B7Uo9PFubIqdkEXCflzUwH%2FtMIQoPMec11F7dEJ6%2BVB8cnp7bHNRE2%2FG4dAAg0kTJNof8gGgQsIXrZcB5pTKIMtFKuAH4bZXd1U5T74oM3605V%2FUNtLTIKGsUlWmjd8Th296%2BvgfX3f1mFJsvfz%2FSCm1hNc9FHNXQka7SiLjP17dAs1Pokl0bNR9Kaw8y7LK7oPNs%2BHka%2B3hptw5lbwjCh8t3GBjqkARmTOrLHqOGkc36pxk5%2FfWZHKmSQPCwW%2FjmsiOx5VLffPE454Yi9Q67%2FSwzzRXRubc12UZBv3YwOGlJq3HfY8giMJlJVRuK2fH%2BU1gsJAn%2FSh3Lqh58KGgwrrxvqCnqH%2Fv3f%2FWNwtT7BC7TtpVjyP5gKee7XjWJBsEr%2BSEfTLm4O30v54WsH2rxG8w%2FCC0TWXnDY3ie06BSyDbXHXzJA2a6Tz8t8&X-Amz-Signature=2e0507a66ed7785f4516ebbf57f46ffb1a515f121e2358dd6effb7847a6dd0ea&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
