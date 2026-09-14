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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SHXN6BNW%2F20260914%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260914T021553Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBIaCXVzLXdlc3QtMiJGMEQCIAH%2FYb3F2kMQVdBUfo2WTka%2BoAwoGfhrUiowMidEmMjWAiBx4knXknmNfjOeYIUIFb0KY8K6%2B9FoYL9GXbSfoY6o7CqIBAjb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMJcCRz7byriPT0zO%2BKtwD5LZG5XR9%2FkMrMlpU1M6yrtgrd2pTQvcQVMutrJw%2FnyfHPpsLgaQmv%2F96a5bM3EhvwxC%2BhpreQz5Aum%2Fy2Uw0YcO3KHFEqI%2BJ0Guf8nWl3aK0fqkcdVWN%2Brw4f3ecO0p%2BoIZnve%2FFFkhqUpLOqGAeINw2I04XE%2Fczo1hN4kvPJ4TEjWEx45yZFuBoagfS7WD6ALUNPZ%2BMqT%2Fl62qtHEHeSRv6bzlhzcavXYJ51JrOUZA8tP2lHsJ5ImYi4sUJc4WTTD0m0UYgyOsN6FgesinaX%2B9aNSBTH3ttKuJ24VHZiv8ZwI70P2YwDjN4iUzeGv8AdBGv64ZAJvBC%2BOTVDTzTi6ciT4mI1T0MboVfJQukDblTjOBq%2FQSY18X7qk2xm%2F5T%2FPFBBOf5m5q5YzddoiCiC1XHnM%2FAhLQOVSk1%2F3VkeJTCbPBA85nGLOQJEq3svtota6qvMAZzA%2Bjck29dEQDSkjK7ode5mG1OdFb1REYisje3153ZSt9zLTXLA89VexWxhXiKCIeb3K2oSY2AlGK%2B%2BqEiRcyHpySlBLDSpFsxIiUtd4ZHdsgHgaxtlX5uamwHv6h0O3KkAgX%2BBwCndlgC1WbOk2b2gVan0qnZeRCa1sEd1xfcwr6A41gItNUw7Zmd1QY6pgEJFF9gTVLjk7gklsLEWH4B5Lpu853tlErji%2B6FwPeEHkTxSQoq3tMlQIO%2F1DWwdJMqzhRrs%2BEuJzir0to%2B7qV9mkESVxYKpbNggirvHIoZ3jXm3WUtNAdMGCSvLp30M3iu3dPOkfGHG7dgj9N8CxftdgdXbRMpGHxnnUSX%2BEDfCSsDmR1Eli5bWll%2F9mRtoTIjM2USQWt%2BEU%2FiF8lww9tCpqrdkehm&X-Amz-Signature=e79ca0d4bcdc0fb55a97f2632e38f6f38f79f35c797828b2bc9bc4659560d2d6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SHXN6BNW%2F20260914%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260914T021553Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBIaCXVzLXdlc3QtMiJGMEQCIAH%2FYb3F2kMQVdBUfo2WTka%2BoAwoGfhrUiowMidEmMjWAiBx4knXknmNfjOeYIUIFb0KY8K6%2B9FoYL9GXbSfoY6o7CqIBAjb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMJcCRz7byriPT0zO%2BKtwD5LZG5XR9%2FkMrMlpU1M6yrtgrd2pTQvcQVMutrJw%2FnyfHPpsLgaQmv%2F96a5bM3EhvwxC%2BhpreQz5Aum%2Fy2Uw0YcO3KHFEqI%2BJ0Guf8nWl3aK0fqkcdVWN%2Brw4f3ecO0p%2BoIZnve%2FFFkhqUpLOqGAeINw2I04XE%2Fczo1hN4kvPJ4TEjWEx45yZFuBoagfS7WD6ALUNPZ%2BMqT%2Fl62qtHEHeSRv6bzlhzcavXYJ51JrOUZA8tP2lHsJ5ImYi4sUJc4WTTD0m0UYgyOsN6FgesinaX%2B9aNSBTH3ttKuJ24VHZiv8ZwI70P2YwDjN4iUzeGv8AdBGv64ZAJvBC%2BOTVDTzTi6ciT4mI1T0MboVfJQukDblTjOBq%2FQSY18X7qk2xm%2F5T%2FPFBBOf5m5q5YzddoiCiC1XHnM%2FAhLQOVSk1%2F3VkeJTCbPBA85nGLOQJEq3svtota6qvMAZzA%2Bjck29dEQDSkjK7ode5mG1OdFb1REYisje3153ZSt9zLTXLA89VexWxhXiKCIeb3K2oSY2AlGK%2B%2BqEiRcyHpySlBLDSpFsxIiUtd4ZHdsgHgaxtlX5uamwHv6h0O3KkAgX%2BBwCndlgC1WbOk2b2gVan0qnZeRCa1sEd1xfcwr6A41gItNUw7Zmd1QY6pgEJFF9gTVLjk7gklsLEWH4B5Lpu853tlErji%2B6FwPeEHkTxSQoq3tMlQIO%2F1DWwdJMqzhRrs%2BEuJzir0to%2B7qV9mkESVxYKpbNggirvHIoZ3jXm3WUtNAdMGCSvLp30M3iu3dPOkfGHG7dgj9N8CxftdgdXbRMpGHxnnUSX%2BEDfCSsDmR1Eli5bWll%2F9mRtoTIjM2USQWt%2BEU%2FiF8lww9tCpqrdkehm&X-Amz-Signature=cb36e86077ef6d3babc345b5b2088ceef5cb5ef2ec689bcfd6d53517645ea4de&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SHXN6BNW%2F20260914%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260914T021553Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBIaCXVzLXdlc3QtMiJGMEQCIAH%2FYb3F2kMQVdBUfo2WTka%2BoAwoGfhrUiowMidEmMjWAiBx4knXknmNfjOeYIUIFb0KY8K6%2B9FoYL9GXbSfoY6o7CqIBAjb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMJcCRz7byriPT0zO%2BKtwD5LZG5XR9%2FkMrMlpU1M6yrtgrd2pTQvcQVMutrJw%2FnyfHPpsLgaQmv%2F96a5bM3EhvwxC%2BhpreQz5Aum%2Fy2Uw0YcO3KHFEqI%2BJ0Guf8nWl3aK0fqkcdVWN%2Brw4f3ecO0p%2BoIZnve%2FFFkhqUpLOqGAeINw2I04XE%2Fczo1hN4kvPJ4TEjWEx45yZFuBoagfS7WD6ALUNPZ%2BMqT%2Fl62qtHEHeSRv6bzlhzcavXYJ51JrOUZA8tP2lHsJ5ImYi4sUJc4WTTD0m0UYgyOsN6FgesinaX%2B9aNSBTH3ttKuJ24VHZiv8ZwI70P2YwDjN4iUzeGv8AdBGv64ZAJvBC%2BOTVDTzTi6ciT4mI1T0MboVfJQukDblTjOBq%2FQSY18X7qk2xm%2F5T%2FPFBBOf5m5q5YzddoiCiC1XHnM%2FAhLQOVSk1%2F3VkeJTCbPBA85nGLOQJEq3svtota6qvMAZzA%2Bjck29dEQDSkjK7ode5mG1OdFb1REYisje3153ZSt9zLTXLA89VexWxhXiKCIeb3K2oSY2AlGK%2B%2BqEiRcyHpySlBLDSpFsxIiUtd4ZHdsgHgaxtlX5uamwHv6h0O3KkAgX%2BBwCndlgC1WbOk2b2gVan0qnZeRCa1sEd1xfcwr6A41gItNUw7Zmd1QY6pgEJFF9gTVLjk7gklsLEWH4B5Lpu853tlErji%2B6FwPeEHkTxSQoq3tMlQIO%2F1DWwdJMqzhRrs%2BEuJzir0to%2B7qV9mkESVxYKpbNggirvHIoZ3jXm3WUtNAdMGCSvLp30M3iu3dPOkfGHG7dgj9N8CxftdgdXbRMpGHxnnUSX%2BEDfCSsDmR1Eli5bWll%2F9mRtoTIjM2USQWt%2BEU%2FiF8lww9tCpqrdkehm&X-Amz-Signature=a54988581e94d0d8435d9bc57557111b0ae4a2a9b5d577b99ae8f589db46cd03&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SHXN6BNW%2F20260914%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260914T021553Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBIaCXVzLXdlc3QtMiJGMEQCIAH%2FYb3F2kMQVdBUfo2WTka%2BoAwoGfhrUiowMidEmMjWAiBx4knXknmNfjOeYIUIFb0KY8K6%2B9FoYL9GXbSfoY6o7CqIBAjb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMJcCRz7byriPT0zO%2BKtwD5LZG5XR9%2FkMrMlpU1M6yrtgrd2pTQvcQVMutrJw%2FnyfHPpsLgaQmv%2F96a5bM3EhvwxC%2BhpreQz5Aum%2Fy2Uw0YcO3KHFEqI%2BJ0Guf8nWl3aK0fqkcdVWN%2Brw4f3ecO0p%2BoIZnve%2FFFkhqUpLOqGAeINw2I04XE%2Fczo1hN4kvPJ4TEjWEx45yZFuBoagfS7WD6ALUNPZ%2BMqT%2Fl62qtHEHeSRv6bzlhzcavXYJ51JrOUZA8tP2lHsJ5ImYi4sUJc4WTTD0m0UYgyOsN6FgesinaX%2B9aNSBTH3ttKuJ24VHZiv8ZwI70P2YwDjN4iUzeGv8AdBGv64ZAJvBC%2BOTVDTzTi6ciT4mI1T0MboVfJQukDblTjOBq%2FQSY18X7qk2xm%2F5T%2FPFBBOf5m5q5YzddoiCiC1XHnM%2FAhLQOVSk1%2F3VkeJTCbPBA85nGLOQJEq3svtota6qvMAZzA%2Bjck29dEQDSkjK7ode5mG1OdFb1REYisje3153ZSt9zLTXLA89VexWxhXiKCIeb3K2oSY2AlGK%2B%2BqEiRcyHpySlBLDSpFsxIiUtd4ZHdsgHgaxtlX5uamwHv6h0O3KkAgX%2BBwCndlgC1WbOk2b2gVan0qnZeRCa1sEd1xfcwr6A41gItNUw7Zmd1QY6pgEJFF9gTVLjk7gklsLEWH4B5Lpu853tlErji%2B6FwPeEHkTxSQoq3tMlQIO%2F1DWwdJMqzhRrs%2BEuJzir0to%2B7qV9mkESVxYKpbNggirvHIoZ3jXm3WUtNAdMGCSvLp30M3iu3dPOkfGHG7dgj9N8CxftdgdXbRMpGHxnnUSX%2BEDfCSsDmR1Eli5bWll%2F9mRtoTIjM2USQWt%2BEU%2FiF8lww9tCpqrdkehm&X-Amz-Signature=51b3d6e360fac6acd220d346b74054d5023011784b255ff923ba85bf72e01446&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
