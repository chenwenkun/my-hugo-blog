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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667AKZ3LRT%2F20260212%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260212T184622Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBIaCXVzLXdlc3QtMiJHMEUCIQD9NKh%2BBkfors%2BcxD8rmXzFu%2BbwYFus3ZR%2FLVjK3OXUDwIgB%2BxxjMlAYbj9wD44gCVUglIHG1cv5bCkO9C3QUgPFvMqiAQI2%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFQH2%2FfHOn8dCf%2BO1CrcAyVlZDGUv7b%2FOfjKnOhTJMqrQWlPmaSLr5psd2KWpEsnHRX%2FjQiFGYKoznO4%2Bh3LZUobB0L%2BV7UbhpK5HNE6rC7rc4bSTe6fR707Dl2jekPL9YJ%2Fy%2BEAUsAg5OB0lroZ5S6PY%2FwUJXH9M0eNU3NPoNBv9gwj5pvKWz%2BA2TgTEjOunI5qexQbDf9K5hLHQ9J8PcCeo%2BMvJUmUQXnOUMNPc6J0m5u%2Bwk7%2BTtQIXc3RQc7dYYj%2Fxbde44h5Kz1UfJ8BmdIcgRXs%2BBvxcoUpx4SXMIVNaHS9xgGpu4wJ%2Bi1nlxOb2%2BKhWf3gzCPhwI5Ve%2BueXACpQBY5mQ7fwg3L8qf4mEd2r5mTU8Fe7gxCkzcy%2BYmOvi4wbhZN1%2B5BjzabqqKrE1C9M1Y4bvYTuxAs8SRrkkXeof5sYdq%2B8%2FfxZTMASDTBEQQY6bnz05DdERP4R9QM6twkTEPOESUaNoI9MzaTKAZ7cqPn4XKuKssN54nfGUA4lDfc0aAmzdjM7qo3Sgjr3zrHsPQDZCXkANzvW46vLB0ltczZrP%2FcZ6dB%2FMRhd8LoXJzQ%2Brl1WI2gcob0LPUj82crtrxPR7136KyWr6FepUCf6BCZFLdXBmeQGKIJmbK6SEQO1aiSIksuTChpMNipuMwGOqUBjht80dU2Oaisflsqc0lH558fXVw0pM5U5NZx6fu07ggC2qKTeAoFykJIZ9WD0DpvBp3F%2BxCgJgvhHJ8thcDfS3jmvs0tr3eJ4JPwjNxKBUWXfsqi74mJl2nJA%2BChIMeCqrZgo7PabzAe20CFTxIKYwgOrqRyk3%2FkFXyQlfvjAYTB0KSrdVdE8WwZDj6AqRatorKxVcKfB%2BExU%2BPeEqU5o5TI9b2P&X-Amz-Signature=f261a10bd122de6dc405247304fcf1de9e30481c8e2ef572f420d76f27b4a8cd&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667AKZ3LRT%2F20260212%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260212T184622Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBIaCXVzLXdlc3QtMiJHMEUCIQD9NKh%2BBkfors%2BcxD8rmXzFu%2BbwYFus3ZR%2FLVjK3OXUDwIgB%2BxxjMlAYbj9wD44gCVUglIHG1cv5bCkO9C3QUgPFvMqiAQI2%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFQH2%2FfHOn8dCf%2BO1CrcAyVlZDGUv7b%2FOfjKnOhTJMqrQWlPmaSLr5psd2KWpEsnHRX%2FjQiFGYKoznO4%2Bh3LZUobB0L%2BV7UbhpK5HNE6rC7rc4bSTe6fR707Dl2jekPL9YJ%2Fy%2BEAUsAg5OB0lroZ5S6PY%2FwUJXH9M0eNU3NPoNBv9gwj5pvKWz%2BA2TgTEjOunI5qexQbDf9K5hLHQ9J8PcCeo%2BMvJUmUQXnOUMNPc6J0m5u%2Bwk7%2BTtQIXc3RQc7dYYj%2Fxbde44h5Kz1UfJ8BmdIcgRXs%2BBvxcoUpx4SXMIVNaHS9xgGpu4wJ%2Bi1nlxOb2%2BKhWf3gzCPhwI5Ve%2BueXACpQBY5mQ7fwg3L8qf4mEd2r5mTU8Fe7gxCkzcy%2BYmOvi4wbhZN1%2B5BjzabqqKrE1C9M1Y4bvYTuxAs8SRrkkXeof5sYdq%2B8%2FfxZTMASDTBEQQY6bnz05DdERP4R9QM6twkTEPOESUaNoI9MzaTKAZ7cqPn4XKuKssN54nfGUA4lDfc0aAmzdjM7qo3Sgjr3zrHsPQDZCXkANzvW46vLB0ltczZrP%2FcZ6dB%2FMRhd8LoXJzQ%2Brl1WI2gcob0LPUj82crtrxPR7136KyWr6FepUCf6BCZFLdXBmeQGKIJmbK6SEQO1aiSIksuTChpMNipuMwGOqUBjht80dU2Oaisflsqc0lH558fXVw0pM5U5NZx6fu07ggC2qKTeAoFykJIZ9WD0DpvBp3F%2BxCgJgvhHJ8thcDfS3jmvs0tr3eJ4JPwjNxKBUWXfsqi74mJl2nJA%2BChIMeCqrZgo7PabzAe20CFTxIKYwgOrqRyk3%2FkFXyQlfvjAYTB0KSrdVdE8WwZDj6AqRatorKxVcKfB%2BExU%2BPeEqU5o5TI9b2P&X-Amz-Signature=7d485136addc0c007a9e642ca1d4b7a8b19cdf74d8ab8a6c73d255b1edf28b30&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
