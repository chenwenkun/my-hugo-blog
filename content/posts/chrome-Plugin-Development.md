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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Z7EHLW67%2F20260808%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260808T182052Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDvYe8f1KBx4vwi%2BnkhhUUZ6lsD8geqDTOZ5z2ju%2FHb0AIgOvMr%2B0khKFcHivltV%2BsUE9xVh2Cx%2F1W9qQ%2F%2B3rtFbeMq%2FwMIcxAAGgw2Mzc0MjMxODM4MDUiDOH4zH6Grt8SkAXEYyrcAybajmyOV4A%2BvASSMASgIpSYbWIwQLKBIHzb6MHd3oMcgU%2F1IZtdp4zvUaS1yI1Sx8OSUdGBELy7%2FRa4iNcuYK9uPB0tRtT6YWT3nGl8y06V5mS%2F4q3ZciXS8OvQUr0TfdK7rR4kF0woONWWCVsIcLwXNzgaRQCrGPff107asehKIzKbdoWEeH40G%2F7oimEOOMLUbuIzBmPJB1ft5xSBPWXYYVEYRnKLktq15otpLaDqrUMvHPZWSFyiB4qT8yrqiqFu3v7OvoHW9Wn3Sd8wYzMk0re1X%2FNssa%2FjxvN5T5bizb%2FEkhev%2F0p7ZE84IPN3iQgAAJuJBP59Tii0Js69koKg9qp3JbqNH2MOKuPRK6KvendANYf%2Br05PGDzzcp3FxWYJz9OO7VZAG0hvDxIhNtpYS%2F13F9cPI311Hbrx76pbk8bCmH%2FOB8uOb5GZgHbC2h%2BCbbOAkN47%2BvbYKt%2F5ItExO2cCMiydUF2UBMDuPQbOHojlV%2BUHkIkzlSUWoEDuydJ9kPl4N9AyPF%2Fqheol092DUTAN7zk4XCE72biHUr18JRzZR3HstLuLvxdjhCCAGtum6W0D5cNbVyLkQgV6c5atOWAiJzsBzj9mZh4m56w%2FhES9y2PiA23senkuMIzT3dMGOqUB8wQ5OWiGP1cGHStCX5l96Ewoc6W8%2Fh6v2flwOWVpz3AmD8ow8XBnbyVtmJRQsfNiqIAmeNMN%2B33XUVWsTWKA4sVucopk6%2F5T7m6V6INFUbXNyMa%2FYGEUx3QSDGHFV4UsYKNSdY4H%2FTjncerfxxSnpQ3zDql7Fb5RRyDddEEq5kmd%2Bt1ESPFrxxeRltUKeUxm%2BAKRyh4sMo5hFEvebH5mujgOMnrJ&X-Amz-Signature=c830d5caf59a8a42fdec560d56d040274eedb964a59489aff6deca92170b4ccd&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Z7EHLW67%2F20260808%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260808T182052Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDvYe8f1KBx4vwi%2BnkhhUUZ6lsD8geqDTOZ5z2ju%2FHb0AIgOvMr%2B0khKFcHivltV%2BsUE9xVh2Cx%2F1W9qQ%2F%2B3rtFbeMq%2FwMIcxAAGgw2Mzc0MjMxODM4MDUiDOH4zH6Grt8SkAXEYyrcAybajmyOV4A%2BvASSMASgIpSYbWIwQLKBIHzb6MHd3oMcgU%2F1IZtdp4zvUaS1yI1Sx8OSUdGBELy7%2FRa4iNcuYK9uPB0tRtT6YWT3nGl8y06V5mS%2F4q3ZciXS8OvQUr0TfdK7rR4kF0woONWWCVsIcLwXNzgaRQCrGPff107asehKIzKbdoWEeH40G%2F7oimEOOMLUbuIzBmPJB1ft5xSBPWXYYVEYRnKLktq15otpLaDqrUMvHPZWSFyiB4qT8yrqiqFu3v7OvoHW9Wn3Sd8wYzMk0re1X%2FNssa%2FjxvN5T5bizb%2FEkhev%2F0p7ZE84IPN3iQgAAJuJBP59Tii0Js69koKg9qp3JbqNH2MOKuPRK6KvendANYf%2Br05PGDzzcp3FxWYJz9OO7VZAG0hvDxIhNtpYS%2F13F9cPI311Hbrx76pbk8bCmH%2FOB8uOb5GZgHbC2h%2BCbbOAkN47%2BvbYKt%2F5ItExO2cCMiydUF2UBMDuPQbOHojlV%2BUHkIkzlSUWoEDuydJ9kPl4N9AyPF%2Fqheol092DUTAN7zk4XCE72biHUr18JRzZR3HstLuLvxdjhCCAGtum6W0D5cNbVyLkQgV6c5atOWAiJzsBzj9mZh4m56w%2FhES9y2PiA23senkuMIzT3dMGOqUB8wQ5OWiGP1cGHStCX5l96Ewoc6W8%2Fh6v2flwOWVpz3AmD8ow8XBnbyVtmJRQsfNiqIAmeNMN%2B33XUVWsTWKA4sVucopk6%2F5T7m6V6INFUbXNyMa%2FYGEUx3QSDGHFV4UsYKNSdY4H%2FTjncerfxxSnpQ3zDql7Fb5RRyDddEEq5kmd%2Bt1ESPFrxxeRltUKeUxm%2BAKRyh4sMo5hFEvebH5mujgOMnrJ&X-Amz-Signature=c7a6f7862273915f932523fe3864ef3ff33a5895a357460f0ae2072231d19e9d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Z7EHLW67%2F20260808%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260808T182052Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDvYe8f1KBx4vwi%2BnkhhUUZ6lsD8geqDTOZ5z2ju%2FHb0AIgOvMr%2B0khKFcHivltV%2BsUE9xVh2Cx%2F1W9qQ%2F%2B3rtFbeMq%2FwMIcxAAGgw2Mzc0MjMxODM4MDUiDOH4zH6Grt8SkAXEYyrcAybajmyOV4A%2BvASSMASgIpSYbWIwQLKBIHzb6MHd3oMcgU%2F1IZtdp4zvUaS1yI1Sx8OSUdGBELy7%2FRa4iNcuYK9uPB0tRtT6YWT3nGl8y06V5mS%2F4q3ZciXS8OvQUr0TfdK7rR4kF0woONWWCVsIcLwXNzgaRQCrGPff107asehKIzKbdoWEeH40G%2F7oimEOOMLUbuIzBmPJB1ft5xSBPWXYYVEYRnKLktq15otpLaDqrUMvHPZWSFyiB4qT8yrqiqFu3v7OvoHW9Wn3Sd8wYzMk0re1X%2FNssa%2FjxvN5T5bizb%2FEkhev%2F0p7ZE84IPN3iQgAAJuJBP59Tii0Js69koKg9qp3JbqNH2MOKuPRK6KvendANYf%2Br05PGDzzcp3FxWYJz9OO7VZAG0hvDxIhNtpYS%2F13F9cPI311Hbrx76pbk8bCmH%2FOB8uOb5GZgHbC2h%2BCbbOAkN47%2BvbYKt%2F5ItExO2cCMiydUF2UBMDuPQbOHojlV%2BUHkIkzlSUWoEDuydJ9kPl4N9AyPF%2Fqheol092DUTAN7zk4XCE72biHUr18JRzZR3HstLuLvxdjhCCAGtum6W0D5cNbVyLkQgV6c5atOWAiJzsBzj9mZh4m56w%2FhES9y2PiA23senkuMIzT3dMGOqUB8wQ5OWiGP1cGHStCX5l96Ewoc6W8%2Fh6v2flwOWVpz3AmD8ow8XBnbyVtmJRQsfNiqIAmeNMN%2B33XUVWsTWKA4sVucopk6%2F5T7m6V6INFUbXNyMa%2FYGEUx3QSDGHFV4UsYKNSdY4H%2FTjncerfxxSnpQ3zDql7Fb5RRyDddEEq5kmd%2Bt1ESPFrxxeRltUKeUxm%2BAKRyh4sMo5hFEvebH5mujgOMnrJ&X-Amz-Signature=e5db4eb842639d3cee8858bfb3d66913275791f72ef52e5b5af9e1ac54e7fcf7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Z7EHLW67%2F20260808%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260808T182052Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDvYe8f1KBx4vwi%2BnkhhUUZ6lsD8geqDTOZ5z2ju%2FHb0AIgOvMr%2B0khKFcHivltV%2BsUE9xVh2Cx%2F1W9qQ%2F%2B3rtFbeMq%2FwMIcxAAGgw2Mzc0MjMxODM4MDUiDOH4zH6Grt8SkAXEYyrcAybajmyOV4A%2BvASSMASgIpSYbWIwQLKBIHzb6MHd3oMcgU%2F1IZtdp4zvUaS1yI1Sx8OSUdGBELy7%2FRa4iNcuYK9uPB0tRtT6YWT3nGl8y06V5mS%2F4q3ZciXS8OvQUr0TfdK7rR4kF0woONWWCVsIcLwXNzgaRQCrGPff107asehKIzKbdoWEeH40G%2F7oimEOOMLUbuIzBmPJB1ft5xSBPWXYYVEYRnKLktq15otpLaDqrUMvHPZWSFyiB4qT8yrqiqFu3v7OvoHW9Wn3Sd8wYzMk0re1X%2FNssa%2FjxvN5T5bizb%2FEkhev%2F0p7ZE84IPN3iQgAAJuJBP59Tii0Js69koKg9qp3JbqNH2MOKuPRK6KvendANYf%2Br05PGDzzcp3FxWYJz9OO7VZAG0hvDxIhNtpYS%2F13F9cPI311Hbrx76pbk8bCmH%2FOB8uOb5GZgHbC2h%2BCbbOAkN47%2BvbYKt%2F5ItExO2cCMiydUF2UBMDuPQbOHojlV%2BUHkIkzlSUWoEDuydJ9kPl4N9AyPF%2Fqheol092DUTAN7zk4XCE72biHUr18JRzZR3HstLuLvxdjhCCAGtum6W0D5cNbVyLkQgV6c5atOWAiJzsBzj9mZh4m56w%2FhES9y2PiA23senkuMIzT3dMGOqUB8wQ5OWiGP1cGHStCX5l96Ewoc6W8%2Fh6v2flwOWVpz3AmD8ow8XBnbyVtmJRQsfNiqIAmeNMN%2B33XUVWsTWKA4sVucopk6%2F5T7m6V6INFUbXNyMa%2FYGEUx3QSDGHFV4UsYKNSdY4H%2FTjncerfxxSnpQ3zDql7Fb5RRyDddEEq5kmd%2Bt1ESPFrxxeRltUKeUxm%2BAKRyh4sMo5hFEvebH5mujgOMnrJ&X-Amz-Signature=825fda1ce60c151d8ed5ccb4520bed3e4051624a014c9370f2858d36ae6b3e17&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
