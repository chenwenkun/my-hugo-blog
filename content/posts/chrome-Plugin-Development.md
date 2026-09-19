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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UML7FK5A%2F20260919%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260919T145957Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFL3XwLfNhcqynknfJ8nEh0ZmA7IA0F3un%2BrgaJFdnp5AiEAw1dnVV%2Be0BojoKpVYPZjuqO2BRW7NodQX243TbZWTIcq%2FwMIXhAAGgw2Mzc0MjMxODM4MDUiDKpleeg%2FbOYiUa31pSrcAxQ2idGjBVU7mE7UyRUFvVmbONHD6hjcE4hDI52LlcNkvp57%2Bl5r%2F2nxQNJrcXj5EFi3w7zloahAcB3bGJe8qRuAx8Yl4Wit59YMuvacdeyN7FQrM%2FOUaY5j6o4kyWnVGdL%2BFeVSXsgE1glxNQFFdKB20LdCLG37YHbcEavknkkHzCZy4g0bvo%2Bl%2BlY%2Fz457fsPsQfJbyTw5S7C0TMzsGJzXhgwrVnGLEG4pMbjzh%2FDGOJZP1NYb3hLGp4wMeeVSr%2B0dMp%2BxGsE%2FvzYUdui5GUdbpK%2BLhlTyciDEAy7kiEwkjl%2B0Tlp5kRzWUXUebwycIH6ICOirtshmLD8wFMWb%2BV8Csf1JHxzk11Y7hUkpYz0CKCGbRW%2BxuIHxsWU7PQFYD5FaeB34voT%2Fbd1wA6Z169IuHReUzB6Fu6U7watwoiNiAgKm88KUBSVmcZTd0Fx4K81jTf13Th8iMsgKMAhhm7HC88QBK6f62umPSxx7E2IU22QZ68O34UVA%2FZLHWfR%2BFD1P3qcQt7%2F4IXEzsB7Yz%2FfLHdcC2wM4BW68tz77Gw33vVFiGNb0i77P8M0LHwi8unCS%2BH7GtSx5HkIPXAYkrFarMXMoetTKIWTyjj43j2T8YTqLTrK0QF0afImGMK%2BOutUGOqUBfocw4%2F4Ha0YHpBhqTydYZ8oonRCTAkxnwRvdhM1GQ3kinVifJueyY4C5karZ%2B20l%2BkSEB6GUpBKtAfAzFdtxiTqDixUsb0iV1lwHFQoOk3PTU6A%2BzhQjQ5UTl%2FkqT8xdKppqJPp2Q96Xp1ZyXeJBihzEtSEa41TyeYBwbrFki%2BGKAMd9sXxvyiHAYVB5b%2FSt5xyWJt1G2d0cwTjiOzzhVrlr9HyP&X-Amz-Signature=537ecdcfe32552bfc3e11f09aa18fde1e3d40ed04e4711ab860d07ef6d7b9230&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UML7FK5A%2F20260919%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260919T145957Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFL3XwLfNhcqynknfJ8nEh0ZmA7IA0F3un%2BrgaJFdnp5AiEAw1dnVV%2Be0BojoKpVYPZjuqO2BRW7NodQX243TbZWTIcq%2FwMIXhAAGgw2Mzc0MjMxODM4MDUiDKpleeg%2FbOYiUa31pSrcAxQ2idGjBVU7mE7UyRUFvVmbONHD6hjcE4hDI52LlcNkvp57%2Bl5r%2F2nxQNJrcXj5EFi3w7zloahAcB3bGJe8qRuAx8Yl4Wit59YMuvacdeyN7FQrM%2FOUaY5j6o4kyWnVGdL%2BFeVSXsgE1glxNQFFdKB20LdCLG37YHbcEavknkkHzCZy4g0bvo%2Bl%2BlY%2Fz457fsPsQfJbyTw5S7C0TMzsGJzXhgwrVnGLEG4pMbjzh%2FDGOJZP1NYb3hLGp4wMeeVSr%2B0dMp%2BxGsE%2FvzYUdui5GUdbpK%2BLhlTyciDEAy7kiEwkjl%2B0Tlp5kRzWUXUebwycIH6ICOirtshmLD8wFMWb%2BV8Csf1JHxzk11Y7hUkpYz0CKCGbRW%2BxuIHxsWU7PQFYD5FaeB34voT%2Fbd1wA6Z169IuHReUzB6Fu6U7watwoiNiAgKm88KUBSVmcZTd0Fx4K81jTf13Th8iMsgKMAhhm7HC88QBK6f62umPSxx7E2IU22QZ68O34UVA%2FZLHWfR%2BFD1P3qcQt7%2F4IXEzsB7Yz%2FfLHdcC2wM4BW68tz77Gw33vVFiGNb0i77P8M0LHwi8unCS%2BH7GtSx5HkIPXAYkrFarMXMoetTKIWTyjj43j2T8YTqLTrK0QF0afImGMK%2BOutUGOqUBfocw4%2F4Ha0YHpBhqTydYZ8oonRCTAkxnwRvdhM1GQ3kinVifJueyY4C5karZ%2B20l%2BkSEB6GUpBKtAfAzFdtxiTqDixUsb0iV1lwHFQoOk3PTU6A%2BzhQjQ5UTl%2FkqT8xdKppqJPp2Q96Xp1ZyXeJBihzEtSEa41TyeYBwbrFki%2BGKAMd9sXxvyiHAYVB5b%2FSt5xyWJt1G2d0cwTjiOzzhVrlr9HyP&X-Amz-Signature=ac7d866c55c3c402b2efe67689d0ac342c65c670d9e79b3c2510ecff90a0d06e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UML7FK5A%2F20260919%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260919T145957Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFL3XwLfNhcqynknfJ8nEh0ZmA7IA0F3un%2BrgaJFdnp5AiEAw1dnVV%2Be0BojoKpVYPZjuqO2BRW7NodQX243TbZWTIcq%2FwMIXhAAGgw2Mzc0MjMxODM4MDUiDKpleeg%2FbOYiUa31pSrcAxQ2idGjBVU7mE7UyRUFvVmbONHD6hjcE4hDI52LlcNkvp57%2Bl5r%2F2nxQNJrcXj5EFi3w7zloahAcB3bGJe8qRuAx8Yl4Wit59YMuvacdeyN7FQrM%2FOUaY5j6o4kyWnVGdL%2BFeVSXsgE1glxNQFFdKB20LdCLG37YHbcEavknkkHzCZy4g0bvo%2Bl%2BlY%2Fz457fsPsQfJbyTw5S7C0TMzsGJzXhgwrVnGLEG4pMbjzh%2FDGOJZP1NYb3hLGp4wMeeVSr%2B0dMp%2BxGsE%2FvzYUdui5GUdbpK%2BLhlTyciDEAy7kiEwkjl%2B0Tlp5kRzWUXUebwycIH6ICOirtshmLD8wFMWb%2BV8Csf1JHxzk11Y7hUkpYz0CKCGbRW%2BxuIHxsWU7PQFYD5FaeB34voT%2Fbd1wA6Z169IuHReUzB6Fu6U7watwoiNiAgKm88KUBSVmcZTd0Fx4K81jTf13Th8iMsgKMAhhm7HC88QBK6f62umPSxx7E2IU22QZ68O34UVA%2FZLHWfR%2BFD1P3qcQt7%2F4IXEzsB7Yz%2FfLHdcC2wM4BW68tz77Gw33vVFiGNb0i77P8M0LHwi8unCS%2BH7GtSx5HkIPXAYkrFarMXMoetTKIWTyjj43j2T8YTqLTrK0QF0afImGMK%2BOutUGOqUBfocw4%2F4Ha0YHpBhqTydYZ8oonRCTAkxnwRvdhM1GQ3kinVifJueyY4C5karZ%2B20l%2BkSEB6GUpBKtAfAzFdtxiTqDixUsb0iV1lwHFQoOk3PTU6A%2BzhQjQ5UTl%2FkqT8xdKppqJPp2Q96Xp1ZyXeJBihzEtSEa41TyeYBwbrFki%2BGKAMd9sXxvyiHAYVB5b%2FSt5xyWJt1G2d0cwTjiOzzhVrlr9HyP&X-Amz-Signature=e59c0d0ef41a411f6a3c6f8ab96578d05007d5a8a9ad92d6fc00c99da5fedfa6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UML7FK5A%2F20260919%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260919T145957Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFL3XwLfNhcqynknfJ8nEh0ZmA7IA0F3un%2BrgaJFdnp5AiEAw1dnVV%2Be0BojoKpVYPZjuqO2BRW7NodQX243TbZWTIcq%2FwMIXhAAGgw2Mzc0MjMxODM4MDUiDKpleeg%2FbOYiUa31pSrcAxQ2idGjBVU7mE7UyRUFvVmbONHD6hjcE4hDI52LlcNkvp57%2Bl5r%2F2nxQNJrcXj5EFi3w7zloahAcB3bGJe8qRuAx8Yl4Wit59YMuvacdeyN7FQrM%2FOUaY5j6o4kyWnVGdL%2BFeVSXsgE1glxNQFFdKB20LdCLG37YHbcEavknkkHzCZy4g0bvo%2Bl%2BlY%2Fz457fsPsQfJbyTw5S7C0TMzsGJzXhgwrVnGLEG4pMbjzh%2FDGOJZP1NYb3hLGp4wMeeVSr%2B0dMp%2BxGsE%2FvzYUdui5GUdbpK%2BLhlTyciDEAy7kiEwkjl%2B0Tlp5kRzWUXUebwycIH6ICOirtshmLD8wFMWb%2BV8Csf1JHxzk11Y7hUkpYz0CKCGbRW%2BxuIHxsWU7PQFYD5FaeB34voT%2Fbd1wA6Z169IuHReUzB6Fu6U7watwoiNiAgKm88KUBSVmcZTd0Fx4K81jTf13Th8iMsgKMAhhm7HC88QBK6f62umPSxx7E2IU22QZ68O34UVA%2FZLHWfR%2BFD1P3qcQt7%2F4IXEzsB7Yz%2FfLHdcC2wM4BW68tz77Gw33vVFiGNb0i77P8M0LHwi8unCS%2BH7GtSx5HkIPXAYkrFarMXMoetTKIWTyjj43j2T8YTqLTrK0QF0afImGMK%2BOutUGOqUBfocw4%2F4Ha0YHpBhqTydYZ8oonRCTAkxnwRvdhM1GQ3kinVifJueyY4C5karZ%2B20l%2BkSEB6GUpBKtAfAzFdtxiTqDixUsb0iV1lwHFQoOk3PTU6A%2BzhQjQ5UTl%2FkqT8xdKppqJPp2Q96Xp1ZyXeJBihzEtSEa41TyeYBwbrFki%2BGKAMd9sXxvyiHAYVB5b%2FSt5xyWJt1G2d0cwTjiOzzhVrlr9HyP&X-Amz-Signature=b2834a739aa5a45846b872e7649b4b79ef25c117dadbda6b92453eaf1996f8bd&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
