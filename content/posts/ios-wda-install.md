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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RDHHXQAN%2F20260303%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260303T123339Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBRWPKKVSaDU9dsxDyBGRHojoaW6SKc0npR4yjfsS1dVAiEAuKq7AX8Pa6PfVDk%2FWXPgRJEqswE1btXpe1n7HYgom6wqiAQInP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDH73yDLoQok7LiJOkCrcA7PGzR52gg67TB9qDSb040Zwjr2BWInzddprio1lYvF%2FFxae5556z3pI98jYGHkbqK%2F58DtAHsWdZn5HxqodDkB11F%2BagMnItCaNiDmr5OvQflvxDAkE74nf9izHD6gY3oVgKO3z%2Bj7l%2Fix6z%2BjPmGsBOIAC9GfCbXAolQLrTs0OVJdms9R5MYqgtFJ7yLKkbVwOAySHaBNUZldITjhVsWoFQU09%2BPF5A2ff5C2br31yG9gowCKJZ%2BwRUvyJS7sp1%2F5cR4YAnQqJUFdhRjsCB28vGJuCRjT8E1LV7q7ycMAtszp57xCk4vMl7CreTiZRoSXe%2FHHzQ42NlY%2Bm1jahz3LSOxW5VBpecio5%2F%2BrkeTFpdQ%2Fy%2FCe0esgQ5UUyC5q7MEvseJBpQT5GGkIGwa28p%2BUGOFURLfbHMOipFqPWB4%2FLFpO%2FlF735IrwTrDuW%2BCdrbxPe7PC0Yp2UiqCGyNkMBkypVasuA9lAUfLFaVN1cfdDYGHk9XS0VBRc%2BCwrezoG34Lh70EHfwyhh4BOADsEa5vtg71g40qZtEMk4dyhiIZ6sN5xyYCCbYrBRHe5gRMG9NuPoW7ts3jqiL%2FU7ycIEOlZlKGzjBM06c5MyS%2BJ%2BnBQYp4As%2BkgsLySf05MP6Em80GOqUBhbeOIZUGCM89bdBfDLhlGRrQHeitRMQXSEURcBtR8Ze83yP5IfINRK8pDvx2r8ZP2VjKxWGIwQpFhkxkM%2FU6I61KIfW1i%2F9QxjIPkRtgG2x3rq1VEJ3mXGno%2Fx5HlRqQ4sAwUlczINVc9CKOpjwUMbhYXPVE5M21xK8E5PkMVqkjfdygTwp3jREsOqWFWFE54pWu3hgpJEHXxGYhvDn7OExlJrdR&X-Amz-Signature=fc9e725225f0efedafa23d54173a7111c26bbca15c3693e04e25a11a98e9d05f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RDHHXQAN%2F20260303%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260303T123339Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBRWPKKVSaDU9dsxDyBGRHojoaW6SKc0npR4yjfsS1dVAiEAuKq7AX8Pa6PfVDk%2FWXPgRJEqswE1btXpe1n7HYgom6wqiAQInP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDH73yDLoQok7LiJOkCrcA7PGzR52gg67TB9qDSb040Zwjr2BWInzddprio1lYvF%2FFxae5556z3pI98jYGHkbqK%2F58DtAHsWdZn5HxqodDkB11F%2BagMnItCaNiDmr5OvQflvxDAkE74nf9izHD6gY3oVgKO3z%2Bj7l%2Fix6z%2BjPmGsBOIAC9GfCbXAolQLrTs0OVJdms9R5MYqgtFJ7yLKkbVwOAySHaBNUZldITjhVsWoFQU09%2BPF5A2ff5C2br31yG9gowCKJZ%2BwRUvyJS7sp1%2F5cR4YAnQqJUFdhRjsCB28vGJuCRjT8E1LV7q7ycMAtszp57xCk4vMl7CreTiZRoSXe%2FHHzQ42NlY%2Bm1jahz3LSOxW5VBpecio5%2F%2BrkeTFpdQ%2Fy%2FCe0esgQ5UUyC5q7MEvseJBpQT5GGkIGwa28p%2BUGOFURLfbHMOipFqPWB4%2FLFpO%2FlF735IrwTrDuW%2BCdrbxPe7PC0Yp2UiqCGyNkMBkypVasuA9lAUfLFaVN1cfdDYGHk9XS0VBRc%2BCwrezoG34Lh70EHfwyhh4BOADsEa5vtg71g40qZtEMk4dyhiIZ6sN5xyYCCbYrBRHe5gRMG9NuPoW7ts3jqiL%2FU7ycIEOlZlKGzjBM06c5MyS%2BJ%2BnBQYp4As%2BkgsLySf05MP6Em80GOqUBhbeOIZUGCM89bdBfDLhlGRrQHeitRMQXSEURcBtR8Ze83yP5IfINRK8pDvx2r8ZP2VjKxWGIwQpFhkxkM%2FU6I61KIfW1i%2F9QxjIPkRtgG2x3rq1VEJ3mXGno%2Fx5HlRqQ4sAwUlczINVc9CKOpjwUMbhYXPVE5M21xK8E5PkMVqkjfdygTwp3jREsOqWFWFE54pWu3hgpJEHXxGYhvDn7OExlJrdR&X-Amz-Signature=8422047aef45dc3f7a17b278332940d35da8113f4894b5cd747906e449896db4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
