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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466X7VU4V2N%2F20260524%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260524T081544Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHsaCXVzLXdlc3QtMiJIMEYCIQCXgskJvs0jOjfj22hzSlR6dz3FLl92%2FfMvR%2FO5RGz%2FjwIhAKaHNrkNQecMIhoJkxutiGLx9Q8IlWORCmqyxB1YAKivKv8DCEQQABoMNjM3NDIzMTgzODA1IgxqT79t1c60pYVdA7gq3ANM8PEHeICRC%2FO73GHIZEiZE6qzCnGCgdijDoDcSkzQQuwOeTLOJBIQhXumiwsv0wgK%2BjMqQc%2FgTuD5aHGXWPTBFiWnSjuisIpCbWpMAWng6PddOE5UhvH0vS4%2Fey8nbc3e7%2BGwtYYv7jnsfXbXHdcIhKmMYRRzSBu0SFk%2B6C60s3X0NcUC2IE9I7EVR6wDOcGYZ%2BtrgfSpyS%2BO7FoMBo8u0Gj7kDPn8BDXILX%2Fg220ZaDCEDPWZXSDsl7hCY%2FGvYky3pz7UnHBux7WlDMNuzvdc%2FiV3KXE0cOantGvyenV1E%2BtCkacdEc6UiTQ9JPThLfpmjViJS7MyFZq6rlpNjcYW9W3fb%2F6AwkvC8i9sV5MLZ6En8a8viBZzAZH9Z3%2B1vQDqhzi%2FNmnRxqX508zA4OuEey4S7W8MaC%2FrkVMNDflTmXbqzwonG%2FCbjCxmnmixBTmzIB%2FepdojUv3ZBih%2FAN0D60K8q5NVZZWHj75RBoQZZrE4gNwGnbAvYT69cFdCNdw4biwW0PHbs4t9o3QlcPMtF43PjVyVwWlcJ9cFQjXWxuT%2BBrKikfzQBxjGxdX6SGxBDQvqLxoE1UIiYVKMB2FhyTjFcGtioKs5SXDJzPG2cnPcKfuDK4r76cnqjCsycnQBjqkAYaJfngWSK%2BHNdp3u80Ha1USkDU%2Bu8UAnawfsV3vrdr3KDUA%2B31iB8YEhiB8GXIwcLpfQI7KKBA%2Bf2nuIc0i1rqvjcfBO9blvYjGgjUJVuzy1MOfR340UgCDAX5BWz8%2BGpbKosNC708vRaeI3g3xD2%2FYFDJNFdffethEWLg%2FzsJJkcLLrmNzWkdPTBsxBkGp3rc7avoUcPGxsnADSbhpEvR3qYlJ&X-Amz-Signature=1cd5dbf92eeebad33d92f288f830961bc52b1eff8a37ae7b05500583c9f29b23&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466X7VU4V2N%2F20260524%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260524T081544Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHsaCXVzLXdlc3QtMiJIMEYCIQCXgskJvs0jOjfj22hzSlR6dz3FLl92%2FfMvR%2FO5RGz%2FjwIhAKaHNrkNQecMIhoJkxutiGLx9Q8IlWORCmqyxB1YAKivKv8DCEQQABoMNjM3NDIzMTgzODA1IgxqT79t1c60pYVdA7gq3ANM8PEHeICRC%2FO73GHIZEiZE6qzCnGCgdijDoDcSkzQQuwOeTLOJBIQhXumiwsv0wgK%2BjMqQc%2FgTuD5aHGXWPTBFiWnSjuisIpCbWpMAWng6PddOE5UhvH0vS4%2Fey8nbc3e7%2BGwtYYv7jnsfXbXHdcIhKmMYRRzSBu0SFk%2B6C60s3X0NcUC2IE9I7EVR6wDOcGYZ%2BtrgfSpyS%2BO7FoMBo8u0Gj7kDPn8BDXILX%2Fg220ZaDCEDPWZXSDsl7hCY%2FGvYky3pz7UnHBux7WlDMNuzvdc%2FiV3KXE0cOantGvyenV1E%2BtCkacdEc6UiTQ9JPThLfpmjViJS7MyFZq6rlpNjcYW9W3fb%2F6AwkvC8i9sV5MLZ6En8a8viBZzAZH9Z3%2B1vQDqhzi%2FNmnRxqX508zA4OuEey4S7W8MaC%2FrkVMNDflTmXbqzwonG%2FCbjCxmnmixBTmzIB%2FepdojUv3ZBih%2FAN0D60K8q5NVZZWHj75RBoQZZrE4gNwGnbAvYT69cFdCNdw4biwW0PHbs4t9o3QlcPMtF43PjVyVwWlcJ9cFQjXWxuT%2BBrKikfzQBxjGxdX6SGxBDQvqLxoE1UIiYVKMB2FhyTjFcGtioKs5SXDJzPG2cnPcKfuDK4r76cnqjCsycnQBjqkAYaJfngWSK%2BHNdp3u80Ha1USkDU%2Bu8UAnawfsV3vrdr3KDUA%2B31iB8YEhiB8GXIwcLpfQI7KKBA%2Bf2nuIc0i1rqvjcfBO9blvYjGgjUJVuzy1MOfR340UgCDAX5BWz8%2BGpbKosNC708vRaeI3g3xD2%2FYFDJNFdffethEWLg%2FzsJJkcLLrmNzWkdPTBsxBkGp3rc7avoUcPGxsnADSbhpEvR3qYlJ&X-Amz-Signature=0d526988fa6407fca6b0988de07f94ceb331d0a74162dd5bdfedc133ea7b564d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
