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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WF73DT3D%2F20260628%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260628T190059Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIDoE6GqWoIao7EPM4GFimAO3HSOLquI%2BnR4yB8x1aYmSAiEA4IoJLsJURnsPvUfdDz1aLQuxqCi2FS6J8TZM5B8eTQwqiAQImv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOqEEkPy4sPhzx9%2BOSrcA0REZHCdcC3B9iitLmKiXD%2Fgk5f79TPvOpjz2I5cGwZcJN0gPKhMqqgyN42mM9mIKNOsn3CBOjaY%2FORkQSiLMYXuNXEF3I46ovV77FDT6ybaDyjG9NTNBZa%2BFTXCJ5XMw6gNTXz%2FSV0zHm0AvXwJf5guMsvOd0gU9%2FoN6u8IP5MQpsEy7BQv%2BKniVIo1X5%2FFRUJOktVkWVAsT9h08lzkCq2Rvh8bBMSsya37kUCA5m0UnoYV4H8piLTKKFr%2FBLhlxR4bF0n%2FkXI%2BGwSepDGY613LvaIoXyp5pjsDqwEJevWmeKEs%2Fc7OR8%2BmG8NKhXL2Sq6%2F5onLIn1U2PS8GxE%2Fsa2FcAGxk2G7SALE%2Bf0En%2B090tmb6qZS2m7%2Bm8%2FqxOS4bdTipNnvPMH%2Fxx%2Bx9dPpsLMBA1bfmvgNIrrIogeM3MMaI1QzwmAYX%2F3aFHo0nopBheVbotOSQsCRvFg93U%2FVrSj0WpNkpieloZBuzSpesBywjciqDnF8FdSecmXGgfLVMz2QO9TYwpohQt7z%2FCPBzL%2F73rPYYsqwcxYQKXcXnizYvtIAfEGcjIBBK4TrbUg07%2Bd8ATBEJNYbmGTDe99Hl3JA%2Fi8O23oxAgQoE5u0B0urxZ7zVlquDpv11%2BzwMMayhdIGOqUB96NPo2blp3bdXguoZ65ifXFD6CzEUp%2BxUDpIZzSnvJVkWjwkF06cAfZitrhLm3DYgXwhfvSYOp500Zv49rRC460QZDzzjNT6VO20TE5NZzju04nr7ZOaxYUdv68FjQ8qsZL7L91TfcL1y19RyTFo1pjqOlyqdEdRSewh7F0NPVTDGm4%2B%2BZ7%2FFwhe153%2BZayYY7DAcEK%2BbHj9xl1LvSCWVSla9kAt&X-Amz-Signature=ad495680c802e26ce63bdcfacb699237de189ee71efa56d1810caf7b939ecff4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WF73DT3D%2F20260628%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260628T190059Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIDoE6GqWoIao7EPM4GFimAO3HSOLquI%2BnR4yB8x1aYmSAiEA4IoJLsJURnsPvUfdDz1aLQuxqCi2FS6J8TZM5B8eTQwqiAQImv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOqEEkPy4sPhzx9%2BOSrcA0REZHCdcC3B9iitLmKiXD%2Fgk5f79TPvOpjz2I5cGwZcJN0gPKhMqqgyN42mM9mIKNOsn3CBOjaY%2FORkQSiLMYXuNXEF3I46ovV77FDT6ybaDyjG9NTNBZa%2BFTXCJ5XMw6gNTXz%2FSV0zHm0AvXwJf5guMsvOd0gU9%2FoN6u8IP5MQpsEy7BQv%2BKniVIo1X5%2FFRUJOktVkWVAsT9h08lzkCq2Rvh8bBMSsya37kUCA5m0UnoYV4H8piLTKKFr%2FBLhlxR4bF0n%2FkXI%2BGwSepDGY613LvaIoXyp5pjsDqwEJevWmeKEs%2Fc7OR8%2BmG8NKhXL2Sq6%2F5onLIn1U2PS8GxE%2Fsa2FcAGxk2G7SALE%2Bf0En%2B090tmb6qZS2m7%2Bm8%2FqxOS4bdTipNnvPMH%2Fxx%2Bx9dPpsLMBA1bfmvgNIrrIogeM3MMaI1QzwmAYX%2F3aFHo0nopBheVbotOSQsCRvFg93U%2FVrSj0WpNkpieloZBuzSpesBywjciqDnF8FdSecmXGgfLVMz2QO9TYwpohQt7z%2FCPBzL%2F73rPYYsqwcxYQKXcXnizYvtIAfEGcjIBBK4TrbUg07%2Bd8ATBEJNYbmGTDe99Hl3JA%2Fi8O23oxAgQoE5u0B0urxZ7zVlquDpv11%2BzwMMayhdIGOqUB96NPo2blp3bdXguoZ65ifXFD6CzEUp%2BxUDpIZzSnvJVkWjwkF06cAfZitrhLm3DYgXwhfvSYOp500Zv49rRC460QZDzzjNT6VO20TE5NZzju04nr7ZOaxYUdv68FjQ8qsZL7L91TfcL1y19RyTFo1pjqOlyqdEdRSewh7F0NPVTDGm4%2B%2BZ7%2FFwhe153%2BZayYY7DAcEK%2BbHj9xl1LvSCWVSla9kAt&X-Amz-Signature=2dfa3b6c3151c57263ad5eca068b3992c15177ee5418319f54478ac288a9a98b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
