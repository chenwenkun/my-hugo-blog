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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665KVKIH5D%2F20260714%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260714T074536Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEgaCXVzLXdlc3QtMiJHMEUCIEUEm9D9CKQLala4rDM5S%2BFarTEvcLD4IWwl1%2FUtoFHjAiEA6Q0Lebv3mMeVTA3w2zfwcT1CUMUmR9KGdvVoHNkyY0Yq%2FwMIERAAGgw2Mzc0MjMxODM4MDUiDDPWgKlpplaGfD%2FbXSrcAyvmUPHAGEm1RVkUuoj3U6bIjHVFN5QR0wFAH%2BEw8%2Bzitw3PqV6Afecn8B%2FP%2BOHlI3EyFC1Ww51mBghMkm%2B9jMtgQRmr3CCniSwsgH3OHN4F0Jk0I3CazqAmvga5fZ1EeZ9pKMrxmkZjBrS5XDmEngCv1vIpHEkPL6Hh2%2B35l14Th1euv7ydHya2ofHUC1PXdEljUSG0%2F3bb2VCpt2cigsqUXzvYcbUVmLivxoN1xZB9ZqDj8qP5yPLcb19vs0tPnzC2UM6tfsQEJA2toTb1IvKGYLBLYpYRr4pzx7%2FhJmS%2FWq1961AHygDJo4cyM5gvVSmpMjzCtjoQ%2Fe2dG74QHKUo931B4TyWsCAMu1FODDygeQ5555pfROyy2IFGajHemlNHScR8FTRqxo1BQZqoYdqg5%2FKAizH71ZGOVR24rLfQVwTStG1jEvxhHhSvQ6Jfx2hv%2ByJvU6Q3UCrWJaTGUZuNdC9FEjo82gniY3lz6lWf0H5G1i8WXuP20Wws5GcJt2fHR5MhCYgiAg42EQ61AZNgr2VXupC0yRwjCQg5EYuY9pL5i2HPdYcL0Ll823GhTY36GIR8wJvg0FpCYV2vgnLAoH8g2FHJGwiWvIySnpSjufeNFFWYFybZIuG8MJ7M19IGOqUB4ZmAjJK04paaTcnVFvJ3y6D4eUYHXmcEiV9jjsEnT7t1GN4fX5Oj9mM%2FaTM9Lt2db5gMLDTycLh1d0i%2FvxJLhPhqGO%2FdsEqf4zNo1GQQK19bkLfr4fQcq6dQ%2BR3yFfe8ik%2Bc0JidxG9YQJDAQofDkVMPa%2B0NwybRjsVEtjYM7cEvPomyrSyMn1wbIX0ml6nu005hryzlzFtTadsDI7zBzFVhVlkQ&X-Amz-Signature=3a262dc96e9a49f64d0180249c7736bad8eba322799660616946c4a17ca36aea&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665KVKIH5D%2F20260714%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260714T074536Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEgaCXVzLXdlc3QtMiJHMEUCIEUEm9D9CKQLala4rDM5S%2BFarTEvcLD4IWwl1%2FUtoFHjAiEA6Q0Lebv3mMeVTA3w2zfwcT1CUMUmR9KGdvVoHNkyY0Yq%2FwMIERAAGgw2Mzc0MjMxODM4MDUiDDPWgKlpplaGfD%2FbXSrcAyvmUPHAGEm1RVkUuoj3U6bIjHVFN5QR0wFAH%2BEw8%2Bzitw3PqV6Afecn8B%2FP%2BOHlI3EyFC1Ww51mBghMkm%2B9jMtgQRmr3CCniSwsgH3OHN4F0Jk0I3CazqAmvga5fZ1EeZ9pKMrxmkZjBrS5XDmEngCv1vIpHEkPL6Hh2%2B35l14Th1euv7ydHya2ofHUC1PXdEljUSG0%2F3bb2VCpt2cigsqUXzvYcbUVmLivxoN1xZB9ZqDj8qP5yPLcb19vs0tPnzC2UM6tfsQEJA2toTb1IvKGYLBLYpYRr4pzx7%2FhJmS%2FWq1961AHygDJo4cyM5gvVSmpMjzCtjoQ%2Fe2dG74QHKUo931B4TyWsCAMu1FODDygeQ5555pfROyy2IFGajHemlNHScR8FTRqxo1BQZqoYdqg5%2FKAizH71ZGOVR24rLfQVwTStG1jEvxhHhSvQ6Jfx2hv%2ByJvU6Q3UCrWJaTGUZuNdC9FEjo82gniY3lz6lWf0H5G1i8WXuP20Wws5GcJt2fHR5MhCYgiAg42EQ61AZNgr2VXupC0yRwjCQg5EYuY9pL5i2HPdYcL0Ll823GhTY36GIR8wJvg0FpCYV2vgnLAoH8g2FHJGwiWvIySnpSjufeNFFWYFybZIuG8MJ7M19IGOqUB4ZmAjJK04paaTcnVFvJ3y6D4eUYHXmcEiV9jjsEnT7t1GN4fX5Oj9mM%2FaTM9Lt2db5gMLDTycLh1d0i%2FvxJLhPhqGO%2FdsEqf4zNo1GQQK19bkLfr4fQcq6dQ%2BR3yFfe8ik%2Bc0JidxG9YQJDAQofDkVMPa%2B0NwybRjsVEtjYM7cEvPomyrSyMn1wbIX0ml6nu005hryzlzFtTadsDI7zBzFVhVlkQ&X-Amz-Signature=776255a33641c42577bbeac2792efc11c398885e271e10f10ce7c04304788f2a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
