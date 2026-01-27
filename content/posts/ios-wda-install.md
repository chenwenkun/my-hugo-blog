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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VKZNMN2L%2F20260127%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260127T122644Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBjg4pROuCfv3pVadvkNIXLyOLvw0sKREz4YsUtOnYr3AiEAuUp2bWWHk2CzO8i3IK3HluuMRJ2pLS%2B8YV%2BGITNMncYq%2FwMIVRAAGgw2Mzc0MjMxODM4MDUiDMeK5Ydm33I%2B%2FmXghCrcA6wOwmbBQ6QKh46ku78cl%2BT%2BWNv4m11x%2FoqZiuy5w8XfvzZL5myr4nj%2F%2F%2BHSDtfu1%2BmVZJgcnzJ8azb4NHF1uPIS6j7iYd3KJjX9Mw4twcMIl2VHcauqosiSIPmpY%2Bxhbpwgdh5uwxe7EoJ87iMd%2BQfQe8PqGahcM57DH%2FR38jUlredkm%2BOUOVt%2BoGI6pzlachrrZxIEF4ekJ8zneRsntH7bNScfptMjCh4AUJXXcs71gy6OLeINCEExU4n%2Fs4yjsWI4sHs5MJk6OpFPdZ4tcMumkb5Nowuva%2FAcx60JdRmHNTqc1Kk88fMtr4tg1YVpNz5LjUksY69VcdhIhelVM%2Fb4YPKIv8Swff8FCaDMtNVVpf0piLQQDQ5QMpXo7OsTiYcCaoQx%2BnpmEKDZUqAiEnj5MPSHkv9rkO7%2Fv8dguh7M3gnKXrZ0fvKJN1KwUHgdL9F8kt8Vhq5tuPpfNeceiaAPEdQDA34hA7Ye3%2FJ2XsWByhxLJYERVMA858ZHYqLxZjJjld7ibK6F7P6cWFkKALa2MwtItXzvkxJcEi%2Bw4CHNY1099Ege1lZwV849il5eSCgx5haeYt%2Fd5l5LTpy1pk6kS1XZaiWorTwWWoWTTJw9fD5gHRX9VK0KVuPWMKvJ4ssGOqUBCiQuYZTtNmFHZwWJNKz7PuFmuOVsw1ykJ3%2FewNoZut54DvidggXFjqDF921I7c5JeLJzZlrr1AFiA6tYicOVtdPQ%2FGTuZdIkpCfulp9H13oie44X79XiRSZN3lxWhWKXNX61mAJDCYIymq4bjrdjnOTKC8j46rIdqefN%2FsXI5NvxLmS1G%2BNg8OG77e9WiPm3i4VhHvjvmxiQ%2FtKZJrcDTmtR1sVD&X-Amz-Signature=a6eb099cb474c6675b2ded1c21f6da511d66737413ade4475af718f7998cacc4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VKZNMN2L%2F20260127%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260127T122644Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBjg4pROuCfv3pVadvkNIXLyOLvw0sKREz4YsUtOnYr3AiEAuUp2bWWHk2CzO8i3IK3HluuMRJ2pLS%2B8YV%2BGITNMncYq%2FwMIVRAAGgw2Mzc0MjMxODM4MDUiDMeK5Ydm33I%2B%2FmXghCrcA6wOwmbBQ6QKh46ku78cl%2BT%2BWNv4m11x%2FoqZiuy5w8XfvzZL5myr4nj%2F%2F%2BHSDtfu1%2BmVZJgcnzJ8azb4NHF1uPIS6j7iYd3KJjX9Mw4twcMIl2VHcauqosiSIPmpY%2Bxhbpwgdh5uwxe7EoJ87iMd%2BQfQe8PqGahcM57DH%2FR38jUlredkm%2BOUOVt%2BoGI6pzlachrrZxIEF4ekJ8zneRsntH7bNScfptMjCh4AUJXXcs71gy6OLeINCEExU4n%2Fs4yjsWI4sHs5MJk6OpFPdZ4tcMumkb5Nowuva%2FAcx60JdRmHNTqc1Kk88fMtr4tg1YVpNz5LjUksY69VcdhIhelVM%2Fb4YPKIv8Swff8FCaDMtNVVpf0piLQQDQ5QMpXo7OsTiYcCaoQx%2BnpmEKDZUqAiEnj5MPSHkv9rkO7%2Fv8dguh7M3gnKXrZ0fvKJN1KwUHgdL9F8kt8Vhq5tuPpfNeceiaAPEdQDA34hA7Ye3%2FJ2XsWByhxLJYERVMA858ZHYqLxZjJjld7ibK6F7P6cWFkKALa2MwtItXzvkxJcEi%2Bw4CHNY1099Ege1lZwV849il5eSCgx5haeYt%2Fd5l5LTpy1pk6kS1XZaiWorTwWWoWTTJw9fD5gHRX9VK0KVuPWMKvJ4ssGOqUBCiQuYZTtNmFHZwWJNKz7PuFmuOVsw1ykJ3%2FewNoZut54DvidggXFjqDF921I7c5JeLJzZlrr1AFiA6tYicOVtdPQ%2FGTuZdIkpCfulp9H13oie44X79XiRSZN3lxWhWKXNX61mAJDCYIymq4bjrdjnOTKC8j46rIdqefN%2FsXI5NvxLmS1G%2BNg8OG77e9WiPm3i4VhHvjvmxiQ%2FtKZJrcDTmtR1sVD&X-Amz-Signature=2537a9ef07efb2e26a06bcb72f5b545b1fe0dbd191509d8a09c2e5aff30093e1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
