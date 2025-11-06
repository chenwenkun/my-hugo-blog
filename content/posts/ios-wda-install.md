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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663272SJVR%2F20251106%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251106T061743Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIHXmKr%2BQ3MjbeyLoUcD6dEEWPkInymDgf8coLUQEMaXJAiBuZtNkjCDXCr4yZOixB6iwlCs3V4aqtEnqhu5p98oS%2ByqIBAif%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMUPjrwMY5ZI1isEofKtwD53X94Vl4TOeDVmJMYxkDqS1Ixrw0KpKPTNTehCCgajFpjUtNgw1gtsn2UnDHjWzks5vl8Mky2cRnSTzjJt2FVkHoLz5GQcqfJR%2Bri5dNP2dEI5y64XbTpsd2%2BZB2nMndqCe5jRGcHtPLCjNwZEv93TJdkKnoQNxMcDpyQmQzKA70DcH5PLmga31zYuJ%2BKKI%2BJdMPhG1Lwp42UpGOUAvpncKDsu2Gm69MLSUUM35VO9sLeQY2ePXtb47f0%2FO7YmsNJ7rO0T30IU1zwEM8PzoXqMz3OotL%2BWxwgnFCT94fwnc1CEYFgatW6Ajl89bxHkW9SInrzuhRs4O95akSM4TcnPw3gZhHbM0NtMPAaT%2FctbGmq1hoJ217kJMy3%2FJeDjEU3B%2FeA7hmQjDJmnrBR7MToXVuJhH%2FztZ0v6bq2knNsszGy422qSbDVDafyboo8wf0yv2MZl8yz8kGt1NNUsLvWw5Hna0yaKWT26ekGWP%2BYvoDyU0jbQKm5cztrgf%2F3OXX%2B8d9izBKZsov9VN2n%2BhiP3Mzwx%2FRRX%2F%2FUaktuHM6nHTSdEWlMLPnjmQ7OJzceoSahTvNoULAuorynQNMOKuAvthljSTr9orpFabw7NEA21SlJhl%2BQLJzqyOGRGgwqe6wyAY6pgGX963AFu2l42qKzlr%2B4wX4%2FMQKEJvXXX5lHlPdZn3ROOelROgPIrEyY5YDKuczWZKv78MEhusIY6DGGLpjLIiVScIdNBqraYPUhFePPtDyiyNM7qfAPYBpFHyvAZdHl6HV0wptLPqc%2BC4Z0JPb1DhbgvO3vZujkOUHUuHUlJbgDhzQ5iOmEHFBuQFxwRgD8stg0EeAEYiTk5tFOeV6zMvOqSg3PjuW&X-Amz-Signature=0e923ec7e48d0413b6729c927235bd611a6ed4c4f3a28a62e46920422f47e9e8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663272SJVR%2F20251106%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251106T061743Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIHXmKr%2BQ3MjbeyLoUcD6dEEWPkInymDgf8coLUQEMaXJAiBuZtNkjCDXCr4yZOixB6iwlCs3V4aqtEnqhu5p98oS%2ByqIBAif%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMUPjrwMY5ZI1isEofKtwD53X94Vl4TOeDVmJMYxkDqS1Ixrw0KpKPTNTehCCgajFpjUtNgw1gtsn2UnDHjWzks5vl8Mky2cRnSTzjJt2FVkHoLz5GQcqfJR%2Bri5dNP2dEI5y64XbTpsd2%2BZB2nMndqCe5jRGcHtPLCjNwZEv93TJdkKnoQNxMcDpyQmQzKA70DcH5PLmga31zYuJ%2BKKI%2BJdMPhG1Lwp42UpGOUAvpncKDsu2Gm69MLSUUM35VO9sLeQY2ePXtb47f0%2FO7YmsNJ7rO0T30IU1zwEM8PzoXqMz3OotL%2BWxwgnFCT94fwnc1CEYFgatW6Ajl89bxHkW9SInrzuhRs4O95akSM4TcnPw3gZhHbM0NtMPAaT%2FctbGmq1hoJ217kJMy3%2FJeDjEU3B%2FeA7hmQjDJmnrBR7MToXVuJhH%2FztZ0v6bq2knNsszGy422qSbDVDafyboo8wf0yv2MZl8yz8kGt1NNUsLvWw5Hna0yaKWT26ekGWP%2BYvoDyU0jbQKm5cztrgf%2F3OXX%2B8d9izBKZsov9VN2n%2BhiP3Mzwx%2FRRX%2F%2FUaktuHM6nHTSdEWlMLPnjmQ7OJzceoSahTvNoULAuorynQNMOKuAvthljSTr9orpFabw7NEA21SlJhl%2BQLJzqyOGRGgwqe6wyAY6pgGX963AFu2l42qKzlr%2B4wX4%2FMQKEJvXXX5lHlPdZn3ROOelROgPIrEyY5YDKuczWZKv78MEhusIY6DGGLpjLIiVScIdNBqraYPUhFePPtDyiyNM7qfAPYBpFHyvAZdHl6HV0wptLPqc%2BC4Z0JPb1DhbgvO3vZujkOUHUuHUlJbgDhzQ5iOmEHFBuQFxwRgD8stg0EeAEYiTk5tFOeV6zMvOqSg3PjuW&X-Amz-Signature=b959f1e3221dcd7fe89e5f77a0bfbbaecf4caa47731e543035446bd03d30a022&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
