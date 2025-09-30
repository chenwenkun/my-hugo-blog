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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666XEKMXVH%2F20250930%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20250930T122143Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGQaCXVzLXdlc3QtMiJHMEUCIQDbfYCbeXHYrlOM4u%2B9rtKAq7VPs1GZuBjsYgaHtjJnqQIgWg782XLUIz0pPZRq%2FAKO9sAtD2sW%2FF4797rv9Y2nbQ8qiAQI7f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDPBULq%2FYtHau1ZClZyrcA44Y2wHYa4lNxxY0Y6tyNbWdIGuXO2%2BBYXSkPVQ3bC9N17qVtNk1PytDulE5rufcN4DkkYrwtOQwkm8p%2BB0QohklVl4CjWnx%2BHYVbf2xZvVx048wOWY05UxRt8x1w4Go2hLMS9s4%2BhgqP2ZX1gXS9Cb36uydNZl2nkoVSHwxeOzkZGfmN93iO484tq6J8JRhR%2FLQS4HebDM15sR9MSbtPYPFj0EvsQnJ%2FIfcy8Rzu%2BDV9eb%2BRB5W6uo4C2eR283tmu75jE0CWP4SEvlFe%2Bx6e%2FwEmK%2Fb2lttiv70IKcdc%2FTEkMqaWqrWvx%2BpKtCytcrz91r6bVw6aDcHb5PAaDZKjT%2BB0R0kwLPB97bP1hwjdJIusJqmC%2B7C%2F604tHky5jfJ8rOpr7bGz24T7GU7ZsvUak98gi9uQiv7ddk5I0lB8B%2FS4gI5rynGqVHsaNJYKVAODJqCTncWz7JaqrwebRmnfs1LLhzZqd%2F57UX83qaMtBDHcwis2tWtTsLwyIjQU%2BrnmA04kCDGrBS6mCpLlkPTg0n8JOS9Q9ued27uRRt4GB%2FZiFap4D4KOFfATaaGqU70DaqLH1HyeOsHqRr5fepMTxFUwm1xi6FoWSBxeC%2BYec9YZp0NlkU9IzOEWlRjMLz%2F7sYGOqUB2SYsS3Se80izvpR4XFGLAtXt1wNNZ2z1uYBiW1%2FAgSscYAj79cYne0AYu%2B8gdwX3qmGcWF0ALDFtCDeWNF8QiZ809P8KK%2FMkv3fLpWbcpFv9JzxKiKJbotZMUDKXaQEhQBggpqV%2FHcJWoF8%2F8008Hc2xyX7Za%2F157z31RWYVCbVC%2F5F6EjWj6NFUMJE79ymU1LnxbY0fVu%2F91md%2BNAh8rQEmnkbI&X-Amz-Signature=2c787966ddc776bfbb5e3cb275e0f2dd7d54edb962563da70ef5f44f5ab34598&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666XEKMXVH%2F20250930%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20250930T122143Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGQaCXVzLXdlc3QtMiJHMEUCIQDbfYCbeXHYrlOM4u%2B9rtKAq7VPs1GZuBjsYgaHtjJnqQIgWg782XLUIz0pPZRq%2FAKO9sAtD2sW%2FF4797rv9Y2nbQ8qiAQI7f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDPBULq%2FYtHau1ZClZyrcA44Y2wHYa4lNxxY0Y6tyNbWdIGuXO2%2BBYXSkPVQ3bC9N17qVtNk1PytDulE5rufcN4DkkYrwtOQwkm8p%2BB0QohklVl4CjWnx%2BHYVbf2xZvVx048wOWY05UxRt8x1w4Go2hLMS9s4%2BhgqP2ZX1gXS9Cb36uydNZl2nkoVSHwxeOzkZGfmN93iO484tq6J8JRhR%2FLQS4HebDM15sR9MSbtPYPFj0EvsQnJ%2FIfcy8Rzu%2BDV9eb%2BRB5W6uo4C2eR283tmu75jE0CWP4SEvlFe%2Bx6e%2FwEmK%2Fb2lttiv70IKcdc%2FTEkMqaWqrWvx%2BpKtCytcrz91r6bVw6aDcHb5PAaDZKjT%2BB0R0kwLPB97bP1hwjdJIusJqmC%2B7C%2F604tHky5jfJ8rOpr7bGz24T7GU7ZsvUak98gi9uQiv7ddk5I0lB8B%2FS4gI5rynGqVHsaNJYKVAODJqCTncWz7JaqrwebRmnfs1LLhzZqd%2F57UX83qaMtBDHcwis2tWtTsLwyIjQU%2BrnmA04kCDGrBS6mCpLlkPTg0n8JOS9Q9ued27uRRt4GB%2FZiFap4D4KOFfATaaGqU70DaqLH1HyeOsHqRr5fepMTxFUwm1xi6FoWSBxeC%2BYec9YZp0NlkU9IzOEWlRjMLz%2F7sYGOqUB2SYsS3Se80izvpR4XFGLAtXt1wNNZ2z1uYBiW1%2FAgSscYAj79cYne0AYu%2B8gdwX3qmGcWF0ALDFtCDeWNF8QiZ809P8KK%2FMkv3fLpWbcpFv9JzxKiKJbotZMUDKXaQEhQBggpqV%2FHcJWoF8%2F8008Hc2xyX7Za%2F157z31RWYVCbVC%2F5F6EjWj6NFUMJE79ymU1LnxbY0fVu%2F91md%2BNAh8rQEmnkbI&X-Amz-Signature=07535cd9221a9b1ea4b68536f79803575b88b74869c3ec3e82cd2392bd2c7691&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
