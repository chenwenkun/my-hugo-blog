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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VXFNEVCU%2F20260930%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260930T171132Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCICKMmafjgt3NPOVYcQQRt3u%2FZoTagZGOnIhxVoIFK%2FnjAiBeeMmuQPkwKacHFLCA7Vfpax7m4L4M7%2BJeOCofcX8ZFir%2FAwhoEAAaDDYzNzQyMzE4MzgwNSIMpRKnXdkLulJvY3c%2FKtwDiUmWW73dNUaT7t%2Faj7lD8528ax79%2FjNBUFsGuurRfpYVI4vyJnbjUzrkhwa82AAl0qZ5uvR6AF37l7IKZ%2BnRqWLF449DB4w2Z4%2BPO14S5c%2B%2BAOn6U9fcMgI0d3yYduhCHiwWDUqpVg%2F%2BILbZ0%2BO6EM2tEmJJLSg0fFadgLgXMGx6HS9hKe03o7yjk7cvVRdRNHmkACvtHzIv2Xz8o%2BoNagCDEksr91cUnbW5XYELQVIlUpIHh8kYAbHVTCNZgj8TSXoFhA2wDatEBkFRyveJzx1EgpNHlDO2OFz6nD2IrDuRh%2BTR0qqZyrnfcRTN7VWT%2BQOPHQnvuVIhKBKOvRWS1SXhR35rhjRkdU7YXNwm0Cv%2Bun9czyIdrUAzRSFJgVY9JRA9%2Fs%2BU1k9UJnGHPU5FBROv4VTo4stU9zyNPisX%2BJ9grhBU%2BZ0Riw9mFnDzG0eMJVtfEI5XCT4vU8j6kDIl28hAhsMGZBee1z%2BblUrzjUfmLuMIWh6FDr%2BTdLwWBFjv5kjXD9yiCBsFRE5sDv5PB5VU3FOYFqSqz2xAsTARI3VI9Q893GDEhRJDLrvdzYhfU3BZeg5%2Bjdb15y%2BkDSVGj8RiycY%2BmAOWu90W5E%2B8KlXvVVaUMdyAeIaA7vkwv8z01QY6pgH06Y1Wnszkanq0mlbAga53kGQEhvRtlVNCUhcCXH7EOACyD11picoyWAFORt47nOJ1xNBihsn0tjQ2ZKEWA7rFk87wKrDgcLGxSz8ZxyTJZGklQUkFisgjpZPwuyAg3lA3%2BKEPc5o7qXVqw702QV4YWZY3dfw5AgX4TKmTl2dowwVB3DTpxRlS5Mz2fKIZGWDiOwAO0oBSHq0%2FoaiG0odtiaNpxCvE&X-Amz-Signature=567a61670479ebd502e03c106b62b61dcc62d80ba77ba2dc815c3df7ec5b3992&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VXFNEVCU%2F20260930%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260930T171132Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCICKMmafjgt3NPOVYcQQRt3u%2FZoTagZGOnIhxVoIFK%2FnjAiBeeMmuQPkwKacHFLCA7Vfpax7m4L4M7%2BJeOCofcX8ZFir%2FAwhoEAAaDDYzNzQyMzE4MzgwNSIMpRKnXdkLulJvY3c%2FKtwDiUmWW73dNUaT7t%2Faj7lD8528ax79%2FjNBUFsGuurRfpYVI4vyJnbjUzrkhwa82AAl0qZ5uvR6AF37l7IKZ%2BnRqWLF449DB4w2Z4%2BPO14S5c%2B%2BAOn6U9fcMgI0d3yYduhCHiwWDUqpVg%2F%2BILbZ0%2BO6EM2tEmJJLSg0fFadgLgXMGx6HS9hKe03o7yjk7cvVRdRNHmkACvtHzIv2Xz8o%2BoNagCDEksr91cUnbW5XYELQVIlUpIHh8kYAbHVTCNZgj8TSXoFhA2wDatEBkFRyveJzx1EgpNHlDO2OFz6nD2IrDuRh%2BTR0qqZyrnfcRTN7VWT%2BQOPHQnvuVIhKBKOvRWS1SXhR35rhjRkdU7YXNwm0Cv%2Bun9czyIdrUAzRSFJgVY9JRA9%2Fs%2BU1k9UJnGHPU5FBROv4VTo4stU9zyNPisX%2BJ9grhBU%2BZ0Riw9mFnDzG0eMJVtfEI5XCT4vU8j6kDIl28hAhsMGZBee1z%2BblUrzjUfmLuMIWh6FDr%2BTdLwWBFjv5kjXD9yiCBsFRE5sDv5PB5VU3FOYFqSqz2xAsTARI3VI9Q893GDEhRJDLrvdzYhfU3BZeg5%2Bjdb15y%2BkDSVGj8RiycY%2BmAOWu90W5E%2B8KlXvVVaUMdyAeIaA7vkwv8z01QY6pgH06Y1Wnszkanq0mlbAga53kGQEhvRtlVNCUhcCXH7EOACyD11picoyWAFORt47nOJ1xNBihsn0tjQ2ZKEWA7rFk87wKrDgcLGxSz8ZxyTJZGklQUkFisgjpZPwuyAg3lA3%2BKEPc5o7qXVqw702QV4YWZY3dfw5AgX4TKmTl2dowwVB3DTpxRlS5Mz2fKIZGWDiOwAO0oBSHq0%2FoaiG0odtiaNpxCvE&X-Amz-Signature=1c170e83f762997f812a8c8369818087edb970169dcd7f9338da2e6f91c385df&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
