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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U2LNJLRV%2F20260830%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260830T201526Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCdCviAOmqiV9xONOqZobkQHo2AuPLtzVhc9LhbeBwHLwIgY%2BcHbtPreZ5rI0sLWoAJIv5k%2BUTp8JY0RFxzyMkzx0YqiAQIhf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDEIj1z%2B8veN0OkYMFCrcA84q9DV1HPNaMthIeu5Di%2BfPEu%2FAm0CPOKgIFOtYbjt%2FeZxlJfNBa8Ms%2FO7xmXg%2BuVyOR%2FnwqYvV7BmQyFpLsgUy6vz48rV3noy%2BkBwP1mAuSGrI2wXogOYQDKBD04bJGcZPzTLmB4KWs0HPyvz%2FZtRL4Ehr3GcB5Ja5%2BmwQ8yGRgABPDNex4ervmXKDQsr2onO1x5QMNyvkqt3sxA%2BIHFL6cuAFs6RDFHIG0AsvuOCRQ6igSL3LbwnHQ7zM10CFvzyr856Sp%2B24CnsQlpfCddF1zL%2B7Sv57yTf1Stq5B%2F5mR9axW5mgImqcUfITp5K2YPmK1e9iI%2BH4vE2c3C4eiT5vptEYpxrHkSmfd5V7eWIQJbGTtcn%2BMHKh85HuV8HsKUq5LOuGXnxk2GIOPLp8kdiEaJ%2BhVQs%2FHZaStLoAjF1%2BHfORtav%2FV1F1SImT91nNuSohqI4TDnzHS7%2FBXHylfbNA7AhWvq6FCkjFIjPQ97qxa57GPNMZVX%2B3CEd%2F%2FIHe6GupgiB9K2oBAmdPSagMzRdizg3b3SGdiVl4Sbapro4%2BfQ%2B1ZokVuHf6WQNWPwZyQ5%2BHoxmsiRu2o2rCENnWknf678AaQcVQ%2FaaQm2VgpO%2F8eafVfMRFGnAfKpMdMN2Q0tQGOqUBnBSN4CMPv4eeoAv4tLcUSPjKSLqJ7vr%2FcyqJUcMrv0pVn1dZwta9kS0F%2Fg%2BeLXwGnfIxWRJPt5FN55qhvq4b1uXqwy0otPQSoPzC6g163z3cp2srwqUyO9gfP2xgJun0rTNvQrP7FjWN0dOVCWWqJirbc1iyerYxcFvlSmmSauWajMACbQ4zvn1uNYd%2Bo3ot5%2BqzTnEpABuhawmHmR82Qdr%2FwYLp&X-Amz-Signature=bce263f83fe62b01035f358b8ae7da956a98eff6d24adf90506bd9a329becb18&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U2LNJLRV%2F20260830%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260830T201526Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCdCviAOmqiV9xONOqZobkQHo2AuPLtzVhc9LhbeBwHLwIgY%2BcHbtPreZ5rI0sLWoAJIv5k%2BUTp8JY0RFxzyMkzx0YqiAQIhf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDEIj1z%2B8veN0OkYMFCrcA84q9DV1HPNaMthIeu5Di%2BfPEu%2FAm0CPOKgIFOtYbjt%2FeZxlJfNBa8Ms%2FO7xmXg%2BuVyOR%2FnwqYvV7BmQyFpLsgUy6vz48rV3noy%2BkBwP1mAuSGrI2wXogOYQDKBD04bJGcZPzTLmB4KWs0HPyvz%2FZtRL4Ehr3GcB5Ja5%2BmwQ8yGRgABPDNex4ervmXKDQsr2onO1x5QMNyvkqt3sxA%2BIHFL6cuAFs6RDFHIG0AsvuOCRQ6igSL3LbwnHQ7zM10CFvzyr856Sp%2B24CnsQlpfCddF1zL%2B7Sv57yTf1Stq5B%2F5mR9axW5mgImqcUfITp5K2YPmK1e9iI%2BH4vE2c3C4eiT5vptEYpxrHkSmfd5V7eWIQJbGTtcn%2BMHKh85HuV8HsKUq5LOuGXnxk2GIOPLp8kdiEaJ%2BhVQs%2FHZaStLoAjF1%2BHfORtav%2FV1F1SImT91nNuSohqI4TDnzHS7%2FBXHylfbNA7AhWvq6FCkjFIjPQ97qxa57GPNMZVX%2B3CEd%2F%2FIHe6GupgiB9K2oBAmdPSagMzRdizg3b3SGdiVl4Sbapro4%2BfQ%2B1ZokVuHf6WQNWPwZyQ5%2BHoxmsiRu2o2rCENnWknf678AaQcVQ%2FaaQm2VgpO%2F8eafVfMRFGnAfKpMdMN2Q0tQGOqUBnBSN4CMPv4eeoAv4tLcUSPjKSLqJ7vr%2FcyqJUcMrv0pVn1dZwta9kS0F%2Fg%2BeLXwGnfIxWRJPt5FN55qhvq4b1uXqwy0otPQSoPzC6g163z3cp2srwqUyO9gfP2xgJun0rTNvQrP7FjWN0dOVCWWqJirbc1iyerYxcFvlSmmSauWajMACbQ4zvn1uNYd%2Bo3ot5%2BqzTnEpABuhawmHmR82Qdr%2FwYLp&X-Amz-Signature=02b9adc48a9a8a387585dfe7afe78e6a8d1214e119474cff1e85b3e6a7841774&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U2LNJLRV%2F20260830%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260830T201526Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCdCviAOmqiV9xONOqZobkQHo2AuPLtzVhc9LhbeBwHLwIgY%2BcHbtPreZ5rI0sLWoAJIv5k%2BUTp8JY0RFxzyMkzx0YqiAQIhf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDEIj1z%2B8veN0OkYMFCrcA84q9DV1HPNaMthIeu5Di%2BfPEu%2FAm0CPOKgIFOtYbjt%2FeZxlJfNBa8Ms%2FO7xmXg%2BuVyOR%2FnwqYvV7BmQyFpLsgUy6vz48rV3noy%2BkBwP1mAuSGrI2wXogOYQDKBD04bJGcZPzTLmB4KWs0HPyvz%2FZtRL4Ehr3GcB5Ja5%2BmwQ8yGRgABPDNex4ervmXKDQsr2onO1x5QMNyvkqt3sxA%2BIHFL6cuAFs6RDFHIG0AsvuOCRQ6igSL3LbwnHQ7zM10CFvzyr856Sp%2B24CnsQlpfCddF1zL%2B7Sv57yTf1Stq5B%2F5mR9axW5mgImqcUfITp5K2YPmK1e9iI%2BH4vE2c3C4eiT5vptEYpxrHkSmfd5V7eWIQJbGTtcn%2BMHKh85HuV8HsKUq5LOuGXnxk2GIOPLp8kdiEaJ%2BhVQs%2FHZaStLoAjF1%2BHfORtav%2FV1F1SImT91nNuSohqI4TDnzHS7%2FBXHylfbNA7AhWvq6FCkjFIjPQ97qxa57GPNMZVX%2B3CEd%2F%2FIHe6GupgiB9K2oBAmdPSagMzRdizg3b3SGdiVl4Sbapro4%2BfQ%2B1ZokVuHf6WQNWPwZyQ5%2BHoxmsiRu2o2rCENnWknf678AaQcVQ%2FaaQm2VgpO%2F8eafVfMRFGnAfKpMdMN2Q0tQGOqUBnBSN4CMPv4eeoAv4tLcUSPjKSLqJ7vr%2FcyqJUcMrv0pVn1dZwta9kS0F%2Fg%2BeLXwGnfIxWRJPt5FN55qhvq4b1uXqwy0otPQSoPzC6g163z3cp2srwqUyO9gfP2xgJun0rTNvQrP7FjWN0dOVCWWqJirbc1iyerYxcFvlSmmSauWajMACbQ4zvn1uNYd%2Bo3ot5%2BqzTnEpABuhawmHmR82Qdr%2FwYLp&X-Amz-Signature=e8b1e4ecab95d82a7f584d0740f01cbad368b053f9c1cb9e554f6a811cd38fc8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U2LNJLRV%2F20260830%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260830T201526Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCdCviAOmqiV9xONOqZobkQHo2AuPLtzVhc9LhbeBwHLwIgY%2BcHbtPreZ5rI0sLWoAJIv5k%2BUTp8JY0RFxzyMkzx0YqiAQIhf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDEIj1z%2B8veN0OkYMFCrcA84q9DV1HPNaMthIeu5Di%2BfPEu%2FAm0CPOKgIFOtYbjt%2FeZxlJfNBa8Ms%2FO7xmXg%2BuVyOR%2FnwqYvV7BmQyFpLsgUy6vz48rV3noy%2BkBwP1mAuSGrI2wXogOYQDKBD04bJGcZPzTLmB4KWs0HPyvz%2FZtRL4Ehr3GcB5Ja5%2BmwQ8yGRgABPDNex4ervmXKDQsr2onO1x5QMNyvkqt3sxA%2BIHFL6cuAFs6RDFHIG0AsvuOCRQ6igSL3LbwnHQ7zM10CFvzyr856Sp%2B24CnsQlpfCddF1zL%2B7Sv57yTf1Stq5B%2F5mR9axW5mgImqcUfITp5K2YPmK1e9iI%2BH4vE2c3C4eiT5vptEYpxrHkSmfd5V7eWIQJbGTtcn%2BMHKh85HuV8HsKUq5LOuGXnxk2GIOPLp8kdiEaJ%2BhVQs%2FHZaStLoAjF1%2BHfORtav%2FV1F1SImT91nNuSohqI4TDnzHS7%2FBXHylfbNA7AhWvq6FCkjFIjPQ97qxa57GPNMZVX%2B3CEd%2F%2FIHe6GupgiB9K2oBAmdPSagMzRdizg3b3SGdiVl4Sbapro4%2BfQ%2B1ZokVuHf6WQNWPwZyQ5%2BHoxmsiRu2o2rCENnWknf678AaQcVQ%2FaaQm2VgpO%2F8eafVfMRFGnAfKpMdMN2Q0tQGOqUBnBSN4CMPv4eeoAv4tLcUSPjKSLqJ7vr%2FcyqJUcMrv0pVn1dZwta9kS0F%2Fg%2BeLXwGnfIxWRJPt5FN55qhvq4b1uXqwy0otPQSoPzC6g163z3cp2srwqUyO9gfP2xgJun0rTNvQrP7FjWN0dOVCWWqJirbc1iyerYxcFvlSmmSauWajMACbQ4zvn1uNYd%2Bo3ot5%2BqzTnEpABuhawmHmR82Qdr%2FwYLp&X-Amz-Signature=4389b0ddf446ab96a88c52d5684c014d6ea057863169aa69e38bdc214a9c0cc3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
