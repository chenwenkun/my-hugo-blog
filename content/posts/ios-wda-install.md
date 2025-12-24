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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VRQ7MI23%2F20251224%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251224T181723Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEF4aCXVzLXdlc3QtMiJHMEUCIAnFiLMNVyhWo6sQF5MryyutNTHqgZJyYZI02Ogtet0IAiEAyMQsT5iihmER%2BWAVolsP%2BBqtJFhwMe4UXODXIc5sIXUq%2FwMIJxAAGgw2Mzc0MjMxODM4MDUiDAn4Rftdy3uSdnY7kyrcA9sHYUbwceSsDWtH3%2BPW9Wp9rXPN7KLoseD%2FI2Sqo9%2FFf%2B2zhlXL%2BdsvJG7H2F9JzWvktrG419N%2F0qjxq7D5tOuBiyJX3WIhchD0o%2FESU50ox43iazS0G0zZx7poe7DbIIo1sZEA8gsqd76ylEHDXBw3KGEbPqPbzHJSnk9wU8OUCBRAFDUE3DQqS2bvWD5pxP1VK8b2pOeNiwiv6%2Fv3%2FESewBI40%2FPusCsZzYUqcWrOH3PDMHBNmc626T8YjuFrJ4JZYaqSsS6cv0p42Dm5PfKZqqZNICVvrsi7odqy9gUkl39yFDAYAK3lDATqkIlBx2l6bd6b539wxAVcDU3D05rGMiPdqN6mJg24dajoLz%2FeLVXAch%2Fh3BLUIvyQKsUV0cH3Wjmb7utg4M%2FHdM8GXORaDcmPm7YWViz06ygmIrwSSnPNwW%2BPG9FJL%2FNGRtHFXY2%2BBrQMpIxGwve%2BUhZfQd3EbyVrldEK3bkHR4pMvU2cANs1kEVQVdU8XbACmc%2F7BKxUZNqZERufaJMCO6UFcX%2F181rck9AauuOgwmCvMGe%2FUJVy%2FysaFEzXw9mkxcV4VfdBMytnjJDsuctOhvKlU2yU4hKe7iS3I2vgW189CetY7zLsJJy%2F61d9V3w3MKngr8oGOqUBMsp87qrJ9W8iquRv3%2BKQcdeALUmmCtm7gr0vg5ONGCaDhbUA13qiSEMyGxR8FnPa9RmlmhKhLzBAKl8d9BsLNkgSocvpW7L3aEPmSG774ZgHAkmZ8AJuvX1LDiRIgMHjiYAyf1qt%2B1rB1TarhNt5nK1N1DFAsJThM%2FLc3xQSdXpbiCcvC31pyNOl%2BjTKrKPrK%2Bu%2BU6oC6yJbJkIDcgDtkRaQD3DL&X-Amz-Signature=fb6e4676fd386ac70a89ce61bd5087f0878adce1364b22878fbb914873afbf53&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VRQ7MI23%2F20251224%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251224T181723Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEF4aCXVzLXdlc3QtMiJHMEUCIAnFiLMNVyhWo6sQF5MryyutNTHqgZJyYZI02Ogtet0IAiEAyMQsT5iihmER%2BWAVolsP%2BBqtJFhwMe4UXODXIc5sIXUq%2FwMIJxAAGgw2Mzc0MjMxODM4MDUiDAn4Rftdy3uSdnY7kyrcA9sHYUbwceSsDWtH3%2BPW9Wp9rXPN7KLoseD%2FI2Sqo9%2FFf%2B2zhlXL%2BdsvJG7H2F9JzWvktrG419N%2F0qjxq7D5tOuBiyJX3WIhchD0o%2FESU50ox43iazS0G0zZx7poe7DbIIo1sZEA8gsqd76ylEHDXBw3KGEbPqPbzHJSnk9wU8OUCBRAFDUE3DQqS2bvWD5pxP1VK8b2pOeNiwiv6%2Fv3%2FESewBI40%2FPusCsZzYUqcWrOH3PDMHBNmc626T8YjuFrJ4JZYaqSsS6cv0p42Dm5PfKZqqZNICVvrsi7odqy9gUkl39yFDAYAK3lDATqkIlBx2l6bd6b539wxAVcDU3D05rGMiPdqN6mJg24dajoLz%2FeLVXAch%2Fh3BLUIvyQKsUV0cH3Wjmb7utg4M%2FHdM8GXORaDcmPm7YWViz06ygmIrwSSnPNwW%2BPG9FJL%2FNGRtHFXY2%2BBrQMpIxGwve%2BUhZfQd3EbyVrldEK3bkHR4pMvU2cANs1kEVQVdU8XbACmc%2F7BKxUZNqZERufaJMCO6UFcX%2F181rck9AauuOgwmCvMGe%2FUJVy%2FysaFEzXw9mkxcV4VfdBMytnjJDsuctOhvKlU2yU4hKe7iS3I2vgW189CetY7zLsJJy%2F61d9V3w3MKngr8oGOqUBMsp87qrJ9W8iquRv3%2BKQcdeALUmmCtm7gr0vg5ONGCaDhbUA13qiSEMyGxR8FnPa9RmlmhKhLzBAKl8d9BsLNkgSocvpW7L3aEPmSG774ZgHAkmZ8AJuvX1LDiRIgMHjiYAyf1qt%2B1rB1TarhNt5nK1N1DFAsJThM%2FLc3xQSdXpbiCcvC31pyNOl%2BjTKrKPrK%2Bu%2BU6oC6yJbJkIDcgDtkRaQD3DL&X-Amz-Signature=f522b7b09112d77d2a8fe8aff368f5f7e781961fb8789abb623b72444f80e62f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
