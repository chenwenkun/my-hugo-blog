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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VCIYSZKC%2F20260711%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260711T014141Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAydxUM6Rlibg13wn2tfmFe1TVC0h%2BNJ3IR6RQi5l2STAiAFAqblfnfjjdbgifCEI9G3YIh4cS9%2FP0b7N18q6%2FecdSqIBAi%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMlIxxlD%2B%2F8rpH8mVaKtwDMAt0It35F9EJSeGEUxAojMEvC%2FCyh29bAk6%2BWmYeD%2BrNi7aw2SXWHAbX9gIUNIsHCNqOtJbltcheIuhRNA4qbH%2BMTO%2BexfXcY1dlcCsvDKYeHNt6Vh2nWhRMXkApaDdgPck81Jpk1IhZILUxCKKsLrhIWn873Gxz0q3KBepg%2B6Y4LsF1OBwryqLHWu358QmAHLkIOAfy0B6P%2FjrlHrajXf2%2BTqGcJK%2FjqKDQ5ObtsgrMGmGSBRC8PlRnjLtbAIYdgTzZ6o%2Fi2G%2BrJutyFvPVdUqyRvfUsE8DlNkuUqcPK5Js5s9q25GmhKvpWVdxDGswgF3uChNf3OC3g1nx3UBXm4FMhz0RiW4kl7l0bjetHEGTdcCRcFrVaI9dhkQf75pK%2Bckwx697Eh4Zimn71dmhNuxXm%2FJkHiiodqnID60Zd4X3GkmkyReE%2BGAI%2Fxcx1MmxULYqoYcqRWnoBQ%2Fc8Eir6Qplqyxy1Nk2lIyj8I%2B0Vj9ASFbQtap60RzyEj%2Ftj%2BPrsAgClrHUAonbPoXgMpmeByvMEq4eefo7Q6Sv%2FRhA41gfv7CKR7tKrqTO62EUJpDASEE4x8chrMm1jEyqRjdySHbnpwDG0ybN%2FjheYKLcCOJ%2BlUI26g6mTDFc%2BNwwydLF0gY6pgHR4iy1%2FsVkaJJduz0AMZ6UxRlBvvvX%2BSgo2Sekpe44p5rGphALyzgGtoy88xeY8Dhav%2BAbZIm%2Fr9La8c1MSsjWu9dvyrFjaJyKRzxMuVHl84BNtW9%2BP1ZPRa4hUoacrkDpmHVRniBZWYmate7BCpaip7Bqg2cTVIDJtVAcbeAVZMSFTBXnmNp%2Be%2FnzmKcQ0o2SJmx%2BorjYq8F1yAW4nW%2BYcxjZFPNq&X-Amz-Signature=bb768cdee2a2e7ba5a85ec3f530a98519a9b74d32d6de3ccddc53e10083dbd4a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VCIYSZKC%2F20260711%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260711T014141Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAydxUM6Rlibg13wn2tfmFe1TVC0h%2BNJ3IR6RQi5l2STAiAFAqblfnfjjdbgifCEI9G3YIh4cS9%2FP0b7N18q6%2FecdSqIBAi%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMlIxxlD%2B%2F8rpH8mVaKtwDMAt0It35F9EJSeGEUxAojMEvC%2FCyh29bAk6%2BWmYeD%2BrNi7aw2SXWHAbX9gIUNIsHCNqOtJbltcheIuhRNA4qbH%2BMTO%2BexfXcY1dlcCsvDKYeHNt6Vh2nWhRMXkApaDdgPck81Jpk1IhZILUxCKKsLrhIWn873Gxz0q3KBepg%2B6Y4LsF1OBwryqLHWu358QmAHLkIOAfy0B6P%2FjrlHrajXf2%2BTqGcJK%2FjqKDQ5ObtsgrMGmGSBRC8PlRnjLtbAIYdgTzZ6o%2Fi2G%2BrJutyFvPVdUqyRvfUsE8DlNkuUqcPK5Js5s9q25GmhKvpWVdxDGswgF3uChNf3OC3g1nx3UBXm4FMhz0RiW4kl7l0bjetHEGTdcCRcFrVaI9dhkQf75pK%2Bckwx697Eh4Zimn71dmhNuxXm%2FJkHiiodqnID60Zd4X3GkmkyReE%2BGAI%2Fxcx1MmxULYqoYcqRWnoBQ%2Fc8Eir6Qplqyxy1Nk2lIyj8I%2B0Vj9ASFbQtap60RzyEj%2Ftj%2BPrsAgClrHUAonbPoXgMpmeByvMEq4eefo7Q6Sv%2FRhA41gfv7CKR7tKrqTO62EUJpDASEE4x8chrMm1jEyqRjdySHbnpwDG0ybN%2FjheYKLcCOJ%2BlUI26g6mTDFc%2BNwwydLF0gY6pgHR4iy1%2FsVkaJJduz0AMZ6UxRlBvvvX%2BSgo2Sekpe44p5rGphALyzgGtoy88xeY8Dhav%2BAbZIm%2Fr9La8c1MSsjWu9dvyrFjaJyKRzxMuVHl84BNtW9%2BP1ZPRa4hUoacrkDpmHVRniBZWYmate7BCpaip7Bqg2cTVIDJtVAcbeAVZMSFTBXnmNp%2Be%2FnzmKcQ0o2SJmx%2BorjYq8F1yAW4nW%2BYcxjZFPNq&X-Amz-Signature=80dc2b5aee33a7c66b7dade52f1f39fcb8b4ed7370712234e13b7e9080852217&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
