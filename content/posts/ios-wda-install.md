---
title: iOS WDA作为App独立运行
date: '2025-09-25'
tags:
  - 技术
draft: false
author: chenwenkun
toc: true
show_reading_time: true
---
## 目标

把 WebDriverAgent（WDA）**打包成可独立安装运行的 iOS App（.ipa）**，用于：

- 不依赖 Xcode 直接在真机上启动 WDA
- 远程/自动化环境更方便地拉起 WDA 服务
- iOS 17+ 也可用（按你的记录验证）
---

## 已验证情况（来自原始记录）

- iOS 16.6：运行闪退
- iOS 18.3 / 18.4：可正常安装运行
---

## 背景：WDA 与维护者

- WDA 最早来自 Facebook（现已不活跃）
- 当前常用维护版本由 Appium 维护（建议优先使用 Appium 维护分支）
（下方保留原始对象/链接块）

---

## 步骤 1：下载代码 & Xcode 首次构建

1. 下载/拉取 WebDriverAgent 代码
1. 用 Xcode 打开工程并先构建一次（确保依赖齐全）
1. 修改 `Bundle Identifier`
1. 选择并勾选你自己的 Apple ID（签名用）
（下方保留原图）

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XN63MS2P%2F20261117%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261117T150648Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEB0aCXVzLXdlc3QtMiJHMEUCICiNYD%2FD531wZh%2B7EZGdV0L7pgZ56WYWbMzgXKb2IbSSAiEA3V6a0VKc9LtHw7wdV9Seuhz6ppj4%2FsCwI8GMB6jrUpAqiAQI5v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDKsZc4qgVmDOsEUQAircA39tc0P5BoJds%2BmnlDmMAtHSn4fJCXo4fOCsRxTNDxa2ti6NKhYg%2FS%2Bq%2FXSTV74j59B59J3M1%2FZ8D8VZQGPkIOCrA5aspp1fiwo4LlYPIKRim4e%2B7SkOiDeUFuy%2F9vG8WU3FZLEUy9w%2FN%2Bb3ZMk%2FqmonIE38nCA2f2NJkDkHUjaw52%2BCGxtLf21KgoaiJtjkNiA7tQZtLmhB1bweNCoRzfGU%2BHHgWagcJhBiKvf6AYLpYO4INrOoEKO3Kw%2F65vyLTWrX2i9sftrO%2Fbk7m47U5g%2Fo63FvgN6wYtJjQJ1YTUIanpENg805Vrvslpp9DLPck2YV23obaEanYxyklucC4Vjv1ybkPtre8f0zxnOmIgR%2FLn5RW%2Bo4wtWj6bvu%2F7YHMT7I2C3oq4S6syoNQbwHPfS7H8UGzpMgY%2FlL1ASVku9zA91OtfRdNmCPySA1hd7fNTvHJw3ky3m7s0Qj0QRw2uNlDK8R8AdLeQV4Zs2evppfnJgxiJmZSpj8JV3c7fU1O7ifXLgr8J%2BEhMZTKMCpxtAnEJVPDf%2F4B9YTJr%2F1dd5Vx1UC2wfu3q0qbaQyKMnayPj4NVIxeYQUG5Z%2BV1HIN1HKKIeM%2ByaMqgz%2B1P5TX77PPibxnJu00pgwuPxiMOGe8dcGOqUBOis2wW2jkQ5qiby0pDQDYZaoP2i%2BLTQ7uo%2BgSkqI9v7Vt0gOjxyg9HHC2948aoYKNis7o9%2BtKRioQZlvpchC4Vxpv%2FG4R%2BaW%2FxwmQIE0minmpXI%2BeRJstFKBvPvCT5Inq899m%2Fu%2FqhwPINn5H%2FtXtZuws1vshRuCkljqU%2BHzSB8mTG5cP4A2CNSkusPuk3vn5STlolUdvx8xnCOok4d2DDkqL08O&X-Amz-Signature=7c7e47ba177acd9941f8c228b2abf60db3e8a682d02ba59a6a890cc7a8a318f3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 步骤 2：用 xcodebuild 产出可用于打包的构建产物

```bash
cd /Users/chenwenkun/Downloads/androidandios/iosui/WebDriverAgent/WebDriverAgent

# 使用 xcodebuild 构建 WebDriverAgentRunner 用于测试
xcodebuild build-for-testing \
  -scheme WebDriverAgentRunner \
  -sdk iphoneos \
  -configuration Release \
  -derivedDataPath /tmp/derivedDataPath

# Apple Silicon（可选）显式指定 arm64
xcodebuild build-for-testing \
  -scheme WebDriverAgentRunner \
  -sdk iphoneos \
  -configuration Release \
  -derivedDataPath /tmp/derivedDataPath \
  -arch arm64
```

---

## 步骤 3：组装 Payload 并打包 ipa

```bash
cd /tmp/derivedDataPath
cd Build/Products/Release-iphoneos

# 创建 Payload 并复制 .app
mkdir Payload && cp -r *.app Payload

# 打包 ipa
zip -r WDA.ipa Payload
```

---

## 步骤 4：清理 Frameworks（关键）

进入：

`WebDriverAgentRunner-Runner.app/Frameworks`

把 **XC 开头的文件全部删掉**（按你原记录的踩坑经验）

（下方保留原图）

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XN63MS2P%2F20261117%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261117T150648Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEB0aCXVzLXdlc3QtMiJHMEUCICiNYD%2FD531wZh%2B7EZGdV0L7pgZ56WYWbMzgXKb2IbSSAiEA3V6a0VKc9LtHw7wdV9Seuhz6ppj4%2FsCwI8GMB6jrUpAqiAQI5v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDKsZc4qgVmDOsEUQAircA39tc0P5BoJds%2BmnlDmMAtHSn4fJCXo4fOCsRxTNDxa2ti6NKhYg%2FS%2Bq%2FXSTV74j59B59J3M1%2FZ8D8VZQGPkIOCrA5aspp1fiwo4LlYPIKRim4e%2B7SkOiDeUFuy%2F9vG8WU3FZLEUy9w%2FN%2Bb3ZMk%2FqmonIE38nCA2f2NJkDkHUjaw52%2BCGxtLf21KgoaiJtjkNiA7tQZtLmhB1bweNCoRzfGU%2BHHgWagcJhBiKvf6AYLpYO4INrOoEKO3Kw%2F65vyLTWrX2i9sftrO%2Fbk7m47U5g%2Fo63FvgN6wYtJjQJ1YTUIanpENg805Vrvslpp9DLPck2YV23obaEanYxyklucC4Vjv1ybkPtre8f0zxnOmIgR%2FLn5RW%2Bo4wtWj6bvu%2F7YHMT7I2C3oq4S6syoNQbwHPfS7H8UGzpMgY%2FlL1ASVku9zA91OtfRdNmCPySA1hd7fNTvHJw3ky3m7s0Qj0QRw2uNlDK8R8AdLeQV4Zs2evppfnJgxiJmZSpj8JV3c7fU1O7ifXLgr8J%2BEhMZTKMCpxtAnEJVPDf%2F4B9YTJr%2F1dd5Vx1UC2wfu3q0qbaQyKMnayPj4NVIxeYQUG5Z%2BV1HIN1HKKIeM%2ByaMqgz%2B1P5TX77PPibxnJu00pgwuPxiMOGe8dcGOqUBOis2wW2jkQ5qiby0pDQDYZaoP2i%2BLTQ7uo%2BgSkqI9v7Vt0gOjxyg9HHC2948aoYKNis7o9%2BtKRioQZlvpchC4Vxpv%2FG4R%2BaW%2FxwmQIE0minmpXI%2BeRJstFKBvPvCT5Inq899m%2Fu%2FqhwPINn5H%2FtXtZuws1vshRuCkljqU%2BHzSB8mTG5cP4A2CNSkusPuk3vn5STlolUdvx8xnCOok4d2DDkqL08O&X-Amz-Signature=71083282429beacf610a3c62880dfa0234f8c6c6a23a65dced14c42cacf104cb&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 步骤 5：重签名（Re-sign）

使用工具进行重签名：

- iOS App Signer / App Resigner
- 你原文参考链接（保留）：  
产物：保存为 `WDA2.ipa`

（你记录里提到：个人开发者证书可用）

---

## 步骤 6：安装到真机（tidevice）

```bash
pip install tidevice

tidevice install WDA2.ipa
```

---

## 步骤 7：启动与验证

1. 手机上点击 WDA 图标启动
1. 浏览器打开：
- http://localhost:8100/status
出现一段 JSON 即正常。

---

## 附件（保留）

---

## 国内环境补充（你的原始备注整理）

如果需要把端口映射到电脑端进行访问/调试：

```bash
brew install --HEAD libimobiledevice
iproxy 8100 8100
```

然后在电脑端访问 `http://localhost:8100/status`。
