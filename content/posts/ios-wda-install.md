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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TUA6QFH5%2F20260727%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260727T015401Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHoaCXVzLXdlc3QtMiJHMEUCIQDZnn%2Bf4oaKBVg%2FXn6ZgAasg83S35iVIV6ZDHJoha6tcQIgd%2Bj9%2B9HlMoZNOI5e09ivwmTYrdtIlwdomXNziFI%2BXhQq%2FwMIQxAAGgw2Mzc0MjMxODM4MDUiDCSdr%2Fn%2FY5N33%2BnrBSrcA%2B9ELUqx24zs1In1G37s%2BRQIbZdlWIDwAdDjXQykeulmibBOUMTyfdsx0kKS3l1StrvKTl9HqA3R5RYQl2BMROSjeAwiNxCydmlO4OWl3EgzfnXCqulVpbthIMj%2FVWoCvonYqes%2F9mMXCTnpLDUPPKqH5W9Y0C36m%2Fh4eU%2FPA4rfFXDzuxtBt%2Bg7oOOJPK2V%2FC0o7yYopCNGYvMmp%2FzftM3z98jCZXLW92aOQOMW6eKuMf8M%2Bvlkw5jYo7CV%2B59sc1ZlMmkPJQqzeXtXJskaN51dWqkEWCV4EwwKu5cBI%2FUTWKKO5eB%2Fp2DVCufBDCSENq3nzC%2BARXWe%2FSDYNQy2o3RHAIzgGfQFk5UUuBqOT81r1BEsXVP3ypWTb%2F9G3GxGtZeEa712nXzQJGTk%2FLr3FcyvknyvZGJrNlORCLCG2c5r0CbBtU4ICrJVOGs3%2B7hhRh81gTja4uVJ%2F0CyK1nPeXiwGrTewzmfExqvYa69PvE7FZDwG58pnwyNK%2Fn4g7vZDYu5Zi%2F%2BNGBXV62FXBanb8XzLlkgPpt2HzpK%2FQ0hEZIxQoiLHcz3bUtqR6yaggLpWnCi56f6z02%2FCqXUkGgiJmEAupeI1oCtizdGtiHDbyYtbwlTogizp448TxO8MNTqmtMGOqUBADlMNyCNAWODRcbsmdtl6K7TL2pHBOj8BH7uRdOOFyVcbZCfVxkBj5g3JoATbC0SHrnMhAGVjPGcfMPkcHrsU7z1%2BE%2BWeyfNQp0lYtTPy%2BNbDG35SdEyYp34aW2ehvvzY1qrRAYCf%2BdXFz%2BG6oxVsfvuBar1n5LRmJ9%2F4K9uTOLVwx1wIv%2FKSY79%2FPpAny4XoguCuUGh32LLnfpv38r1I17p23mL&X-Amz-Signature=697478933d17a6216f22de7ad279db16477e6502bfdf0db98901d8bd69971e04&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TUA6QFH5%2F20260727%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260727T015401Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHoaCXVzLXdlc3QtMiJHMEUCIQDZnn%2Bf4oaKBVg%2FXn6ZgAasg83S35iVIV6ZDHJoha6tcQIgd%2Bj9%2B9HlMoZNOI5e09ivwmTYrdtIlwdomXNziFI%2BXhQq%2FwMIQxAAGgw2Mzc0MjMxODM4MDUiDCSdr%2Fn%2FY5N33%2BnrBSrcA%2B9ELUqx24zs1In1G37s%2BRQIbZdlWIDwAdDjXQykeulmibBOUMTyfdsx0kKS3l1StrvKTl9HqA3R5RYQl2BMROSjeAwiNxCydmlO4OWl3EgzfnXCqulVpbthIMj%2FVWoCvonYqes%2F9mMXCTnpLDUPPKqH5W9Y0C36m%2Fh4eU%2FPA4rfFXDzuxtBt%2Bg7oOOJPK2V%2FC0o7yYopCNGYvMmp%2FzftM3z98jCZXLW92aOQOMW6eKuMf8M%2Bvlkw5jYo7CV%2B59sc1ZlMmkPJQqzeXtXJskaN51dWqkEWCV4EwwKu5cBI%2FUTWKKO5eB%2Fp2DVCufBDCSENq3nzC%2BARXWe%2FSDYNQy2o3RHAIzgGfQFk5UUuBqOT81r1BEsXVP3ypWTb%2F9G3GxGtZeEa712nXzQJGTk%2FLr3FcyvknyvZGJrNlORCLCG2c5r0CbBtU4ICrJVOGs3%2B7hhRh81gTja4uVJ%2F0CyK1nPeXiwGrTewzmfExqvYa69PvE7FZDwG58pnwyNK%2Fn4g7vZDYu5Zi%2F%2BNGBXV62FXBanb8XzLlkgPpt2HzpK%2FQ0hEZIxQoiLHcz3bUtqR6yaggLpWnCi56f6z02%2FCqXUkGgiJmEAupeI1oCtizdGtiHDbyYtbwlTogizp448TxO8MNTqmtMGOqUBADlMNyCNAWODRcbsmdtl6K7TL2pHBOj8BH7uRdOOFyVcbZCfVxkBj5g3JoATbC0SHrnMhAGVjPGcfMPkcHrsU7z1%2BE%2BWeyfNQp0lYtTPy%2BNbDG35SdEyYp34aW2ehvvzY1qrRAYCf%2BdXFz%2BG6oxVsfvuBar1n5LRmJ9%2F4K9uTOLVwx1wIv%2FKSY79%2FPpAny4XoguCuUGh32LLnfpv38r1I17p23mL&X-Amz-Signature=ba630e44adffb4ba255cde7cf1eed5ff9cdc3e6c888b9daca9f050b3277d67d4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
