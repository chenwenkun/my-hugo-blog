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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QIWBRJEE%2F20260312%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260312T123503Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEK3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIG%2B%2FTphXLdyFb8ZTCN%2Bd4MLHFi2FKYzgI5dcpa30ZO1rAiA85l7LHyCUIpKbfGMox0Z%2FVlOXcGPWg1pdeM0pFTW%2FZir%2FAwh1EAAaDDYzNzQyMzE4MzgwNSIMcewv47K9pfLGQYLMKtwDb3lLC1H4nYY1Hef4qveO1ZMQzSut1tpfwi9pudXAPPKY8medZa4S7tkEe%2FHa0mhAPcEe012TO58J7AkXCzKWCHRf5paiu2v%2FmGsqfKiP24YN%2FiA14L7qQFwMgiraPzNvKwgSBLeJpRqn9A0bcaoT2b%2BPvG%2BooD4oqv34IhE%2Btf6WXqZWWrZFYIs4nyJkFIs02Ek%2F1DSMRxzyuvEUeL9kS%2BEETTPgH%2FQAXpb0ywrvs%2B8YabR5Rpz68kvj9gzJBRP3sVYutQ2aUHTyG0QkaOzbs5bKbO1fh07zY6su7DGBog6slbL7DrZ2%2B%2B3oFRRJw5cQbQUkbeXvRf%2F29dDT48AezR%2FTmgWbRFxCmjqtwQAR%2BjKZ62DaVyTYiJbtuiJxe6PnNHWjYr5335AKulmIsXuPsMTXGeiHY4YAY5mCCvDA9bDaQwyn6fRgxqqJwpxc15jGmoVnoA1pNSwbdoBgpiIYbVyGsi%2FDHgSPe5dLfG1XjjZtrR8g58nBOkzEvpMPCMDyFZGD4jlLe66RngvbhJDRzbbkDXjqcQRHhfnlsW8QNZmjn5C5x9DAf6EuDYWPqRVaLXO4DScf9E2bjNOGwCO7tg0Wmw5oXK0kNZzbqhoY7B0U1iE7BhQJK6%2B1MBowvOHKzQY6pgHKs6kr%2B5nDTATxTZ7rl2TXi%2Bx2IT7PHw3VRJspsjJzafWakSOqXeEtNwzWc1lW0Cr3bl1YwG%2B3n5Fbv7IxZxJVT%2F%2F6VxvQsA2%2BVKXOSL%2Fzy%2BuPvYNInufV5pvNqeRymmC7aBGw8z%2FDLt4AHFF0lLP7mwcRUsw48Um9PLxOf6f0%2FQ3bRFPdZFrKuJqFgb3hiaYrrJIDv8fPir6RMzckRq45DhRkfQDJ&X-Amz-Signature=0bbaf40e19e03f41da512a36982b6ac733c054ff7ef3e35a79e96c2a2fc131a3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QIWBRJEE%2F20260312%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260312T123503Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEK3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIG%2B%2FTphXLdyFb8ZTCN%2Bd4MLHFi2FKYzgI5dcpa30ZO1rAiA85l7LHyCUIpKbfGMox0Z%2FVlOXcGPWg1pdeM0pFTW%2FZir%2FAwh1EAAaDDYzNzQyMzE4MzgwNSIMcewv47K9pfLGQYLMKtwDb3lLC1H4nYY1Hef4qveO1ZMQzSut1tpfwi9pudXAPPKY8medZa4S7tkEe%2FHa0mhAPcEe012TO58J7AkXCzKWCHRf5paiu2v%2FmGsqfKiP24YN%2FiA14L7qQFwMgiraPzNvKwgSBLeJpRqn9A0bcaoT2b%2BPvG%2BooD4oqv34IhE%2Btf6WXqZWWrZFYIs4nyJkFIs02Ek%2F1DSMRxzyuvEUeL9kS%2BEETTPgH%2FQAXpb0ywrvs%2B8YabR5Rpz68kvj9gzJBRP3sVYutQ2aUHTyG0QkaOzbs5bKbO1fh07zY6su7DGBog6slbL7DrZ2%2B%2B3oFRRJw5cQbQUkbeXvRf%2F29dDT48AezR%2FTmgWbRFxCmjqtwQAR%2BjKZ62DaVyTYiJbtuiJxe6PnNHWjYr5335AKulmIsXuPsMTXGeiHY4YAY5mCCvDA9bDaQwyn6fRgxqqJwpxc15jGmoVnoA1pNSwbdoBgpiIYbVyGsi%2FDHgSPe5dLfG1XjjZtrR8g58nBOkzEvpMPCMDyFZGD4jlLe66RngvbhJDRzbbkDXjqcQRHhfnlsW8QNZmjn5C5x9DAf6EuDYWPqRVaLXO4DScf9E2bjNOGwCO7tg0Wmw5oXK0kNZzbqhoY7B0U1iE7BhQJK6%2B1MBowvOHKzQY6pgHKs6kr%2B5nDTATxTZ7rl2TXi%2Bx2IT7PHw3VRJspsjJzafWakSOqXeEtNwzWc1lW0Cr3bl1YwG%2B3n5Fbv7IxZxJVT%2F%2F6VxvQsA2%2BVKXOSL%2Fzy%2BuPvYNInufV5pvNqeRymmC7aBGw8z%2FDLt4AHFF0lLP7mwcRUsw48Um9PLxOf6f0%2FQ3bRFPdZFrKuJqFgb3hiaYrrJIDv8fPir6RMzckRq45DhRkfQDJ&X-Amz-Signature=3ddf3add3867662205cd42dd66e7d9ffbd1b59376cb3b722a5f794efc72de6ba&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
