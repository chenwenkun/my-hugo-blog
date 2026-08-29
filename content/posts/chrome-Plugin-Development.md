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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466254QO3WK%2F20260829%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260829T115550Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIBZ0tITZHjgOWRqAXwOXboUPrNa7XnE0xri0E3J1TmZ3AiBSAY%2BVYtI0%2FMxTmrql5Q2cgud0721bQp%2BJZAkVkfnP3ir%2FAwhkEAAaDDYzNzQyMzE4MzgwNSIMAGgF2eSfvIH9m3%2FUKtwDlyeFUDeMuvPJu1gODoBfdxLxcJIDDTxS1%2BzAX85uugDh%2BmkpaQG9ug8NkLb2AEqZ1BtU1LNowL%2FNDmqWxYDxaqckti680yAbO%2FMXrrw0vwsiSrvydwM3KU665hDcd1md00vBByfV2wGLTWnui950ZJD7%2F%2BCir%2BdxBVc%2FZI%2BLunnzJhajPswCRPMmQwTCjEOzc0JXQKTUxWWEQ9o%2FmNW9LCsljHidlfOLgbwEHuzhdYm2jw1vdjHwlYQZ26r%2Fns6rrNlcoLOreeqWF%2BBHb05R%2FXcxzXPJYtd7LztlY313FrvMvGPNCE9FC%2FCbGiBaEF53lJ6Jo2ytjGFVp1ue4ymbJ%2BR%2FBik0wZ9oqMPp15ANcHeIrwXB%2B56%2BK%2F2%2FmZRYeGfLyZFZuL%2BzUsyUdXmlS3Ov0loE6qgENa1%2FpqWNsuUlck5pTIstyroAuAmvowvMD5C0%2FXmsAIljT6e4XbKqftaYGimKfL1ItGxgN2%2BChTzm5vZxeE8MwJUxrybmGMDDRecxUvcbnW7j%2BbAlFGSWFAuCcPVAUbmwdaerxVLRPHSZz2H2oLdDJut0wJ%2FzvER42s0YGUrQyKJm10Fzn8XLwj3o6bOMvE%2FHCxmXTlV%2Fj3vnWpHmH5LY0QKpraCmc7QwovvK1AY6pgGmb%2B7SeKM6WV9IJPa1wUuA6N4oKo91EG4rUo9bviTSenm83%2FLc3WhARt0XNXIJDJeETfV5UzkwG5qI%2BvgXBeIXCkB2AzTdw2xn8h1PUDpbj630fH0ycKpaQlyLbClFn3ZTl2adXeBZNKUDzzciwzei3VqOA2Gu5ESGyVNvc6VuJ2D9e1%2BQYW6F2%2F%2Blqqc6X1PXjhOt6o4unGnqsNKcxmBASwTcsXVI&X-Amz-Signature=94f7ce45c6e23d97440e9c4267e944776d1215265d5b711f9a9f1fb6d6fd4e91&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466254QO3WK%2F20260829%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260829T115550Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIBZ0tITZHjgOWRqAXwOXboUPrNa7XnE0xri0E3J1TmZ3AiBSAY%2BVYtI0%2FMxTmrql5Q2cgud0721bQp%2BJZAkVkfnP3ir%2FAwhkEAAaDDYzNzQyMzE4MzgwNSIMAGgF2eSfvIH9m3%2FUKtwDlyeFUDeMuvPJu1gODoBfdxLxcJIDDTxS1%2BzAX85uugDh%2BmkpaQG9ug8NkLb2AEqZ1BtU1LNowL%2FNDmqWxYDxaqckti680yAbO%2FMXrrw0vwsiSrvydwM3KU665hDcd1md00vBByfV2wGLTWnui950ZJD7%2F%2BCir%2BdxBVc%2FZI%2BLunnzJhajPswCRPMmQwTCjEOzc0JXQKTUxWWEQ9o%2FmNW9LCsljHidlfOLgbwEHuzhdYm2jw1vdjHwlYQZ26r%2Fns6rrNlcoLOreeqWF%2BBHb05R%2FXcxzXPJYtd7LztlY313FrvMvGPNCE9FC%2FCbGiBaEF53lJ6Jo2ytjGFVp1ue4ymbJ%2BR%2FBik0wZ9oqMPp15ANcHeIrwXB%2B56%2BK%2F2%2FmZRYeGfLyZFZuL%2BzUsyUdXmlS3Ov0loE6qgENa1%2FpqWNsuUlck5pTIstyroAuAmvowvMD5C0%2FXmsAIljT6e4XbKqftaYGimKfL1ItGxgN2%2BChTzm5vZxeE8MwJUxrybmGMDDRecxUvcbnW7j%2BbAlFGSWFAuCcPVAUbmwdaerxVLRPHSZz2H2oLdDJut0wJ%2FzvER42s0YGUrQyKJm10Fzn8XLwj3o6bOMvE%2FHCxmXTlV%2Fj3vnWpHmH5LY0QKpraCmc7QwovvK1AY6pgGmb%2B7SeKM6WV9IJPa1wUuA6N4oKo91EG4rUo9bviTSenm83%2FLc3WhARt0XNXIJDJeETfV5UzkwG5qI%2BvgXBeIXCkB2AzTdw2xn8h1PUDpbj630fH0ycKpaQlyLbClFn3ZTl2adXeBZNKUDzzciwzei3VqOA2Gu5ESGyVNvc6VuJ2D9e1%2BQYW6F2%2F%2Blqqc6X1PXjhOt6o4unGnqsNKcxmBASwTcsXVI&X-Amz-Signature=c506e664d603addf10ac30d62bbe92d7da1eb765f78f337a964a2c180bc627d8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466254QO3WK%2F20260829%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260829T115550Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIBZ0tITZHjgOWRqAXwOXboUPrNa7XnE0xri0E3J1TmZ3AiBSAY%2BVYtI0%2FMxTmrql5Q2cgud0721bQp%2BJZAkVkfnP3ir%2FAwhkEAAaDDYzNzQyMzE4MzgwNSIMAGgF2eSfvIH9m3%2FUKtwDlyeFUDeMuvPJu1gODoBfdxLxcJIDDTxS1%2BzAX85uugDh%2BmkpaQG9ug8NkLb2AEqZ1BtU1LNowL%2FNDmqWxYDxaqckti680yAbO%2FMXrrw0vwsiSrvydwM3KU665hDcd1md00vBByfV2wGLTWnui950ZJD7%2F%2BCir%2BdxBVc%2FZI%2BLunnzJhajPswCRPMmQwTCjEOzc0JXQKTUxWWEQ9o%2FmNW9LCsljHidlfOLgbwEHuzhdYm2jw1vdjHwlYQZ26r%2Fns6rrNlcoLOreeqWF%2BBHb05R%2FXcxzXPJYtd7LztlY313FrvMvGPNCE9FC%2FCbGiBaEF53lJ6Jo2ytjGFVp1ue4ymbJ%2BR%2FBik0wZ9oqMPp15ANcHeIrwXB%2B56%2BK%2F2%2FmZRYeGfLyZFZuL%2BzUsyUdXmlS3Ov0loE6qgENa1%2FpqWNsuUlck5pTIstyroAuAmvowvMD5C0%2FXmsAIljT6e4XbKqftaYGimKfL1ItGxgN2%2BChTzm5vZxeE8MwJUxrybmGMDDRecxUvcbnW7j%2BbAlFGSWFAuCcPVAUbmwdaerxVLRPHSZz2H2oLdDJut0wJ%2FzvER42s0YGUrQyKJm10Fzn8XLwj3o6bOMvE%2FHCxmXTlV%2Fj3vnWpHmH5LY0QKpraCmc7QwovvK1AY6pgGmb%2B7SeKM6WV9IJPa1wUuA6N4oKo91EG4rUo9bviTSenm83%2FLc3WhARt0XNXIJDJeETfV5UzkwG5qI%2BvgXBeIXCkB2AzTdw2xn8h1PUDpbj630fH0ycKpaQlyLbClFn3ZTl2adXeBZNKUDzzciwzei3VqOA2Gu5ESGyVNvc6VuJ2D9e1%2BQYW6F2%2F%2Blqqc6X1PXjhOt6o4unGnqsNKcxmBASwTcsXVI&X-Amz-Signature=9fc93daeb534baab79daa4876e508b6f2ddf9189c9f75f5b34b403efc1f4814b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466254QO3WK%2F20260829%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260829T115550Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIBZ0tITZHjgOWRqAXwOXboUPrNa7XnE0xri0E3J1TmZ3AiBSAY%2BVYtI0%2FMxTmrql5Q2cgud0721bQp%2BJZAkVkfnP3ir%2FAwhkEAAaDDYzNzQyMzE4MzgwNSIMAGgF2eSfvIH9m3%2FUKtwDlyeFUDeMuvPJu1gODoBfdxLxcJIDDTxS1%2BzAX85uugDh%2BmkpaQG9ug8NkLb2AEqZ1BtU1LNowL%2FNDmqWxYDxaqckti680yAbO%2FMXrrw0vwsiSrvydwM3KU665hDcd1md00vBByfV2wGLTWnui950ZJD7%2F%2BCir%2BdxBVc%2FZI%2BLunnzJhajPswCRPMmQwTCjEOzc0JXQKTUxWWEQ9o%2FmNW9LCsljHidlfOLgbwEHuzhdYm2jw1vdjHwlYQZ26r%2Fns6rrNlcoLOreeqWF%2BBHb05R%2FXcxzXPJYtd7LztlY313FrvMvGPNCE9FC%2FCbGiBaEF53lJ6Jo2ytjGFVp1ue4ymbJ%2BR%2FBik0wZ9oqMPp15ANcHeIrwXB%2B56%2BK%2F2%2FmZRYeGfLyZFZuL%2BzUsyUdXmlS3Ov0loE6qgENa1%2FpqWNsuUlck5pTIstyroAuAmvowvMD5C0%2FXmsAIljT6e4XbKqftaYGimKfL1ItGxgN2%2BChTzm5vZxeE8MwJUxrybmGMDDRecxUvcbnW7j%2BbAlFGSWFAuCcPVAUbmwdaerxVLRPHSZz2H2oLdDJut0wJ%2FzvER42s0YGUrQyKJm10Fzn8XLwj3o6bOMvE%2FHCxmXTlV%2Fj3vnWpHmH5LY0QKpraCmc7QwovvK1AY6pgGmb%2B7SeKM6WV9IJPa1wUuA6N4oKo91EG4rUo9bviTSenm83%2FLc3WhARt0XNXIJDJeETfV5UzkwG5qI%2BvgXBeIXCkB2AzTdw2xn8h1PUDpbj630fH0ycKpaQlyLbClFn3ZTl2adXeBZNKUDzzciwzei3VqOA2Gu5ESGyVNvc6VuJ2D9e1%2BQYW6F2%2F%2Blqqc6X1PXjhOt6o4unGnqsNKcxmBASwTcsXVI&X-Amz-Signature=ab0005656c7b90ffbe859c02fd253432370bbd6e8d2f1dadc4c05fa06ce83f98&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
