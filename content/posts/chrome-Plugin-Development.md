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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466T3KLPUGT%2F20260922%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260922T203745Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIBWdMXSGVmrr6BNHBYKLlHZpgEC4hUdu95QJNxpDDSdUAiBBBq3EphDfTNGWLShQE5%2BVM7UaSxfwaDYODQIrIw9ldCqIBAis%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMwusLbpn1wRImIvkSKtwDYTb05oQOklCIeQJUeHI8cvfxVmucJ0jCN%2BQOLw2jBSxIV%2FXwPmNnfesUHSp75NTB96TSHGJdvJFAwDYmjTDiKIfLSRJOAqfSnLDk0Va4M0fJHLI17ewjbADbFOnHio7K1f65Q1EwFBJlIkjaPQjY24VjBG32tlqln6F72%2FfBZ8rka%2BziITwdQdP1Ch3wXn%2BZTfHYWYxbrLmLgb8ez4Ksu%2F1NggA49NRS4Sq1hCAWRB5DAABPkSeeTbULpWWtblbFXCu1EgLh3FndgQ%2FfP%2BuBvFUYXyoaXJi5GEgf%2F8qObOqyAZhfp2nc7CqxAinjjEW1zrivI5X6NABnSZi8AzzH0%2FBX49K0QLt9wtrckk6waBaufGfg4%2Fho4wBoVUyL3Kxp4NwoALulQ4RKjcLValFlxClsPco3xbxwlmbWEzUIF7kG6xzkUnt2gjMcEl7R%2F94ryU2DsaXYLq5W6%2FyYOofr4JqShn162FqpqWZqegiGNXJ73jE3V9AGo6nUmUdEr99IfTomlrLO%2F61bLRoYpjWxhMHWZ2EhJHOWu9KXN4Vpo28Bnty4TjdOSE0bOkVZ3IV6FIun2eDlDBA45EtVtCcRrFIl7jbKA0Slb2wJZZroriGVm6p6yZsFj49bkMkw16TL1QY6pgHdINUHThVmKHelC1lr1FGyocYN1W105Hpd%2FcqY3WpwFJgf7aFjcNquoPIy59YfDOHH0MZycE6m79yczkFGQDW4YXfhmKQ2Du%2FmIUmLvxVt0AE%2B7XldaAtvN1mY8H9Enj8drafTSAw5CNAHcvFD5nKzxu1MW4MHhzwh5w8umOV%2BpToZNU9LQMr8c7fbntfi7561T306%2B5cO8E%2FQU9Kk%2Fd%2BJLN0MXwyf&X-Amz-Signature=8a35cfd15aef1bf925659915e869428d960721ca0f2883d2db13db52691c5e67&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466T3KLPUGT%2F20260922%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260922T203745Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIBWdMXSGVmrr6BNHBYKLlHZpgEC4hUdu95QJNxpDDSdUAiBBBq3EphDfTNGWLShQE5%2BVM7UaSxfwaDYODQIrIw9ldCqIBAis%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMwusLbpn1wRImIvkSKtwDYTb05oQOklCIeQJUeHI8cvfxVmucJ0jCN%2BQOLw2jBSxIV%2FXwPmNnfesUHSp75NTB96TSHGJdvJFAwDYmjTDiKIfLSRJOAqfSnLDk0Va4M0fJHLI17ewjbADbFOnHio7K1f65Q1EwFBJlIkjaPQjY24VjBG32tlqln6F72%2FfBZ8rka%2BziITwdQdP1Ch3wXn%2BZTfHYWYxbrLmLgb8ez4Ksu%2F1NggA49NRS4Sq1hCAWRB5DAABPkSeeTbULpWWtblbFXCu1EgLh3FndgQ%2FfP%2BuBvFUYXyoaXJi5GEgf%2F8qObOqyAZhfp2nc7CqxAinjjEW1zrivI5X6NABnSZi8AzzH0%2FBX49K0QLt9wtrckk6waBaufGfg4%2Fho4wBoVUyL3Kxp4NwoALulQ4RKjcLValFlxClsPco3xbxwlmbWEzUIF7kG6xzkUnt2gjMcEl7R%2F94ryU2DsaXYLq5W6%2FyYOofr4JqShn162FqpqWZqegiGNXJ73jE3V9AGo6nUmUdEr99IfTomlrLO%2F61bLRoYpjWxhMHWZ2EhJHOWu9KXN4Vpo28Bnty4TjdOSE0bOkVZ3IV6FIun2eDlDBA45EtVtCcRrFIl7jbKA0Slb2wJZZroriGVm6p6yZsFj49bkMkw16TL1QY6pgHdINUHThVmKHelC1lr1FGyocYN1W105Hpd%2FcqY3WpwFJgf7aFjcNquoPIy59YfDOHH0MZycE6m79yczkFGQDW4YXfhmKQ2Du%2FmIUmLvxVt0AE%2B7XldaAtvN1mY8H9Enj8drafTSAw5CNAHcvFD5nKzxu1MW4MHhzwh5w8umOV%2BpToZNU9LQMr8c7fbntfi7561T306%2B5cO8E%2FQU9Kk%2Fd%2BJLN0MXwyf&X-Amz-Signature=7cd881618c491033655b3de791d9852686897cc86db2ea6b2605a3de63a234a9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466T3KLPUGT%2F20260922%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260922T203745Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIBWdMXSGVmrr6BNHBYKLlHZpgEC4hUdu95QJNxpDDSdUAiBBBq3EphDfTNGWLShQE5%2BVM7UaSxfwaDYODQIrIw9ldCqIBAis%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMwusLbpn1wRImIvkSKtwDYTb05oQOklCIeQJUeHI8cvfxVmucJ0jCN%2BQOLw2jBSxIV%2FXwPmNnfesUHSp75NTB96TSHGJdvJFAwDYmjTDiKIfLSRJOAqfSnLDk0Va4M0fJHLI17ewjbADbFOnHio7K1f65Q1EwFBJlIkjaPQjY24VjBG32tlqln6F72%2FfBZ8rka%2BziITwdQdP1Ch3wXn%2BZTfHYWYxbrLmLgb8ez4Ksu%2F1NggA49NRS4Sq1hCAWRB5DAABPkSeeTbULpWWtblbFXCu1EgLh3FndgQ%2FfP%2BuBvFUYXyoaXJi5GEgf%2F8qObOqyAZhfp2nc7CqxAinjjEW1zrivI5X6NABnSZi8AzzH0%2FBX49K0QLt9wtrckk6waBaufGfg4%2Fho4wBoVUyL3Kxp4NwoALulQ4RKjcLValFlxClsPco3xbxwlmbWEzUIF7kG6xzkUnt2gjMcEl7R%2F94ryU2DsaXYLq5W6%2FyYOofr4JqShn162FqpqWZqegiGNXJ73jE3V9AGo6nUmUdEr99IfTomlrLO%2F61bLRoYpjWxhMHWZ2EhJHOWu9KXN4Vpo28Bnty4TjdOSE0bOkVZ3IV6FIun2eDlDBA45EtVtCcRrFIl7jbKA0Slb2wJZZroriGVm6p6yZsFj49bkMkw16TL1QY6pgHdINUHThVmKHelC1lr1FGyocYN1W105Hpd%2FcqY3WpwFJgf7aFjcNquoPIy59YfDOHH0MZycE6m79yczkFGQDW4YXfhmKQ2Du%2FmIUmLvxVt0AE%2B7XldaAtvN1mY8H9Enj8drafTSAw5CNAHcvFD5nKzxu1MW4MHhzwh5w8umOV%2BpToZNU9LQMr8c7fbntfi7561T306%2B5cO8E%2FQU9Kk%2Fd%2BJLN0MXwyf&X-Amz-Signature=2231449874c510de5dcf6fe76e0a29f60090d4893eb0c086f27dfae3c609d643&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466T3KLPUGT%2F20260922%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260922T203745Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIBWdMXSGVmrr6BNHBYKLlHZpgEC4hUdu95QJNxpDDSdUAiBBBq3EphDfTNGWLShQE5%2BVM7UaSxfwaDYODQIrIw9ldCqIBAis%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMwusLbpn1wRImIvkSKtwDYTb05oQOklCIeQJUeHI8cvfxVmucJ0jCN%2BQOLw2jBSxIV%2FXwPmNnfesUHSp75NTB96TSHGJdvJFAwDYmjTDiKIfLSRJOAqfSnLDk0Va4M0fJHLI17ewjbADbFOnHio7K1f65Q1EwFBJlIkjaPQjY24VjBG32tlqln6F72%2FfBZ8rka%2BziITwdQdP1Ch3wXn%2BZTfHYWYxbrLmLgb8ez4Ksu%2F1NggA49NRS4Sq1hCAWRB5DAABPkSeeTbULpWWtblbFXCu1EgLh3FndgQ%2FfP%2BuBvFUYXyoaXJi5GEgf%2F8qObOqyAZhfp2nc7CqxAinjjEW1zrivI5X6NABnSZi8AzzH0%2FBX49K0QLt9wtrckk6waBaufGfg4%2Fho4wBoVUyL3Kxp4NwoALulQ4RKjcLValFlxClsPco3xbxwlmbWEzUIF7kG6xzkUnt2gjMcEl7R%2F94ryU2DsaXYLq5W6%2FyYOofr4JqShn162FqpqWZqegiGNXJ73jE3V9AGo6nUmUdEr99IfTomlrLO%2F61bLRoYpjWxhMHWZ2EhJHOWu9KXN4Vpo28Bnty4TjdOSE0bOkVZ3IV6FIun2eDlDBA45EtVtCcRrFIl7jbKA0Slb2wJZZroriGVm6p6yZsFj49bkMkw16TL1QY6pgHdINUHThVmKHelC1lr1FGyocYN1W105Hpd%2FcqY3WpwFJgf7aFjcNquoPIy59YfDOHH0MZycE6m79yczkFGQDW4YXfhmKQ2Du%2FmIUmLvxVt0AE%2B7XldaAtvN1mY8H9Enj8drafTSAw5CNAHcvFD5nKzxu1MW4MHhzwh5w8umOV%2BpToZNU9LQMr8c7fbntfi7561T306%2B5cO8E%2FQU9Kk%2Fd%2BJLN0MXwyf&X-Amz-Signature=f71dc2bb9bf3785a841132e92d43bf4113af638fece455df93f0f5f7bec76409&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
