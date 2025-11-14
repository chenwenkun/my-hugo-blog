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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XSKYGSP5%2F20251114%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251114T181621Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIE2xF3UcCo8VqJkXL6NztA67Eh1wrE7Bu6w60eG2tH%2FIAiEAmlTy3mEj5max4%2BO27rAPN8R0CjtKGFqIRDAuqCSvh50q%2FwMIahAAGgw2Mzc0MjMxODM4MDUiDL566BSTA%2FIskyixuyrcA2K48Evf20X549C%2FcoB8xg5m%2FnFBNfNG%2B75ABs4uH3cTjqQXcRWHJN%2BwE5s7DCuCiZ6gSj7KpQLZm5rQSaxRNhBbXr21trhUxlttWiO7Dl62zihUAnwFpggP%2BuAXTfOyWkB3f6X0Dj4ClBujK4E6AauqYEVU%2BZDfEKEil6lx%2FmbySBfvkZwGhR2lTsqhghm8HV%2FCWbJ1yuBLbRuQ%2FXNsDjU6JDVZJ6abgglWFK36fxnTSjNAU75aJBYc5LMYQ9AjY%2FAt%2F594R7YwK747IjF50v%2BaI%2BexJbAJb1jv1b83zeeMUJyP%2BkSHBNijfzBRoa2oaBXPqnt%2FUM352a7BQf9ZVoJl%2ByoA%2FviFIKI50GC3LS%2Fr4GqRdnS1oBE5XNu7MimuHnr%2FQjiX9JjFY9NklSnprfUAqkfhB2VYZdQrUBRpx1TDE0pTJQ7%2BrS0fQsXQItXDLEuKDGSZzOPw0K%2Bo%2FLO7HEOSNNVBKbKDrbZ5dKb%2FPG%2Bqi5Rkwlh%2FjPhJys3zmaoo7BxBSjC8jdoU%2BziyBGqGaAtvtHxiav72kxfXOzE3DtHsK4CFo7xgyZnL%2FMyyDLDutj3nc%2BSit%2FA%2FkGSX9QRiNEydn5wP7EaHPpyXaLMAhR7bndx7ynpx7ucidp4sMITG3cgGOqUBjZB0gvLfB9LLeFX%2BaQiMCnhV2YnEZSS8OlrZvwiVw5rWFx0TIRXUw54HEHpDRC4tXiBAETfcLussTew6o00KU4iRR6yEn%2F%2FnMS07lD0ni54ZdzGzdP1Ty8owTrLimSeHpOfd%2Fay%2F0iJD4Dxg%2B3hT7GI%2F40z4S5LQkigqOoDaHg2Ad6eTCogy%2BzzOfkQAmwzsY2EqGKrTexcLewDhfy1RwP5wbRXg&X-Amz-Signature=aa3ea40e5ee06a0a42ea37d79f84a59bcdd99c6c86d9176bd8f309014ce69f8e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XSKYGSP5%2F20251114%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251114T181621Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIE2xF3UcCo8VqJkXL6NztA67Eh1wrE7Bu6w60eG2tH%2FIAiEAmlTy3mEj5max4%2BO27rAPN8R0CjtKGFqIRDAuqCSvh50q%2FwMIahAAGgw2Mzc0MjMxODM4MDUiDL566BSTA%2FIskyixuyrcA2K48Evf20X549C%2FcoB8xg5m%2FnFBNfNG%2B75ABs4uH3cTjqQXcRWHJN%2BwE5s7DCuCiZ6gSj7KpQLZm5rQSaxRNhBbXr21trhUxlttWiO7Dl62zihUAnwFpggP%2BuAXTfOyWkB3f6X0Dj4ClBujK4E6AauqYEVU%2BZDfEKEil6lx%2FmbySBfvkZwGhR2lTsqhghm8HV%2FCWbJ1yuBLbRuQ%2FXNsDjU6JDVZJ6abgglWFK36fxnTSjNAU75aJBYc5LMYQ9AjY%2FAt%2F594R7YwK747IjF50v%2BaI%2BexJbAJb1jv1b83zeeMUJyP%2BkSHBNijfzBRoa2oaBXPqnt%2FUM352a7BQf9ZVoJl%2ByoA%2FviFIKI50GC3LS%2Fr4GqRdnS1oBE5XNu7MimuHnr%2FQjiX9JjFY9NklSnprfUAqkfhB2VYZdQrUBRpx1TDE0pTJQ7%2BrS0fQsXQItXDLEuKDGSZzOPw0K%2Bo%2FLO7HEOSNNVBKbKDrbZ5dKb%2FPG%2Bqi5Rkwlh%2FjPhJys3zmaoo7BxBSjC8jdoU%2BziyBGqGaAtvtHxiav72kxfXOzE3DtHsK4CFo7xgyZnL%2FMyyDLDutj3nc%2BSit%2FA%2FkGSX9QRiNEydn5wP7EaHPpyXaLMAhR7bndx7ynpx7ucidp4sMITG3cgGOqUBjZB0gvLfB9LLeFX%2BaQiMCnhV2YnEZSS8OlrZvwiVw5rWFx0TIRXUw54HEHpDRC4tXiBAETfcLussTew6o00KU4iRR6yEn%2F%2FnMS07lD0ni54ZdzGzdP1Ty8owTrLimSeHpOfd%2Fay%2F0iJD4Dxg%2B3hT7GI%2F40z4S5LQkigqOoDaHg2Ad6eTCogy%2BzzOfkQAmwzsY2EqGKrTexcLewDhfy1RwP5wbRXg&X-Amz-Signature=53bf21c1c0348c659787c336251812a09cf078cf1d0a5c3ab5276b5ddcfbf0a8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
