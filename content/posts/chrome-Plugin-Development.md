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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664EVLWEH5%2F20261021%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261021T205955Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCamYMjYExGia42M%2FBh%2Bu3obEB2VSlV8RLnFrYRnsgwvgIhAI9ooc%2FnhLfzE1IYY%2B7ysPRcd%2BH86sROHejT%2FJZyfvHxKv8DCGQQABoMNjM3NDIzMTgzODA1Igxg4G6aEH9gGz5XSWgq3ANUc%2Fb0Pfxg5hxnHrYxugnGIPgLNkNkFdJXiDZtWDiwX2OBqzsSbru2Gd55drNdrEAbUyt6cEE00YK3v%2Bv2VNW3gkoUTG30iabkbsH1Ll6Bxqbn29NdaIvawcgd4T6dRccrMufgzuWO8wS9r6ztndqqbNK4lOGA32mon63fizsifxaKKfKahG7F8c3mmyNq2BXavvdDu9s%2FQll%2BownQdelYx%2FIaAt5u041O909jnZDD0uDE9OHMMz65a%2FeTf5lnzLpRa96p6rGxi1HgHp51oTTHxqBERo5z3kuJeBRxc8XdGERibDeJTLEHb2w0d78GVSQ6z6iGIpW4NGX%2Bql9JqTN5TKSase%2FihbWgSRDyQ2a97QaYsctIIYtdrU91Rng04v6wkbQ3HLpzFNkYtTJaI7y0X2usowaTKrXmiGLAoz8f%2FzV5C%2BCDLTFlAibBzr706QAwarh65E28tZUuf%2BLIOLm3ICaf3rIiVQjHqA%2Fa3UzL%2Bm%2Bu6jgaOeOJe%2Fz4jlNF8VzEdio4AMn6I0P8n7TIIHQ33f%2FfMshXfBn7ohwJicdYg7x8gFYhrVstiLytRgy5qCitDQKrMcXML5wuNs5NSbH2u2Z1p20cVnHYTlUh%2F25Mdv6jyia4ffkkhMdJwzCvouTWBjqkAZmu%2BxfINmVoDMAKUQDbGRqP2TguxGTydPHTSYFkKcbN9cZNtt3eqEAdNzDhAW5dHKrWV2bX%2F2G9N1zNmGw4DysWDHyQLK8v%2F%2BKXSi8yOI6c5AYGWGGs7QWi2iiRJIfbDwFDSsyZayp0nLXg5z1SqYHXu%2FSPjPiDSLolp85oV%2B5lF7XgEF9NfJkpjeDWLQTACK4I2%2BN6J5RLwfP3%2B62koSTSO8Yb&X-Amz-Signature=ec9563b2d93ba540bfc1455b9b7329a1bdf30694ebe610d76ec539a34d557026&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664EVLWEH5%2F20261021%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261021T205955Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCamYMjYExGia42M%2FBh%2Bu3obEB2VSlV8RLnFrYRnsgwvgIhAI9ooc%2FnhLfzE1IYY%2B7ysPRcd%2BH86sROHejT%2FJZyfvHxKv8DCGQQABoMNjM3NDIzMTgzODA1Igxg4G6aEH9gGz5XSWgq3ANUc%2Fb0Pfxg5hxnHrYxugnGIPgLNkNkFdJXiDZtWDiwX2OBqzsSbru2Gd55drNdrEAbUyt6cEE00YK3v%2Bv2VNW3gkoUTG30iabkbsH1Ll6Bxqbn29NdaIvawcgd4T6dRccrMufgzuWO8wS9r6ztndqqbNK4lOGA32mon63fizsifxaKKfKahG7F8c3mmyNq2BXavvdDu9s%2FQll%2BownQdelYx%2FIaAt5u041O909jnZDD0uDE9OHMMz65a%2FeTf5lnzLpRa96p6rGxi1HgHp51oTTHxqBERo5z3kuJeBRxc8XdGERibDeJTLEHb2w0d78GVSQ6z6iGIpW4NGX%2Bql9JqTN5TKSase%2FihbWgSRDyQ2a97QaYsctIIYtdrU91Rng04v6wkbQ3HLpzFNkYtTJaI7y0X2usowaTKrXmiGLAoz8f%2FzV5C%2BCDLTFlAibBzr706QAwarh65E28tZUuf%2BLIOLm3ICaf3rIiVQjHqA%2Fa3UzL%2Bm%2Bu6jgaOeOJe%2Fz4jlNF8VzEdio4AMn6I0P8n7TIIHQ33f%2FfMshXfBn7ohwJicdYg7x8gFYhrVstiLytRgy5qCitDQKrMcXML5wuNs5NSbH2u2Z1p20cVnHYTlUh%2F25Mdv6jyia4ffkkhMdJwzCvouTWBjqkAZmu%2BxfINmVoDMAKUQDbGRqP2TguxGTydPHTSYFkKcbN9cZNtt3eqEAdNzDhAW5dHKrWV2bX%2F2G9N1zNmGw4DysWDHyQLK8v%2F%2BKXSi8yOI6c5AYGWGGs7QWi2iiRJIfbDwFDSsyZayp0nLXg5z1SqYHXu%2FSPjPiDSLolp85oV%2B5lF7XgEF9NfJkpjeDWLQTACK4I2%2BN6J5RLwfP3%2B62koSTSO8Yb&X-Amz-Signature=29ad81f730920e83f61c9f1f2490d639abf1c80a8d218163c9fa383c74fc955a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664EVLWEH5%2F20261021%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261021T205955Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCamYMjYExGia42M%2FBh%2Bu3obEB2VSlV8RLnFrYRnsgwvgIhAI9ooc%2FnhLfzE1IYY%2B7ysPRcd%2BH86sROHejT%2FJZyfvHxKv8DCGQQABoMNjM3NDIzMTgzODA1Igxg4G6aEH9gGz5XSWgq3ANUc%2Fb0Pfxg5hxnHrYxugnGIPgLNkNkFdJXiDZtWDiwX2OBqzsSbru2Gd55drNdrEAbUyt6cEE00YK3v%2Bv2VNW3gkoUTG30iabkbsH1Ll6Bxqbn29NdaIvawcgd4T6dRccrMufgzuWO8wS9r6ztndqqbNK4lOGA32mon63fizsifxaKKfKahG7F8c3mmyNq2BXavvdDu9s%2FQll%2BownQdelYx%2FIaAt5u041O909jnZDD0uDE9OHMMz65a%2FeTf5lnzLpRa96p6rGxi1HgHp51oTTHxqBERo5z3kuJeBRxc8XdGERibDeJTLEHb2w0d78GVSQ6z6iGIpW4NGX%2Bql9JqTN5TKSase%2FihbWgSRDyQ2a97QaYsctIIYtdrU91Rng04v6wkbQ3HLpzFNkYtTJaI7y0X2usowaTKrXmiGLAoz8f%2FzV5C%2BCDLTFlAibBzr706QAwarh65E28tZUuf%2BLIOLm3ICaf3rIiVQjHqA%2Fa3UzL%2Bm%2Bu6jgaOeOJe%2Fz4jlNF8VzEdio4AMn6I0P8n7TIIHQ33f%2FfMshXfBn7ohwJicdYg7x8gFYhrVstiLytRgy5qCitDQKrMcXML5wuNs5NSbH2u2Z1p20cVnHYTlUh%2F25Mdv6jyia4ffkkhMdJwzCvouTWBjqkAZmu%2BxfINmVoDMAKUQDbGRqP2TguxGTydPHTSYFkKcbN9cZNtt3eqEAdNzDhAW5dHKrWV2bX%2F2G9N1zNmGw4DysWDHyQLK8v%2F%2BKXSi8yOI6c5AYGWGGs7QWi2iiRJIfbDwFDSsyZayp0nLXg5z1SqYHXu%2FSPjPiDSLolp85oV%2B5lF7XgEF9NfJkpjeDWLQTACK4I2%2BN6J5RLwfP3%2B62koSTSO8Yb&X-Amz-Signature=b17a03694b620884144395ea58a148211aa601665336d492ddca2eeacf2ecf2e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664EVLWEH5%2F20261021%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261021T205955Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCamYMjYExGia42M%2FBh%2Bu3obEB2VSlV8RLnFrYRnsgwvgIhAI9ooc%2FnhLfzE1IYY%2B7ysPRcd%2BH86sROHejT%2FJZyfvHxKv8DCGQQABoMNjM3NDIzMTgzODA1Igxg4G6aEH9gGz5XSWgq3ANUc%2Fb0Pfxg5hxnHrYxugnGIPgLNkNkFdJXiDZtWDiwX2OBqzsSbru2Gd55drNdrEAbUyt6cEE00YK3v%2Bv2VNW3gkoUTG30iabkbsH1Ll6Bxqbn29NdaIvawcgd4T6dRccrMufgzuWO8wS9r6ztndqqbNK4lOGA32mon63fizsifxaKKfKahG7F8c3mmyNq2BXavvdDu9s%2FQll%2BownQdelYx%2FIaAt5u041O909jnZDD0uDE9OHMMz65a%2FeTf5lnzLpRa96p6rGxi1HgHp51oTTHxqBERo5z3kuJeBRxc8XdGERibDeJTLEHb2w0d78GVSQ6z6iGIpW4NGX%2Bql9JqTN5TKSase%2FihbWgSRDyQ2a97QaYsctIIYtdrU91Rng04v6wkbQ3HLpzFNkYtTJaI7y0X2usowaTKrXmiGLAoz8f%2FzV5C%2BCDLTFlAibBzr706QAwarh65E28tZUuf%2BLIOLm3ICaf3rIiVQjHqA%2Fa3UzL%2Bm%2Bu6jgaOeOJe%2Fz4jlNF8VzEdio4AMn6I0P8n7TIIHQ33f%2FfMshXfBn7ohwJicdYg7x8gFYhrVstiLytRgy5qCitDQKrMcXML5wuNs5NSbH2u2Z1p20cVnHYTlUh%2F25Mdv6jyia4ffkkhMdJwzCvouTWBjqkAZmu%2BxfINmVoDMAKUQDbGRqP2TguxGTydPHTSYFkKcbN9cZNtt3eqEAdNzDhAW5dHKrWV2bX%2F2G9N1zNmGw4DysWDHyQLK8v%2F%2BKXSi8yOI6c5AYGWGGs7QWi2iiRJIfbDwFDSsyZayp0nLXg5z1SqYHXu%2FSPjPiDSLolp85oV%2B5lF7XgEF9NfJkpjeDWLQTACK4I2%2BN6J5RLwfP3%2B62koSTSO8Yb&X-Amz-Signature=abf13eb7a05db5c1d63281a3d33a77b211b880cd435dc01c22b66b3f13500d10&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
