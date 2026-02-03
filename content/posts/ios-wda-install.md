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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466S66QN6HL%2F20260203%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260203T063717Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEC4aCXVzLXdlc3QtMiJIMEYCIQD4q2G1nI9vnFNmXgWb%2B%2BlZPSo6E%2FSaJAXJm9m3iufb2wIhAOSubvCQDKN1VPKrEfMiEYu%2Bs9ogGygd%2FERAseuuiIrVKogECPf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igye0WxDh%2Bpg3Z%2B34UAq3ANL41i%2F9ZL4zQjJh0lfRcoE2mMDm6zfPpDaiv1cU75K9W%2BA91CMtVLCaYWlQl7eaLk8cSCMNlNt%2FvjAXe0Z%2FHMLuYw0HlIk6J0S9SvwWzQUrw2ilBpVtX8Z1sdxWOuokAUBzAjGw%2BhnQ0UTVutANw6DI%2FbYch147c%2BTvunqV7mEadAp%2BKJDf42w9RC1%2BlHVs%2FVs1JYZrLpckrloFQoU1ZN0YGxRr7PpvqntsiSxbePJhAQqSX8F0MHcb9A8U5TfZC2gNGhDyCVvPU91CtjoMJykk86rJBrpdZQpuYB8vNHkNZ3j3E9iRpbRkIuN3Xh8nSf8tYVMEYC5v1rCnkBEFP3vqxvTcoWic%2BJe%2BKUuWtQOA%2BGcyz6q%2Fm1uLG%2FLhlO23uU93%2BPlaN4VnLoChumXf6Fqr4WDi4nECmcjHsSp1c7JSDtoyfdvfKQraLod5eAK2I9FWBMYHlmSy3FWmEJ77dOzFZV7HdKSULS7D%2FkdJvhNTB71WsAR3tEaFUzzNwyopUvrCEBvyu74wBDk3MckhXjnw6S1v%2Fyw%2Ftki0Hlip53bE9bTK1Yj5yj6x8sq8ZIIkue1GOYhfrZXxVINVC7pSJju4Laz6bxM3%2B%2FYcn4KKgZJeJeokCmlU6HylKODMzC%2FmobMBjqkAXAZF67kju0ZfWAcPb3YnGduOerhQ%2F1ckuaQy8GVKEEO%2BWSteFFPctH6HWvWBAAfH%2Bl0L7T2ms1bN9%2Bw24MW1uiR7iuuYHafQhMzsMKDbqDtfTPb5yY%2Fs72mCp2tX7%2FhuZn4mU89Jh%2F0eGQ9l%2Btksqu%2FSZYR%2BGzZJ0jsGV6Ij35E85d6jzrRRhOtAHOP78dAR%2BimUhV6NYZFbhfMjYrK9fZOsKBU&X-Amz-Signature=364366c32257c441b554932a29767a5fb52449465206bdee183072964179e70c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466S66QN6HL%2F20260203%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260203T063717Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEC4aCXVzLXdlc3QtMiJIMEYCIQD4q2G1nI9vnFNmXgWb%2B%2BlZPSo6E%2FSaJAXJm9m3iufb2wIhAOSubvCQDKN1VPKrEfMiEYu%2Bs9ogGygd%2FERAseuuiIrVKogECPf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igye0WxDh%2Bpg3Z%2B34UAq3ANL41i%2F9ZL4zQjJh0lfRcoE2mMDm6zfPpDaiv1cU75K9W%2BA91CMtVLCaYWlQl7eaLk8cSCMNlNt%2FvjAXe0Z%2FHMLuYw0HlIk6J0S9SvwWzQUrw2ilBpVtX8Z1sdxWOuokAUBzAjGw%2BhnQ0UTVutANw6DI%2FbYch147c%2BTvunqV7mEadAp%2BKJDf42w9RC1%2BlHVs%2FVs1JYZrLpckrloFQoU1ZN0YGxRr7PpvqntsiSxbePJhAQqSX8F0MHcb9A8U5TfZC2gNGhDyCVvPU91CtjoMJykk86rJBrpdZQpuYB8vNHkNZ3j3E9iRpbRkIuN3Xh8nSf8tYVMEYC5v1rCnkBEFP3vqxvTcoWic%2BJe%2BKUuWtQOA%2BGcyz6q%2Fm1uLG%2FLhlO23uU93%2BPlaN4VnLoChumXf6Fqr4WDi4nECmcjHsSp1c7JSDtoyfdvfKQraLod5eAK2I9FWBMYHlmSy3FWmEJ77dOzFZV7HdKSULS7D%2FkdJvhNTB71WsAR3tEaFUzzNwyopUvrCEBvyu74wBDk3MckhXjnw6S1v%2Fyw%2Ftki0Hlip53bE9bTK1Yj5yj6x8sq8ZIIkue1GOYhfrZXxVINVC7pSJju4Laz6bxM3%2B%2FYcn4KKgZJeJeokCmlU6HylKODMzC%2FmobMBjqkAXAZF67kju0ZfWAcPb3YnGduOerhQ%2F1ckuaQy8GVKEEO%2BWSteFFPctH6HWvWBAAfH%2Bl0L7T2ms1bN9%2Bw24MW1uiR7iuuYHafQhMzsMKDbqDtfTPb5yY%2Fs72mCp2tX7%2FhuZn4mU89Jh%2F0eGQ9l%2Btksqu%2FSZYR%2BGzZJ0jsGV6Ij35E85d6jzrRRhOtAHOP78dAR%2BimUhV6NYZFbhfMjYrK9fZOsKBU&X-Amz-Signature=3fce778470bd799b7601bee36a21bc29a2cea00e10bce15d77e0a9ecd3741a15&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
