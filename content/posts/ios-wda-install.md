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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XYGMAPP5%2F20260409%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260409T011236Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjED8aCXVzLXdlc3QtMiJHMEUCIHOXKEg7gehuvfBQpd42A3YLgKV0GsJ6ORTY26jOSx%2BpAiEAtCG%2F%2BzfBwJcN4BvJfnKf23kDYrZlSCrT4%2BFgiunKKqsq%2FwMICBAAGgw2Mzc0MjMxODM4MDUiDAziuaxpDeZ2khB4rCrcA6GDF%2FtXHb%2FcFbr8AYx6grQrcZOaeaTdJ2iy8rBjlH4GuuWMHAhWMu%2B3CEpBUJBOOLPgNXL%2FCOjhxKEsmTJ%2BuQ8bUGIz0YioSX6zuXc7c0tkW2heFP3fXQDff1Y2b41ai4zacFJQNMCazh5hMiEXadIkBeUNUWd8WRzj1bmLZm%2FyFqhDIMHTr7sni0WpKxC7EMq4S0Lwjf4mtayJC%2BbO5Boi2X1xaW9F9we6F5AkRmGfwyxBobD5cw7AV4L2At1%2BmxgEkc4mmfBiP2eBji2NORmNJr6qXVxB6n2YWmiMFi6UuOorBe3LMM8%2FHOaLnyz9Guwd6aAufhjSTGiFuB%2BL205IjArzbG81CHRNEnlMLtfrkC%2B8GoFNLhSEkj6tDVD0HXgQ4D9ZheocvEtZB1b6p5QWpRuqMspSMpTo4OaFcgAqk9OvIkxV3JCfUArS%2F5NX8WpvrvJ9oqD4se88xgutxHwXExbTc7ls6uAH0yBcZuTvp0fhoNkagpzaQa2RQN7nWg6%2BJkj65C%2FU3GZ8lm8fu4DWgL5zIl7pHbxB58S3%2B4cGZcCwAjnW%2BkXhhHbqN1YMlfNbzbkfuf4HVLxZoix8z4c3viOIi9u5kF6b%2BdZmxkwQyG4DVRUMx9px7UFdMLTB284GOqUBt8NGF7YSW8xc8gY%2BPhuub%2BLbybkJvGhdUGZJ936ulV1HzWWQRNnewrnhuGSONn%2FEd7SCDzWCciUdvw%2BkOlpWyfxEgAIwganfJKVv711yQg8qt7QrZeeJ59P2tC8BQZcamEJ%2BJdvNJBW0WCxCJWBokSr6LBPNEhj4%2BzS0q341Tg9Ed2sK44Mhy1iZjmPxs5AISq1YQKuYH0gxwsRdXoHoiAiG7%2BQo&X-Amz-Signature=5ca4451536cff88505ef9160d1acd9aa94a0527319a831db416a94b5cb8e8c8e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XYGMAPP5%2F20260409%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260409T011236Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjED8aCXVzLXdlc3QtMiJHMEUCIHOXKEg7gehuvfBQpd42A3YLgKV0GsJ6ORTY26jOSx%2BpAiEAtCG%2F%2BzfBwJcN4BvJfnKf23kDYrZlSCrT4%2BFgiunKKqsq%2FwMICBAAGgw2Mzc0MjMxODM4MDUiDAziuaxpDeZ2khB4rCrcA6GDF%2FtXHb%2FcFbr8AYx6grQrcZOaeaTdJ2iy8rBjlH4GuuWMHAhWMu%2B3CEpBUJBOOLPgNXL%2FCOjhxKEsmTJ%2BuQ8bUGIz0YioSX6zuXc7c0tkW2heFP3fXQDff1Y2b41ai4zacFJQNMCazh5hMiEXadIkBeUNUWd8WRzj1bmLZm%2FyFqhDIMHTr7sni0WpKxC7EMq4S0Lwjf4mtayJC%2BbO5Boi2X1xaW9F9we6F5AkRmGfwyxBobD5cw7AV4L2At1%2BmxgEkc4mmfBiP2eBji2NORmNJr6qXVxB6n2YWmiMFi6UuOorBe3LMM8%2FHOaLnyz9Guwd6aAufhjSTGiFuB%2BL205IjArzbG81CHRNEnlMLtfrkC%2B8GoFNLhSEkj6tDVD0HXgQ4D9ZheocvEtZB1b6p5QWpRuqMspSMpTo4OaFcgAqk9OvIkxV3JCfUArS%2F5NX8WpvrvJ9oqD4se88xgutxHwXExbTc7ls6uAH0yBcZuTvp0fhoNkagpzaQa2RQN7nWg6%2BJkj65C%2FU3GZ8lm8fu4DWgL5zIl7pHbxB58S3%2B4cGZcCwAjnW%2BkXhhHbqN1YMlfNbzbkfuf4HVLxZoix8z4c3viOIi9u5kF6b%2BdZmxkwQyG4DVRUMx9px7UFdMLTB284GOqUBt8NGF7YSW8xc8gY%2BPhuub%2BLbybkJvGhdUGZJ936ulV1HzWWQRNnewrnhuGSONn%2FEd7SCDzWCciUdvw%2BkOlpWyfxEgAIwganfJKVv711yQg8qt7QrZeeJ59P2tC8BQZcamEJ%2BJdvNJBW0WCxCJWBokSr6LBPNEhj4%2BzS0q341Tg9Ed2sK44Mhy1iZjmPxs5AISq1YQKuYH0gxwsRdXoHoiAiG7%2BQo&X-Amz-Signature=63af6ece4201970352e791d96dbad0b6a5deb8b0d4532237bb4c885c9269ff75&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
