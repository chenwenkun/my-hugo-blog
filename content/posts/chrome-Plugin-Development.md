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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZXXXKQW3%2F20261127%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261127T011500Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEP7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDjdmDB2w0bFU9KyDtgzbj%2Flt7NFXvMoTNMgl9uDVZyzAiBg7iWXExPPxJbpCoGNTIjPAs%2BDsEGUZbqy4inDLiBTpyqIBAjH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM13ogDialx5Ffr3zWKtwDoTB8kkpd5ukvlyC%2FJ1hFNYCB%2Fizia0F7TPBL%2FlA5%2BTD8GosnLef4%2Fi4Q9xoEPA44L0f%2FSEpCp%2BMSyvWi20zUftHL%2Ffne%2FzPuYrCzjJY6qRKr8lA5VGn%2FRnZjtfyqN3PC4dOuYNqqAMQ2l3C0GyssbQVvN2kDTQvgGPQTYBHalb38KdAFji4M1Ik%2BkydlxidJ86jrng0YSES2vlxYSxKmFML6CyPCv%2Fgz8x2%2FvnE5P49qML8uxKrf0BLzkh3CqMB1sbQXCR8cWmmluY3vEpbeAaf7IsJZKtU94TK5HcAw9TS3XKOElstSdChOwsaPHfW5AVTlhzv9f32I73E04qETdWInmDpvneVHyDx85Rmz4NjjptaOdnnYVX8lKXpGy1Hdft0CxeQyez4EkCZ1QkOEs79ZEoJx4PhFXUgOqaDsOq2kqq1C%2BAyC0%2Fo0IqYdiTASm3EQJxsJJscmtOXuMCegFGGLFJmfAsUC6tS1K0RZBREIXHg%2BkYvBtlJzSG%2Bpbv9bIitmcRM9fnoU%2BfC9ws3bz%2F9sjDpPIzwjyGn8gDMLMo3ngYuMidaOV2I1S5DrOk2eCU%2FGxSI%2BYgC%2BV4FEVR3bvqmgf9T2lFguKfOwwlB2TO7pxblFJnptQFR0BX0w0Nei2AY6pgFoOHUbyEzjjGpWB6NvOKtKTzJBfKCPNKAibCNFVnUNf1j4wHW4Y6fpatiFJ6FJWK0vRhmtacYkdg6Ia3lGtAzJ%2FU7o9aoiSbdM63EmC0n09M8b3vqTh%2BV2XCYVbW%2Bb%2Bjh0Jn2Vxd%2B9Sy0XtDnL0WRZPFjz3ZpN8pxMqzFLoj71FvIebAmbHUsjOAz1CVH7Gp98Phm4%2BnG4a%2F6d6ITjpRDeth9Mio8O&X-Amz-Signature=3bd1b7f84a72418b25ababa3cb5939c92e66f0572336effcc80ee94bb9b7b6c1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZXXXKQW3%2F20261127%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261127T011500Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEP7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDjdmDB2w0bFU9KyDtgzbj%2Flt7NFXvMoTNMgl9uDVZyzAiBg7iWXExPPxJbpCoGNTIjPAs%2BDsEGUZbqy4inDLiBTpyqIBAjH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM13ogDialx5Ffr3zWKtwDoTB8kkpd5ukvlyC%2FJ1hFNYCB%2Fizia0F7TPBL%2FlA5%2BTD8GosnLef4%2Fi4Q9xoEPA44L0f%2FSEpCp%2BMSyvWi20zUftHL%2Ffne%2FzPuYrCzjJY6qRKr8lA5VGn%2FRnZjtfyqN3PC4dOuYNqqAMQ2l3C0GyssbQVvN2kDTQvgGPQTYBHalb38KdAFji4M1Ik%2BkydlxidJ86jrng0YSES2vlxYSxKmFML6CyPCv%2Fgz8x2%2FvnE5P49qML8uxKrf0BLzkh3CqMB1sbQXCR8cWmmluY3vEpbeAaf7IsJZKtU94TK5HcAw9TS3XKOElstSdChOwsaPHfW5AVTlhzv9f32I73E04qETdWInmDpvneVHyDx85Rmz4NjjptaOdnnYVX8lKXpGy1Hdft0CxeQyez4EkCZ1QkOEs79ZEoJx4PhFXUgOqaDsOq2kqq1C%2BAyC0%2Fo0IqYdiTASm3EQJxsJJscmtOXuMCegFGGLFJmfAsUC6tS1K0RZBREIXHg%2BkYvBtlJzSG%2Bpbv9bIitmcRM9fnoU%2BfC9ws3bz%2F9sjDpPIzwjyGn8gDMLMo3ngYuMidaOV2I1S5DrOk2eCU%2FGxSI%2BYgC%2BV4FEVR3bvqmgf9T2lFguKfOwwlB2TO7pxblFJnptQFR0BX0w0Nei2AY6pgFoOHUbyEzjjGpWB6NvOKtKTzJBfKCPNKAibCNFVnUNf1j4wHW4Y6fpatiFJ6FJWK0vRhmtacYkdg6Ia3lGtAzJ%2FU7o9aoiSbdM63EmC0n09M8b3vqTh%2BV2XCYVbW%2Bb%2Bjh0Jn2Vxd%2B9Sy0XtDnL0WRZPFjz3ZpN8pxMqzFLoj71FvIebAmbHUsjOAz1CVH7Gp98Phm4%2BnG4a%2F6d6ITjpRDeth9Mio8O&X-Amz-Signature=dbc8ec9ca5c6a6fff927272e1ae8b636eb6267df9dfb3f44845d7223833d7fc3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZXXXKQW3%2F20261127%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261127T011500Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEP7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDjdmDB2w0bFU9KyDtgzbj%2Flt7NFXvMoTNMgl9uDVZyzAiBg7iWXExPPxJbpCoGNTIjPAs%2BDsEGUZbqy4inDLiBTpyqIBAjH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM13ogDialx5Ffr3zWKtwDoTB8kkpd5ukvlyC%2FJ1hFNYCB%2Fizia0F7TPBL%2FlA5%2BTD8GosnLef4%2Fi4Q9xoEPA44L0f%2FSEpCp%2BMSyvWi20zUftHL%2Ffne%2FzPuYrCzjJY6qRKr8lA5VGn%2FRnZjtfyqN3PC4dOuYNqqAMQ2l3C0GyssbQVvN2kDTQvgGPQTYBHalb38KdAFji4M1Ik%2BkydlxidJ86jrng0YSES2vlxYSxKmFML6CyPCv%2Fgz8x2%2FvnE5P49qML8uxKrf0BLzkh3CqMB1sbQXCR8cWmmluY3vEpbeAaf7IsJZKtU94TK5HcAw9TS3XKOElstSdChOwsaPHfW5AVTlhzv9f32I73E04qETdWInmDpvneVHyDx85Rmz4NjjptaOdnnYVX8lKXpGy1Hdft0CxeQyez4EkCZ1QkOEs79ZEoJx4PhFXUgOqaDsOq2kqq1C%2BAyC0%2Fo0IqYdiTASm3EQJxsJJscmtOXuMCegFGGLFJmfAsUC6tS1K0RZBREIXHg%2BkYvBtlJzSG%2Bpbv9bIitmcRM9fnoU%2BfC9ws3bz%2F9sjDpPIzwjyGn8gDMLMo3ngYuMidaOV2I1S5DrOk2eCU%2FGxSI%2BYgC%2BV4FEVR3bvqmgf9T2lFguKfOwwlB2TO7pxblFJnptQFR0BX0w0Nei2AY6pgFoOHUbyEzjjGpWB6NvOKtKTzJBfKCPNKAibCNFVnUNf1j4wHW4Y6fpatiFJ6FJWK0vRhmtacYkdg6Ia3lGtAzJ%2FU7o9aoiSbdM63EmC0n09M8b3vqTh%2BV2XCYVbW%2Bb%2Bjh0Jn2Vxd%2B9Sy0XtDnL0WRZPFjz3ZpN8pxMqzFLoj71FvIebAmbHUsjOAz1CVH7Gp98Phm4%2BnG4a%2F6d6ITjpRDeth9Mio8O&X-Amz-Signature=1acbb3af3824d57b10d16783720435c2400230e9acc106e89bb5f771d97dd487&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZXXXKQW3%2F20261127%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261127T011500Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEP7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDjdmDB2w0bFU9KyDtgzbj%2Flt7NFXvMoTNMgl9uDVZyzAiBg7iWXExPPxJbpCoGNTIjPAs%2BDsEGUZbqy4inDLiBTpyqIBAjH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM13ogDialx5Ffr3zWKtwDoTB8kkpd5ukvlyC%2FJ1hFNYCB%2Fizia0F7TPBL%2FlA5%2BTD8GosnLef4%2Fi4Q9xoEPA44L0f%2FSEpCp%2BMSyvWi20zUftHL%2Ffne%2FzPuYrCzjJY6qRKr8lA5VGn%2FRnZjtfyqN3PC4dOuYNqqAMQ2l3C0GyssbQVvN2kDTQvgGPQTYBHalb38KdAFji4M1Ik%2BkydlxidJ86jrng0YSES2vlxYSxKmFML6CyPCv%2Fgz8x2%2FvnE5P49qML8uxKrf0BLzkh3CqMB1sbQXCR8cWmmluY3vEpbeAaf7IsJZKtU94TK5HcAw9TS3XKOElstSdChOwsaPHfW5AVTlhzv9f32I73E04qETdWInmDpvneVHyDx85Rmz4NjjptaOdnnYVX8lKXpGy1Hdft0CxeQyez4EkCZ1QkOEs79ZEoJx4PhFXUgOqaDsOq2kqq1C%2BAyC0%2Fo0IqYdiTASm3EQJxsJJscmtOXuMCegFGGLFJmfAsUC6tS1K0RZBREIXHg%2BkYvBtlJzSG%2Bpbv9bIitmcRM9fnoU%2BfC9ws3bz%2F9sjDpPIzwjyGn8gDMLMo3ngYuMidaOV2I1S5DrOk2eCU%2FGxSI%2BYgC%2BV4FEVR3bvqmgf9T2lFguKfOwwlB2TO7pxblFJnptQFR0BX0w0Nei2AY6pgFoOHUbyEzjjGpWB6NvOKtKTzJBfKCPNKAibCNFVnUNf1j4wHW4Y6fpatiFJ6FJWK0vRhmtacYkdg6Ia3lGtAzJ%2FU7o9aoiSbdM63EmC0n09M8b3vqTh%2BV2XCYVbW%2Bb%2Bjh0Jn2Vxd%2B9Sy0XtDnL0WRZPFjz3ZpN8pxMqzFLoj71FvIebAmbHUsjOAz1CVH7Gp98Phm4%2BnG4a%2F6d6ITjpRDeth9Mio8O&X-Amz-Signature=d742d01656125e80fba50d4aebcde94c4653fbcdecc485b7cd22e8ceb2a29a09&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
