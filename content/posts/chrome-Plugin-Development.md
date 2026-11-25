---
title: 谷歌浏览器插件类测试工具
date: '2025-09-25'
tags:
  - 开发
draft: false
author: chenwenkun
toc: true
show_reading_time: true
---
## 目标

整理一组我常用的「浏览器插件 / 辅助工具」能力，主要面向：

- 测试 / 预发 / 生产环境快速区分
- 页面刷新、缓存清理类操作
- 禅道（ZenTao）用例与测试单效率提升
---

## 1）页面强制刷新器（强刷 + 清缓存）

**用途：**

- 避免浏览器缓存导致“看起来没更新”
- 页面调试时快速清理缓存并强制重新加载资源
**要点：**

- 提供两个刷新功能：
（下方保留原有对象/附件）

---

## 2）测试 / 预发 / 正式环境标识器

**用途：**

- 通过 tab / 页面角标明显提示当前环境
- 降低在不同环境之间切换时的误操作风险（尤其是生产环境）
（下方保留原有对象/附件）

---

## 3）禅道测试用例支持 shift+批量选择插件

**用途：**

- 在禅道用例列表中，支持 Shift 多选，提高批量操作效率
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46622IU2H2K%2F20261125%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261125T162438Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCICi1S4uS%2Byo9BVm16jPpNMt%2Bk9jFMO5nf3c6pXhm1l%2BqAiAfFBvz7qkWREmb3RVDPuau%2F8MhsXLCCdwQjA%2BPOt7bhSqIBAio%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMsY3HaHODqRezM4GYKtwDCYdVoQi38a6qrcubK5ZOHMCioLsXIqnz5HYiCWS9sqAr292ZXex3iDOsWkdcF7vIBrqMTdCq7QWtF6i2eUR%2FDygPBj7WgvliKpDICdWiijfY%2FPV6IrTokdaFK%2BCo%2F%2FmYrW%2BG1VpcL%2BUHxMFPzI3DJaW8MSXT%2Ffiq7eprpsUpzf%2BJbV3Zm%2BDLkKmDwTg%2BpkY8UPpssszvZCNPfy5l80HCdENUE1vqIvqqp7SkyLkLdT9sjWOmEMuRmG1ryAKdb4jCE8eKA3Gjr1MtwJpPPiMdhhafSE1NVfpf8ho%2BPYhiP6%2Fd0mVDxn4U48rPgwj2bAaWRX2BR6Z6ws%2B0auYsu15E6pBtMBLldwKTaKhelBarHuZDabcdrxHhp6N7aBjcKb9Zn1vwyZFEDyIGD1vNzsfsURJ3bVNDePoccY1CX6ILtwDDL5tfxlAvvUFuo827dDBKDExXg6sXBgpKeZOuO3Zm%2F1fweYdEbgMgEGC0AA3lzqwpKbI68JaO4XA3TcrnNtAtIwK2IA6PHtPUeLwGxIY9aPdBGw%2BTZJZs%2BwMZKxdMJwurC7UQaRlaShdpBe6KhVdhTo9UyRTFCRZVZRlW3JlNdnl73RLS0sdkInh8IthtolTgOMNM8gS6OH7HwCMwqPOb2AY6pgGzzte4ZWsof9z0gh06qjR88qjNlXgSpqVcBxUeUBXHNlplTlcuE4WZ3nrNO%2BN4QELpc4UNDr3jFVW6w2s17%2F%2FcaTCmr3r4f%2B9tea9ihtatReYwLSaPZl9B21Z3fvW35OxoN388dy7Fo%2BH465AhYvaAEUJqN5Fwzfv5kIiO9BpjZgO5kgJsQ5PHCzkulKgMrXGADVLyp6LZ%2F1OwbC0wYos4RYZZNYuH&X-Amz-Signature=8487e677fbfc386ddf8680beeac97f62aaa7f36b789fc0a203f97d8049381ea5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46622IU2H2K%2F20261125%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261125T162438Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCICi1S4uS%2Byo9BVm16jPpNMt%2Bk9jFMO5nf3c6pXhm1l%2BqAiAfFBvz7qkWREmb3RVDPuau%2F8MhsXLCCdwQjA%2BPOt7bhSqIBAio%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMsY3HaHODqRezM4GYKtwDCYdVoQi38a6qrcubK5ZOHMCioLsXIqnz5HYiCWS9sqAr292ZXex3iDOsWkdcF7vIBrqMTdCq7QWtF6i2eUR%2FDygPBj7WgvliKpDICdWiijfY%2FPV6IrTokdaFK%2BCo%2F%2FmYrW%2BG1VpcL%2BUHxMFPzI3DJaW8MSXT%2Ffiq7eprpsUpzf%2BJbV3Zm%2BDLkKmDwTg%2BpkY8UPpssszvZCNPfy5l80HCdENUE1vqIvqqp7SkyLkLdT9sjWOmEMuRmG1ryAKdb4jCE8eKA3Gjr1MtwJpPPiMdhhafSE1NVfpf8ho%2BPYhiP6%2Fd0mVDxn4U48rPgwj2bAaWRX2BR6Z6ws%2B0auYsu15E6pBtMBLldwKTaKhelBarHuZDabcdrxHhp6N7aBjcKb9Zn1vwyZFEDyIGD1vNzsfsURJ3bVNDePoccY1CX6ILtwDDL5tfxlAvvUFuo827dDBKDExXg6sXBgpKeZOuO3Zm%2F1fweYdEbgMgEGC0AA3lzqwpKbI68JaO4XA3TcrnNtAtIwK2IA6PHtPUeLwGxIY9aPdBGw%2BTZJZs%2BwMZKxdMJwurC7UQaRlaShdpBe6KhVdhTo9UyRTFCRZVZRlW3JlNdnl73RLS0sdkInh8IthtolTgOMNM8gS6OH7HwCMwqPOb2AY6pgGzzte4ZWsof9z0gh06qjR88qjNlXgSpqVcBxUeUBXHNlplTlcuE4WZ3nrNO%2BN4QELpc4UNDr3jFVW6w2s17%2F%2FcaTCmr3r4f%2B9tea9ihtatReYwLSaPZl9B21Z3fvW35OxoN388dy7Fo%2BH465AhYvaAEUJqN5Fwzfv5kIiO9BpjZgO5kgJsQ5PHCzkulKgMrXGADVLyp6LZ%2F1OwbC0wYos4RYZZNYuH&X-Amz-Signature=1f48cbd75c5378814b21137b58416d4b6650bb9f169067bdba90085b922dd5a1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46622IU2H2K%2F20261125%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261125T162438Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCICi1S4uS%2Byo9BVm16jPpNMt%2Bk9jFMO5nf3c6pXhm1l%2BqAiAfFBvz7qkWREmb3RVDPuau%2F8MhsXLCCdwQjA%2BPOt7bhSqIBAio%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMsY3HaHODqRezM4GYKtwDCYdVoQi38a6qrcubK5ZOHMCioLsXIqnz5HYiCWS9sqAr292ZXex3iDOsWkdcF7vIBrqMTdCq7QWtF6i2eUR%2FDygPBj7WgvliKpDICdWiijfY%2FPV6IrTokdaFK%2BCo%2F%2FmYrW%2BG1VpcL%2BUHxMFPzI3DJaW8MSXT%2Ffiq7eprpsUpzf%2BJbV3Zm%2BDLkKmDwTg%2BpkY8UPpssszvZCNPfy5l80HCdENUE1vqIvqqp7SkyLkLdT9sjWOmEMuRmG1ryAKdb4jCE8eKA3Gjr1MtwJpPPiMdhhafSE1NVfpf8ho%2BPYhiP6%2Fd0mVDxn4U48rPgwj2bAaWRX2BR6Z6ws%2B0auYsu15E6pBtMBLldwKTaKhelBarHuZDabcdrxHhp6N7aBjcKb9Zn1vwyZFEDyIGD1vNzsfsURJ3bVNDePoccY1CX6ILtwDDL5tfxlAvvUFuo827dDBKDExXg6sXBgpKeZOuO3Zm%2F1fweYdEbgMgEGC0AA3lzqwpKbI68JaO4XA3TcrnNtAtIwK2IA6PHtPUeLwGxIY9aPdBGw%2BTZJZs%2BwMZKxdMJwurC7UQaRlaShdpBe6KhVdhTo9UyRTFCRZVZRlW3JlNdnl73RLS0sdkInh8IthtolTgOMNM8gS6OH7HwCMwqPOb2AY6pgGzzte4ZWsof9z0gh06qjR88qjNlXgSpqVcBxUeUBXHNlplTlcuE4WZ3nrNO%2BN4QELpc4UNDr3jFVW6w2s17%2F%2FcaTCmr3r4f%2B9tea9ihtatReYwLSaPZl9B21Z3fvW35OxoN388dy7Fo%2BH465AhYvaAEUJqN5Fwzfv5kIiO9BpjZgO5kgJsQ5PHCzkulKgMrXGADVLyp6LZ%2F1OwbC0wYos4RYZZNYuH&X-Amz-Signature=1f89f63d7a649cd337460b1a64dfe863029358e3a9cf42d7bafad1fa94f86d9a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46622IU2H2K%2F20261125%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261125T162438Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCICi1S4uS%2Byo9BVm16jPpNMt%2Bk9jFMO5nf3c6pXhm1l%2BqAiAfFBvz7qkWREmb3RVDPuau%2F8MhsXLCCdwQjA%2BPOt7bhSqIBAio%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMsY3HaHODqRezM4GYKtwDCYdVoQi38a6qrcubK5ZOHMCioLsXIqnz5HYiCWS9sqAr292ZXex3iDOsWkdcF7vIBrqMTdCq7QWtF6i2eUR%2FDygPBj7WgvliKpDICdWiijfY%2FPV6IrTokdaFK%2BCo%2F%2FmYrW%2BG1VpcL%2BUHxMFPzI3DJaW8MSXT%2Ffiq7eprpsUpzf%2BJbV3Zm%2BDLkKmDwTg%2BpkY8UPpssszvZCNPfy5l80HCdENUE1vqIvqqp7SkyLkLdT9sjWOmEMuRmG1ryAKdb4jCE8eKA3Gjr1MtwJpPPiMdhhafSE1NVfpf8ho%2BPYhiP6%2Fd0mVDxn4U48rPgwj2bAaWRX2BR6Z6ws%2B0auYsu15E6pBtMBLldwKTaKhelBarHuZDabcdrxHhp6N7aBjcKb9Zn1vwyZFEDyIGD1vNzsfsURJ3bVNDePoccY1CX6ILtwDDL5tfxlAvvUFuo827dDBKDExXg6sXBgpKeZOuO3Zm%2F1fweYdEbgMgEGC0AA3lzqwpKbI68JaO4XA3TcrnNtAtIwK2IA6PHtPUeLwGxIY9aPdBGw%2BTZJZs%2BwMZKxdMJwurC7UQaRlaShdpBe6KhVdhTo9UyRTFCRZVZRlW3JlNdnl73RLS0sdkInh8IthtolTgOMNM8gS6OH7HwCMwqPOb2AY6pgGzzte4ZWsof9z0gh06qjR88qjNlXgSpqVcBxUeUBXHNlplTlcuE4WZ3nrNO%2BN4QELpc4UNDr3jFVW6w2s17%2F%2FcaTCmr3r4f%2B9tea9ihtatReYwLSaPZl9B21Z3fvW35OxoN388dy7Fo%2BH465AhYvaAEUJqN5Fwzfv5kIiO9BpjZgO5kgJsQ5PHCzkulKgMrXGADVLyp6LZ%2F1OwbC0wYos4RYZZNYuH&X-Amz-Signature=d1fe99c3d3b5523f162e807d223b63873716640e889027a2c86c6dc1c8da3096&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
