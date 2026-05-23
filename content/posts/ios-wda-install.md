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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XI7RHV35%2F20260523%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260523T020023Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGEaCXVzLXdlc3QtMiJHMEUCICsczDu2hmizxRyJSHI6JUlB3LfBh76hSHXGdjuukmJEAiEAo84g8LhuhG3RgSlrsQajxx7dM7%2F5NWxgyxwmv3jJg5Aq%2FwMIKhAAGgw2Mzc0MjMxODM4MDUiDMAQkDSAxOvNkdMcKyrcA6NkAWxadPXfXlXc1by3f1NH%2BBF4YDwCMHz7yZC6lSyYruuDonnAj2Awk0Uob3BP8XZsvN5yEVG8fjbLlH%2BVu0xWEBSyVwQG7WiQcu8GJbTxlXWG8BVZ2DzqHXKlKic7MfjkoxzdgRScPajaAOxMA87GzkbfDgQ1Fhryhhbo0hzrSQPJNTw2hZJAIp%2FjMS8EGTCW570FPJeO%2F5kQXal5OSE%2BpVCIEfO3tNaGb7XCSnG3QNAJZRdQiBQNrLljx4%2B7lqOkk3%2FXNqDlRBJ57lAGR5wJoRc3aqgGi2WhnXsQ6ITLAK9xJGoz%2FvFmwDuEhMrWRRwM0RzvPRr0vOD9%2Butai6YbZoa%2FsCGdZCUmddP86FIRTXa4pwyJtOU4T6we5tHZwyM%2F9HZG6cPA8h5cgBP1pSNU1N3vmbF3zC8bc0WhWk0f3PBHiuqplAn%2FaERUf%2F4XeuELsenFRP4wnmQZWBp7s71W8Zb0yfMl157wRN%2BHUXBvlnvLz8K1SSwoTjHXdsHTvdB1%2Fc8cXDpM5l%2BE0ZZv1N4d39tHXTw7zipenrFs8QoM%2BaXHfVAAtkldWSQ5s4MM3nMsEuTuR4SQuCWMXl1VSirySPCun7EbRdwyM8mHY%2B%2FZkz62km3jq0LnNOfeMMb7w9AGOqUBEZ2Rx5EmedVEyglIhhWa%2FeUgzpWjw4MEfcnHAMu6XHi1U97hRo1BzVnGqqfceCfr7rQPHoNm9zzD%2BStjb38IdcyqYJlaJx%2BXab2ubW4%2Bsqq9YbnVuyGvx6noM2Il6E5cQ50OpnlBqSRQH4nbj4H7C09OHi%2BZmjs06wBWKX6TvMicnThiHoiNUlpVi0rxOL87m6sVb2XAp%2BfNbkNsFCKVxZgvH9AG&X-Amz-Signature=7a772848e5b510fd6ac812146d09a509269969add85040976b410af2de52dc6a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XI7RHV35%2F20260523%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260523T020023Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGEaCXVzLXdlc3QtMiJHMEUCICsczDu2hmizxRyJSHI6JUlB3LfBh76hSHXGdjuukmJEAiEAo84g8LhuhG3RgSlrsQajxx7dM7%2F5NWxgyxwmv3jJg5Aq%2FwMIKhAAGgw2Mzc0MjMxODM4MDUiDMAQkDSAxOvNkdMcKyrcA6NkAWxadPXfXlXc1by3f1NH%2BBF4YDwCMHz7yZC6lSyYruuDonnAj2Awk0Uob3BP8XZsvN5yEVG8fjbLlH%2BVu0xWEBSyVwQG7WiQcu8GJbTxlXWG8BVZ2DzqHXKlKic7MfjkoxzdgRScPajaAOxMA87GzkbfDgQ1Fhryhhbo0hzrSQPJNTw2hZJAIp%2FjMS8EGTCW570FPJeO%2F5kQXal5OSE%2BpVCIEfO3tNaGb7XCSnG3QNAJZRdQiBQNrLljx4%2B7lqOkk3%2FXNqDlRBJ57lAGR5wJoRc3aqgGi2WhnXsQ6ITLAK9xJGoz%2FvFmwDuEhMrWRRwM0RzvPRr0vOD9%2Butai6YbZoa%2FsCGdZCUmddP86FIRTXa4pwyJtOU4T6we5tHZwyM%2F9HZG6cPA8h5cgBP1pSNU1N3vmbF3zC8bc0WhWk0f3PBHiuqplAn%2FaERUf%2F4XeuELsenFRP4wnmQZWBp7s71W8Zb0yfMl157wRN%2BHUXBvlnvLz8K1SSwoTjHXdsHTvdB1%2Fc8cXDpM5l%2BE0ZZv1N4d39tHXTw7zipenrFs8QoM%2BaXHfVAAtkldWSQ5s4MM3nMsEuTuR4SQuCWMXl1VSirySPCun7EbRdwyM8mHY%2B%2FZkz62km3jq0LnNOfeMMb7w9AGOqUBEZ2Rx5EmedVEyglIhhWa%2FeUgzpWjw4MEfcnHAMu6XHi1U97hRo1BzVnGqqfceCfr7rQPHoNm9zzD%2BStjb38IdcyqYJlaJx%2BXab2ubW4%2Bsqq9YbnVuyGvx6noM2Il6E5cQ50OpnlBqSRQH4nbj4H7C09OHi%2BZmjs06wBWKX6TvMicnThiHoiNUlpVi0rxOL87m6sVb2XAp%2BfNbkNsFCKVxZgvH9AG&X-Amz-Signature=00e989fa792da0062c6606ea6d4d4b324c3261c019c6216d93ce286366ac8423&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
