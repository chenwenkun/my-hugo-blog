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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664WZVXLKK%2F20251127%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251127T122234Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIE%2FtO5%2BdLUYvpPScXmEu%2BelstbQ%2FBEDFwLMX381jyE8wAiB7N31BiJ4gE3In60UVMeU2YMmaLmyHWqrSrGymWXwVYyqIBAib%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMAC%2FYrjDYADPkeh3sKtwDt%2FJV61kLNbsQ4BjemqSVTHqssplWY72hK%2BfoXNmlLAxL70Kpk5dPLO8axpmhk%2FctX9BDKEZchQnNBUGXGjFvt%2Bvj9X5UhCuG5ZBOyHGtPT13A58%2FSNd7dt49a4kHYu%2F9ZRw1KSXQIPvI%2Fpl4GSz1YJdVW6Qfe9Vk4c5%2FPAR9%2BO5l9nBN7RXOJF8wKDO04OVSGgnorV5iHsFNZOixSjWgoCK1J8AXXKnRv1hCRAC0rtMBhdvpxW04nzwL9YRcvxA3JFCT9nDb3OoyOGam9a%2F5Tvqea1w4DPHrxMHspegHQtkYbbX%2Bg%2BZ9dT1vXcrheJKkeVXCSMFAayjsOupxWfO%2BH98HXHFM6mG%2FZc%2FtbhioPNwBQs6wCYXOOqXUnjddumPqyubhlO9uWBVAp6hvKOqRvNsnqmQn18eySsubd8Z9%2BW3nqhMtz2dnSPQKArRwqLFShHxVDqCYjwB3tqEyD%2FpaDYw%2BPrbI0pu0Q%2BZ32cEMPYH0M1kvZOM8yEc1YZBzKBlFZ%2FBArr4BdYB6wGBqY6NdyDwKOj4Mf8tewUxj2%2FYVfpU4zEGXemV6kH4Uvjms1cARVlURe89nyp1u6XWt6H1oO50QEx%2Blb%2Fo730sC8%2FrdW%2FO5NRDeaxw5o16RETUwkrqgyQY6pgHyErmRJu9Xxvz9Ri92sE0pEBRwj%2FPYpdfePUtaLi8iFS6kmxnMGuL8h2RlIq9EYo6Df6kOnmXlAzhsccE3e38%2BQ%2FxAa8PzrRye4UaUG%2FHv7xA2h1onIHnySGSo7YjOUy1AfM5oBwE%2FhN%2BbgxqU1nQCHy2fMES4sDFLRtCiw2W%2FC9E23gIl9HsJNZquxY%2FEPlaBcJmQx6AmBlBZFza2n%2BXXVd%2BjzNK1&X-Amz-Signature=3bddee98622cc40abc986bc12b49a91750bececabcfd4f4be4344d0232a5b1ec&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664WZVXLKK%2F20251127%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251127T122234Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIE%2FtO5%2BdLUYvpPScXmEu%2BelstbQ%2FBEDFwLMX381jyE8wAiB7N31BiJ4gE3In60UVMeU2YMmaLmyHWqrSrGymWXwVYyqIBAib%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMAC%2FYrjDYADPkeh3sKtwDt%2FJV61kLNbsQ4BjemqSVTHqssplWY72hK%2BfoXNmlLAxL70Kpk5dPLO8axpmhk%2FctX9BDKEZchQnNBUGXGjFvt%2Bvj9X5UhCuG5ZBOyHGtPT13A58%2FSNd7dt49a4kHYu%2F9ZRw1KSXQIPvI%2Fpl4GSz1YJdVW6Qfe9Vk4c5%2FPAR9%2BO5l9nBN7RXOJF8wKDO04OVSGgnorV5iHsFNZOixSjWgoCK1J8AXXKnRv1hCRAC0rtMBhdvpxW04nzwL9YRcvxA3JFCT9nDb3OoyOGam9a%2F5Tvqea1w4DPHrxMHspegHQtkYbbX%2Bg%2BZ9dT1vXcrheJKkeVXCSMFAayjsOupxWfO%2BH98HXHFM6mG%2FZc%2FtbhioPNwBQs6wCYXOOqXUnjddumPqyubhlO9uWBVAp6hvKOqRvNsnqmQn18eySsubd8Z9%2BW3nqhMtz2dnSPQKArRwqLFShHxVDqCYjwB3tqEyD%2FpaDYw%2BPrbI0pu0Q%2BZ32cEMPYH0M1kvZOM8yEc1YZBzKBlFZ%2FBArr4BdYB6wGBqY6NdyDwKOj4Mf8tewUxj2%2FYVfpU4zEGXemV6kH4Uvjms1cARVlURe89nyp1u6XWt6H1oO50QEx%2Blb%2Fo730sC8%2FrdW%2FO5NRDeaxw5o16RETUwkrqgyQY6pgHyErmRJu9Xxvz9Ri92sE0pEBRwj%2FPYpdfePUtaLi8iFS6kmxnMGuL8h2RlIq9EYo6Df6kOnmXlAzhsccE3e38%2BQ%2FxAa8PzrRye4UaUG%2FHv7xA2h1onIHnySGSo7YjOUy1AfM5oBwE%2FhN%2BbgxqU1nQCHy2fMES4sDFLRtCiw2W%2FC9E23gIl9HsJNZquxY%2FEPlaBcJmQx6AmBlBZFza2n%2BXXVd%2BjzNK1&X-Amz-Signature=35be24a3d5a9a33ec89df3c50f07c7a3efa56200104f3514087303b438e9b8d9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
