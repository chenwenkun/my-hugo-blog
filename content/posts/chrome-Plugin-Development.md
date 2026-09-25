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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664WCA3N5G%2F20260925%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260925T022452Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBoaCXVzLXdlc3QtMiJGMEQCIHHBUwn9hfZbNiUMZXv5UGVaLQ8h8axYKaGblpkNMgJXAiA3IKyrJJTUVB3spGOXc68OxuhWZp1ZYO6yc7y1451oASqIBAji%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMJsQGHyxai15h2yWCKtwDwHQaMih0TPuAOVjJAqMVyr%2FC%2F7mhfOiaeyql3vtCRZogJ%2B3PwbU3C%2FHdofRN1TFYw1zhi3xeQKZcWtgAhZPoY1Y6%2BlzseDlqNpNdnEmJo9EtK%2BbT9uH9di9%2FoS8jtCFFymVtS%2BI5QIhWgkS0TB%2FVvhBC7RgIgJEYqT1sIBsRJOQKXVVGtJNmQI5SMaehDqDukxVk78pynS34UCCteVsPqTDKa6JFdKVvHHfjHqpoWYb4JKokQnGOn%2BBXIIIBl5HSVVJfmST86EqBmCbKTJOlddiuc3odXuWebGsA1YRnDhBRCD6D9JXtvqTsoDvQ4dH294UH56a5uCuqga7I1OQnPiBV0Met6cZ8LVWnLCulxDv%2FbBjPM2ed3t2o44%2BR%2B9blS7Hh2hlTc6BtKfIGc8%2F3Dj2b7rthr5PY2ZyE%2FhnZb4%2FAeFAcpVTa2WBYfEKMlI9PZ81konlBRCnJGgWOuOxXhkPUXQ%2BPixsXRtUEJMavurVrphzowDFE1QT6TSL7iORQERMWyXAXpEVh9z29xKe%2FBv7v8VKLgSWUFgBJj9i%2F9z26o3RdArc%2BQvnL0MghYd%2Fu6gdl%2BrXmjpYv6FGA%2B0exqNXlm%2FZAr1SQIs4ftIygwnHZt4S%2BMDsRz6HyyW0w8pjX1QY6pgEyyapEl0mhqRiT1CLmfUq7lptTXsP%2B5T9WLWqtoKGuDawPHnR5bsqwQ%2F0kKSPy8MbTzoB5FYvXw0L4bbs%2B67nwG9JCMhyt0sZww13NYNmdgIHIL5kriUyjn0OHariz%2B0m0V4LFvCV0cuR9OcVIZfGLsVUvePVBZVN6cTWIoYpvMQp%2FVN4t%2FnJHhHeRwm3DatI%2Bl7ZgCyzklnpNhkiS9SHurS9xkoR1&X-Amz-Signature=6faf684c0fd446464491f52b79bc8e0022ec8eb30b0d212b1b7076120a59fb34&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664WCA3N5G%2F20260925%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260925T022452Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBoaCXVzLXdlc3QtMiJGMEQCIHHBUwn9hfZbNiUMZXv5UGVaLQ8h8axYKaGblpkNMgJXAiA3IKyrJJTUVB3spGOXc68OxuhWZp1ZYO6yc7y1451oASqIBAji%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMJsQGHyxai15h2yWCKtwDwHQaMih0TPuAOVjJAqMVyr%2FC%2F7mhfOiaeyql3vtCRZogJ%2B3PwbU3C%2FHdofRN1TFYw1zhi3xeQKZcWtgAhZPoY1Y6%2BlzseDlqNpNdnEmJo9EtK%2BbT9uH9di9%2FoS8jtCFFymVtS%2BI5QIhWgkS0TB%2FVvhBC7RgIgJEYqT1sIBsRJOQKXVVGtJNmQI5SMaehDqDukxVk78pynS34UCCteVsPqTDKa6JFdKVvHHfjHqpoWYb4JKokQnGOn%2BBXIIIBl5HSVVJfmST86EqBmCbKTJOlddiuc3odXuWebGsA1YRnDhBRCD6D9JXtvqTsoDvQ4dH294UH56a5uCuqga7I1OQnPiBV0Met6cZ8LVWnLCulxDv%2FbBjPM2ed3t2o44%2BR%2B9blS7Hh2hlTc6BtKfIGc8%2F3Dj2b7rthr5PY2ZyE%2FhnZb4%2FAeFAcpVTa2WBYfEKMlI9PZ81konlBRCnJGgWOuOxXhkPUXQ%2BPixsXRtUEJMavurVrphzowDFE1QT6TSL7iORQERMWyXAXpEVh9z29xKe%2FBv7v8VKLgSWUFgBJj9i%2F9z26o3RdArc%2BQvnL0MghYd%2Fu6gdl%2BrXmjpYv6FGA%2B0exqNXlm%2FZAr1SQIs4ftIygwnHZt4S%2BMDsRz6HyyW0w8pjX1QY6pgEyyapEl0mhqRiT1CLmfUq7lptTXsP%2B5T9WLWqtoKGuDawPHnR5bsqwQ%2F0kKSPy8MbTzoB5FYvXw0L4bbs%2B67nwG9JCMhyt0sZww13NYNmdgIHIL5kriUyjn0OHariz%2B0m0V4LFvCV0cuR9OcVIZfGLsVUvePVBZVN6cTWIoYpvMQp%2FVN4t%2FnJHhHeRwm3DatI%2Bl7ZgCyzklnpNhkiS9SHurS9xkoR1&X-Amz-Signature=7f56c27ec0aeb42e1f9a1ca76628dfce3826b6b3aedb6e70d462f645a87c8b09&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664WCA3N5G%2F20260925%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260925T022452Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBoaCXVzLXdlc3QtMiJGMEQCIHHBUwn9hfZbNiUMZXv5UGVaLQ8h8axYKaGblpkNMgJXAiA3IKyrJJTUVB3spGOXc68OxuhWZp1ZYO6yc7y1451oASqIBAji%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMJsQGHyxai15h2yWCKtwDwHQaMih0TPuAOVjJAqMVyr%2FC%2F7mhfOiaeyql3vtCRZogJ%2B3PwbU3C%2FHdofRN1TFYw1zhi3xeQKZcWtgAhZPoY1Y6%2BlzseDlqNpNdnEmJo9EtK%2BbT9uH9di9%2FoS8jtCFFymVtS%2BI5QIhWgkS0TB%2FVvhBC7RgIgJEYqT1sIBsRJOQKXVVGtJNmQI5SMaehDqDukxVk78pynS34UCCteVsPqTDKa6JFdKVvHHfjHqpoWYb4JKokQnGOn%2BBXIIIBl5HSVVJfmST86EqBmCbKTJOlddiuc3odXuWebGsA1YRnDhBRCD6D9JXtvqTsoDvQ4dH294UH56a5uCuqga7I1OQnPiBV0Met6cZ8LVWnLCulxDv%2FbBjPM2ed3t2o44%2BR%2B9blS7Hh2hlTc6BtKfIGc8%2F3Dj2b7rthr5PY2ZyE%2FhnZb4%2FAeFAcpVTa2WBYfEKMlI9PZ81konlBRCnJGgWOuOxXhkPUXQ%2BPixsXRtUEJMavurVrphzowDFE1QT6TSL7iORQERMWyXAXpEVh9z29xKe%2FBv7v8VKLgSWUFgBJj9i%2F9z26o3RdArc%2BQvnL0MghYd%2Fu6gdl%2BrXmjpYv6FGA%2B0exqNXlm%2FZAr1SQIs4ftIygwnHZt4S%2BMDsRz6HyyW0w8pjX1QY6pgEyyapEl0mhqRiT1CLmfUq7lptTXsP%2B5T9WLWqtoKGuDawPHnR5bsqwQ%2F0kKSPy8MbTzoB5FYvXw0L4bbs%2B67nwG9JCMhyt0sZww13NYNmdgIHIL5kriUyjn0OHariz%2B0m0V4LFvCV0cuR9OcVIZfGLsVUvePVBZVN6cTWIoYpvMQp%2FVN4t%2FnJHhHeRwm3DatI%2Bl7ZgCyzklnpNhkiS9SHurS9xkoR1&X-Amz-Signature=efb26dd871d4fe14432618c9a9fcf3c7afaba75c9adad2a91fa2a66135c60325&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664WCA3N5G%2F20260925%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260925T022452Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBoaCXVzLXdlc3QtMiJGMEQCIHHBUwn9hfZbNiUMZXv5UGVaLQ8h8axYKaGblpkNMgJXAiA3IKyrJJTUVB3spGOXc68OxuhWZp1ZYO6yc7y1451oASqIBAji%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMJsQGHyxai15h2yWCKtwDwHQaMih0TPuAOVjJAqMVyr%2FC%2F7mhfOiaeyql3vtCRZogJ%2B3PwbU3C%2FHdofRN1TFYw1zhi3xeQKZcWtgAhZPoY1Y6%2BlzseDlqNpNdnEmJo9EtK%2BbT9uH9di9%2FoS8jtCFFymVtS%2BI5QIhWgkS0TB%2FVvhBC7RgIgJEYqT1sIBsRJOQKXVVGtJNmQI5SMaehDqDukxVk78pynS34UCCteVsPqTDKa6JFdKVvHHfjHqpoWYb4JKokQnGOn%2BBXIIIBl5HSVVJfmST86EqBmCbKTJOlddiuc3odXuWebGsA1YRnDhBRCD6D9JXtvqTsoDvQ4dH294UH56a5uCuqga7I1OQnPiBV0Met6cZ8LVWnLCulxDv%2FbBjPM2ed3t2o44%2BR%2B9blS7Hh2hlTc6BtKfIGc8%2F3Dj2b7rthr5PY2ZyE%2FhnZb4%2FAeFAcpVTa2WBYfEKMlI9PZ81konlBRCnJGgWOuOxXhkPUXQ%2BPixsXRtUEJMavurVrphzowDFE1QT6TSL7iORQERMWyXAXpEVh9z29xKe%2FBv7v8VKLgSWUFgBJj9i%2F9z26o3RdArc%2BQvnL0MghYd%2Fu6gdl%2BrXmjpYv6FGA%2B0exqNXlm%2FZAr1SQIs4ftIygwnHZt4S%2BMDsRz6HyyW0w8pjX1QY6pgEyyapEl0mhqRiT1CLmfUq7lptTXsP%2B5T9WLWqtoKGuDawPHnR5bsqwQ%2F0kKSPy8MbTzoB5FYvXw0L4bbs%2B67nwG9JCMhyt0sZww13NYNmdgIHIL5kriUyjn0OHariz%2B0m0V4LFvCV0cuR9OcVIZfGLsVUvePVBZVN6cTWIoYpvMQp%2FVN4t%2FnJHhHeRwm3DatI%2Bl7ZgCyzklnpNhkiS9SHurS9xkoR1&X-Amz-Signature=a3c56d4233f6746abfadb2466de0ee3d5cdd5d09f5454be6a899b05646de5963&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
