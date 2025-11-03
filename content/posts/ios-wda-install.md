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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZWFLKMNS%2F20251103%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251103T181552Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIEH8rjFdjK5Int6soB87EY2lNn5yjxpWA6XzK3tPDjuCAiEAsjpN47f5%2BUH6TAd4z%2B9ZuNfkC093H8%2BskCuJ0809%2Fd0q%2FwMIYhAAGgw2Mzc0MjMxODM4MDUiDIjzGxukEKUAUfsb0ircA2RAXZ6AMXz223ZG7ETE%2BDwAHsubIqTt52AKz4mZssqTzzz%2FYRgYeENZvGVGr0pfpUtIsPdDjgWj6DkLEOipqUI4Cd6kkSnSKlLBT%2BYrDHdxCOv1Emep0EhQzwiNQ5mGbC%2B1PvjRx2aEBLIGgtw4Ygcr1kUGwOncChZeLyc2JeLizTggpCQFOTx7Gc5oXfY7q9YpwP69UanzeTRg8RjA%2FyqPUO5h6Pw52%2BLiSFmj2YUaRa834MAlsqEYR%2BeiY%2Fvd%2F1TSGttscdrhMNOY0EG%2Bk5p%2FoTOsWSlGs3qfP1ajnrFJXvz5pwrenR49ZTRkKLKkMVU2pxKcBPwWxS4l%2F6NqaLJI4ZLrPhnS4ztrJxMpEykVsMTbfHahXJStdH%2FwC3hyT01LIWsmRKSQycs0V7LoWj94DuIt%2BO%2F8OUWlB1Xish24Mwvnv6lsEKp5sLfW0woO%2FfZE25LPkbGD2ym9lm6s0LN7R5sEsJBdas%2FGjv3V6TLaYZy8hZWL9lP2nHRjd4J9hlBWvWriUmVM7qYZwkDhgYTNbCQeMNUQ5UU%2BDYmENuVpDfyOI%2FO7%2B%2FGMmOrJxUhl4Mys8siTcRA%2FZZHuysPdZ9zdbKzt5A6IxQsOOr6km6%2FZBY8pJe22mOlpncFKMNfHo8gGOqUBxqnbnPJI8a%2Fqis3M%2FNXKe7CnnkH4aCevuIeugY26iaTQCX1VMuanTtdCp%2F%2FFJzNE25mI6VJ%2BnfxsoRAA8lMQ4S35Yanu%2BSnsVWTe%2BNRQHrZtSuVR0WH9%2F%2FJ79VehzNjr%2FjN8ZusBQ%2FL1vVd6Nwctkx3Rt4gTzIVJoLIawqPVdSCMbutdOJ7ZLsSa1UPTqbWDYhA6ct504kP3hmW72TPQpV45cSkm&X-Amz-Signature=7d87b7bb031f97e98173baa14d559b6e864557f45d3eb6c1c9fd4c9cbe2452dd&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZWFLKMNS%2F20251103%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251103T181552Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIEH8rjFdjK5Int6soB87EY2lNn5yjxpWA6XzK3tPDjuCAiEAsjpN47f5%2BUH6TAd4z%2B9ZuNfkC093H8%2BskCuJ0809%2Fd0q%2FwMIYhAAGgw2Mzc0MjMxODM4MDUiDIjzGxukEKUAUfsb0ircA2RAXZ6AMXz223ZG7ETE%2BDwAHsubIqTt52AKz4mZssqTzzz%2FYRgYeENZvGVGr0pfpUtIsPdDjgWj6DkLEOipqUI4Cd6kkSnSKlLBT%2BYrDHdxCOv1Emep0EhQzwiNQ5mGbC%2B1PvjRx2aEBLIGgtw4Ygcr1kUGwOncChZeLyc2JeLizTggpCQFOTx7Gc5oXfY7q9YpwP69UanzeTRg8RjA%2FyqPUO5h6Pw52%2BLiSFmj2YUaRa834MAlsqEYR%2BeiY%2Fvd%2F1TSGttscdrhMNOY0EG%2Bk5p%2FoTOsWSlGs3qfP1ajnrFJXvz5pwrenR49ZTRkKLKkMVU2pxKcBPwWxS4l%2F6NqaLJI4ZLrPhnS4ztrJxMpEykVsMTbfHahXJStdH%2FwC3hyT01LIWsmRKSQycs0V7LoWj94DuIt%2BO%2F8OUWlB1Xish24Mwvnv6lsEKp5sLfW0woO%2FfZE25LPkbGD2ym9lm6s0LN7R5sEsJBdas%2FGjv3V6TLaYZy8hZWL9lP2nHRjd4J9hlBWvWriUmVM7qYZwkDhgYTNbCQeMNUQ5UU%2BDYmENuVpDfyOI%2FO7%2B%2FGMmOrJxUhl4Mys8siTcRA%2FZZHuysPdZ9zdbKzt5A6IxQsOOr6km6%2FZBY8pJe22mOlpncFKMNfHo8gGOqUBxqnbnPJI8a%2Fqis3M%2FNXKe7CnnkH4aCevuIeugY26iaTQCX1VMuanTtdCp%2F%2FFJzNE25mI6VJ%2BnfxsoRAA8lMQ4S35Yanu%2BSnsVWTe%2BNRQHrZtSuVR0WH9%2F%2FJ79VehzNjr%2FjN8ZusBQ%2FL1vVd6Nwctkx3Rt4gTzIVJoLIawqPVdSCMbutdOJ7ZLsSa1UPTqbWDYhA6ct504kP3hmW72TPQpV45cSkm&X-Amz-Signature=0aafd4a280ccf696c77c193d60a2d1812bfa291d2ab6c665034ec97cd542a12f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
