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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RPYXLSVP%2F20260902%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260902T153409Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIH8ztxc6bXZ7fky4YHX8poOAkBR%2Bx7sd21553d8MPNmaAiEAp5PzqMLa1DqHUvgF%2FIK8%2B81CZCBeGoCg4wI9UZgDqqgqiAQIyP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDAONW9E3TY4HKSF5ySrcAxPCU%2Fx%2FPniyX6D75fDKDNjeyFvwVNlP8HAGh4jOpOCTYx8qu3wfgj5%2BfxhMTSHtphootwgIhCTk9drQdyT5wnv6WfME0de8rtAGiLsEhG2FW3Hnm7wNWeOw8kWTQ5iWvlKqNHE%2Fr4qODzSW%2BirRQKCMMDV3Qb9wI%2F6YdvaKBxLAGCOeT3AFpX2BDnV5riAcfqIeoTSNki1IMJbX7cSY4XSazFt6khaVbtCzQdR%2F6Hnb%2BC04jYoT0%2Fz5sAbx5NO0FO1PS%2BfxfvmJs9BpptM36ZmpcYTZs4tSfPxEteFzzp%2Fpe4oKVzNQ3DW2H8iUndzVaCfklWG6SLKK2K4xC6CC9r%2FNwtUk2bRMuHjITZwOdQBLJ8SWROzW6f9PJOa1cN%2BZu019mAiXG%2BdUBUvO7xAf7OQM3HeiZhzUAOUZi9S0hplE67a2J38i8oSjPRqH046Md1rCKGmXQryZtZfIzGaa%2FC%2BId7BjfFzM4HloPJ2vkSH77oXbxtli9ClAMnR46lj3iJOoi50eyfmihuYqGMSdKXAisWf90vtZQaXyNxexNvwsVP8buhtlbnhgi4VPAQg8SGU60pvO33E%2BvgwOfiyiKuuZaRJgAMdPwZ0JWCkxXaRN96xaZ7U6898gcbwDMM324NQGOqUBJOm1loIWIYYy%2FDCYkrG9IbR0u0aLJ6RYFCjBHIy4W1fr4UzTcKrMOZZiJ82YaR8PQtaZ%2Bu8SX90Dr6hbjDU%2FW4pO46edHMkWMQvAWTJyG%2B68abTgTIKeb8uRz5gBvwuC4mpu8pbl6k%2BYMm36ysbeYX%2B8YMLeXeiCPiaxVHPyNww4%2BbJEb08Z%2FsvlrfSWbyv3jAcihizPa7qpFvI9SwwHsdt4qVXi&X-Amz-Signature=8a8c46d2c07be71564eda70d309f6c3d78d31ce31c2de2a95ab35e1868c6758f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RPYXLSVP%2F20260902%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260902T153409Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIH8ztxc6bXZ7fky4YHX8poOAkBR%2Bx7sd21553d8MPNmaAiEAp5PzqMLa1DqHUvgF%2FIK8%2B81CZCBeGoCg4wI9UZgDqqgqiAQIyP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDAONW9E3TY4HKSF5ySrcAxPCU%2Fx%2FPniyX6D75fDKDNjeyFvwVNlP8HAGh4jOpOCTYx8qu3wfgj5%2BfxhMTSHtphootwgIhCTk9drQdyT5wnv6WfME0de8rtAGiLsEhG2FW3Hnm7wNWeOw8kWTQ5iWvlKqNHE%2Fr4qODzSW%2BirRQKCMMDV3Qb9wI%2F6YdvaKBxLAGCOeT3AFpX2BDnV5riAcfqIeoTSNki1IMJbX7cSY4XSazFt6khaVbtCzQdR%2F6Hnb%2BC04jYoT0%2Fz5sAbx5NO0FO1PS%2BfxfvmJs9BpptM36ZmpcYTZs4tSfPxEteFzzp%2Fpe4oKVzNQ3DW2H8iUndzVaCfklWG6SLKK2K4xC6CC9r%2FNwtUk2bRMuHjITZwOdQBLJ8SWROzW6f9PJOa1cN%2BZu019mAiXG%2BdUBUvO7xAf7OQM3HeiZhzUAOUZi9S0hplE67a2J38i8oSjPRqH046Md1rCKGmXQryZtZfIzGaa%2FC%2BId7BjfFzM4HloPJ2vkSH77oXbxtli9ClAMnR46lj3iJOoi50eyfmihuYqGMSdKXAisWf90vtZQaXyNxexNvwsVP8buhtlbnhgi4VPAQg8SGU60pvO33E%2BvgwOfiyiKuuZaRJgAMdPwZ0JWCkxXaRN96xaZ7U6898gcbwDMM324NQGOqUBJOm1loIWIYYy%2FDCYkrG9IbR0u0aLJ6RYFCjBHIy4W1fr4UzTcKrMOZZiJ82YaR8PQtaZ%2Bu8SX90Dr6hbjDU%2FW4pO46edHMkWMQvAWTJyG%2B68abTgTIKeb8uRz5gBvwuC4mpu8pbl6k%2BYMm36ysbeYX%2B8YMLeXeiCPiaxVHPyNww4%2BbJEb08Z%2FsvlrfSWbyv3jAcihizPa7qpFvI9SwwHsdt4qVXi&X-Amz-Signature=c40961d3bd89f61d7837f5e241c61d9f62a0df9e6337021f3780b9b7f690bb91&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RPYXLSVP%2F20260902%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260902T153409Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIH8ztxc6bXZ7fky4YHX8poOAkBR%2Bx7sd21553d8MPNmaAiEAp5PzqMLa1DqHUvgF%2FIK8%2B81CZCBeGoCg4wI9UZgDqqgqiAQIyP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDAONW9E3TY4HKSF5ySrcAxPCU%2Fx%2FPniyX6D75fDKDNjeyFvwVNlP8HAGh4jOpOCTYx8qu3wfgj5%2BfxhMTSHtphootwgIhCTk9drQdyT5wnv6WfME0de8rtAGiLsEhG2FW3Hnm7wNWeOw8kWTQ5iWvlKqNHE%2Fr4qODzSW%2BirRQKCMMDV3Qb9wI%2F6YdvaKBxLAGCOeT3AFpX2BDnV5riAcfqIeoTSNki1IMJbX7cSY4XSazFt6khaVbtCzQdR%2F6Hnb%2BC04jYoT0%2Fz5sAbx5NO0FO1PS%2BfxfvmJs9BpptM36ZmpcYTZs4tSfPxEteFzzp%2Fpe4oKVzNQ3DW2H8iUndzVaCfklWG6SLKK2K4xC6CC9r%2FNwtUk2bRMuHjITZwOdQBLJ8SWROzW6f9PJOa1cN%2BZu019mAiXG%2BdUBUvO7xAf7OQM3HeiZhzUAOUZi9S0hplE67a2J38i8oSjPRqH046Md1rCKGmXQryZtZfIzGaa%2FC%2BId7BjfFzM4HloPJ2vkSH77oXbxtli9ClAMnR46lj3iJOoi50eyfmihuYqGMSdKXAisWf90vtZQaXyNxexNvwsVP8buhtlbnhgi4VPAQg8SGU60pvO33E%2BvgwOfiyiKuuZaRJgAMdPwZ0JWCkxXaRN96xaZ7U6898gcbwDMM324NQGOqUBJOm1loIWIYYy%2FDCYkrG9IbR0u0aLJ6RYFCjBHIy4W1fr4UzTcKrMOZZiJ82YaR8PQtaZ%2Bu8SX90Dr6hbjDU%2FW4pO46edHMkWMQvAWTJyG%2B68abTgTIKeb8uRz5gBvwuC4mpu8pbl6k%2BYMm36ysbeYX%2B8YMLeXeiCPiaxVHPyNww4%2BbJEb08Z%2FsvlrfSWbyv3jAcihizPa7qpFvI9SwwHsdt4qVXi&X-Amz-Signature=b8154e17b7dd568ca3f12dac1e1f164e81a7f8931ce0130352a9d1b93f3e4b53&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RPYXLSVP%2F20260902%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260902T153409Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIH8ztxc6bXZ7fky4YHX8poOAkBR%2Bx7sd21553d8MPNmaAiEAp5PzqMLa1DqHUvgF%2FIK8%2B81CZCBeGoCg4wI9UZgDqqgqiAQIyP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDAONW9E3TY4HKSF5ySrcAxPCU%2Fx%2FPniyX6D75fDKDNjeyFvwVNlP8HAGh4jOpOCTYx8qu3wfgj5%2BfxhMTSHtphootwgIhCTk9drQdyT5wnv6WfME0de8rtAGiLsEhG2FW3Hnm7wNWeOw8kWTQ5iWvlKqNHE%2Fr4qODzSW%2BirRQKCMMDV3Qb9wI%2F6YdvaKBxLAGCOeT3AFpX2BDnV5riAcfqIeoTSNki1IMJbX7cSY4XSazFt6khaVbtCzQdR%2F6Hnb%2BC04jYoT0%2Fz5sAbx5NO0FO1PS%2BfxfvmJs9BpptM36ZmpcYTZs4tSfPxEteFzzp%2Fpe4oKVzNQ3DW2H8iUndzVaCfklWG6SLKK2K4xC6CC9r%2FNwtUk2bRMuHjITZwOdQBLJ8SWROzW6f9PJOa1cN%2BZu019mAiXG%2BdUBUvO7xAf7OQM3HeiZhzUAOUZi9S0hplE67a2J38i8oSjPRqH046Md1rCKGmXQryZtZfIzGaa%2FC%2BId7BjfFzM4HloPJ2vkSH77oXbxtli9ClAMnR46lj3iJOoi50eyfmihuYqGMSdKXAisWf90vtZQaXyNxexNvwsVP8buhtlbnhgi4VPAQg8SGU60pvO33E%2BvgwOfiyiKuuZaRJgAMdPwZ0JWCkxXaRN96xaZ7U6898gcbwDMM324NQGOqUBJOm1loIWIYYy%2FDCYkrG9IbR0u0aLJ6RYFCjBHIy4W1fr4UzTcKrMOZZiJ82YaR8PQtaZ%2Bu8SX90Dr6hbjDU%2FW4pO46edHMkWMQvAWTJyG%2B68abTgTIKeb8uRz5gBvwuC4mpu8pbl6k%2BYMm36ysbeYX%2B8YMLeXeiCPiaxVHPyNww4%2BbJEb08Z%2FsvlrfSWbyv3jAcihizPa7qpFvI9SwwHsdt4qVXi&X-Amz-Signature=aa82e103c6fee8527230949116e3d8112ca72cb35b93a66a3c843fa6a99b0df9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
