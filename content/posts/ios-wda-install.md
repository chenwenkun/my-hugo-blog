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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZDK7CPXR%2F20260725%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260725T074909Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEE8aCXVzLXdlc3QtMiJGMEQCIExLYJPnAm3LFH363W6fcpp%2Bs62ZVRDz0Js3f6IBo3vfAiBVdnS84g%2BdEGmgnjB4h%2FlMc1eyMN8oIZwGfukUmQP6vir%2FAwgYEAAaDDYzNzQyMzE4MzgwNSIM8%2BQv55Fuaw28jeDKKtwDIOLGLQf5uAYY8UCirEF1DQyLDhu8%2FHMeIDB3g5wuRouei1U5fdqJ6HycWpXi8y5dipjhsQgGO0%2BjgWn%2Fr0kYOxWy44XgfO2%2Fs6K8fa2Gk%2FyB87q%2FAKaME3mugmce8h9hSeuk07xWCsCz9cnsbfgcuPI49Yv%2Fw2mAd5fZXuSYG5GadhRlveFBsW2Jj9XyLx5WtF52SDhfHnnbcKTL8jyepvzSTIkmOi%2Bge8vg17uLjKiZ5ZUsMWr0q43GcoZLB%2BL3XbsoDOgOT2cebUeAlSuDL%2BM8kIDmQvFe%2FGEPPJvfDqKuuSrzfg8TPTcO%2Fyay%2FefmYE8rnxDvceYMfsmrBRH3LQ69Haibmmb4qPyIqkDUlRyTEM4H9vZULaOmuKt%2BdvySbEB4CySHAbT4w4x0C0oEMXyD47ooUVgm5n7ks%2BKELJwskeAg%2Fdcg2ik%2BCgwB6jkBiFzG0eIkmVH%2F%2FWIi5L%2FB1q7ZheP%2FY8mHAARbWDvePVGOX9S103%2B8dEhRi4wLbu68HFwZV%2Bha77CHLF4VqwpG%2BLIj5iDZ5eWcJgvnIAOdx7%2Fyjsb6m8JXOd5iVU1zlktYPInUtCunEjRPPKLfga1LUj6xnJvZf0Ov3nDY%2FDqMH%2BNbSRVdDIugSyolOAkw%2FcWR0wY6pgGcf98BB9FcnGvJ2JIgy%2BC8Lj%2BTZyasQ1ecwqYs%2BMP7jK3CPK5NkiKzMeBQYoUZC4pzFz%2FIzD7tNnKnOLSzdXRkoHLARGJkBQ17NVjXE6tYTNC%2FzUTP49yH%2FTeWDk1Jy1M9eS0fv83%2B3ijoFMpshD9avewo4nFf89qYUDHLfkrJ814syA68ktnnbGEd1ar6eSGKwjwsWd1LDv%2F9BPy0mSwc4wKXbKwE&X-Amz-Signature=fa35c6db0857d88d780666f55b2998fb6c01e35079cbd95bf851a8bf87be7a3f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZDK7CPXR%2F20260725%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260725T074909Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEE8aCXVzLXdlc3QtMiJGMEQCIExLYJPnAm3LFH363W6fcpp%2Bs62ZVRDz0Js3f6IBo3vfAiBVdnS84g%2BdEGmgnjB4h%2FlMc1eyMN8oIZwGfukUmQP6vir%2FAwgYEAAaDDYzNzQyMzE4MzgwNSIM8%2BQv55Fuaw28jeDKKtwDIOLGLQf5uAYY8UCirEF1DQyLDhu8%2FHMeIDB3g5wuRouei1U5fdqJ6HycWpXi8y5dipjhsQgGO0%2BjgWn%2Fr0kYOxWy44XgfO2%2Fs6K8fa2Gk%2FyB87q%2FAKaME3mugmce8h9hSeuk07xWCsCz9cnsbfgcuPI49Yv%2Fw2mAd5fZXuSYG5GadhRlveFBsW2Jj9XyLx5WtF52SDhfHnnbcKTL8jyepvzSTIkmOi%2Bge8vg17uLjKiZ5ZUsMWr0q43GcoZLB%2BL3XbsoDOgOT2cebUeAlSuDL%2BM8kIDmQvFe%2FGEPPJvfDqKuuSrzfg8TPTcO%2Fyay%2FefmYE8rnxDvceYMfsmrBRH3LQ69Haibmmb4qPyIqkDUlRyTEM4H9vZULaOmuKt%2BdvySbEB4CySHAbT4w4x0C0oEMXyD47ooUVgm5n7ks%2BKELJwskeAg%2Fdcg2ik%2BCgwB6jkBiFzG0eIkmVH%2F%2FWIi5L%2FB1q7ZheP%2FY8mHAARbWDvePVGOX9S103%2B8dEhRi4wLbu68HFwZV%2Bha77CHLF4VqwpG%2BLIj5iDZ5eWcJgvnIAOdx7%2Fyjsb6m8JXOd5iVU1zlktYPInUtCunEjRPPKLfga1LUj6xnJvZf0Ov3nDY%2FDqMH%2BNbSRVdDIugSyolOAkw%2FcWR0wY6pgGcf98BB9FcnGvJ2JIgy%2BC8Lj%2BTZyasQ1ecwqYs%2BMP7jK3CPK5NkiKzMeBQYoUZC4pzFz%2FIzD7tNnKnOLSzdXRkoHLARGJkBQ17NVjXE6tYTNC%2FzUTP49yH%2FTeWDk1Jy1M9eS0fv83%2B3ijoFMpshD9avewo4nFf89qYUDHLfkrJ814syA68ktnnbGEd1ar6eSGKwjwsWd1LDv%2F9BPy0mSwc4wKXbKwE&X-Amz-Signature=af1c2a857edcd472cd491fe6f1a55ee4a0b36dadcb50d87c94cd984907fccc51&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
