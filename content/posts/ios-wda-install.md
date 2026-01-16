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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662YB5W5OK%2F20260116%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260116T005913Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHkaCXVzLXdlc3QtMiJHMEUCIEkufQbm%2B1TWMriJIN7g2JLPzgC2Tb%2F8Nbf45hScZ435AiEA%2B77w9FU6YZyAyGWqAEZLUhjnq804Fj3JvqEHwW9vhikq%2FwMIQhAAGgw2Mzc0MjMxODM4MDUiDLn9CMULxViZyaYi0SrcA3EN1YG8lTUQhPKmRi4BUHZUkGB%2FVMGsvQcdIVnx4%2F5ENif8dCApNphoB3LfvSAymvB3buaJZ2Son4ooAdj5RHMr4LP9Sl0L7VdLEjd1id5gbO1%2BLt8SCfZJmYFUzKICgbwnAmYOR8z%2Fyyh0zEfcWyS4HyUCG7PIfqzl6C5V2ndjeqzdRfp1C%2Bc5EOfkNw8PXxL%2BNOu66%2F0dStWmJxpTxQP5Mb4QKHxGlQzbMcNYM%2BubLQHHRQwecC%2BH7uPljdibk7FZ%2Fzpsu%2BWKAKHr74kkpk3rfZaTiEw7xSG4sI2UirjEbUhYzkfQvLTfem4%2FLZoLf21VTiUvswlSdGnYyP8ptM1z2zkMD%2B6cyWHz5TdbikY2xyF8863yAIuUAXtqA5qAyeOiJD%2BJyAp%2FtxxRhjl2bJd7UB88fifbqTYUX9URgUeOdJjHn928RQ42e3BGjZ7gUamGnD4mWrRnHCnGU32gPPudkcBmO%2B9p6rkgVccnn8iCwrZY1Z0aijmCcV9nDYRCm0qUjEPn4gpRrNXZJi3U737AbqaJnFJgo4FWko4HBQtpERRtfCj3MyCsCsBbXXI2u7BDzEkNM2hyP1P%2FUOR0C7dzrGxRR8cDlNgvdVa0yyLXbHMkZ7ReG4UFtdF2MM6XpssGOqUBTshDy9IOAzALSnGXD7Srq2qsnES2Li2%2BXDfTKJPHKv7Ek4PqG%2B%2FuuqmmPI7AvmZRZnZQV8r4QQJ0f7aCVZIJI2%2BO1AecW5ceAvbarJkGGQHrAaliOmGBnNGmmeaS9AQYZNzpXMVgO8yvx3VEvQ3sWXI%2FtfWSkCEdHJndRmuao%2B0iGOcIIkMpTSIQkh2ZBkHNrxYKHUcRyNAPAT44O%2BaaZ9sfvTVi&X-Amz-Signature=0bbda9b1c67c5128aeda1b40703b4af8b15f21a0b7dfa141724843eacface038&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662YB5W5OK%2F20260116%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260116T005913Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHkaCXVzLXdlc3QtMiJHMEUCIEkufQbm%2B1TWMriJIN7g2JLPzgC2Tb%2F8Nbf45hScZ435AiEA%2B77w9FU6YZyAyGWqAEZLUhjnq804Fj3JvqEHwW9vhikq%2FwMIQhAAGgw2Mzc0MjMxODM4MDUiDLn9CMULxViZyaYi0SrcA3EN1YG8lTUQhPKmRi4BUHZUkGB%2FVMGsvQcdIVnx4%2F5ENif8dCApNphoB3LfvSAymvB3buaJZ2Son4ooAdj5RHMr4LP9Sl0L7VdLEjd1id5gbO1%2BLt8SCfZJmYFUzKICgbwnAmYOR8z%2Fyyh0zEfcWyS4HyUCG7PIfqzl6C5V2ndjeqzdRfp1C%2Bc5EOfkNw8PXxL%2BNOu66%2F0dStWmJxpTxQP5Mb4QKHxGlQzbMcNYM%2BubLQHHRQwecC%2BH7uPljdibk7FZ%2Fzpsu%2BWKAKHr74kkpk3rfZaTiEw7xSG4sI2UirjEbUhYzkfQvLTfem4%2FLZoLf21VTiUvswlSdGnYyP8ptM1z2zkMD%2B6cyWHz5TdbikY2xyF8863yAIuUAXtqA5qAyeOiJD%2BJyAp%2FtxxRhjl2bJd7UB88fifbqTYUX9URgUeOdJjHn928RQ42e3BGjZ7gUamGnD4mWrRnHCnGU32gPPudkcBmO%2B9p6rkgVccnn8iCwrZY1Z0aijmCcV9nDYRCm0qUjEPn4gpRrNXZJi3U737AbqaJnFJgo4FWko4HBQtpERRtfCj3MyCsCsBbXXI2u7BDzEkNM2hyP1P%2FUOR0C7dzrGxRR8cDlNgvdVa0yyLXbHMkZ7ReG4UFtdF2MM6XpssGOqUBTshDy9IOAzALSnGXD7Srq2qsnES2Li2%2BXDfTKJPHKv7Ek4PqG%2B%2FuuqmmPI7AvmZRZnZQV8r4QQJ0f7aCVZIJI2%2BO1AecW5ceAvbarJkGGQHrAaliOmGBnNGmmeaS9AQYZNzpXMVgO8yvx3VEvQ3sWXI%2FtfWSkCEdHJndRmuao%2B0iGOcIIkMpTSIQkh2ZBkHNrxYKHUcRyNAPAT44O%2BaaZ9sfvTVi&X-Amz-Signature=e1c6a07f9d5dd8f55ff324727d528e1a53e279d6419b7c100ea8bd2bcc8f38c3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
