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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZWRYOQLO%2F20251007%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251007T004928Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCICxyLmClz7abFR5ji9586gIlVm0%2B9GCd43VHRNEQYnh8AiEAoPlD2lNzn%2BaWgTCjfUKGj7EUM26fkZPo4V9ds0x2sQQqiAQIlP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDEY4CKpM9DgaYiH8xSrcA%2FFbqnwGMAh7UxvcRtWFnIyFwc8OqXZplov0BJIxG23XUsw6oVzIVoz2WdbhYLUFQLg4TGGn6tLHx77RINYJV5VRH97r9L5Qpi4%2BAG4558R5v1QoVB8Gmm%2FD63%2FjRcE0Lpw6anQ4hkRm2AeW4Y3ZrTWV6FxuWp50UnsQ1BxUw2jlC%2B8QhK5NyPOfbsg5Jo2OMyXHZHjk6AkfElWe9Mxw2KVsXazSipMFM4lFct4x6rYtb7ddzavi154WCWpQ1NB%2FBX%2FsaCEg%2FS44a43EWsWAGr%2FWXMDIZTLSX9JnNxa8M36BfBlcKRLUsL1Os8YUCsQOsz4oydnphPL4lvA3dHXHoTBGIqbNRP4wY2lmJlhIub9x4qthnrzytPCEXXYNeVLkFE45MiamphApH9tk2njJAEyo9xeGd6bfG8WQKIW7XidHNpl%2BmpSlsi2rE%2FC7Xy%2Fwk7utvhsbDF1I1m5v%2ByypirSqJ7piiIs9EDKR9gdJQ1zRw98HtRo0%2FH4rpzQxkD6HbYTHy7smIAUma1aWxGKKN9PnJbTqGdovGP8mRzk41gbcjDe8zJoAAM3D7Tpub%2BR%2F1Gy2RAa2kAFRfU%2BYAk09E%2FPkmaNOrTs70MZsjO9Y4jL01VN7XOXKh7mMOmKDMJKtkMcGOqUBwXf5aQP2XOyp%2Bt8gTbe%2FUgG1shvCe8hWcRMlRRCYecKba9pJVE2gfUgaEsbZpR6wfVLedZk1Rs1PpXhLWqMsgROPLcHri%2BHXMaNw9uc7TYI%2BXUW5ZwITor1ZPiGEil%2FkkXU3ma3FA1WwzRzix7tQJeehnLudLdADlEeOxZXqVMkUzCv8YHl3fO86AUwzfQa%2B%2FwRBsxb5x8nXFATs%2BRTen4aUlN%2Bs&X-Amz-Signature=8aac1e80c30fbb876673570173e85dc9008463c10d9c96ddd08296b10d2b5860&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZWRYOQLO%2F20251007%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251007T004928Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCICxyLmClz7abFR5ji9586gIlVm0%2B9GCd43VHRNEQYnh8AiEAoPlD2lNzn%2BaWgTCjfUKGj7EUM26fkZPo4V9ds0x2sQQqiAQIlP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDEY4CKpM9DgaYiH8xSrcA%2FFbqnwGMAh7UxvcRtWFnIyFwc8OqXZplov0BJIxG23XUsw6oVzIVoz2WdbhYLUFQLg4TGGn6tLHx77RINYJV5VRH97r9L5Qpi4%2BAG4558R5v1QoVB8Gmm%2FD63%2FjRcE0Lpw6anQ4hkRm2AeW4Y3ZrTWV6FxuWp50UnsQ1BxUw2jlC%2B8QhK5NyPOfbsg5Jo2OMyXHZHjk6AkfElWe9Mxw2KVsXazSipMFM4lFct4x6rYtb7ddzavi154WCWpQ1NB%2FBX%2FsaCEg%2FS44a43EWsWAGr%2FWXMDIZTLSX9JnNxa8M36BfBlcKRLUsL1Os8YUCsQOsz4oydnphPL4lvA3dHXHoTBGIqbNRP4wY2lmJlhIub9x4qthnrzytPCEXXYNeVLkFE45MiamphApH9tk2njJAEyo9xeGd6bfG8WQKIW7XidHNpl%2BmpSlsi2rE%2FC7Xy%2Fwk7utvhsbDF1I1m5v%2ByypirSqJ7piiIs9EDKR9gdJQ1zRw98HtRo0%2FH4rpzQxkD6HbYTHy7smIAUma1aWxGKKN9PnJbTqGdovGP8mRzk41gbcjDe8zJoAAM3D7Tpub%2BR%2F1Gy2RAa2kAFRfU%2BYAk09E%2FPkmaNOrTs70MZsjO9Y4jL01VN7XOXKh7mMOmKDMJKtkMcGOqUBwXf5aQP2XOyp%2Bt8gTbe%2FUgG1shvCe8hWcRMlRRCYecKba9pJVE2gfUgaEsbZpR6wfVLedZk1Rs1PpXhLWqMsgROPLcHri%2BHXMaNw9uc7TYI%2BXUW5ZwITor1ZPiGEil%2FkkXU3ma3FA1WwzRzix7tQJeehnLudLdADlEeOxZXqVMkUzCv8YHl3fO86AUwzfQa%2B%2FwRBsxb5x8nXFATs%2BRTen4aUlN%2Bs&X-Amz-Signature=d96f87dbfc91bc83994e1a4adc2d80913aed36df0de54b433b1728ee85e836b6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
