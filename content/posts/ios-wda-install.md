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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663OFCOAYB%2F20260426%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260426T071550Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFG1TaLyBiwwEN3OMMSsR1laiTEQfxwvrPRQlC39b3uyAiEAlHZOQXE2UBqjqtIrH8JqSO6OmV4CUWZrPqnt6aYZOxkqiAQIqP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJIZb2wet6cPVSwUpyrcA9c7rO7Pz6FhhbtaYmSGxXspplyr91Fco%2FUeOYBw8c63zyiIxGyAvjxHFjFZgT7l%2BFODju89JCYVWQBqMpguI1dPIe8XCCPn0qj7hcaCBXj02sHf%2FUfqEROuJjZditE05EmYmxYmQxgRNAaaNk59QK5clWRVzWfqgIJKpz402aDJ2PhFcH0zu%2FJ5C5TxxreeHCYWEN4TH64bTcS9g5wuOj%2FggejacIZB8yMy5U9NhpdWs1dTVneDQ9mzMuMd5sQZJJklLyVkq%2BB1Oa5f1rJQw4r1rhc5xqcMxF%2FbcRFSSHXE8p5R2TjJr1lNOCuLSnRmwFvjazVqxRghqqBlwkhXF1t1oJEkGtFcahrdLcQSlQ7b9NdM9wsYVgzTcdlWf2GMXPqs%2Be3ymEX6aWfE9U6U0SfpSJTtXLwcki6scdo7IN2dx4RLHIhlThWWsd05uzh2GIE9tuFX3qb67dxxgLF5BYMmHMd6ecoVTw%2FhgVJSrKht7VrM1FqTHxQv9iHOMKOWYGx6R2c2SpIKffdUG8yRTDYwtJB9I7E%2FXXVCnSkX1G%2BgUeHZKYI3%2BW%2B5B9q4fGB1CaG6kTd6zNHC6P07ps%2B%2FpH2VW7xH%2Fh8tIEnnoIs6eH5swWSuuomFAUTPZUNFMKzyts8GOqUB78UnmClD0bpkdWBFuhvVx7YXw2ngxW1cziETJNfXnXdr%2FARLz7r8YjCrIDqTb3in8SQCop45RawmPLKvma%2BDzFj2rpSdKeuIUZNngPjiemW5bZ8ZA8tGNSXRGJQDZA0gNYwCMGp5pa7ahlfLzxs7M1grel8jgneL%2Blb37GWeiq2rxJQ7%2Fxk1woE4Y%2F5Ceqw5f6K1%2FVjqH4udldr35xqupJGkyUrN&X-Amz-Signature=326d47376d05f345abedb3655d94d8ba5268c72c06df041d993710eff0ea887e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663OFCOAYB%2F20260426%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260426T071550Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFG1TaLyBiwwEN3OMMSsR1laiTEQfxwvrPRQlC39b3uyAiEAlHZOQXE2UBqjqtIrH8JqSO6OmV4CUWZrPqnt6aYZOxkqiAQIqP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJIZb2wet6cPVSwUpyrcA9c7rO7Pz6FhhbtaYmSGxXspplyr91Fco%2FUeOYBw8c63zyiIxGyAvjxHFjFZgT7l%2BFODju89JCYVWQBqMpguI1dPIe8XCCPn0qj7hcaCBXj02sHf%2FUfqEROuJjZditE05EmYmxYmQxgRNAaaNk59QK5clWRVzWfqgIJKpz402aDJ2PhFcH0zu%2FJ5C5TxxreeHCYWEN4TH64bTcS9g5wuOj%2FggejacIZB8yMy5U9NhpdWs1dTVneDQ9mzMuMd5sQZJJklLyVkq%2BB1Oa5f1rJQw4r1rhc5xqcMxF%2FbcRFSSHXE8p5R2TjJr1lNOCuLSnRmwFvjazVqxRghqqBlwkhXF1t1oJEkGtFcahrdLcQSlQ7b9NdM9wsYVgzTcdlWf2GMXPqs%2Be3ymEX6aWfE9U6U0SfpSJTtXLwcki6scdo7IN2dx4RLHIhlThWWsd05uzh2GIE9tuFX3qb67dxxgLF5BYMmHMd6ecoVTw%2FhgVJSrKht7VrM1FqTHxQv9iHOMKOWYGx6R2c2SpIKffdUG8yRTDYwtJB9I7E%2FXXVCnSkX1G%2BgUeHZKYI3%2BW%2B5B9q4fGB1CaG6kTd6zNHC6P07ps%2B%2FpH2VW7xH%2Fh8tIEnnoIs6eH5swWSuuomFAUTPZUNFMKzyts8GOqUB78UnmClD0bpkdWBFuhvVx7YXw2ngxW1cziETJNfXnXdr%2FARLz7r8YjCrIDqTb3in8SQCop45RawmPLKvma%2BDzFj2rpSdKeuIUZNngPjiemW5bZ8ZA8tGNSXRGJQDZA0gNYwCMGp5pa7ahlfLzxs7M1grel8jgneL%2Blb37GWeiq2rxJQ7%2Fxk1woE4Y%2F5Ceqw5f6K1%2FVjqH4udldr35xqupJGkyUrN&X-Amz-Signature=b087e45cdf9a4d9c68b711d787ccde1409d8e82254a3d90a071bb3429fb8566c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
