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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466W263WRST%2F20260814%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260814T070650Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEC4aCXVzLXdlc3QtMiJGMEQCIA6cTbcj%2BdZDmlB%2FepsWbdqlFSb%2B%2FMnEjHcYCnOwK8XYAiAq5OC00jsNIa4YVu1n8WwwAaow7JIzFtdHm9nRyeJFdSqIBAj3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMavi8K%2BTaj841DXUgKtwDRfo6dYzfLDjKLU7Z6dVhOWMbyBCGiSh8LM0N9qs6hXlEEMVF%2ByNqGbS9XTDz1ajLXSyxnqGmSsN41%2BwyYu3kWXBZeiZ1gHvTdrp%2BvWtxRxQSkvDFpSDeNnQvA16J8iVn7fm6XhMPGRgQoMLWPlzFMuZ8k84WDFyWuukZRtYi%2FT0Bm3D%2FWa7M8%2BJUAB0zHExCmDyJcBZxuYak7HDYwoz0k8kTt7fLD13VwZwv%2FS1lw9X692ygKRzLalrhM0jytYm%2BFl7BSmK04NYfn9%2BOK7XqwSV2ssC3iLDlxVeJCPbXiYMThApaHPF7KGpaRCYDvNlB0mishW0sqWWGQK3aXIj8xw5C7E%2Fkn934V0%2BhEdrEJolR9YCX5zUCBdjLwVxfJ4KjVsETgaqkHmDEiPSPRvGNVrLRroRaAYoaz3OuDRblofC3q3Ia25NDT9aQadCZ2Lsr9qm%2FdA0rDw%2Bh1HwpmDJYoQ93kqFOlZ3xQ0yKsPu%2Fy636Go0TyQV7TqJBLnUv9GQm1p5qdFGxYVWMLhe7%2FX%2BOS3eHKI7RfLU5Awi0MfSJqzLDrXs2jr9%2BfS18kZmFqsPXvCirRIoRajYaO3tGsxHf%2BckdqvFlSxgy9AK3ZXhFQmUKQjZmhySCeHi3gtIwx9360wY6pgE3BeCJpfZtVYi9YwBgXePDr3mLwhVhO7tQIhy2k3TePUxA7gOCk6nngDRPuXH0BqmQx6KdU%2FiVcqEk%2FpqrXILIgvQOrrj%2FHPNIeithpl1OJUKaqBrJxKhoMr4d3VELUBe%2F5pcoaj%2B4RVrrYhoXAadZWQ7xVpQu3DmwXgZ1GcqM5vk8FhLHpSYBlaWsRX20h8TQlg3sD7SVtAHxyaGCH7ka2mhE3ngU&X-Amz-Signature=871c862dcfd8dff476e18eee8ee2a45f64756a0debac2b72d6983869cd8ab0a1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466W263WRST%2F20260814%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260814T070650Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEC4aCXVzLXdlc3QtMiJGMEQCIA6cTbcj%2BdZDmlB%2FepsWbdqlFSb%2B%2FMnEjHcYCnOwK8XYAiAq5OC00jsNIa4YVu1n8WwwAaow7JIzFtdHm9nRyeJFdSqIBAj3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMavi8K%2BTaj841DXUgKtwDRfo6dYzfLDjKLU7Z6dVhOWMbyBCGiSh8LM0N9qs6hXlEEMVF%2ByNqGbS9XTDz1ajLXSyxnqGmSsN41%2BwyYu3kWXBZeiZ1gHvTdrp%2BvWtxRxQSkvDFpSDeNnQvA16J8iVn7fm6XhMPGRgQoMLWPlzFMuZ8k84WDFyWuukZRtYi%2FT0Bm3D%2FWa7M8%2BJUAB0zHExCmDyJcBZxuYak7HDYwoz0k8kTt7fLD13VwZwv%2FS1lw9X692ygKRzLalrhM0jytYm%2BFl7BSmK04NYfn9%2BOK7XqwSV2ssC3iLDlxVeJCPbXiYMThApaHPF7KGpaRCYDvNlB0mishW0sqWWGQK3aXIj8xw5C7E%2Fkn934V0%2BhEdrEJolR9YCX5zUCBdjLwVxfJ4KjVsETgaqkHmDEiPSPRvGNVrLRroRaAYoaz3OuDRblofC3q3Ia25NDT9aQadCZ2Lsr9qm%2FdA0rDw%2Bh1HwpmDJYoQ93kqFOlZ3xQ0yKsPu%2Fy636Go0TyQV7TqJBLnUv9GQm1p5qdFGxYVWMLhe7%2FX%2BOS3eHKI7RfLU5Awi0MfSJqzLDrXs2jr9%2BfS18kZmFqsPXvCirRIoRajYaO3tGsxHf%2BckdqvFlSxgy9AK3ZXhFQmUKQjZmhySCeHi3gtIwx9360wY6pgE3BeCJpfZtVYi9YwBgXePDr3mLwhVhO7tQIhy2k3TePUxA7gOCk6nngDRPuXH0BqmQx6KdU%2FiVcqEk%2FpqrXILIgvQOrrj%2FHPNIeithpl1OJUKaqBrJxKhoMr4d3VELUBe%2F5pcoaj%2B4RVrrYhoXAadZWQ7xVpQu3DmwXgZ1GcqM5vk8FhLHpSYBlaWsRX20h8TQlg3sD7SVtAHxyaGCH7ka2mhE3ngU&X-Amz-Signature=e0774745d2bb3f99b5209db3202b782afa0b9cd9412415e1246456500d5a5b84&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
