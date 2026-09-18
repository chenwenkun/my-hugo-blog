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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SVJ6L4U2%2F20260918%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260918T200722Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDYDzCka28x2iFFDAAKeSkCtIGKhibh5lDVY1IWy3%2BhsgIhAKrwwTlhSFxo5f3ep1l2%2Bjkvpr0vFdCAAZ916zKf2Ds9Kv8DCEsQABoMNjM3NDIzMTgzODA1IgxdbpoRaxHwOp1WL%2B4q3APYRPkuBEAA9ChrbeWCtebee2KElFLoqTA0Wm3kQtfJHBp8zHSjE5dSKW6ijf3tHJAPCDc73A2c%2FDUp1f1Nxc3910fP0BdnMg6BwCDSXDVax9qPDWor1MS9ANKfT1dAK4rQEWsPKcbNBNNoNjlgID79d637dlGINRlUPIS3fqvVZh%2Fx%2BJsApcWYh9Xx2lxV5TXdiSgQzLli2FBJMsUvph6DLLLnh3ZVQ6CUKEUx8Voelc%2FPdnBDhRegXd3gk6UiElkAeHdUFgbSmana7lQ8Uugat11TMo%2FSKlDEevyU6k4TCaLMOmFeMzu38%2FvkVLNH%2FGnNMrqXDDai7NIgU0Tg%2FpZ8xmwOSSb%2Ft6p6SVqW088Sd81nVeKE3Swn7DP1gU4%2FLNNVdr2R00lZ0CXW4%2FYVVo3sbd0jbdD1Nfv1yygc5aQxLObkhi3%2FwyH91bTf3rJPS%2FVjh%2Bx01TfU3mSZydZlACDKGgP6%2BZMWHHEj69U%2FmcvXJDZAnKf%2FppJpS6PAtLJtaBmW%2BYmgVov9lknLAmawLhZUQxpmteRnmCSHyUdpbUkCgldc87HVNeb%2FNVDQTKDN4wW2XjiCT9D1H960FLbgRxibTqrZfns0%2Fiv9Sq%2B7P6iW56Y80i98wkBMy4YQzjDfgrbVBjqkARH9tE%2BMH5NzNuf9%2FuLz%2Fc6hoPnnjZA0rtMeV6ZQ0cVOBj9%2Bnwc8ExBsy7dI2fZXiurgHbldVX8V54p6bzq8eZa4vNHf%2BiTxHJ2wEr2ycMTBKLlhnmOA0%2BqSbcQuj0g3zQ2j3Hm6r3SZ8ukiGRLMxpKrWKblk5B8%2B2zU3A0Me%2FCD4xBzr9OnmfwsOK94JcrWXqn537uTAyNg0wCpjJdDRuZ9FluA&X-Amz-Signature=6109b806bd9922f6c94d84a74d1f30e38867a369e45bbcdbc4939f3131e866d4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SVJ6L4U2%2F20260918%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260918T200722Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDYDzCka28x2iFFDAAKeSkCtIGKhibh5lDVY1IWy3%2BhsgIhAKrwwTlhSFxo5f3ep1l2%2Bjkvpr0vFdCAAZ916zKf2Ds9Kv8DCEsQABoMNjM3NDIzMTgzODA1IgxdbpoRaxHwOp1WL%2B4q3APYRPkuBEAA9ChrbeWCtebee2KElFLoqTA0Wm3kQtfJHBp8zHSjE5dSKW6ijf3tHJAPCDc73A2c%2FDUp1f1Nxc3910fP0BdnMg6BwCDSXDVax9qPDWor1MS9ANKfT1dAK4rQEWsPKcbNBNNoNjlgID79d637dlGINRlUPIS3fqvVZh%2Fx%2BJsApcWYh9Xx2lxV5TXdiSgQzLli2FBJMsUvph6DLLLnh3ZVQ6CUKEUx8Voelc%2FPdnBDhRegXd3gk6UiElkAeHdUFgbSmana7lQ8Uugat11TMo%2FSKlDEevyU6k4TCaLMOmFeMzu38%2FvkVLNH%2FGnNMrqXDDai7NIgU0Tg%2FpZ8xmwOSSb%2Ft6p6SVqW088Sd81nVeKE3Swn7DP1gU4%2FLNNVdr2R00lZ0CXW4%2FYVVo3sbd0jbdD1Nfv1yygc5aQxLObkhi3%2FwyH91bTf3rJPS%2FVjh%2Bx01TfU3mSZydZlACDKGgP6%2BZMWHHEj69U%2FmcvXJDZAnKf%2FppJpS6PAtLJtaBmW%2BYmgVov9lknLAmawLhZUQxpmteRnmCSHyUdpbUkCgldc87HVNeb%2FNVDQTKDN4wW2XjiCT9D1H960FLbgRxibTqrZfns0%2Fiv9Sq%2B7P6iW56Y80i98wkBMy4YQzjDfgrbVBjqkARH9tE%2BMH5NzNuf9%2FuLz%2Fc6hoPnnjZA0rtMeV6ZQ0cVOBj9%2Bnwc8ExBsy7dI2fZXiurgHbldVX8V54p6bzq8eZa4vNHf%2BiTxHJ2wEr2ycMTBKLlhnmOA0%2BqSbcQuj0g3zQ2j3Hm6r3SZ8ukiGRLMxpKrWKblk5B8%2B2zU3A0Me%2FCD4xBzr9OnmfwsOK94JcrWXqn537uTAyNg0wCpjJdDRuZ9FluA&X-Amz-Signature=e90216a7a36de00e74f0c696e17df84088554e17be66b8190c2441aae4c59515&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SVJ6L4U2%2F20260918%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260918T200722Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDYDzCka28x2iFFDAAKeSkCtIGKhibh5lDVY1IWy3%2BhsgIhAKrwwTlhSFxo5f3ep1l2%2Bjkvpr0vFdCAAZ916zKf2Ds9Kv8DCEsQABoMNjM3NDIzMTgzODA1IgxdbpoRaxHwOp1WL%2B4q3APYRPkuBEAA9ChrbeWCtebee2KElFLoqTA0Wm3kQtfJHBp8zHSjE5dSKW6ijf3tHJAPCDc73A2c%2FDUp1f1Nxc3910fP0BdnMg6BwCDSXDVax9qPDWor1MS9ANKfT1dAK4rQEWsPKcbNBNNoNjlgID79d637dlGINRlUPIS3fqvVZh%2Fx%2BJsApcWYh9Xx2lxV5TXdiSgQzLli2FBJMsUvph6DLLLnh3ZVQ6CUKEUx8Voelc%2FPdnBDhRegXd3gk6UiElkAeHdUFgbSmana7lQ8Uugat11TMo%2FSKlDEevyU6k4TCaLMOmFeMzu38%2FvkVLNH%2FGnNMrqXDDai7NIgU0Tg%2FpZ8xmwOSSb%2Ft6p6SVqW088Sd81nVeKE3Swn7DP1gU4%2FLNNVdr2R00lZ0CXW4%2FYVVo3sbd0jbdD1Nfv1yygc5aQxLObkhi3%2FwyH91bTf3rJPS%2FVjh%2Bx01TfU3mSZydZlACDKGgP6%2BZMWHHEj69U%2FmcvXJDZAnKf%2FppJpS6PAtLJtaBmW%2BYmgVov9lknLAmawLhZUQxpmteRnmCSHyUdpbUkCgldc87HVNeb%2FNVDQTKDN4wW2XjiCT9D1H960FLbgRxibTqrZfns0%2Fiv9Sq%2B7P6iW56Y80i98wkBMy4YQzjDfgrbVBjqkARH9tE%2BMH5NzNuf9%2FuLz%2Fc6hoPnnjZA0rtMeV6ZQ0cVOBj9%2Bnwc8ExBsy7dI2fZXiurgHbldVX8V54p6bzq8eZa4vNHf%2BiTxHJ2wEr2ycMTBKLlhnmOA0%2BqSbcQuj0g3zQ2j3Hm6r3SZ8ukiGRLMxpKrWKblk5B8%2B2zU3A0Me%2FCD4xBzr9OnmfwsOK94JcrWXqn537uTAyNg0wCpjJdDRuZ9FluA&X-Amz-Signature=c93a61d0b2a56f9a50a7bb122b1f48763f32b052dd97b3dd7467924a9142e556&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SVJ6L4U2%2F20260918%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260918T200722Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDYDzCka28x2iFFDAAKeSkCtIGKhibh5lDVY1IWy3%2BhsgIhAKrwwTlhSFxo5f3ep1l2%2Bjkvpr0vFdCAAZ916zKf2Ds9Kv8DCEsQABoMNjM3NDIzMTgzODA1IgxdbpoRaxHwOp1WL%2B4q3APYRPkuBEAA9ChrbeWCtebee2KElFLoqTA0Wm3kQtfJHBp8zHSjE5dSKW6ijf3tHJAPCDc73A2c%2FDUp1f1Nxc3910fP0BdnMg6BwCDSXDVax9qPDWor1MS9ANKfT1dAK4rQEWsPKcbNBNNoNjlgID79d637dlGINRlUPIS3fqvVZh%2Fx%2BJsApcWYh9Xx2lxV5TXdiSgQzLli2FBJMsUvph6DLLLnh3ZVQ6CUKEUx8Voelc%2FPdnBDhRegXd3gk6UiElkAeHdUFgbSmana7lQ8Uugat11TMo%2FSKlDEevyU6k4TCaLMOmFeMzu38%2FvkVLNH%2FGnNMrqXDDai7NIgU0Tg%2FpZ8xmwOSSb%2Ft6p6SVqW088Sd81nVeKE3Swn7DP1gU4%2FLNNVdr2R00lZ0CXW4%2FYVVo3sbd0jbdD1Nfv1yygc5aQxLObkhi3%2FwyH91bTf3rJPS%2FVjh%2Bx01TfU3mSZydZlACDKGgP6%2BZMWHHEj69U%2FmcvXJDZAnKf%2FppJpS6PAtLJtaBmW%2BYmgVov9lknLAmawLhZUQxpmteRnmCSHyUdpbUkCgldc87HVNeb%2FNVDQTKDN4wW2XjiCT9D1H960FLbgRxibTqrZfns0%2Fiv9Sq%2B7P6iW56Y80i98wkBMy4YQzjDfgrbVBjqkARH9tE%2BMH5NzNuf9%2FuLz%2Fc6hoPnnjZA0rtMeV6ZQ0cVOBj9%2Bnwc8ExBsy7dI2fZXiurgHbldVX8V54p6bzq8eZa4vNHf%2BiTxHJ2wEr2ycMTBKLlhnmOA0%2BqSbcQuj0g3zQ2j3Hm6r3SZ8ukiGRLMxpKrWKblk5B8%2B2zU3A0Me%2FCD4xBzr9OnmfwsOK94JcrWXqn537uTAyNg0wCpjJdDRuZ9FluA&X-Amz-Signature=3de009c093622cce36f1ed4816e787b42afed06d6127465403ea50fd9a36bff3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
