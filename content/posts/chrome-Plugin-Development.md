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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RHMHBXCQ%2F20260806%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260806T012638Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGkaCXVzLXdlc3QtMiJIMEYCIQCVonMP5BygkMSaAG21yfSF%2BuN9%2Bbzk6W6K9NT8tPScGgIhANzZtAJAaY2GLX8icpmjFN5O4LjMwzHiPq5JSqh2v6jlKv8DCDEQABoMNjM3NDIzMTgzODA1Igzo11h4S7WqW7M6aYwq3APi3h0a%2BKack8RmVO%2BJeyQY%2FNEbdiS12GGCxlh8bK%2B6FGt558TvZ7kIBYDEpwe4N3eyZiphRs1Z3pxl2X00jbcZNKNqnj6CbnwgYkNR7HJ59%2BeUelH2mzEars%2F5G0HqgiYH0kcEtUMPBS%2BH9%2B912C0hQyFwFxDY067QrwLECpZC8uE2E%2BnDLolTuQIERuqj9ybLHEXJv0XDazMj0nn%2BKNXuAcf7pDXbzPGUICzcxEj4MAobUXI8wc34D%2FjHx7srr%2BKRHzyEzyZ4mN9UBdm58XYsfZu18HqodKBiIXvDXsnwC07W4H0CSA6vBAYEe0CDISLZqNoyow4yS8eO%2BJL6Gwy%2FmaOOFWW31qWSfYGAnPBVq%2BcmUtOzWdlbAvUOLW2f%2Ff83DRGdVr91YQydbJCVfc2LCJi34ZnXzCZHd7vZW%2BvCvDqUeh5bmcC9LGvhVRKlMD7DvEwXq3O%2FqsZy%2FODciChgUMO1AWi1fZTVHxgC3mka4B3EmFnG%2FWDGSMh7UNBPY8OoWSnLmt28L9dkbRsrI5APDSRpI%2FwIC%2FmLonjl6fvf0%2F7uNQg5xCYrZnFg0QTgsXpPCaW7Qz%2FpeWmK3X42XKaeqDk3fdFvCovh8Tvv%2BheiMxrg50UDhu0WyzR3zzDIqM%2FTBjqkAc55ldFbPy%2FSCHiAHmMijTGCne5pYiz0GcKxHJ3M6CeBB1xhfnEqUBu0S%2FH37dtA8%2BRyk1KIk8lV3TGe6ekO9tshikLvhC%2Ba85uJoivWt1%2FU8nbW%2BJbyRe%2FQppvdwKwHVzp77e1rCayC9xxrvbc4YSXpDDptyKIuUQ29gF%2BpvdpPzsdftbwfloh0Eb70aKHXWNo7rmUujQmHVKUODu%2B%2FwWutqsvw&X-Amz-Signature=c0b4c42cf3fe9b184e3157b51d7af2619a0b7b298af21712a40a8247a08c60da&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RHMHBXCQ%2F20260806%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260806T012638Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGkaCXVzLXdlc3QtMiJIMEYCIQCVonMP5BygkMSaAG21yfSF%2BuN9%2Bbzk6W6K9NT8tPScGgIhANzZtAJAaY2GLX8icpmjFN5O4LjMwzHiPq5JSqh2v6jlKv8DCDEQABoMNjM3NDIzMTgzODA1Igzo11h4S7WqW7M6aYwq3APi3h0a%2BKack8RmVO%2BJeyQY%2FNEbdiS12GGCxlh8bK%2B6FGt558TvZ7kIBYDEpwe4N3eyZiphRs1Z3pxl2X00jbcZNKNqnj6CbnwgYkNR7HJ59%2BeUelH2mzEars%2F5G0HqgiYH0kcEtUMPBS%2BH9%2B912C0hQyFwFxDY067QrwLECpZC8uE2E%2BnDLolTuQIERuqj9ybLHEXJv0XDazMj0nn%2BKNXuAcf7pDXbzPGUICzcxEj4MAobUXI8wc34D%2FjHx7srr%2BKRHzyEzyZ4mN9UBdm58XYsfZu18HqodKBiIXvDXsnwC07W4H0CSA6vBAYEe0CDISLZqNoyow4yS8eO%2BJL6Gwy%2FmaOOFWW31qWSfYGAnPBVq%2BcmUtOzWdlbAvUOLW2f%2Ff83DRGdVr91YQydbJCVfc2LCJi34ZnXzCZHd7vZW%2BvCvDqUeh5bmcC9LGvhVRKlMD7DvEwXq3O%2FqsZy%2FODciChgUMO1AWi1fZTVHxgC3mka4B3EmFnG%2FWDGSMh7UNBPY8OoWSnLmt28L9dkbRsrI5APDSRpI%2FwIC%2FmLonjl6fvf0%2F7uNQg5xCYrZnFg0QTgsXpPCaW7Qz%2FpeWmK3X42XKaeqDk3fdFvCovh8Tvv%2BheiMxrg50UDhu0WyzR3zzDIqM%2FTBjqkAc55ldFbPy%2FSCHiAHmMijTGCne5pYiz0GcKxHJ3M6CeBB1xhfnEqUBu0S%2FH37dtA8%2BRyk1KIk8lV3TGe6ekO9tshikLvhC%2Ba85uJoivWt1%2FU8nbW%2BJbyRe%2FQppvdwKwHVzp77e1rCayC9xxrvbc4YSXpDDptyKIuUQ29gF%2BpvdpPzsdftbwfloh0Eb70aKHXWNo7rmUujQmHVKUODu%2B%2FwWutqsvw&X-Amz-Signature=addee5248bcc943f46c85c48dc6ab6ae22ae10b041c13deb151ce19026fb0d89&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RHMHBXCQ%2F20260806%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260806T012638Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGkaCXVzLXdlc3QtMiJIMEYCIQCVonMP5BygkMSaAG21yfSF%2BuN9%2Bbzk6W6K9NT8tPScGgIhANzZtAJAaY2GLX8icpmjFN5O4LjMwzHiPq5JSqh2v6jlKv8DCDEQABoMNjM3NDIzMTgzODA1Igzo11h4S7WqW7M6aYwq3APi3h0a%2BKack8RmVO%2BJeyQY%2FNEbdiS12GGCxlh8bK%2B6FGt558TvZ7kIBYDEpwe4N3eyZiphRs1Z3pxl2X00jbcZNKNqnj6CbnwgYkNR7HJ59%2BeUelH2mzEars%2F5G0HqgiYH0kcEtUMPBS%2BH9%2B912C0hQyFwFxDY067QrwLECpZC8uE2E%2BnDLolTuQIERuqj9ybLHEXJv0XDazMj0nn%2BKNXuAcf7pDXbzPGUICzcxEj4MAobUXI8wc34D%2FjHx7srr%2BKRHzyEzyZ4mN9UBdm58XYsfZu18HqodKBiIXvDXsnwC07W4H0CSA6vBAYEe0CDISLZqNoyow4yS8eO%2BJL6Gwy%2FmaOOFWW31qWSfYGAnPBVq%2BcmUtOzWdlbAvUOLW2f%2Ff83DRGdVr91YQydbJCVfc2LCJi34ZnXzCZHd7vZW%2BvCvDqUeh5bmcC9LGvhVRKlMD7DvEwXq3O%2FqsZy%2FODciChgUMO1AWi1fZTVHxgC3mka4B3EmFnG%2FWDGSMh7UNBPY8OoWSnLmt28L9dkbRsrI5APDSRpI%2FwIC%2FmLonjl6fvf0%2F7uNQg5xCYrZnFg0QTgsXpPCaW7Qz%2FpeWmK3X42XKaeqDk3fdFvCovh8Tvv%2BheiMxrg50UDhu0WyzR3zzDIqM%2FTBjqkAc55ldFbPy%2FSCHiAHmMijTGCne5pYiz0GcKxHJ3M6CeBB1xhfnEqUBu0S%2FH37dtA8%2BRyk1KIk8lV3TGe6ekO9tshikLvhC%2Ba85uJoivWt1%2FU8nbW%2BJbyRe%2FQppvdwKwHVzp77e1rCayC9xxrvbc4YSXpDDptyKIuUQ29gF%2BpvdpPzsdftbwfloh0Eb70aKHXWNo7rmUujQmHVKUODu%2B%2FwWutqsvw&X-Amz-Signature=3c853e9e1b522bf3894df649fb1c3019e6101c126c3f126509debcb484c9e3cc&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RHMHBXCQ%2F20260806%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260806T012638Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGkaCXVzLXdlc3QtMiJIMEYCIQCVonMP5BygkMSaAG21yfSF%2BuN9%2Bbzk6W6K9NT8tPScGgIhANzZtAJAaY2GLX8icpmjFN5O4LjMwzHiPq5JSqh2v6jlKv8DCDEQABoMNjM3NDIzMTgzODA1Igzo11h4S7WqW7M6aYwq3APi3h0a%2BKack8RmVO%2BJeyQY%2FNEbdiS12GGCxlh8bK%2B6FGt558TvZ7kIBYDEpwe4N3eyZiphRs1Z3pxl2X00jbcZNKNqnj6CbnwgYkNR7HJ59%2BeUelH2mzEars%2F5G0HqgiYH0kcEtUMPBS%2BH9%2B912C0hQyFwFxDY067QrwLECpZC8uE2E%2BnDLolTuQIERuqj9ybLHEXJv0XDazMj0nn%2BKNXuAcf7pDXbzPGUICzcxEj4MAobUXI8wc34D%2FjHx7srr%2BKRHzyEzyZ4mN9UBdm58XYsfZu18HqodKBiIXvDXsnwC07W4H0CSA6vBAYEe0CDISLZqNoyow4yS8eO%2BJL6Gwy%2FmaOOFWW31qWSfYGAnPBVq%2BcmUtOzWdlbAvUOLW2f%2Ff83DRGdVr91YQydbJCVfc2LCJi34ZnXzCZHd7vZW%2BvCvDqUeh5bmcC9LGvhVRKlMD7DvEwXq3O%2FqsZy%2FODciChgUMO1AWi1fZTVHxgC3mka4B3EmFnG%2FWDGSMh7UNBPY8OoWSnLmt28L9dkbRsrI5APDSRpI%2FwIC%2FmLonjl6fvf0%2F7uNQg5xCYrZnFg0QTgsXpPCaW7Qz%2FpeWmK3X42XKaeqDk3fdFvCovh8Tvv%2BheiMxrg50UDhu0WyzR3zzDIqM%2FTBjqkAc55ldFbPy%2FSCHiAHmMijTGCne5pYiz0GcKxHJ3M6CeBB1xhfnEqUBu0S%2FH37dtA8%2BRyk1KIk8lV3TGe6ekO9tshikLvhC%2Ba85uJoivWt1%2FU8nbW%2BJbyRe%2FQppvdwKwHVzp77e1rCayC9xxrvbc4YSXpDDptyKIuUQ29gF%2BpvdpPzsdftbwfloh0Eb70aKHXWNo7rmUujQmHVKUODu%2B%2FwWutqsvw&X-Amz-Signature=0560d18fe3b70b83f7a159c3daa773be50959e600a1cf31710bb368bd54ae848&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
