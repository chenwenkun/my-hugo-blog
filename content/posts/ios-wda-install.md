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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TK7F3COS%2F20251226%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251226T061901Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDY2qv%2BZnLb1fd%2FLkRfwLNsOHQcxugrOuC4BOPCPAH5oAIhAP7scqex%2BvAVrwpKSJL2lKNsrksvUAXRwJ%2BLvQPvH3I3Kv8DCEsQABoMNjM3NDIzMTgzODA1Igylq9Pc7SFgRNBpBYoq3ANZyOIqvG83xmXkysiG4yHo51o%2FuGwxZxmul14mJjyW6%2FgZWEL6OTq0BZzRwXJMT90Q0dJscqW17cy7cdxRLWqMZ71fO04apDNedZK68PwEi0CCeMj%2BHEhaoI%2BtYva6j6YeoZODffzjaobeuso2oDZE29Hn6c1d%2BLTqMNUpqMvhWiEKrpbVwrrhJ4hpM7OI1gSbICS1H0cg0A9SqjKqck0DRCUitCzmlBVYx53GwQeyT4nUK6Npr3lWI1X1wl%2Fthl7xRilBFwHzl8ZfJyQ%2FqlGvXfTy16%2FtvN%2FhkyUbOt4h7Afi2unVtgrtjdLwR4B7SNaFy%2BOhmsiZjnAOyUD55FEbeRyrcw4gSyWPcak3nSY0jB4mY8pVPFCky6uepfrw0JqhNrdKanLP4Ji7ap%2Fik%2FHKpZasvBpOdjwFtsrjyRmhGq2UG5nkLS%2Bj3v7BO7GyV83szVIZvSveLTEUSWj7ekn7XhLd09w8YvLytvjF8vCZtLyPzkMTB1viX7pvEyVTI6NAWnS277%2BEBGjKIArw5IrMjcfzG6HsbQHd0JrqRlL9pd5HkFwIBREMks8VaZXUL7eUsiQ3bPIQFg4nL%2FWpSxOkPfe1%2FGRCEsrDkf3ZpN2Ct1Gr8cuqOIU3%2Bsj%2F1DCfyrfKBjqkAZaaUZ08IfUat69YGLlFKmyBtMa5X%2BfuE8T0hsxrIQpwd4GKDkgqb29D462llCQKq2KGfvCuP7Q2cf%2F9AqLbV8iqU%2BRFg2cSI2RP0yzdT8wP6DdNW0O6yQ%2FtsB4vqP6SNjlgHSRAQ9dO2woqDmUeIOsNxzaI4a8Mn6I4Gom0aGqXYPPknA6SyG5Qx1GSBDyOvNwT5yaCwkQnxUiAmMR%2FsPuBLtGW&X-Amz-Signature=219f6ca43c667d922d6bacba048acc2462a31b55b1142f1586e81495d9c0fd9e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TK7F3COS%2F20251226%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251226T061901Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDY2qv%2BZnLb1fd%2FLkRfwLNsOHQcxugrOuC4BOPCPAH5oAIhAP7scqex%2BvAVrwpKSJL2lKNsrksvUAXRwJ%2BLvQPvH3I3Kv8DCEsQABoMNjM3NDIzMTgzODA1Igylq9Pc7SFgRNBpBYoq3ANZyOIqvG83xmXkysiG4yHo51o%2FuGwxZxmul14mJjyW6%2FgZWEL6OTq0BZzRwXJMT90Q0dJscqW17cy7cdxRLWqMZ71fO04apDNedZK68PwEi0CCeMj%2BHEhaoI%2BtYva6j6YeoZODffzjaobeuso2oDZE29Hn6c1d%2BLTqMNUpqMvhWiEKrpbVwrrhJ4hpM7OI1gSbICS1H0cg0A9SqjKqck0DRCUitCzmlBVYx53GwQeyT4nUK6Npr3lWI1X1wl%2Fthl7xRilBFwHzl8ZfJyQ%2FqlGvXfTy16%2FtvN%2FhkyUbOt4h7Afi2unVtgrtjdLwR4B7SNaFy%2BOhmsiZjnAOyUD55FEbeRyrcw4gSyWPcak3nSY0jB4mY8pVPFCky6uepfrw0JqhNrdKanLP4Ji7ap%2Fik%2FHKpZasvBpOdjwFtsrjyRmhGq2UG5nkLS%2Bj3v7BO7GyV83szVIZvSveLTEUSWj7ekn7XhLd09w8YvLytvjF8vCZtLyPzkMTB1viX7pvEyVTI6NAWnS277%2BEBGjKIArw5IrMjcfzG6HsbQHd0JrqRlL9pd5HkFwIBREMks8VaZXUL7eUsiQ3bPIQFg4nL%2FWpSxOkPfe1%2FGRCEsrDkf3ZpN2Ct1Gr8cuqOIU3%2Bsj%2F1DCfyrfKBjqkAZaaUZ08IfUat69YGLlFKmyBtMa5X%2BfuE8T0hsxrIQpwd4GKDkgqb29D462llCQKq2KGfvCuP7Q2cf%2F9AqLbV8iqU%2BRFg2cSI2RP0yzdT8wP6DdNW0O6yQ%2FtsB4vqP6SNjlgHSRAQ9dO2woqDmUeIOsNxzaI4a8Mn6I4Gom0aGqXYPPknA6SyG5Qx1GSBDyOvNwT5yaCwkQnxUiAmMR%2FsPuBLtGW&X-Amz-Signature=fed73657662f1340657b049c2858d9fe2465069eab06858ea8776c9bcfb49433&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
