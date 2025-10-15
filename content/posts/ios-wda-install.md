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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662WG6MNM4%2F20251015%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251015T122240Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCICt1O4L8w5Y0NY4215y3xUwxKl1gpl5HtBeQtZP0F4HIAiEAwceJ3R%2FtR83E0b4uoFHYsGuuLfK8ggmN3U1EsRLPhIsq%2FwMIdRAAGgw2Mzc0MjMxODM4MDUiDKsgGapS9wXG8HD3wCrcA%2BLvjL8guk13QSxsaLwsCWx8P1cfpm1KkjAfdzpD3qZSP4F4qPWll%2BRV%2FQ7ngDqmt%2Bh%2BG2w30RsvbFd7crEF%2FmCqwf9hSVBydAHGgRKP6%2BpeSOMYvwmrf0jDCIdyMkCytnEirupJ6%2BgOcoQA9aWFCMth7O1j6O04Ko5FoUb6DntcolBgDf4eIBbsbaivxwll282t420%2FyR6XnI7CejqS75wZOIemb0ILQLXShgo9u6h6IPFg9m79y36ruNEtHA4c66tZdrpEAadhdTVWeislDgZlveF3GCJeDxldXV%2FQ%2B%2FweMM5HtDXVdev6ZG33r4O3WZLHCkvo3qrvQgbkiYQJswUZIXnC86WB7rzqFB3nZFrTq2ePeiqXWbECrVd1GECuyFn6WuL5JBTBIh1jTK4FAeNoKCo53%2FiUI2R9X%2BkQL8QkMxrh18vaMuwdXZpuifyifBvPXbT2fZHXOnfpxIY6hT9YF5MwT0u4MN4kjRl1F6WvC4Y6uvNSHXdkC940CBZJ5BP5sJiAoyG5bBp%2B4MZYmMzd%2FO8zW9jXFTP3rmSNnDVdAxXLdBTYt0PuH9ONJKSD5a7PhOZh5%2BQULG6LDQ4%2FFHMXEduSp80styFngwwJg33k1zEAM7ekiLaAp8kwMNqOvscGOqUBLP%2BxxGB0N8cvM4nyRh0h%2B3H2MWMnh3roFmZhsHH5nj%2FcOETJP%2FViRY6vxBcuuEwCJPbtnZM64GzV0Kdhd6be3ofR4mU79T18RIjt6F7GLgvomZwHbBHBSod40Aa5KpYzOKnzvxq13e1itYHsD%2BL2GmM1WaRkTKKoj4nHmLgorPzM%2Fp4OU0Lxs5AjwqMkrrao5hjiDDMtP28UF1dkjrjCh0aWBFCT&X-Amz-Signature=363fe9bf8b2f952cc6e8606192f38136e5ef4709d930b4cbe59e6c45c4f1a0aa&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662WG6MNM4%2F20251015%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251015T122240Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCICt1O4L8w5Y0NY4215y3xUwxKl1gpl5HtBeQtZP0F4HIAiEAwceJ3R%2FtR83E0b4uoFHYsGuuLfK8ggmN3U1EsRLPhIsq%2FwMIdRAAGgw2Mzc0MjMxODM4MDUiDKsgGapS9wXG8HD3wCrcA%2BLvjL8guk13QSxsaLwsCWx8P1cfpm1KkjAfdzpD3qZSP4F4qPWll%2BRV%2FQ7ngDqmt%2Bh%2BG2w30RsvbFd7crEF%2FmCqwf9hSVBydAHGgRKP6%2BpeSOMYvwmrf0jDCIdyMkCytnEirupJ6%2BgOcoQA9aWFCMth7O1j6O04Ko5FoUb6DntcolBgDf4eIBbsbaivxwll282t420%2FyR6XnI7CejqS75wZOIemb0ILQLXShgo9u6h6IPFg9m79y36ruNEtHA4c66tZdrpEAadhdTVWeislDgZlveF3GCJeDxldXV%2FQ%2B%2FweMM5HtDXVdev6ZG33r4O3WZLHCkvo3qrvQgbkiYQJswUZIXnC86WB7rzqFB3nZFrTq2ePeiqXWbECrVd1GECuyFn6WuL5JBTBIh1jTK4FAeNoKCo53%2FiUI2R9X%2BkQL8QkMxrh18vaMuwdXZpuifyifBvPXbT2fZHXOnfpxIY6hT9YF5MwT0u4MN4kjRl1F6WvC4Y6uvNSHXdkC940CBZJ5BP5sJiAoyG5bBp%2B4MZYmMzd%2FO8zW9jXFTP3rmSNnDVdAxXLdBTYt0PuH9ONJKSD5a7PhOZh5%2BQULG6LDQ4%2FFHMXEduSp80styFngwwJg33k1zEAM7ekiLaAp8kwMNqOvscGOqUBLP%2BxxGB0N8cvM4nyRh0h%2B3H2MWMnh3roFmZhsHH5nj%2FcOETJP%2FViRY6vxBcuuEwCJPbtnZM64GzV0Kdhd6be3ofR4mU79T18RIjt6F7GLgvomZwHbBHBSod40Aa5KpYzOKnzvxq13e1itYHsD%2BL2GmM1WaRkTKKoj4nHmLgorPzM%2Fp4OU0Lxs5AjwqMkrrao5hjiDDMtP28UF1dkjrjCh0aWBFCT&X-Amz-Signature=83b8d9319a75ca5131aa63175f376bea26e8325bdaae196e1674c74d07f8b52a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
