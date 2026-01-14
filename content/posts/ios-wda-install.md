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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46674I46MQJ%2F20260114%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260114T122439Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFQaCXVzLXdlc3QtMiJHMEUCIHk22G0Y7%2BzrpFZ%2BaP9Adyt7mUG6OGGenrNLnfbcbYXxAiEAzlw9m6CMSJhLBWRpiVKLt8Io6VBCr2UBzLpau06Zpdwq%2FwMIHRAAGgw2Mzc0MjMxODM4MDUiDCUhbFXhmELRpSB54SrcA8oArrAoJQuct0h5HBrsMrHFbvtbUXVaLAz2NjbOf3TPxg7JvwRutegbOjMR%2BTldVUjMJHxyUBPLReSzcqDTwljEbwMw7IWX%2B%2FOYEXZYUMdLMBeIjiSGcYv24BTCLptEJnQ35g%2BqUY5muoCNa%2FWZ3%2FFbcbIiowlEvmn7648Wpi%2BdsFXcjWlgO3urqoHjHfHd4wwruL%2BaQX7HTy7mLzO6F16Ybc22uN13vyRC60Y6%2BMmzBfRFNQDyJ2XNslT7EphzhUhFcmYuP7Fnh%2BQiC0jXlxRWNXLiuzupwm0sK1iV9lGhhGnqXkJzTfKy%2FOElTyIjP%2Fn4KQv0P8KTWrtxUsUvPyPQ9cDqOYz4sdFFZSDHw0ljPnpXCE%2FUSN%2FxYAkmp9dK56zl1Pe3ljObphJBrqg%2FwYeC7XMEPuRppv2YeVNECmeDKvlv0T9%2FJDNXtT10jo2gDztSVUl7cjd0CeGFHYQWycarKzzkEIkN5TZN%2Biy5Anme1tZjj5Uy0QLLcwDZQTPTwbXcv31yxBmhQeVYw5pUkFEb8kDbte6%2BCYWyNM934TD0XCTBzfEwGjMtt4XSB3yhxhsr4in9NeZve3kWfyTDaceam7IcrXD1YsEmS8G60tK7L%2BKupy%2F5%2B8QPQqOlMMqRnssGOqUBR%2FRQV%2FSisVp%2FUR5lzAWJ%2FfuA2ptkdKZB78Av5sn1v0socLzlcpp9za%2BD56iN6ns4W%2FQvXA6RVym%2FOHC%2BvaP1FFA33aurj66C%2FC9%2FBTbB43l79ocGMefVApvCXuPfNhxbKr%2BKP4hU3SiD%2BHhumxUP0yuddshGTonFy8amQVI%2FX6Qq4aE9D9RNIIendhsG2WqmyEWAo1KyYE%2Fm36U6rkUVeqnVmoKq&X-Amz-Signature=515397970c458d07c46d2947b10e75a0a787f87361f4f9b3e83e423a788dac38&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46674I46MQJ%2F20260114%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260114T122439Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFQaCXVzLXdlc3QtMiJHMEUCIHk22G0Y7%2BzrpFZ%2BaP9Adyt7mUG6OGGenrNLnfbcbYXxAiEAzlw9m6CMSJhLBWRpiVKLt8Io6VBCr2UBzLpau06Zpdwq%2FwMIHRAAGgw2Mzc0MjMxODM4MDUiDCUhbFXhmELRpSB54SrcA8oArrAoJQuct0h5HBrsMrHFbvtbUXVaLAz2NjbOf3TPxg7JvwRutegbOjMR%2BTldVUjMJHxyUBPLReSzcqDTwljEbwMw7IWX%2B%2FOYEXZYUMdLMBeIjiSGcYv24BTCLptEJnQ35g%2BqUY5muoCNa%2FWZ3%2FFbcbIiowlEvmn7648Wpi%2BdsFXcjWlgO3urqoHjHfHd4wwruL%2BaQX7HTy7mLzO6F16Ybc22uN13vyRC60Y6%2BMmzBfRFNQDyJ2XNslT7EphzhUhFcmYuP7Fnh%2BQiC0jXlxRWNXLiuzupwm0sK1iV9lGhhGnqXkJzTfKy%2FOElTyIjP%2Fn4KQv0P8KTWrtxUsUvPyPQ9cDqOYz4sdFFZSDHw0ljPnpXCE%2FUSN%2FxYAkmp9dK56zl1Pe3ljObphJBrqg%2FwYeC7XMEPuRppv2YeVNECmeDKvlv0T9%2FJDNXtT10jo2gDztSVUl7cjd0CeGFHYQWycarKzzkEIkN5TZN%2Biy5Anme1tZjj5Uy0QLLcwDZQTPTwbXcv31yxBmhQeVYw5pUkFEb8kDbte6%2BCYWyNM934TD0XCTBzfEwGjMtt4XSB3yhxhsr4in9NeZve3kWfyTDaceam7IcrXD1YsEmS8G60tK7L%2BKupy%2F5%2B8QPQqOlMMqRnssGOqUBR%2FRQV%2FSisVp%2FUR5lzAWJ%2FfuA2ptkdKZB78Av5sn1v0socLzlcpp9za%2BD56iN6ns4W%2FQvXA6RVym%2FOHC%2BvaP1FFA33aurj66C%2FC9%2FBTbB43l79ocGMefVApvCXuPfNhxbKr%2BKP4hU3SiD%2BHhumxUP0yuddshGTonFy8amQVI%2FX6Qq4aE9D9RNIIendhsG2WqmyEWAo1KyYE%2Fm36U6rkUVeqnVmoKq&X-Amz-Signature=75847c911a2f630db53c649e0f431c2e899cf3accd3a1932423c02e9708a3c4b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
