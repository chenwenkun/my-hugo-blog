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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666R6LENU3%2F20251122%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251122T121826Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFwaCXVzLXdlc3QtMiJHMEUCID8UGttBnl7jVFJCukEZfsMA27h5nNdv5ZBWwyH1bdj3AiEAgx5lp74Tb8%2FC97PtAuJEkSc%2BV2KTDiOt1IRkDOh%2FDdYq%2FwMIJBAAGgw2Mzc0MjMxODM4MDUiDPRSC6a1HKhVfpmisircA0jwbV9y%2B97NonJMzU%2BgfI3JQX3T4Quql32OxPUZokQajwe6x%2FOMSwigT%2FzvU7IG%2BdLfO%2BneXezLpmBP9m61IFO%2FmQvHEp%2BuThfZqdk6Ea7sUjXPFbtdtIbKy%2FsnTaUqR%2BrHu3yvNJ%2BJkCGGzkGh5z61HZrs7eD9Edx%2FAQ7rXETS3QUeAUJImxyKJqnZ82UxphVjcfSbJloXV7LatYt%2FqRrdW81jOrhEI6G3ccE80EEL9HtUUhRwSOjJOEeG3s5dezHoQmeHcf1tqBXTNW0X3f603YPhuX25MSqb196JispVzeqOvvDYBqq%2B2Ly1ILUmKZe5JYwoch3lkVpRrAAvosU0dEWAmpxCFn17YrD1q9L2EssOlzUfIAkE%2FajnRoLTTnfKio6JTvZ6EsxdKUE2MkmvJw9tLguDEILJMDpPAGNMo1L%2F0EdcjESGnhQfLdhDMZYPrQUqVKjPjzugM94RUrfjICcyR2QUFc%2FDqAem2JUoQdmZ8Np1vKQNULTWfTxlviOaBd9x6sePUDJ3mPdMoQHw52cj3G0FjUuBWwsjK0tW8E2OzqUiI8w0pzPD%2B2mOBJe2a7VUV2u%2BvnP7ssKXZD0uvopMVC0aiHMyiUUZtuvhWa2jACoCmCxZ%2BHtQMO%2B4hskGOqUBhGHQpS9HrZxEvXm5%2BdZnCx420lbt%2B5O3WNtTkH1MF2hPPA%2FKkBCGTR2GjVPzwK6MGPCpmhPk3SK8UyQcGiTmJcP0Jos6qQCCPWCgPzBqep%2FKpNTuUvCYeTSNAnYVTX2uigrwZDlX2ZweF9%2FMuR0epAjes7atHxkOKg8o7p1JtjJaC03yofOoaMoyIAw%2BMTxgyZOr0tPOig9MlaFyBq2v22OgbZ2D&X-Amz-Signature=d4d259445a87245f0133c4876f89b364f24b26f26d9ca45bb7eb6d782d8e9f86&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666R6LENU3%2F20251122%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251122T121826Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFwaCXVzLXdlc3QtMiJHMEUCID8UGttBnl7jVFJCukEZfsMA27h5nNdv5ZBWwyH1bdj3AiEAgx5lp74Tb8%2FC97PtAuJEkSc%2BV2KTDiOt1IRkDOh%2FDdYq%2FwMIJBAAGgw2Mzc0MjMxODM4MDUiDPRSC6a1HKhVfpmisircA0jwbV9y%2B97NonJMzU%2BgfI3JQX3T4Quql32OxPUZokQajwe6x%2FOMSwigT%2FzvU7IG%2BdLfO%2BneXezLpmBP9m61IFO%2FmQvHEp%2BuThfZqdk6Ea7sUjXPFbtdtIbKy%2FsnTaUqR%2BrHu3yvNJ%2BJkCGGzkGh5z61HZrs7eD9Edx%2FAQ7rXETS3QUeAUJImxyKJqnZ82UxphVjcfSbJloXV7LatYt%2FqRrdW81jOrhEI6G3ccE80EEL9HtUUhRwSOjJOEeG3s5dezHoQmeHcf1tqBXTNW0X3f603YPhuX25MSqb196JispVzeqOvvDYBqq%2B2Ly1ILUmKZe5JYwoch3lkVpRrAAvosU0dEWAmpxCFn17YrD1q9L2EssOlzUfIAkE%2FajnRoLTTnfKio6JTvZ6EsxdKUE2MkmvJw9tLguDEILJMDpPAGNMo1L%2F0EdcjESGnhQfLdhDMZYPrQUqVKjPjzugM94RUrfjICcyR2QUFc%2FDqAem2JUoQdmZ8Np1vKQNULTWfTxlviOaBd9x6sePUDJ3mPdMoQHw52cj3G0FjUuBWwsjK0tW8E2OzqUiI8w0pzPD%2B2mOBJe2a7VUV2u%2BvnP7ssKXZD0uvopMVC0aiHMyiUUZtuvhWa2jACoCmCxZ%2BHtQMO%2B4hskGOqUBhGHQpS9HrZxEvXm5%2BdZnCx420lbt%2B5O3WNtTkH1MF2hPPA%2FKkBCGTR2GjVPzwK6MGPCpmhPk3SK8UyQcGiTmJcP0Jos6qQCCPWCgPzBqep%2FKpNTuUvCYeTSNAnYVTX2uigrwZDlX2ZweF9%2FMuR0epAjes7atHxkOKg8o7p1JtjJaC03yofOoaMoyIAw%2BMTxgyZOr0tPOig9MlaFyBq2v22OgbZ2D&X-Amz-Signature=b3d5a67cf2f8c904fcecd41a4f381311020c8a5d22cead243da8cace2cf67747&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
