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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QPQ3BKVD%2F20251118%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251118T061724Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDGXUNj0wcN7gWr0XK0d26debNX7l4a%2Fm0iMZ6gYsir%2BwIhAJKE0d1r5Nj9C90gqJUQGPqmLG1yeUosYYArq8pMXHCVKogECL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwwHKiJg2PZ%2Fb6BWSoq3AO%2FsYUYHiKqe7LNlnyaiNhxdagmbJlk6DcFCI38%2FxiBTltpEnVni6qavafk5f6DVygAX9nw0jdn%2FO3FYhaGadmF7kXHwO1NY2Y2TPhF%2B7UQQCCHD2CchsO%2BWb64MgAWxBihNlxjfkniWMqdWZMt8%2FdipUqy19vXqgG5eFA6o9%2FPw%2Bojh5uSfQe4kbWwsZ0hRsLef7QrkwGdcAEed0t%2F27yDVR7dL9YyX4X3JiTeByuSAVjpEACurxzTF1gjKUM9%2BrBsA6aIQNX6zUElND4Sr5qyaLmfu8NIcS7h5PeRGQt78bCHIWQ5NlRSmjK%2FdAc%2Bht0tAX%2FU8hIHD8Rfp0TyeAMl0tKirWVwCS8EPuCxQLkcsoADKX5YnzjBhy3fu7bm2k5sQgSLHjL0i7nEqEL8C7dqqDbQF1DNNGypMRiYXnTPv9iQL7PR39d%2BrD7T5c1BpuXZeSpoa5sQZttesmA1Q%2FWQgY8Gn%2F4HctVyt2h1BW4L4ukD5q53TFT0u1b51xjymvKCBP7fFAbVl1V0AR6WbOXropiRBegubZMqYMI6Lr9Xh7N8kHVBjUbfY%2BXNnNvENvkvIRp16JtgjhofHt%2F5B2D77bZ%2BuOdimCj8xCM%2BMkvxoMQvRYjXQKSWL1JE%2FTDNk%2FDIBjqkARZf%2BjwOzUBPzYqdZmY6dpZL%2FarjzIaxoAB1w4bgOcLJ%2F3JsKdyHuTGTH2NPp0B1MYXFM4UPY5hWMY9PoadxHTs9pOxmsw25kq5nrtJ1Hosv4TGMRmppF5EpR8QcC0riliNifmhrQssjq5XMn8wB9NVoHKH1BmvMGjw2kKoc9AMJGgE9%2FqkIXhVJOspI4QJrhMsMfRG5D5eKBE%2BQjWBzbcgQFt%2Fb&X-Amz-Signature=a82384e2519a1970cf8360c96a090e8715edd50058c9f1e1bd11906ba71659a2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QPQ3BKVD%2F20251118%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251118T061724Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDGXUNj0wcN7gWr0XK0d26debNX7l4a%2Fm0iMZ6gYsir%2BwIhAJKE0d1r5Nj9C90gqJUQGPqmLG1yeUosYYArq8pMXHCVKogECL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwwHKiJg2PZ%2Fb6BWSoq3AO%2FsYUYHiKqe7LNlnyaiNhxdagmbJlk6DcFCI38%2FxiBTltpEnVni6qavafk5f6DVygAX9nw0jdn%2FO3FYhaGadmF7kXHwO1NY2Y2TPhF%2B7UQQCCHD2CchsO%2BWb64MgAWxBihNlxjfkniWMqdWZMt8%2FdipUqy19vXqgG5eFA6o9%2FPw%2Bojh5uSfQe4kbWwsZ0hRsLef7QrkwGdcAEed0t%2F27yDVR7dL9YyX4X3JiTeByuSAVjpEACurxzTF1gjKUM9%2BrBsA6aIQNX6zUElND4Sr5qyaLmfu8NIcS7h5PeRGQt78bCHIWQ5NlRSmjK%2FdAc%2Bht0tAX%2FU8hIHD8Rfp0TyeAMl0tKirWVwCS8EPuCxQLkcsoADKX5YnzjBhy3fu7bm2k5sQgSLHjL0i7nEqEL8C7dqqDbQF1DNNGypMRiYXnTPv9iQL7PR39d%2BrD7T5c1BpuXZeSpoa5sQZttesmA1Q%2FWQgY8Gn%2F4HctVyt2h1BW4L4ukD5q53TFT0u1b51xjymvKCBP7fFAbVl1V0AR6WbOXropiRBegubZMqYMI6Lr9Xh7N8kHVBjUbfY%2BXNnNvENvkvIRp16JtgjhofHt%2F5B2D77bZ%2BuOdimCj8xCM%2BMkvxoMQvRYjXQKSWL1JE%2FTDNk%2FDIBjqkARZf%2BjwOzUBPzYqdZmY6dpZL%2FarjzIaxoAB1w4bgOcLJ%2F3JsKdyHuTGTH2NPp0B1MYXFM4UPY5hWMY9PoadxHTs9pOxmsw25kq5nrtJ1Hosv4TGMRmppF5EpR8QcC0riliNifmhrQssjq5XMn8wB9NVoHKH1BmvMGjw2kKoc9AMJGgE9%2FqkIXhVJOspI4QJrhMsMfRG5D5eKBE%2BQjWBzbcgQFt%2Fb&X-Amz-Signature=303f71756c3e4151df6c9d1ccbf7dad071cf73890e26360fb4718bc97ab36127&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
