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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Q5RAYCW4%2F20260726%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260726T125606Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGsaCXVzLXdlc3QtMiJHMEUCIQDMy1sicPKSw6UwvUIvEi5uWJ2Ft8Ft8f4j9wyIUbyQmAIgCP5QENPp2N8Sj0z3hEgItXut8X1a%2FDkqyf1mu8QZdNEq%2FwMINBAAGgw2Mzc0MjMxODM4MDUiDNMTKNIt5lPrOWahcCrcA%2By%2BMKR69ctE9EP9Vnh%2BwP%2F%2BD%2B%2F0tOuPgc35sqx9dirmOPBIlOzKC1Xhsu7YcDaTV0ki%2Bvcu2lmfuyJWy9Fb7vKYu2P%2B4GXLsH1g3bTf6QYl0nEZCmLIDup7EsO7U4PkWLM9L5a5EnWGVlSmuZzusg5KAonCMaziTutZ8OGjJz8TX%2BEpyex3CD%2BNynmUWmfNsLN4I%2B6RPQ3tUCywdIUhPKChUorWe7kJRn%2FJUU930Clih90GlvQG6WY6bheOB9Wfg3SlMv%2FsmNKpMvzZV%2FfwRsuTFJkDGg%2BmUbsAOnN4JBVnB%2Brz6oJ%2FV3jeYylMhTQX%2FlO29X2Gp7LWwdUbAGB0yCsiXC%2B%2FVM26f5SAq2tPSQAMnDaksfZ8vuHuayEmx3wj54nYSKHEh1zEjJqkmKzzrvs9Lc47P1dxjcCkP4xbOXg72x4mtQdduJwh4OrpzZVsx%2BEc%2BGfVeG8bQYlTQ1Qqjtp12vmHxIw3yi1IFrqfyZzIezHIHO6pMh94vH15Q%2F8TQQmqFdWjnZ3%2B82roUclfExPauidarY%2B1AnlpksSbJsqQn02Tlz27IrPs9pKJe5LBA8djOf%2BFTCaA0j4wUAKbh1AUFSxGcAmS5V6xCVGdOnUXuZ6gqCeZ6wv9AQMrMJbKl9MGOqUBgUbHklifApGv3pKSbYPS3GUzDRUmR6w4kD0mGKc3IjmPFZ%2F8Crhlj5nWbyKDBNfdWxLOoFjSLqX6j14VF5F%2Bq4FwnjDdPARz8YNooGLKP7tdpusFcZvOJkI4xM0vuyPXUzaXkS8dVaAPtAat%2FLsuoXu%2FQ4Phj2WJmKp9lLqqy5%2FSHSis5du5KFhkqDl00hx9yFbDWNdXWABVnl30%2BqTuqF8SZE6i&X-Amz-Signature=1f1ca6cb6dceed2308f6a2bbd4acd50e24c72f296a9c27a949f263146621fe23&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Q5RAYCW4%2F20260726%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260726T125606Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGsaCXVzLXdlc3QtMiJHMEUCIQDMy1sicPKSw6UwvUIvEi5uWJ2Ft8Ft8f4j9wyIUbyQmAIgCP5QENPp2N8Sj0z3hEgItXut8X1a%2FDkqyf1mu8QZdNEq%2FwMINBAAGgw2Mzc0MjMxODM4MDUiDNMTKNIt5lPrOWahcCrcA%2By%2BMKR69ctE9EP9Vnh%2BwP%2F%2BD%2B%2F0tOuPgc35sqx9dirmOPBIlOzKC1Xhsu7YcDaTV0ki%2Bvcu2lmfuyJWy9Fb7vKYu2P%2B4GXLsH1g3bTf6QYl0nEZCmLIDup7EsO7U4PkWLM9L5a5EnWGVlSmuZzusg5KAonCMaziTutZ8OGjJz8TX%2BEpyex3CD%2BNynmUWmfNsLN4I%2B6RPQ3tUCywdIUhPKChUorWe7kJRn%2FJUU930Clih90GlvQG6WY6bheOB9Wfg3SlMv%2FsmNKpMvzZV%2FfwRsuTFJkDGg%2BmUbsAOnN4JBVnB%2Brz6oJ%2FV3jeYylMhTQX%2FlO29X2Gp7LWwdUbAGB0yCsiXC%2B%2FVM26f5SAq2tPSQAMnDaksfZ8vuHuayEmx3wj54nYSKHEh1zEjJqkmKzzrvs9Lc47P1dxjcCkP4xbOXg72x4mtQdduJwh4OrpzZVsx%2BEc%2BGfVeG8bQYlTQ1Qqjtp12vmHxIw3yi1IFrqfyZzIezHIHO6pMh94vH15Q%2F8TQQmqFdWjnZ3%2B82roUclfExPauidarY%2B1AnlpksSbJsqQn02Tlz27IrPs9pKJe5LBA8djOf%2BFTCaA0j4wUAKbh1AUFSxGcAmS5V6xCVGdOnUXuZ6gqCeZ6wv9AQMrMJbKl9MGOqUBgUbHklifApGv3pKSbYPS3GUzDRUmR6w4kD0mGKc3IjmPFZ%2F8Crhlj5nWbyKDBNfdWxLOoFjSLqX6j14VF5F%2Bq4FwnjDdPARz8YNooGLKP7tdpusFcZvOJkI4xM0vuyPXUzaXkS8dVaAPtAat%2FLsuoXu%2FQ4Phj2WJmKp9lLqqy5%2FSHSis5du5KFhkqDl00hx9yFbDWNdXWABVnl30%2BqTuqF8SZE6i&X-Amz-Signature=49e39d8c92bf2cf5d734db6ecf7ed61b41306d3beb89f107df935a60c2c7ee89&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
