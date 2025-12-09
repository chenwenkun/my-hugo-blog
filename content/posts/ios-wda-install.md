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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666Z2OY7NS%2F20251209%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251209T122316Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQD68yktcSqhFzhMptNPYUggJ2OJUAmR4nKATexfcn1d5gIgH6D27j8aDFVxMYl4ORBdH264UoFe%2BLgYB2gOuyqbkawqiAQIvf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDF%2BuVPoS2%2BJhVnmg5SrcA3jsMbPNSZcdjBHFNzv56cg3JGxz21PRlHXUcm%2BzlGEcJ0SWfF2%2FOTQFP82ZQJhH%2FaPH5zrzBHHWekgvnhXyH2FypgHo0uKHsRlAenPElhrKiEvkUkQCOcTgWspouAUXACYuj56nbQ3Xy1WHNTnDBL0LK34jq0HevYTIFfQMUMe%2BXo%2Bo%2ByMg3dRbD55h8t%2Fvi4nJry70T%2B69gxknaVjkz6Kh%2B3cguHX8vozgRP9jrywQ2X3S5TG5odwHZFCSkF%2FeThD6W24xwFo9Rs2fQAhALVKQ9BaliNw%2BKpmTvCx%2BW78F7qCe60TGF5srqxkh5M1kWYJCcjgYjy8kLd5cv%2B1hMp0WDxe9n2wCuqAeZ9oDfRhz4QzO%2BGImuFnKKZNsB%2B6jyui2BwjX1kHSjMUmenTs1e1N5AmIw7ZYznsC%2BSisEi3pCskw7goIGwnexT6A1%2BzFRqyz%2BDQtVimm%2Bi6lSj4Rbh31Z5EJKQqZrU2%2FYikqJVU5mE2RRVn6boycFys6c7S39znfNQudNHcxS%2FwgsNuVZDcRC9jytYR71r1xSASDWk2axPl%2F96Z6ce3pBs72gQP7fRIAs5SkemTTwxrrUcFaKD3GdVH%2FdjXpBcSFQDurwAwDLRzKJBRevP4nFhFZMMeh4MkGOqUBUBA2EUFVqSXzA8PBEy6r6FDjVfnNQzW%2BEa2hofwDfTUOWpxa1sCs5x0TgDLqJbenxCgr5tyrgdjLVh%2FBPQtPjQq0Ep0PH2QClOFgDKA8Pp32ZbhSqOB4OqJleCGuk147JIF4e%2Bhefb1g9I3XElMUt4p%2BHJCh91HLTY9IgmOUAkV5%2FXnQE3z2NaiDUtsqcl4UR2Lw056zLyub8evCddOp%2FcmFrQbo&X-Amz-Signature=7a8770c686dabe12f57e419c47eab9110adba309a3655ef6c5ceb40c2da5d2d4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666Z2OY7NS%2F20251209%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251209T122316Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQD68yktcSqhFzhMptNPYUggJ2OJUAmR4nKATexfcn1d5gIgH6D27j8aDFVxMYl4ORBdH264UoFe%2BLgYB2gOuyqbkawqiAQIvf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDF%2BuVPoS2%2BJhVnmg5SrcA3jsMbPNSZcdjBHFNzv56cg3JGxz21PRlHXUcm%2BzlGEcJ0SWfF2%2FOTQFP82ZQJhH%2FaPH5zrzBHHWekgvnhXyH2FypgHo0uKHsRlAenPElhrKiEvkUkQCOcTgWspouAUXACYuj56nbQ3Xy1WHNTnDBL0LK34jq0HevYTIFfQMUMe%2BXo%2Bo%2ByMg3dRbD55h8t%2Fvi4nJry70T%2B69gxknaVjkz6Kh%2B3cguHX8vozgRP9jrywQ2X3S5TG5odwHZFCSkF%2FeThD6W24xwFo9Rs2fQAhALVKQ9BaliNw%2BKpmTvCx%2BW78F7qCe60TGF5srqxkh5M1kWYJCcjgYjy8kLd5cv%2B1hMp0WDxe9n2wCuqAeZ9oDfRhz4QzO%2BGImuFnKKZNsB%2B6jyui2BwjX1kHSjMUmenTs1e1N5AmIw7ZYznsC%2BSisEi3pCskw7goIGwnexT6A1%2BzFRqyz%2BDQtVimm%2Bi6lSj4Rbh31Z5EJKQqZrU2%2FYikqJVU5mE2RRVn6boycFys6c7S39znfNQudNHcxS%2FwgsNuVZDcRC9jytYR71r1xSASDWk2axPl%2F96Z6ce3pBs72gQP7fRIAs5SkemTTwxrrUcFaKD3GdVH%2FdjXpBcSFQDurwAwDLRzKJBRevP4nFhFZMMeh4MkGOqUBUBA2EUFVqSXzA8PBEy6r6FDjVfnNQzW%2BEa2hofwDfTUOWpxa1sCs5x0TgDLqJbenxCgr5tyrgdjLVh%2FBPQtPjQq0Ep0PH2QClOFgDKA8Pp32ZbhSqOB4OqJleCGuk147JIF4e%2Bhefb1g9I3XElMUt4p%2BHJCh91HLTY9IgmOUAkV5%2FXnQE3z2NaiDUtsqcl4UR2Lw056zLyub8evCddOp%2FcmFrQbo&X-Amz-Signature=ad95b28e8c5c929110393eae667eb8054154c4bacc01dfc81eb85b89decf0391&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
