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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QNB5OFH6%2F20261009%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261009T215904Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEH0aCXVzLXdlc3QtMiJHMEUCIQC0pcVmVQshkfmBFY6vMA0p6%2F1K%2FojH%2BrL2dqN2WZXf5gIgHYNUHwC1RUcLA%2Bqm%2BZvnnld6igaMKBU9kg3bR1cAwpUq%2FwMIRRAAGgw2Mzc0MjMxODM4MDUiDLO9get2gQ11HByx5yrcA4BtsGlP2lkYdoi4AVUTvUjh3MdYtI0K%2Ffdw%2BE5Qh8UKObDRH7b4PchCsK5xjFk39J5YNTqgdYa%2B7BMheHE5yhalK2g1jWw03XXNZZrvS3nancVvCxPfvcHTdPUhMflrF0MNpHbfgb4588c95wPUWD6HNWi0suQcj5%2FmGUzEslKo4KtjTjXe3HK1ehkv0cuYfZ77c0g45k74kkRwb%2FdUcse58jt%2B9bVt7s3pvxXegG0PZuH6kValGhibqGGjWJkzgxAC6fDiBcW%2FvVuKCdrJ0hhJsclb%2B0R507BIk841NwVpoVNb6ev2j9kMML%2Felyxt1aKVTShNkqnpfYf8vKm38CzI6ukTuNS8Yxo5YfBoe3s1qO%2F6G1wxHiDj4nbnYkTaGbubpRpkdD05HV5%2BKca1fQrvVVCkn34I9tCLSeVdSjptrWziExUFGbTeXAoOWld7qxmqoGhRYZa8E5%2BvHvWM2HzAwKPwlDCyuBd9ZrJYXDNjcb%2F7nfzwRVlPkRHxlh6Qi9NQbebOn6GQPeX0Cxh7JSW9OKWhgbSgvCV7TpzlYyKuZhifQis6O154arvM0tW2ZHqWhWSNv5e2n5OHuDS3F1vKst%2Bef6ia60nkUO2o8ZQDgmm%2BCGxB%2BYTmhmEkMKOrpdYGOqUBNMapVpfH%2BzoxLj0CgU1MXn3ggmZifLyvmoJfL2lxYJ969GKJqF9PcKCZrj5uQsl4j08xmj%2FepXRKgPZ5cH3PGrFEfYnnfX3hsoyIoSBz7STP0WXIuPHYxZg9Jy8hJ%2BIWJ%2FR4MuaIqUO3aRjNuVqR4Hi%2B7VgwrVyIf%2F4oGKWsGIcRBRlpQ9CZ0qiubDezZNiQJ2%2F%2BhY1iASWr80eMW0M2zIPtnqH4&X-Amz-Signature=80bc86709e3b984925e435c3d304936b17656b376075ab077886e8b505d46258&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QNB5OFH6%2F20261009%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261009T215904Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEH0aCXVzLXdlc3QtMiJHMEUCIQC0pcVmVQshkfmBFY6vMA0p6%2F1K%2FojH%2BrL2dqN2WZXf5gIgHYNUHwC1RUcLA%2Bqm%2BZvnnld6igaMKBU9kg3bR1cAwpUq%2FwMIRRAAGgw2Mzc0MjMxODM4MDUiDLO9get2gQ11HByx5yrcA4BtsGlP2lkYdoi4AVUTvUjh3MdYtI0K%2Ffdw%2BE5Qh8UKObDRH7b4PchCsK5xjFk39J5YNTqgdYa%2B7BMheHE5yhalK2g1jWw03XXNZZrvS3nancVvCxPfvcHTdPUhMflrF0MNpHbfgb4588c95wPUWD6HNWi0suQcj5%2FmGUzEslKo4KtjTjXe3HK1ehkv0cuYfZ77c0g45k74kkRwb%2FdUcse58jt%2B9bVt7s3pvxXegG0PZuH6kValGhibqGGjWJkzgxAC6fDiBcW%2FvVuKCdrJ0hhJsclb%2B0R507BIk841NwVpoVNb6ev2j9kMML%2Felyxt1aKVTShNkqnpfYf8vKm38CzI6ukTuNS8Yxo5YfBoe3s1qO%2F6G1wxHiDj4nbnYkTaGbubpRpkdD05HV5%2BKca1fQrvVVCkn34I9tCLSeVdSjptrWziExUFGbTeXAoOWld7qxmqoGhRYZa8E5%2BvHvWM2HzAwKPwlDCyuBd9ZrJYXDNjcb%2F7nfzwRVlPkRHxlh6Qi9NQbebOn6GQPeX0Cxh7JSW9OKWhgbSgvCV7TpzlYyKuZhifQis6O154arvM0tW2ZHqWhWSNv5e2n5OHuDS3F1vKst%2Bef6ia60nkUO2o8ZQDgmm%2BCGxB%2BYTmhmEkMKOrpdYGOqUBNMapVpfH%2BzoxLj0CgU1MXn3ggmZifLyvmoJfL2lxYJ969GKJqF9PcKCZrj5uQsl4j08xmj%2FepXRKgPZ5cH3PGrFEfYnnfX3hsoyIoSBz7STP0WXIuPHYxZg9Jy8hJ%2BIWJ%2FR4MuaIqUO3aRjNuVqR4Hi%2B7VgwrVyIf%2F4oGKWsGIcRBRlpQ9CZ0qiubDezZNiQJ2%2F%2BhY1iASWr80eMW0M2zIPtnqH4&X-Amz-Signature=e17a767be339d476acfe9cdd7eb456215e34305f643498fb75692fb652d62767&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
