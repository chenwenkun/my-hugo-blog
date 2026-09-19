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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466W6OXIPSM%2F20260919%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260919T095439Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDuj7pIAkpwYX%2BYHFAyK5bPcvh7J%2FpJKqvpuCxwvn9kQwIgBkNW2CvosLkCENDVn%2BuK0jXfj9rDG2YMwAmHdHvDtagq%2FwMIWBAAGgw2Mzc0MjMxODM4MDUiDGDPtdN%2BqG5OmRJrWircA%2FTzlVlCZt%2FNF58La7CsX%2BiC%2F3Bb4jf0pYA8%2FLUtxoHU4YnrCdfEv5PJFcrNeabwO8mgZZJvJowOYb6OwetB7mp1utG%2BnhGnmF%2BBq5qudgzbB4OihzTzbWE8EHMfZnnsyg20%2FmjBtKCfcCeiiKK0ExX6BKCzaMJir90cNyUMSZ3VEuV3qbYd5QSFXFlL01joa%2BbdhatKDrHPhp%2BcGcwwrXCmclAzjw25zh5fhPrNJlOqItEyXnH%2FjmgsrcK1%2FG%2BhxNDJYCrLH7ADKg4Z0xh6yNhogv4RQGDvEHROxYy773VEo6cm%2BCSK2pI0a7kq83NT8%2F3QMYFL5PhKlV6Pvz9ZcT%2FE92PIgxWwuEssY9FL6CbEDI0PO1T83%2BbxCc50CRBClods1yKRvbpt3DF2DDDiOwDM4hX9krUdU6yMIq8CeVndvbaikoGIuUQxqsebyiTkK%2BdMDqFW9ZoJJj4YKFwIuaMMpkwTLQM0u2u%2Bx%2Fs85b87koAb1%2B7zRWeoKNqBOnMI7hwPL931VJzOGZnrA250R9Pscg3rj%2BXf8i8RG5xtLEMEY58Hq%2Fn1xE9L4HmcE%2FfYizOtJKGMhf%2Blhv2z1GC4yhFTw0KXN2c2Q6el%2Fp%2FSOldQBD0pZpOkLZ21m1ZwMPbouNUGOqUBVB1OCNiHFXrt%2BgvHqOwudNvbeHnZ2Bkf8oLqjBbFL7XMoIjEjyp4pDq6zGHrrMJKcoO01r13%2FWVqFxJxlXWMn9bBCpTZlo2MB0V9r6GX0t2kSm5uYz%2BX3gi5N4jQkEqNhl%2FmA53%2FDWWNZM%2F5nKcnOeEiwGKQ%2BgyvVAUP0NCdtGc9yKKANSSfwg6jI51IUvmfm1tX595D8oxYZdWcrbTaR%2FLbrshu&X-Amz-Signature=25eb013557ef85093d0e2eb6433e93690b631f6bc805468c4d627234c0bedf23&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466W6OXIPSM%2F20260919%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260919T095439Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDuj7pIAkpwYX%2BYHFAyK5bPcvh7J%2FpJKqvpuCxwvn9kQwIgBkNW2CvosLkCENDVn%2BuK0jXfj9rDG2YMwAmHdHvDtagq%2FwMIWBAAGgw2Mzc0MjMxODM4MDUiDGDPtdN%2BqG5OmRJrWircA%2FTzlVlCZt%2FNF58La7CsX%2BiC%2F3Bb4jf0pYA8%2FLUtxoHU4YnrCdfEv5PJFcrNeabwO8mgZZJvJowOYb6OwetB7mp1utG%2BnhGnmF%2BBq5qudgzbB4OihzTzbWE8EHMfZnnsyg20%2FmjBtKCfcCeiiKK0ExX6BKCzaMJir90cNyUMSZ3VEuV3qbYd5QSFXFlL01joa%2BbdhatKDrHPhp%2BcGcwwrXCmclAzjw25zh5fhPrNJlOqItEyXnH%2FjmgsrcK1%2FG%2BhxNDJYCrLH7ADKg4Z0xh6yNhogv4RQGDvEHROxYy773VEo6cm%2BCSK2pI0a7kq83NT8%2F3QMYFL5PhKlV6Pvz9ZcT%2FE92PIgxWwuEssY9FL6CbEDI0PO1T83%2BbxCc50CRBClods1yKRvbpt3DF2DDDiOwDM4hX9krUdU6yMIq8CeVndvbaikoGIuUQxqsebyiTkK%2BdMDqFW9ZoJJj4YKFwIuaMMpkwTLQM0u2u%2Bx%2Fs85b87koAb1%2B7zRWeoKNqBOnMI7hwPL931VJzOGZnrA250R9Pscg3rj%2BXf8i8RG5xtLEMEY58Hq%2Fn1xE9L4HmcE%2FfYizOtJKGMhf%2Blhv2z1GC4yhFTw0KXN2c2Q6el%2Fp%2FSOldQBD0pZpOkLZ21m1ZwMPbouNUGOqUBVB1OCNiHFXrt%2BgvHqOwudNvbeHnZ2Bkf8oLqjBbFL7XMoIjEjyp4pDq6zGHrrMJKcoO01r13%2FWVqFxJxlXWMn9bBCpTZlo2MB0V9r6GX0t2kSm5uYz%2BX3gi5N4jQkEqNhl%2FmA53%2FDWWNZM%2F5nKcnOeEiwGKQ%2BgyvVAUP0NCdtGc9yKKANSSfwg6jI51IUvmfm1tX595D8oxYZdWcrbTaR%2FLbrshu&X-Amz-Signature=c3916d04861afa12ae8b46a94a8ff5bde73e2d128a5d85f7ba4b0fcfbd2e6db2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466W6OXIPSM%2F20260919%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260919T095439Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDuj7pIAkpwYX%2BYHFAyK5bPcvh7J%2FpJKqvpuCxwvn9kQwIgBkNW2CvosLkCENDVn%2BuK0jXfj9rDG2YMwAmHdHvDtagq%2FwMIWBAAGgw2Mzc0MjMxODM4MDUiDGDPtdN%2BqG5OmRJrWircA%2FTzlVlCZt%2FNF58La7CsX%2BiC%2F3Bb4jf0pYA8%2FLUtxoHU4YnrCdfEv5PJFcrNeabwO8mgZZJvJowOYb6OwetB7mp1utG%2BnhGnmF%2BBq5qudgzbB4OihzTzbWE8EHMfZnnsyg20%2FmjBtKCfcCeiiKK0ExX6BKCzaMJir90cNyUMSZ3VEuV3qbYd5QSFXFlL01joa%2BbdhatKDrHPhp%2BcGcwwrXCmclAzjw25zh5fhPrNJlOqItEyXnH%2FjmgsrcK1%2FG%2BhxNDJYCrLH7ADKg4Z0xh6yNhogv4RQGDvEHROxYy773VEo6cm%2BCSK2pI0a7kq83NT8%2F3QMYFL5PhKlV6Pvz9ZcT%2FE92PIgxWwuEssY9FL6CbEDI0PO1T83%2BbxCc50CRBClods1yKRvbpt3DF2DDDiOwDM4hX9krUdU6yMIq8CeVndvbaikoGIuUQxqsebyiTkK%2BdMDqFW9ZoJJj4YKFwIuaMMpkwTLQM0u2u%2Bx%2Fs85b87koAb1%2B7zRWeoKNqBOnMI7hwPL931VJzOGZnrA250R9Pscg3rj%2BXf8i8RG5xtLEMEY58Hq%2Fn1xE9L4HmcE%2FfYizOtJKGMhf%2Blhv2z1GC4yhFTw0KXN2c2Q6el%2Fp%2FSOldQBD0pZpOkLZ21m1ZwMPbouNUGOqUBVB1OCNiHFXrt%2BgvHqOwudNvbeHnZ2Bkf8oLqjBbFL7XMoIjEjyp4pDq6zGHrrMJKcoO01r13%2FWVqFxJxlXWMn9bBCpTZlo2MB0V9r6GX0t2kSm5uYz%2BX3gi5N4jQkEqNhl%2FmA53%2FDWWNZM%2F5nKcnOeEiwGKQ%2BgyvVAUP0NCdtGc9yKKANSSfwg6jI51IUvmfm1tX595D8oxYZdWcrbTaR%2FLbrshu&X-Amz-Signature=f02e53f2247fd9eea98f2cd7b43822796eb4a71a2f0af6f87dd36a69dd1ecc18&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466W6OXIPSM%2F20260919%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260919T095439Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDuj7pIAkpwYX%2BYHFAyK5bPcvh7J%2FpJKqvpuCxwvn9kQwIgBkNW2CvosLkCENDVn%2BuK0jXfj9rDG2YMwAmHdHvDtagq%2FwMIWBAAGgw2Mzc0MjMxODM4MDUiDGDPtdN%2BqG5OmRJrWircA%2FTzlVlCZt%2FNF58La7CsX%2BiC%2F3Bb4jf0pYA8%2FLUtxoHU4YnrCdfEv5PJFcrNeabwO8mgZZJvJowOYb6OwetB7mp1utG%2BnhGnmF%2BBq5qudgzbB4OihzTzbWE8EHMfZnnsyg20%2FmjBtKCfcCeiiKK0ExX6BKCzaMJir90cNyUMSZ3VEuV3qbYd5QSFXFlL01joa%2BbdhatKDrHPhp%2BcGcwwrXCmclAzjw25zh5fhPrNJlOqItEyXnH%2FjmgsrcK1%2FG%2BhxNDJYCrLH7ADKg4Z0xh6yNhogv4RQGDvEHROxYy773VEo6cm%2BCSK2pI0a7kq83NT8%2F3QMYFL5PhKlV6Pvz9ZcT%2FE92PIgxWwuEssY9FL6CbEDI0PO1T83%2BbxCc50CRBClods1yKRvbpt3DF2DDDiOwDM4hX9krUdU6yMIq8CeVndvbaikoGIuUQxqsebyiTkK%2BdMDqFW9ZoJJj4YKFwIuaMMpkwTLQM0u2u%2Bx%2Fs85b87koAb1%2B7zRWeoKNqBOnMI7hwPL931VJzOGZnrA250R9Pscg3rj%2BXf8i8RG5xtLEMEY58Hq%2Fn1xE9L4HmcE%2FfYizOtJKGMhf%2Blhv2z1GC4yhFTw0KXN2c2Q6el%2Fp%2FSOldQBD0pZpOkLZ21m1ZwMPbouNUGOqUBVB1OCNiHFXrt%2BgvHqOwudNvbeHnZ2Bkf8oLqjBbFL7XMoIjEjyp4pDq6zGHrrMJKcoO01r13%2FWVqFxJxlXWMn9bBCpTZlo2MB0V9r6GX0t2kSm5uYz%2BX3gi5N4jQkEqNhl%2FmA53%2FDWWNZM%2F5nKcnOeEiwGKQ%2BgyvVAUP0NCdtGc9yKKANSSfwg6jI51IUvmfm1tX595D8oxYZdWcrbTaR%2FLbrshu&X-Amz-Signature=d4abf1843635cba898bb84d5e703b4826c0a4c058f2b78583a37e226b073ec84&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
