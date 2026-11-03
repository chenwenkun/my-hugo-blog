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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664O424DHK%2F20261103%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261103T000946Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCAWS1jhKnefzcduIYUIDS1uFoCNeKrT5ClXc1%2Fr0%2BmYQIhALnH7XtWEjMg%2B8dUTm42AU3w7eSoHx%2BxGbbiIQSbOd%2FuKogECIn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwuIFfmUHw7PqaQY3sq3APg%2ByehQFZDSUQhiS1oV3Z5GMOHv%2BTXfEE6Bva%2FLIzucQ1VPWyXnYISmCpdSERKmtSQOFncBnETcSsONRX06oYcjnSeMEQXFlZQasLEfvkCCRlLqrhVj3Q9vbce6I9k5AZzSnnawumXL4PEiHiCSq2nynuhj5kbdjQrR8gCO%2FRrq80jZZIBi4Mh9Vu1%2B9HtAITZzGPXavYTxdi5cbeaVJ1UWp%2Fb0%2BJIehAGqKi0f5x7AiZ8hVSfZ22hmCty5DjLb%2F8mk8fCYR2HQwtIyyLDCyyMiVaBS9oWu1UxoB875n0%2B9zakzSMzGBidXLuH7cQ1wswhBW1PGgHz%2Bgd%2BfRIAtHgPG7sy91a3cYrO02kKEFRJCMWYf7gZQs%2BdKnXRGdsFp%2FjMXZ38eEXKShnxs3KC%2FI3zP4FO8TozdsDQZqsUTE6E4NAmtvHzUZsfZ54F0Ou3A3TlwbGFv7WMQM4emGtAaYlUHRVj%2Fww1CGhICShY4dWODOqMAJRtPAmZRv2kEkv0mLAvze8NvLqyt5%2BWFpEQbzQkEePiMpDXi6kz7USaUsZxLvu33qx6WXQ%2FxPr4SnIBipTY0qtVPuS1Uf%2BWxCWVDQZdFYlQiCH83ZUqYYl7U4irVq3mFOHOTrwuJfnu7TCCxqTXBjqkAS3T73e5rcc9YPqV4Lj3PmEjh8QcW1qnWBGlGjf44IsiaetNK0ZnStyigAjK1u%2Fl4gDJsit%2FRO028eLAtnlbZYexdfjXTU6gKq6O3Z%2FuB1guIMtmDGxsCdzPw7E15kF9Hho%2BwyUYC2KdFBY67abAbEezq7jiyH1%2BuL89brCLj6AlfYu%2F6piUdCHAfhCnz2Bbx%2BzJEvLbBhBbBSkwfqUV%2BYm%2BNbm8&X-Amz-Signature=c4d06d3b993ba936f2109f3a7671eaa476e884235d07a84dbab0a171cf3f439b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664O424DHK%2F20261103%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261103T000946Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCAWS1jhKnefzcduIYUIDS1uFoCNeKrT5ClXc1%2Fr0%2BmYQIhALnH7XtWEjMg%2B8dUTm42AU3w7eSoHx%2BxGbbiIQSbOd%2FuKogECIn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwuIFfmUHw7PqaQY3sq3APg%2ByehQFZDSUQhiS1oV3Z5GMOHv%2BTXfEE6Bva%2FLIzucQ1VPWyXnYISmCpdSERKmtSQOFncBnETcSsONRX06oYcjnSeMEQXFlZQasLEfvkCCRlLqrhVj3Q9vbce6I9k5AZzSnnawumXL4PEiHiCSq2nynuhj5kbdjQrR8gCO%2FRrq80jZZIBi4Mh9Vu1%2B9HtAITZzGPXavYTxdi5cbeaVJ1UWp%2Fb0%2BJIehAGqKi0f5x7AiZ8hVSfZ22hmCty5DjLb%2F8mk8fCYR2HQwtIyyLDCyyMiVaBS9oWu1UxoB875n0%2B9zakzSMzGBidXLuH7cQ1wswhBW1PGgHz%2Bgd%2BfRIAtHgPG7sy91a3cYrO02kKEFRJCMWYf7gZQs%2BdKnXRGdsFp%2FjMXZ38eEXKShnxs3KC%2FI3zP4FO8TozdsDQZqsUTE6E4NAmtvHzUZsfZ54F0Ou3A3TlwbGFv7WMQM4emGtAaYlUHRVj%2Fww1CGhICShY4dWODOqMAJRtPAmZRv2kEkv0mLAvze8NvLqyt5%2BWFpEQbzQkEePiMpDXi6kz7USaUsZxLvu33qx6WXQ%2FxPr4SnIBipTY0qtVPuS1Uf%2BWxCWVDQZdFYlQiCH83ZUqYYl7U4irVq3mFOHOTrwuJfnu7TCCxqTXBjqkAS3T73e5rcc9YPqV4Lj3PmEjh8QcW1qnWBGlGjf44IsiaetNK0ZnStyigAjK1u%2Fl4gDJsit%2FRO028eLAtnlbZYexdfjXTU6gKq6O3Z%2FuB1guIMtmDGxsCdzPw7E15kF9Hho%2BwyUYC2KdFBY67abAbEezq7jiyH1%2BuL89brCLj6AlfYu%2F6piUdCHAfhCnz2Bbx%2BzJEvLbBhBbBSkwfqUV%2BYm%2BNbm8&X-Amz-Signature=95806e7dc3512eb126c8815ee8922e870da8a3cd7a27f19ae38e0980f2c35745&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664O424DHK%2F20261103%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261103T000946Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCAWS1jhKnefzcduIYUIDS1uFoCNeKrT5ClXc1%2Fr0%2BmYQIhALnH7XtWEjMg%2B8dUTm42AU3w7eSoHx%2BxGbbiIQSbOd%2FuKogECIn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwuIFfmUHw7PqaQY3sq3APg%2ByehQFZDSUQhiS1oV3Z5GMOHv%2BTXfEE6Bva%2FLIzucQ1VPWyXnYISmCpdSERKmtSQOFncBnETcSsONRX06oYcjnSeMEQXFlZQasLEfvkCCRlLqrhVj3Q9vbce6I9k5AZzSnnawumXL4PEiHiCSq2nynuhj5kbdjQrR8gCO%2FRrq80jZZIBi4Mh9Vu1%2B9HtAITZzGPXavYTxdi5cbeaVJ1UWp%2Fb0%2BJIehAGqKi0f5x7AiZ8hVSfZ22hmCty5DjLb%2F8mk8fCYR2HQwtIyyLDCyyMiVaBS9oWu1UxoB875n0%2B9zakzSMzGBidXLuH7cQ1wswhBW1PGgHz%2Bgd%2BfRIAtHgPG7sy91a3cYrO02kKEFRJCMWYf7gZQs%2BdKnXRGdsFp%2FjMXZ38eEXKShnxs3KC%2FI3zP4FO8TozdsDQZqsUTE6E4NAmtvHzUZsfZ54F0Ou3A3TlwbGFv7WMQM4emGtAaYlUHRVj%2Fww1CGhICShY4dWODOqMAJRtPAmZRv2kEkv0mLAvze8NvLqyt5%2BWFpEQbzQkEePiMpDXi6kz7USaUsZxLvu33qx6WXQ%2FxPr4SnIBipTY0qtVPuS1Uf%2BWxCWVDQZdFYlQiCH83ZUqYYl7U4irVq3mFOHOTrwuJfnu7TCCxqTXBjqkAS3T73e5rcc9YPqV4Lj3PmEjh8QcW1qnWBGlGjf44IsiaetNK0ZnStyigAjK1u%2Fl4gDJsit%2FRO028eLAtnlbZYexdfjXTU6gKq6O3Z%2FuB1guIMtmDGxsCdzPw7E15kF9Hho%2BwyUYC2KdFBY67abAbEezq7jiyH1%2BuL89brCLj6AlfYu%2F6piUdCHAfhCnz2Bbx%2BzJEvLbBhBbBSkwfqUV%2BYm%2BNbm8&X-Amz-Signature=f5a3d1515a8d375d7957006d52f0dbdaa68d2059aafcc8b46232a1a1f9d69051&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664O424DHK%2F20261103%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261103T000946Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCAWS1jhKnefzcduIYUIDS1uFoCNeKrT5ClXc1%2Fr0%2BmYQIhALnH7XtWEjMg%2B8dUTm42AU3w7eSoHx%2BxGbbiIQSbOd%2FuKogECIn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwuIFfmUHw7PqaQY3sq3APg%2ByehQFZDSUQhiS1oV3Z5GMOHv%2BTXfEE6Bva%2FLIzucQ1VPWyXnYISmCpdSERKmtSQOFncBnETcSsONRX06oYcjnSeMEQXFlZQasLEfvkCCRlLqrhVj3Q9vbce6I9k5AZzSnnawumXL4PEiHiCSq2nynuhj5kbdjQrR8gCO%2FRrq80jZZIBi4Mh9Vu1%2B9HtAITZzGPXavYTxdi5cbeaVJ1UWp%2Fb0%2BJIehAGqKi0f5x7AiZ8hVSfZ22hmCty5DjLb%2F8mk8fCYR2HQwtIyyLDCyyMiVaBS9oWu1UxoB875n0%2B9zakzSMzGBidXLuH7cQ1wswhBW1PGgHz%2Bgd%2BfRIAtHgPG7sy91a3cYrO02kKEFRJCMWYf7gZQs%2BdKnXRGdsFp%2FjMXZ38eEXKShnxs3KC%2FI3zP4FO8TozdsDQZqsUTE6E4NAmtvHzUZsfZ54F0Ou3A3TlwbGFv7WMQM4emGtAaYlUHRVj%2Fww1CGhICShY4dWODOqMAJRtPAmZRv2kEkv0mLAvze8NvLqyt5%2BWFpEQbzQkEePiMpDXi6kz7USaUsZxLvu33qx6WXQ%2FxPr4SnIBipTY0qtVPuS1Uf%2BWxCWVDQZdFYlQiCH83ZUqYYl7U4irVq3mFOHOTrwuJfnu7TCCxqTXBjqkAS3T73e5rcc9YPqV4Lj3PmEjh8QcW1qnWBGlGjf44IsiaetNK0ZnStyigAjK1u%2Fl4gDJsit%2FRO028eLAtnlbZYexdfjXTU6gKq6O3Z%2FuB1guIMtmDGxsCdzPw7E15kF9Hho%2BwyUYC2KdFBY67abAbEezq7jiyH1%2BuL89brCLj6AlfYu%2F6piUdCHAfhCnz2Bbx%2BzJEvLbBhBbBSkwfqUV%2BYm%2BNbm8&X-Amz-Signature=50418d98316b074530c0d2bbaaf38ed6c878b6e09ddc729d11c57429dae947c6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
