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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665XPACJBF%2F20260408%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260408T125627Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDUaCXVzLXdlc3QtMiJHMEUCIAfl5nv62xU9dMqcO%2FKlB%2B%2BKZS8p9f8l7JrmxoQuy2qEAiEA7ZrfEduOjDPiVBhoQ%2FIg4ii7vXqAR1xNH0oYJOFcJvgqiAQI%2Fv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDM5K14yuF3fs7RMzRircA9agH%2BTXXSDxiFfLkVfdon6%2B36mFdYK0QD%2FepG%2BWYmgZMGVXHGYvPEfnof%2FSi1AFzqgx%2BmY2WfuByzkHtB0%2FFRXRzrXEYkZcnr5aoPXMbfj958LHr2NGxID7LAFZZfKcbS%2BAMyk0xFAtSuwOHwsQmIZRqX3HDJLBHbb2Hb6gYw%2Fy%2BSIUkFUOBHXH2HAeQRCnYv4o7L%2F45XeCgJ%2BfbvIBd6qhNmm23fezg%2Fg9%2B4nRGHFQL7w9kB%2FqF6%2B6GtQYmNxlOdjeh1q2%2F9jouAD%2Fqur2zC2zlYpM9P41Mednc31dkeBiNE%2BO%2FmK1mHxJrhs6o4VXmHYVaBd2Xmfp6K4Ah5rz686Uj%2B3Sz4a9C2xm3eec1PcyzsMtZ6eNZwgkkuiNoegPPMqqkL4oOddLVR1VwtivtVF7Dw9SMwijkWZd4wUwd6v8tg31fq09nyBJ8k7IDcP4Ptvz617ggi4jaJWgr5SYs1ozQYddDWzEkxDOPDkMtNAzUgwFrPLW%2B%2BGTKCoPiicdOkIYMjCxiflXMNzUD3pUX3Ghb%2FWog8R7Lu8JxQZkA77ZUFzFRWmsYk%2FZgSyxEU%2BJINxueU%2FEdgA8MWbL0dJGidKxwRtcvgg8oJqclX%2FlVPIomBrmK8xM7yNShtmKMN%2BY2c4GOqUBZhOluUQ3OzuAq20FKOkQHYEfwEoXM3ee4%2BzOf5PQ%2BO9y4sNMe6f0WcGrh4rkqBMKCisulq2QzBCmIb%2FCnQa9ok5GxfjedKxZ%2FZ8%2BWLZZTntfPi0QI99RERLEYzUrKpNLVaDkB35XFybUq%2FfCZcsSzwcgHgm6G%2FcE5mVA5VIHeA61d7%2BSo%2FDMzL%2Bl4yexomeBREMEwu9AdDVcsz2XQ7yw50ZtYrbh&X-Amz-Signature=7fc6855c25d4f4ee1217a297116fb28d1a623722547b9eb28734a67cbdd16c53&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665XPACJBF%2F20260408%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260408T125627Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDUaCXVzLXdlc3QtMiJHMEUCIAfl5nv62xU9dMqcO%2FKlB%2B%2BKZS8p9f8l7JrmxoQuy2qEAiEA7ZrfEduOjDPiVBhoQ%2FIg4ii7vXqAR1xNH0oYJOFcJvgqiAQI%2Fv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDM5K14yuF3fs7RMzRircA9agH%2BTXXSDxiFfLkVfdon6%2B36mFdYK0QD%2FepG%2BWYmgZMGVXHGYvPEfnof%2FSi1AFzqgx%2BmY2WfuByzkHtB0%2FFRXRzrXEYkZcnr5aoPXMbfj958LHr2NGxID7LAFZZfKcbS%2BAMyk0xFAtSuwOHwsQmIZRqX3HDJLBHbb2Hb6gYw%2Fy%2BSIUkFUOBHXH2HAeQRCnYv4o7L%2F45XeCgJ%2BfbvIBd6qhNmm23fezg%2Fg9%2B4nRGHFQL7w9kB%2FqF6%2B6GtQYmNxlOdjeh1q2%2F9jouAD%2Fqur2zC2zlYpM9P41Mednc31dkeBiNE%2BO%2FmK1mHxJrhs6o4VXmHYVaBd2Xmfp6K4Ah5rz686Uj%2B3Sz4a9C2xm3eec1PcyzsMtZ6eNZwgkkuiNoegPPMqqkL4oOddLVR1VwtivtVF7Dw9SMwijkWZd4wUwd6v8tg31fq09nyBJ8k7IDcP4Ptvz617ggi4jaJWgr5SYs1ozQYddDWzEkxDOPDkMtNAzUgwFrPLW%2B%2BGTKCoPiicdOkIYMjCxiflXMNzUD3pUX3Ghb%2FWog8R7Lu8JxQZkA77ZUFzFRWmsYk%2FZgSyxEU%2BJINxueU%2FEdgA8MWbL0dJGidKxwRtcvgg8oJqclX%2FlVPIomBrmK8xM7yNShtmKMN%2BY2c4GOqUBZhOluUQ3OzuAq20FKOkQHYEfwEoXM3ee4%2BzOf5PQ%2BO9y4sNMe6f0WcGrh4rkqBMKCisulq2QzBCmIb%2FCnQa9ok5GxfjedKxZ%2FZ8%2BWLZZTntfPi0QI99RERLEYzUrKpNLVaDkB35XFybUq%2FfCZcsSzwcgHgm6G%2FcE5mVA5VIHeA61d7%2BSo%2FDMzL%2Bl4yexomeBREMEwu9AdDVcsz2XQ7yw50ZtYrbh&X-Amz-Signature=96b2f677a052c0a13193b18b1cd479a99ec8558eb12adcbc126ff35952e44013&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
