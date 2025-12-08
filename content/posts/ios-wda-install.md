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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UHVZFVOS%2F20251208%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251208T062024Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQD%2FVLxJdACEn%2FWg7U4jBpqMn%2BC06i22mhaQxm8sJ2riLgIhAJLaUdLGjyB5vhnn%2FKGyvgklW62JLf89cCf0ddSiRJhQKogECJ%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxQ6SSoej4JxII6%2Fegq3ANqHQtD7WmPKslryhNQYKTmxih%2FWG3CL%2F2pSYOvp%2BfLqIfCrasvWFPWn6RYEuRQw1ezdqOgbEqUtoRaXzdb0fa%2FnfEKXrWsBUG8aKYQcFw%2Bp523PqWkigJtcQrYocqOKRCFO1%2FxLhDqmczIMXNy86JQF%2F4hU4QE%2BWEb1ZbKnMTVUfzqsOhy3o8GzG08Sve1bGvSzFKXMbD0Zq83H5KGXy1CFUTGzVR5d6PbHyMpxs0%2FvxVodLzeGsDpbTBijOUaNuWSSMHc7qRD7ouw7mWmGVvMmbfOiI9ujAtnP7hZChBx3m9AfLn5MtK73s3WVsJFJLoPvDGTvfMTCfoE2H1mAa%2FX%2FZ0YOB4bBZjXcimyraeAWx583dOr5P8AEB68%2F8vK4SH6Ifzb%2BuL4nhsxag%2FFuK4%2FuQUEMFGn8wAcxk1yiYjW1rx6sb9yxatInaZBkoWb7a%2BFPkOpxmnn%2Bfj%2FwSyneu48B9xcUITZSXBeQkV8oL%2BaWSotNxWbuNWErPVQ7KI7hIegHoUz1rs3ZkA%2BkXE93mcaXuH%2FI66HjwSOiDxCaWcZbXre0kBJzAzNWcMG5LoS4Dp0G0CAQ29AFFdjFDFrjSPnlzEYHtk8EebWvIBEqICxe2zkviq0E1546YeF%2FDC50NnJBjqkAdfZHTYtUy8eck%2FzK88E4DcgtB%2B2YS9Zz5ThGlblR6BMKLu5zCrwjvB7RJVR%2BHPPbWo3kSuYkrOjTwchBA7%2BilsoX1Zx5TkkFK3nVNTliyfHTzuTMJb49uo7x5I%2ByoYxqxG1U3Cth6NpoibSVvGlnlFykOwsnI0D4s2EoZvZCojGL0iGPv1nVyMeGPfwmkG9JmHaAzO6b1AziAIAkLmpoMJ4g2C4&X-Amz-Signature=c86ffe6b6dea93f03259a0cfd75dccefce39ad3f3b0eac1a30ccbd90a9a9e98f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UHVZFVOS%2F20251208%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251208T062024Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQD%2FVLxJdACEn%2FWg7U4jBpqMn%2BC06i22mhaQxm8sJ2riLgIhAJLaUdLGjyB5vhnn%2FKGyvgklW62JLf89cCf0ddSiRJhQKogECJ%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxQ6SSoej4JxII6%2Fegq3ANqHQtD7WmPKslryhNQYKTmxih%2FWG3CL%2F2pSYOvp%2BfLqIfCrasvWFPWn6RYEuRQw1ezdqOgbEqUtoRaXzdb0fa%2FnfEKXrWsBUG8aKYQcFw%2Bp523PqWkigJtcQrYocqOKRCFO1%2FxLhDqmczIMXNy86JQF%2F4hU4QE%2BWEb1ZbKnMTVUfzqsOhy3o8GzG08Sve1bGvSzFKXMbD0Zq83H5KGXy1CFUTGzVR5d6PbHyMpxs0%2FvxVodLzeGsDpbTBijOUaNuWSSMHc7qRD7ouw7mWmGVvMmbfOiI9ujAtnP7hZChBx3m9AfLn5MtK73s3WVsJFJLoPvDGTvfMTCfoE2H1mAa%2FX%2FZ0YOB4bBZjXcimyraeAWx583dOr5P8AEB68%2F8vK4SH6Ifzb%2BuL4nhsxag%2FFuK4%2FuQUEMFGn8wAcxk1yiYjW1rx6sb9yxatInaZBkoWb7a%2BFPkOpxmnn%2Bfj%2FwSyneu48B9xcUITZSXBeQkV8oL%2BaWSotNxWbuNWErPVQ7KI7hIegHoUz1rs3ZkA%2BkXE93mcaXuH%2FI66HjwSOiDxCaWcZbXre0kBJzAzNWcMG5LoS4Dp0G0CAQ29AFFdjFDFrjSPnlzEYHtk8EebWvIBEqICxe2zkviq0E1546YeF%2FDC50NnJBjqkAdfZHTYtUy8eck%2FzK88E4DcgtB%2B2YS9Zz5ThGlblR6BMKLu5zCrwjvB7RJVR%2BHPPbWo3kSuYkrOjTwchBA7%2BilsoX1Zx5TkkFK3nVNTliyfHTzuTMJb49uo7x5I%2ByoYxqxG1U3Cth6NpoibSVvGlnlFykOwsnI0D4s2EoZvZCojGL0iGPv1nVyMeGPfwmkG9JmHaAzO6b1AziAIAkLmpoMJ4g2C4&X-Amz-Signature=a111c68515ad37663e1958d05fed2d4873292fad7d5037e0d9939ebefab4ae21&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
