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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TDKDQUI6%2F20260903%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260903T201534Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBoaCXVzLXdlc3QtMiJIMEYCIQC3zECoi7mF4rpK%2BimKqNTuhpt%2BnGb9T1ULIM2a1BXVKQIhAP56TX8xzps3msuAitJvm%2FPl0QZBa5PztqbYafi8BoqSKogECOP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzDBkb347zYA2JpNMcq3AOHgTzUypZglyda0d6Of4HOr%2BmLvducaAxWyP%2FCxWY9oAzNfiFDUs4e7cUEhoA1GcpFNpn2BE1ojS9RTpqvZKs6jHBE0wqP1rPWwu73N8KrqTusV9NtM08MdQPnn%2BvGnjXFxKpsWxgD3%2B16y5rIdKK3%2BLBl0eB7HBGhMJGGBN7WQ5zh2%2FkQrg7qSZgHwv5AxOIILJMH7kCFdvwNYId%2FXDGuipZ%2F1QvL2jUmuv2EyCXf7umwb8YSp1kV7HuTNE4Zo3MqUpcC5MxYHWGnAc2If7ucVeFAuB2pncfFSb%2BuPyDeLhFWPWp8kOvkhTSrV%2FLdAARW9z8KiyQklObWq7eTxdO7wK9KfYSOTrc%2FGvK%2FLRgGYLueAU4Fa6CyBAEnSCB4TZT77iUgEqXuPxpKFSzAd9e54TqNlCg6zwJPG45wbuxbWYzIA2Qa8Ss63GNB02WT6TucGaejqbCzOtJKzin%2BZ0pi6Qn%2FEeh0mwMLTvbHe4kVvBuWeysP20DS8%2F9uJnkjmQOzBsM9fE1VJyyaxlgHxji9tFgy2eZHhHGPAcB4vr%2BY12ZliVVUiP5ApCmYXKgsGVwIDwe0fquudCteVmGRXvkKzp31tD4jt5UjlF0yYZYJFxNiz%2FcdkCBEHLRU%2BTDt5%2BbUBjqkAcjoyAEUjKi98GcdDmNlWHevy9%2F73y6NKwY66oBN5o%2Fgd6PLsYygL0lJwigBGKug%2Bwxi62A%2FiTqQ%2BRUj%2BP%2F%2F7Jmzf9W75azyr6lrjaUfuCu0OtTurl7eUeqtnkb2xyU63rLzXss2C9wRb5xBsD3nFQMR3vrq5TLjZumyYyN1A5gOo2dE2Ib5%2FrobNKW146K46QsC4mPlZL3hpsYcsNt0g8Di%2F%2Be0&X-Amz-Signature=74814627a7c7eb075a5730b22caacc3accdd6fb7ed5e9e9c12c01320b11883dc&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TDKDQUI6%2F20260903%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260903T201534Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBoaCXVzLXdlc3QtMiJIMEYCIQC3zECoi7mF4rpK%2BimKqNTuhpt%2BnGb9T1ULIM2a1BXVKQIhAP56TX8xzps3msuAitJvm%2FPl0QZBa5PztqbYafi8BoqSKogECOP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzDBkb347zYA2JpNMcq3AOHgTzUypZglyda0d6Of4HOr%2BmLvducaAxWyP%2FCxWY9oAzNfiFDUs4e7cUEhoA1GcpFNpn2BE1ojS9RTpqvZKs6jHBE0wqP1rPWwu73N8KrqTusV9NtM08MdQPnn%2BvGnjXFxKpsWxgD3%2B16y5rIdKK3%2BLBl0eB7HBGhMJGGBN7WQ5zh2%2FkQrg7qSZgHwv5AxOIILJMH7kCFdvwNYId%2FXDGuipZ%2F1QvL2jUmuv2EyCXf7umwb8YSp1kV7HuTNE4Zo3MqUpcC5MxYHWGnAc2If7ucVeFAuB2pncfFSb%2BuPyDeLhFWPWp8kOvkhTSrV%2FLdAARW9z8KiyQklObWq7eTxdO7wK9KfYSOTrc%2FGvK%2FLRgGYLueAU4Fa6CyBAEnSCB4TZT77iUgEqXuPxpKFSzAd9e54TqNlCg6zwJPG45wbuxbWYzIA2Qa8Ss63GNB02WT6TucGaejqbCzOtJKzin%2BZ0pi6Qn%2FEeh0mwMLTvbHe4kVvBuWeysP20DS8%2F9uJnkjmQOzBsM9fE1VJyyaxlgHxji9tFgy2eZHhHGPAcB4vr%2BY12ZliVVUiP5ApCmYXKgsGVwIDwe0fquudCteVmGRXvkKzp31tD4jt5UjlF0yYZYJFxNiz%2FcdkCBEHLRU%2BTDt5%2BbUBjqkAcjoyAEUjKi98GcdDmNlWHevy9%2F73y6NKwY66oBN5o%2Fgd6PLsYygL0lJwigBGKug%2Bwxi62A%2FiTqQ%2BRUj%2BP%2F%2F7Jmzf9W75azyr6lrjaUfuCu0OtTurl7eUeqtnkb2xyU63rLzXss2C9wRb5xBsD3nFQMR3vrq5TLjZumyYyN1A5gOo2dE2Ib5%2FrobNKW146K46QsC4mPlZL3hpsYcsNt0g8Di%2F%2Be0&X-Amz-Signature=6bdc262a675b597ef9b3bf2a214f2c6aa5845eba3238ca62116582110e9ff91d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TDKDQUI6%2F20260903%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260903T201534Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBoaCXVzLXdlc3QtMiJIMEYCIQC3zECoi7mF4rpK%2BimKqNTuhpt%2BnGb9T1ULIM2a1BXVKQIhAP56TX8xzps3msuAitJvm%2FPl0QZBa5PztqbYafi8BoqSKogECOP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzDBkb347zYA2JpNMcq3AOHgTzUypZglyda0d6Of4HOr%2BmLvducaAxWyP%2FCxWY9oAzNfiFDUs4e7cUEhoA1GcpFNpn2BE1ojS9RTpqvZKs6jHBE0wqP1rPWwu73N8KrqTusV9NtM08MdQPnn%2BvGnjXFxKpsWxgD3%2B16y5rIdKK3%2BLBl0eB7HBGhMJGGBN7WQ5zh2%2FkQrg7qSZgHwv5AxOIILJMH7kCFdvwNYId%2FXDGuipZ%2F1QvL2jUmuv2EyCXf7umwb8YSp1kV7HuTNE4Zo3MqUpcC5MxYHWGnAc2If7ucVeFAuB2pncfFSb%2BuPyDeLhFWPWp8kOvkhTSrV%2FLdAARW9z8KiyQklObWq7eTxdO7wK9KfYSOTrc%2FGvK%2FLRgGYLueAU4Fa6CyBAEnSCB4TZT77iUgEqXuPxpKFSzAd9e54TqNlCg6zwJPG45wbuxbWYzIA2Qa8Ss63GNB02WT6TucGaejqbCzOtJKzin%2BZ0pi6Qn%2FEeh0mwMLTvbHe4kVvBuWeysP20DS8%2F9uJnkjmQOzBsM9fE1VJyyaxlgHxji9tFgy2eZHhHGPAcB4vr%2BY12ZliVVUiP5ApCmYXKgsGVwIDwe0fquudCteVmGRXvkKzp31tD4jt5UjlF0yYZYJFxNiz%2FcdkCBEHLRU%2BTDt5%2BbUBjqkAcjoyAEUjKi98GcdDmNlWHevy9%2F73y6NKwY66oBN5o%2Fgd6PLsYygL0lJwigBGKug%2Bwxi62A%2FiTqQ%2BRUj%2BP%2F%2F7Jmzf9W75azyr6lrjaUfuCu0OtTurl7eUeqtnkb2xyU63rLzXss2C9wRb5xBsD3nFQMR3vrq5TLjZumyYyN1A5gOo2dE2Ib5%2FrobNKW146K46QsC4mPlZL3hpsYcsNt0g8Di%2F%2Be0&X-Amz-Signature=a0844b15c288ed51e716033805ab44fa2f04566e503ff40c38fdf5ff24184c0b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TDKDQUI6%2F20260903%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260903T201534Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBoaCXVzLXdlc3QtMiJIMEYCIQC3zECoi7mF4rpK%2BimKqNTuhpt%2BnGb9T1ULIM2a1BXVKQIhAP56TX8xzps3msuAitJvm%2FPl0QZBa5PztqbYafi8BoqSKogECOP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzDBkb347zYA2JpNMcq3AOHgTzUypZglyda0d6Of4HOr%2BmLvducaAxWyP%2FCxWY9oAzNfiFDUs4e7cUEhoA1GcpFNpn2BE1ojS9RTpqvZKs6jHBE0wqP1rPWwu73N8KrqTusV9NtM08MdQPnn%2BvGnjXFxKpsWxgD3%2B16y5rIdKK3%2BLBl0eB7HBGhMJGGBN7WQ5zh2%2FkQrg7qSZgHwv5AxOIILJMH7kCFdvwNYId%2FXDGuipZ%2F1QvL2jUmuv2EyCXf7umwb8YSp1kV7HuTNE4Zo3MqUpcC5MxYHWGnAc2If7ucVeFAuB2pncfFSb%2BuPyDeLhFWPWp8kOvkhTSrV%2FLdAARW9z8KiyQklObWq7eTxdO7wK9KfYSOTrc%2FGvK%2FLRgGYLueAU4Fa6CyBAEnSCB4TZT77iUgEqXuPxpKFSzAd9e54TqNlCg6zwJPG45wbuxbWYzIA2Qa8Ss63GNB02WT6TucGaejqbCzOtJKzin%2BZ0pi6Qn%2FEeh0mwMLTvbHe4kVvBuWeysP20DS8%2F9uJnkjmQOzBsM9fE1VJyyaxlgHxji9tFgy2eZHhHGPAcB4vr%2BY12ZliVVUiP5ApCmYXKgsGVwIDwe0fquudCteVmGRXvkKzp31tD4jt5UjlF0yYZYJFxNiz%2FcdkCBEHLRU%2BTDt5%2BbUBjqkAcjoyAEUjKi98GcdDmNlWHevy9%2F73y6NKwY66oBN5o%2Fgd6PLsYygL0lJwigBGKug%2Bwxi62A%2FiTqQ%2BRUj%2BP%2F%2F7Jmzf9W75azyr6lrjaUfuCu0OtTurl7eUeqtnkb2xyU63rLzXss2C9wRb5xBsD3nFQMR3vrq5TLjZumyYyN1A5gOo2dE2Ib5%2FrobNKW146K46QsC4mPlZL3hpsYcsNt0g8Di%2F%2Be0&X-Amz-Signature=d2da550b4d372b6f40bc84758ed6290c0111e770933738fe67cd3febcda03d57&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
