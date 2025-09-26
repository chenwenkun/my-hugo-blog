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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U52BXK6N%2F20250926%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20250926T061615Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEP7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCx3YWNRdSh5mI5GdyEZUkEfZRH5K8i6WQguW%2BYJDIJlAIhANAUGHYjFv6OvT%2BnGWWb95LUMNmDSpnwWebWeqRaZIIUKogECIf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwxVOl3kHyiJbPemN4q3AMYYveqv6jFq4n3N5rXNBlNLOapUEK6QyLeh0ziDyPg0smlbR8E7XTLF5mPxgWw4vERSwSBA4EXIzGCrLEX4hhMQuNBKUB2g6eWiVX3RpUnaAzEk%2BtO8NaOexpFIlMlrycVzQ%2BiFbDMO1BOtRm649Q5DN6R2oxA0QkH%2B3iVJYFVePLoB1rhhf%2BTdGeBTVhdGwi0UV2aFtfzp465F3eKDFM55FZ8c1plzJ%2BmWWDSQCaUcgqOAVHTZyvrWmv3ZQcbt75m6SKOys35mqRZTq9bVJCEa6dUJB%2BmxyoSpLmDySqwxxVOUfMlykiNUxJhZYrmu3z3i78edID8oNHzACUqot%2Bu6NWl7GHkEomRZODyzRkfpJE8DUzJDJQdmojdSUrPIzjom7cPaIM6E9GjXsxV9xRf0FZI7dma5Yri86mGgbDd37XNL8kpyzFJWDM42nPBgMdUG8PY0SqGotPHginCOg2YiU5pQDwb6i5W9UhKL33spR%2BOzZZKO2HfWXlszl9onpLlOe7TZj3BO5mEt6%2ByLQudUbzqTnzd9kaYSm5vdXvlDei5mTwdgpBES%2Bf8OPFvSyu16b81MFh%2FO0nehrx%2BOgzq2C8d7vWh5RH67g%2FjPWC1Q9XN3cqlo24DETJp8jCvzNjGBjqkAcbi2epCr1QQMiDMona3sVuwm1g6T78SglDxRpKYiF7gNcDj5aezI18jw7Fww4%2BdW5QnjM7HoyRtBBmzCFnov699%2BwAivJq52P4klsseip3go7NZBBZ7FNbUVjBojlcIdBnycMR0m%2BCE4Ym05qavbK7fHXCQaY8swYYe1y4J1dPE8QjmvEv%2FrmcJRZzRwum1fEgtkJrwJkR9FsJbK%2F0GAPc2ySBb&X-Amz-Signature=10922406034632b3ff7aee2dd55c52aa03680bdeb0efeee27f3c7aa066205ff6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U52BXK6N%2F20250926%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20250926T061615Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEP7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCx3YWNRdSh5mI5GdyEZUkEfZRH5K8i6WQguW%2BYJDIJlAIhANAUGHYjFv6OvT%2BnGWWb95LUMNmDSpnwWebWeqRaZIIUKogECIf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwxVOl3kHyiJbPemN4q3AMYYveqv6jFq4n3N5rXNBlNLOapUEK6QyLeh0ziDyPg0smlbR8E7XTLF5mPxgWw4vERSwSBA4EXIzGCrLEX4hhMQuNBKUB2g6eWiVX3RpUnaAzEk%2BtO8NaOexpFIlMlrycVzQ%2BiFbDMO1BOtRm649Q5DN6R2oxA0QkH%2B3iVJYFVePLoB1rhhf%2BTdGeBTVhdGwi0UV2aFtfzp465F3eKDFM55FZ8c1plzJ%2BmWWDSQCaUcgqOAVHTZyvrWmv3ZQcbt75m6SKOys35mqRZTq9bVJCEa6dUJB%2BmxyoSpLmDySqwxxVOUfMlykiNUxJhZYrmu3z3i78edID8oNHzACUqot%2Bu6NWl7GHkEomRZODyzRkfpJE8DUzJDJQdmojdSUrPIzjom7cPaIM6E9GjXsxV9xRf0FZI7dma5Yri86mGgbDd37XNL8kpyzFJWDM42nPBgMdUG8PY0SqGotPHginCOg2YiU5pQDwb6i5W9UhKL33spR%2BOzZZKO2HfWXlszl9onpLlOe7TZj3BO5mEt6%2ByLQudUbzqTnzd9kaYSm5vdXvlDei5mTwdgpBES%2Bf8OPFvSyu16b81MFh%2FO0nehrx%2BOgzq2C8d7vWh5RH67g%2FjPWC1Q9XN3cqlo24DETJp8jCvzNjGBjqkAcbi2epCr1QQMiDMona3sVuwm1g6T78SglDxRpKYiF7gNcDj5aezI18jw7Fww4%2BdW5QnjM7HoyRtBBmzCFnov699%2BwAivJq52P4klsseip3go7NZBBZ7FNbUVjBojlcIdBnycMR0m%2BCE4Ym05qavbK7fHXCQaY8swYYe1y4J1dPE8QjmvEv%2FrmcJRZzRwum1fEgtkJrwJkR9FsJbK%2F0GAPc2ySBb&X-Amz-Signature=98ce89ce44e2374081f306df54cdfefd76f028e64bba0a8732586adbe05480ab&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
