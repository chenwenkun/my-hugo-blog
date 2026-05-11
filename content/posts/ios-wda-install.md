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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664IIFDIHQ%2F20260511%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260511T142448Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEE4aCXVzLXdlc3QtMiJGMEQCIDduFrLgD7WYS66%2FrC16vOq5XY0kEjZJYHtyUv3R5g5fAiBqmLbqzVug4NK7fs1fgeufvK95IEYCutOZQFLBLp7mSSr%2FAwgXEAAaDDYzNzQyMzE4MzgwNSIMBj7YJrR4OW8GS5L3KtwDbL0TwSq%2BtYvca2pBzY2%2B%2BfgwAM4cj3op%2FaLtp1qkK0fshOjvZ4E1m2oRjJz6BEvoBNi7JDU8N35I5yVEhilXe4iAN3wn6EXwPUa6LkwN%2BcBLByl9osSJ3VypglIlQFPrwQN1oPwpp%2Bd65YRJsj81u3yh1idiivKiynsTkKj1afnaDDYSjJ93LEKMxbq1Lqm0fkl9zzdF7cFq3fIbgb%2FKthFayolaOVrLHuHKgeSLGQksRcv8eA9YIWYhC2VsmXRGLxTJ4IhkOjWihvGhVKtArQmi%2FyKyKJFl4NXVH5xkJSwsXkIljmplSR7tFLSS%2FGWmNUCZzGMKPXs%2FHB05iCMDkhKQwAcBcf%2BA9Yt18%2Fg49EMkujv4om%2BvJsddfC2x0SO2JpKTovehkeZnnWlPxZCkoYbWBobodNNfd5G8dgdw9xuYqethRM5esw4kowu8kiAAit57Bq32HoQq6l0qIWOpJn3GIBzHoxmUuSTfTPdY8nxy8e3cXmCPWNK2%2BgI7Xf1PfCuOBEHsSMllMNnW3VQaeMwUkpdg72T%2FDpdhuSBgW8hzAtZp4G%2FbvogomAAKW9t6ZPGqaze7%2But4wpqiEnSvP2Zp9QH%2Bj5lioZWRaM2djAhssIzXKmuqnxPsMocwr7OH0AY6pgH6nulsiZ9ZGqikVqkUK%2BsyToAh9UubAvjapbc%2FyWeUDIaKpNu2Xng2ZwJUlsH78UJ6PJx2jQijwIwtaYxNOeGy6r4gJdwUappasNZ6a1Q3QRXkkyPvl6xlyDZDY%2B8jtmIth6coKntZx%2Fq%2BBSjb2bUqd0xStMgBKI1t6CNVqbyWHrbnTQzKV0EgwB2q%2FLMdoMQ0CrKfxSuOKfYS6KV3Gt4Y4AcVXVWn&X-Amz-Signature=b887aff3775280391ed4b8f7f691aec5ea6a550b5cddaa7719f644164ff9c7f0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664IIFDIHQ%2F20260511%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260511T142448Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEE4aCXVzLXdlc3QtMiJGMEQCIDduFrLgD7WYS66%2FrC16vOq5XY0kEjZJYHtyUv3R5g5fAiBqmLbqzVug4NK7fs1fgeufvK95IEYCutOZQFLBLp7mSSr%2FAwgXEAAaDDYzNzQyMzE4MzgwNSIMBj7YJrR4OW8GS5L3KtwDbL0TwSq%2BtYvca2pBzY2%2B%2BfgwAM4cj3op%2FaLtp1qkK0fshOjvZ4E1m2oRjJz6BEvoBNi7JDU8N35I5yVEhilXe4iAN3wn6EXwPUa6LkwN%2BcBLByl9osSJ3VypglIlQFPrwQN1oPwpp%2Bd65YRJsj81u3yh1idiivKiynsTkKj1afnaDDYSjJ93LEKMxbq1Lqm0fkl9zzdF7cFq3fIbgb%2FKthFayolaOVrLHuHKgeSLGQksRcv8eA9YIWYhC2VsmXRGLxTJ4IhkOjWihvGhVKtArQmi%2FyKyKJFl4NXVH5xkJSwsXkIljmplSR7tFLSS%2FGWmNUCZzGMKPXs%2FHB05iCMDkhKQwAcBcf%2BA9Yt18%2Fg49EMkujv4om%2BvJsddfC2x0SO2JpKTovehkeZnnWlPxZCkoYbWBobodNNfd5G8dgdw9xuYqethRM5esw4kowu8kiAAit57Bq32HoQq6l0qIWOpJn3GIBzHoxmUuSTfTPdY8nxy8e3cXmCPWNK2%2BgI7Xf1PfCuOBEHsSMllMNnW3VQaeMwUkpdg72T%2FDpdhuSBgW8hzAtZp4G%2FbvogomAAKW9t6ZPGqaze7%2But4wpqiEnSvP2Zp9QH%2Bj5lioZWRaM2djAhssIzXKmuqnxPsMocwr7OH0AY6pgH6nulsiZ9ZGqikVqkUK%2BsyToAh9UubAvjapbc%2FyWeUDIaKpNu2Xng2ZwJUlsH78UJ6PJx2jQijwIwtaYxNOeGy6r4gJdwUappasNZ6a1Q3QRXkkyPvl6xlyDZDY%2B8jtmIth6coKntZx%2Fq%2BBSjb2bUqd0xStMgBKI1t6CNVqbyWHrbnTQzKV0EgwB2q%2FLMdoMQ0CrKfxSuOKfYS6KV3Gt4Y4AcVXVWn&X-Amz-Signature=e379091abc3dd068d098a3db548c02ae00986916a7a45ee6edba627073d6e9be&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
