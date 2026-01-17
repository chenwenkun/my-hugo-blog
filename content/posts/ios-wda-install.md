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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663AK6DYPY%2F20260117%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260117T061738Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIHsIAKDkV61%2F%2BwKEbO1lKFQPMlVmg9Dhea8K0I%2Bb%2B3nxAiEAx9SeRYKVJc58u%2Beh5fpJbVp%2BxQCKa8FQGh7BFHLkdYoq%2FwMIXhAAGgw2Mzc0MjMxODM4MDUiDPlOYranG6rB8Y5wfCrcA2bmSlB9lN%2B%2FQH8DOUzjoiIxpByFjOuixhBHqVPmNy%2BV9LAGXgfjLJuJVfgB1JqhOUWApAAA6yjI7mjylwyNx5xptz4vKt3%2BqjCZ%2Fz8GoKbnqblCwP8Mdwh3PBuep9BrKETIvpsIFVm0PqU%2FyeNvbockyaXGEPSxkPOccqhehzyLIpAOFja4WJGX2PfcuFTcJwTI%2FpXTdekShRpjbxM6fytYRpnZ3Vr5u%2FLUSQjzIR0IwKd94zrJrBOne7i%2BJ%2BZvauPeqtMfX4cPxnsvkM0V0qDzVCbfI9Ggr%2FXKedaa93ZxPV3rk%2FZxUDG5mLQnc%2FFdROnunt4kwyQRaeNdh1ygDI%2FcMrCm29NZfqtKAfDd9erLi5G35vUeCt7jXqTPAVNV9hUj%2BCuSqCIH%2F%2Fh93pbc4uz0XDhJy1kJTDz3nrDpc2rNjG9iUcBgfVU4TRvI1sNznJaE5k7pXN1o2oSRcHpirpxiovfRyh4BJdKhUbfAfksuZkSqvu8BTOy4PP4qeR5YmjlkZRRZuc6HNygmKs4iPzKWWFGlFPbFsbunzpEwojQCSl8VjjQBqzQCL%2BJlY0LSEfdiaH25OuqmCaTWApii3%2BGeemoU3IozDkDGcWsmCwUZ3k30KJThYML4CN%2FrMMO6rMsGOqUBmDya%2BUFHh3m7%2FhokdbIAYxVm9f4AEzzUkLgoURtsezgDPWrymhJSGVblzH%2FJZo7%2B7trsL9VYxcD5z9Z0YBoStINWbBMvk4YJv5OJN2soNmgQwo6zji67Ik5wn2gKPIu6mPDqGDXlKdLSjU42HM3yN%2B5c%2BQ%2FzFMMC3GjrFwZHDPjprCFnF4O5RsXXCZlc6czKOyVsIi0%2FMKU7Zc6Z4SSmmsVc3W9K&X-Amz-Signature=fffd5df62187d8fcb1b62581304bd53f514ebf558767cf5961f3cb61746136c0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663AK6DYPY%2F20260117%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260117T061738Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIHsIAKDkV61%2F%2BwKEbO1lKFQPMlVmg9Dhea8K0I%2Bb%2B3nxAiEAx9SeRYKVJc58u%2Beh5fpJbVp%2BxQCKa8FQGh7BFHLkdYoq%2FwMIXhAAGgw2Mzc0MjMxODM4MDUiDPlOYranG6rB8Y5wfCrcA2bmSlB9lN%2B%2FQH8DOUzjoiIxpByFjOuixhBHqVPmNy%2BV9LAGXgfjLJuJVfgB1JqhOUWApAAA6yjI7mjylwyNx5xptz4vKt3%2BqjCZ%2Fz8GoKbnqblCwP8Mdwh3PBuep9BrKETIvpsIFVm0PqU%2FyeNvbockyaXGEPSxkPOccqhehzyLIpAOFja4WJGX2PfcuFTcJwTI%2FpXTdekShRpjbxM6fytYRpnZ3Vr5u%2FLUSQjzIR0IwKd94zrJrBOne7i%2BJ%2BZvauPeqtMfX4cPxnsvkM0V0qDzVCbfI9Ggr%2FXKedaa93ZxPV3rk%2FZxUDG5mLQnc%2FFdROnunt4kwyQRaeNdh1ygDI%2FcMrCm29NZfqtKAfDd9erLi5G35vUeCt7jXqTPAVNV9hUj%2BCuSqCIH%2F%2Fh93pbc4uz0XDhJy1kJTDz3nrDpc2rNjG9iUcBgfVU4TRvI1sNznJaE5k7pXN1o2oSRcHpirpxiovfRyh4BJdKhUbfAfksuZkSqvu8BTOy4PP4qeR5YmjlkZRRZuc6HNygmKs4iPzKWWFGlFPbFsbunzpEwojQCSl8VjjQBqzQCL%2BJlY0LSEfdiaH25OuqmCaTWApii3%2BGeemoU3IozDkDGcWsmCwUZ3k30KJThYML4CN%2FrMMO6rMsGOqUBmDya%2BUFHh3m7%2FhokdbIAYxVm9f4AEzzUkLgoURtsezgDPWrymhJSGVblzH%2FJZo7%2B7trsL9VYxcD5z9Z0YBoStINWbBMvk4YJv5OJN2soNmgQwo6zji67Ik5wn2gKPIu6mPDqGDXlKdLSjU42HM3yN%2B5c%2BQ%2FzFMMC3GjrFwZHDPjprCFnF4O5RsXXCZlc6czKOyVsIi0%2FMKU7Zc6Z4SSmmsVc3W9K&X-Amz-Signature=9585538a6e48683012876ce4e74f4ec87d938ba6c86b874f2a3839688fcafa08&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
