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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZT2NJQLE%2F20260218%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260218T123710Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCdzn0k0OPsyLJmkvR1I%2FmYmd2uwnU9w7o1pdVAYh2xIwIgEO6Lus7DImLGRFaij51PrTYKf633V1R0%2FVaGVIUhMq0q%2FwMIZRAAGgw2Mzc0MjMxODM4MDUiDA1ZxGPMWRTc56E8BSrcAwtOA1x1lUC7TuVZjYRxqvSIPWJvZ0QcZsE%2BQsTe6hMoviddzQd6SJkj93ruMBpVQAzQ%2FNY93oeY5v2XXOfH1GynMAAOgvpVikNzWWB16OkjbtO2oC4ru2ecZnfYrxTzPH4aUWW3kzcGH2orL9eawy7cq%2Br8l0JjrRujZS0HJmbD0cTo7UHD3wp01FbkOOiO7554eExkboB4U%2FwdsXPpX3xwPNXgfZ5D4QawcBnp6zri4LXn1RSNRIv1R4Ojf8DfkMPcXfLTZScPUabt6WOOmbEMV0JyZOnzFuWtanulZJWC32x%2F4en%2Fj92QwKKadO1WJ6MsaB%2F1iTbNM8YNHnr5tReOVC1jBDyfKJbuYdqAPmSDj8iZ9SEP8zCWkMUPT4vYr%2BcCY8CRTjLADatmBG0uyO1mXSzX1K8sINBM0m54o86kVyqcPbbEFcD6R1gNJUxKVSnuXy9Z9owj2Ts%2BpSlpiZf6WYHdtbo0cKF26j1K0npcsF2DbKBQNl38a2BfsqWRgcgrd7vJzCx7ow%2F0fo0ntaR8p%2Fz7pIQtXKCA7jUCNrVy%2F%2BJnuycrOYppq0oWKxNGRG%2FDPbQXNrFkx6ZR4Qps2fCjlk8yWa6TLWch%2Bho5uC6F0B0VmtsAL3IT%2F7zPMNLc1swGOqUBSzCliYkpsqAY3zs82h7YkgB6RQlas1b3PtV6H17Y5YN0zc7OkRQMQSqEhcIsyNthehrtFKEJjlv9HEasmKU3s1%2BnoeNDJvfHiTf5HwgsY1D86XU6O6Id0y0DzaEiASWmb13OLvrWcPEpg7uZq9rUV1pbb5s%2Fz3QIkHgLHaD58%2Bqsrj%2BAvBNyDZ%2BjUJWdF6XdOIhURO2hw5%2FsosU5Pq2vX40FnTAH&X-Amz-Signature=eba6745ab1aa453b62269d899f5f2c0723811a0947f93ccd528c734e551b8c1d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZT2NJQLE%2F20260218%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260218T123710Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCdzn0k0OPsyLJmkvR1I%2FmYmd2uwnU9w7o1pdVAYh2xIwIgEO6Lus7DImLGRFaij51PrTYKf633V1R0%2FVaGVIUhMq0q%2FwMIZRAAGgw2Mzc0MjMxODM4MDUiDA1ZxGPMWRTc56E8BSrcAwtOA1x1lUC7TuVZjYRxqvSIPWJvZ0QcZsE%2BQsTe6hMoviddzQd6SJkj93ruMBpVQAzQ%2FNY93oeY5v2XXOfH1GynMAAOgvpVikNzWWB16OkjbtO2oC4ru2ecZnfYrxTzPH4aUWW3kzcGH2orL9eawy7cq%2Br8l0JjrRujZS0HJmbD0cTo7UHD3wp01FbkOOiO7554eExkboB4U%2FwdsXPpX3xwPNXgfZ5D4QawcBnp6zri4LXn1RSNRIv1R4Ojf8DfkMPcXfLTZScPUabt6WOOmbEMV0JyZOnzFuWtanulZJWC32x%2F4en%2Fj92QwKKadO1WJ6MsaB%2F1iTbNM8YNHnr5tReOVC1jBDyfKJbuYdqAPmSDj8iZ9SEP8zCWkMUPT4vYr%2BcCY8CRTjLADatmBG0uyO1mXSzX1K8sINBM0m54o86kVyqcPbbEFcD6R1gNJUxKVSnuXy9Z9owj2Ts%2BpSlpiZf6WYHdtbo0cKF26j1K0npcsF2DbKBQNl38a2BfsqWRgcgrd7vJzCx7ow%2F0fo0ntaR8p%2Fz7pIQtXKCA7jUCNrVy%2F%2BJnuycrOYppq0oWKxNGRG%2FDPbQXNrFkx6ZR4Qps2fCjlk8yWa6TLWch%2Bho5uC6F0B0VmtsAL3IT%2F7zPMNLc1swGOqUBSzCliYkpsqAY3zs82h7YkgB6RQlas1b3PtV6H17Y5YN0zc7OkRQMQSqEhcIsyNthehrtFKEJjlv9HEasmKU3s1%2BnoeNDJvfHiTf5HwgsY1D86XU6O6Id0y0DzaEiASWmb13OLvrWcPEpg7uZq9rUV1pbb5s%2Fz3QIkHgLHaD58%2Bqsrj%2BAvBNyDZ%2BjUJWdF6XdOIhURO2hw5%2FsosU5Pq2vX40FnTAH&X-Amz-Signature=1ad90d51c897cf24cb562a79af031e2ee657f6ab779035e4595851928288358e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
