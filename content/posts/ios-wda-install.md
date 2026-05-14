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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665H3DO2LV%2F20260514%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260514T192616Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIHLW02Zjn3%2FYwLAtrjX8%2BtxwjP6n14sFhTl9dDhABSHeAiEAjmwqHEvlTU8ziCzEha2np3KcsJ8Jyt4yIxtcPFIbLCYq%2FwMIYxAAGgw2Mzc0MjMxODM4MDUiDJyThwyUfstHy5aWwSrcA46QTTHhqY7Ld4ZQd0lx%2ByyM3c8Uyuz70uX7XvFw1%2F96OIOUleeSmD6gkCd%2Blnt02DCkqEIl4YoI9tEG%2FL0DkwmpPUKA1ckLgt2V1UZAejB5A9pZiUFe5N9i15FTp6jwvbecU%2FIgoCzdNZEgJZOndnlRe5bDHf44Y783O%2FyUEKP91YGNA%2Foz9%2Fx9mBqtSyhl8YoPs8gomk1fogxuuCGloeV4dSvWcpKdvbi79jsbRdCorKfbju%2FCyifwOYwT5mLMKYv5Wv8uAZpyD8lmyJo8DluTC5%2FVjDEMLHveXI20H3dk%2B5UtLCAXq5bYCmz1X1RiBdnbMyHYJVBSYib3VZOecfHJZ99crv8hrryEPofR3fEqp8GUZosQ0hjhbfTPwb6AYPWDYOXjOtEDG7YeZBEZ0hVn4MEL%2F%2F9uL4nMeYXizm7RYJ%2FS1oQgoG%2BgMbyFXuy0fIckqt7Zipn%2FEbFO1%2FzrHI7p7nwcmCp2CMmPgU3MrsPcAIeek7iJfYH2BxHkeStrU2eSEg2ozbAMZJqy%2BptrR%2Bw2jnZu4EheyCXXARZ7H%2FZ57NEc7qRGLxkQrsHxX7Zh6nhY9pTDs5AGVFsR%2B15yRZcGzdBTJfwU56mEuRNhWSo2b9lj7Bdo6vd39h5%2BMNePmNAGOqUBb7VOkKgc%2BD7L2oftZ4d1%2FG%2FZUqxKaLwyZhLO4m9prWbNQ%2FaUW4siMvPOEhULuICFkYFjTjKgSyOlog%2Fp4%2B5t3oknbFQ9WRxL1%2BeELmEjvDG6pjnwdA%2BXPKEcUVg8ddIZqNAyXvcWVlKuy6r1lecMzIYi3JdAc5TVJbdxAvkZ7niESLVEqP7GZxsVG8hpP%2Bm2tXVVcgOkmdTYXkXR1OLb50VoMuND&X-Amz-Signature=8a271b3ef7b3a0e74b1bc7dc3aee7166ed3f67709cf72e97b251d0f476210b21&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665H3DO2LV%2F20260514%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260514T192616Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIHLW02Zjn3%2FYwLAtrjX8%2BtxwjP6n14sFhTl9dDhABSHeAiEAjmwqHEvlTU8ziCzEha2np3KcsJ8Jyt4yIxtcPFIbLCYq%2FwMIYxAAGgw2Mzc0MjMxODM4MDUiDJyThwyUfstHy5aWwSrcA46QTTHhqY7Ld4ZQd0lx%2ByyM3c8Uyuz70uX7XvFw1%2F96OIOUleeSmD6gkCd%2Blnt02DCkqEIl4YoI9tEG%2FL0DkwmpPUKA1ckLgt2V1UZAejB5A9pZiUFe5N9i15FTp6jwvbecU%2FIgoCzdNZEgJZOndnlRe5bDHf44Y783O%2FyUEKP91YGNA%2Foz9%2Fx9mBqtSyhl8YoPs8gomk1fogxuuCGloeV4dSvWcpKdvbi79jsbRdCorKfbju%2FCyifwOYwT5mLMKYv5Wv8uAZpyD8lmyJo8DluTC5%2FVjDEMLHveXI20H3dk%2B5UtLCAXq5bYCmz1X1RiBdnbMyHYJVBSYib3VZOecfHJZ99crv8hrryEPofR3fEqp8GUZosQ0hjhbfTPwb6AYPWDYOXjOtEDG7YeZBEZ0hVn4MEL%2F%2F9uL4nMeYXizm7RYJ%2FS1oQgoG%2BgMbyFXuy0fIckqt7Zipn%2FEbFO1%2FzrHI7p7nwcmCp2CMmPgU3MrsPcAIeek7iJfYH2BxHkeStrU2eSEg2ozbAMZJqy%2BptrR%2Bw2jnZu4EheyCXXARZ7H%2FZ57NEc7qRGLxkQrsHxX7Zh6nhY9pTDs5AGVFsR%2B15yRZcGzdBTJfwU56mEuRNhWSo2b9lj7Bdo6vd39h5%2BMNePmNAGOqUBb7VOkKgc%2BD7L2oftZ4d1%2FG%2FZUqxKaLwyZhLO4m9prWbNQ%2FaUW4siMvPOEhULuICFkYFjTjKgSyOlog%2Fp4%2B5t3oknbFQ9WRxL1%2BeELmEjvDG6pjnwdA%2BXPKEcUVg8ddIZqNAyXvcWVlKuy6r1lecMzIYi3JdAc5TVJbdxAvkZ7niESLVEqP7GZxsVG8hpP%2Bm2tXVVcgOkmdTYXkXR1OLb50VoMuND&X-Amz-Signature=d620b3c334c1e34bc6be8244a6be43ad498dcf9968e7df4cf9c8ff2f52749be2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
