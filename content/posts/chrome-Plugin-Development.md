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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666HOTWYLG%2F20261022%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261022T161504Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEK%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFRokuqYSBTc3FpDGG4mpStdq7EQ%2FzmwyNL5DRDTDaR5AiBgSZbi1jeUuWgBtrkLz%2BBvRq66Rxeco9eHDnR6wMXn0yr%2FAwh4EAAaDDYzNzQyMzE4MzgwNSIMETAOnGKUE1Nxw0sCKtwD048aOhAXHnNZTcvJho0VTF%2BPTezmnhsrNZ%2F0TJqSEYP%2B6grTk7rfG7Agn3%2B6i4xVOzMnp1WJOoVyo2%2F1v5x1t%2Bp3c0DVUNlsWm4SxuGnlRV2vSU%2FOYhPENtsxkr0X4y4F%2FP1Gv6jEfIP7E2Pdi5Pl0FIUXG0XEBk085jpQ9yyeo728oEB5ZnSLiKIXpN%2BAnNEpDNqUyOaXItVMIic6zLbUXBjgfRLAWVxUE53YllP%2FZmqi%2F5cxDRQtd0GgHZgl%2FQBGRSyMz0iYChRdxVP5hNlIXG0%2FFwvVf5YeRjTrU3Gs10%2FPh2lZRc96zqBzT4h1TT%2Brmh3Q9QyzEE4BEulVk9d7mNaWFwch4tvwZjZ7Yy0FTpymh%2FBlYiImxu%2FVxVTWE70vbgJ8tGkiLtkgI%2B53lct%2BT5e%2BkH50hqrHkx8WbYHbgabWoCcQon5kg7xf%2FuU0inEsnrxYArl%2BTPfxU%2FC5r%2F0oHFpr86ChzmwyreYgK%2BGKeb3DQZ1USk09FZOhlFKE9bJmPNLlFed5M%2FwGXgYkhPoXGgsNWZGhoL4ZzDKIo9Dsi7uJ%2Fb%2BUbijpZapn4zGPMhPKQy9ow09aQTjwzxG6oP8MWqLm%2BtSO%2BxBeBng0VGdnoITEZE%2BqQkSmC6E8Qwnsbo1gY6pgETcFJXBzEVo66p4A3JZd6L1RhHprIpqvLWcji1pn3PEeYlTQRn3zh00%2Bxs31AZ1onfGGAL9ABMWeLa5UZvDlufmfrLQzK5Hx2dFkc3cgGEph0dOl1n88e93dp4t1YWXX7hxOUvCnzO%2FIuSXMYkZau%2BEJc3cFdKVMtCwtkX3QEtOsIYr1sTWXxy%2FVlZE3stvlPKGGMhh8zsDp5qz%2FPeMgMgmgGOaQ3g&X-Amz-Signature=2304662766c5a592b59cc394f371455fc963ae912e8aca84bf71035cb701495c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666HOTWYLG%2F20261022%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261022T161504Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEK%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFRokuqYSBTc3FpDGG4mpStdq7EQ%2FzmwyNL5DRDTDaR5AiBgSZbi1jeUuWgBtrkLz%2BBvRq66Rxeco9eHDnR6wMXn0yr%2FAwh4EAAaDDYzNzQyMzE4MzgwNSIMETAOnGKUE1Nxw0sCKtwD048aOhAXHnNZTcvJho0VTF%2BPTezmnhsrNZ%2F0TJqSEYP%2B6grTk7rfG7Agn3%2B6i4xVOzMnp1WJOoVyo2%2F1v5x1t%2Bp3c0DVUNlsWm4SxuGnlRV2vSU%2FOYhPENtsxkr0X4y4F%2FP1Gv6jEfIP7E2Pdi5Pl0FIUXG0XEBk085jpQ9yyeo728oEB5ZnSLiKIXpN%2BAnNEpDNqUyOaXItVMIic6zLbUXBjgfRLAWVxUE53YllP%2FZmqi%2F5cxDRQtd0GgHZgl%2FQBGRSyMz0iYChRdxVP5hNlIXG0%2FFwvVf5YeRjTrU3Gs10%2FPh2lZRc96zqBzT4h1TT%2Brmh3Q9QyzEE4BEulVk9d7mNaWFwch4tvwZjZ7Yy0FTpymh%2FBlYiImxu%2FVxVTWE70vbgJ8tGkiLtkgI%2B53lct%2BT5e%2BkH50hqrHkx8WbYHbgabWoCcQon5kg7xf%2FuU0inEsnrxYArl%2BTPfxU%2FC5r%2F0oHFpr86ChzmwyreYgK%2BGKeb3DQZ1USk09FZOhlFKE9bJmPNLlFed5M%2FwGXgYkhPoXGgsNWZGhoL4ZzDKIo9Dsi7uJ%2Fb%2BUbijpZapn4zGPMhPKQy9ow09aQTjwzxG6oP8MWqLm%2BtSO%2BxBeBng0VGdnoITEZE%2BqQkSmC6E8Qwnsbo1gY6pgETcFJXBzEVo66p4A3JZd6L1RhHprIpqvLWcji1pn3PEeYlTQRn3zh00%2Bxs31AZ1onfGGAL9ABMWeLa5UZvDlufmfrLQzK5Hx2dFkc3cgGEph0dOl1n88e93dp4t1YWXX7hxOUvCnzO%2FIuSXMYkZau%2BEJc3cFdKVMtCwtkX3QEtOsIYr1sTWXxy%2FVlZE3stvlPKGGMhh8zsDp5qz%2FPeMgMgmgGOaQ3g&X-Amz-Signature=4e1816123afd02facd6a5005115a4aef9b219fd2f4062182ebda1d26a08bd584&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666HOTWYLG%2F20261022%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261022T161504Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEK%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFRokuqYSBTc3FpDGG4mpStdq7EQ%2FzmwyNL5DRDTDaR5AiBgSZbi1jeUuWgBtrkLz%2BBvRq66Rxeco9eHDnR6wMXn0yr%2FAwh4EAAaDDYzNzQyMzE4MzgwNSIMETAOnGKUE1Nxw0sCKtwD048aOhAXHnNZTcvJho0VTF%2BPTezmnhsrNZ%2F0TJqSEYP%2B6grTk7rfG7Agn3%2B6i4xVOzMnp1WJOoVyo2%2F1v5x1t%2Bp3c0DVUNlsWm4SxuGnlRV2vSU%2FOYhPENtsxkr0X4y4F%2FP1Gv6jEfIP7E2Pdi5Pl0FIUXG0XEBk085jpQ9yyeo728oEB5ZnSLiKIXpN%2BAnNEpDNqUyOaXItVMIic6zLbUXBjgfRLAWVxUE53YllP%2FZmqi%2F5cxDRQtd0GgHZgl%2FQBGRSyMz0iYChRdxVP5hNlIXG0%2FFwvVf5YeRjTrU3Gs10%2FPh2lZRc96zqBzT4h1TT%2Brmh3Q9QyzEE4BEulVk9d7mNaWFwch4tvwZjZ7Yy0FTpymh%2FBlYiImxu%2FVxVTWE70vbgJ8tGkiLtkgI%2B53lct%2BT5e%2BkH50hqrHkx8WbYHbgabWoCcQon5kg7xf%2FuU0inEsnrxYArl%2BTPfxU%2FC5r%2F0oHFpr86ChzmwyreYgK%2BGKeb3DQZ1USk09FZOhlFKE9bJmPNLlFed5M%2FwGXgYkhPoXGgsNWZGhoL4ZzDKIo9Dsi7uJ%2Fb%2BUbijpZapn4zGPMhPKQy9ow09aQTjwzxG6oP8MWqLm%2BtSO%2BxBeBng0VGdnoITEZE%2BqQkSmC6E8Qwnsbo1gY6pgETcFJXBzEVo66p4A3JZd6L1RhHprIpqvLWcji1pn3PEeYlTQRn3zh00%2Bxs31AZ1onfGGAL9ABMWeLa5UZvDlufmfrLQzK5Hx2dFkc3cgGEph0dOl1n88e93dp4t1YWXX7hxOUvCnzO%2FIuSXMYkZau%2BEJc3cFdKVMtCwtkX3QEtOsIYr1sTWXxy%2FVlZE3stvlPKGGMhh8zsDp5qz%2FPeMgMgmgGOaQ3g&X-Amz-Signature=d9c69d9c6980029dcb1d95d0a427606ea28f7bb08355582c46aebd644f3314fe&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666HOTWYLG%2F20261022%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261022T161504Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEK%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFRokuqYSBTc3FpDGG4mpStdq7EQ%2FzmwyNL5DRDTDaR5AiBgSZbi1jeUuWgBtrkLz%2BBvRq66Rxeco9eHDnR6wMXn0yr%2FAwh4EAAaDDYzNzQyMzE4MzgwNSIMETAOnGKUE1Nxw0sCKtwD048aOhAXHnNZTcvJho0VTF%2BPTezmnhsrNZ%2F0TJqSEYP%2B6grTk7rfG7Agn3%2B6i4xVOzMnp1WJOoVyo2%2F1v5x1t%2Bp3c0DVUNlsWm4SxuGnlRV2vSU%2FOYhPENtsxkr0X4y4F%2FP1Gv6jEfIP7E2Pdi5Pl0FIUXG0XEBk085jpQ9yyeo728oEB5ZnSLiKIXpN%2BAnNEpDNqUyOaXItVMIic6zLbUXBjgfRLAWVxUE53YllP%2FZmqi%2F5cxDRQtd0GgHZgl%2FQBGRSyMz0iYChRdxVP5hNlIXG0%2FFwvVf5YeRjTrU3Gs10%2FPh2lZRc96zqBzT4h1TT%2Brmh3Q9QyzEE4BEulVk9d7mNaWFwch4tvwZjZ7Yy0FTpymh%2FBlYiImxu%2FVxVTWE70vbgJ8tGkiLtkgI%2B53lct%2BT5e%2BkH50hqrHkx8WbYHbgabWoCcQon5kg7xf%2FuU0inEsnrxYArl%2BTPfxU%2FC5r%2F0oHFpr86ChzmwyreYgK%2BGKeb3DQZ1USk09FZOhlFKE9bJmPNLlFed5M%2FwGXgYkhPoXGgsNWZGhoL4ZzDKIo9Dsi7uJ%2Fb%2BUbijpZapn4zGPMhPKQy9ow09aQTjwzxG6oP8MWqLm%2BtSO%2BxBeBng0VGdnoITEZE%2BqQkSmC6E8Qwnsbo1gY6pgETcFJXBzEVo66p4A3JZd6L1RhHprIpqvLWcji1pn3PEeYlTQRn3zh00%2Bxs31AZ1onfGGAL9ABMWeLa5UZvDlufmfrLQzK5Hx2dFkc3cgGEph0dOl1n88e93dp4t1YWXX7hxOUvCnzO%2FIuSXMYkZau%2BEJc3cFdKVMtCwtkX3QEtOsIYr1sTWXxy%2FVlZE3stvlPKGGMhh8zsDp5qz%2FPeMgMgmgGOaQ3g&X-Amz-Signature=ea718f915c6eed55b0338008d82e697a58d55d0fe8d8687ee0574e7c1aaeace5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
