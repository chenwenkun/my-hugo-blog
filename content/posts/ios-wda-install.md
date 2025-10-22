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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SNCLGBEQ%2F20251022%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251022T181708Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHoaCXVzLXdlc3QtMiJHMEUCIQDDDgPdXWWJeQsgKRYGWiniFXx%2BKyjD9qPz3zb%2FhO6YpQIgL%2FJbmr2IXYqAHauwJdLToLSokoDd82JAfEsyyFE%2BCbAq%2FwMIMxAAGgw2Mzc0MjMxODM4MDUiDBWf4L7uGAFhLorx%2FSrcA530UZ8NP2XkbE9AoNm0Gqu1WiQuVfIOqLhrwbuTHAR3kJxy4X2fKiP81Im6aaLV50%2BV6kHmi%2BVMlUOZ97iVXc7IXsntkSsNven70d6QtRXDITC1H6Fh4DQoArzI%2BjrgQ5jJZ056nyb9JmL509ludAYHmFtYh9gdPwBuMF4f1V9TrQhZsa%2FS4eaVFGCvCTSx6wSnnzvRuD%2BBUD64WpvO6ZzXCLHqTGbAHkfllCayBGUz%2BLrRrHmNbqjAB5sPMCvkvd6KOaoM%2Fwc9ZxgRodC2GxoUQFKElMf2c2V9%2Few%2Bzufm2Og0rfPt5Sr%2Bo5FMq64jv85HglkaOdCxSnTQ%2FdADbgqidsTQZnYhFvOLd93om8g8Q7QK6hpJ9YxcftVTxCK41gAbYHS3CzqTr3k1r7%2F%2FCmrJ1pfFj7ET%2BxgScohDKdBVcM6YdHZYoIo4dOtkaQ9INm%2FiDIdJ36hrfgDBWru5og0jMHGzUdnUQMR35vJtFNIZXQvjv%2BytNGKWVZTnVY%2Fcb8Ty4THn5jZT8MxI1H%2FITouXpYnXl6SKtBsQHulhhJKeQbWmCsrvisBVqS9lXiil2xk4y2t0HPzXIVcHM09uQ%2BVUCj0mOU7k%2BrkGlJgD4XvmHy2vks%2BEBdbSSVMpMOet5McGOqUBkdMLp0Vu4pd5VbTEELc%2FM7wk8lB32eQc6ipoWe4r2o%2BNWt0Jr7J%2FzFa%2BTmEinPfNM5ACxpiigx5sTSrpkotrV6qOtK%2BxJ2XoePL9UvujQlXs2jg2BGcXmM%2FoeNdLs3B8RQC%2FZu3z%2FqMivrCSAuGvVvps3mBjBXISTiI9HVkVzuaUipd4LgCbBCoYKhDw2E9KvlgDwwJH4TJrA7Z7l6YarcWRH1Cc&X-Amz-Signature=4972f9483b0c4ae1c14a86720880e253d402f36701bf5e2ebd714a40bc890640&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SNCLGBEQ%2F20251022%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251022T181708Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHoaCXVzLXdlc3QtMiJHMEUCIQDDDgPdXWWJeQsgKRYGWiniFXx%2BKyjD9qPz3zb%2FhO6YpQIgL%2FJbmr2IXYqAHauwJdLToLSokoDd82JAfEsyyFE%2BCbAq%2FwMIMxAAGgw2Mzc0MjMxODM4MDUiDBWf4L7uGAFhLorx%2FSrcA530UZ8NP2XkbE9AoNm0Gqu1WiQuVfIOqLhrwbuTHAR3kJxy4X2fKiP81Im6aaLV50%2BV6kHmi%2BVMlUOZ97iVXc7IXsntkSsNven70d6QtRXDITC1H6Fh4DQoArzI%2BjrgQ5jJZ056nyb9JmL509ludAYHmFtYh9gdPwBuMF4f1V9TrQhZsa%2FS4eaVFGCvCTSx6wSnnzvRuD%2BBUD64WpvO6ZzXCLHqTGbAHkfllCayBGUz%2BLrRrHmNbqjAB5sPMCvkvd6KOaoM%2Fwc9ZxgRodC2GxoUQFKElMf2c2V9%2Few%2Bzufm2Og0rfPt5Sr%2Bo5FMq64jv85HglkaOdCxSnTQ%2FdADbgqidsTQZnYhFvOLd93om8g8Q7QK6hpJ9YxcftVTxCK41gAbYHS3CzqTr3k1r7%2F%2FCmrJ1pfFj7ET%2BxgScohDKdBVcM6YdHZYoIo4dOtkaQ9INm%2FiDIdJ36hrfgDBWru5og0jMHGzUdnUQMR35vJtFNIZXQvjv%2BytNGKWVZTnVY%2Fcb8Ty4THn5jZT8MxI1H%2FITouXpYnXl6SKtBsQHulhhJKeQbWmCsrvisBVqS9lXiil2xk4y2t0HPzXIVcHM09uQ%2BVUCj0mOU7k%2BrkGlJgD4XvmHy2vks%2BEBdbSSVMpMOet5McGOqUBkdMLp0Vu4pd5VbTEELc%2FM7wk8lB32eQc6ipoWe4r2o%2BNWt0Jr7J%2FzFa%2BTmEinPfNM5ACxpiigx5sTSrpkotrV6qOtK%2BxJ2XoePL9UvujQlXs2jg2BGcXmM%2FoeNdLs3B8RQC%2FZu3z%2FqMivrCSAuGvVvps3mBjBXISTiI9HVkVzuaUipd4LgCbBCoYKhDw2E9KvlgDwwJH4TJrA7Z7l6YarcWRH1Cc&X-Amz-Signature=e863948222e427f53583ae860f25908a775516db97812a3bd731e4c92b58095d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
