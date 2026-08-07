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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663FBTRKPS%2F20260807%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260807T183812Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIDXU9U57RMuGw0E%2BP8XmAoVBIzv%2FJnk0T18Gutsx%2BYAqAiEAr9i1pbCCvQfbuV9cww8IaJbRweN9G1brtj%2F2pY3Dfp0q%2FwMIWhAAGgw2Mzc0MjMxODM4MDUiDB3rU%2B8GewakBFoXvircA0ppFKQNj0zSuRCGbQfGiLiSKyt25%2FUaI3T583qKgct3%2F5FiaoU0Pv8FYJDrIpHp%2Bx77faV6bk1kCLxv4OmQGAh13qTdSzkTAbabI%2Fjo4BNJ11dMmopyLCXLm4qtvoaw4OCCXu8y%2F44imU7eHbzDvOKwxYPsBo124E52gE5EBzHyzytgor%2FiPHBYtfYYBCgHFHcaS0F82aZlolc%2BCaBOVhocaw2p6mBhetIJRZuppdFAq2fTuVdR6L2DJEdBPaCw5gTJU3NZvXWhiEszUes%2BPK3bMKCfLJPh9zCgLp1qqyUfNb06%2BXp405CCknR61RvbC4yJT%2B518fNISsZThOwkghC03O7DA4K0o%2BgsPFH3Bp1w5TH0KNoYBCfPAcdXvmt5M99HIedIG7LmqtDJG8d1GHQo2PW0pJlWJgVcgEH%2B%2FvZqMAHOAjilaniHnYrqkhkJyqcWnKjgkqhSyMdBFh8S%2F%2Bct6X45QkBIMyhv3KJeVXvLJyr1P%2BRSce9HHtjqHePOHZwPOfOm95ez6Hf2CHeWl7SBlXYmLZwOvVMjvyF2%2Bg65sA81N1u1taTYBN0QXw8drSfN9AUJEuNDwlT%2FOrbqGw9LPCGMu1c2bisTrfUrsxH0V4vlTmPrsqlvQDe1MOqZ2NMGOqUBHZaX%2BldKEi%2FUqaHkLmARnvlCGBY8VWCsnLU0pRGdYiwk0S5L%2F1GHi7rRlrEXoxjwjFFFdO2rbK84Fhq6hDHlBykoN%2ByuMVzKr3xFCrKpl4VHxtCQHtJdtlRh08504aZnDf8rBMC5Fx%2BJVexV3Q1KRnGjxXbwU4ichHMiDZGEV%2FIRUG8bRUsokTzCgoWm40VWoXHWjQuPG4bIL0OWxDIMstOFmRkg&X-Amz-Signature=05eb47104ec0198831b5f78473eeffb57bfb897dcc562daeb6348fb2bd90afa5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663FBTRKPS%2F20260807%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260807T183812Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIDXU9U57RMuGw0E%2BP8XmAoVBIzv%2FJnk0T18Gutsx%2BYAqAiEAr9i1pbCCvQfbuV9cww8IaJbRweN9G1brtj%2F2pY3Dfp0q%2FwMIWhAAGgw2Mzc0MjMxODM4MDUiDB3rU%2B8GewakBFoXvircA0ppFKQNj0zSuRCGbQfGiLiSKyt25%2FUaI3T583qKgct3%2F5FiaoU0Pv8FYJDrIpHp%2Bx77faV6bk1kCLxv4OmQGAh13qTdSzkTAbabI%2Fjo4BNJ11dMmopyLCXLm4qtvoaw4OCCXu8y%2F44imU7eHbzDvOKwxYPsBo124E52gE5EBzHyzytgor%2FiPHBYtfYYBCgHFHcaS0F82aZlolc%2BCaBOVhocaw2p6mBhetIJRZuppdFAq2fTuVdR6L2DJEdBPaCw5gTJU3NZvXWhiEszUes%2BPK3bMKCfLJPh9zCgLp1qqyUfNb06%2BXp405CCknR61RvbC4yJT%2B518fNISsZThOwkghC03O7DA4K0o%2BgsPFH3Bp1w5TH0KNoYBCfPAcdXvmt5M99HIedIG7LmqtDJG8d1GHQo2PW0pJlWJgVcgEH%2B%2FvZqMAHOAjilaniHnYrqkhkJyqcWnKjgkqhSyMdBFh8S%2F%2Bct6X45QkBIMyhv3KJeVXvLJyr1P%2BRSce9HHtjqHePOHZwPOfOm95ez6Hf2CHeWl7SBlXYmLZwOvVMjvyF2%2Bg65sA81N1u1taTYBN0QXw8drSfN9AUJEuNDwlT%2FOrbqGw9LPCGMu1c2bisTrfUrsxH0V4vlTmPrsqlvQDe1MOqZ2NMGOqUBHZaX%2BldKEi%2FUqaHkLmARnvlCGBY8VWCsnLU0pRGdYiwk0S5L%2F1GHi7rRlrEXoxjwjFFFdO2rbK84Fhq6hDHlBykoN%2ByuMVzKr3xFCrKpl4VHxtCQHtJdtlRh08504aZnDf8rBMC5Fx%2BJVexV3Q1KRnGjxXbwU4ichHMiDZGEV%2FIRUG8bRUsokTzCgoWm40VWoXHWjQuPG4bIL0OWxDIMstOFmRkg&X-Amz-Signature=e2817bce0fdfa8daabce60bbf8f8b27945fa835aaa234dd8e73a5ef226f6bde0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663FBTRKPS%2F20260807%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260807T183812Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIDXU9U57RMuGw0E%2BP8XmAoVBIzv%2FJnk0T18Gutsx%2BYAqAiEAr9i1pbCCvQfbuV9cww8IaJbRweN9G1brtj%2F2pY3Dfp0q%2FwMIWhAAGgw2Mzc0MjMxODM4MDUiDB3rU%2B8GewakBFoXvircA0ppFKQNj0zSuRCGbQfGiLiSKyt25%2FUaI3T583qKgct3%2F5FiaoU0Pv8FYJDrIpHp%2Bx77faV6bk1kCLxv4OmQGAh13qTdSzkTAbabI%2Fjo4BNJ11dMmopyLCXLm4qtvoaw4OCCXu8y%2F44imU7eHbzDvOKwxYPsBo124E52gE5EBzHyzytgor%2FiPHBYtfYYBCgHFHcaS0F82aZlolc%2BCaBOVhocaw2p6mBhetIJRZuppdFAq2fTuVdR6L2DJEdBPaCw5gTJU3NZvXWhiEszUes%2BPK3bMKCfLJPh9zCgLp1qqyUfNb06%2BXp405CCknR61RvbC4yJT%2B518fNISsZThOwkghC03O7DA4K0o%2BgsPFH3Bp1w5TH0KNoYBCfPAcdXvmt5M99HIedIG7LmqtDJG8d1GHQo2PW0pJlWJgVcgEH%2B%2FvZqMAHOAjilaniHnYrqkhkJyqcWnKjgkqhSyMdBFh8S%2F%2Bct6X45QkBIMyhv3KJeVXvLJyr1P%2BRSce9HHtjqHePOHZwPOfOm95ez6Hf2CHeWl7SBlXYmLZwOvVMjvyF2%2Bg65sA81N1u1taTYBN0QXw8drSfN9AUJEuNDwlT%2FOrbqGw9LPCGMu1c2bisTrfUrsxH0V4vlTmPrsqlvQDe1MOqZ2NMGOqUBHZaX%2BldKEi%2FUqaHkLmARnvlCGBY8VWCsnLU0pRGdYiwk0S5L%2F1GHi7rRlrEXoxjwjFFFdO2rbK84Fhq6hDHlBykoN%2ByuMVzKr3xFCrKpl4VHxtCQHtJdtlRh08504aZnDf8rBMC5Fx%2BJVexV3Q1KRnGjxXbwU4ichHMiDZGEV%2FIRUG8bRUsokTzCgoWm40VWoXHWjQuPG4bIL0OWxDIMstOFmRkg&X-Amz-Signature=617790825b5b995c97c644c07c86a90a16c3f1b68fc83be26bf0004784c83f45&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663FBTRKPS%2F20260807%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260807T183812Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIDXU9U57RMuGw0E%2BP8XmAoVBIzv%2FJnk0T18Gutsx%2BYAqAiEAr9i1pbCCvQfbuV9cww8IaJbRweN9G1brtj%2F2pY3Dfp0q%2FwMIWhAAGgw2Mzc0MjMxODM4MDUiDB3rU%2B8GewakBFoXvircA0ppFKQNj0zSuRCGbQfGiLiSKyt25%2FUaI3T583qKgct3%2F5FiaoU0Pv8FYJDrIpHp%2Bx77faV6bk1kCLxv4OmQGAh13qTdSzkTAbabI%2Fjo4BNJ11dMmopyLCXLm4qtvoaw4OCCXu8y%2F44imU7eHbzDvOKwxYPsBo124E52gE5EBzHyzytgor%2FiPHBYtfYYBCgHFHcaS0F82aZlolc%2BCaBOVhocaw2p6mBhetIJRZuppdFAq2fTuVdR6L2DJEdBPaCw5gTJU3NZvXWhiEszUes%2BPK3bMKCfLJPh9zCgLp1qqyUfNb06%2BXp405CCknR61RvbC4yJT%2B518fNISsZThOwkghC03O7DA4K0o%2BgsPFH3Bp1w5TH0KNoYBCfPAcdXvmt5M99HIedIG7LmqtDJG8d1GHQo2PW0pJlWJgVcgEH%2B%2FvZqMAHOAjilaniHnYrqkhkJyqcWnKjgkqhSyMdBFh8S%2F%2Bct6X45QkBIMyhv3KJeVXvLJyr1P%2BRSce9HHtjqHePOHZwPOfOm95ez6Hf2CHeWl7SBlXYmLZwOvVMjvyF2%2Bg65sA81N1u1taTYBN0QXw8drSfN9AUJEuNDwlT%2FOrbqGw9LPCGMu1c2bisTrfUrsxH0V4vlTmPrsqlvQDe1MOqZ2NMGOqUBHZaX%2BldKEi%2FUqaHkLmARnvlCGBY8VWCsnLU0pRGdYiwk0S5L%2F1GHi7rRlrEXoxjwjFFFdO2rbK84Fhq6hDHlBykoN%2ByuMVzKr3xFCrKpl4VHxtCQHtJdtlRh08504aZnDf8rBMC5Fx%2BJVexV3Q1KRnGjxXbwU4ichHMiDZGEV%2FIRUG8bRUsokTzCgoWm40VWoXHWjQuPG4bIL0OWxDIMstOFmRkg&X-Amz-Signature=df21b68453e14d3bf7ee2ebb0c13509bd0cac3d225bab9e6e212e8ec0589ea1b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
