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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SMX4CRVR%2F20260926%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260926T151940Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjED8aCXVzLXdlc3QtMiJIMEYCIQCmqS%2FS5CQDJ%2Bf5Rt%2FIUAIYQD%2Fukdf3cLcboehpngsrXwIhAK%2BgsPwRdeW8VkjOhlyn8VG0SLYlj0fTcyARShC4dR%2BkKv8DCAgQABoMNjM3NDIzMTgzODA1IgxPk8M%2FTCE11dzcMBIq3APXMqaz0gAPSUT6uQo5imdDYngrSoTbJBW7ypwAPQP8HgZnH7SPBu8MrtIuUGhoQPvJ%2FP3%2FM5NFJa%2FnM%2FA5dLyDPB3jwPxQAKV%2BsBYRAe5KU3XJDJEVSx0id3SRpgcEMhrnCKDwC1T2IjHCqAXQwWYWBIPFVJH4rAWrTaFIA92Wk%2FHAiP%2FbOBnsHP3aEMqS9g65OnPEnKorDpHRaAHFWk9dJDxlyHuIuXU8IKoTHMvpRUSfS9vu2Yzl27LEw%2FAkojgMxvr4oEpOarW1%2FvLMBBKfIwMqUJwm8c6MwaQYH107U2Ue8lt7sjU2yevIKYlxFLyx5RimKyVIUr%2Bd5pfJ99eVvvGqxaCIfAUCDIu0SQosPG23H5yPlRvvh4CvfZf%2BI9KbvYoGB1%2FImCiQkTihtH2JXMzM0LQxuavlmTicRpA22GvmCxy%2BPUXkuEJTE%2B%2FWRKHUNyt9CgGLOOJbV5RdzJlRC6PfoGTkua89DyaYnBdM5mqDElZf%2BI82BonPZnDcGbR%2F6iqjAlUK6n7PedGJ7yWW%2FISndiEz43K3Ruw59dPHxGGTZa%2BLT9%2FysicLVU%2FhJ1UunaqWhQrUv6b7MR0sOr4vcfRo5Xtm3BboPXkGMdCna67CFWxsfUZfqAj7VDCXuN%2FVBjqkAQIx5%2FKacX%2B6c6ueVGx4P3xXiQaurY1kcoRSRq9nD4AFxdfOccThJUBQT25ZZO4sJZUlQgnyFE0b0rLuEVvoLxhRhJKmAlH%2F7nClzKh%2BsdaDjf2oPFABhnOnR%2B%2BGutpMqwa438Nw2%2BQv6d5LCH%2B9hf6vHrHodgq4wy5P%2F5LIyBDTAL4gIYoQz5Y%2FePPxb8GWxirkYK9nJg7%2F5Yubd%2FilCslYnHw6&X-Amz-Signature=7a2b068334d6de0574b3814af373a00179126e1c989ef1751702ce7d0afb5ccb&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SMX4CRVR%2F20260926%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260926T151940Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjED8aCXVzLXdlc3QtMiJIMEYCIQCmqS%2FS5CQDJ%2Bf5Rt%2FIUAIYQD%2Fukdf3cLcboehpngsrXwIhAK%2BgsPwRdeW8VkjOhlyn8VG0SLYlj0fTcyARShC4dR%2BkKv8DCAgQABoMNjM3NDIzMTgzODA1IgxPk8M%2FTCE11dzcMBIq3APXMqaz0gAPSUT6uQo5imdDYngrSoTbJBW7ypwAPQP8HgZnH7SPBu8MrtIuUGhoQPvJ%2FP3%2FM5NFJa%2FnM%2FA5dLyDPB3jwPxQAKV%2BsBYRAe5KU3XJDJEVSx0id3SRpgcEMhrnCKDwC1T2IjHCqAXQwWYWBIPFVJH4rAWrTaFIA92Wk%2FHAiP%2FbOBnsHP3aEMqS9g65OnPEnKorDpHRaAHFWk9dJDxlyHuIuXU8IKoTHMvpRUSfS9vu2Yzl27LEw%2FAkojgMxvr4oEpOarW1%2FvLMBBKfIwMqUJwm8c6MwaQYH107U2Ue8lt7sjU2yevIKYlxFLyx5RimKyVIUr%2Bd5pfJ99eVvvGqxaCIfAUCDIu0SQosPG23H5yPlRvvh4CvfZf%2BI9KbvYoGB1%2FImCiQkTihtH2JXMzM0LQxuavlmTicRpA22GvmCxy%2BPUXkuEJTE%2B%2FWRKHUNyt9CgGLOOJbV5RdzJlRC6PfoGTkua89DyaYnBdM5mqDElZf%2BI82BonPZnDcGbR%2F6iqjAlUK6n7PedGJ7yWW%2FISndiEz43K3Ruw59dPHxGGTZa%2BLT9%2FysicLVU%2FhJ1UunaqWhQrUv6b7MR0sOr4vcfRo5Xtm3BboPXkGMdCna67CFWxsfUZfqAj7VDCXuN%2FVBjqkAQIx5%2FKacX%2B6c6ueVGx4P3xXiQaurY1kcoRSRq9nD4AFxdfOccThJUBQT25ZZO4sJZUlQgnyFE0b0rLuEVvoLxhRhJKmAlH%2F7nClzKh%2BsdaDjf2oPFABhnOnR%2B%2BGutpMqwa438Nw2%2BQv6d5LCH%2B9hf6vHrHodgq4wy5P%2F5LIyBDTAL4gIYoQz5Y%2FePPxb8GWxirkYK9nJg7%2F5Yubd%2FilCslYnHw6&X-Amz-Signature=da81ad04e0a9104794962b05f7a17201ea88f5e83716879ddba0bce38e095ea6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SMX4CRVR%2F20260926%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260926T151940Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjED8aCXVzLXdlc3QtMiJIMEYCIQCmqS%2FS5CQDJ%2Bf5Rt%2FIUAIYQD%2Fukdf3cLcboehpngsrXwIhAK%2BgsPwRdeW8VkjOhlyn8VG0SLYlj0fTcyARShC4dR%2BkKv8DCAgQABoMNjM3NDIzMTgzODA1IgxPk8M%2FTCE11dzcMBIq3APXMqaz0gAPSUT6uQo5imdDYngrSoTbJBW7ypwAPQP8HgZnH7SPBu8MrtIuUGhoQPvJ%2FP3%2FM5NFJa%2FnM%2FA5dLyDPB3jwPxQAKV%2BsBYRAe5KU3XJDJEVSx0id3SRpgcEMhrnCKDwC1T2IjHCqAXQwWYWBIPFVJH4rAWrTaFIA92Wk%2FHAiP%2FbOBnsHP3aEMqS9g65OnPEnKorDpHRaAHFWk9dJDxlyHuIuXU8IKoTHMvpRUSfS9vu2Yzl27LEw%2FAkojgMxvr4oEpOarW1%2FvLMBBKfIwMqUJwm8c6MwaQYH107U2Ue8lt7sjU2yevIKYlxFLyx5RimKyVIUr%2Bd5pfJ99eVvvGqxaCIfAUCDIu0SQosPG23H5yPlRvvh4CvfZf%2BI9KbvYoGB1%2FImCiQkTihtH2JXMzM0LQxuavlmTicRpA22GvmCxy%2BPUXkuEJTE%2B%2FWRKHUNyt9CgGLOOJbV5RdzJlRC6PfoGTkua89DyaYnBdM5mqDElZf%2BI82BonPZnDcGbR%2F6iqjAlUK6n7PedGJ7yWW%2FISndiEz43K3Ruw59dPHxGGTZa%2BLT9%2FysicLVU%2FhJ1UunaqWhQrUv6b7MR0sOr4vcfRo5Xtm3BboPXkGMdCna67CFWxsfUZfqAj7VDCXuN%2FVBjqkAQIx5%2FKacX%2B6c6ueVGx4P3xXiQaurY1kcoRSRq9nD4AFxdfOccThJUBQT25ZZO4sJZUlQgnyFE0b0rLuEVvoLxhRhJKmAlH%2F7nClzKh%2BsdaDjf2oPFABhnOnR%2B%2BGutpMqwa438Nw2%2BQv6d5LCH%2B9hf6vHrHodgq4wy5P%2F5LIyBDTAL4gIYoQz5Y%2FePPxb8GWxirkYK9nJg7%2F5Yubd%2FilCslYnHw6&X-Amz-Signature=8493dbd0400eda7b51f13dd50241128bc567808194825cee6aecbdd4845a60a8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SMX4CRVR%2F20260926%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260926T151940Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjED8aCXVzLXdlc3QtMiJIMEYCIQCmqS%2FS5CQDJ%2Bf5Rt%2FIUAIYQD%2Fukdf3cLcboehpngsrXwIhAK%2BgsPwRdeW8VkjOhlyn8VG0SLYlj0fTcyARShC4dR%2BkKv8DCAgQABoMNjM3NDIzMTgzODA1IgxPk8M%2FTCE11dzcMBIq3APXMqaz0gAPSUT6uQo5imdDYngrSoTbJBW7ypwAPQP8HgZnH7SPBu8MrtIuUGhoQPvJ%2FP3%2FM5NFJa%2FnM%2FA5dLyDPB3jwPxQAKV%2BsBYRAe5KU3XJDJEVSx0id3SRpgcEMhrnCKDwC1T2IjHCqAXQwWYWBIPFVJH4rAWrTaFIA92Wk%2FHAiP%2FbOBnsHP3aEMqS9g65OnPEnKorDpHRaAHFWk9dJDxlyHuIuXU8IKoTHMvpRUSfS9vu2Yzl27LEw%2FAkojgMxvr4oEpOarW1%2FvLMBBKfIwMqUJwm8c6MwaQYH107U2Ue8lt7sjU2yevIKYlxFLyx5RimKyVIUr%2Bd5pfJ99eVvvGqxaCIfAUCDIu0SQosPG23H5yPlRvvh4CvfZf%2BI9KbvYoGB1%2FImCiQkTihtH2JXMzM0LQxuavlmTicRpA22GvmCxy%2BPUXkuEJTE%2B%2FWRKHUNyt9CgGLOOJbV5RdzJlRC6PfoGTkua89DyaYnBdM5mqDElZf%2BI82BonPZnDcGbR%2F6iqjAlUK6n7PedGJ7yWW%2FISndiEz43K3Ruw59dPHxGGTZa%2BLT9%2FysicLVU%2FhJ1UunaqWhQrUv6b7MR0sOr4vcfRo5Xtm3BboPXkGMdCna67CFWxsfUZfqAj7VDCXuN%2FVBjqkAQIx5%2FKacX%2B6c6ueVGx4P3xXiQaurY1kcoRSRq9nD4AFxdfOccThJUBQT25ZZO4sJZUlQgnyFE0b0rLuEVvoLxhRhJKmAlH%2F7nClzKh%2BsdaDjf2oPFABhnOnR%2B%2BGutpMqwa438Nw2%2BQv6d5LCH%2B9hf6vHrHodgq4wy5P%2F5LIyBDTAL4gIYoQz5Y%2FePPxb8GWxirkYK9nJg7%2F5Yubd%2FilCslYnHw6&X-Amz-Signature=5a8aee47e221f87fa2a7455132757d09fba8d73463d409e889892ea2564005c6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
