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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667NT3RNS2%2F20260121%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260121T062223Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCICEcDBsMS1S%2BvSEc%2B%2BhiqNvzqImIeokG0q%2BYHAy8f6XpAiAo%2BVB4e3JJ%2BcK%2BU9Q5AvthtilSk14%2Ff3GRBDnFDrCi1yqIBAi%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMwlxuBG1gEZArCCKGKtwDIrr2ALEHeB%2FF9RAp0h8hnc%2BT7wqea7sTbTDJCSbrrU6AKmH10004Kdmh21poxdBPRvxv4K80yVoItcReVwPC2a%2FkowH%2BYsW20Dgl2kmrQiKI3mZLfQu0%2FY%2FXhzyMh4QDWl3aV%2BZLSGr5EdxPQd6fNRs1bIrImzcD9l0b9HXfM58c61wQVraj0GbrgCxt2wHXcxnBt%2Baptmqqdufwjk%2FQHxp5TWv63R%2FWyF2zKuEuiO8eMhsDguP0snyD0fJlOQuMuFETFg%2F5Uz6QzJgxuJVPwOgaQz3g%2F4p%2BvoSKsTdKbNPfa2NB%2BPjUlYcTXAHhmeptPDaA4vWqFTcm3IBTV2bBY118j24paf389fOwpjTLQOljjTqCJ%2FetSjlIlwSvkklBX2KbDrIqOpVMUD4xiNWxvdRyuiKWW69OA31JO%2B29MrcV1PQOjHG4lf5VnR8mC7xqnsbKMKGZdtZ4lv08N9A5iNAAg3CGpw4kiFZeYRUqVcRT00MCNCshN%2Frh%2F7yfwKo9QzW3okiqah7n0ti8X5D%2FUWHfgH9ppvLJZp0EYhzcoU1pO6bhYG6tghu0RYCX1uhVnKr0cShJrBmZfuhd9NI7VU8c3g5IVdrYoc4vdMdP6PGwkd7d%2FaONX%2BRgkU4wus7BywY6pgFg1FShhHoBjkhkqTTreHhNG5pQsbZ%2FsLtvvX1sAqlijp1iO3MmF6VGM6A41FE0FPwOEAKlYY8uvi0B2UGIGjr0MXu5W3XoJ14VcrRrZyf8eO1VRnE%2FPuL91tgqWctVGKA%2B%2FrOabLaMJnwsBCwU3yajtoYe3CyNhcj9lh7E8bGdGLBGKAlEoCP34Jg7Khs7vkPwrY3xrvSf0FhJJL30vvSRBFB1hQJ%2F&X-Amz-Signature=73662c89e605b4a78c446d8019e6d7cb31918616cceda338a5411b716825180f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667NT3RNS2%2F20260121%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260121T062223Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCICEcDBsMS1S%2BvSEc%2B%2BhiqNvzqImIeokG0q%2BYHAy8f6XpAiAo%2BVB4e3JJ%2BcK%2BU9Q5AvthtilSk14%2Ff3GRBDnFDrCi1yqIBAi%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMwlxuBG1gEZArCCKGKtwDIrr2ALEHeB%2FF9RAp0h8hnc%2BT7wqea7sTbTDJCSbrrU6AKmH10004Kdmh21poxdBPRvxv4K80yVoItcReVwPC2a%2FkowH%2BYsW20Dgl2kmrQiKI3mZLfQu0%2FY%2FXhzyMh4QDWl3aV%2BZLSGr5EdxPQd6fNRs1bIrImzcD9l0b9HXfM58c61wQVraj0GbrgCxt2wHXcxnBt%2Baptmqqdufwjk%2FQHxp5TWv63R%2FWyF2zKuEuiO8eMhsDguP0snyD0fJlOQuMuFETFg%2F5Uz6QzJgxuJVPwOgaQz3g%2F4p%2BvoSKsTdKbNPfa2NB%2BPjUlYcTXAHhmeptPDaA4vWqFTcm3IBTV2bBY118j24paf389fOwpjTLQOljjTqCJ%2FetSjlIlwSvkklBX2KbDrIqOpVMUD4xiNWxvdRyuiKWW69OA31JO%2B29MrcV1PQOjHG4lf5VnR8mC7xqnsbKMKGZdtZ4lv08N9A5iNAAg3CGpw4kiFZeYRUqVcRT00MCNCshN%2Frh%2F7yfwKo9QzW3okiqah7n0ti8X5D%2FUWHfgH9ppvLJZp0EYhzcoU1pO6bhYG6tghu0RYCX1uhVnKr0cShJrBmZfuhd9NI7VU8c3g5IVdrYoc4vdMdP6PGwkd7d%2FaONX%2BRgkU4wus7BywY6pgFg1FShhHoBjkhkqTTreHhNG5pQsbZ%2FsLtvvX1sAqlijp1iO3MmF6VGM6A41FE0FPwOEAKlYY8uvi0B2UGIGjr0MXu5W3XoJ14VcrRrZyf8eO1VRnE%2FPuL91tgqWctVGKA%2B%2FrOabLaMJnwsBCwU3yajtoYe3CyNhcj9lh7E8bGdGLBGKAlEoCP34Jg7Khs7vkPwrY3xrvSf0FhJJL30vvSRBFB1hQJ%2F&X-Amz-Signature=3ee4634ac81d06f796327da1a2b4c0ed6692946d9219dfff84aaa92a257ffd8b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
