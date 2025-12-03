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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YUTQFJMJ%2F20251203%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251203T005435Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFgaCXVzLXdlc3QtMiJHMEUCIQDcV%2Fn7VaKjnExCRxXERucunZdkaJq5H3b0y99PtqkrgQIgZiHKEuiqJ%2FZwStyi5dKby0wxy2gL9sXWa0L4kX70Q30q%2FwMIIRAAGgw2Mzc0MjMxODM4MDUiDLzBQUD424BV9BnhHSrcA%2FGoyDsbEeU2GRhoNWxdUMpLssv7%2FrwDrrfBW9nhYXqbE8HEaKscggnAPpfWX%2FARyend9y6V6QNL0l7bdR0QFnlNEaVvh9164G8xqFnL2Ljw%2Ff0el67c619WyovPc3LRiy4he0taWgjElpBXg7CKJsbAtG0kwnuncfWQ4ClsVoSXVCx6NwcDz55Os6e%2BT3%2FsQ6lkyh8%2FgkOAxRLTr090hwxjqL5guBbnlzKOJWFYh22AAD1ZJ2MsyUQDewrf6Zb0j9ZBcNaEa1BWPkUdy8oELwnjLLWWUfUrTf3cmEYqVpzdqcKwGeCI%2BaWw%2FKcZ84j4iwtY8uBDzTNjUMwsJ%2BcjU8jEaPSi7dQjr0ZVGLe%2F3abymE%2B%2BtSgmcR5kc3Tf6OdIVf5sCvbvpVz5r0P%2FQT12e6wfeG3EPn5Y9M4KvCffeBv5FGr5sGJVrkhqoS5QOUESXWbi%2BgfhLhHCr9OJ3KybD4uABUgwLCnMyN4LadQyFLGrvG74w8DLvKDqblJ6tEiGB7O56UDoVaK6EiQk3mrO4tSCNJRLnVGKiKuB%2BIhczdg3ctDIeVKMcrO6DRrGl4ogE8rm%2B%2BD2EMXlzw4DEnDB6sYLGXtlzOY3MAA9R%2FLzvyj22u8wThDCKFjFR7tvMJT%2FvckGOqUB88cVyWRqBl2CVvha1mHLJxDaPc1HI3m04Y7bztWrZq8pV6eedSI6ktKm0%2Bvc4mW%2BuoYC6%2BJvPJaQwAFzbGclPNfNe9Nja9onJ1Ic0cnxEGYAaOQLO5zTEq4LTwlQtqns44IHwjcR%2FHaW%2BYW2%2FbxRF72RFUmq3KwIqC4WlRfxChbC0kzNvXQZ59b5r9sRdodRKkXPCo36wS8uZmbevw76m%2FNSKa%2F4&X-Amz-Signature=212302c8a7b7f4af8a1880f8cdfd2187042ce8f8712083f042f876c8e0e2d7aa&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YUTQFJMJ%2F20251203%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251203T005435Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFgaCXVzLXdlc3QtMiJHMEUCIQDcV%2Fn7VaKjnExCRxXERucunZdkaJq5H3b0y99PtqkrgQIgZiHKEuiqJ%2FZwStyi5dKby0wxy2gL9sXWa0L4kX70Q30q%2FwMIIRAAGgw2Mzc0MjMxODM4MDUiDLzBQUD424BV9BnhHSrcA%2FGoyDsbEeU2GRhoNWxdUMpLssv7%2FrwDrrfBW9nhYXqbE8HEaKscggnAPpfWX%2FARyend9y6V6QNL0l7bdR0QFnlNEaVvh9164G8xqFnL2Ljw%2Ff0el67c619WyovPc3LRiy4he0taWgjElpBXg7CKJsbAtG0kwnuncfWQ4ClsVoSXVCx6NwcDz55Os6e%2BT3%2FsQ6lkyh8%2FgkOAxRLTr090hwxjqL5guBbnlzKOJWFYh22AAD1ZJ2MsyUQDewrf6Zb0j9ZBcNaEa1BWPkUdy8oELwnjLLWWUfUrTf3cmEYqVpzdqcKwGeCI%2BaWw%2FKcZ84j4iwtY8uBDzTNjUMwsJ%2BcjU8jEaPSi7dQjr0ZVGLe%2F3abymE%2B%2BtSgmcR5kc3Tf6OdIVf5sCvbvpVz5r0P%2FQT12e6wfeG3EPn5Y9M4KvCffeBv5FGr5sGJVrkhqoS5QOUESXWbi%2BgfhLhHCr9OJ3KybD4uABUgwLCnMyN4LadQyFLGrvG74w8DLvKDqblJ6tEiGB7O56UDoVaK6EiQk3mrO4tSCNJRLnVGKiKuB%2BIhczdg3ctDIeVKMcrO6DRrGl4ogE8rm%2B%2BD2EMXlzw4DEnDB6sYLGXtlzOY3MAA9R%2FLzvyj22u8wThDCKFjFR7tvMJT%2FvckGOqUB88cVyWRqBl2CVvha1mHLJxDaPc1HI3m04Y7bztWrZq8pV6eedSI6ktKm0%2Bvc4mW%2BuoYC6%2BJvPJaQwAFzbGclPNfNe9Nja9onJ1Ic0cnxEGYAaOQLO5zTEq4LTwlQtqns44IHwjcR%2FHaW%2BYW2%2FbxRF72RFUmq3KwIqC4WlRfxChbC0kzNvXQZ59b5r9sRdodRKkXPCo36wS8uZmbevw76m%2FNSKa%2F4&X-Amz-Signature=cc8e3d145331886a7a3a7cd5b3b70acedafb6effcefc8d58cf6f43bfecc3678d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
