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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UJETB3C3%2F20260119%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260119T181831Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEND%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQC1ZHucZ1R9UusCiBw3R%2Bl%2FSIDHMAuuoWt0nxiCU44pCwIhAKJZV3gnv6cyETJ12wnd7JgH104cgRQ2yDSx7k2hIHs3KogECJn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzIicciuSm49535Nz8q3ANo0ryC8EKpvDgDsLP7KIuHnON1TpUB2fZzS3Mr4vEknm1QmMBIsPS9BI%2FRdB4ekRuKgWz2jVsueEv7Msx7UTxocp3dhAwJzFswZK8SyUawiNHGq%2BUn7zET%2B31IUy9j5V98GqjzCqyKZqdY7Kh2qnGDjVw9Vu09Rnn%2BqLMNxLNz0NxVzQpVS2dPT%2B1HY5BwEE5zDv4e3ebuKWoHcZnw5AugHuuhO%2Fo8ovBb%2FuDPAfzmZW2kwuBOmQ8OqSf94%2B8KhLyrLHQMDfqnQ%2Bzr%2BVhCHRcOfzWYFcMVyknuf%2BtX9imMPbHg%2FAVxwNo6Wt6ZT18feqwKHKbQfgSDPrim01%2BkOSJkgBMxOO%2F2WI9X%2Bf5ryB1cvsja9Hty9TsuKBK%2FcHgx8%2BA3lj9C%2ByYzm1IZ2OyZGUsIuqg1CLcdzi5lbyeJrHZ6ihMtJxBTPHcPyrhnbRObuQgUQLNDFdCLyLCgmNHUHjaPdsyYQ39PC1Y3zWu5lbcPRXxaAIRPxNrN6IaCMcXgWOk81FIt5N1TJGxWUgXGWRPya%2BsmQxEq%2FpWiML1wsiuY5azWiDx41742MVAuckByYEVhDEDHIeuKYQdBhSUi2Cnn5xKeDv7agy7a1gcffnOcyBQf1LrjywBRw%2F21dDC%2FobnLBjqkAUzZ3rdPEoDMx9%2BA0x%2FRgDzvmLKvpHdQ8TGw5zvINzhBdGVq16nqn6G7B4PJktkQLyEa%2FK6o9D1ADbYHG5skBfkSsHQnHNyV00QDZyAAkpXdPRMQW8jStKUPbesRGB%2FMFoca2ltG%2Bi4EDOv4G1wJe4Deo3YnJ3AGuBFXBJzT5e6I7QrLSxIwKnHmRzp4zgRHateH8fxqohDvKKZCRm7WK0MlKznb&X-Amz-Signature=2648411789bd417c9019f40c0af9d2c8c264684371b313172220bd0c622511dc&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UJETB3C3%2F20260119%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260119T181831Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEND%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQC1ZHucZ1R9UusCiBw3R%2Bl%2FSIDHMAuuoWt0nxiCU44pCwIhAKJZV3gnv6cyETJ12wnd7JgH104cgRQ2yDSx7k2hIHs3KogECJn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzIicciuSm49535Nz8q3ANo0ryC8EKpvDgDsLP7KIuHnON1TpUB2fZzS3Mr4vEknm1QmMBIsPS9BI%2FRdB4ekRuKgWz2jVsueEv7Msx7UTxocp3dhAwJzFswZK8SyUawiNHGq%2BUn7zET%2B31IUy9j5V98GqjzCqyKZqdY7Kh2qnGDjVw9Vu09Rnn%2BqLMNxLNz0NxVzQpVS2dPT%2B1HY5BwEE5zDv4e3ebuKWoHcZnw5AugHuuhO%2Fo8ovBb%2FuDPAfzmZW2kwuBOmQ8OqSf94%2B8KhLyrLHQMDfqnQ%2Bzr%2BVhCHRcOfzWYFcMVyknuf%2BtX9imMPbHg%2FAVxwNo6Wt6ZT18feqwKHKbQfgSDPrim01%2BkOSJkgBMxOO%2F2WI9X%2Bf5ryB1cvsja9Hty9TsuKBK%2FcHgx8%2BA3lj9C%2ByYzm1IZ2OyZGUsIuqg1CLcdzi5lbyeJrHZ6ihMtJxBTPHcPyrhnbRObuQgUQLNDFdCLyLCgmNHUHjaPdsyYQ39PC1Y3zWu5lbcPRXxaAIRPxNrN6IaCMcXgWOk81FIt5N1TJGxWUgXGWRPya%2BsmQxEq%2FpWiML1wsiuY5azWiDx41742MVAuckByYEVhDEDHIeuKYQdBhSUi2Cnn5xKeDv7agy7a1gcffnOcyBQf1LrjywBRw%2F21dDC%2FobnLBjqkAUzZ3rdPEoDMx9%2BA0x%2FRgDzvmLKvpHdQ8TGw5zvINzhBdGVq16nqn6G7B4PJktkQLyEa%2FK6o9D1ADbYHG5skBfkSsHQnHNyV00QDZyAAkpXdPRMQW8jStKUPbesRGB%2FMFoca2ltG%2Bi4EDOv4G1wJe4Deo3YnJ3AGuBFXBJzT5e6I7QrLSxIwKnHmRzp4zgRHateH8fxqohDvKKZCRm7WK0MlKznb&X-Amz-Signature=d37df89ed3ca8c2f43fbf6da72a39a485e10e450c0ebb699b2a79a6b34d2f05c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
