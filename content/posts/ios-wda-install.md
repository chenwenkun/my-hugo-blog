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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VV7XDB7M%2F20260614%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260614T190711Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEH4aCXVzLXdlc3QtMiJIMEYCIQCZ0zT2Yff592so91TwLGdmI7ve%2FF7APJmrwfOghJINDQIhAP9S9I1z0Otk2zRNhgBMU7AFfHHryalbB9hhwEMBkoc%2BKv8DCEcQABoMNjM3NDIzMTgzODA1Igw770SP8kHrv3eY8%2B8q3ANuvLNh9pG3eoKCSDZD0MIt%2B6wiBn80DQOelzpG1xOfZZOTDAyR%2BV4eTHm%2BlAI8xA4IxvuZqbUz%2BzCsD6JiKBS1oQXGUI0FLvn5cahi%2FL5Ha%2BtCr7F5jQ3OnSxeFhwXJ5uKcSsj%2BDZQAy9XFxrMiwD4S4gAjqx%2BGtn3dLfsoeYoaQBsN7R9qTSyrUPmPBsYSjaub%2Bh9I%2BFxPl1TDuBgjv8qSoYu2e9T8d7WIUFBMtHyaFFv1aT00A16Msp%2BAOUur3w7gHylnUz9ypIvTEq%2FzvZMDfO6asDUOoYsMCU6qEzhn9NepR8D%2BRYFs9oyVtH3erxCkJRp3ZNpbsA8FXtA7D6zPkeQ6QPEhZI4suAJVDWCKKDGmYi0eiRlTBncMBEbTA3BBvtiiIhtFBZRTFKWwqE4U%2BLdWpJIsfA%2B5vjwk6xRtTTFWambPt3k%2F8fTObg0JrRs0Y0HWL6h9RXIaabFHZS4EpGvzTGi1mQg%2F2OxR925o8h9l49JPMXXaiNR2mxtM6kpuZbmWXoQvRUVKBefjLvXPVSTQSAq4NSQhfadGv2dBnYq2cHrRUsUZXSOKkQA1LDQkvFaxNRrXbZp1Jr2N3HalWT0WwarksMYSswvVLToLcxdu%2BAW4ZPhYPw6aDCP5rrRBjqkAcgjJfmIGj2dE4IP5kHszEs9%2BMf%2Fpmbwzks7Li9532rotSPMTUE%2B7vOZjajWNYiOSWbMkQSrtC%2B73Rlg%2Bv%2BLPhQTSl9XNjO%2B1TKNdBvom%2FtA5dp3MFM5I%2B%2BoZi0gKzf6olJXgoXVimDvo3fN8KHdqhipQPLUebu5hKZQTyYP70VLI0hNh2qhcyiVPNKyWKqrQTdySCiQ3woJc8VJzxK8njsEKJgH&X-Amz-Signature=dc7ea795a1787c41e6be8e59e9debffba0deed0d54efccea418b1fcf40411982&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VV7XDB7M%2F20260614%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260614T190711Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEH4aCXVzLXdlc3QtMiJIMEYCIQCZ0zT2Yff592so91TwLGdmI7ve%2FF7APJmrwfOghJINDQIhAP9S9I1z0Otk2zRNhgBMU7AFfHHryalbB9hhwEMBkoc%2BKv8DCEcQABoMNjM3NDIzMTgzODA1Igw770SP8kHrv3eY8%2B8q3ANuvLNh9pG3eoKCSDZD0MIt%2B6wiBn80DQOelzpG1xOfZZOTDAyR%2BV4eTHm%2BlAI8xA4IxvuZqbUz%2BzCsD6JiKBS1oQXGUI0FLvn5cahi%2FL5Ha%2BtCr7F5jQ3OnSxeFhwXJ5uKcSsj%2BDZQAy9XFxrMiwD4S4gAjqx%2BGtn3dLfsoeYoaQBsN7R9qTSyrUPmPBsYSjaub%2Bh9I%2BFxPl1TDuBgjv8qSoYu2e9T8d7WIUFBMtHyaFFv1aT00A16Msp%2BAOUur3w7gHylnUz9ypIvTEq%2FzvZMDfO6asDUOoYsMCU6qEzhn9NepR8D%2BRYFs9oyVtH3erxCkJRp3ZNpbsA8FXtA7D6zPkeQ6QPEhZI4suAJVDWCKKDGmYi0eiRlTBncMBEbTA3BBvtiiIhtFBZRTFKWwqE4U%2BLdWpJIsfA%2B5vjwk6xRtTTFWambPt3k%2F8fTObg0JrRs0Y0HWL6h9RXIaabFHZS4EpGvzTGi1mQg%2F2OxR925o8h9l49JPMXXaiNR2mxtM6kpuZbmWXoQvRUVKBefjLvXPVSTQSAq4NSQhfadGv2dBnYq2cHrRUsUZXSOKkQA1LDQkvFaxNRrXbZp1Jr2N3HalWT0WwarksMYSswvVLToLcxdu%2BAW4ZPhYPw6aDCP5rrRBjqkAcgjJfmIGj2dE4IP5kHszEs9%2BMf%2Fpmbwzks7Li9532rotSPMTUE%2B7vOZjajWNYiOSWbMkQSrtC%2B73Rlg%2Bv%2BLPhQTSl9XNjO%2B1TKNdBvom%2FtA5dp3MFM5I%2B%2BoZi0gKzf6olJXgoXVimDvo3fN8KHdqhipQPLUebu5hKZQTyYP70VLI0hNh2qhcyiVPNKyWKqrQTdySCiQ3woJc8VJzxK8njsEKJgH&X-Amz-Signature=e0db2f949c2dac9ecf93abac27be7461ab40a0674bdb5627732bdb4e1f7afc35&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
