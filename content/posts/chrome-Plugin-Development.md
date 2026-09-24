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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665IMR5ADP%2F20260924%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260924T020743Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAEaCXVzLXdlc3QtMiJGMEQCIGqjI5HfbMwstm68FWYvFqmP%2FHRz3DSINGb3CIDaMd12AiBWaAIbwpEGs89kT1s149X88QQIIbdhz2kX93D6jLmXyiqIBAjK%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMOvbhI5lmNV2O%2BIi2KtwDPzsSEVoylOL3In2bi%2BRs0mUU4543Qm455ns6miFzOJhGAGUmWcCEghuNi9RAXyzSceQFPUl6U%2Ff0i2R%2FSqhj6B6bfDozMazE%2B3C5eFViP9nPHzU7KEba0WDWNXnYudntnfiHezwlejojH4lHfjKhpWLvQQcbdhQo9M78anmCKLDCSL%2FAkM39PD5Iw5jMFNt0FxFU5nJ%2F%2F%2FKz%2F8XfTOTEbFT4dRjHUP%2FdILU5rsdSMY8qoD8zqdRv%2Bd0xkIgqkRiD5Ab5cGgiijbfvhq33S8SN5Ez5J8x47Xf4Fm80IcdgRshl9ZbRT2mmTgYG7Ihm3ahxUhP99FmZoDurFPSbLJa91T2PdCGR%2FxvTv8JI9oclXJWxadOeq%2FnSwCd8xJMcqugSN9TMJ6sllZ1nqsOL3%2BTBJw4N8t04rBLiLdT0Gf67%2FhxgQ0q1vHF9d%2BWUfN0570B0ihbxFhJ9I4%2FrByl3ufkt3jbDtzZIESqMEEWxFin1yXNfPr88fvHuXxD2xllUoXIZm35s%2B09pzbZauSKIkKu21AXWR4h5vgmxstoZavog1KVb%2FrVgOgQq1owtUe7Yeza1wYbzhpkHgCzbv52U%2F8pTg5q97UAJdsRfIsdtf1eBQ4tb8Gdu46qPUQLJHgw5OvR1QY6pgGCW4C5LSXZGRKjhucVu%2FGSTVHXUAjQgfT4ZTSti6521B2nF4nVBeOdPEhN6DqMjaUYQ0XQM7Ood42mY4Q%2Fff29hqpx6QFJGo4mQsmDDCWT%2FfG1Zp%2Bf0%2B9vbI9%2B0QLsO3FOyLJxv%2FN3Kza3obfvdPI97INvTJ21GcMSr2ORLEvmh%2BGzHLY4ck3pq03NSY7cGRUZ1zrtpA3TjmEMSgrimV5m%2BeCsMnws&X-Amz-Signature=bd654db25b446c1fd972d37b8087391f4ef44e28cf49e55fa5a16ca5a6655774&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665IMR5ADP%2F20260924%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260924T020743Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAEaCXVzLXdlc3QtMiJGMEQCIGqjI5HfbMwstm68FWYvFqmP%2FHRz3DSINGb3CIDaMd12AiBWaAIbwpEGs89kT1s149X88QQIIbdhz2kX93D6jLmXyiqIBAjK%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMOvbhI5lmNV2O%2BIi2KtwDPzsSEVoylOL3In2bi%2BRs0mUU4543Qm455ns6miFzOJhGAGUmWcCEghuNi9RAXyzSceQFPUl6U%2Ff0i2R%2FSqhj6B6bfDozMazE%2B3C5eFViP9nPHzU7KEba0WDWNXnYudntnfiHezwlejojH4lHfjKhpWLvQQcbdhQo9M78anmCKLDCSL%2FAkM39PD5Iw5jMFNt0FxFU5nJ%2F%2F%2FKz%2F8XfTOTEbFT4dRjHUP%2FdILU5rsdSMY8qoD8zqdRv%2Bd0xkIgqkRiD5Ab5cGgiijbfvhq33S8SN5Ez5J8x47Xf4Fm80IcdgRshl9ZbRT2mmTgYG7Ihm3ahxUhP99FmZoDurFPSbLJa91T2PdCGR%2FxvTv8JI9oclXJWxadOeq%2FnSwCd8xJMcqugSN9TMJ6sllZ1nqsOL3%2BTBJw4N8t04rBLiLdT0Gf67%2FhxgQ0q1vHF9d%2BWUfN0570B0ihbxFhJ9I4%2FrByl3ufkt3jbDtzZIESqMEEWxFin1yXNfPr88fvHuXxD2xllUoXIZm35s%2B09pzbZauSKIkKu21AXWR4h5vgmxstoZavog1KVb%2FrVgOgQq1owtUe7Yeza1wYbzhpkHgCzbv52U%2F8pTg5q97UAJdsRfIsdtf1eBQ4tb8Gdu46qPUQLJHgw5OvR1QY6pgGCW4C5LSXZGRKjhucVu%2FGSTVHXUAjQgfT4ZTSti6521B2nF4nVBeOdPEhN6DqMjaUYQ0XQM7Ood42mY4Q%2Fff29hqpx6QFJGo4mQsmDDCWT%2FfG1Zp%2Bf0%2B9vbI9%2B0QLsO3FOyLJxv%2FN3Kza3obfvdPI97INvTJ21GcMSr2ORLEvmh%2BGzHLY4ck3pq03NSY7cGRUZ1zrtpA3TjmEMSgrimV5m%2BeCsMnws&X-Amz-Signature=229e9f3541a501a38e1c0507e61bd1eb65f4bbd9893b4f538adc127c86c4dfd5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665IMR5ADP%2F20260924%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260924T020743Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAEaCXVzLXdlc3QtMiJGMEQCIGqjI5HfbMwstm68FWYvFqmP%2FHRz3DSINGb3CIDaMd12AiBWaAIbwpEGs89kT1s149X88QQIIbdhz2kX93D6jLmXyiqIBAjK%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMOvbhI5lmNV2O%2BIi2KtwDPzsSEVoylOL3In2bi%2BRs0mUU4543Qm455ns6miFzOJhGAGUmWcCEghuNi9RAXyzSceQFPUl6U%2Ff0i2R%2FSqhj6B6bfDozMazE%2B3C5eFViP9nPHzU7KEba0WDWNXnYudntnfiHezwlejojH4lHfjKhpWLvQQcbdhQo9M78anmCKLDCSL%2FAkM39PD5Iw5jMFNt0FxFU5nJ%2F%2F%2FKz%2F8XfTOTEbFT4dRjHUP%2FdILU5rsdSMY8qoD8zqdRv%2Bd0xkIgqkRiD5Ab5cGgiijbfvhq33S8SN5Ez5J8x47Xf4Fm80IcdgRshl9ZbRT2mmTgYG7Ihm3ahxUhP99FmZoDurFPSbLJa91T2PdCGR%2FxvTv8JI9oclXJWxadOeq%2FnSwCd8xJMcqugSN9TMJ6sllZ1nqsOL3%2BTBJw4N8t04rBLiLdT0Gf67%2FhxgQ0q1vHF9d%2BWUfN0570B0ihbxFhJ9I4%2FrByl3ufkt3jbDtzZIESqMEEWxFin1yXNfPr88fvHuXxD2xllUoXIZm35s%2B09pzbZauSKIkKu21AXWR4h5vgmxstoZavog1KVb%2FrVgOgQq1owtUe7Yeza1wYbzhpkHgCzbv52U%2F8pTg5q97UAJdsRfIsdtf1eBQ4tb8Gdu46qPUQLJHgw5OvR1QY6pgGCW4C5LSXZGRKjhucVu%2FGSTVHXUAjQgfT4ZTSti6521B2nF4nVBeOdPEhN6DqMjaUYQ0XQM7Ood42mY4Q%2Fff29hqpx6QFJGo4mQsmDDCWT%2FfG1Zp%2Bf0%2B9vbI9%2B0QLsO3FOyLJxv%2FN3Kza3obfvdPI97INvTJ21GcMSr2ORLEvmh%2BGzHLY4ck3pq03NSY7cGRUZ1zrtpA3TjmEMSgrimV5m%2BeCsMnws&X-Amz-Signature=3f9188fc9c942c6bb1603a3c6dba52e420d6eb19ef27d978357e9742118401e1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665IMR5ADP%2F20260924%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260924T020743Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAEaCXVzLXdlc3QtMiJGMEQCIGqjI5HfbMwstm68FWYvFqmP%2FHRz3DSINGb3CIDaMd12AiBWaAIbwpEGs89kT1s149X88QQIIbdhz2kX93D6jLmXyiqIBAjK%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMOvbhI5lmNV2O%2BIi2KtwDPzsSEVoylOL3In2bi%2BRs0mUU4543Qm455ns6miFzOJhGAGUmWcCEghuNi9RAXyzSceQFPUl6U%2Ff0i2R%2FSqhj6B6bfDozMazE%2B3C5eFViP9nPHzU7KEba0WDWNXnYudntnfiHezwlejojH4lHfjKhpWLvQQcbdhQo9M78anmCKLDCSL%2FAkM39PD5Iw5jMFNt0FxFU5nJ%2F%2F%2FKz%2F8XfTOTEbFT4dRjHUP%2FdILU5rsdSMY8qoD8zqdRv%2Bd0xkIgqkRiD5Ab5cGgiijbfvhq33S8SN5Ez5J8x47Xf4Fm80IcdgRshl9ZbRT2mmTgYG7Ihm3ahxUhP99FmZoDurFPSbLJa91T2PdCGR%2FxvTv8JI9oclXJWxadOeq%2FnSwCd8xJMcqugSN9TMJ6sllZ1nqsOL3%2BTBJw4N8t04rBLiLdT0Gf67%2FhxgQ0q1vHF9d%2BWUfN0570B0ihbxFhJ9I4%2FrByl3ufkt3jbDtzZIESqMEEWxFin1yXNfPr88fvHuXxD2xllUoXIZm35s%2B09pzbZauSKIkKu21AXWR4h5vgmxstoZavog1KVb%2FrVgOgQq1owtUe7Yeza1wYbzhpkHgCzbv52U%2F8pTg5q97UAJdsRfIsdtf1eBQ4tb8Gdu46qPUQLJHgw5OvR1QY6pgGCW4C5LSXZGRKjhucVu%2FGSTVHXUAjQgfT4ZTSti6521B2nF4nVBeOdPEhN6DqMjaUYQ0XQM7Ood42mY4Q%2Fff29hqpx6QFJGo4mQsmDDCWT%2FfG1Zp%2Bf0%2B9vbI9%2B0QLsO3FOyLJxv%2FN3Kza3obfvdPI97INvTJ21GcMSr2ORLEvmh%2BGzHLY4ck3pq03NSY7cGRUZ1zrtpA3TjmEMSgrimV5m%2BeCsMnws&X-Amz-Signature=fbd479393c1707ce9967305f6a94856f123bda1ad92639409f92a51299abd5f0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
