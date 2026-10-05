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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VZKFE34W%2F20261005%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261005T025615Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAsaCXVzLXdlc3QtMiJHMEUCIALP7Eb0KA0C%2FGD4k%2Br8YEfgMJzPe3pdu2I%2BscyAlu3RAiEAqAXaB2iMZ8RShdRr8N3UxqNYDzRmgpzjJZnZJrSDm44qiAQI1P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDDe%2F%2FZ%2Bq9LHs91bJLyrcA7%2BeWeoMBqjcm8FkCtKuvhD2cqRAtB%2B2DwKNwxHwqsca%2FT0p6qPipVzCfxcRrb8QW5OGhfiNTOWWMtjcv%2BmDHuixi3P8XM%2FTu00aQ62TTSDXv9B%2Bjpd4ss2oKQ7fkFksieK7IG2xafSx%2FwJkoxIdczV1G7XTVG3yPJMMZ3N8EcJv4QKJsR4cuUO5k5d7q5QeCj%2BEl2C0uWoAaZs4cRo%2ByN50xWqCrBNl40odRxPGbiLG6mKMYBbdmpaTa3nVAtmxR%2FIeWuI8gxiyl8Nd1UKTs5NRgWi1Iy8lhMyAOfH5yuQQwwRR3ZjySLuVlyXZ9twBKrDmQKHVxs7a%2Fi6rM45jF62QJP%2FcAWXOjhJE9KFMFUOfrJEnxd0kCF%2Br5WjJFTd0tR3gEw7F%2B4gbF8mmGdwYlwucLy98CGL1KTeJLzuklIvO2j1qHl06ilvHCSJRN3qc0WIJMN%2B5ia3Dk3tsSulMyrx5jwrEolgDj7ZIDfTKNMKWfx31BxWwjl4pSLHTBo1tLDB78pdq0Am78tcUFX2AMsDOcjLEwmbLF%2Bd1Bbl0ukpZSgIiCl%2FihKTOCmcVNTqMuYUPauGkg5MMkVfT7zTlXro%2BgwQuSJvbtx9XtffpOwD4Kog2BbcDLJxMVkyXMN6djNYGOqUBZlAwLiFIDBHVkFf48TG8oAhCdcMzjhiq2D5pujyXoT6hqy1jjVdbwtfsCnWZ4N%2FOA4kVjUpemqEd8zu50%2BF0seZA8AVXwr9GOt6qECKMbCPyCvniorIHMNJOQ6z%2B7rVtNjdvBij%2BwoyGHfGH3K2P8tfrS1iI2IFarHwDe1P0OvbubrY3KhnDHWnfFk13wZ4NLIAPpLom5hPW9%2BGmWRNq%2BPJ2%2BhEs&X-Amz-Signature=c6c209a74eee0297c8759cf30e34a9788499842f0963679e1968ac084f62bbd3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VZKFE34W%2F20261005%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261005T025615Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAsaCXVzLXdlc3QtMiJHMEUCIALP7Eb0KA0C%2FGD4k%2Br8YEfgMJzPe3pdu2I%2BscyAlu3RAiEAqAXaB2iMZ8RShdRr8N3UxqNYDzRmgpzjJZnZJrSDm44qiAQI1P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDDe%2F%2FZ%2Bq9LHs91bJLyrcA7%2BeWeoMBqjcm8FkCtKuvhD2cqRAtB%2B2DwKNwxHwqsca%2FT0p6qPipVzCfxcRrb8QW5OGhfiNTOWWMtjcv%2BmDHuixi3P8XM%2FTu00aQ62TTSDXv9B%2Bjpd4ss2oKQ7fkFksieK7IG2xafSx%2FwJkoxIdczV1G7XTVG3yPJMMZ3N8EcJv4QKJsR4cuUO5k5d7q5QeCj%2BEl2C0uWoAaZs4cRo%2ByN50xWqCrBNl40odRxPGbiLG6mKMYBbdmpaTa3nVAtmxR%2FIeWuI8gxiyl8Nd1UKTs5NRgWi1Iy8lhMyAOfH5yuQQwwRR3ZjySLuVlyXZ9twBKrDmQKHVxs7a%2Fi6rM45jF62QJP%2FcAWXOjhJE9KFMFUOfrJEnxd0kCF%2Br5WjJFTd0tR3gEw7F%2B4gbF8mmGdwYlwucLy98CGL1KTeJLzuklIvO2j1qHl06ilvHCSJRN3qc0WIJMN%2B5ia3Dk3tsSulMyrx5jwrEolgDj7ZIDfTKNMKWfx31BxWwjl4pSLHTBo1tLDB78pdq0Am78tcUFX2AMsDOcjLEwmbLF%2Bd1Bbl0ukpZSgIiCl%2FihKTOCmcVNTqMuYUPauGkg5MMkVfT7zTlXro%2BgwQuSJvbtx9XtffpOwD4Kog2BbcDLJxMVkyXMN6djNYGOqUBZlAwLiFIDBHVkFf48TG8oAhCdcMzjhiq2D5pujyXoT6hqy1jjVdbwtfsCnWZ4N%2FOA4kVjUpemqEd8zu50%2BF0seZA8AVXwr9GOt6qECKMbCPyCvniorIHMNJOQ6z%2B7rVtNjdvBij%2BwoyGHfGH3K2P8tfrS1iI2IFarHwDe1P0OvbubrY3KhnDHWnfFk13wZ4NLIAPpLom5hPW9%2BGmWRNq%2BPJ2%2BhEs&X-Amz-Signature=e42597b33d2378c06fa7c061e493d6ffb728f082e7913b33fdfde09eae2e4be1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VZKFE34W%2F20261005%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261005T025615Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAsaCXVzLXdlc3QtMiJHMEUCIALP7Eb0KA0C%2FGD4k%2Br8YEfgMJzPe3pdu2I%2BscyAlu3RAiEAqAXaB2iMZ8RShdRr8N3UxqNYDzRmgpzjJZnZJrSDm44qiAQI1P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDDe%2F%2FZ%2Bq9LHs91bJLyrcA7%2BeWeoMBqjcm8FkCtKuvhD2cqRAtB%2B2DwKNwxHwqsca%2FT0p6qPipVzCfxcRrb8QW5OGhfiNTOWWMtjcv%2BmDHuixi3P8XM%2FTu00aQ62TTSDXv9B%2Bjpd4ss2oKQ7fkFksieK7IG2xafSx%2FwJkoxIdczV1G7XTVG3yPJMMZ3N8EcJv4QKJsR4cuUO5k5d7q5QeCj%2BEl2C0uWoAaZs4cRo%2ByN50xWqCrBNl40odRxPGbiLG6mKMYBbdmpaTa3nVAtmxR%2FIeWuI8gxiyl8Nd1UKTs5NRgWi1Iy8lhMyAOfH5yuQQwwRR3ZjySLuVlyXZ9twBKrDmQKHVxs7a%2Fi6rM45jF62QJP%2FcAWXOjhJE9KFMFUOfrJEnxd0kCF%2Br5WjJFTd0tR3gEw7F%2B4gbF8mmGdwYlwucLy98CGL1KTeJLzuklIvO2j1qHl06ilvHCSJRN3qc0WIJMN%2B5ia3Dk3tsSulMyrx5jwrEolgDj7ZIDfTKNMKWfx31BxWwjl4pSLHTBo1tLDB78pdq0Am78tcUFX2AMsDOcjLEwmbLF%2Bd1Bbl0ukpZSgIiCl%2FihKTOCmcVNTqMuYUPauGkg5MMkVfT7zTlXro%2BgwQuSJvbtx9XtffpOwD4Kog2BbcDLJxMVkyXMN6djNYGOqUBZlAwLiFIDBHVkFf48TG8oAhCdcMzjhiq2D5pujyXoT6hqy1jjVdbwtfsCnWZ4N%2FOA4kVjUpemqEd8zu50%2BF0seZA8AVXwr9GOt6qECKMbCPyCvniorIHMNJOQ6z%2B7rVtNjdvBij%2BwoyGHfGH3K2P8tfrS1iI2IFarHwDe1P0OvbubrY3KhnDHWnfFk13wZ4NLIAPpLom5hPW9%2BGmWRNq%2BPJ2%2BhEs&X-Amz-Signature=49799ee28fd296cd300e1857fbf7332cab2769ee21adaff202ad8c1f3a4839f0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VZKFE34W%2F20261005%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261005T025615Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAsaCXVzLXdlc3QtMiJHMEUCIALP7Eb0KA0C%2FGD4k%2Br8YEfgMJzPe3pdu2I%2BscyAlu3RAiEAqAXaB2iMZ8RShdRr8N3UxqNYDzRmgpzjJZnZJrSDm44qiAQI1P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDDe%2F%2FZ%2Bq9LHs91bJLyrcA7%2BeWeoMBqjcm8FkCtKuvhD2cqRAtB%2B2DwKNwxHwqsca%2FT0p6qPipVzCfxcRrb8QW5OGhfiNTOWWMtjcv%2BmDHuixi3P8XM%2FTu00aQ62TTSDXv9B%2Bjpd4ss2oKQ7fkFksieK7IG2xafSx%2FwJkoxIdczV1G7XTVG3yPJMMZ3N8EcJv4QKJsR4cuUO5k5d7q5QeCj%2BEl2C0uWoAaZs4cRo%2ByN50xWqCrBNl40odRxPGbiLG6mKMYBbdmpaTa3nVAtmxR%2FIeWuI8gxiyl8Nd1UKTs5NRgWi1Iy8lhMyAOfH5yuQQwwRR3ZjySLuVlyXZ9twBKrDmQKHVxs7a%2Fi6rM45jF62QJP%2FcAWXOjhJE9KFMFUOfrJEnxd0kCF%2Br5WjJFTd0tR3gEw7F%2B4gbF8mmGdwYlwucLy98CGL1KTeJLzuklIvO2j1qHl06ilvHCSJRN3qc0WIJMN%2B5ia3Dk3tsSulMyrx5jwrEolgDj7ZIDfTKNMKWfx31BxWwjl4pSLHTBo1tLDB78pdq0Am78tcUFX2AMsDOcjLEwmbLF%2Bd1Bbl0ukpZSgIiCl%2FihKTOCmcVNTqMuYUPauGkg5MMkVfT7zTlXro%2BgwQuSJvbtx9XtffpOwD4Kog2BbcDLJxMVkyXMN6djNYGOqUBZlAwLiFIDBHVkFf48TG8oAhCdcMzjhiq2D5pujyXoT6hqy1jjVdbwtfsCnWZ4N%2FOA4kVjUpemqEd8zu50%2BF0seZA8AVXwr9GOt6qECKMbCPyCvniorIHMNJOQ6z%2B7rVtNjdvBij%2BwoyGHfGH3K2P8tfrS1iI2IFarHwDe1P0OvbubrY3KhnDHWnfFk13wZ4NLIAPpLom5hPW9%2BGmWRNq%2BPJ2%2BhEs&X-Amz-Signature=e1e34f112a69399af3ad292762a906c005d918f9693f396356a34e72208da619&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
