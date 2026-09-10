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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Q7PT5FTN%2F20260910%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260910T020013Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCICwmiBc%2FBCGbjDUp1mb5mEbVy1S6hiu8EUUGwJV%2BUaQxAiBXGQ7F%2F6g%2FCrgvMH302rbH0oBHt7YbkBv%2B2R4pN5oFNSr%2FAwh5EAAaDDYzNzQyMzE4MzgwNSIM4OSq7eJDuS2t9nVBKtwD6utyJZh%2BrAhGHkP%2FuRd%2FG%2FFdOl2Ig4iWD0eHpldRLP2ZD9qKJgAs6WCiBF%2BFNGqUCzDXa3rPPLnq%2BS9GcCNoNKgpxIw37maj2kHT8GvpNy1ZkAJcRJ7GCygZSIbBTGCBXgsKZ%2FEVdIeU5UpjcGQn%2Fu%2BKGd1VA1fiPFS4pkrrPWL1sAPacUKIg1wh52APa9HsyQ6xdQo2lz31LDNMBp%2B0Toc%2FwGVVfY2nW7SptkYoPKtfuJNzhhomxyDUyDbst1xX51JhHMQOD4kt%2B4o6TYvAoZX4%2B0m%2FQr4knZ%2F%2F8zFXxo7HANWBGwwaiIGiuHQovjqVZdI6wA7PCTdlbiKi1kbQZb6GgiQU8uGVBJ2eysd41kYuuuc4DrIMQqzc7hcrLmESvW4kZudaFOBRjAZPH5ZBYMHxco512gQDpua1zTGpFgd20%2FeVDBZeI1QLp9rqOZjOpvhlNlhdezD4KiiQ0v91d1q8oTQTKELtBA8aOXG9yRBdnz1FzkiKOxziGN13YeoF2xHAqSDhskG8Z0cK%2Fwr%2BZR6vNC%2B4qwGBE9A8sySWe6XjS1NwA3ITvwTuDZc8s4soiHrSh2hR%2FuUGVDuc2axO%2FvlnOgmUTwtxfGob%2F8Ck1Mz0yCY5cZq7XZb6nwAww%2FCH1QY6pgGGUz0KzcxHlg1IZaVgE7EbqDn43xqZ2FCEz9UcVFBOC%2Bb9m%2BN7c%2Fp9AKMA1%2BYWJirxSuv1qEWw7%2F8Dq%2Bir5PJiVYKZb%2B6MUer4MppqHKDLMbdveJKjFHtLeJtdZk7WrgJkUfXRP36PivAXPozhcE50fgVlKE%2F5KOKBdrcI71iL86Nmn2V149L%2FGOhrC6BkEXpw9q8i7V8foMLoPTB%2BLn4YXzMqRdBl&X-Amz-Signature=5a248f7bff96106cc5b723f84bfd8554b9787798c427ad78c6f149137d815823&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Q7PT5FTN%2F20260910%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260910T020013Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCICwmiBc%2FBCGbjDUp1mb5mEbVy1S6hiu8EUUGwJV%2BUaQxAiBXGQ7F%2F6g%2FCrgvMH302rbH0oBHt7YbkBv%2B2R4pN5oFNSr%2FAwh5EAAaDDYzNzQyMzE4MzgwNSIM4OSq7eJDuS2t9nVBKtwD6utyJZh%2BrAhGHkP%2FuRd%2FG%2FFdOl2Ig4iWD0eHpldRLP2ZD9qKJgAs6WCiBF%2BFNGqUCzDXa3rPPLnq%2BS9GcCNoNKgpxIw37maj2kHT8GvpNy1ZkAJcRJ7GCygZSIbBTGCBXgsKZ%2FEVdIeU5UpjcGQn%2Fu%2BKGd1VA1fiPFS4pkrrPWL1sAPacUKIg1wh52APa9HsyQ6xdQo2lz31LDNMBp%2B0Toc%2FwGVVfY2nW7SptkYoPKtfuJNzhhomxyDUyDbst1xX51JhHMQOD4kt%2B4o6TYvAoZX4%2B0m%2FQr4knZ%2F%2F8zFXxo7HANWBGwwaiIGiuHQovjqVZdI6wA7PCTdlbiKi1kbQZb6GgiQU8uGVBJ2eysd41kYuuuc4DrIMQqzc7hcrLmESvW4kZudaFOBRjAZPH5ZBYMHxco512gQDpua1zTGpFgd20%2FeVDBZeI1QLp9rqOZjOpvhlNlhdezD4KiiQ0v91d1q8oTQTKELtBA8aOXG9yRBdnz1FzkiKOxziGN13YeoF2xHAqSDhskG8Z0cK%2Fwr%2BZR6vNC%2B4qwGBE9A8sySWe6XjS1NwA3ITvwTuDZc8s4soiHrSh2hR%2FuUGVDuc2axO%2FvlnOgmUTwtxfGob%2F8Ck1Mz0yCY5cZq7XZb6nwAww%2FCH1QY6pgGGUz0KzcxHlg1IZaVgE7EbqDn43xqZ2FCEz9UcVFBOC%2Bb9m%2BN7c%2Fp9AKMA1%2BYWJirxSuv1qEWw7%2F8Dq%2Bir5PJiVYKZb%2B6MUer4MppqHKDLMbdveJKjFHtLeJtdZk7WrgJkUfXRP36PivAXPozhcE50fgVlKE%2F5KOKBdrcI71iL86Nmn2V149L%2FGOhrC6BkEXpw9q8i7V8foMLoPTB%2BLn4YXzMqRdBl&X-Amz-Signature=d8df3eb1e59e1f0ced2bd6904ffcb10396415490bacb22047071975fc3040610&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Q7PT5FTN%2F20260910%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260910T020013Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCICwmiBc%2FBCGbjDUp1mb5mEbVy1S6hiu8EUUGwJV%2BUaQxAiBXGQ7F%2F6g%2FCrgvMH302rbH0oBHt7YbkBv%2B2R4pN5oFNSr%2FAwh5EAAaDDYzNzQyMzE4MzgwNSIM4OSq7eJDuS2t9nVBKtwD6utyJZh%2BrAhGHkP%2FuRd%2FG%2FFdOl2Ig4iWD0eHpldRLP2ZD9qKJgAs6WCiBF%2BFNGqUCzDXa3rPPLnq%2BS9GcCNoNKgpxIw37maj2kHT8GvpNy1ZkAJcRJ7GCygZSIbBTGCBXgsKZ%2FEVdIeU5UpjcGQn%2Fu%2BKGd1VA1fiPFS4pkrrPWL1sAPacUKIg1wh52APa9HsyQ6xdQo2lz31LDNMBp%2B0Toc%2FwGVVfY2nW7SptkYoPKtfuJNzhhomxyDUyDbst1xX51JhHMQOD4kt%2B4o6TYvAoZX4%2B0m%2FQr4knZ%2F%2F8zFXxo7HANWBGwwaiIGiuHQovjqVZdI6wA7PCTdlbiKi1kbQZb6GgiQU8uGVBJ2eysd41kYuuuc4DrIMQqzc7hcrLmESvW4kZudaFOBRjAZPH5ZBYMHxco512gQDpua1zTGpFgd20%2FeVDBZeI1QLp9rqOZjOpvhlNlhdezD4KiiQ0v91d1q8oTQTKELtBA8aOXG9yRBdnz1FzkiKOxziGN13YeoF2xHAqSDhskG8Z0cK%2Fwr%2BZR6vNC%2B4qwGBE9A8sySWe6XjS1NwA3ITvwTuDZc8s4soiHrSh2hR%2FuUGVDuc2axO%2FvlnOgmUTwtxfGob%2F8Ck1Mz0yCY5cZq7XZb6nwAww%2FCH1QY6pgGGUz0KzcxHlg1IZaVgE7EbqDn43xqZ2FCEz9UcVFBOC%2Bb9m%2BN7c%2Fp9AKMA1%2BYWJirxSuv1qEWw7%2F8Dq%2Bir5PJiVYKZb%2B6MUer4MppqHKDLMbdveJKjFHtLeJtdZk7WrgJkUfXRP36PivAXPozhcE50fgVlKE%2F5KOKBdrcI71iL86Nmn2V149L%2FGOhrC6BkEXpw9q8i7V8foMLoPTB%2BLn4YXzMqRdBl&X-Amz-Signature=f40fd5f732d657bb941904576d79eeddbdd915528917b437f86483b5e3500b82&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Q7PT5FTN%2F20260910%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260910T020013Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCICwmiBc%2FBCGbjDUp1mb5mEbVy1S6hiu8EUUGwJV%2BUaQxAiBXGQ7F%2F6g%2FCrgvMH302rbH0oBHt7YbkBv%2B2R4pN5oFNSr%2FAwh5EAAaDDYzNzQyMzE4MzgwNSIM4OSq7eJDuS2t9nVBKtwD6utyJZh%2BrAhGHkP%2FuRd%2FG%2FFdOl2Ig4iWD0eHpldRLP2ZD9qKJgAs6WCiBF%2BFNGqUCzDXa3rPPLnq%2BS9GcCNoNKgpxIw37maj2kHT8GvpNy1ZkAJcRJ7GCygZSIbBTGCBXgsKZ%2FEVdIeU5UpjcGQn%2Fu%2BKGd1VA1fiPFS4pkrrPWL1sAPacUKIg1wh52APa9HsyQ6xdQo2lz31LDNMBp%2B0Toc%2FwGVVfY2nW7SptkYoPKtfuJNzhhomxyDUyDbst1xX51JhHMQOD4kt%2B4o6TYvAoZX4%2B0m%2FQr4knZ%2F%2F8zFXxo7HANWBGwwaiIGiuHQovjqVZdI6wA7PCTdlbiKi1kbQZb6GgiQU8uGVBJ2eysd41kYuuuc4DrIMQqzc7hcrLmESvW4kZudaFOBRjAZPH5ZBYMHxco512gQDpua1zTGpFgd20%2FeVDBZeI1QLp9rqOZjOpvhlNlhdezD4KiiQ0v91d1q8oTQTKELtBA8aOXG9yRBdnz1FzkiKOxziGN13YeoF2xHAqSDhskG8Z0cK%2Fwr%2BZR6vNC%2B4qwGBE9A8sySWe6XjS1NwA3ITvwTuDZc8s4soiHrSh2hR%2FuUGVDuc2axO%2FvlnOgmUTwtxfGob%2F8Ck1Mz0yCY5cZq7XZb6nwAww%2FCH1QY6pgGGUz0KzcxHlg1IZaVgE7EbqDn43xqZ2FCEz9UcVFBOC%2Bb9m%2BN7c%2Fp9AKMA1%2BYWJirxSuv1qEWw7%2F8Dq%2Bir5PJiVYKZb%2B6MUer4MppqHKDLMbdveJKjFHtLeJtdZk7WrgJkUfXRP36PivAXPozhcE50fgVlKE%2F5KOKBdrcI71iL86Nmn2V149L%2FGOhrC6BkEXpw9q8i7V8foMLoPTB%2BLn4YXzMqRdBl&X-Amz-Signature=7f5db46da487630150bb369b19cf547683eb2294cdbd429977d5acc460d80e84&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
