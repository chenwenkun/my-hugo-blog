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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667I2ED42K%2F20260921%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260921T172232Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDVqtyL9GzmKVMj%2FA7l531ANsFlBN4ExhXMYlYp1bIHHgIgTdRWCSTrG7HI3n7eet7oCLuwBwTDTT8fmz9IPFV6ZEMqiAQIkP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDGMEJqAKRs4NEzBpKyrcAz7ZgH%2FlmdIPtuY5P9Jd8PcCsyux4feqdeA17FgCtjDx%2BwNarMi86NPSkkJUksEkqYsVS7pPIzI2KVyWdxSswhViZg4aTJkgdCT%2FXSzVFyy1orIF67sY%2F7tGwQ2TfJnRU6tiWrEO4ooSbgn4rpbik36d%2BCRg%2F%2FPMtYsWZ58UHUt9bS3vUsZBy2aF2jeHq9KwN1CdRkzAhwswi1TzCadllmaglp277ULa3ozLhNZ5%2FfykUjJpBkXob%2FbCQbboXGsL1xzBICotW15XEhCALyXSeKtgLSxyfesGX6sTEl3otxjB5gwb8DkWiE%2BwkVJSDpEx0sAWuk9kYIHjd9pgcrinyZ%2FEHTerS0YGc2CaxviqzOAkYJwuJ6x4tx0BilyG06JX9TQOdeS0vi7wGCso6m1ZEjhS6emWdVTI7LNZEqPNN9sakjasxO7vahGCwQZlXQvkfZuCySi5D%2FmyY9s2MeLgh7zkyyuk6qq5lERUoEyAHFt7lOBIFid05p3Y5qAXZyy%2BI7%2BUnIzBCDa5VXIwdZIDlhDqKq4oPaxG03509fyo6o4FKlI9xaZxc0hB2LwbY2TMs6DfvrUkJsZWk%2BOPD9JwbI7lsYuVXEZoWuu7wWUGm0qVOhZVKbNOSk1X%2BWuSMNyXxdUGOqUB5VFDAPhnqojQTvfCr1%2BTb5QQOe6As3ttuAS9bwKSGc9NS6JTvKM4nIW3hAi2dmWJB1K3jsOFudtC9zmnFGotswBQSgNomrzOMbMUTgEhRFEh456o2NQp6hayPeCrEsvQ7cLn9VnMhAHuBSTN5MR1eRPIBBXFT9okkK%2BsuG%2F4y4OrS7tWpvTynixqpfmFBUsUyYuCbYiPF%2BRnts5vH99Edx2e%2F2If&X-Amz-Signature=e1cc9b29c72127046b7909d0633350c9e996cc950a937bdb6070a8ee7201dff1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667I2ED42K%2F20260921%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260921T172232Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDVqtyL9GzmKVMj%2FA7l531ANsFlBN4ExhXMYlYp1bIHHgIgTdRWCSTrG7HI3n7eet7oCLuwBwTDTT8fmz9IPFV6ZEMqiAQIkP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDGMEJqAKRs4NEzBpKyrcAz7ZgH%2FlmdIPtuY5P9Jd8PcCsyux4feqdeA17FgCtjDx%2BwNarMi86NPSkkJUksEkqYsVS7pPIzI2KVyWdxSswhViZg4aTJkgdCT%2FXSzVFyy1orIF67sY%2F7tGwQ2TfJnRU6tiWrEO4ooSbgn4rpbik36d%2BCRg%2F%2FPMtYsWZ58UHUt9bS3vUsZBy2aF2jeHq9KwN1CdRkzAhwswi1TzCadllmaglp277ULa3ozLhNZ5%2FfykUjJpBkXob%2FbCQbboXGsL1xzBICotW15XEhCALyXSeKtgLSxyfesGX6sTEl3otxjB5gwb8DkWiE%2BwkVJSDpEx0sAWuk9kYIHjd9pgcrinyZ%2FEHTerS0YGc2CaxviqzOAkYJwuJ6x4tx0BilyG06JX9TQOdeS0vi7wGCso6m1ZEjhS6emWdVTI7LNZEqPNN9sakjasxO7vahGCwQZlXQvkfZuCySi5D%2FmyY9s2MeLgh7zkyyuk6qq5lERUoEyAHFt7lOBIFid05p3Y5qAXZyy%2BI7%2BUnIzBCDa5VXIwdZIDlhDqKq4oPaxG03509fyo6o4FKlI9xaZxc0hB2LwbY2TMs6DfvrUkJsZWk%2BOPD9JwbI7lsYuVXEZoWuu7wWUGm0qVOhZVKbNOSk1X%2BWuSMNyXxdUGOqUB5VFDAPhnqojQTvfCr1%2BTb5QQOe6As3ttuAS9bwKSGc9NS6JTvKM4nIW3hAi2dmWJB1K3jsOFudtC9zmnFGotswBQSgNomrzOMbMUTgEhRFEh456o2NQp6hayPeCrEsvQ7cLn9VnMhAHuBSTN5MR1eRPIBBXFT9okkK%2BsuG%2F4y4OrS7tWpvTynixqpfmFBUsUyYuCbYiPF%2BRnts5vH99Edx2e%2F2If&X-Amz-Signature=7b9a1e846e0f4cedf9bfc80b5dacda6e80dd70c9555a21b4061225c3cd2f32ec&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667I2ED42K%2F20260921%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260921T172232Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDVqtyL9GzmKVMj%2FA7l531ANsFlBN4ExhXMYlYp1bIHHgIgTdRWCSTrG7HI3n7eet7oCLuwBwTDTT8fmz9IPFV6ZEMqiAQIkP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDGMEJqAKRs4NEzBpKyrcAz7ZgH%2FlmdIPtuY5P9Jd8PcCsyux4feqdeA17FgCtjDx%2BwNarMi86NPSkkJUksEkqYsVS7pPIzI2KVyWdxSswhViZg4aTJkgdCT%2FXSzVFyy1orIF67sY%2F7tGwQ2TfJnRU6tiWrEO4ooSbgn4rpbik36d%2BCRg%2F%2FPMtYsWZ58UHUt9bS3vUsZBy2aF2jeHq9KwN1CdRkzAhwswi1TzCadllmaglp277ULa3ozLhNZ5%2FfykUjJpBkXob%2FbCQbboXGsL1xzBICotW15XEhCALyXSeKtgLSxyfesGX6sTEl3otxjB5gwb8DkWiE%2BwkVJSDpEx0sAWuk9kYIHjd9pgcrinyZ%2FEHTerS0YGc2CaxviqzOAkYJwuJ6x4tx0BilyG06JX9TQOdeS0vi7wGCso6m1ZEjhS6emWdVTI7LNZEqPNN9sakjasxO7vahGCwQZlXQvkfZuCySi5D%2FmyY9s2MeLgh7zkyyuk6qq5lERUoEyAHFt7lOBIFid05p3Y5qAXZyy%2BI7%2BUnIzBCDa5VXIwdZIDlhDqKq4oPaxG03509fyo6o4FKlI9xaZxc0hB2LwbY2TMs6DfvrUkJsZWk%2BOPD9JwbI7lsYuVXEZoWuu7wWUGm0qVOhZVKbNOSk1X%2BWuSMNyXxdUGOqUB5VFDAPhnqojQTvfCr1%2BTb5QQOe6As3ttuAS9bwKSGc9NS6JTvKM4nIW3hAi2dmWJB1K3jsOFudtC9zmnFGotswBQSgNomrzOMbMUTgEhRFEh456o2NQp6hayPeCrEsvQ7cLn9VnMhAHuBSTN5MR1eRPIBBXFT9okkK%2BsuG%2F4y4OrS7tWpvTynixqpfmFBUsUyYuCbYiPF%2BRnts5vH99Edx2e%2F2If&X-Amz-Signature=4a1a40d10b614d0302c6ffebdeb09d375b121a592d33bdb0b1cf79f73b6c13fd&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667I2ED42K%2F20260921%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260921T172232Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDVqtyL9GzmKVMj%2FA7l531ANsFlBN4ExhXMYlYp1bIHHgIgTdRWCSTrG7HI3n7eet7oCLuwBwTDTT8fmz9IPFV6ZEMqiAQIkP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDGMEJqAKRs4NEzBpKyrcAz7ZgH%2FlmdIPtuY5P9Jd8PcCsyux4feqdeA17FgCtjDx%2BwNarMi86NPSkkJUksEkqYsVS7pPIzI2KVyWdxSswhViZg4aTJkgdCT%2FXSzVFyy1orIF67sY%2F7tGwQ2TfJnRU6tiWrEO4ooSbgn4rpbik36d%2BCRg%2F%2FPMtYsWZ58UHUt9bS3vUsZBy2aF2jeHq9KwN1CdRkzAhwswi1TzCadllmaglp277ULa3ozLhNZ5%2FfykUjJpBkXob%2FbCQbboXGsL1xzBICotW15XEhCALyXSeKtgLSxyfesGX6sTEl3otxjB5gwb8DkWiE%2BwkVJSDpEx0sAWuk9kYIHjd9pgcrinyZ%2FEHTerS0YGc2CaxviqzOAkYJwuJ6x4tx0BilyG06JX9TQOdeS0vi7wGCso6m1ZEjhS6emWdVTI7LNZEqPNN9sakjasxO7vahGCwQZlXQvkfZuCySi5D%2FmyY9s2MeLgh7zkyyuk6qq5lERUoEyAHFt7lOBIFid05p3Y5qAXZyy%2BI7%2BUnIzBCDa5VXIwdZIDlhDqKq4oPaxG03509fyo6o4FKlI9xaZxc0hB2LwbY2TMs6DfvrUkJsZWk%2BOPD9JwbI7lsYuVXEZoWuu7wWUGm0qVOhZVKbNOSk1X%2BWuSMNyXxdUGOqUB5VFDAPhnqojQTvfCr1%2BTb5QQOe6As3ttuAS9bwKSGc9NS6JTvKM4nIW3hAi2dmWJB1K3jsOFudtC9zmnFGotswBQSgNomrzOMbMUTgEhRFEh456o2NQp6hayPeCrEsvQ7cLn9VnMhAHuBSTN5MR1eRPIBBXFT9okkK%2BsuG%2F4y4OrS7tWpvTynixqpfmFBUsUyYuCbYiPF%2BRnts5vH99Edx2e%2F2If&X-Amz-Signature=1261e7e3e6acd9509d263d4836e27f534101a3da90b21f9f21aeba32ca32c372&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
