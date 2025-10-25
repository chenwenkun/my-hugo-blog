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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663IIMIYGR%2F20251025%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251025T061440Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCqm%2BXzKUIK1HbtvFhoL88CHu6hRtX4%2FPGa4K%2B0pEBEIwIgfz8%2Brcdd2%2FBrf7vxbA3oL3%2Bn6OVhOiOATnyBKuCEcV0q%2FwMIbhAAGgw2Mzc0MjMxODM4MDUiDLqSkHlp71Log%2BVZvCrcAzRxK%2BXS7w5zgjBnhWL1zutYEXTmPnq5PYG%2Fi2wq%2Fz6PE2O2YMNCM2HBUwHAPiwUc%2BcVdLBaVavE0gfxcDxlGNZjQKeHC9XE90xMIf45x3DPkVBm%2BxJyvZxH5vm%2FuJeXOmRm8Jpu4g46z2l9euBGhbVizeJGp4db4acSorKYuIPRvbeqiT%2BwRbgrqUaWF%2F9rY5JGT6MaEOFggXBI6uT65tqP7Yofu%2FQtBu61%2FJXmHx5StmKt33TQ6tx2C%2BbasJNvEBBWWcDPV7hwZQA1RVUnPew3%2BnfFHvZE4qpRA%2B2T8TpucFKoLqkLqNSMzi1jVUOwmu9M%2BRKYvriNWsVQRPaOnckx29ZWdPaWqEVpXi%2B17Rg188vZIXyUSmz1P71o5%2BZ26WW2t9bqBrvNQGS8WgH555Gaz4a9tX0apNrMoCvhO0hRFQ5IDofxv8iW9qArU0WFBfZ0z%2BKJeJcEi4OUPPjUdd7d%2B44DdSPjlmLCKBJJ3P6fL07jMtOHj6LDBw%2B5rxZ3Qh4QqYcZKB%2BAGiuhP8Y1NAAcaGovGXBKurNlur3AigQJe6sT74CTnOA5gl5FBCVkQUDf1I8hrfRO%2Foe7bW45IeMnHp1r3kb1dHw8V%2FJrRqEHSZey4UYuuo3EM5scMOa%2B8ccGOqUBK5G7dePtBMQ0AiLa5a2G2b%2BIaIic%2FGT94p7HGRc%2FRRZcKiuJ4F0cJToq0NUUe2FP8m8futMo3whNyedPrPiTvwQ8jOyeGVdf8JQMpoAb9ldfKd9VHwi1vz3eKXFQj2jfIWygJUkkabcJoIx17vRqCKp5D%2B8BHbTeLHr%2BO0hLIoBuwZ6WTfyW4gFUFmFEKLO%2BbFU7t%2F%2BHR9oM4ajL5WlJIMBd5tEq&X-Amz-Signature=714d56f0d4c0d496c3e8ff58e7c6beae4de454597362c0a56f01413a3bf98548&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663IIMIYGR%2F20251025%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251025T061440Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCqm%2BXzKUIK1HbtvFhoL88CHu6hRtX4%2FPGa4K%2B0pEBEIwIgfz8%2Brcdd2%2FBrf7vxbA3oL3%2Bn6OVhOiOATnyBKuCEcV0q%2FwMIbhAAGgw2Mzc0MjMxODM4MDUiDLqSkHlp71Log%2BVZvCrcAzRxK%2BXS7w5zgjBnhWL1zutYEXTmPnq5PYG%2Fi2wq%2Fz6PE2O2YMNCM2HBUwHAPiwUc%2BcVdLBaVavE0gfxcDxlGNZjQKeHC9XE90xMIf45x3DPkVBm%2BxJyvZxH5vm%2FuJeXOmRm8Jpu4g46z2l9euBGhbVizeJGp4db4acSorKYuIPRvbeqiT%2BwRbgrqUaWF%2F9rY5JGT6MaEOFggXBI6uT65tqP7Yofu%2FQtBu61%2FJXmHx5StmKt33TQ6tx2C%2BbasJNvEBBWWcDPV7hwZQA1RVUnPew3%2BnfFHvZE4qpRA%2B2T8TpucFKoLqkLqNSMzi1jVUOwmu9M%2BRKYvriNWsVQRPaOnckx29ZWdPaWqEVpXi%2B17Rg188vZIXyUSmz1P71o5%2BZ26WW2t9bqBrvNQGS8WgH555Gaz4a9tX0apNrMoCvhO0hRFQ5IDofxv8iW9qArU0WFBfZ0z%2BKJeJcEi4OUPPjUdd7d%2B44DdSPjlmLCKBJJ3P6fL07jMtOHj6LDBw%2B5rxZ3Qh4QqYcZKB%2BAGiuhP8Y1NAAcaGovGXBKurNlur3AigQJe6sT74CTnOA5gl5FBCVkQUDf1I8hrfRO%2Foe7bW45IeMnHp1r3kb1dHw8V%2FJrRqEHSZey4UYuuo3EM5scMOa%2B8ccGOqUBK5G7dePtBMQ0AiLa5a2G2b%2BIaIic%2FGT94p7HGRc%2FRRZcKiuJ4F0cJToq0NUUe2FP8m8futMo3whNyedPrPiTvwQ8jOyeGVdf8JQMpoAb9ldfKd9VHwi1vz3eKXFQj2jfIWygJUkkabcJoIx17vRqCKp5D%2B8BHbTeLHr%2BO0hLIoBuwZ6WTfyW4gFUFmFEKLO%2BbFU7t%2F%2BHR9oM4ajL5WlJIMBd5tEq&X-Amz-Signature=b15615e07b02809cd14ca1f007ab38b21cadb7c7875c840ec4808e83bc644709&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
