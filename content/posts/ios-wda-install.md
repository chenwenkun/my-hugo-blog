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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VV4YXSK4%2F20260805%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260805T191236Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGMaCXVzLXdlc3QtMiJGMEQCIGNAqvPcTE8%2Fekh0C4Sczb4qSVYwFHoAxd2qPf53fMzEAiBoJyKgvdoLj58pAUNbrHh6DCdUVsMzB6FtTJN%2BanF1CSr%2FAwgsEAAaDDYzNzQyMzE4MzgwNSIMuhxW3iswHqbPkuT8KtwDF25WZP7qCopbuSOmOXGHwH690QMZDL1fcQZiEsmDN4Ta6Kxa%2B3yB6861UyrPL5GGuXatpmSydN%2Fy5mG%2BQKO9ViIt%2ByO6eK5xujrTgm29DwV%2Fyocc%2FDkQ0b7MABx8g9KKI5NDvbp5SbPCnZ4JG0yi4mT2cD9FsiSZ5uEYYjleWXFwk5RqmN7KKDstLPdHzpjE0Fxqp6%2FiKtyJzY3KBvivJAst%2BMo4SycQLyM5SW5bTD3kczuCVdALYz60pdB1n4ksRoTyNjmcaFniXh%2FInH1u39qYe9ib5rPJNPs1YSihxu1CVlUGLVVAUlqHcq88f%2FjopnlOUqcyVzWkMSoEgwpLW1NWAEssRDAFF%2FxQzIGqNPEhc6P9jAXt8d2jZgdL%2BT3OIhG34SpxAWutmEb%2Bxh8oN%2BVFVmzQq13z4L7LBrXvsMTPcewA5vgXsEmVgC8CB8b0h4IfakFR9MmjAXrkecmzBzYuT2scbh7qNI5zSOq99c8dpyWreOpVtiN8KHLRgqYqAv%2FLm7ko%2FUVkLCcUqR%2FpO2bHAVGD%2B691APr9Bzmj%2BEoRp8Sr1wsTx3pwIw%2B%2B3KtG50YVseJvugdWI79b%2FXr2f0Cd9gaq0uIJ5TjjKXm2qYUYpE7ItPC%2FWpLWxOcwwIDO0wY6pgHqSYAb6QRooo6VEgGcW8tCIiQhNDmhjOIOrtNGvSwWRs1%2B51bNBC5IftzXUFnHkD9ebCvZjN3jYlpv4KeuPqTmkNBYHbhpys0mCu4lqpGjEeA%2BmLn9r23IrrveB2HJVunfdvIG%2FGUeeHhZgSHT5oQ589syl1ZZ%2FiPH%2Fw%2FR%2B0kzC0RC3FyB%2BTX6il3qTAGMlYkYRk4lZeLg3vAyt1m0b1CD9DwUo4Zz&X-Amz-Signature=06f9731bbbd44608892d067610ea0801a7fef94766321451c84fa077f2a55088&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VV4YXSK4%2F20260805%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260805T191237Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGMaCXVzLXdlc3QtMiJGMEQCIGNAqvPcTE8%2Fekh0C4Sczb4qSVYwFHoAxd2qPf53fMzEAiBoJyKgvdoLj58pAUNbrHh6DCdUVsMzB6FtTJN%2BanF1CSr%2FAwgsEAAaDDYzNzQyMzE4MzgwNSIMuhxW3iswHqbPkuT8KtwDF25WZP7qCopbuSOmOXGHwH690QMZDL1fcQZiEsmDN4Ta6Kxa%2B3yB6861UyrPL5GGuXatpmSydN%2Fy5mG%2BQKO9ViIt%2ByO6eK5xujrTgm29DwV%2Fyocc%2FDkQ0b7MABx8g9KKI5NDvbp5SbPCnZ4JG0yi4mT2cD9FsiSZ5uEYYjleWXFwk5RqmN7KKDstLPdHzpjE0Fxqp6%2FiKtyJzY3KBvivJAst%2BMo4SycQLyM5SW5bTD3kczuCVdALYz60pdB1n4ksRoTyNjmcaFniXh%2FInH1u39qYe9ib5rPJNPs1YSihxu1CVlUGLVVAUlqHcq88f%2FjopnlOUqcyVzWkMSoEgwpLW1NWAEssRDAFF%2FxQzIGqNPEhc6P9jAXt8d2jZgdL%2BT3OIhG34SpxAWutmEb%2Bxh8oN%2BVFVmzQq13z4L7LBrXvsMTPcewA5vgXsEmVgC8CB8b0h4IfakFR9MmjAXrkecmzBzYuT2scbh7qNI5zSOq99c8dpyWreOpVtiN8KHLRgqYqAv%2FLm7ko%2FUVkLCcUqR%2FpO2bHAVGD%2B691APr9Bzmj%2BEoRp8Sr1wsTx3pwIw%2B%2B3KtG50YVseJvugdWI79b%2FXr2f0Cd9gaq0uIJ5TjjKXm2qYUYpE7ItPC%2FWpLWxOcwwIDO0wY6pgHqSYAb6QRooo6VEgGcW8tCIiQhNDmhjOIOrtNGvSwWRs1%2B51bNBC5IftzXUFnHkD9ebCvZjN3jYlpv4KeuPqTmkNBYHbhpys0mCu4lqpGjEeA%2BmLn9r23IrrveB2HJVunfdvIG%2FGUeeHhZgSHT5oQ589syl1ZZ%2FiPH%2Fw%2FR%2B0kzC0RC3FyB%2BTX6il3qTAGMlYkYRk4lZeLg3vAyt1m0b1CD9DwUo4Zz&X-Amz-Signature=0d655f6a27b1a812d4da7bd34112271367bc17df4fc75ddb30597ce1a09066fe&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
