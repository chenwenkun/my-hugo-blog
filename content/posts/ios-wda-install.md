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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RFYLC346%2F20251005%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251005T121803Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIGZ8zFXM3kkNKQ5O0LWNx%2B%2B5ASUYuy7pnT68G5m1UUfxAiEA5yoOE0eZghLhIHAkbQHQeVPJBZas%2B651L7iVdak1TP0q%2FwMIdRAAGgw2Mzc0MjMxODM4MDUiDOvtsUnr3WqM%2Bj4pmircAy0UPaVpCojwVASFqv%2BNg1zaKpYh0utpfwMnmL0d0WYMnWglXsvj7ZlSPfVrZcPkudKrYX4g4qGvUBmLen0Du3%2BDtRxvUkyUHjNIddT2i87ARBQ2SjQtwchn4DNu2%2F6WMamXBdijczu%2Fd80eq3sGmEfx2X6nf8maZ0Wh6O3CXSU9TncuRmOPg3aEPdLD59MfMJhMjx1eDfheBt%2BCa060bzExYRBbVBp9ZGVT0q2AOg5hMCHcj38nBNh5zqE8i4W5CX3UzzOEuLw5TlKgEmixn86re6%2FiyAqPfRjCr5XpTRE3R8xChixenLcEUCXwAJe9fmDJq4xTh%2FcMivJbMozN0ZZvufw9CWNwmPd%2BVFCnxW3vG4vmpcUvZgaSteVJzNOH8q0A6f4eAtkfTUMWWT1V6bvEZ%2BeRP%2FmCh4qi2pnixjy1aROYp2ULZQE12b3zQD3q8be8xt7JFJaUD4sonPo3%2BB2Ted2Z0TvOHGEe3E74wD7evgogIgh8yMf3CJbWC1D3HtyXHE25zWdu4xOPuz4XyiEOYjtP4pSAbHX4DbcPajREz4u8awOYDH3FDbmURhKY1cDVjaCEPmMSJER%2BjYt7EGLPCaNw4SN%2FeZKOWa%2Bg9VHMIn7gk8CbWnqNJZnpMOK%2FiccGOqUB4Yu6wwEXCFdpl9lhL4udm9t1OlGt2U52gbsqDzyTmi5z43YsrAkjhd7AdVrlHjOUSOrPtyqy%2BEhmkknWC1N5gsjk3srYPuqn%2FMlrzIWrKTQjAWEHPB3BvuA0EzKNHvX87F52g%2BATC9Bq%2BNb86eVjQmMs%2BUhCABdFHjmHmVzbnGGDKM%2FomG4FdXoyh6C8VzPUMdY70nqy%2Bx60bnvaaUjy1R1rzAxs&X-Amz-Signature=eb5dafaaed907b232b9742c1791f26fe1fd31e57a4a3b454010daecea569dfeb&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RFYLC346%2F20251005%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251005T121803Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIGZ8zFXM3kkNKQ5O0LWNx%2B%2B5ASUYuy7pnT68G5m1UUfxAiEA5yoOE0eZghLhIHAkbQHQeVPJBZas%2B651L7iVdak1TP0q%2FwMIdRAAGgw2Mzc0MjMxODM4MDUiDOvtsUnr3WqM%2Bj4pmircAy0UPaVpCojwVASFqv%2BNg1zaKpYh0utpfwMnmL0d0WYMnWglXsvj7ZlSPfVrZcPkudKrYX4g4qGvUBmLen0Du3%2BDtRxvUkyUHjNIddT2i87ARBQ2SjQtwchn4DNu2%2F6WMamXBdijczu%2Fd80eq3sGmEfx2X6nf8maZ0Wh6O3CXSU9TncuRmOPg3aEPdLD59MfMJhMjx1eDfheBt%2BCa060bzExYRBbVBp9ZGVT0q2AOg5hMCHcj38nBNh5zqE8i4W5CX3UzzOEuLw5TlKgEmixn86re6%2FiyAqPfRjCr5XpTRE3R8xChixenLcEUCXwAJe9fmDJq4xTh%2FcMivJbMozN0ZZvufw9CWNwmPd%2BVFCnxW3vG4vmpcUvZgaSteVJzNOH8q0A6f4eAtkfTUMWWT1V6bvEZ%2BeRP%2FmCh4qi2pnixjy1aROYp2ULZQE12b3zQD3q8be8xt7JFJaUD4sonPo3%2BB2Ted2Z0TvOHGEe3E74wD7evgogIgh8yMf3CJbWC1D3HtyXHE25zWdu4xOPuz4XyiEOYjtP4pSAbHX4DbcPajREz4u8awOYDH3FDbmURhKY1cDVjaCEPmMSJER%2BjYt7EGLPCaNw4SN%2FeZKOWa%2Bg9VHMIn7gk8CbWnqNJZnpMOK%2FiccGOqUB4Yu6wwEXCFdpl9lhL4udm9t1OlGt2U52gbsqDzyTmi5z43YsrAkjhd7AdVrlHjOUSOrPtyqy%2BEhmkknWC1N5gsjk3srYPuqn%2FMlrzIWrKTQjAWEHPB3BvuA0EzKNHvX87F52g%2BATC9Bq%2BNb86eVjQmMs%2BUhCABdFHjmHmVzbnGGDKM%2FomG4FdXoyh6C8VzPUMdY70nqy%2Bx60bnvaaUjy1R1rzAxs&X-Amz-Signature=007fe42d2edbe68aecd117b2c0ad9ba5f2fd45e4ed4e59761b38b5f56e413dce&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
