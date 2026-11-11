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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UK5I52RT%2F20261111%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261111T234920Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDe4dIWZhoSIyXgV9vEuGce6Ai4MUUz%2FIx8dhRMis390AiBUkg0kO78zTa4tR%2FW4keWUK1qAYPNMKy74XSiGEMPOGCr%2FAwhfEAAaDDYzNzQyMzE4MzgwNSIMfyARPvkE0DwoUag%2FKtwDLb3G2lBzD6KHcDnWczRF46fpshWMX8ErdmUEcFowIgguTgb3iEoq6PNzZpIa9PDKWIKIjXVN5PhKpRResjc%2F577u9U0oKw%2BDgXofE%2FPT4WxdcmRzhxho%2FNGlmrXh2p%2FxJadhmlrX0XN%2B9qwAxJO%2FKrZ8eZB%2B4Z2Zanz%2Bm%2FCDu0TdwznNv9djeu6mg8CkwCKxFxfr02ja1whpiq5b2Uzzs2lRsx%2BOImos8DyD5nbKox7AjfhqR2cXDl4ifkOEgDZ8CnRGFm0mDGc%2BCYYMXsTVtn3ALG%2BrMnPpID7vn44tVycwiFtiHgJp275Y%2Ft7uIUuaiLJVooxdCL0dQ%2BDkgzd%2BygJQnFjjnYieWvoCGnfuf%2FDXgJI9rdhD%2Bl2WCNOfo1%2BeGysOEWIxHZDQc2lZUfRa%2BnuSYQhzrTtH7koPE%2BUmZpYhJK7TExeYXUzGOBPJP6bdVV5Z5%2B9vWBF6BmhIWQjqaYrr9oOUuoAb%2FP2%2BZvUvtFOeVpWFkrpWzaAZ5snuI8fUibZmodzE2Ou0tO2LyjNUN8134kxMaRJBZiYaQfqrD8gm9AuJCdEDBSbi9DLB2%2FEHl8FRYj%2BSTKm80UJn3gILoJrgXyWmVUa0%2F89kP6a04ECQ7j6V2kUZ%2B1x1nqAwt9XT1wY6pgGQT9xSjhQ4NvdHNtg3POYAiERtIZaBWiE6G8EJemQF8o8Al9zZMq%2BpMXSE7nEdPxZG79RDDLxdH%2FubpocKhMBIyNa%2Fi66iOFgaT2P6K2Uka9A%2FbeI%2Fhke5F9TkaLkSmfnFqfyNy45%2BGdn%2FmWW3%2BsS9wbA6EGQOWuvQvobl6Isveowxo%2BcS%2BGkzBwC4%2FHuKDHeiNCF8ZNdDBz1rs7YI5qEITvCg7wU8&X-Amz-Signature=784d739ba3f1ffeff229a24f876f5c1c73bcf76a52f2a98e065edfee61f70e28&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UK5I52RT%2F20261111%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261111T234920Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDe4dIWZhoSIyXgV9vEuGce6Ai4MUUz%2FIx8dhRMis390AiBUkg0kO78zTa4tR%2FW4keWUK1qAYPNMKy74XSiGEMPOGCr%2FAwhfEAAaDDYzNzQyMzE4MzgwNSIMfyARPvkE0DwoUag%2FKtwDLb3G2lBzD6KHcDnWczRF46fpshWMX8ErdmUEcFowIgguTgb3iEoq6PNzZpIa9PDKWIKIjXVN5PhKpRResjc%2F577u9U0oKw%2BDgXofE%2FPT4WxdcmRzhxho%2FNGlmrXh2p%2FxJadhmlrX0XN%2B9qwAxJO%2FKrZ8eZB%2B4Z2Zanz%2Bm%2FCDu0TdwznNv9djeu6mg8CkwCKxFxfr02ja1whpiq5b2Uzzs2lRsx%2BOImos8DyD5nbKox7AjfhqR2cXDl4ifkOEgDZ8CnRGFm0mDGc%2BCYYMXsTVtn3ALG%2BrMnPpID7vn44tVycwiFtiHgJp275Y%2Ft7uIUuaiLJVooxdCL0dQ%2BDkgzd%2BygJQnFjjnYieWvoCGnfuf%2FDXgJI9rdhD%2Bl2WCNOfo1%2BeGysOEWIxHZDQc2lZUfRa%2BnuSYQhzrTtH7koPE%2BUmZpYhJK7TExeYXUzGOBPJP6bdVV5Z5%2B9vWBF6BmhIWQjqaYrr9oOUuoAb%2FP2%2BZvUvtFOeVpWFkrpWzaAZ5snuI8fUibZmodzE2Ou0tO2LyjNUN8134kxMaRJBZiYaQfqrD8gm9AuJCdEDBSbi9DLB2%2FEHl8FRYj%2BSTKm80UJn3gILoJrgXyWmVUa0%2F89kP6a04ECQ7j6V2kUZ%2B1x1nqAwt9XT1wY6pgGQT9xSjhQ4NvdHNtg3POYAiERtIZaBWiE6G8EJemQF8o8Al9zZMq%2BpMXSE7nEdPxZG79RDDLxdH%2FubpocKhMBIyNa%2Fi66iOFgaT2P6K2Uka9A%2FbeI%2Fhke5F9TkaLkSmfnFqfyNy45%2BGdn%2FmWW3%2BsS9wbA6EGQOWuvQvobl6Isveowxo%2BcS%2BGkzBwC4%2FHuKDHeiNCF8ZNdDBz1rs7YI5qEITvCg7wU8&X-Amz-Signature=e6932b191b8789b5c6c52cd428cea11a87fa499479857b22aa12b5291d0fcf08&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UK5I52RT%2F20261111%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261111T234920Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDe4dIWZhoSIyXgV9vEuGce6Ai4MUUz%2FIx8dhRMis390AiBUkg0kO78zTa4tR%2FW4keWUK1qAYPNMKy74XSiGEMPOGCr%2FAwhfEAAaDDYzNzQyMzE4MzgwNSIMfyARPvkE0DwoUag%2FKtwDLb3G2lBzD6KHcDnWczRF46fpshWMX8ErdmUEcFowIgguTgb3iEoq6PNzZpIa9PDKWIKIjXVN5PhKpRResjc%2F577u9U0oKw%2BDgXofE%2FPT4WxdcmRzhxho%2FNGlmrXh2p%2FxJadhmlrX0XN%2B9qwAxJO%2FKrZ8eZB%2B4Z2Zanz%2Bm%2FCDu0TdwznNv9djeu6mg8CkwCKxFxfr02ja1whpiq5b2Uzzs2lRsx%2BOImos8DyD5nbKox7AjfhqR2cXDl4ifkOEgDZ8CnRGFm0mDGc%2BCYYMXsTVtn3ALG%2BrMnPpID7vn44tVycwiFtiHgJp275Y%2Ft7uIUuaiLJVooxdCL0dQ%2BDkgzd%2BygJQnFjjnYieWvoCGnfuf%2FDXgJI9rdhD%2Bl2WCNOfo1%2BeGysOEWIxHZDQc2lZUfRa%2BnuSYQhzrTtH7koPE%2BUmZpYhJK7TExeYXUzGOBPJP6bdVV5Z5%2B9vWBF6BmhIWQjqaYrr9oOUuoAb%2FP2%2BZvUvtFOeVpWFkrpWzaAZ5snuI8fUibZmodzE2Ou0tO2LyjNUN8134kxMaRJBZiYaQfqrD8gm9AuJCdEDBSbi9DLB2%2FEHl8FRYj%2BSTKm80UJn3gILoJrgXyWmVUa0%2F89kP6a04ECQ7j6V2kUZ%2B1x1nqAwt9XT1wY6pgGQT9xSjhQ4NvdHNtg3POYAiERtIZaBWiE6G8EJemQF8o8Al9zZMq%2BpMXSE7nEdPxZG79RDDLxdH%2FubpocKhMBIyNa%2Fi66iOFgaT2P6K2Uka9A%2FbeI%2Fhke5F9TkaLkSmfnFqfyNy45%2BGdn%2FmWW3%2BsS9wbA6EGQOWuvQvobl6Isveowxo%2BcS%2BGkzBwC4%2FHuKDHeiNCF8ZNdDBz1rs7YI5qEITvCg7wU8&X-Amz-Signature=3814b6da9b01140b6920b1fd2ccd1d096626174ef6e828995b11c985d213d6b3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UK5I52RT%2F20261111%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261111T234920Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDe4dIWZhoSIyXgV9vEuGce6Ai4MUUz%2FIx8dhRMis390AiBUkg0kO78zTa4tR%2FW4keWUK1qAYPNMKy74XSiGEMPOGCr%2FAwhfEAAaDDYzNzQyMzE4MzgwNSIMfyARPvkE0DwoUag%2FKtwDLb3G2lBzD6KHcDnWczRF46fpshWMX8ErdmUEcFowIgguTgb3iEoq6PNzZpIa9PDKWIKIjXVN5PhKpRResjc%2F577u9U0oKw%2BDgXofE%2FPT4WxdcmRzhxho%2FNGlmrXh2p%2FxJadhmlrX0XN%2B9qwAxJO%2FKrZ8eZB%2B4Z2Zanz%2Bm%2FCDu0TdwznNv9djeu6mg8CkwCKxFxfr02ja1whpiq5b2Uzzs2lRsx%2BOImos8DyD5nbKox7AjfhqR2cXDl4ifkOEgDZ8CnRGFm0mDGc%2BCYYMXsTVtn3ALG%2BrMnPpID7vn44tVycwiFtiHgJp275Y%2Ft7uIUuaiLJVooxdCL0dQ%2BDkgzd%2BygJQnFjjnYieWvoCGnfuf%2FDXgJI9rdhD%2Bl2WCNOfo1%2BeGysOEWIxHZDQc2lZUfRa%2BnuSYQhzrTtH7koPE%2BUmZpYhJK7TExeYXUzGOBPJP6bdVV5Z5%2B9vWBF6BmhIWQjqaYrr9oOUuoAb%2FP2%2BZvUvtFOeVpWFkrpWzaAZ5snuI8fUibZmodzE2Ou0tO2LyjNUN8134kxMaRJBZiYaQfqrD8gm9AuJCdEDBSbi9DLB2%2FEHl8FRYj%2BSTKm80UJn3gILoJrgXyWmVUa0%2F89kP6a04ECQ7j6V2kUZ%2B1x1nqAwt9XT1wY6pgGQT9xSjhQ4NvdHNtg3POYAiERtIZaBWiE6G8EJemQF8o8Al9zZMq%2BpMXSE7nEdPxZG79RDDLxdH%2FubpocKhMBIyNa%2Fi66iOFgaT2P6K2Uka9A%2FbeI%2Fhke5F9TkaLkSmfnFqfyNy45%2BGdn%2FmWW3%2BsS9wbA6EGQOWuvQvobl6Isveowxo%2BcS%2BGkzBwC4%2FHuKDHeiNCF8ZNdDBz1rs7YI5qEITvCg7wU8&X-Amz-Signature=ff7f39755d9bb70b84c13ece339c5452860b3520218f0c0f933c29c49da252fd&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
