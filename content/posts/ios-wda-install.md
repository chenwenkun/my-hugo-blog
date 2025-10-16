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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WH2UPNCL%2F20251016%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251016T005117Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCFyXxaTp89VzVBO1gwz5UePwFUUbc9mQ9q57r3iZrO0QIhAOrUBHG5i%2FRQBrIBovfikKcqMcEcm6oZu0ebXSE6B9pNKogECIH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwXcVbSETBAsynxzJAq3AM%2BSRX5KhQOwKn0g58S8kA%2BNsZug8r34aK1HTobSh76RNEqzCXVxeVWunqOt%2FZMyPOCjSNA5TOSvlkucg8rxQtd1gZqr1f3PZyz2PvuhlzehkQxu3xBz7VNu4Sjo%2FHl12PlEkO7u2Ay02gv64jgDiV9W%2FmnczWQSjto4SxDMV9vri5YNk9f%2B9jZ9zcsRYd8oY3GmQl2qYhB6AHWvSka6z%2BXtvLd5INBnx372bd%2BnZbjvuj7v6CVnIwZCEcQu7XH5X3PUvkQN6xiccvtYVVD7kUWGozWwyYTUSPzPW44TUepJT4flXT9vJahCSq6hjG6YOeWJJ0BRHYfwJxojM5tRUG05x7kyK7iTy7oO2qcaXI%2BYMSUVKOC4vubkBLMzQRAjMGmm6aggXwAbZcrrse2PtXkMRnQA27L6ZOIQV8V3pf6%2FhfrCzqsyyKfWGod47PFaZASuk0IWIjTQg315B8AZK%2Bj6EkPgqb2FWCjUbzdvRxpEvaY1PMHy91ugY6g3tc0b08nxdz460ugfOVMXXS1j2ap%2BfKTfqbLODixnYZdzEQ9s5YjbEd5XcMI6UeI2vsdPYWHYY1KrZ4XJRA7Bvw4uQ1b4vlGy%2F2dbJe%2B0RmcnSobBiWyKcUNOTGfyZHBpjCf8MDHBjqkAUHdSo%2BxPC3mhf9mSY2vuj8yHsQmon1IF5dITUDzDs9v5vzQOdFVE9LjOTQAu4XgyUB3vpts6ZXMcX4rdm%2FchfbXN1c7CeCi6w%2BdGkek%2BYcufNRM9ldEE%2FArOhqRdoDyMQeP83W22t6a%2BPvqhp6P2baFIOxYV1ZPFUsZf5HzDO3L%2BLUDs6t7E9J7GexpZFFDEQqPgDI9O1cCJ%2BmRDvI5g2HtSejT&X-Amz-Signature=9c7358d7380c062fcd55c05c55a48dc18857b5aafaf81a74f20db7b945e03f64&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WH2UPNCL%2F20251016%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251016T005117Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCFyXxaTp89VzVBO1gwz5UePwFUUbc9mQ9q57r3iZrO0QIhAOrUBHG5i%2FRQBrIBovfikKcqMcEcm6oZu0ebXSE6B9pNKogECIH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwXcVbSETBAsynxzJAq3AM%2BSRX5KhQOwKn0g58S8kA%2BNsZug8r34aK1HTobSh76RNEqzCXVxeVWunqOt%2FZMyPOCjSNA5TOSvlkucg8rxQtd1gZqr1f3PZyz2PvuhlzehkQxu3xBz7VNu4Sjo%2FHl12PlEkO7u2Ay02gv64jgDiV9W%2FmnczWQSjto4SxDMV9vri5YNk9f%2B9jZ9zcsRYd8oY3GmQl2qYhB6AHWvSka6z%2BXtvLd5INBnx372bd%2BnZbjvuj7v6CVnIwZCEcQu7XH5X3PUvkQN6xiccvtYVVD7kUWGozWwyYTUSPzPW44TUepJT4flXT9vJahCSq6hjG6YOeWJJ0BRHYfwJxojM5tRUG05x7kyK7iTy7oO2qcaXI%2BYMSUVKOC4vubkBLMzQRAjMGmm6aggXwAbZcrrse2PtXkMRnQA27L6ZOIQV8V3pf6%2FhfrCzqsyyKfWGod47PFaZASuk0IWIjTQg315B8AZK%2Bj6EkPgqb2FWCjUbzdvRxpEvaY1PMHy91ugY6g3tc0b08nxdz460ugfOVMXXS1j2ap%2BfKTfqbLODixnYZdzEQ9s5YjbEd5XcMI6UeI2vsdPYWHYY1KrZ4XJRA7Bvw4uQ1b4vlGy%2F2dbJe%2B0RmcnSobBiWyKcUNOTGfyZHBpjCf8MDHBjqkAUHdSo%2BxPC3mhf9mSY2vuj8yHsQmon1IF5dITUDzDs9v5vzQOdFVE9LjOTQAu4XgyUB3vpts6ZXMcX4rdm%2FchfbXN1c7CeCi6w%2BdGkek%2BYcufNRM9ldEE%2FArOhqRdoDyMQeP83W22t6a%2BPvqhp6P2baFIOxYV1ZPFUsZf5HzDO3L%2BLUDs6t7E9J7GexpZFFDEQqPgDI9O1cCJ%2BmRDvI5g2HtSejT&X-Amz-Signature=b240be93666900ba9cd5118321e8e786db8a3e7df4f3fb1e0945ddfaaeed0bf4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
