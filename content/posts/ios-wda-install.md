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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Y5AFOYWG%2F20250930%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20250930T005033Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFgaCXVzLXdlc3QtMiJIMEYCIQDfRqRL6HH%2BqNECJhkMlScGiMBfZBzzF%2BV1wbKPGiTV8AIhAPLoy8E7BQPNVYd7dL%2Fr7Q38dcEzPu2ZHr2IAt5XkCSsKogECOH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxUuerYCu26Gh2%2FWq4q3ANK%2Bky8kYz8Sw6r48lhALQwY3NMEa5f7%2FhPzZFoadkCeM02su0h6qnQewk4Wn%2B01hGLDvIZSV%2FQbiB8Grud7BWBgZpFXPlNAPRIzPxnNQPXquYUkj3bmLGXUsEkiLbfX8gw%2B5an7JMCjqBYojFgon4YwWmOfFriACoy71otD5dYYpc80MawazxX%2Bc0cX9HqJupovxrJBDnQrCiBgGEO7K7Mww4B58t7b94ULADUanIWkR%2Br7gWDvtl%2Fig98oRtIEmXyNIcqn%2FbOUcIg95zd6IslvIx4Fe56ZcKmDskUOfdZEtrh%2BL%2FzJdzZ45HacSrxOK6bPTiKYb%2F93%2BevpwasfPqMZNa8P4yJhtxVx%2F72MLH8qrmEm4GQUIzw4A1Rka0%2BBbmeJyBLVC%2B8EyAsznmgdmlX7oyZe73Kwe0w5sNUm3d3pwzfQJbNsOKiYSSYLF9o9Mj77tYqgcd%2BosYgsWMDI8bd7vtG6dEzr1Mq0HbJhUGClfTrlGwGDzcwwhP5kBERSeU%2BGczhLkjSpjkRBxUrOlvkIWaR4ph0jRoR%2BJIBHzXUhj0yrVyqHrmDC0g2gNIZanA7DKgH0zUIxwaJ%2BCeE%2BXtjfNFLar2eDswVeVaekgweR3Dd50dApNQfhlXe1jDxvuzGBjqkAQ3CSJGhPmXI4QfjyZf0H07pijx0tDGkVr3EjDDqYM3vg3bjCQYsYTzFfHiVK%2BFygAmViHSr96T6mjlVqnDEhNCDqNf2lo2OXcbsZFn8WcRv%2FY4Jz2DQ0oPPlEe503Uj87oeFPKiL8TRtGYDoaMwuROiHUe3e2Kmhjp6nG%2B1I07KjYyndK9WRqsxrhksqXmKHd1xG%2BHS1pQtLK%2FxhpIK92r1aRvn&X-Amz-Signature=3533d264a3fde2e3504a1fb48876f2fe6521a74d823ac6c1924eb3a7ea5f8770&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Y5AFOYWG%2F20250930%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20250930T005033Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFgaCXVzLXdlc3QtMiJIMEYCIQDfRqRL6HH%2BqNECJhkMlScGiMBfZBzzF%2BV1wbKPGiTV8AIhAPLoy8E7BQPNVYd7dL%2Fr7Q38dcEzPu2ZHr2IAt5XkCSsKogECOH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxUuerYCu26Gh2%2FWq4q3ANK%2Bky8kYz8Sw6r48lhALQwY3NMEa5f7%2FhPzZFoadkCeM02su0h6qnQewk4Wn%2B01hGLDvIZSV%2FQbiB8Grud7BWBgZpFXPlNAPRIzPxnNQPXquYUkj3bmLGXUsEkiLbfX8gw%2B5an7JMCjqBYojFgon4YwWmOfFriACoy71otD5dYYpc80MawazxX%2Bc0cX9HqJupovxrJBDnQrCiBgGEO7K7Mww4B58t7b94ULADUanIWkR%2Br7gWDvtl%2Fig98oRtIEmXyNIcqn%2FbOUcIg95zd6IslvIx4Fe56ZcKmDskUOfdZEtrh%2BL%2FzJdzZ45HacSrxOK6bPTiKYb%2F93%2BevpwasfPqMZNa8P4yJhtxVx%2F72MLH8qrmEm4GQUIzw4A1Rka0%2BBbmeJyBLVC%2B8EyAsznmgdmlX7oyZe73Kwe0w5sNUm3d3pwzfQJbNsOKiYSSYLF9o9Mj77tYqgcd%2BosYgsWMDI8bd7vtG6dEzr1Mq0HbJhUGClfTrlGwGDzcwwhP5kBERSeU%2BGczhLkjSpjkRBxUrOlvkIWaR4ph0jRoR%2BJIBHzXUhj0yrVyqHrmDC0g2gNIZanA7DKgH0zUIxwaJ%2BCeE%2BXtjfNFLar2eDswVeVaekgweR3Dd50dApNQfhlXe1jDxvuzGBjqkAQ3CSJGhPmXI4QfjyZf0H07pijx0tDGkVr3EjDDqYM3vg3bjCQYsYTzFfHiVK%2BFygAmViHSr96T6mjlVqnDEhNCDqNf2lo2OXcbsZFn8WcRv%2FY4Jz2DQ0oPPlEe503Uj87oeFPKiL8TRtGYDoaMwuROiHUe3e2Kmhjp6nG%2B1I07KjYyndK9WRqsxrhksqXmKHd1xG%2BHS1pQtLK%2FxhpIK92r1aRvn&X-Amz-Signature=0ec982a313ac9ee425b78ff70d18e001b4e271a5ee871662c2859fa04252c804&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
