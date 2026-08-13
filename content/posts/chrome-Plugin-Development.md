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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662WFFGPKE%2F20260813%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260813T071011Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBYaCXVzLXdlc3QtMiJGMEQCIBFsNEuRvX8neracv%2BKsC8RH7H6zahNoatK5p8SWj3emAiBYSo27lLxvenq6mI9An042DrHut66Y1f7DX2t5OPxmjyqIBAjf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMXHHDEy7dUFXG%2FgLcKtwDc%2FkvTq%2Fq2j7KjYU0e10uVuolysUhXi%2Bv3P5ReB67HE8i4rzhQH61S1sUC0pyZaP0MIFM2idL8A1YsyIt7mC7RPNkTuczwHRaSpfmgr26Q8IuWQqpuJ7fwJJLjcwvbAv5FTfmMgYXuwr6I7jVYu1ce%2FYu02Y1cbA0Ksz1RqmMiv2qk54MGvAxQ%2FkQeq9lISl%2BXgQHVUeOq4AvNCzPbIKw1tsKrkvhnyfkf3sIk2uUUKXqnJF%2BJgz5FMEBrZy0n65Lz3I5ZY4T%2B%2FZ7b3Kyz0LeZjVvCaGzgkKUAZzbHF1SLnpOA83VMTWX3tnc4qrBhZ0Lji8%2BZwBpOOcaxVRmB%2BE2x6QFTqRrDJ2MoTMDl8EUae7ft9Ircvp7WglUIJK%2Bx%2Fv1NBFFpNcHflJqYhSeYTC0cTg%2FI1SK4uC1wduujwqEUw8njuEX65ZEjgL8PmKrtN4BLytHIuxu%2Fu3O33oAI2n72DiSWxkuAwP4vME%2FikhQoZQ4xvD4qZ7pDVPnbU3gSRSFSqV4aGmCFzMqSj50PTmrgRV0nIiovBwD7iQN81tE4Jba0Ra6xcHx0%2FrGzwcUxqJ1RFNMiIt5BAFfQHnoEWFTXjYSlUxGr5OsFumJxgjykZuKuD0vFhIuOPPy%2B1Ew%2F7r10wY6pgE%2BPlITSG9qArpNatR77b2pHPpDWYYkyEdSvTBW461Yg0pnKmIe%2BuBfzLTCHEl139oucLHeoSeBI7l%2BcubImAWfppDBJFh5ZXVwe44favdclBSlrD0rBNc4m6FVlJ5Y%2BsAr2DtkK9riFkUND%2FtKZ%2F%2FKPplRCl4yf%2BNs1c0KPN7bjqDue%2Fo4rVnQ8OM0nYDGk5YuWjlnxBrnr2ApQp88G7Pj2igX6c6C&X-Amz-Signature=447982e6bd97b9267134237c6c07d80258162e2d6d7cb86abd3b385dab8b58e5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662WFFGPKE%2F20260813%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260813T071011Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBYaCXVzLXdlc3QtMiJGMEQCIBFsNEuRvX8neracv%2BKsC8RH7H6zahNoatK5p8SWj3emAiBYSo27lLxvenq6mI9An042DrHut66Y1f7DX2t5OPxmjyqIBAjf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMXHHDEy7dUFXG%2FgLcKtwDc%2FkvTq%2Fq2j7KjYU0e10uVuolysUhXi%2Bv3P5ReB67HE8i4rzhQH61S1sUC0pyZaP0MIFM2idL8A1YsyIt7mC7RPNkTuczwHRaSpfmgr26Q8IuWQqpuJ7fwJJLjcwvbAv5FTfmMgYXuwr6I7jVYu1ce%2FYu02Y1cbA0Ksz1RqmMiv2qk54MGvAxQ%2FkQeq9lISl%2BXgQHVUeOq4AvNCzPbIKw1tsKrkvhnyfkf3sIk2uUUKXqnJF%2BJgz5FMEBrZy0n65Lz3I5ZY4T%2B%2FZ7b3Kyz0LeZjVvCaGzgkKUAZzbHF1SLnpOA83VMTWX3tnc4qrBhZ0Lji8%2BZwBpOOcaxVRmB%2BE2x6QFTqRrDJ2MoTMDl8EUae7ft9Ircvp7WglUIJK%2Bx%2Fv1NBFFpNcHflJqYhSeYTC0cTg%2FI1SK4uC1wduujwqEUw8njuEX65ZEjgL8PmKrtN4BLytHIuxu%2Fu3O33oAI2n72DiSWxkuAwP4vME%2FikhQoZQ4xvD4qZ7pDVPnbU3gSRSFSqV4aGmCFzMqSj50PTmrgRV0nIiovBwD7iQN81tE4Jba0Ra6xcHx0%2FrGzwcUxqJ1RFNMiIt5BAFfQHnoEWFTXjYSlUxGr5OsFumJxgjykZuKuD0vFhIuOPPy%2B1Ew%2F7r10wY6pgE%2BPlITSG9qArpNatR77b2pHPpDWYYkyEdSvTBW461Yg0pnKmIe%2BuBfzLTCHEl139oucLHeoSeBI7l%2BcubImAWfppDBJFh5ZXVwe44favdclBSlrD0rBNc4m6FVlJ5Y%2BsAr2DtkK9riFkUND%2FtKZ%2F%2FKPplRCl4yf%2BNs1c0KPN7bjqDue%2Fo4rVnQ8OM0nYDGk5YuWjlnxBrnr2ApQp88G7Pj2igX6c6C&X-Amz-Signature=92eecea42918f81bdeb511269a837f26c254934d803d4032b76cb50ba509691e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662WFFGPKE%2F20260813%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260813T071011Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBYaCXVzLXdlc3QtMiJGMEQCIBFsNEuRvX8neracv%2BKsC8RH7H6zahNoatK5p8SWj3emAiBYSo27lLxvenq6mI9An042DrHut66Y1f7DX2t5OPxmjyqIBAjf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMXHHDEy7dUFXG%2FgLcKtwDc%2FkvTq%2Fq2j7KjYU0e10uVuolysUhXi%2Bv3P5ReB67HE8i4rzhQH61S1sUC0pyZaP0MIFM2idL8A1YsyIt7mC7RPNkTuczwHRaSpfmgr26Q8IuWQqpuJ7fwJJLjcwvbAv5FTfmMgYXuwr6I7jVYu1ce%2FYu02Y1cbA0Ksz1RqmMiv2qk54MGvAxQ%2FkQeq9lISl%2BXgQHVUeOq4AvNCzPbIKw1tsKrkvhnyfkf3sIk2uUUKXqnJF%2BJgz5FMEBrZy0n65Lz3I5ZY4T%2B%2FZ7b3Kyz0LeZjVvCaGzgkKUAZzbHF1SLnpOA83VMTWX3tnc4qrBhZ0Lji8%2BZwBpOOcaxVRmB%2BE2x6QFTqRrDJ2MoTMDl8EUae7ft9Ircvp7WglUIJK%2Bx%2Fv1NBFFpNcHflJqYhSeYTC0cTg%2FI1SK4uC1wduujwqEUw8njuEX65ZEjgL8PmKrtN4BLytHIuxu%2Fu3O33oAI2n72DiSWxkuAwP4vME%2FikhQoZQ4xvD4qZ7pDVPnbU3gSRSFSqV4aGmCFzMqSj50PTmrgRV0nIiovBwD7iQN81tE4Jba0Ra6xcHx0%2FrGzwcUxqJ1RFNMiIt5BAFfQHnoEWFTXjYSlUxGr5OsFumJxgjykZuKuD0vFhIuOPPy%2B1Ew%2F7r10wY6pgE%2BPlITSG9qArpNatR77b2pHPpDWYYkyEdSvTBW461Yg0pnKmIe%2BuBfzLTCHEl139oucLHeoSeBI7l%2BcubImAWfppDBJFh5ZXVwe44favdclBSlrD0rBNc4m6FVlJ5Y%2BsAr2DtkK9riFkUND%2FtKZ%2F%2FKPplRCl4yf%2BNs1c0KPN7bjqDue%2Fo4rVnQ8OM0nYDGk5YuWjlnxBrnr2ApQp88G7Pj2igX6c6C&X-Amz-Signature=53a831d0c56ce9105b8d1e3ae048f9862a36796d6d18f0e2c77c2d2beb47e906&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662WFFGPKE%2F20260813%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260813T071011Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBYaCXVzLXdlc3QtMiJGMEQCIBFsNEuRvX8neracv%2BKsC8RH7H6zahNoatK5p8SWj3emAiBYSo27lLxvenq6mI9An042DrHut66Y1f7DX2t5OPxmjyqIBAjf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMXHHDEy7dUFXG%2FgLcKtwDc%2FkvTq%2Fq2j7KjYU0e10uVuolysUhXi%2Bv3P5ReB67HE8i4rzhQH61S1sUC0pyZaP0MIFM2idL8A1YsyIt7mC7RPNkTuczwHRaSpfmgr26Q8IuWQqpuJ7fwJJLjcwvbAv5FTfmMgYXuwr6I7jVYu1ce%2FYu02Y1cbA0Ksz1RqmMiv2qk54MGvAxQ%2FkQeq9lISl%2BXgQHVUeOq4AvNCzPbIKw1tsKrkvhnyfkf3sIk2uUUKXqnJF%2BJgz5FMEBrZy0n65Lz3I5ZY4T%2B%2FZ7b3Kyz0LeZjVvCaGzgkKUAZzbHF1SLnpOA83VMTWX3tnc4qrBhZ0Lji8%2BZwBpOOcaxVRmB%2BE2x6QFTqRrDJ2MoTMDl8EUae7ft9Ircvp7WglUIJK%2Bx%2Fv1NBFFpNcHflJqYhSeYTC0cTg%2FI1SK4uC1wduujwqEUw8njuEX65ZEjgL8PmKrtN4BLytHIuxu%2Fu3O33oAI2n72DiSWxkuAwP4vME%2FikhQoZQ4xvD4qZ7pDVPnbU3gSRSFSqV4aGmCFzMqSj50PTmrgRV0nIiovBwD7iQN81tE4Jba0Ra6xcHx0%2FrGzwcUxqJ1RFNMiIt5BAFfQHnoEWFTXjYSlUxGr5OsFumJxgjykZuKuD0vFhIuOPPy%2B1Ew%2F7r10wY6pgE%2BPlITSG9qArpNatR77b2pHPpDWYYkyEdSvTBW461Yg0pnKmIe%2BuBfzLTCHEl139oucLHeoSeBI7l%2BcubImAWfppDBJFh5ZXVwe44favdclBSlrD0rBNc4m6FVlJ5Y%2BsAr2DtkK9riFkUND%2FtKZ%2F%2FKPplRCl4yf%2BNs1c0KPN7bjqDue%2Fo4rVnQ8OM0nYDGk5YuWjlnxBrnr2ApQp88G7Pj2igX6c6C&X-Amz-Signature=da902e5b7f734c6f504e9fe1234542ecb86c0a7433b2b01ca56de6339fe092a9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
