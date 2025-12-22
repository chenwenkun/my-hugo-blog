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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RV22ZYRN%2F20251222%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251222T122406Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEC0aCXVzLXdlc3QtMiJHMEUCIQCIDQhwl%2Bgy0rLtuuY7hDnZcEeN31Cmyopu4sZvzuoSZQIgFXf1kf8ecG9r%2FuZsI7jisMDqsou%2BwsOyw4izWQrvpCAqiAQI9f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDMlztGdBkHZQckwXFircA8q6Q7S9lutFBQ4SaCfkGEoNwbB2SFpC1xWmuc0lG9O%2FFOiuatc17cvfzItGgIVDZ7iayaRIhM4JfXMvzj2TAAODiSo3M0laV1qRGePjbMR9JSmd81Z1fc2D%2BWzy8sQYdS09XkvYfXFQbRbXS2v9F%2Fqv8JKK00jqThS0pY%2FJUQHR6KOvjYDkGqlFuGCe%2BdwUDZpuJsc0%2B6iGFDAZ1AAKS50XSoUvT47MWbPQ8cCwnmYQIAjg%2BF5cStg1tqqP9DDNQ3tcqUQR6MmFJA2m8RZ9FwIltVLhWBkfs%2F6uSQbTk5xqkCyXZ%2BL8wshrz9euiGcA7u%2BPBkbeETsf1KK42xKaDhnf1kq3M%2Bj0KWjquARx3BQPGN%2BXLmXrphcFnLJVW95MXIpX%2B8v%2FaYPadEgMyF%2Flw5aiDzo5T5vp88eh7L66qNoznF0i%2FcXzBZB9fLUDle2PX2MNMifkqu5GxjnZGG7T%2BZ3SwCceRAsNvJ8Jwe9bLiOJuqFfloOqM7RnymuvBcdnTYBdL%2BCq%2Bn76yLbziLbHMe%2BHGUvVcAz8Gk567WXpXEhMv8ySCBhBrMxdRwB1G8ataTde7Gnme8d9gTc8M2CAQYCAKG0kaFwcPgDmzBvazv6TPDU1LmpK%2Fw%2FeOhWCMM%2FvpMoGOqUBJ5kRhy23XhVFnujkZuniDag2NY28F6JprDeQ1V9M0tOaEgwdmN7dmwKwnyldk7qQKeK75B2Nq5CbmeRE1bL9z2tCyY%2FSNrBskuAiXhAolcmhnk1fk3sHuupE4cRTRr0Czh8%2BPh%2BYpAnnZCL4DbtSpFnM%2Bp7XchDk81c%2Bihvw0gKcBoAfh6AYzLu6gGw5PI0glS5UEl3mfnl2BJqQYCKK0MZE%2Byg7&X-Amz-Signature=40d98688b00969533993d5f4c8101501b0cf4ec482ba6327bb68a53e45f76f2a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RV22ZYRN%2F20251222%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251222T122406Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEC0aCXVzLXdlc3QtMiJHMEUCIQCIDQhwl%2Bgy0rLtuuY7hDnZcEeN31Cmyopu4sZvzuoSZQIgFXf1kf8ecG9r%2FuZsI7jisMDqsou%2BwsOyw4izWQrvpCAqiAQI9f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDMlztGdBkHZQckwXFircA8q6Q7S9lutFBQ4SaCfkGEoNwbB2SFpC1xWmuc0lG9O%2FFOiuatc17cvfzItGgIVDZ7iayaRIhM4JfXMvzj2TAAODiSo3M0laV1qRGePjbMR9JSmd81Z1fc2D%2BWzy8sQYdS09XkvYfXFQbRbXS2v9F%2Fqv8JKK00jqThS0pY%2FJUQHR6KOvjYDkGqlFuGCe%2BdwUDZpuJsc0%2B6iGFDAZ1AAKS50XSoUvT47MWbPQ8cCwnmYQIAjg%2BF5cStg1tqqP9DDNQ3tcqUQR6MmFJA2m8RZ9FwIltVLhWBkfs%2F6uSQbTk5xqkCyXZ%2BL8wshrz9euiGcA7u%2BPBkbeETsf1KK42xKaDhnf1kq3M%2Bj0KWjquARx3BQPGN%2BXLmXrphcFnLJVW95MXIpX%2B8v%2FaYPadEgMyF%2Flw5aiDzo5T5vp88eh7L66qNoznF0i%2FcXzBZB9fLUDle2PX2MNMifkqu5GxjnZGG7T%2BZ3SwCceRAsNvJ8Jwe9bLiOJuqFfloOqM7RnymuvBcdnTYBdL%2BCq%2Bn76yLbziLbHMe%2BHGUvVcAz8Gk567WXpXEhMv8ySCBhBrMxdRwB1G8ataTde7Gnme8d9gTc8M2CAQYCAKG0kaFwcPgDmzBvazv6TPDU1LmpK%2Fw%2FeOhWCMM%2FvpMoGOqUBJ5kRhy23XhVFnujkZuniDag2NY28F6JprDeQ1V9M0tOaEgwdmN7dmwKwnyldk7qQKeK75B2Nq5CbmeRE1bL9z2tCyY%2FSNrBskuAiXhAolcmhnk1fk3sHuupE4cRTRr0Czh8%2BPh%2BYpAnnZCL4DbtSpFnM%2Bp7XchDk81c%2Bihvw0gKcBoAfh6AYzLu6gGw5PI0glS5UEl3mfnl2BJqQYCKK0MZE%2Byg7&X-Amz-Signature=244473b0c992f575e1525f776258e9d835afe932e9d9a9c8e433f13cfec45e16&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
