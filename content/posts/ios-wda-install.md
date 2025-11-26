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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466W4HELD5Q%2F20251126%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251126T061821Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCxgRSWeg6yAOUStJXusYnAfY4cB%2Fb8BoggxLMqYmyJKwIhALIfjfZ87%2BIQsadsYri0TjS8haxxViLzi2ljFMT%2Bwg4SKv8DCH8QABoMNjM3NDIzMTgzODA1Igy5l0Mv1liLGE2xnxoq3ANYjdvmUWroco4HqR%2FZcTAUUca3otYYurRUD7pFqiQk9UrnKTA2i26s3dJFxQSt4AL29keuUvVMI%2B8OT6tXn8O48BJafssawU7WEwWpSsvCEoQEJ%2BoGxtNk%2FstCvvNNDc35mcdB6n28A8z%2B1zlr%2B17VdceqzMDZq0GNy8KiWMfdJAFYguK1SyNhV8vKcPe1F2TQcwxSSkKnZSWkUX4%2FiIZPaQvqdP2jW9CGHNhq7FfPHa2yeaWQgzyvCFxCYqO3KQCyxVzGWuJI%2Fzan2I4E973GeFqy8P02BsfY4GpNCQpuPN9Ynzj37tiLNFS5cAuyTqr8GRxYTm7zOnbBwbLQ9tJKziGFQsTk44InSDc3akke56FsYfZnsvopG%2FcQwL2GI5HzE5IgZ%2BRfvTfpcrysXHAKTkhjkYLQ4SnrliFMw%2FCO%2B8ElC8SpPt79vxcp6rbhpsrlcNA0DQQDAcvL0LCIC9rmr6xuajjySKKqpi1RN8UNbWgP8J9ajGIBpuDoGCb5UagaBMLAyPOPBrk4hMZK8414gOxs2uXJaLO832I919E9NZRYRZ9sOHBIWHuiMpnhMPv%2BExK%2BnJjdSwrIJ9HXdy4ZI7vLYsZcs%2BPJp6YyWsbdiQOLNsYMk%2FncdiZ0%2FTCksprJBjqkAVd5aKNEI%2FkytmV4YRvYHrVeNGj93eAhheeMBh3ohm3q8Fgb3d7Q9C7h%2BLwHRm%2BL2Y%2F3N6ioUHux3R6T50toOMV%2F7fJHkzjeGGRPYUl6DQNZY8An%2BTsd4XqegWWanCr3Z27EETrATGoysh3ZcvjDS4DpaYS%2FsEvoCWy0fJkiQAa4nzIqDojGWcvZ%2BkOEsWnmFrAEZG2SvYRcAzZjDXC%2FX99YaM%2B5&X-Amz-Signature=17996584935721b629412df7208a5baee7f92bce8ee8fe89ff64079984f56671&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466W4HELD5Q%2F20251126%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251126T061821Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCxgRSWeg6yAOUStJXusYnAfY4cB%2Fb8BoggxLMqYmyJKwIhALIfjfZ87%2BIQsadsYri0TjS8haxxViLzi2ljFMT%2Bwg4SKv8DCH8QABoMNjM3NDIzMTgzODA1Igy5l0Mv1liLGE2xnxoq3ANYjdvmUWroco4HqR%2FZcTAUUca3otYYurRUD7pFqiQk9UrnKTA2i26s3dJFxQSt4AL29keuUvVMI%2B8OT6tXn8O48BJafssawU7WEwWpSsvCEoQEJ%2BoGxtNk%2FstCvvNNDc35mcdB6n28A8z%2B1zlr%2B17VdceqzMDZq0GNy8KiWMfdJAFYguK1SyNhV8vKcPe1F2TQcwxSSkKnZSWkUX4%2FiIZPaQvqdP2jW9CGHNhq7FfPHa2yeaWQgzyvCFxCYqO3KQCyxVzGWuJI%2Fzan2I4E973GeFqy8P02BsfY4GpNCQpuPN9Ynzj37tiLNFS5cAuyTqr8GRxYTm7zOnbBwbLQ9tJKziGFQsTk44InSDc3akke56FsYfZnsvopG%2FcQwL2GI5HzE5IgZ%2BRfvTfpcrysXHAKTkhjkYLQ4SnrliFMw%2FCO%2B8ElC8SpPt79vxcp6rbhpsrlcNA0DQQDAcvL0LCIC9rmr6xuajjySKKqpi1RN8UNbWgP8J9ajGIBpuDoGCb5UagaBMLAyPOPBrk4hMZK8414gOxs2uXJaLO832I919E9NZRYRZ9sOHBIWHuiMpnhMPv%2BExK%2BnJjdSwrIJ9HXdy4ZI7vLYsZcs%2BPJp6YyWsbdiQOLNsYMk%2FncdiZ0%2FTCksprJBjqkAVd5aKNEI%2FkytmV4YRvYHrVeNGj93eAhheeMBh3ohm3q8Fgb3d7Q9C7h%2BLwHRm%2BL2Y%2F3N6ioUHux3R6T50toOMV%2F7fJHkzjeGGRPYUl6DQNZY8An%2BTsd4XqegWWanCr3Z27EETrATGoysh3ZcvjDS4DpaYS%2FsEvoCWy0fJkiQAa4nzIqDojGWcvZ%2BkOEsWnmFrAEZG2SvYRcAzZjDXC%2FX99YaM%2B5&X-Amz-Signature=daf516224e305785a6abee062e3392b47abf76408c0fd70d611c8d891cafb1dd&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
