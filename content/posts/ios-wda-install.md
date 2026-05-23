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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QJNGROR4%2F20260523%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260523T125846Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGsaCXVzLXdlc3QtMiJIMEYCIQD4U8YVgeCHpoXBHKLoV96dVWOtK7cpWFkY2QP08z2YUgIhAKBNC5FCOeUyba8ErrXpifkPhO%2FLVHBdELzNGnXtSz53Kv8DCDQQABoMNjM3NDIzMTgzODA1IgyKtvVBLR5NAFmfhgcq3AMgqGJOkksu0qMgrBw5CoBylW4FsC3cxsXP3u3hzFdO7f7ceZMr0Zp%2BtM34nr%2FIeH9n7Z1tpfTYLa96vS6g5eH8jWYZkoxzvu1cOloZU844hLXvQd30v3jWR%2Bt8y%2FCxl7yU%2BvzSuc6TiyhBupFILm2DgJk7DDqaQzH8D4ppg8hfc8tcthmQJoM7an9HP5x4hOu0%2BSAY7KX%2FpMmOwfzof1DNePCej6iffuJttN2JxhgRYAL11BcogOq1VkqjLnV9XFarVfslOx7eO%2FV0hRaw27MzHN24u1vGnoEn%2BhN8AnLTihk7Amp5agPvbozzMUm3FjM84AeBExSxTFYzoeOL2UJ7e%2BLHVExzZpUOxc3HcKcdFYwsBegNr0At%2B%2FD69Tjm%2FT14YlG%2B8CmUtynj%2FHWR%2Fi3tWaiIhc4sAjcA5aRx75P1T9bQ%2FTjC%2F%2FqurVNyGtbDknNI7gFhrLhnn587uB4ltuowGpYEgzwWKe12j2mM1sj6UYDmJem5HyzKTIR48tu1GyKiVhdk2vFvvvpfKgb%2FdTlwzCvWKbWmg8mCD%2Fs4qgXGaaVG4AYi8%2BzSfz6LnAyjhg2EPQcYSqWw3tyzjeaDkyVGVzA5ylxC%2BT87QPSP%2B33gxV9rgLAJpKSBaQNqDjCbkcbQBjqkAawvtArdHFExbpcovPcbeuPd4DVyNDY1l3zW71vIpLW%2BAuTgxPeApRyGNVlGybkZN1LMyv%2Bz%2BqDWnlYVp5oALIFj5Dlsic6L1DVVOclGAnm6KWYwVYChxcqzl4oxQN4T281hzaCNnMnyMiFM5yhNoCKMhzJYBcGXPI81qp0QkBN9l9vpVSd02ui3fLhxH5gGvQ9J8qR6%2FU4P2%2BVfuTKXeUL2q9HG&X-Amz-Signature=ea64b909168af68ba1bb37fa12c7d718e4d44f251a5f0efdf6af39901b758318&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QJNGROR4%2F20260523%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260523T125846Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGsaCXVzLXdlc3QtMiJIMEYCIQD4U8YVgeCHpoXBHKLoV96dVWOtK7cpWFkY2QP08z2YUgIhAKBNC5FCOeUyba8ErrXpifkPhO%2FLVHBdELzNGnXtSz53Kv8DCDQQABoMNjM3NDIzMTgzODA1IgyKtvVBLR5NAFmfhgcq3AMgqGJOkksu0qMgrBw5CoBylW4FsC3cxsXP3u3hzFdO7f7ceZMr0Zp%2BtM34nr%2FIeH9n7Z1tpfTYLa96vS6g5eH8jWYZkoxzvu1cOloZU844hLXvQd30v3jWR%2Bt8y%2FCxl7yU%2BvzSuc6TiyhBupFILm2DgJk7DDqaQzH8D4ppg8hfc8tcthmQJoM7an9HP5x4hOu0%2BSAY7KX%2FpMmOwfzof1DNePCej6iffuJttN2JxhgRYAL11BcogOq1VkqjLnV9XFarVfslOx7eO%2FV0hRaw27MzHN24u1vGnoEn%2BhN8AnLTihk7Amp5agPvbozzMUm3FjM84AeBExSxTFYzoeOL2UJ7e%2BLHVExzZpUOxc3HcKcdFYwsBegNr0At%2B%2FD69Tjm%2FT14YlG%2B8CmUtynj%2FHWR%2Fi3tWaiIhc4sAjcA5aRx75P1T9bQ%2FTjC%2F%2FqurVNyGtbDknNI7gFhrLhnn587uB4ltuowGpYEgzwWKe12j2mM1sj6UYDmJem5HyzKTIR48tu1GyKiVhdk2vFvvvpfKgb%2FdTlwzCvWKbWmg8mCD%2Fs4qgXGaaVG4AYi8%2BzSfz6LnAyjhg2EPQcYSqWw3tyzjeaDkyVGVzA5ylxC%2BT87QPSP%2B33gxV9rgLAJpKSBaQNqDjCbkcbQBjqkAawvtArdHFExbpcovPcbeuPd4DVyNDY1l3zW71vIpLW%2BAuTgxPeApRyGNVlGybkZN1LMyv%2Bz%2BqDWnlYVp5oALIFj5Dlsic6L1DVVOclGAnm6KWYwVYChxcqzl4oxQN4T281hzaCNnMnyMiFM5yhNoCKMhzJYBcGXPI81qp0QkBN9l9vpVSd02ui3fLhxH5gGvQ9J8qR6%2FU4P2%2BVfuTKXeUL2q9HG&X-Amz-Signature=0165a5e7422dab79d83d16bfe187c890dc5c84064b9d3352350b33fd01bf0635&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
