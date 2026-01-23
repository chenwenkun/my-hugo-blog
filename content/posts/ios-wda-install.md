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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TZYKKRN5%2F20260123%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260123T122555Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECsaCXVzLXdlc3QtMiJHMEUCIQCtm2OeKk8fjXuC5NK%2B%2FlJx9MIXOLT%2B%2FGtptX47g16pgwIgHE2PAXYbLpjfCTNzvUARWfIwQlszNuSvT45ympnFiTEqiAQI8%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDBZY%2B9yZnmqSGbS5vSrcA3kA%2BW1cJB7%2BL0E0GRDzLORgtA1y%2FedCMF48FmrWf7b796pUrHnDbltkDBvic%2FvyX8XvX9DwAjGJDppBgvkUANdJtwjxB4nFweLBjX%2BVC7yt1OfbPyr9e2GVGujTLLgRri2vxjPjIqqJboGyqYrHJsJ7VDZRyQnjVmbNECtuBTvKYxF5W3XIVq0SxF2g%2F5d%2Bp9gYBHV9PS7%2BQZga2sdBLKRS%2BkbcoNlgXI6Nohkqa8qNrNP%2BAM6fRv06Q1Rta6Al4Q3f7KqiIdmoRrSP%2FiVKov4kN9N6JVKpDqhIPzgQEeA9naD6eQ98KtAtTHaOZSn%2B82A%2F3GFqfAi%2BF9lw6udU56lKSAEcM6LiyD0POzbGwR8KgN0p5xQ7TWUucaemT8LtiK%2B2OH7KzwWxsLdsbfjRENBOIaKgQp%2Bq2f%2BP5N2TVJjCvu3qlgkxdF9awYCOoF5hXVZ5fIsh4y07%2FsvS6XtqAocF3WFtShgJ1GTWwOJJxfSiaAT7TDjjBb0qjSJcQ2s8tgh%2B6pN9TFmtCk0spcW49uh%2BtUaDFzYRWd13%2F8T7bmxEhBxR1vETvoS5M5a8czv2BvOom9Xg2bniKv%2F6hvBBJYAcilZZYv8ztshyGMiSPfwR%2FdARywNI%2FqAsJUY%2FMJaYzcsGOqUB%2Ff7YFgcAdRs2ddQfBb4AGopjNkekarLkkCV9U5wxNIyL5%2FiIdw5daCipghD748dNumLVTsyYmvz8SSrIlkmaOSUVMlZ9GHzYg%2BuQys7b%2FWSBEVBhi%2FkYiMif4Say2G0%2FRi%2FB8ewBmuToJ0XJgzvG%2Fn1iYPfPJerXNrSPOu9kQQg1kwu%2FekBWL3iyVPbmxvhzSMofkClrTKfH9YdkfGevDZsmnzKn&X-Amz-Signature=581ebf89267c7c777632cb41abbbf2006c1e4a9cfd740309ff1899196c1bb3da&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TZYKKRN5%2F20260123%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260123T122555Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECsaCXVzLXdlc3QtMiJHMEUCIQCtm2OeKk8fjXuC5NK%2B%2FlJx9MIXOLT%2B%2FGtptX47g16pgwIgHE2PAXYbLpjfCTNzvUARWfIwQlszNuSvT45ympnFiTEqiAQI8%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDBZY%2B9yZnmqSGbS5vSrcA3kA%2BW1cJB7%2BL0E0GRDzLORgtA1y%2FedCMF48FmrWf7b796pUrHnDbltkDBvic%2FvyX8XvX9DwAjGJDppBgvkUANdJtwjxB4nFweLBjX%2BVC7yt1OfbPyr9e2GVGujTLLgRri2vxjPjIqqJboGyqYrHJsJ7VDZRyQnjVmbNECtuBTvKYxF5W3XIVq0SxF2g%2F5d%2Bp9gYBHV9PS7%2BQZga2sdBLKRS%2BkbcoNlgXI6Nohkqa8qNrNP%2BAM6fRv06Q1Rta6Al4Q3f7KqiIdmoRrSP%2FiVKov4kN9N6JVKpDqhIPzgQEeA9naD6eQ98KtAtTHaOZSn%2B82A%2F3GFqfAi%2BF9lw6udU56lKSAEcM6LiyD0POzbGwR8KgN0p5xQ7TWUucaemT8LtiK%2B2OH7KzwWxsLdsbfjRENBOIaKgQp%2Bq2f%2BP5N2TVJjCvu3qlgkxdF9awYCOoF5hXVZ5fIsh4y07%2FsvS6XtqAocF3WFtShgJ1GTWwOJJxfSiaAT7TDjjBb0qjSJcQ2s8tgh%2B6pN9TFmtCk0spcW49uh%2BtUaDFzYRWd13%2F8T7bmxEhBxR1vETvoS5M5a8czv2BvOom9Xg2bniKv%2F6hvBBJYAcilZZYv8ztshyGMiSPfwR%2FdARywNI%2FqAsJUY%2FMJaYzcsGOqUB%2Ff7YFgcAdRs2ddQfBb4AGopjNkekarLkkCV9U5wxNIyL5%2FiIdw5daCipghD748dNumLVTsyYmvz8SSrIlkmaOSUVMlZ9GHzYg%2BuQys7b%2FWSBEVBhi%2FkYiMif4Say2G0%2FRi%2FB8ewBmuToJ0XJgzvG%2Fn1iYPfPJerXNrSPOu9kQQg1kwu%2FekBWL3iyVPbmxvhzSMofkClrTKfH9YdkfGevDZsmnzKn&X-Amz-Signature=7991b33260611a4f787e8670a8c216c194a84da92de254b3d89efbb1271be00e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
