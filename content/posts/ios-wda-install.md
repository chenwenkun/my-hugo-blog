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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WNMI2YGP%2F20260427%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260427T190255Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAMaCXVzLXdlc3QtMiJIMEYCIQCFGXJKXgvkXzJbsB0%2Bx9N2ounCkmb3HYFqyfhiqytIYAIhAODA4RTtz%2BsiEUl4SlDGpI%2FIIp0CE46u3hmZ6n4CQT5dKogECMv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxvfJG7BhmIloy2Ppoq3AMlctjKiRDv0F5SGFP8xRdnx%2ByIzm9%2FkDtYJ3TCIWgg5E5P8YIH2magLXpbUzJbTCLa0I13BXG0IrmBWhl%2Bg64oig3JrVlrLa23Vm02b2k6258IRLOBOLdg7RyEWVIz2FvmA0fjhDJdgK%2FUQRzE2%2B4PGtdJD%2B91MpAAv7jLD5P6czdog0Jf2JdMfJrU4r9%2FGU2FFaUhGCsdtUhGCoBtHLNgnGtxT8Pbt3Cz2wFBOL23tM7UF2A5XMj6ik7DeVuRc4hjL7llu4VApc16lx0yMcnuJBMZxZP5xobxvSDVdYDHmszdjyKcLHuGB%2Fkxc7WgFqOcMc7jEobghz1G4IjlJoMaAxQqz1pZa2ae7tAgEumow16AiH3i8LlT00J5IkQz%2FqXTjvWq%2BDMd2qG0GDYvgLW6HTdtNO8X9r7tbiSJvfBe87QKizE9L%2FVZh%2FDLiuMOogef2JIyz3kIt6DGLdSI4%2B8ailTYzsJeITa6bBtHIFtwC2VmP%2FU%2F%2FkU3xJzuwttkjesdd0Kn7Pw%2Bdb1L6uUHTkbUejAFNTagOEZoZ2%2FQ9X3fEivZeub6F4g50B0JG9bGDqFZKHHgZJZOSHKZ7yt6SpZBMbXZVr6Xks5VOpIdabFKatDHWB7yVi8MNKwWzzD30r7PBjqkAXVLF6ZippWpfnhQxT62MjI%2BA2k73lRoTTxvcHmdpvo1%2FSSYi1XKIPNGRfY7uVYGZKm4Bj4LtDZthwwkrV%2BIn73fgGe71roVXnvwURm0S7hk0T29jVujBmAPTvCUuS0gi55eNeEOOBomckiKeMuXB%2FGrhEKKG9zOLwu86aP6QB8w7Eniaqe3Q8%2BhHlWPvm6qcdu6vK61ID77X65rSkBlGI87zSsJ&X-Amz-Signature=1ff042ef0a8b0a1b8c6808d1569c3e13dd68bda96df5bdf77cd15554bb8476bb&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WNMI2YGP%2F20260427%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260427T190255Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAMaCXVzLXdlc3QtMiJIMEYCIQCFGXJKXgvkXzJbsB0%2Bx9N2ounCkmb3HYFqyfhiqytIYAIhAODA4RTtz%2BsiEUl4SlDGpI%2FIIp0CE46u3hmZ6n4CQT5dKogECMv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxvfJG7BhmIloy2Ppoq3AMlctjKiRDv0F5SGFP8xRdnx%2ByIzm9%2FkDtYJ3TCIWgg5E5P8YIH2magLXpbUzJbTCLa0I13BXG0IrmBWhl%2Bg64oig3JrVlrLa23Vm02b2k6258IRLOBOLdg7RyEWVIz2FvmA0fjhDJdgK%2FUQRzE2%2B4PGtdJD%2B91MpAAv7jLD5P6czdog0Jf2JdMfJrU4r9%2FGU2FFaUhGCsdtUhGCoBtHLNgnGtxT8Pbt3Cz2wFBOL23tM7UF2A5XMj6ik7DeVuRc4hjL7llu4VApc16lx0yMcnuJBMZxZP5xobxvSDVdYDHmszdjyKcLHuGB%2Fkxc7WgFqOcMc7jEobghz1G4IjlJoMaAxQqz1pZa2ae7tAgEumow16AiH3i8LlT00J5IkQz%2FqXTjvWq%2BDMd2qG0GDYvgLW6HTdtNO8X9r7tbiSJvfBe87QKizE9L%2FVZh%2FDLiuMOogef2JIyz3kIt6DGLdSI4%2B8ailTYzsJeITa6bBtHIFtwC2VmP%2FU%2F%2FkU3xJzuwttkjesdd0Kn7Pw%2Bdb1L6uUHTkbUejAFNTagOEZoZ2%2FQ9X3fEivZeub6F4g50B0JG9bGDqFZKHHgZJZOSHKZ7yt6SpZBMbXZVr6Xks5VOpIdabFKatDHWB7yVi8MNKwWzzD30r7PBjqkAXVLF6ZippWpfnhQxT62MjI%2BA2k73lRoTTxvcHmdpvo1%2FSSYi1XKIPNGRfY7uVYGZKm4Bj4LtDZthwwkrV%2BIn73fgGe71roVXnvwURm0S7hk0T29jVujBmAPTvCUuS0gi55eNeEOOBomckiKeMuXB%2FGrhEKKG9zOLwu86aP6QB8w7Eniaqe3Q8%2BhHlWPvm6qcdu6vK61ID77X65rSkBlGI87zSsJ&X-Amz-Signature=b90ccdc23fab25e850239ede803f66dd9a4a5441a893d5f4f833f01212eb203c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
