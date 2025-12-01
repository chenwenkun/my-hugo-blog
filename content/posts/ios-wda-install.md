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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YNXO4OUA%2F20251201%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251201T010444Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECYaCXVzLXdlc3QtMiJHMEUCICe%2BuzGjjWcg%2FGBIqLOCv5GP7Un3oU6ovwsWi4WP69JkAiEA2KHsww%2B66IHdnYf2cPreMXvjBl%2BHAWZS95h3GLi0VxIqiAQI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFb%2FWVuY4Vtloj5xFCrcAzdBNCgOHRljC3Jhii5yiKHpolb6IBRAw8FBS0x4qsiswp90ICfpU8phEngc%2FTFnILlXB6skx8ambnmxSg7gb775vipFyAGsWm0iysq3Eq%2B4j78JH%2Fe3WGotTWG%2BmDTKqMq5YIm%2BHaWLmpCp1mFnskOL9PaoVgnwbxzuuxt8ftkUCZ37Ki6SWYgjaa0HHmCcaSFrJgfps3DDAU5PCqXi4OcLlokAz4BCPIautrX3GERvZrmkEt5yuIH7skJzOjUC1ML4mnYk1688nJJgi6iog%2BMEu0ifNcn49VQSsm7X8Ean3Z1FeVrPPTW5Ewi%2BDn42NMxtBrq2zFPb%2FHUNHX%2FBA8%2FG94KD7YGqLGty5o4Zso0qdyJi%2B%2BWQv0gHZLjIwy%2FcDOfwuayDih1pHEp3IKI%2BlUYtMOTVEhAmUlEwr%2FVmUQHdpYzZvI30Z133L9F7oBo%2FSEZzQ%2B32zVoz5Nx9ZNe8lywiHSznfuyY1VpPEc7PCecknhouUm8xSSN76Kb7Rr50mf8C2Aw4%2FdJx5kkrK%2BykPGXAj6q1WIjje%2B5mCKrj5z2VDzGDrwgsyaxBNiEiFMPd%2BlxAwYAV%2BZLHegsp4N8sUdS2vJpoisrIVNRdII6pZMg0AA8aPsZLBbQnq%2B6%2FMN34sskGOqUBoeyaT9FJKFzdnfS6TZP%2FfkGzqTFcrbD3urTUePib2qoPBCdCPMSH6ZdaDUOulgUdkfIsIUj8UEuB%2BsvPyjUChCdEboppW%2F0Q6lXK%2BQ4JytgGIM5cw8Jcey21wW8grZLgocCLRb3PqfL6M%2F8PiHf4TMTMZ5ihpqnzwJlLXjWGy4sGfgwRxSV7COn49sYbqirKCDrZpKCU%2FXdw477Uns5pKnxwsQv0&X-Amz-Signature=1aaee8409464039a098c183625cadafbddf7a1c6d7f03f6bc10700b19c0d3095&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YNXO4OUA%2F20251201%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251201T010444Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECYaCXVzLXdlc3QtMiJHMEUCICe%2BuzGjjWcg%2FGBIqLOCv5GP7Un3oU6ovwsWi4WP69JkAiEA2KHsww%2B66IHdnYf2cPreMXvjBl%2BHAWZS95h3GLi0VxIqiAQI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFb%2FWVuY4Vtloj5xFCrcAzdBNCgOHRljC3Jhii5yiKHpolb6IBRAw8FBS0x4qsiswp90ICfpU8phEngc%2FTFnILlXB6skx8ambnmxSg7gb775vipFyAGsWm0iysq3Eq%2B4j78JH%2Fe3WGotTWG%2BmDTKqMq5YIm%2BHaWLmpCp1mFnskOL9PaoVgnwbxzuuxt8ftkUCZ37Ki6SWYgjaa0HHmCcaSFrJgfps3DDAU5PCqXi4OcLlokAz4BCPIautrX3GERvZrmkEt5yuIH7skJzOjUC1ML4mnYk1688nJJgi6iog%2BMEu0ifNcn49VQSsm7X8Ean3Z1FeVrPPTW5Ewi%2BDn42NMxtBrq2zFPb%2FHUNHX%2FBA8%2FG94KD7YGqLGty5o4Zso0qdyJi%2B%2BWQv0gHZLjIwy%2FcDOfwuayDih1pHEp3IKI%2BlUYtMOTVEhAmUlEwr%2FVmUQHdpYzZvI30Z133L9F7oBo%2FSEZzQ%2B32zVoz5Nx9ZNe8lywiHSznfuyY1VpPEc7PCecknhouUm8xSSN76Kb7Rr50mf8C2Aw4%2FdJx5kkrK%2BykPGXAj6q1WIjje%2B5mCKrj5z2VDzGDrwgsyaxBNiEiFMPd%2BlxAwYAV%2BZLHegsp4N8sUdS2vJpoisrIVNRdII6pZMg0AA8aPsZLBbQnq%2B6%2FMN34sskGOqUBoeyaT9FJKFzdnfS6TZP%2FfkGzqTFcrbD3urTUePib2qoPBCdCPMSH6ZdaDUOulgUdkfIsIUj8UEuB%2BsvPyjUChCdEboppW%2F0Q6lXK%2BQ4JytgGIM5cw8Jcey21wW8grZLgocCLRb3PqfL6M%2F8PiHf4TMTMZ5ihpqnzwJlLXjWGy4sGfgwRxSV7COn49sYbqirKCDrZpKCU%2FXdw477Uns5pKnxwsQv0&X-Amz-Signature=e42a790b62aac05c5af716f38e4053c0fc403436616c95701ccb40dacb063cf2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
