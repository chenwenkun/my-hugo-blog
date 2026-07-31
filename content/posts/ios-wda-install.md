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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VYMCRRDJ%2F20260731%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260731T083200Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIDRqox7wGTQlJaJ18cgI8h0nh%2BhIEfWI6YmYI2B3BijKAiEA08VY%2BV%2Fy0Nbv8swWGJBJkc89X3Fxf0dnZ6VsxStCc38qiAQIqv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDPD6KfYhMedp6Sq2xircA8mOQMbDS%2FOgDXivcOCy8lBoRnawmD5iO%2FgrlsGQCSrhPmGT8QsDDJ5wYVrcA4pjKeNrHX8WlNwSMCQ22XiTNHV7%2B7VkbZ52SsbXpUSuzaBaToxKkLEp1IAXUUVc56gUuuCenJJKUN9bLkkfe8kPu8OK530T%2BbVXjZRaiDwlTxT78Y6K5H4eOw8WZCv%2BUJCJKjRynhSCR7xFukqiFw9nJ1c7Ef%2FH87xulfQO1he4vnfcN2YW9gdH2tOqFFVEGOvOwt2FtYaojtu%2Bf66dVG5VJkpeKq57DSEbb4Pt9o2UBScHDMnHeOTFjQ0vlFiozFcuhthD04trIo2JLPEasmHy%2BtQIkdBwu3GU8ut5zJarKLZLQGkXHgsWvy6%2FgyNZLMAG6wIng6E5s7iYlcqrwIj%2FxC4fo2TRLZ81Dj5njdE48gK6Q0nQU73EFS1IujSTyL%2Fwjs0kxlGobaj%2BeDj3y1r5MkXNp%2BN9IDr%2FTzgWKHmWLvXfOwdAwLPZCcacj7L16fBpNr2e%2F5oOmGueVEBFPQThIKJYhun2pm5QOyobRzLLcWrY1U1AFtq9HqIqJ5iSwdHuc%2Bkksg%2FkCQC87ZcgvTr2I5JucIAl%2B6PSrn8pRjrnt775vQfP3oG4tfM8yRzEMPy4sdMGOqUBsfPVRgb2OmmrDXcqmKwpkP%2BttViliyv0G2SaRvVf41gEQwZOLNaSGR37LVmYfuQMkp61ew%2FvA1ujyxSSCZLG2ClvQu%2BE7FTjjqVUZAAtEzyMv2hb8uYQgt%2FnLnIb%2FdFunLvfrh0SPez%2BQDo1OP1X2bUMBcHzLqsH1b%2Fq5GtM%2FHXl6kbYRyH2P6MW%2F9%2FORsFavB80yYah2xPdX9%2BBfqZs7XihkeXv&X-Amz-Signature=a3a340af3c4037f47e7e287f078ab5ab006ea7ab7f9d355e0d89bc7306ba4584&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VYMCRRDJ%2F20260731%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260731T083200Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIDRqox7wGTQlJaJ18cgI8h0nh%2BhIEfWI6YmYI2B3BijKAiEA08VY%2BV%2Fy0Nbv8swWGJBJkc89X3Fxf0dnZ6VsxStCc38qiAQIqv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDPD6KfYhMedp6Sq2xircA8mOQMbDS%2FOgDXivcOCy8lBoRnawmD5iO%2FgrlsGQCSrhPmGT8QsDDJ5wYVrcA4pjKeNrHX8WlNwSMCQ22XiTNHV7%2B7VkbZ52SsbXpUSuzaBaToxKkLEp1IAXUUVc56gUuuCenJJKUN9bLkkfe8kPu8OK530T%2BbVXjZRaiDwlTxT78Y6K5H4eOw8WZCv%2BUJCJKjRynhSCR7xFukqiFw9nJ1c7Ef%2FH87xulfQO1he4vnfcN2YW9gdH2tOqFFVEGOvOwt2FtYaojtu%2Bf66dVG5VJkpeKq57DSEbb4Pt9o2UBScHDMnHeOTFjQ0vlFiozFcuhthD04trIo2JLPEasmHy%2BtQIkdBwu3GU8ut5zJarKLZLQGkXHgsWvy6%2FgyNZLMAG6wIng6E5s7iYlcqrwIj%2FxC4fo2TRLZ81Dj5njdE48gK6Q0nQU73EFS1IujSTyL%2Fwjs0kxlGobaj%2BeDj3y1r5MkXNp%2BN9IDr%2FTzgWKHmWLvXfOwdAwLPZCcacj7L16fBpNr2e%2F5oOmGueVEBFPQThIKJYhun2pm5QOyobRzLLcWrY1U1AFtq9HqIqJ5iSwdHuc%2Bkksg%2FkCQC87ZcgvTr2I5JucIAl%2B6PSrn8pRjrnt775vQfP3oG4tfM8yRzEMPy4sdMGOqUBsfPVRgb2OmmrDXcqmKwpkP%2BttViliyv0G2SaRvVf41gEQwZOLNaSGR37LVmYfuQMkp61ew%2FvA1ujyxSSCZLG2ClvQu%2BE7FTjjqVUZAAtEzyMv2hb8uYQgt%2FnLnIb%2FdFunLvfrh0SPez%2BQDo1OP1X2bUMBcHzLqsH1b%2Fq5GtM%2FHXl6kbYRyH2P6MW%2F9%2FORsFavB80yYah2xPdX9%2BBfqZs7XihkeXv&X-Amz-Signature=c3f0c428003eeea12fa42861735ed9e6d54513b33e42c385355644b422b87308&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
