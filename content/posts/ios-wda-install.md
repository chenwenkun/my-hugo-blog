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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662PURKSEV%2F20261023%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261023T204606Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIB%2Fkoxw61w95xmSQ6gWXerOFkCD931VF3BDXPRIZ02%2BjAiApb2An5cXCptq3uz0gy7lHmY23oq6iqDzscTS0CBoGMyqIBAiV%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMjm%2Bsf2JLbi0ysDZUKtwDKtR%2BJCNQ%2BbLMavXhk2wv5b7VuYk4xElA5xp2bcn7jI6om1CftRfu7NdpzvldMiAr6WByjJCsL%2B609YJLdFhCuLb9OKzCEnqYML6qBuqjSqBa5pa0sK%2FthTAMJRxBA5qrfd4U318PUMRk86m5aTB1LHfKA7PvG9Iz1RwLMKf%2F0j%2BAUu5V%2FxLA4T7NUJApUjgoPPtDL28snpnhFAwWpsoqqzlRe0y77kj4vMEculD57qi0vH77fQIw7f42rOSEdZJZFSPDrBnFMKQIUPx2a33tBzl4oItHe3WbA%2BSlYMNnoPdPCcplmIy5uXl8NqHGVxQkT5K10%2Fv2nXcjI87sZ8gUK0I7%2BwP8xGRqN5l1cUM2yP3y0X%2BDKtACYrkmNQwk4Jrsz3g1%2FS0jUYbDAQDsKODRnilXiTSC5VQAQbgQ6vMasHpqTYfnQ66uGCGjHWyBHM1vj%2Fk%2Bnekyai5eclx9mh4zXMTAGzx0bN6a8gN%2BrZTK9qP0FGAqqtDB3a2XcpGCVOx2TmWkleS21N2XThDp3XUx8L6u7cPmn%2BiDVAhB8HqKMuyb4t%2F9vXqXOR641FAibLonADZ8DvXkwG13ovVVUUUG8BHKOIw3UnuxRWnPOCr5K92c%2FWmg9BxQ14Wl8RQw9orv1gY6pgGglWfVuKv6%2B1FhECcCmaCJyqpB8u9YCMj15%2FlyFIpzaqTMxt4UPAXVz5us6eVxpD%2FJqYCqwtikQKGpOVHb8NM14HUK3Gcg4mJDCq6jevefEV30%2BrXoECTR88Iiy6k5SRoPJ6w77whlOfoDjChdUGT6l5aHqY32AzEw%2BrKSEX26L27amJTzkjYSdoGnfN6DV5XQEgaG4OkXs3DblHyn%2FV4fDczf13jv&X-Amz-Signature=88fa75eac38d0b2c12db756d0a5a9dfca21830794c274595cfcfb5aa5aca5fa0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662PURKSEV%2F20261023%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261023T204606Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIB%2Fkoxw61w95xmSQ6gWXerOFkCD931VF3BDXPRIZ02%2BjAiApb2An5cXCptq3uz0gy7lHmY23oq6iqDzscTS0CBoGMyqIBAiV%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMjm%2Bsf2JLbi0ysDZUKtwDKtR%2BJCNQ%2BbLMavXhk2wv5b7VuYk4xElA5xp2bcn7jI6om1CftRfu7NdpzvldMiAr6WByjJCsL%2B609YJLdFhCuLb9OKzCEnqYML6qBuqjSqBa5pa0sK%2FthTAMJRxBA5qrfd4U318PUMRk86m5aTB1LHfKA7PvG9Iz1RwLMKf%2F0j%2BAUu5V%2FxLA4T7NUJApUjgoPPtDL28snpnhFAwWpsoqqzlRe0y77kj4vMEculD57qi0vH77fQIw7f42rOSEdZJZFSPDrBnFMKQIUPx2a33tBzl4oItHe3WbA%2BSlYMNnoPdPCcplmIy5uXl8NqHGVxQkT5K10%2Fv2nXcjI87sZ8gUK0I7%2BwP8xGRqN5l1cUM2yP3y0X%2BDKtACYrkmNQwk4Jrsz3g1%2FS0jUYbDAQDsKODRnilXiTSC5VQAQbgQ6vMasHpqTYfnQ66uGCGjHWyBHM1vj%2Fk%2Bnekyai5eclx9mh4zXMTAGzx0bN6a8gN%2BrZTK9qP0FGAqqtDB3a2XcpGCVOx2TmWkleS21N2XThDp3XUx8L6u7cPmn%2BiDVAhB8HqKMuyb4t%2F9vXqXOR641FAibLonADZ8DvXkwG13ovVVUUUG8BHKOIw3UnuxRWnPOCr5K92c%2FWmg9BxQ14Wl8RQw9orv1gY6pgGglWfVuKv6%2B1FhECcCmaCJyqpB8u9YCMj15%2FlyFIpzaqTMxt4UPAXVz5us6eVxpD%2FJqYCqwtikQKGpOVHb8NM14HUK3Gcg4mJDCq6jevefEV30%2BrXoECTR88Iiy6k5SRoPJ6w77whlOfoDjChdUGT6l5aHqY32AzEw%2BrKSEX26L27amJTzkjYSdoGnfN6DV5XQEgaG4OkXs3DblHyn%2FV4fDczf13jv&X-Amz-Signature=f32a1ec99a447737cc9d1e656ff2cc8281ac71b42844db0ed7499467e8e20548&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
