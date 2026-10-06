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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665Y2SL6DK%2F20261006%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261006T034547Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECIaCXVzLXdlc3QtMiJIMEYCIQDr488cPtVcPErnKmpuzz5JfecN57kZKdSHoQHuEmbfsAIhANsC49%2Fx8Ba9LAjgzDUDG3%2Bz%2Bs8%2FesVAy5ugGDYUzXQbKogECOv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxocTef%2FuTPhnazgf0q3AOpW6pSidlT%2F0TAjQ2bx2u9ECUHtl0j83kcwwlP1rXyC7NeTaBzQC38f65S56gfSNqDrrtJnm160sYHcsEdL75uzPhbOV8%2FYHpOr%2BLtbZf3hcdJXanbwGz8QFxqZOoyUs%2FeMPB3wnt7vFNqGg7sk5qa7SJjNSYFH40IDTwDjFPeJaemXMIANMNIUrbh3hbrpL%2FrYq4bFwbJtyYvU570reAhTtN3t3nddcPgX3fmSKshOoo4qYA%2BssN096JCiJRcaGEf%2F%2FiV94usfojUXbcOs9tUPEv25gfhH%2BnHXBi1%2FMAkm20VpoFjymdcip4RX4zKk2XKBIuoT2rXUNG3S%2BHQs1%2F9AYHXJ0fy3xOxwNqk9PZ0gaGX6kFDMcuF4Vn7rgSsI3W6uAUeKqwj6tAfeQRoBV87u9BFUY3zmDE88GQjwFur9%2Fka7%2BgzN4IAdJ8I0a5MlbGN7mo9C0HzfKpj2ZK%2Fmix9Gx0tRj3%2Fi9dGKqXhRrXF%2B1Wo%2F4Rbrj1JTs4KWVCi9sA16voklzQ3tHre9iJz04zZ0o00BLZaxVkbchWxmcjGSQGB%2Ftx%2BroeFqQi9SYVE0ofq8oC4qZmp5xVIddHJxuRtK5TSGQDwd559qmoV4qRXjprMo0w39ZIZQbtZWjC%2FsZHWBjqkAa4GoPjGjeiXB42xvZaHhDYy6XKaVqPGceKt0c9l1amxYu0rNptd8qAgvXOxud1oxcK6JYmuwz%2FkXp4%2F3rzV6neB8QeRTS4PXLKE%2FYX%2BxpVLsI%2BgRQjmqziDv5UUsPmel2c0cNt5dv%2BJx%2BpuTVvnoynZ3LlQMfBW8v%2FtzbfUCRgh8Bh4IXKqIuFcRNnoSE%2B964%2BvYnSDVlIJ8iShxAQK3VKovyxf&X-Amz-Signature=a07bd5c2f3113fe7b25faaa34956de3e83fd3e995261798cae8b7578bcf68eb3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665Y2SL6DK%2F20261006%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261006T034547Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECIaCXVzLXdlc3QtMiJIMEYCIQDr488cPtVcPErnKmpuzz5JfecN57kZKdSHoQHuEmbfsAIhANsC49%2Fx8Ba9LAjgzDUDG3%2Bz%2Bs8%2FesVAy5ugGDYUzXQbKogECOv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxocTef%2FuTPhnazgf0q3AOpW6pSidlT%2F0TAjQ2bx2u9ECUHtl0j83kcwwlP1rXyC7NeTaBzQC38f65S56gfSNqDrrtJnm160sYHcsEdL75uzPhbOV8%2FYHpOr%2BLtbZf3hcdJXanbwGz8QFxqZOoyUs%2FeMPB3wnt7vFNqGg7sk5qa7SJjNSYFH40IDTwDjFPeJaemXMIANMNIUrbh3hbrpL%2FrYq4bFwbJtyYvU570reAhTtN3t3nddcPgX3fmSKshOoo4qYA%2BssN096JCiJRcaGEf%2F%2FiV94usfojUXbcOs9tUPEv25gfhH%2BnHXBi1%2FMAkm20VpoFjymdcip4RX4zKk2XKBIuoT2rXUNG3S%2BHQs1%2F9AYHXJ0fy3xOxwNqk9PZ0gaGX6kFDMcuF4Vn7rgSsI3W6uAUeKqwj6tAfeQRoBV87u9BFUY3zmDE88GQjwFur9%2Fka7%2BgzN4IAdJ8I0a5MlbGN7mo9C0HzfKpj2ZK%2Fmix9Gx0tRj3%2Fi9dGKqXhRrXF%2B1Wo%2F4Rbrj1JTs4KWVCi9sA16voklzQ3tHre9iJz04zZ0o00BLZaxVkbchWxmcjGSQGB%2Ftx%2BroeFqQi9SYVE0ofq8oC4qZmp5xVIddHJxuRtK5TSGQDwd559qmoV4qRXjprMo0w39ZIZQbtZWjC%2FsZHWBjqkAa4GoPjGjeiXB42xvZaHhDYy6XKaVqPGceKt0c9l1amxYu0rNptd8qAgvXOxud1oxcK6JYmuwz%2FkXp4%2F3rzV6neB8QeRTS4PXLKE%2FYX%2BxpVLsI%2BgRQjmqziDv5UUsPmel2c0cNt5dv%2BJx%2BpuTVvnoynZ3LlQMfBW8v%2FtzbfUCRgh8Bh4IXKqIuFcRNnoSE%2B964%2BvYnSDVlIJ8iShxAQK3VKovyxf&X-Amz-Signature=05f9383aeb3ecc87d1793ac2842a4d9de2396e888308b7a62f698023489d9432&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665Y2SL6DK%2F20261006%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261006T034547Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECIaCXVzLXdlc3QtMiJIMEYCIQDr488cPtVcPErnKmpuzz5JfecN57kZKdSHoQHuEmbfsAIhANsC49%2Fx8Ba9LAjgzDUDG3%2Bz%2Bs8%2FesVAy5ugGDYUzXQbKogECOv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxocTef%2FuTPhnazgf0q3AOpW6pSidlT%2F0TAjQ2bx2u9ECUHtl0j83kcwwlP1rXyC7NeTaBzQC38f65S56gfSNqDrrtJnm160sYHcsEdL75uzPhbOV8%2FYHpOr%2BLtbZf3hcdJXanbwGz8QFxqZOoyUs%2FeMPB3wnt7vFNqGg7sk5qa7SJjNSYFH40IDTwDjFPeJaemXMIANMNIUrbh3hbrpL%2FrYq4bFwbJtyYvU570reAhTtN3t3nddcPgX3fmSKshOoo4qYA%2BssN096JCiJRcaGEf%2F%2FiV94usfojUXbcOs9tUPEv25gfhH%2BnHXBi1%2FMAkm20VpoFjymdcip4RX4zKk2XKBIuoT2rXUNG3S%2BHQs1%2F9AYHXJ0fy3xOxwNqk9PZ0gaGX6kFDMcuF4Vn7rgSsI3W6uAUeKqwj6tAfeQRoBV87u9BFUY3zmDE88GQjwFur9%2Fka7%2BgzN4IAdJ8I0a5MlbGN7mo9C0HzfKpj2ZK%2Fmix9Gx0tRj3%2Fi9dGKqXhRrXF%2B1Wo%2F4Rbrj1JTs4KWVCi9sA16voklzQ3tHre9iJz04zZ0o00BLZaxVkbchWxmcjGSQGB%2Ftx%2BroeFqQi9SYVE0ofq8oC4qZmp5xVIddHJxuRtK5TSGQDwd559qmoV4qRXjprMo0w39ZIZQbtZWjC%2FsZHWBjqkAa4GoPjGjeiXB42xvZaHhDYy6XKaVqPGceKt0c9l1amxYu0rNptd8qAgvXOxud1oxcK6JYmuwz%2FkXp4%2F3rzV6neB8QeRTS4PXLKE%2FYX%2BxpVLsI%2BgRQjmqziDv5UUsPmel2c0cNt5dv%2BJx%2BpuTVvnoynZ3LlQMfBW8v%2FtzbfUCRgh8Bh4IXKqIuFcRNnoSE%2B964%2BvYnSDVlIJ8iShxAQK3VKovyxf&X-Amz-Signature=3f5b3eb7e9e7233fcb2ca38c0ffc16b6f9185657a9c55342f638abfd711f25a3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665Y2SL6DK%2F20261006%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261006T034547Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECIaCXVzLXdlc3QtMiJIMEYCIQDr488cPtVcPErnKmpuzz5JfecN57kZKdSHoQHuEmbfsAIhANsC49%2Fx8Ba9LAjgzDUDG3%2Bz%2Bs8%2FesVAy5ugGDYUzXQbKogECOv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxocTef%2FuTPhnazgf0q3AOpW6pSidlT%2F0TAjQ2bx2u9ECUHtl0j83kcwwlP1rXyC7NeTaBzQC38f65S56gfSNqDrrtJnm160sYHcsEdL75uzPhbOV8%2FYHpOr%2BLtbZf3hcdJXanbwGz8QFxqZOoyUs%2FeMPB3wnt7vFNqGg7sk5qa7SJjNSYFH40IDTwDjFPeJaemXMIANMNIUrbh3hbrpL%2FrYq4bFwbJtyYvU570reAhTtN3t3nddcPgX3fmSKshOoo4qYA%2BssN096JCiJRcaGEf%2F%2FiV94usfojUXbcOs9tUPEv25gfhH%2BnHXBi1%2FMAkm20VpoFjymdcip4RX4zKk2XKBIuoT2rXUNG3S%2BHQs1%2F9AYHXJ0fy3xOxwNqk9PZ0gaGX6kFDMcuF4Vn7rgSsI3W6uAUeKqwj6tAfeQRoBV87u9BFUY3zmDE88GQjwFur9%2Fka7%2BgzN4IAdJ8I0a5MlbGN7mo9C0HzfKpj2ZK%2Fmix9Gx0tRj3%2Fi9dGKqXhRrXF%2B1Wo%2F4Rbrj1JTs4KWVCi9sA16voklzQ3tHre9iJz04zZ0o00BLZaxVkbchWxmcjGSQGB%2Ftx%2BroeFqQi9SYVE0ofq8oC4qZmp5xVIddHJxuRtK5TSGQDwd559qmoV4qRXjprMo0w39ZIZQbtZWjC%2FsZHWBjqkAa4GoPjGjeiXB42xvZaHhDYy6XKaVqPGceKt0c9l1amxYu0rNptd8qAgvXOxud1oxcK6JYmuwz%2FkXp4%2F3rzV6neB8QeRTS4PXLKE%2FYX%2BxpVLsI%2BgRQjmqziDv5UUsPmel2c0cNt5dv%2BJx%2BpuTVvnoynZ3LlQMfBW8v%2FtzbfUCRgh8Bh4IXKqIuFcRNnoSE%2B964%2BvYnSDVlIJ8iShxAQK3VKovyxf&X-Amz-Signature=ef8599a75e259b3cef126efe21e673d5a1ce27d75e0d82556531bcf829bb7491&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
