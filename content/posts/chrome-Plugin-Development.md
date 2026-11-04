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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Z7G5NJOX%2F20261104%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261104T035017Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIHJooHpzMOMrdPNYe68meIBrMtJRGryT8qbCF7gsZHSzAiEAgJ2Mf78Yi8Q1Bvj0pQIPZmftDJyFhjBKyNu10AIKG5IqiAQIpP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDGyg7qheNNdVbNKOGCrcAwfVedOmY%2FPK9%2FcTDhthEQTFF3GNwG60KDVecU09KO3SXxOPFDCRjwoJm4ZcPQZhbFMemcTX13oGXfJjvBE8lnAYIdH9rB1xlRpN6fJaPfkGtsA0%2FnZQREJ0DDCRSBMK9TVbS33G8LlMvkJglyF8Qze4oze3GPNwlfoLXPd4zR5vFOwpmiryHL87fgE9p366104TxYHchknEKT68ZCI9%2FKxqXxiYh4dk3Ce03aXPdd3LraTVmLzgkdyrYuNp1E9t%2FasPZoZqAOpjUGq1IcVTENUtbFV1EQW%2Fu836%2BiyaQaUbosDiGnPfayDTYK7o3yNWMqAjgfV%2BYYYovJ4EX01qbS6RIb1yLw0%2BoyDK7How9CtaUJ4o8xX9mF%2B%2B%2BlzHLLPPYQIGkyT5NKnpWn6cz59DO2%2Bz1uL0jn7EECbspfwPAYorK7bNl8pE7%2FaZnqRD0L89qx%2BH7hIMtQw2C8rOtOHf7ZzWjB5XDrz5pVGNdLXj4mi4PtcJQac23LpV1vFh9Krh1FvV553p9ogkxQkE%2FNjZHkda6gQ%2Fggcgy9sEi5Yd2Aq2Wqzl9k%2FwXrAr247Gn9P5xFv1pjisYr2Uxgb9bHFShv8ag8ANwiIgl0Uehx9ACrpQnCR7xWYqif0gkh6UMNPNqtcGOqUBAP0w556x5kGpM%2BB2glN7KLeQgA%2BgfL7RNklxCWEMAWveRG%2BowSMxR%2BmumjV8H%2Fkiw3d%2B%2FkUV%2FUAjqgpGEsccU4yebRXe%2FAiWxPdZZBAidCpVzdA104A2GXBrjJKJoAnST5Im7dMEGf4ORNCeig4zT7KFQFPS5fn6MRib3v76m4d2KtJMwGwz0wagxscC9x8OEPJZDNLBCX4bXsLotOtDDeXviJIx&X-Amz-Signature=0587c3ff1395d1a29c791bec2bb855bdad99b137b3f7c185c1f90ea2312554ab&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Z7G5NJOX%2F20261104%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261104T035017Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIHJooHpzMOMrdPNYe68meIBrMtJRGryT8qbCF7gsZHSzAiEAgJ2Mf78Yi8Q1Bvj0pQIPZmftDJyFhjBKyNu10AIKG5IqiAQIpP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDGyg7qheNNdVbNKOGCrcAwfVedOmY%2FPK9%2FcTDhthEQTFF3GNwG60KDVecU09KO3SXxOPFDCRjwoJm4ZcPQZhbFMemcTX13oGXfJjvBE8lnAYIdH9rB1xlRpN6fJaPfkGtsA0%2FnZQREJ0DDCRSBMK9TVbS33G8LlMvkJglyF8Qze4oze3GPNwlfoLXPd4zR5vFOwpmiryHL87fgE9p366104TxYHchknEKT68ZCI9%2FKxqXxiYh4dk3Ce03aXPdd3LraTVmLzgkdyrYuNp1E9t%2FasPZoZqAOpjUGq1IcVTENUtbFV1EQW%2Fu836%2BiyaQaUbosDiGnPfayDTYK7o3yNWMqAjgfV%2BYYYovJ4EX01qbS6RIb1yLw0%2BoyDK7How9CtaUJ4o8xX9mF%2B%2B%2BlzHLLPPYQIGkyT5NKnpWn6cz59DO2%2Bz1uL0jn7EECbspfwPAYorK7bNl8pE7%2FaZnqRD0L89qx%2BH7hIMtQw2C8rOtOHf7ZzWjB5XDrz5pVGNdLXj4mi4PtcJQac23LpV1vFh9Krh1FvV553p9ogkxQkE%2FNjZHkda6gQ%2Fggcgy9sEi5Yd2Aq2Wqzl9k%2FwXrAr247Gn9P5xFv1pjisYr2Uxgb9bHFShv8ag8ANwiIgl0Uehx9ACrpQnCR7xWYqif0gkh6UMNPNqtcGOqUBAP0w556x5kGpM%2BB2glN7KLeQgA%2BgfL7RNklxCWEMAWveRG%2BowSMxR%2BmumjV8H%2Fkiw3d%2B%2FkUV%2FUAjqgpGEsccU4yebRXe%2FAiWxPdZZBAidCpVzdA104A2GXBrjJKJoAnST5Im7dMEGf4ORNCeig4zT7KFQFPS5fn6MRib3v76m4d2KtJMwGwz0wagxscC9x8OEPJZDNLBCX4bXsLotOtDDeXviJIx&X-Amz-Signature=a0cb7d6515f4aa53ea9ab93bec0362a3253527b97027a7f4a94ad7b583dc90fe&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Z7G5NJOX%2F20261104%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261104T035017Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIHJooHpzMOMrdPNYe68meIBrMtJRGryT8qbCF7gsZHSzAiEAgJ2Mf78Yi8Q1Bvj0pQIPZmftDJyFhjBKyNu10AIKG5IqiAQIpP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDGyg7qheNNdVbNKOGCrcAwfVedOmY%2FPK9%2FcTDhthEQTFF3GNwG60KDVecU09KO3SXxOPFDCRjwoJm4ZcPQZhbFMemcTX13oGXfJjvBE8lnAYIdH9rB1xlRpN6fJaPfkGtsA0%2FnZQREJ0DDCRSBMK9TVbS33G8LlMvkJglyF8Qze4oze3GPNwlfoLXPd4zR5vFOwpmiryHL87fgE9p366104TxYHchknEKT68ZCI9%2FKxqXxiYh4dk3Ce03aXPdd3LraTVmLzgkdyrYuNp1E9t%2FasPZoZqAOpjUGq1IcVTENUtbFV1EQW%2Fu836%2BiyaQaUbosDiGnPfayDTYK7o3yNWMqAjgfV%2BYYYovJ4EX01qbS6RIb1yLw0%2BoyDK7How9CtaUJ4o8xX9mF%2B%2B%2BlzHLLPPYQIGkyT5NKnpWn6cz59DO2%2Bz1uL0jn7EECbspfwPAYorK7bNl8pE7%2FaZnqRD0L89qx%2BH7hIMtQw2C8rOtOHf7ZzWjB5XDrz5pVGNdLXj4mi4PtcJQac23LpV1vFh9Krh1FvV553p9ogkxQkE%2FNjZHkda6gQ%2Fggcgy9sEi5Yd2Aq2Wqzl9k%2FwXrAr247Gn9P5xFv1pjisYr2Uxgb9bHFShv8ag8ANwiIgl0Uehx9ACrpQnCR7xWYqif0gkh6UMNPNqtcGOqUBAP0w556x5kGpM%2BB2glN7KLeQgA%2BgfL7RNklxCWEMAWveRG%2BowSMxR%2BmumjV8H%2Fkiw3d%2B%2FkUV%2FUAjqgpGEsccU4yebRXe%2FAiWxPdZZBAidCpVzdA104A2GXBrjJKJoAnST5Im7dMEGf4ORNCeig4zT7KFQFPS5fn6MRib3v76m4d2KtJMwGwz0wagxscC9x8OEPJZDNLBCX4bXsLotOtDDeXviJIx&X-Amz-Signature=3b0ecd52de692886d3de65ddcb65d67efd2efd533dfd68702dc5fbc0b4108acd&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Z7G5NJOX%2F20261104%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261104T035017Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIHJooHpzMOMrdPNYe68meIBrMtJRGryT8qbCF7gsZHSzAiEAgJ2Mf78Yi8Q1Bvj0pQIPZmftDJyFhjBKyNu10AIKG5IqiAQIpP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDGyg7qheNNdVbNKOGCrcAwfVedOmY%2FPK9%2FcTDhthEQTFF3GNwG60KDVecU09KO3SXxOPFDCRjwoJm4ZcPQZhbFMemcTX13oGXfJjvBE8lnAYIdH9rB1xlRpN6fJaPfkGtsA0%2FnZQREJ0DDCRSBMK9TVbS33G8LlMvkJglyF8Qze4oze3GPNwlfoLXPd4zR5vFOwpmiryHL87fgE9p366104TxYHchknEKT68ZCI9%2FKxqXxiYh4dk3Ce03aXPdd3LraTVmLzgkdyrYuNp1E9t%2FasPZoZqAOpjUGq1IcVTENUtbFV1EQW%2Fu836%2BiyaQaUbosDiGnPfayDTYK7o3yNWMqAjgfV%2BYYYovJ4EX01qbS6RIb1yLw0%2BoyDK7How9CtaUJ4o8xX9mF%2B%2B%2BlzHLLPPYQIGkyT5NKnpWn6cz59DO2%2Bz1uL0jn7EECbspfwPAYorK7bNl8pE7%2FaZnqRD0L89qx%2BH7hIMtQw2C8rOtOHf7ZzWjB5XDrz5pVGNdLXj4mi4PtcJQac23LpV1vFh9Krh1FvV553p9ogkxQkE%2FNjZHkda6gQ%2Fggcgy9sEi5Yd2Aq2Wqzl9k%2FwXrAr247Gn9P5xFv1pjisYr2Uxgb9bHFShv8ag8ANwiIgl0Uehx9ACrpQnCR7xWYqif0gkh6UMNPNqtcGOqUBAP0w556x5kGpM%2BB2glN7KLeQgA%2BgfL7RNklxCWEMAWveRG%2BowSMxR%2BmumjV8H%2Fkiw3d%2B%2FkUV%2FUAjqgpGEsccU4yebRXe%2FAiWxPdZZBAidCpVzdA104A2GXBrjJKJoAnST5Im7dMEGf4ORNCeig4zT7KFQFPS5fn6MRib3v76m4d2KtJMwGwz0wagxscC9x8OEPJZDNLBCX4bXsLotOtDDeXviJIx&X-Amz-Signature=a556686a6d855c4a064a149d1b6f9fc10b9434513a29c49c9465e11a3623df52&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
