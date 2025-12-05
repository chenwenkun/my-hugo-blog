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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QQEO7MBT%2F20251205%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251205T005526Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIGOCQNpVR%2BggfGhETePXHbL0aiMuf7hsgttkDRSgJP4EAiB3ouH5s29e6j848rZSGb2q5wh65NyrElBNXFX63cQCOir%2FAwhPEAAaDDYzNzQyMzE4MzgwNSIMhUtxHEaMvZ6g0P9eKtwDSsA0nEeZjHQKgumGUuW76edsN7AnuwPq4sHNtnqnh3HMWX8Sxh9h%2BoKgSiRhVx6mtsm0rjogFGZVC9JFwXYwkRh8LJ2lETIFkBRUZOKe3Gs4QEH%2F%2FgsSfPTyw6AasGpv7A4IZ5jznGg1kG0XwpvUzjT07xbeYJbsNzqT4lYaAbcCIWmdW%2BTGKTxpYIyS2peSkGGWvkUqmSv1EhXcsj1DvbqaMkZ0ZC1kt5EB0Ne75aN%2B%2BXEp%2FozyAWRZBsNgvKQnmy6y3TNczA97j6kbAroXVuHSVG%2BH406kGgOXk8txcgL4bZxq39TWb5PAwG1cqcoGsRUisDaGhm9VdOemuBXt8IrolZ27c4iRNOyeDmQ6Y40tRYkMzHRvAZeMH86K%2FRsEy0EIKQTwO8E8ICpauRUMNXlvtns6VtdxlM73oTyvWVLFDglFh0vEpbT780L%2BEMLbps4n99vDJjb%2Bjltg9acwUhgDXgDM4rQ7mhpDj%2FtrD3z6hZHF1hRfbSORayIta7c5N8F0tYt8BLFAAsHKU5iEZLu3symE2iV6ByCga8qh2lKmdTCRZPMVNYOJfuMzV2Neoe81jDELId7mmbZ8Phk7ZLCnHGPaKgVKMRm1bI5vTPN3D13rclqzJ%2BITzqIwvYzIyQY6pgHNe5d6iqn9m0l%2FOF0NZkeB8ptC6ExuA5v7giKqNoBtV%2BZs5caH%2FH3hyLAzg9gmWu0qUT5VthUPMdxzb5QGMBJdz%2BQj4t7cSO82BTigmcenAME94BNfRbhgKb6Ne4tjjba%2FDaHVAGn%2FNacD1r3p2WEMW1JQVu9SEnsSlYv5Ct%2FLgnUXd1x%2FsYBD1CvYQwz2gVdyLjIZ%2FOhLwDe1%2FcLJKa7j5MxH3Uxf&X-Amz-Signature=ce7db7cbb205641f743bef9ae1d66a9f99a996029e09902ce5e7771d715b7aaf&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QQEO7MBT%2F20251205%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251205T005526Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIGOCQNpVR%2BggfGhETePXHbL0aiMuf7hsgttkDRSgJP4EAiB3ouH5s29e6j848rZSGb2q5wh65NyrElBNXFX63cQCOir%2FAwhPEAAaDDYzNzQyMzE4MzgwNSIMhUtxHEaMvZ6g0P9eKtwDSsA0nEeZjHQKgumGUuW76edsN7AnuwPq4sHNtnqnh3HMWX8Sxh9h%2BoKgSiRhVx6mtsm0rjogFGZVC9JFwXYwkRh8LJ2lETIFkBRUZOKe3Gs4QEH%2F%2FgsSfPTyw6AasGpv7A4IZ5jznGg1kG0XwpvUzjT07xbeYJbsNzqT4lYaAbcCIWmdW%2BTGKTxpYIyS2peSkGGWvkUqmSv1EhXcsj1DvbqaMkZ0ZC1kt5EB0Ne75aN%2B%2BXEp%2FozyAWRZBsNgvKQnmy6y3TNczA97j6kbAroXVuHSVG%2BH406kGgOXk8txcgL4bZxq39TWb5PAwG1cqcoGsRUisDaGhm9VdOemuBXt8IrolZ27c4iRNOyeDmQ6Y40tRYkMzHRvAZeMH86K%2FRsEy0EIKQTwO8E8ICpauRUMNXlvtns6VtdxlM73oTyvWVLFDglFh0vEpbT780L%2BEMLbps4n99vDJjb%2Bjltg9acwUhgDXgDM4rQ7mhpDj%2FtrD3z6hZHF1hRfbSORayIta7c5N8F0tYt8BLFAAsHKU5iEZLu3symE2iV6ByCga8qh2lKmdTCRZPMVNYOJfuMzV2Neoe81jDELId7mmbZ8Phk7ZLCnHGPaKgVKMRm1bI5vTPN3D13rclqzJ%2BITzqIwvYzIyQY6pgHNe5d6iqn9m0l%2FOF0NZkeB8ptC6ExuA5v7giKqNoBtV%2BZs5caH%2FH3hyLAzg9gmWu0qUT5VthUPMdxzb5QGMBJdz%2BQj4t7cSO82BTigmcenAME94BNfRbhgKb6Ne4tjjba%2FDaHVAGn%2FNacD1r3p2WEMW1JQVu9SEnsSlYv5Ct%2FLgnUXd1x%2FsYBD1CvYQwz2gVdyLjIZ%2FOhLwDe1%2FcLJKa7j5MxH3Uxf&X-Amz-Signature=14bf6e7935d30e0b15ec91a039277e2a062bc9c3460175c471cab508b569945c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
