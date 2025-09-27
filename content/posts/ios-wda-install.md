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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SZC5Q33M%2F20250927%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20250927T121759Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBsaCXVzLXdlc3QtMiJGMEQCIH8z0qKdgNtZ8Paxq48zYh8z2dKmHlZR1wqtflzPTiFsAiAsY7JzO%2BPfF76bIB4vhtdg7PZCBtxTqyS2F2nZYBc%2FMCqIBAik%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMBA5NNvvhGl3K5IPjKtwDXDEx75TCrLNuWJ6NFpN3nSVuiGd8Ezy2HYUVyGe2k3rLsFIqNVvcuG7E8Vyp0d%2B46hD8Xh3ZRir4rJoblH9%2Bfc%2BusYifWSXYKAyVZwlDcs09h5o9OFOsv5E1RWjmSX4dkUZGLIiCY4Vfx7Zo1wyHz4sQWPLUJdr1d4%2BxJwWXHgOLwT%2BKKsxq5fiSmMw8ZJrdQ9vd0MNJwGpFLVxWbAvMFr5igrANhOg3hz4RnjrRwndar%2FFTkeG8YNELcu9Lr81NCdqrqC8T%2Fd2BQvXLNiLe6dqumUAXKJ4QzXjLYgtBlj8XtwxieCvWcyYEkyRSfvtWb07AhFZQBOyOz3P4mRYt9gEMCPUmfiAklbvuuWIIjwHkibekrE9DofGKR%2BA6pJ3cP%2FQGtWr1vwSeDXQL8sQQXU67Bq12t4pXSDIoT%2FHim27rDqcWB6zCXU%2BQMxrgsu%2FLleTKQjVXooednoiL0StZpXQrDzxY7qWSnlSPVUvy%2FfZoqQUvposYyzsCZLRiyrysflxDGay6TueV9v5D%2FCWgCzhJtKSTfaT5vzW2seikXQX4CTeVBj8jwTQeXDXrkF0mACzMnjyPufp4wRKcGslKKgG1WN9abxxJL9fOXtu9TEgt2RJdnnYX8zCCZEYw%2B%2FnexgY6pgGtF634I%2F%2Fp5gVWUHp10QsddlQDGg0KXp23iHY0WaO1YRS1%2BZnls6SPfRHahLSu69sJKpGBKfe3YxhcTAAUHAiB%2FyfLaOOXTe52iZNLm5tPap3Rd4a56FhbyKpfPiG3mwwFIh%2FZRm0syFuf6wMW1N017TSPqP26tj9xYsvICJCceR0%2Fr3wgNHPz0DJXLMaUUKJrQBccw%2FETGUzv22JbCIl%2FrhEbxKzn&X-Amz-Signature=b8f353665f6e90d627bbbe33477b92d556e5b77899f1c75754bbd1306879afa8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SZC5Q33M%2F20250927%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20250927T121759Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBsaCXVzLXdlc3QtMiJGMEQCIH8z0qKdgNtZ8Paxq48zYh8z2dKmHlZR1wqtflzPTiFsAiAsY7JzO%2BPfF76bIB4vhtdg7PZCBtxTqyS2F2nZYBc%2FMCqIBAik%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMBA5NNvvhGl3K5IPjKtwDXDEx75TCrLNuWJ6NFpN3nSVuiGd8Ezy2HYUVyGe2k3rLsFIqNVvcuG7E8Vyp0d%2B46hD8Xh3ZRir4rJoblH9%2Bfc%2BusYifWSXYKAyVZwlDcs09h5o9OFOsv5E1RWjmSX4dkUZGLIiCY4Vfx7Zo1wyHz4sQWPLUJdr1d4%2BxJwWXHgOLwT%2BKKsxq5fiSmMw8ZJrdQ9vd0MNJwGpFLVxWbAvMFr5igrANhOg3hz4RnjrRwndar%2FFTkeG8YNELcu9Lr81NCdqrqC8T%2Fd2BQvXLNiLe6dqumUAXKJ4QzXjLYgtBlj8XtwxieCvWcyYEkyRSfvtWb07AhFZQBOyOz3P4mRYt9gEMCPUmfiAklbvuuWIIjwHkibekrE9DofGKR%2BA6pJ3cP%2FQGtWr1vwSeDXQL8sQQXU67Bq12t4pXSDIoT%2FHim27rDqcWB6zCXU%2BQMxrgsu%2FLleTKQjVXooednoiL0StZpXQrDzxY7qWSnlSPVUvy%2FfZoqQUvposYyzsCZLRiyrysflxDGay6TueV9v5D%2FCWgCzhJtKSTfaT5vzW2seikXQX4CTeVBj8jwTQeXDXrkF0mACzMnjyPufp4wRKcGslKKgG1WN9abxxJL9fOXtu9TEgt2RJdnnYX8zCCZEYw%2B%2FnexgY6pgGtF634I%2F%2Fp5gVWUHp10QsddlQDGg0KXp23iHY0WaO1YRS1%2BZnls6SPfRHahLSu69sJKpGBKfe3YxhcTAAUHAiB%2FyfLaOOXTe52iZNLm5tPap3Rd4a56FhbyKpfPiG3mwwFIh%2FZRm0syFuf6wMW1N017TSPqP26tj9xYsvICJCceR0%2Fr3wgNHPz0DJXLMaUUKJrQBccw%2FETGUzv22JbCIl%2FrhEbxKzn&X-Amz-Signature=974d36c20c3a1e9700c8f353cac4fc80be71f08cb08828051ad55c1d6a986b95&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
