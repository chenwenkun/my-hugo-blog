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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YTECG2KH%2F20260719%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260719T184909Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIEBFNgPPil9dV9GowhGtSo3FkPJ9nm8cIYKL9t3KX6okAiEA7SRBHZVADIMuPYn830K%2FQ6h%2FREIYMcEm%2B5ZSKIFmJiIqiAQIkv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDAxtGSpjkTLGvIhvtCrcA8AbBokeyAtw1%2FT9FN1s7W1nJRVxs1wfkdV%2BWGjefcCdl%2FJQzGHDMjAmQfd%2Fkv4VWaq4%2Bm8sNqRa8KekOUoxxMtNkLHreeUAlvI9TqZp2PHHJ8DdCkEYcpaOA2QFWpN45pZk%2BPTWqNzn09defNwEOuUbtuZPK6e%2Fbnbx%2FRaQbXKiZxAcYEb14VquqfT1gH9jIMumq%2BtnXebzOFpnPq4B1sEOTpEvS2KEeyhFCqhJpEQp%2BWMVmUk2ev9b%2BgSUfKa6gGgjI5BUUjmgBJX9xsuf%2BVIzA116ij5tU6RKasr2%2Fz%2FEBP7SmfI4NF8bFtjg1PO%2FeOlEeth3tVeSBVMs0wyzflQJKYqcsn1LCe9PoDPQ%2FmTdzw%2B8I55QxM8OHrA4%2FSz75Wug%2FZfW%2FvNpU%2BneD4HP5Xu00rWdmr049WASzII8UnL52LWLHqDBibbIJpJ6hY3geUsSjCSsp8ZE6wrGKrSIJ%2FOC2P%2FIPfFb%2BE5gO20%2FsbbOxQikJlq9CkOS6AgKmiG9ZcjRFZtuQTm8HMSg6Ixrt1i2%2FryuDN0gkvTZHKGo%2BeMnCoZtNhINKI1OWHBqP%2FQUZsddfeEJtJ4Bs8qkE4ajU6d%2FWAs8fAW9CsaJca6CsOqggCMNzMVOX9nJowocMKSG9NIGOqUBb8oEa1s6gXbBIL3r6gxGLoAw9AxNgVy5mmFPcHt51x2Bq7zHxpZ06Yypi96y0QezLCqVVy5%2FLSjMO7FBXUnGqE29EP5XMwCTrng08eldJspa430kp1m2nJFxhfvvUIsbJ%2FxIt49Wp5yszTioDkQksLGDfWF16u8uGHhy%2FCCOQPOFlL5AbB%2BZB65OA7UMMZvG3lwaItrMFsQpMEKdFS4kq9lWk%2FNq&X-Amz-Signature=2245fd3c893bb0b3ce82001490a8066e3508b99708bcb05dc5496c0de50dff61&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YTECG2KH%2F20260719%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260719T184909Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIEBFNgPPil9dV9GowhGtSo3FkPJ9nm8cIYKL9t3KX6okAiEA7SRBHZVADIMuPYn830K%2FQ6h%2FREIYMcEm%2B5ZSKIFmJiIqiAQIkv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDAxtGSpjkTLGvIhvtCrcA8AbBokeyAtw1%2FT9FN1s7W1nJRVxs1wfkdV%2BWGjefcCdl%2FJQzGHDMjAmQfd%2Fkv4VWaq4%2Bm8sNqRa8KekOUoxxMtNkLHreeUAlvI9TqZp2PHHJ8DdCkEYcpaOA2QFWpN45pZk%2BPTWqNzn09defNwEOuUbtuZPK6e%2Fbnbx%2FRaQbXKiZxAcYEb14VquqfT1gH9jIMumq%2BtnXebzOFpnPq4B1sEOTpEvS2KEeyhFCqhJpEQp%2BWMVmUk2ev9b%2BgSUfKa6gGgjI5BUUjmgBJX9xsuf%2BVIzA116ij5tU6RKasr2%2Fz%2FEBP7SmfI4NF8bFtjg1PO%2FeOlEeth3tVeSBVMs0wyzflQJKYqcsn1LCe9PoDPQ%2FmTdzw%2B8I55QxM8OHrA4%2FSz75Wug%2FZfW%2FvNpU%2BneD4HP5Xu00rWdmr049WASzII8UnL52LWLHqDBibbIJpJ6hY3geUsSjCSsp8ZE6wrGKrSIJ%2FOC2P%2FIPfFb%2BE5gO20%2FsbbOxQikJlq9CkOS6AgKmiG9ZcjRFZtuQTm8HMSg6Ixrt1i2%2FryuDN0gkvTZHKGo%2BeMnCoZtNhINKI1OWHBqP%2FQUZsddfeEJtJ4Bs8qkE4ajU6d%2FWAs8fAW9CsaJca6CsOqggCMNzMVOX9nJowocMKSG9NIGOqUBb8oEa1s6gXbBIL3r6gxGLoAw9AxNgVy5mmFPcHt51x2Bq7zHxpZ06Yypi96y0QezLCqVVy5%2FLSjMO7FBXUnGqE29EP5XMwCTrng08eldJspa430kp1m2nJFxhfvvUIsbJ%2FxIt49Wp5yszTioDkQksLGDfWF16u8uGHhy%2FCCOQPOFlL5AbB%2BZB65OA7UMMZvG3lwaItrMFsQpMEKdFS4kq9lWk%2FNq&X-Amz-Signature=693de2f8c2519111fba58dce9ea8df2506a7244b5260859f9f7dd6d2d0db628f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
