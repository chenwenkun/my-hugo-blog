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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UOYXATC2%2F20260605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260605T092851Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCSsuhAQHEUy1BHtRkkRi6prEiZwDzyRfFO5uDMx%2FVk%2FwIgYxVkAAKJuW2R3aX7umxy8laOMVbYPvocev9ymjNReRsq%2FwMIaRAAGgw2Mzc0MjMxODM4MDUiDGsQmUwzPiwFX3hI0yrcA1o86kATyQD9M9jMCO88PP%2FDvRL4hw2RxE1icXUThzfWVN5%2FKPXgwyDdsKAShlaE4%2BKMrZ995N44NmMFQqKfnpHgWobccHw%2FZOBDdl251l3FP%2FoKhxYYpet%2FDckEdMWBFHlFW51BM3P93qRnv8ZcIpoIDKb1VWTp00wVbjsGXRI2JXsIHTG%2FFasla2gmqmy3rhY7Xr3rpH3SVNGA9OPjwX2WnE5NC9wv3V0W%2BP%2FTUzSNnRCaOcOgREJjPSfoPD%2FmX6RATZZkA940Gump81Q7fVf5WmiSFBJ5%2BZfKljAzpw44TzO4ZQ8SfSrLt5fyj%2BlGeGPVwYRuyp0%2F7bog3Ez%2FZtPsB7U2%2FazewPX8ValaxZuCPYNgM12kPwl%2B%2FUlZchZkND1OSbhyc4B3rr9UCnvKnslXV2IaDEn39%2FqWA0FR5glxWACyMF%2BJlLs3vV7OI5br96aDsdAU3WnFn3v%2FVOc7jY97fmByi6vkw0MDGf5Tbkl%2Bqa56ouy%2BpjZLZrUp1OBD3pLXMKdPapUIYmmwybed%2FnKIz9ku%2B8bpyjHB6a%2BsYT1jBzfFoVas1vkVOOUoPMMk9TnkQF6%2FBpXhYE2WvuAe4Ntkxr96PJGyiWxEI8YukVS4sayy2cAjNhLXDd%2FBMMuOitEGOqUBwIH%2Feinvty1y%2BoFx6f8IAAs5x3Z28FltsWabtMY5ew3Ack%2BqGrBvjNEsuNxdhv0bzb4hozwV4KF9fibUFizDSXYyFVmJYsAaogX%2FMeIshWZTzZjkmAKCx9%2BOpDujKqaFINv%2F9tCST9oT4VwOucaV9L2ilW9UCMAjSmC2eOwpgDBR03XOL9WPSwWLvWBDhLudQBkEvprdI%2F9TQJSstidaOnoy5y18&X-Amz-Signature=1e993d923714ddc3efc6cf5752705d0c1b167107628df2700a52707f65d5f784&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UOYXATC2%2F20260605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260605T092851Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCSsuhAQHEUy1BHtRkkRi6prEiZwDzyRfFO5uDMx%2FVk%2FwIgYxVkAAKJuW2R3aX7umxy8laOMVbYPvocev9ymjNReRsq%2FwMIaRAAGgw2Mzc0MjMxODM4MDUiDGsQmUwzPiwFX3hI0yrcA1o86kATyQD9M9jMCO88PP%2FDvRL4hw2RxE1icXUThzfWVN5%2FKPXgwyDdsKAShlaE4%2BKMrZ995N44NmMFQqKfnpHgWobccHw%2FZOBDdl251l3FP%2FoKhxYYpet%2FDckEdMWBFHlFW51BM3P93qRnv8ZcIpoIDKb1VWTp00wVbjsGXRI2JXsIHTG%2FFasla2gmqmy3rhY7Xr3rpH3SVNGA9OPjwX2WnE5NC9wv3V0W%2BP%2FTUzSNnRCaOcOgREJjPSfoPD%2FmX6RATZZkA940Gump81Q7fVf5WmiSFBJ5%2BZfKljAzpw44TzO4ZQ8SfSrLt5fyj%2BlGeGPVwYRuyp0%2F7bog3Ez%2FZtPsB7U2%2FazewPX8ValaxZuCPYNgM12kPwl%2B%2FUlZchZkND1OSbhyc4B3rr9UCnvKnslXV2IaDEn39%2FqWA0FR5glxWACyMF%2BJlLs3vV7OI5br96aDsdAU3WnFn3v%2FVOc7jY97fmByi6vkw0MDGf5Tbkl%2Bqa56ouy%2BpjZLZrUp1OBD3pLXMKdPapUIYmmwybed%2FnKIz9ku%2B8bpyjHB6a%2BsYT1jBzfFoVas1vkVOOUoPMMk9TnkQF6%2FBpXhYE2WvuAe4Ntkxr96PJGyiWxEI8YukVS4sayy2cAjNhLXDd%2FBMMuOitEGOqUBwIH%2Feinvty1y%2BoFx6f8IAAs5x3Z28FltsWabtMY5ew3Ack%2BqGrBvjNEsuNxdhv0bzb4hozwV4KF9fibUFizDSXYyFVmJYsAaogX%2FMeIshWZTzZjkmAKCx9%2BOpDujKqaFINv%2F9tCST9oT4VwOucaV9L2ilW9UCMAjSmC2eOwpgDBR03XOL9WPSwWLvWBDhLudQBkEvprdI%2F9TQJSstidaOnoy5y18&X-Amz-Signature=ee47041f06d94dbf2df6a300d2685e030aac8c058ffaf03fe3abe9ac6398985b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
