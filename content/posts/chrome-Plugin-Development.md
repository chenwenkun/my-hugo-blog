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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667OFU5YGB%2F20260815%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260815T061846Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEYaCXVzLXdlc3QtMiJHMEUCIQDztplj7Ac81vDELnr9R1Ur1A2RjNAL6TUVJhC828xmDgIgfH6KCR8XQ%2FMIYyGjHPNVDk%2FgAl3f680Ak23XULPocdcq%2FwMIDxAAGgw2Mzc0MjMxODM4MDUiDFdyfoONtgKR8jQa%2BircAxcYtljLV436mqMzmaL1kLzEycifBaS%2Fr5w1%2FTiFZ2HNUcR4B0QZwB711JAZ2fpNvq%2FAeGxhM6tx%2FfH1sHSwy3Iy%2B9%2FjBOvKZHXPf8HdqGqMM6kl%2Fr5nBL0HDgEPojAKY4Ki%2FeO0lHeCn%2FlVbz%2BYMtNfkUq6fR%2BIejL4oVobMOuhRujob%2BGswfsa4QYuSeWmOpBabJ2fTwafMd%2F%2F3KGZaRIrAeIoCNwE0yP87Nwc0dtfYsBagvlGZLoBcUhdWyN16sFaCp7wRjXs4W88mVf%2FGoySDFsWXOC1lsgEw0lTiqK3DPHMRxO4WGgkSJ4ZAxkyofjuxfsj4mcUqyL9E6sELR74w3Jq%2BjSXHM3AB3vtrLiTEFRKMGTvmED9UZT9ABWllz0%2F89qZLh0Rw%2B%2BqL7qKNmqY1ggv5tca%2BTFFkTtbo5Y9KrUnrZ2nB4ebljYrISFZIXvnZwOx%2BH%2BJxSbAxS7wDGHaYmhdMIV%2FXmrs7QbNQ3mQXuqDATfB82iBOsBZveMglJsuhbL63PZ4C9Pu2q9nMExLTiv531Vas8EE6xmpKMlsuLnM%2BTs5r4%2FQMhaBEqdqqSQzcoFA5Si4JDhT%2B5uDOEpaeNqPZTKqvJgSxc7bmwDWt2bby9e882HgVfRIMISFgNQGOqUB9UNWoeUFJ3fV3Su%2BAd1eFW%2BV%2Blx5z5kjT%2FdUP08y7Dh7m8XIhr14Jaw8%2FonrWYdylcZCJAE%2BxnbtYdmO6cwsz9Ab8zvTJHgYJ1nJtTqAf2SjHePTvM128VE4OrX%2BBw%2FDd0gq%2BGkiPUBZU7FmuV0hsDcth5EHKfoVsXHaiecivA3HxssBDgPgp8XTlvENogFOxLzQ6vt31gwoNXJIa8DUEVavR8LJ&X-Amz-Signature=e90f018b48727d9d632d34e5d637d7ea43a9fb73472202606c7bd52abe8e38c6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667OFU5YGB%2F20260815%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260815T061846Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEYaCXVzLXdlc3QtMiJHMEUCIQDztplj7Ac81vDELnr9R1Ur1A2RjNAL6TUVJhC828xmDgIgfH6KCR8XQ%2FMIYyGjHPNVDk%2FgAl3f680Ak23XULPocdcq%2FwMIDxAAGgw2Mzc0MjMxODM4MDUiDFdyfoONtgKR8jQa%2BircAxcYtljLV436mqMzmaL1kLzEycifBaS%2Fr5w1%2FTiFZ2HNUcR4B0QZwB711JAZ2fpNvq%2FAeGxhM6tx%2FfH1sHSwy3Iy%2B9%2FjBOvKZHXPf8HdqGqMM6kl%2Fr5nBL0HDgEPojAKY4Ki%2FeO0lHeCn%2FlVbz%2BYMtNfkUq6fR%2BIejL4oVobMOuhRujob%2BGswfsa4QYuSeWmOpBabJ2fTwafMd%2F%2F3KGZaRIrAeIoCNwE0yP87Nwc0dtfYsBagvlGZLoBcUhdWyN16sFaCp7wRjXs4W88mVf%2FGoySDFsWXOC1lsgEw0lTiqK3DPHMRxO4WGgkSJ4ZAxkyofjuxfsj4mcUqyL9E6sELR74w3Jq%2BjSXHM3AB3vtrLiTEFRKMGTvmED9UZT9ABWllz0%2F89qZLh0Rw%2B%2BqL7qKNmqY1ggv5tca%2BTFFkTtbo5Y9KrUnrZ2nB4ebljYrISFZIXvnZwOx%2BH%2BJxSbAxS7wDGHaYmhdMIV%2FXmrs7QbNQ3mQXuqDATfB82iBOsBZveMglJsuhbL63PZ4C9Pu2q9nMExLTiv531Vas8EE6xmpKMlsuLnM%2BTs5r4%2FQMhaBEqdqqSQzcoFA5Si4JDhT%2B5uDOEpaeNqPZTKqvJgSxc7bmwDWt2bby9e882HgVfRIMISFgNQGOqUB9UNWoeUFJ3fV3Su%2BAd1eFW%2BV%2Blx5z5kjT%2FdUP08y7Dh7m8XIhr14Jaw8%2FonrWYdylcZCJAE%2BxnbtYdmO6cwsz9Ab8zvTJHgYJ1nJtTqAf2SjHePTvM128VE4OrX%2BBw%2FDd0gq%2BGkiPUBZU7FmuV0hsDcth5EHKfoVsXHaiecivA3HxssBDgPgp8XTlvENogFOxLzQ6vt31gwoNXJIa8DUEVavR8LJ&X-Amz-Signature=d91ebdebbc35876b264da51a3af3b21eeae9a3767d0fd389017d8bd18a362cde&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667OFU5YGB%2F20260815%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260815T061846Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEYaCXVzLXdlc3QtMiJHMEUCIQDztplj7Ac81vDELnr9R1Ur1A2RjNAL6TUVJhC828xmDgIgfH6KCR8XQ%2FMIYyGjHPNVDk%2FgAl3f680Ak23XULPocdcq%2FwMIDxAAGgw2Mzc0MjMxODM4MDUiDFdyfoONtgKR8jQa%2BircAxcYtljLV436mqMzmaL1kLzEycifBaS%2Fr5w1%2FTiFZ2HNUcR4B0QZwB711JAZ2fpNvq%2FAeGxhM6tx%2FfH1sHSwy3Iy%2B9%2FjBOvKZHXPf8HdqGqMM6kl%2Fr5nBL0HDgEPojAKY4Ki%2FeO0lHeCn%2FlVbz%2BYMtNfkUq6fR%2BIejL4oVobMOuhRujob%2BGswfsa4QYuSeWmOpBabJ2fTwafMd%2F%2F3KGZaRIrAeIoCNwE0yP87Nwc0dtfYsBagvlGZLoBcUhdWyN16sFaCp7wRjXs4W88mVf%2FGoySDFsWXOC1lsgEw0lTiqK3DPHMRxO4WGgkSJ4ZAxkyofjuxfsj4mcUqyL9E6sELR74w3Jq%2BjSXHM3AB3vtrLiTEFRKMGTvmED9UZT9ABWllz0%2F89qZLh0Rw%2B%2BqL7qKNmqY1ggv5tca%2BTFFkTtbo5Y9KrUnrZ2nB4ebljYrISFZIXvnZwOx%2BH%2BJxSbAxS7wDGHaYmhdMIV%2FXmrs7QbNQ3mQXuqDATfB82iBOsBZveMglJsuhbL63PZ4C9Pu2q9nMExLTiv531Vas8EE6xmpKMlsuLnM%2BTs5r4%2FQMhaBEqdqqSQzcoFA5Si4JDhT%2B5uDOEpaeNqPZTKqvJgSxc7bmwDWt2bby9e882HgVfRIMISFgNQGOqUB9UNWoeUFJ3fV3Su%2BAd1eFW%2BV%2Blx5z5kjT%2FdUP08y7Dh7m8XIhr14Jaw8%2FonrWYdylcZCJAE%2BxnbtYdmO6cwsz9Ab8zvTJHgYJ1nJtTqAf2SjHePTvM128VE4OrX%2BBw%2FDd0gq%2BGkiPUBZU7FmuV0hsDcth5EHKfoVsXHaiecivA3HxssBDgPgp8XTlvENogFOxLzQ6vt31gwoNXJIa8DUEVavR8LJ&X-Amz-Signature=2d673f55cc862174d22f68e36bac6ea997997ecb55a2a7de9ff6ed12c68ff405&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667OFU5YGB%2F20260815%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260815T061846Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEYaCXVzLXdlc3QtMiJHMEUCIQDztplj7Ac81vDELnr9R1Ur1A2RjNAL6TUVJhC828xmDgIgfH6KCR8XQ%2FMIYyGjHPNVDk%2FgAl3f680Ak23XULPocdcq%2FwMIDxAAGgw2Mzc0MjMxODM4MDUiDFdyfoONtgKR8jQa%2BircAxcYtljLV436mqMzmaL1kLzEycifBaS%2Fr5w1%2FTiFZ2HNUcR4B0QZwB711JAZ2fpNvq%2FAeGxhM6tx%2FfH1sHSwy3Iy%2B9%2FjBOvKZHXPf8HdqGqMM6kl%2Fr5nBL0HDgEPojAKY4Ki%2FeO0lHeCn%2FlVbz%2BYMtNfkUq6fR%2BIejL4oVobMOuhRujob%2BGswfsa4QYuSeWmOpBabJ2fTwafMd%2F%2F3KGZaRIrAeIoCNwE0yP87Nwc0dtfYsBagvlGZLoBcUhdWyN16sFaCp7wRjXs4W88mVf%2FGoySDFsWXOC1lsgEw0lTiqK3DPHMRxO4WGgkSJ4ZAxkyofjuxfsj4mcUqyL9E6sELR74w3Jq%2BjSXHM3AB3vtrLiTEFRKMGTvmED9UZT9ABWllz0%2F89qZLh0Rw%2B%2BqL7qKNmqY1ggv5tca%2BTFFkTtbo5Y9KrUnrZ2nB4ebljYrISFZIXvnZwOx%2BH%2BJxSbAxS7wDGHaYmhdMIV%2FXmrs7QbNQ3mQXuqDATfB82iBOsBZveMglJsuhbL63PZ4C9Pu2q9nMExLTiv531Vas8EE6xmpKMlsuLnM%2BTs5r4%2FQMhaBEqdqqSQzcoFA5Si4JDhT%2B5uDOEpaeNqPZTKqvJgSxc7bmwDWt2bby9e882HgVfRIMISFgNQGOqUB9UNWoeUFJ3fV3Su%2BAd1eFW%2BV%2Blx5z5kjT%2FdUP08y7Dh7m8XIhr14Jaw8%2FonrWYdylcZCJAE%2BxnbtYdmO6cwsz9Ab8zvTJHgYJ1nJtTqAf2SjHePTvM128VE4OrX%2BBw%2FDd0gq%2BGkiPUBZU7FmuV0hsDcth5EHKfoVsXHaiecivA3HxssBDgPgp8XTlvENogFOxLzQ6vt31gwoNXJIa8DUEVavR8LJ&X-Amz-Signature=cda14e4a862d94d70506b9e05d7f6a2be615ecb429a0022937a627c5327b4693&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
