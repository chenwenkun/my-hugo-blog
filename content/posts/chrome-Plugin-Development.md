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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UF4EGVYQ%2F20260902%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260902T015340Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCDYeTRWkVEUXDXUfOb%2FtDem47PtTwVK5vzdK0SvvPLyQIgCHWrsGYQjxKzTbBUq%2B87NbDnUjwwdOIOdpGtPsYcrIEqiAQIu%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDAaO1fCuQCRRusX9%2FyrcA5JuhcikxwoeCm%2BS0qjQp8fiuZf05Qo%2B8D%2FQ3SRE9Ce%2B5e85ot82Z3dC2qpYfOzibMgjUfBORaQOKyxvuzcFbgLJSvzTiDP4L4k61pjJd%2B3qIL5%2FmVUCA%2F6Va5AWnwlJKM1Pq8XC3H9ZMKnEJyZojpg2VT9dkbcH6bOuBzrsLGCTi3XmX0N4ejw9RjhhyV4qvcKu1BDTAQBTaA1FK2JWoYRk02pK39Ufgh2mS8%2B0qfUztAkyoUEr3rALc%2Fzup%2Bba0pj61OYQFA1dVE4I%2B%2F0MTHY0wMkhawbzHYto4P%2BRaXxVh%2BvNgb1lyo8%2FFrK1BvvP2UvKFJiOG2nn6AvXbSnyYGZYHpmWRpDnTpSbqnxMe4Hm7xFJ66MBhiT7RgIfKQWB0q%2B%2Fy2cabcsszg6%2B5LRM9dA4tbJ2jIaW7BGPihi9UCM3t8r7b2PBK3dLdYoM88p6pvgg7VXibG1pFq%2BT1VUfZnuJPsRg%2FjEpwuXoHbx%2BkAa6jlnnCu9bkfktaIsRZQS3LVTF4MDYkXqcW8kz%2BtS3EjlQZKbDBrPBhv9vURfDUTqwKLClAoIG67Z%2BAQzNQhxGUxySVGhbpDniqSTHeN13Hs2Lq8keGtADFuK%2F9tDW9CUYHTtks3VQz%2BADnXL8MK6A3tQGOqUBthVMViRY4IIuMnAIfFaqDDDqX4VtaWSjQcK0PheX35LH2iiVJdOfbNB2GIXAOaeL72ONLTFvl1xiL3VO5znlPXB7F%2BVitD2IuCA4jfHiOjF%2Fd83yjrlqdzTwysjLOSnhVJemy6yBFFOzxbigPQfw7MHehl2XNqSvTjK4NRoyTZzhzB4KpFo%2FovhP8dc85UO%2FjqK9nxGJcLptL1Wxy3wru%2Fxa3VjU&X-Amz-Signature=cd4e17bcc8fac92403295fed7fba491fe5e0a11670d58a71d4f0681793757ecb&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UF4EGVYQ%2F20260902%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260902T015340Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCDYeTRWkVEUXDXUfOb%2FtDem47PtTwVK5vzdK0SvvPLyQIgCHWrsGYQjxKzTbBUq%2B87NbDnUjwwdOIOdpGtPsYcrIEqiAQIu%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDAaO1fCuQCRRusX9%2FyrcA5JuhcikxwoeCm%2BS0qjQp8fiuZf05Qo%2B8D%2FQ3SRE9Ce%2B5e85ot82Z3dC2qpYfOzibMgjUfBORaQOKyxvuzcFbgLJSvzTiDP4L4k61pjJd%2B3qIL5%2FmVUCA%2F6Va5AWnwlJKM1Pq8XC3H9ZMKnEJyZojpg2VT9dkbcH6bOuBzrsLGCTi3XmX0N4ejw9RjhhyV4qvcKu1BDTAQBTaA1FK2JWoYRk02pK39Ufgh2mS8%2B0qfUztAkyoUEr3rALc%2Fzup%2Bba0pj61OYQFA1dVE4I%2B%2F0MTHY0wMkhawbzHYto4P%2BRaXxVh%2BvNgb1lyo8%2FFrK1BvvP2UvKFJiOG2nn6AvXbSnyYGZYHpmWRpDnTpSbqnxMe4Hm7xFJ66MBhiT7RgIfKQWB0q%2B%2Fy2cabcsszg6%2B5LRM9dA4tbJ2jIaW7BGPihi9UCM3t8r7b2PBK3dLdYoM88p6pvgg7VXibG1pFq%2BT1VUfZnuJPsRg%2FjEpwuXoHbx%2BkAa6jlnnCu9bkfktaIsRZQS3LVTF4MDYkXqcW8kz%2BtS3EjlQZKbDBrPBhv9vURfDUTqwKLClAoIG67Z%2BAQzNQhxGUxySVGhbpDniqSTHeN13Hs2Lq8keGtADFuK%2F9tDW9CUYHTtks3VQz%2BADnXL8MK6A3tQGOqUBthVMViRY4IIuMnAIfFaqDDDqX4VtaWSjQcK0PheX35LH2iiVJdOfbNB2GIXAOaeL72ONLTFvl1xiL3VO5znlPXB7F%2BVitD2IuCA4jfHiOjF%2Fd83yjrlqdzTwysjLOSnhVJemy6yBFFOzxbigPQfw7MHehl2XNqSvTjK4NRoyTZzhzB4KpFo%2FovhP8dc85UO%2FjqK9nxGJcLptL1Wxy3wru%2Fxa3VjU&X-Amz-Signature=5270d025a7484fc8a7ac245119acac9598613fa3cb7abc0b5ec52ab04cd1006b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UF4EGVYQ%2F20260902%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260902T015340Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCDYeTRWkVEUXDXUfOb%2FtDem47PtTwVK5vzdK0SvvPLyQIgCHWrsGYQjxKzTbBUq%2B87NbDnUjwwdOIOdpGtPsYcrIEqiAQIu%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDAaO1fCuQCRRusX9%2FyrcA5JuhcikxwoeCm%2BS0qjQp8fiuZf05Qo%2B8D%2FQ3SRE9Ce%2B5e85ot82Z3dC2qpYfOzibMgjUfBORaQOKyxvuzcFbgLJSvzTiDP4L4k61pjJd%2B3qIL5%2FmVUCA%2F6Va5AWnwlJKM1Pq8XC3H9ZMKnEJyZojpg2VT9dkbcH6bOuBzrsLGCTi3XmX0N4ejw9RjhhyV4qvcKu1BDTAQBTaA1FK2JWoYRk02pK39Ufgh2mS8%2B0qfUztAkyoUEr3rALc%2Fzup%2Bba0pj61OYQFA1dVE4I%2B%2F0MTHY0wMkhawbzHYto4P%2BRaXxVh%2BvNgb1lyo8%2FFrK1BvvP2UvKFJiOG2nn6AvXbSnyYGZYHpmWRpDnTpSbqnxMe4Hm7xFJ66MBhiT7RgIfKQWB0q%2B%2Fy2cabcsszg6%2B5LRM9dA4tbJ2jIaW7BGPihi9UCM3t8r7b2PBK3dLdYoM88p6pvgg7VXibG1pFq%2BT1VUfZnuJPsRg%2FjEpwuXoHbx%2BkAa6jlnnCu9bkfktaIsRZQS3LVTF4MDYkXqcW8kz%2BtS3EjlQZKbDBrPBhv9vURfDUTqwKLClAoIG67Z%2BAQzNQhxGUxySVGhbpDniqSTHeN13Hs2Lq8keGtADFuK%2F9tDW9CUYHTtks3VQz%2BADnXL8MK6A3tQGOqUBthVMViRY4IIuMnAIfFaqDDDqX4VtaWSjQcK0PheX35LH2iiVJdOfbNB2GIXAOaeL72ONLTFvl1xiL3VO5znlPXB7F%2BVitD2IuCA4jfHiOjF%2Fd83yjrlqdzTwysjLOSnhVJemy6yBFFOzxbigPQfw7MHehl2XNqSvTjK4NRoyTZzhzB4KpFo%2FovhP8dc85UO%2FjqK9nxGJcLptL1Wxy3wru%2Fxa3VjU&X-Amz-Signature=ba588d6015c63568af516c57cbf84a970988dcfa5fe0f95b8ee6143f55547fc3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UF4EGVYQ%2F20260902%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260902T015340Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCDYeTRWkVEUXDXUfOb%2FtDem47PtTwVK5vzdK0SvvPLyQIgCHWrsGYQjxKzTbBUq%2B87NbDnUjwwdOIOdpGtPsYcrIEqiAQIu%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDAaO1fCuQCRRusX9%2FyrcA5JuhcikxwoeCm%2BS0qjQp8fiuZf05Qo%2B8D%2FQ3SRE9Ce%2B5e85ot82Z3dC2qpYfOzibMgjUfBORaQOKyxvuzcFbgLJSvzTiDP4L4k61pjJd%2B3qIL5%2FmVUCA%2F6Va5AWnwlJKM1Pq8XC3H9ZMKnEJyZojpg2VT9dkbcH6bOuBzrsLGCTi3XmX0N4ejw9RjhhyV4qvcKu1BDTAQBTaA1FK2JWoYRk02pK39Ufgh2mS8%2B0qfUztAkyoUEr3rALc%2Fzup%2Bba0pj61OYQFA1dVE4I%2B%2F0MTHY0wMkhawbzHYto4P%2BRaXxVh%2BvNgb1lyo8%2FFrK1BvvP2UvKFJiOG2nn6AvXbSnyYGZYHpmWRpDnTpSbqnxMe4Hm7xFJ66MBhiT7RgIfKQWB0q%2B%2Fy2cabcsszg6%2B5LRM9dA4tbJ2jIaW7BGPihi9UCM3t8r7b2PBK3dLdYoM88p6pvgg7VXibG1pFq%2BT1VUfZnuJPsRg%2FjEpwuXoHbx%2BkAa6jlnnCu9bkfktaIsRZQS3LVTF4MDYkXqcW8kz%2BtS3EjlQZKbDBrPBhv9vURfDUTqwKLClAoIG67Z%2BAQzNQhxGUxySVGhbpDniqSTHeN13Hs2Lq8keGtADFuK%2F9tDW9CUYHTtks3VQz%2BADnXL8MK6A3tQGOqUBthVMViRY4IIuMnAIfFaqDDDqX4VtaWSjQcK0PheX35LH2iiVJdOfbNB2GIXAOaeL72ONLTFvl1xiL3VO5znlPXB7F%2BVitD2IuCA4jfHiOjF%2Fd83yjrlqdzTwysjLOSnhVJemy6yBFFOzxbigPQfw7MHehl2XNqSvTjK4NRoyTZzhzB4KpFo%2FovhP8dc85UO%2FjqK9nxGJcLptL1Wxy3wru%2Fxa3VjU&X-Amz-Signature=84af4f3e213516ddf0c082141f15274e29070dfd0eb913d74d67a965d020f16a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
