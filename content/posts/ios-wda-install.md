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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VLSAPJKQ%2F20260311%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260311T184025Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDcvk0rnl%2BAejlHPTY%2FOxSG94D%2BtvT5ZVO4QF%2Bw95E1%2FAIhAP6cbj5q2dZoopPacFkAJbIZ95ZyrQddrrxYNx2IcaaGKv8DCGEQABoMNjM3NDIzMTgzODA1IgzcM9WUecdLGgOUTDcq3AMyQscweY0NDGo%2B%2B43ReagenxUgjyZ14aN%2Fo7Y9hhukPIOB0evhDwKpJ60e2lIlU5xaQIlcz%2F8ZVNtXhIdWQ7mmAMZYwLdA4jdFJym9W9P696D8gXRWxmUSxzIyLhWQBh0ZLzqMx5cEAf5gnexwyeoEb%2FYD5A06KEoMYnkxDGDXV2rqZmZocbMck6Ik8M%2FrHyrkTfD98SpqfEPyVCSSgJST2dEbqArec4%2BTza8D1Q8eSkYiTq978O2lKcHf%2FgpMS4gQLHurfiDU%2FPc4ywH%2BWaB2CU3NPT%2BhTciyaYVjHCwreX8Ty9cfWtT29IxcnhAHg3%2FenXzlPS7EGgjYMVEGx9M%2FVhjTbTj9%2BhvVk9lbPx5PIIF5gddWNAwWYOkw3eHqpkKWPWUjAD7fNUF3UsO4FTycRnDHBGtR6ixlZFOJghUGDPaanISYgxeOEY%2BtgNlEBd4ptxQDk7cH6jzWzmNSSH21GJvEbfu8ab69kkhT3EvJgT%2Bsk1tHERqE%2F7aqCYdQI8CqErp%2BuKpx2j79RdJc4AOE2GFRqx3KQAFeFM8WMIrKHG%2FGArTS9VbhaNDBXOOAkPVH64lHoCw3G1PCJB9BkqkUaJgG8HJVJMS2THuLM1x6dsjCZN%2FsG8ZUwBfjUTCwl8bNBjqkAZyl9JvcZYG3RKRwWZJvCA%2FBjWZWFIAiPFOEVu1Bgu3tpSUfzHNcHGIeUDRYAlFYB38PM7sEoTB%2FVDseMPcGnmP4bGkbSSpt7zYa%2Bqg9Nq13BzpZdoyod8MsGCr7MONGfPszMVKPKEG4JvmsdzTiC98HnPdCn%2BKb5A8qPKZ4OPYKv7FSykXRYReytXVWiQeRMjF7o6C0cAoaUUkSZwmYrwNCcUrU&X-Amz-Signature=26e0ba2d405b2fca36dd72dbecc0983fa418816f3c329689e32f337622152722&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VLSAPJKQ%2F20260311%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260311T184025Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDcvk0rnl%2BAejlHPTY%2FOxSG94D%2BtvT5ZVO4QF%2Bw95E1%2FAIhAP6cbj5q2dZoopPacFkAJbIZ95ZyrQddrrxYNx2IcaaGKv8DCGEQABoMNjM3NDIzMTgzODA1IgzcM9WUecdLGgOUTDcq3AMyQscweY0NDGo%2B%2B43ReagenxUgjyZ14aN%2Fo7Y9hhukPIOB0evhDwKpJ60e2lIlU5xaQIlcz%2F8ZVNtXhIdWQ7mmAMZYwLdA4jdFJym9W9P696D8gXRWxmUSxzIyLhWQBh0ZLzqMx5cEAf5gnexwyeoEb%2FYD5A06KEoMYnkxDGDXV2rqZmZocbMck6Ik8M%2FrHyrkTfD98SpqfEPyVCSSgJST2dEbqArec4%2BTza8D1Q8eSkYiTq978O2lKcHf%2FgpMS4gQLHurfiDU%2FPc4ywH%2BWaB2CU3NPT%2BhTciyaYVjHCwreX8Ty9cfWtT29IxcnhAHg3%2FenXzlPS7EGgjYMVEGx9M%2FVhjTbTj9%2BhvVk9lbPx5PIIF5gddWNAwWYOkw3eHqpkKWPWUjAD7fNUF3UsO4FTycRnDHBGtR6ixlZFOJghUGDPaanISYgxeOEY%2BtgNlEBd4ptxQDk7cH6jzWzmNSSH21GJvEbfu8ab69kkhT3EvJgT%2Bsk1tHERqE%2F7aqCYdQI8CqErp%2BuKpx2j79RdJc4AOE2GFRqx3KQAFeFM8WMIrKHG%2FGArTS9VbhaNDBXOOAkPVH64lHoCw3G1PCJB9BkqkUaJgG8HJVJMS2THuLM1x6dsjCZN%2FsG8ZUwBfjUTCwl8bNBjqkAZyl9JvcZYG3RKRwWZJvCA%2FBjWZWFIAiPFOEVu1Bgu3tpSUfzHNcHGIeUDRYAlFYB38PM7sEoTB%2FVDseMPcGnmP4bGkbSSpt7zYa%2Bqg9Nq13BzpZdoyod8MsGCr7MONGfPszMVKPKEG4JvmsdzTiC98HnPdCn%2BKb5A8qPKZ4OPYKv7FSykXRYReytXVWiQeRMjF7o6C0cAoaUUkSZwmYrwNCcUrU&X-Amz-Signature=cee29e8fe4cc4d95f4d9fa4c158055e25f305a4e56138b787dc8aa45e31c9435&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
