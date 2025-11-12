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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664SMZEOYY%2F20251112%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251112T122213Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGwaCXVzLXdlc3QtMiJIMEYCIQCnljbyc7tvLkTMXIJhKPigNzlItMlOQ0CffyDUfMg7SwIhAIH%2BBelMdkwDfbNWvXMkdXcUqFFncfeHHjbokwr6ThtfKv8DCDUQABoMNjM3NDIzMTgzODA1IgwZ4mNd7A%2BEqyPRjb8q3APY9Bv7FRsfoyQjVG2GAVR7BraNY5jJgCSKfIPyicOXiX2sIusKpfkoQziTjzVgt4E8mz4vX2UmFvsktri2k1bU3lPPT2R1vw9I7MtTJwoLpcmiujbtJE%2Bs%2B21xqpymRQ037hLdvdmFLVztiAJir8GPsWoY9D%2B5tbGgzqu1HFh2aVZhMgM3u8OLY8puATlgdB1I7rqAS1cvjC7w9Rz6nVRmgMrOP5sUEd7wEZekHBId%2Bf42frUYv%2BAUc3%2Fros2lnw9xAM%2BY%2FY%2Bwa2gnQAPhYeG9Rsb6GLjtihZVju2x12fIHQFVTjiM3AwOz35Z0eaC4O7CRftkAsIxYkiGQqlQXCs1eDjhDtsQ3eruCK6qQm752cB7H3MdmdrA5uk1A5IoYg7vj3L35PprFOxSxmTHlxG6GXRo2D21jG5HRvYuRPYWua0yHKq3hXVXB%2BKqQPXmEDTzWorlHAB9iEwbmMb65t0SPuiP9%2FM883JR36puI2xZPtv5vREBcNinm2W3q0gNor48b5%2F0b8x56%2FW%2BXEkFtDO8EYC8yHmMEVe%2Bd6kYa8KK46YeAo0IQOCSOrATDcH0r8SW8lnwACHp1VVrszwKTUDKMFiOWC2D%2BF6UJh7Jxv%2FWRpLdTgbvr2KonphmajCS59HIBjqkAbPMVpoN1GQ6eFcyFy2J0%2FWAyjYNQmd7Mh5DjatWdeIfPFxwWtS9cGEXaIi1vbIEKSX2TTvicPMIixURstPYClIN2kXYJ1wgF1pgIMd5dTihadYpLx4dMPW109nFTwlzmMp4xusURbzr3Xh0pD58r%2BMorj7n1t7n5sM%2BUrLgHQP0LGvhQ7J8dCXnCoOmTp0Q4ja2F9yDU5sNvbwH60tcvM83P8zi&X-Amz-Signature=1f6c1c222d4710d6d4c3785886613bed8327e6266754006e216bd5638453771b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664SMZEOYY%2F20251112%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251112T122213Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGwaCXVzLXdlc3QtMiJIMEYCIQCnljbyc7tvLkTMXIJhKPigNzlItMlOQ0CffyDUfMg7SwIhAIH%2BBelMdkwDfbNWvXMkdXcUqFFncfeHHjbokwr6ThtfKv8DCDUQABoMNjM3NDIzMTgzODA1IgwZ4mNd7A%2BEqyPRjb8q3APY9Bv7FRsfoyQjVG2GAVR7BraNY5jJgCSKfIPyicOXiX2sIusKpfkoQziTjzVgt4E8mz4vX2UmFvsktri2k1bU3lPPT2R1vw9I7MtTJwoLpcmiujbtJE%2Bs%2B21xqpymRQ037hLdvdmFLVztiAJir8GPsWoY9D%2B5tbGgzqu1HFh2aVZhMgM3u8OLY8puATlgdB1I7rqAS1cvjC7w9Rz6nVRmgMrOP5sUEd7wEZekHBId%2Bf42frUYv%2BAUc3%2Fros2lnw9xAM%2BY%2FY%2Bwa2gnQAPhYeG9Rsb6GLjtihZVju2x12fIHQFVTjiM3AwOz35Z0eaC4O7CRftkAsIxYkiGQqlQXCs1eDjhDtsQ3eruCK6qQm752cB7H3MdmdrA5uk1A5IoYg7vj3L35PprFOxSxmTHlxG6GXRo2D21jG5HRvYuRPYWua0yHKq3hXVXB%2BKqQPXmEDTzWorlHAB9iEwbmMb65t0SPuiP9%2FM883JR36puI2xZPtv5vREBcNinm2W3q0gNor48b5%2F0b8x56%2FW%2BXEkFtDO8EYC8yHmMEVe%2Bd6kYa8KK46YeAo0IQOCSOrATDcH0r8SW8lnwACHp1VVrszwKTUDKMFiOWC2D%2BF6UJh7Jxv%2FWRpLdTgbvr2KonphmajCS59HIBjqkAbPMVpoN1GQ6eFcyFy2J0%2FWAyjYNQmd7Mh5DjatWdeIfPFxwWtS9cGEXaIi1vbIEKSX2TTvicPMIixURstPYClIN2kXYJ1wgF1pgIMd5dTihadYpLx4dMPW109nFTwlzmMp4xusURbzr3Xh0pD58r%2BMorj7n1t7n5sM%2BUrLgHQP0LGvhQ7J8dCXnCoOmTp0Q4ja2F9yDU5sNvbwH60tcvM83P8zi&X-Amz-Signature=5d6ee57f260dc728dc3948b62dc021d20ada9f33d162bea3882ff76985aa7339&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
