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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TE7I5MAJ%2F20260215%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260215T122710Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFQaCXVzLXdlc3QtMiJGMEQCIA1JaFzWyHNL4GUwiJp1LoYfARug1Wn9DMMKzP%2FksFtAAiABvQP5L3evvodtuQjwOIHxeG9mnHOTvs7jO3sgIMtXzSr%2FAwgdEAAaDDYzNzQyMzE4MzgwNSIMpLq7Y9KcROSKFinlKtwD99%2Fv64H9R2ZYzo8TSYA8W3MJtlV8ZDxJ0OMNG9AzWiTGPGVWDiy4%2Fcdh1n9i8k%2FePtEfuY5fdu1G8Klf6fv6Qna2rjuGqIAXPiWRubexPyM2GIrs3%2FLv6EEUuP4ypvXM%2Fl7T%2BlzxL7eC3xFZ24HeffXjiShfG8DylBvHOZSsxbPru%2BsuCjHAZKCTrE5%2Bt8VKkuhB%2FnKiAu8ijZjhefK8kkS4hB4FHkWAqYDBUKRoET8g6GSbwGTfgxCM%2BdD5Z8Yoic6zpHDU2v0muUu5kAqZliCD5ZFe1QvxD3tsFTLWzr24YjDPi51EHHWIEx2Zh0hflFwJVBaAb4dG0%2BsEsVTr3NencBTgwbfP2CQtagculzLSHs44ISa2bI9e7xdAfunsrJcPuhp5Iyx7jqx6zjsY6b4GkpvCVULdiMUfKn%2BWcX%2BXA8mj8ObxA9K0FqM5%2BW3pLUsCJehzNVWzWjdtKnh1E346i4qvQODAazuaozM4En%2BHgWIno2wp%2FPFKphyuPT0tyJW0iV%2FBfyoNCVNrmamWEiZuuWW4NdURP67VK2JatrrNLwXE0whgiEDVDCKKNGdkN52C3POnR58Clo99KfW8%2B8%2B8F5fzTSjoOFaJJN4Z94CTWSZZ9fpNimwZr%2FEw5OPGzAY6pgHr%2Fc6KZPdA%2F0IfjrOUSKgHj%2Fb1HwT8410r1PqFvj3O5RIioBeqKjf53CJq1cnad3vZ%2FrdGkf7n%2FK1SABx2EVNUNIjzKS8fKju8qD%2FvT5F%2BCPVrBhsq5PqC4KRJoBgnAH9%2B7GAESJE63aosrV53lMGbnZZwvhQXaAWB5pb9OD%2FfnmLh8X72AqKZbHK7ITjvlJSFIffdwr9lW1fTZhpn26Qqhi0ezH%2Ft&X-Amz-Signature=fe36493c4d67b52318fe223f38ee7ca701dc9e531215cbc10ef23d94039ebdbe&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TE7I5MAJ%2F20260215%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260215T122710Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFQaCXVzLXdlc3QtMiJGMEQCIA1JaFzWyHNL4GUwiJp1LoYfARug1Wn9DMMKzP%2FksFtAAiABvQP5L3evvodtuQjwOIHxeG9mnHOTvs7jO3sgIMtXzSr%2FAwgdEAAaDDYzNzQyMzE4MzgwNSIMpLq7Y9KcROSKFinlKtwD99%2Fv64H9R2ZYzo8TSYA8W3MJtlV8ZDxJ0OMNG9AzWiTGPGVWDiy4%2Fcdh1n9i8k%2FePtEfuY5fdu1G8Klf6fv6Qna2rjuGqIAXPiWRubexPyM2GIrs3%2FLv6EEUuP4ypvXM%2Fl7T%2BlzxL7eC3xFZ24HeffXjiShfG8DylBvHOZSsxbPru%2BsuCjHAZKCTrE5%2Bt8VKkuhB%2FnKiAu8ijZjhefK8kkS4hB4FHkWAqYDBUKRoET8g6GSbwGTfgxCM%2BdD5Z8Yoic6zpHDU2v0muUu5kAqZliCD5ZFe1QvxD3tsFTLWzr24YjDPi51EHHWIEx2Zh0hflFwJVBaAb4dG0%2BsEsVTr3NencBTgwbfP2CQtagculzLSHs44ISa2bI9e7xdAfunsrJcPuhp5Iyx7jqx6zjsY6b4GkpvCVULdiMUfKn%2BWcX%2BXA8mj8ObxA9K0FqM5%2BW3pLUsCJehzNVWzWjdtKnh1E346i4qvQODAazuaozM4En%2BHgWIno2wp%2FPFKphyuPT0tyJW0iV%2FBfyoNCVNrmamWEiZuuWW4NdURP67VK2JatrrNLwXE0whgiEDVDCKKNGdkN52C3POnR58Clo99KfW8%2B8%2B8F5fzTSjoOFaJJN4Z94CTWSZZ9fpNimwZr%2FEw5OPGzAY6pgHr%2Fc6KZPdA%2F0IfjrOUSKgHj%2Fb1HwT8410r1PqFvj3O5RIioBeqKjf53CJq1cnad3vZ%2FrdGkf7n%2FK1SABx2EVNUNIjzKS8fKju8qD%2FvT5F%2BCPVrBhsq5PqC4KRJoBgnAH9%2B7GAESJE63aosrV53lMGbnZZwvhQXaAWB5pb9OD%2FfnmLh8X72AqKZbHK7ITjvlJSFIffdwr9lW1fTZhpn26Qqhi0ezH%2Ft&X-Amz-Signature=b5cb4dc1c95c43712a6d76a1046b1b9f554ef6626b325379280be3efb39a1290&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
