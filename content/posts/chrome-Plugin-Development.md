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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QOPYUCOR%2F20261012%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261012T135000Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCBUdSVCEjKSqtnABcgRu%2FMaXeHqTq5AAefnh%2FQGUHDaAIgYfAsUekwcDNj6AQM3LdmxdhfSIcqj0QIYbaJap%2Fg6JAqiAQIhv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNG%2FAOIecSxY8W4JZSrcA5911Q9TYSln94MZb8WxBGE3yhiu4XiwGRnkbXCXT1m%2FQ%2Bcsnpbxt1cp590X2jUOYChDenyX6p6XNumx93OmIflp2nw%2BLWxmHiypKuazs4qXK2Cv7YKzPdvHn1bD7YvaOCBU5JXGLz6P%2BorR%2F%2BKJCr9gCYywEkWG30uGRKSlwvtqfNECs0CrMhqMCGh%2FqJpu9%2BXiyyVjChqWljosk3dg7mVMx29QdLRXi8fM6NkgKtD70DchZrMf9iChxKfc3s07Xa5962AN%2Fu8C3J%2BLJjntsHaEpe5t%2BJ3c%2FnZX49HH6Yi0MA8QPYc04m%2FcGWmyR6ErEyCDRqs6dyb7NdpQbet08okDaY0IQDf3SD%2F3Y54FviUQDWgG9IpaWmIPZR2hhI1B%2FKtBb2sXl0mcJ3%2FrshViZp8%2Fj9wEFkFuOTuPvIVI1w4ovYn4fTMgV3%2FlSch0pYNCvlA%2Bkv39YHJbxi40Fyth0i0KR2oOjI4r7XOG3DUVQcG%2BA3iGaxNqZJWM8l0OBaZh%2BUpt%2BZe7UbUOD62iJvDosL78sUfzxguk6pwVoI4tyCVqkzlQd8d77dRmkXkZol6ES%2Fp6Ic0PAmjy%2F7FkcCfo53QLqQDt2HSfYlYq4Rk0NR1kTFbLFkDZYydP20tRMNGks9YGOqUBgCQr%2F9oHTjT8HeJyE%2FxMn6yBXDxixS%2B5LEQ9ry63nTbByWvnHzAajbd58nijM2MCw87Zt6Uju99vEmb2osDH60%2FS0yD8dz2qmx1DVHasD8sPjJ8Fs6y6pMZ537TK8q3Gr174lusFQ7OFhchkPb%2FIJzcUhXRXSkPoOnAAySkBOmPeUMguZ0DBpUuTZBKtw%2FdwJzgWDJU3tXF0pkNqWop23Wjo%2BvLL&X-Amz-Signature=ba1ef7c572906db3984115b6b10c95b7ed37f13337265e6d0741d2f0c7dc8c41&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QOPYUCOR%2F20261012%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261012T135000Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCBUdSVCEjKSqtnABcgRu%2FMaXeHqTq5AAefnh%2FQGUHDaAIgYfAsUekwcDNj6AQM3LdmxdhfSIcqj0QIYbaJap%2Fg6JAqiAQIhv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNG%2FAOIecSxY8W4JZSrcA5911Q9TYSln94MZb8WxBGE3yhiu4XiwGRnkbXCXT1m%2FQ%2Bcsnpbxt1cp590X2jUOYChDenyX6p6XNumx93OmIflp2nw%2BLWxmHiypKuazs4qXK2Cv7YKzPdvHn1bD7YvaOCBU5JXGLz6P%2BorR%2F%2BKJCr9gCYywEkWG30uGRKSlwvtqfNECs0CrMhqMCGh%2FqJpu9%2BXiyyVjChqWljosk3dg7mVMx29QdLRXi8fM6NkgKtD70DchZrMf9iChxKfc3s07Xa5962AN%2Fu8C3J%2BLJjntsHaEpe5t%2BJ3c%2FnZX49HH6Yi0MA8QPYc04m%2FcGWmyR6ErEyCDRqs6dyb7NdpQbet08okDaY0IQDf3SD%2F3Y54FviUQDWgG9IpaWmIPZR2hhI1B%2FKtBb2sXl0mcJ3%2FrshViZp8%2Fj9wEFkFuOTuPvIVI1w4ovYn4fTMgV3%2FlSch0pYNCvlA%2Bkv39YHJbxi40Fyth0i0KR2oOjI4r7XOG3DUVQcG%2BA3iGaxNqZJWM8l0OBaZh%2BUpt%2BZe7UbUOD62iJvDosL78sUfzxguk6pwVoI4tyCVqkzlQd8d77dRmkXkZol6ES%2Fp6Ic0PAmjy%2F7FkcCfo53QLqQDt2HSfYlYq4Rk0NR1kTFbLFkDZYydP20tRMNGks9YGOqUBgCQr%2F9oHTjT8HeJyE%2FxMn6yBXDxixS%2B5LEQ9ry63nTbByWvnHzAajbd58nijM2MCw87Zt6Uju99vEmb2osDH60%2FS0yD8dz2qmx1DVHasD8sPjJ8Fs6y6pMZ537TK8q3Gr174lusFQ7OFhchkPb%2FIJzcUhXRXSkPoOnAAySkBOmPeUMguZ0DBpUuTZBKtw%2FdwJzgWDJU3tXF0pkNqWop23Wjo%2BvLL&X-Amz-Signature=d082d04fe5b0e12cdd356cb1aed87dc47b9ba4a286977e2331e4007b56827228&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QOPYUCOR%2F20261012%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261012T135000Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCBUdSVCEjKSqtnABcgRu%2FMaXeHqTq5AAefnh%2FQGUHDaAIgYfAsUekwcDNj6AQM3LdmxdhfSIcqj0QIYbaJap%2Fg6JAqiAQIhv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNG%2FAOIecSxY8W4JZSrcA5911Q9TYSln94MZb8WxBGE3yhiu4XiwGRnkbXCXT1m%2FQ%2Bcsnpbxt1cp590X2jUOYChDenyX6p6XNumx93OmIflp2nw%2BLWxmHiypKuazs4qXK2Cv7YKzPdvHn1bD7YvaOCBU5JXGLz6P%2BorR%2F%2BKJCr9gCYywEkWG30uGRKSlwvtqfNECs0CrMhqMCGh%2FqJpu9%2BXiyyVjChqWljosk3dg7mVMx29QdLRXi8fM6NkgKtD70DchZrMf9iChxKfc3s07Xa5962AN%2Fu8C3J%2BLJjntsHaEpe5t%2BJ3c%2FnZX49HH6Yi0MA8QPYc04m%2FcGWmyR6ErEyCDRqs6dyb7NdpQbet08okDaY0IQDf3SD%2F3Y54FviUQDWgG9IpaWmIPZR2hhI1B%2FKtBb2sXl0mcJ3%2FrshViZp8%2Fj9wEFkFuOTuPvIVI1w4ovYn4fTMgV3%2FlSch0pYNCvlA%2Bkv39YHJbxi40Fyth0i0KR2oOjI4r7XOG3DUVQcG%2BA3iGaxNqZJWM8l0OBaZh%2BUpt%2BZe7UbUOD62iJvDosL78sUfzxguk6pwVoI4tyCVqkzlQd8d77dRmkXkZol6ES%2Fp6Ic0PAmjy%2F7FkcCfo53QLqQDt2HSfYlYq4Rk0NR1kTFbLFkDZYydP20tRMNGks9YGOqUBgCQr%2F9oHTjT8HeJyE%2FxMn6yBXDxixS%2B5LEQ9ry63nTbByWvnHzAajbd58nijM2MCw87Zt6Uju99vEmb2osDH60%2FS0yD8dz2qmx1DVHasD8sPjJ8Fs6y6pMZ537TK8q3Gr174lusFQ7OFhchkPb%2FIJzcUhXRXSkPoOnAAySkBOmPeUMguZ0DBpUuTZBKtw%2FdwJzgWDJU3tXF0pkNqWop23Wjo%2BvLL&X-Amz-Signature=a41af6d9a65b30a1a8e32827a0e2c8f8c2fa4bb54d7b737ee0c1ff7e8095950c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QOPYUCOR%2F20261012%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261012T135000Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCBUdSVCEjKSqtnABcgRu%2FMaXeHqTq5AAefnh%2FQGUHDaAIgYfAsUekwcDNj6AQM3LdmxdhfSIcqj0QIYbaJap%2Fg6JAqiAQIhv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNG%2FAOIecSxY8W4JZSrcA5911Q9TYSln94MZb8WxBGE3yhiu4XiwGRnkbXCXT1m%2FQ%2Bcsnpbxt1cp590X2jUOYChDenyX6p6XNumx93OmIflp2nw%2BLWxmHiypKuazs4qXK2Cv7YKzPdvHn1bD7YvaOCBU5JXGLz6P%2BorR%2F%2BKJCr9gCYywEkWG30uGRKSlwvtqfNECs0CrMhqMCGh%2FqJpu9%2BXiyyVjChqWljosk3dg7mVMx29QdLRXi8fM6NkgKtD70DchZrMf9iChxKfc3s07Xa5962AN%2Fu8C3J%2BLJjntsHaEpe5t%2BJ3c%2FnZX49HH6Yi0MA8QPYc04m%2FcGWmyR6ErEyCDRqs6dyb7NdpQbet08okDaY0IQDf3SD%2F3Y54FviUQDWgG9IpaWmIPZR2hhI1B%2FKtBb2sXl0mcJ3%2FrshViZp8%2Fj9wEFkFuOTuPvIVI1w4ovYn4fTMgV3%2FlSch0pYNCvlA%2Bkv39YHJbxi40Fyth0i0KR2oOjI4r7XOG3DUVQcG%2BA3iGaxNqZJWM8l0OBaZh%2BUpt%2BZe7UbUOD62iJvDosL78sUfzxguk6pwVoI4tyCVqkzlQd8d77dRmkXkZol6ES%2Fp6Ic0PAmjy%2F7FkcCfo53QLqQDt2HSfYlYq4Rk0NR1kTFbLFkDZYydP20tRMNGks9YGOqUBgCQr%2F9oHTjT8HeJyE%2FxMn6yBXDxixS%2B5LEQ9ry63nTbByWvnHzAajbd58nijM2MCw87Zt6Uju99vEmb2osDH60%2FS0yD8dz2qmx1DVHasD8sPjJ8Fs6y6pMZ537TK8q3Gr174lusFQ7OFhchkPb%2FIJzcUhXRXSkPoOnAAySkBOmPeUMguZ0DBpUuTZBKtw%2FdwJzgWDJU3tXF0pkNqWop23Wjo%2BvLL&X-Amz-Signature=c5f2e9845b1be6aefdac8cd68a0096bb9722966059da95cda4fe9d13be1efd72&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
