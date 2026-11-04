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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RZ7AC64N%2F20261104%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261104T132658Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDpwJnAiwBrjOtld%2FPdPPJV0Q77WfpIC%2BKFGuBsrb694wIgDFZW%2BqGar8rQdCeemHod23vm4Sv1embYAfJatwV%2Frf4qiAQIrv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDBjp%2BBjTyu0EMob2eircA%2Bk%2Bec%2FxEdIrfqiELlv%2BPUctDta6xSav1u7UAfc3IHeumDAvqN280XS08YPOzivoWF2QPTBQVSe3wUwaGEVD%2ByCxCuUWqGfS%2FSLnkphtpeQj%2BUOPb%2B0aavezZxA84AmqNwdRkWWFMPHeE8SrNYhEvGHjioBbD17r3A2xEHaXoeGkn0SbcfXOoM%2Fkrvg16P9msT9mKnApWZFebT%2BIgDiIIYe%2BYPrXr44XEGwivPczadMlpdtZC9tBUgC4WM45p8h7Ng7VWWVKuV0V4W%2BfrO904yWXVdqdieGjn75nGEQDbdWbkfj3iXAfmZrZ6d5YWJPYJ4whXk0mt%2BKEWg27egYVAetE4SNYvz%2Fs7lGvIoYbirKeymEqG9%2BUtoDko8%2BxMyI9unctZ2ICF%2BsLbVF5Jdu60kDeZ5sb5AnmlA2SVuCutA1ux53lKVabZWXtQPxkuAI5gUJgjOOu5RW0wt7k92XH%2ByAyGKEIwXwy1FJsCcHQSfBt5QWzRC1igsbW207ispVES5oT3WW8CsiTyL2%2BynDvSNVQTtDQJAVqNk6ppwxsuiYltUm%2BAgAA5hR%2F5nirajFgcpQgphKhvnVAoa%2FQrurJ0l4YZXIo7yrX1WoZfT4XPu4JKpysrZ5Wolz%2FTSokMOjKrNcGOqUBRf658i9D2eBU42x1o4UNzDNuAs1Mftz3xQJv%2FvbBcAEMruwp4v3SCyliXYFj3XxS%2BKKY6bhR7%2BcFbrkdRoZI1sdsKtTOa9FebsAfXFEM%2FXnJq05%2B5fCrKvCjoXWHwqcplYWdgCkskOxy0kv30qB2xW8VsjVFmdNH26PBsxf2Up7hV3Q0z7BEOFUOfQin%2FVy5eHV%2Ffgi8pxiBkNrvxheXEOyMRVuo&X-Amz-Signature=f4b71fd9540ca930b8579d212fe28f94c88302b7f36e611a0992021b11993e2b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RZ7AC64N%2F20261104%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261104T132658Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDpwJnAiwBrjOtld%2FPdPPJV0Q77WfpIC%2BKFGuBsrb694wIgDFZW%2BqGar8rQdCeemHod23vm4Sv1embYAfJatwV%2Frf4qiAQIrv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDBjp%2BBjTyu0EMob2eircA%2Bk%2Bec%2FxEdIrfqiELlv%2BPUctDta6xSav1u7UAfc3IHeumDAvqN280XS08YPOzivoWF2QPTBQVSe3wUwaGEVD%2ByCxCuUWqGfS%2FSLnkphtpeQj%2BUOPb%2B0aavezZxA84AmqNwdRkWWFMPHeE8SrNYhEvGHjioBbD17r3A2xEHaXoeGkn0SbcfXOoM%2Fkrvg16P9msT9mKnApWZFebT%2BIgDiIIYe%2BYPrXr44XEGwivPczadMlpdtZC9tBUgC4WM45p8h7Ng7VWWVKuV0V4W%2BfrO904yWXVdqdieGjn75nGEQDbdWbkfj3iXAfmZrZ6d5YWJPYJ4whXk0mt%2BKEWg27egYVAetE4SNYvz%2Fs7lGvIoYbirKeymEqG9%2BUtoDko8%2BxMyI9unctZ2ICF%2BsLbVF5Jdu60kDeZ5sb5AnmlA2SVuCutA1ux53lKVabZWXtQPxkuAI5gUJgjOOu5RW0wt7k92XH%2ByAyGKEIwXwy1FJsCcHQSfBt5QWzRC1igsbW207ispVES5oT3WW8CsiTyL2%2BynDvSNVQTtDQJAVqNk6ppwxsuiYltUm%2BAgAA5hR%2F5nirajFgcpQgphKhvnVAoa%2FQrurJ0l4YZXIo7yrX1WoZfT4XPu4JKpysrZ5Wolz%2FTSokMOjKrNcGOqUBRf658i9D2eBU42x1o4UNzDNuAs1Mftz3xQJv%2FvbBcAEMruwp4v3SCyliXYFj3XxS%2BKKY6bhR7%2BcFbrkdRoZI1sdsKtTOa9FebsAfXFEM%2FXnJq05%2B5fCrKvCjoXWHwqcplYWdgCkskOxy0kv30qB2xW8VsjVFmdNH26PBsxf2Up7hV3Q0z7BEOFUOfQin%2FVy5eHV%2Ffgi8pxiBkNrvxheXEOyMRVuo&X-Amz-Signature=aa4b0a5ea7b95a2507e0fc899ba20211dc70378cd7e396c98c27b622e40b1117&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RZ7AC64N%2F20261104%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261104T132658Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDpwJnAiwBrjOtld%2FPdPPJV0Q77WfpIC%2BKFGuBsrb694wIgDFZW%2BqGar8rQdCeemHod23vm4Sv1embYAfJatwV%2Frf4qiAQIrv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDBjp%2BBjTyu0EMob2eircA%2Bk%2Bec%2FxEdIrfqiELlv%2BPUctDta6xSav1u7UAfc3IHeumDAvqN280XS08YPOzivoWF2QPTBQVSe3wUwaGEVD%2ByCxCuUWqGfS%2FSLnkphtpeQj%2BUOPb%2B0aavezZxA84AmqNwdRkWWFMPHeE8SrNYhEvGHjioBbD17r3A2xEHaXoeGkn0SbcfXOoM%2Fkrvg16P9msT9mKnApWZFebT%2BIgDiIIYe%2BYPrXr44XEGwivPczadMlpdtZC9tBUgC4WM45p8h7Ng7VWWVKuV0V4W%2BfrO904yWXVdqdieGjn75nGEQDbdWbkfj3iXAfmZrZ6d5YWJPYJ4whXk0mt%2BKEWg27egYVAetE4SNYvz%2Fs7lGvIoYbirKeymEqG9%2BUtoDko8%2BxMyI9unctZ2ICF%2BsLbVF5Jdu60kDeZ5sb5AnmlA2SVuCutA1ux53lKVabZWXtQPxkuAI5gUJgjOOu5RW0wt7k92XH%2ByAyGKEIwXwy1FJsCcHQSfBt5QWzRC1igsbW207ispVES5oT3WW8CsiTyL2%2BynDvSNVQTtDQJAVqNk6ppwxsuiYltUm%2BAgAA5hR%2F5nirajFgcpQgphKhvnVAoa%2FQrurJ0l4YZXIo7yrX1WoZfT4XPu4JKpysrZ5Wolz%2FTSokMOjKrNcGOqUBRf658i9D2eBU42x1o4UNzDNuAs1Mftz3xQJv%2FvbBcAEMruwp4v3SCyliXYFj3XxS%2BKKY6bhR7%2BcFbrkdRoZI1sdsKtTOa9FebsAfXFEM%2FXnJq05%2B5fCrKvCjoXWHwqcplYWdgCkskOxy0kv30qB2xW8VsjVFmdNH26PBsxf2Up7hV3Q0z7BEOFUOfQin%2FVy5eHV%2Ffgi8pxiBkNrvxheXEOyMRVuo&X-Amz-Signature=5ba288dbe105ae2ed876cf40de393b59c6a47cc17e4cd133983b4f67cbbd7f0b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RZ7AC64N%2F20261104%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261104T132658Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDpwJnAiwBrjOtld%2FPdPPJV0Q77WfpIC%2BKFGuBsrb694wIgDFZW%2BqGar8rQdCeemHod23vm4Sv1embYAfJatwV%2Frf4qiAQIrv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDBjp%2BBjTyu0EMob2eircA%2Bk%2Bec%2FxEdIrfqiELlv%2BPUctDta6xSav1u7UAfc3IHeumDAvqN280XS08YPOzivoWF2QPTBQVSe3wUwaGEVD%2ByCxCuUWqGfS%2FSLnkphtpeQj%2BUOPb%2B0aavezZxA84AmqNwdRkWWFMPHeE8SrNYhEvGHjioBbD17r3A2xEHaXoeGkn0SbcfXOoM%2Fkrvg16P9msT9mKnApWZFebT%2BIgDiIIYe%2BYPrXr44XEGwivPczadMlpdtZC9tBUgC4WM45p8h7Ng7VWWVKuV0V4W%2BfrO904yWXVdqdieGjn75nGEQDbdWbkfj3iXAfmZrZ6d5YWJPYJ4whXk0mt%2BKEWg27egYVAetE4SNYvz%2Fs7lGvIoYbirKeymEqG9%2BUtoDko8%2BxMyI9unctZ2ICF%2BsLbVF5Jdu60kDeZ5sb5AnmlA2SVuCutA1ux53lKVabZWXtQPxkuAI5gUJgjOOu5RW0wt7k92XH%2ByAyGKEIwXwy1FJsCcHQSfBt5QWzRC1igsbW207ispVES5oT3WW8CsiTyL2%2BynDvSNVQTtDQJAVqNk6ppwxsuiYltUm%2BAgAA5hR%2F5nirajFgcpQgphKhvnVAoa%2FQrurJ0l4YZXIo7yrX1WoZfT4XPu4JKpysrZ5Wolz%2FTSokMOjKrNcGOqUBRf658i9D2eBU42x1o4UNzDNuAs1Mftz3xQJv%2FvbBcAEMruwp4v3SCyliXYFj3XxS%2BKKY6bhR7%2BcFbrkdRoZI1sdsKtTOa9FebsAfXFEM%2FXnJq05%2B5fCrKvCjoXWHwqcplYWdgCkskOxy0kv30qB2xW8VsjVFmdNH26PBsxf2Up7hV3Q0z7BEOFUOfQin%2FVy5eHV%2Ffgi8pxiBkNrvxheXEOyMRVuo&X-Amz-Signature=987b9bbe11a0dc5d08a7d8cc7674a97b65f7234ae76ff340e54c233cd26d44cf&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
