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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466R4JLLYW3%2F20251216%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251216T061918Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIAyYPrH3nx7chsRyZ1pyyA%2Fgf%2BxK%2FT0zy4sp%2FhFg9apTAiEAzjiuFaiNTYjILohcfMpBcBIOyXL%2B%2FP4q6ACWypsSNX0q%2FwMIXxAAGgw2Mzc0MjMxODM4MDUiDPgF8xtzGyHLgC58ySrcA%2FwWcEplZ4aFqDB%2BaQ7nWCV3zOXIFUiBMehYD8o8SrC7gaRVsUDqgZOgdaeJlGyGbKY%2BBCjwfWk4w%2B95Jo436wFFtHHce8PQmx1Ra4UUp5MP%2B8kJWMD81Uubs6uz3vVMFUKittf5z1mvDxRziJXzOzs2ixn%2F3KpN3ikBmI7YMpi8afpkiRb67cCtRgFaVd0YwF5iAk3oKkqHF3cT5cPqVlc2m6E6foXQXufVNY7wOzBILk5uxyvNFUl5cJtjcD6VsLDJ3TQmztvys5leH9AlLHs6UxoDaclp7nbKyDOR7QUoLUQMUzZXLAUMkW3KjqAZvAe%2BgKUvm%2B8d94GLkzt2oJLIY6hWJBYiv1DmTxHSjPVHx9yqDCbMlXGXsARW%2FfJGgzg%2FY0I%2Be%2FJ%2FXlunTPxeVvLPC0FXZlhg7oSLQZhyGCyFVp5B7VhMGeE6JS6McmMLkywo0T8O6P6e%2FpdRSuhtZthdQflmimG85KkZr4MELFcBEu9u4njEabUV4PGCiT4HUJc%2B1hCJkysBC%2BQcsCs2WmE2MeUaby8%2B3eeOBYTJurKiTuhbfqh0wiw6%2FLKzNMtVZ7jXtzZDMt7bsDXhR6VT9XcmxzpzqaLd0FImqYbotRNxK%2BJzNXBy9LGrdDzZMPblg8oGOqUBm44OAOq9X2JKX9cugs9Jpl%2F3AxlO%2BAxDUa03r%2FklFGmO5bTDY%2FAwriCSSjxrpEvzvhSvmnN0dqHhtzTqBitp6i7Swe31G13MNnsCNRht%2Fb1TIfRekvcgaTAh%2FNRK7BEFDVhbl9ViomiIUe2EyoHGGk6tKdBlnRmz5br2YA25eFRZ4DuQ1p%2BxzI%2F0gCwju78xbMaCtrULP%2Fp8O035RJc8Aw2j6pMn&X-Amz-Signature=a6723670985bf84c0984332ccc14316ea552040f0e172f1829dd0b8fe4eed9ed&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466R4JLLYW3%2F20251216%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251216T061918Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIAyYPrH3nx7chsRyZ1pyyA%2Fgf%2BxK%2FT0zy4sp%2FhFg9apTAiEAzjiuFaiNTYjILohcfMpBcBIOyXL%2B%2FP4q6ACWypsSNX0q%2FwMIXxAAGgw2Mzc0MjMxODM4MDUiDPgF8xtzGyHLgC58ySrcA%2FwWcEplZ4aFqDB%2BaQ7nWCV3zOXIFUiBMehYD8o8SrC7gaRVsUDqgZOgdaeJlGyGbKY%2BBCjwfWk4w%2B95Jo436wFFtHHce8PQmx1Ra4UUp5MP%2B8kJWMD81Uubs6uz3vVMFUKittf5z1mvDxRziJXzOzs2ixn%2F3KpN3ikBmI7YMpi8afpkiRb67cCtRgFaVd0YwF5iAk3oKkqHF3cT5cPqVlc2m6E6foXQXufVNY7wOzBILk5uxyvNFUl5cJtjcD6VsLDJ3TQmztvys5leH9AlLHs6UxoDaclp7nbKyDOR7QUoLUQMUzZXLAUMkW3KjqAZvAe%2BgKUvm%2B8d94GLkzt2oJLIY6hWJBYiv1DmTxHSjPVHx9yqDCbMlXGXsARW%2FfJGgzg%2FY0I%2Be%2FJ%2FXlunTPxeVvLPC0FXZlhg7oSLQZhyGCyFVp5B7VhMGeE6JS6McmMLkywo0T8O6P6e%2FpdRSuhtZthdQflmimG85KkZr4MELFcBEu9u4njEabUV4PGCiT4HUJc%2B1hCJkysBC%2BQcsCs2WmE2MeUaby8%2B3eeOBYTJurKiTuhbfqh0wiw6%2FLKzNMtVZ7jXtzZDMt7bsDXhR6VT9XcmxzpzqaLd0FImqYbotRNxK%2BJzNXBy9LGrdDzZMPblg8oGOqUBm44OAOq9X2JKX9cugs9Jpl%2F3AxlO%2BAxDUa03r%2FklFGmO5bTDY%2FAwriCSSjxrpEvzvhSvmnN0dqHhtzTqBitp6i7Swe31G13MNnsCNRht%2Fb1TIfRekvcgaTAh%2FNRK7BEFDVhbl9ViomiIUe2EyoHGGk6tKdBlnRmz5br2YA25eFRZ4DuQ1p%2BxzI%2F0gCwju78xbMaCtrULP%2Fp8O035RJc8Aw2j6pMn&X-Amz-Signature=538041e9782f4c399d988c24c4623035bad2cc14449fd5c4d41d84b75b946be3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
