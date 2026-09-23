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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RN5NSZSX%2F20260923%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260923T022010Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCTr3iim0GHHS2ikXgl3qiBCQBJlmpP1EpWY%2BrZbnujZwIgdfJipOCmnHBmIdBIF1%2FCviyamvEjDwypGeW%2FJZQJ7OgqiAQIrv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDH953aIMmE8oTLeCeSrcA3%2FxhCHOUsVVjNVmpzOP9mjde897gkvc9Lci9CRBQVEQM1k31Q5W%2BVmjmYJC%2BK1CrGJG1BDr3swywjKZ7R7svgersrSN8K%2BLGCXg7TwT71nHarKOMZkQtzfQ0AKz5uEkRjI1xgo7r%2B%2BUCdSsmnghpNJJ0d1NokF8QuNNkOFIJkXE1FOrVfdzqEIeJBhDHspiog6LZ1Zo9rT1g5QY2ajKij6%2BEJgrkphwyhU95SthZzcAF7%2FTNj3x%2BAGzotCBCwgxs9TPqbHKkEDiyX%2FH4l6QG3Vs0bGziQAu49vhNuC8g9yUOolCcaHLGVZH%2F9GwTxF%2BMUUS0e5iBMk7NG2%2BwzOFMsfiHgQDYdklvmU96%2Bk2yy3gD%2BDRrtnnx9FresSQmK7v5o6ndiU2jdkSPoXuPzjSNmoUC9qSPCP0BR5g9BejFoAfk61MJNaaT18dT1GMxcgFqkwCetnQbe53EmptjxDtyLohnKNEQ1P8CW9dn164HzgIxF0N5n4qjYFh%2F%2FHb0iH8YAQYY1IpcrnXhE8EQSecDAIjhU5Q9n9ZivPF9TuHnf43A7Gj03SLGKcFso05jjsqBq7FfS1%2FQckLVHgOOXTwc3Vbe4je7VA0ntpm5yWA3QJHSFofIOdBhnY%2FyjuJMLzUy9UGOqUBH6ggJLQrQxGWOT4FgJjFiprix%2FQEPWFYeGM5CNNbgfPlwbhnWRYia%2FuaVsngR%2FokcJ5OK0qKw8BEIu9huRJ1eW91e5xuZiw8UkBI3wHnX5roylVBoq%2BeT3RL6mn68Gwv9zgIuKTqcJj5euMTXDJEk9bt%2BGNMEjk3z%2FZrLYglG0jfRN7s2htB%2B6ZTPLkwXIBQ2MfiAWIrBbGlXlwiK7qCznNUbTng&X-Amz-Signature=cf7c63f184a97363f3558598ff12798421b5b0336b3f0e163d468c47272ef378&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RN5NSZSX%2F20260923%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260923T022010Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCTr3iim0GHHS2ikXgl3qiBCQBJlmpP1EpWY%2BrZbnujZwIgdfJipOCmnHBmIdBIF1%2FCviyamvEjDwypGeW%2FJZQJ7OgqiAQIrv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDH953aIMmE8oTLeCeSrcA3%2FxhCHOUsVVjNVmpzOP9mjde897gkvc9Lci9CRBQVEQM1k31Q5W%2BVmjmYJC%2BK1CrGJG1BDr3swywjKZ7R7svgersrSN8K%2BLGCXg7TwT71nHarKOMZkQtzfQ0AKz5uEkRjI1xgo7r%2B%2BUCdSsmnghpNJJ0d1NokF8QuNNkOFIJkXE1FOrVfdzqEIeJBhDHspiog6LZ1Zo9rT1g5QY2ajKij6%2BEJgrkphwyhU95SthZzcAF7%2FTNj3x%2BAGzotCBCwgxs9TPqbHKkEDiyX%2FH4l6QG3Vs0bGziQAu49vhNuC8g9yUOolCcaHLGVZH%2F9GwTxF%2BMUUS0e5iBMk7NG2%2BwzOFMsfiHgQDYdklvmU96%2Bk2yy3gD%2BDRrtnnx9FresSQmK7v5o6ndiU2jdkSPoXuPzjSNmoUC9qSPCP0BR5g9BejFoAfk61MJNaaT18dT1GMxcgFqkwCetnQbe53EmptjxDtyLohnKNEQ1P8CW9dn164HzgIxF0N5n4qjYFh%2F%2FHb0iH8YAQYY1IpcrnXhE8EQSecDAIjhU5Q9n9ZivPF9TuHnf43A7Gj03SLGKcFso05jjsqBq7FfS1%2FQckLVHgOOXTwc3Vbe4je7VA0ntpm5yWA3QJHSFofIOdBhnY%2FyjuJMLzUy9UGOqUBH6ggJLQrQxGWOT4FgJjFiprix%2FQEPWFYeGM5CNNbgfPlwbhnWRYia%2FuaVsngR%2FokcJ5OK0qKw8BEIu9huRJ1eW91e5xuZiw8UkBI3wHnX5roylVBoq%2BeT3RL6mn68Gwv9zgIuKTqcJj5euMTXDJEk9bt%2BGNMEjk3z%2FZrLYglG0jfRN7s2htB%2B6ZTPLkwXIBQ2MfiAWIrBbGlXlwiK7qCznNUbTng&X-Amz-Signature=4bde5d2102969a2f33bd1f0321c5a8f1b7c01660eb30c47d6ec53b8f94cbe648&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RN5NSZSX%2F20260923%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260923T022010Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCTr3iim0GHHS2ikXgl3qiBCQBJlmpP1EpWY%2BrZbnujZwIgdfJipOCmnHBmIdBIF1%2FCviyamvEjDwypGeW%2FJZQJ7OgqiAQIrv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDH953aIMmE8oTLeCeSrcA3%2FxhCHOUsVVjNVmpzOP9mjde897gkvc9Lci9CRBQVEQM1k31Q5W%2BVmjmYJC%2BK1CrGJG1BDr3swywjKZ7R7svgersrSN8K%2BLGCXg7TwT71nHarKOMZkQtzfQ0AKz5uEkRjI1xgo7r%2B%2BUCdSsmnghpNJJ0d1NokF8QuNNkOFIJkXE1FOrVfdzqEIeJBhDHspiog6LZ1Zo9rT1g5QY2ajKij6%2BEJgrkphwyhU95SthZzcAF7%2FTNj3x%2BAGzotCBCwgxs9TPqbHKkEDiyX%2FH4l6QG3Vs0bGziQAu49vhNuC8g9yUOolCcaHLGVZH%2F9GwTxF%2BMUUS0e5iBMk7NG2%2BwzOFMsfiHgQDYdklvmU96%2Bk2yy3gD%2BDRrtnnx9FresSQmK7v5o6ndiU2jdkSPoXuPzjSNmoUC9qSPCP0BR5g9BejFoAfk61MJNaaT18dT1GMxcgFqkwCetnQbe53EmptjxDtyLohnKNEQ1P8CW9dn164HzgIxF0N5n4qjYFh%2F%2FHb0iH8YAQYY1IpcrnXhE8EQSecDAIjhU5Q9n9ZivPF9TuHnf43A7Gj03SLGKcFso05jjsqBq7FfS1%2FQckLVHgOOXTwc3Vbe4je7VA0ntpm5yWA3QJHSFofIOdBhnY%2FyjuJMLzUy9UGOqUBH6ggJLQrQxGWOT4FgJjFiprix%2FQEPWFYeGM5CNNbgfPlwbhnWRYia%2FuaVsngR%2FokcJ5OK0qKw8BEIu9huRJ1eW91e5xuZiw8UkBI3wHnX5roylVBoq%2BeT3RL6mn68Gwv9zgIuKTqcJj5euMTXDJEk9bt%2BGNMEjk3z%2FZrLYglG0jfRN7s2htB%2B6ZTPLkwXIBQ2MfiAWIrBbGlXlwiK7qCznNUbTng&X-Amz-Signature=8d49409190c64c854024fcfd09b342e7c5101e751830d4e08ed2ff2deb7d7cc6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RN5NSZSX%2F20260923%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260923T022010Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCTr3iim0GHHS2ikXgl3qiBCQBJlmpP1EpWY%2BrZbnujZwIgdfJipOCmnHBmIdBIF1%2FCviyamvEjDwypGeW%2FJZQJ7OgqiAQIrv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDH953aIMmE8oTLeCeSrcA3%2FxhCHOUsVVjNVmpzOP9mjde897gkvc9Lci9CRBQVEQM1k31Q5W%2BVmjmYJC%2BK1CrGJG1BDr3swywjKZ7R7svgersrSN8K%2BLGCXg7TwT71nHarKOMZkQtzfQ0AKz5uEkRjI1xgo7r%2B%2BUCdSsmnghpNJJ0d1NokF8QuNNkOFIJkXE1FOrVfdzqEIeJBhDHspiog6LZ1Zo9rT1g5QY2ajKij6%2BEJgrkphwyhU95SthZzcAF7%2FTNj3x%2BAGzotCBCwgxs9TPqbHKkEDiyX%2FH4l6QG3Vs0bGziQAu49vhNuC8g9yUOolCcaHLGVZH%2F9GwTxF%2BMUUS0e5iBMk7NG2%2BwzOFMsfiHgQDYdklvmU96%2Bk2yy3gD%2BDRrtnnx9FresSQmK7v5o6ndiU2jdkSPoXuPzjSNmoUC9qSPCP0BR5g9BejFoAfk61MJNaaT18dT1GMxcgFqkwCetnQbe53EmptjxDtyLohnKNEQ1P8CW9dn164HzgIxF0N5n4qjYFh%2F%2FHb0iH8YAQYY1IpcrnXhE8EQSecDAIjhU5Q9n9ZivPF9TuHnf43A7Gj03SLGKcFso05jjsqBq7FfS1%2FQckLVHgOOXTwc3Vbe4je7VA0ntpm5yWA3QJHSFofIOdBhnY%2FyjuJMLzUy9UGOqUBH6ggJLQrQxGWOT4FgJjFiprix%2FQEPWFYeGM5CNNbgfPlwbhnWRYia%2FuaVsngR%2FokcJ5OK0qKw8BEIu9huRJ1eW91e5xuZiw8UkBI3wHnX5roylVBoq%2BeT3RL6mn68Gwv9zgIuKTqcJj5euMTXDJEk9bt%2BGNMEjk3z%2FZrLYglG0jfRN7s2htB%2B6ZTPLkwXIBQ2MfiAWIrBbGlXlwiK7qCznNUbTng&X-Amz-Signature=46d7e861e158a6d49a9f432b92327a2f1d34aad737a8bc205167e3bf42867194&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
