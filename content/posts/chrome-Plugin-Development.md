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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YNZ6UQRE%2F20261015%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261015T021702Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAyxUOCHzj9w15U2D2eQnhbcAK%2FT108dWuBt35jdC0enAiBPArGF%2FrhRhz8eFE29hyyTsRYnI%2FG0d9eqD5SUjpSGoiqIBAjC%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMtZmu2%2BjE%2FxhwGQIWKtwD9l%2BXrHU0rjhArEH55ccFNtLNVRJ4qE8O97s3jiSrFi7P5q60%2BrbRxBWmsBXE9TkP48CKYjlXjl%2BfirnyKqXw2F6qSzUrPENSpg9NH%2Fhze%2FX%2B9JKEVJ19%2BcrCErTafFr%2FGGDQ0H6AM8ZXwG81%2FOJl2YfOosoqMSkooE8FPaUp7izqUJivSuCtFusSY73GryCoYaHH3K62UKHruO4m1aZioHWQb9xWZJ7EIqI7zGY2dt3eSkjMDU3Kfjne5N2MvkzEDkKCxbjJPIfpoGN2owKzWVpEv3CbdZuo2cWhCZilbQqJ%2B%2B8kuFbn4o2mFrGo3BB4V6yKMbGWjG9jN7Mz4oLEYDU0kLpSSx%2B66MCvk5JNnjbwkZvFqeVr%2B8NdIyZQ4yamKyHiORoFBcaZScKjWa3qd9lBQZiA06sBReIzqyO5twHtkkTM4Kzxd1ynla8UwOkStwq9kuGbJiGmmzJ6OjA0VQu52c87%2BsXUGxJWGsEJ19ae97LSjTttEdXWo0yhyerLTOXAKjd3COUbt1EpPCdgvHryi8He7YmzSy6%2F8YWr5N4pQYYWuoKqu4WEY8jV%2BZKmPAxTmIcZJTnQPVGFot0JSL7d4t1DrYucTfwiBL84xhXkhGfUkmUQ3e7w38owgNrA1gY6pgF8O5vPIHxdEHc1LDgtKPgLXHochoM9RLVDFZ%2FWpCC%2F6FgvA%2F50u%2BMWJWKDeIIcBQM40n8zTwDtM2xvUxpWITNZFHu8xnDiMm33BU195OPayxODTYKzrF7z8LoMmr4EVdvATXPDB%2FCzYAwkT5R%2BVMZk3iUdtc0XLkXHYRzUitMoy8BZUvBWqEnmV7ybQxKdNMkjDbXwusJRB8EDE7wlvs6Y9YBPodLc&X-Amz-Signature=c94c14407aa73b668de8bfc48e6300e54001d42be0ed732450eaeca5717f553c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YNZ6UQRE%2F20261015%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261015T021702Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAyxUOCHzj9w15U2D2eQnhbcAK%2FT108dWuBt35jdC0enAiBPArGF%2FrhRhz8eFE29hyyTsRYnI%2FG0d9eqD5SUjpSGoiqIBAjC%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMtZmu2%2BjE%2FxhwGQIWKtwD9l%2BXrHU0rjhArEH55ccFNtLNVRJ4qE8O97s3jiSrFi7P5q60%2BrbRxBWmsBXE9TkP48CKYjlXjl%2BfirnyKqXw2F6qSzUrPENSpg9NH%2Fhze%2FX%2B9JKEVJ19%2BcrCErTafFr%2FGGDQ0H6AM8ZXwG81%2FOJl2YfOosoqMSkooE8FPaUp7izqUJivSuCtFusSY73GryCoYaHH3K62UKHruO4m1aZioHWQb9xWZJ7EIqI7zGY2dt3eSkjMDU3Kfjne5N2MvkzEDkKCxbjJPIfpoGN2owKzWVpEv3CbdZuo2cWhCZilbQqJ%2B%2B8kuFbn4o2mFrGo3BB4V6yKMbGWjG9jN7Mz4oLEYDU0kLpSSx%2B66MCvk5JNnjbwkZvFqeVr%2B8NdIyZQ4yamKyHiORoFBcaZScKjWa3qd9lBQZiA06sBReIzqyO5twHtkkTM4Kzxd1ynla8UwOkStwq9kuGbJiGmmzJ6OjA0VQu52c87%2BsXUGxJWGsEJ19ae97LSjTttEdXWo0yhyerLTOXAKjd3COUbt1EpPCdgvHryi8He7YmzSy6%2F8YWr5N4pQYYWuoKqu4WEY8jV%2BZKmPAxTmIcZJTnQPVGFot0JSL7d4t1DrYucTfwiBL84xhXkhGfUkmUQ3e7w38owgNrA1gY6pgF8O5vPIHxdEHc1LDgtKPgLXHochoM9RLVDFZ%2FWpCC%2F6FgvA%2F50u%2BMWJWKDeIIcBQM40n8zTwDtM2xvUxpWITNZFHu8xnDiMm33BU195OPayxODTYKzrF7z8LoMmr4EVdvATXPDB%2FCzYAwkT5R%2BVMZk3iUdtc0XLkXHYRzUitMoy8BZUvBWqEnmV7ybQxKdNMkjDbXwusJRB8EDE7wlvs6Y9YBPodLc&X-Amz-Signature=bf358694a1273f84c565724d8a71c1695e7a771a3801e00abd0e2d7c55416062&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YNZ6UQRE%2F20261015%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261015T021702Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAyxUOCHzj9w15U2D2eQnhbcAK%2FT108dWuBt35jdC0enAiBPArGF%2FrhRhz8eFE29hyyTsRYnI%2FG0d9eqD5SUjpSGoiqIBAjC%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMtZmu2%2BjE%2FxhwGQIWKtwD9l%2BXrHU0rjhArEH55ccFNtLNVRJ4qE8O97s3jiSrFi7P5q60%2BrbRxBWmsBXE9TkP48CKYjlXjl%2BfirnyKqXw2F6qSzUrPENSpg9NH%2Fhze%2FX%2B9JKEVJ19%2BcrCErTafFr%2FGGDQ0H6AM8ZXwG81%2FOJl2YfOosoqMSkooE8FPaUp7izqUJivSuCtFusSY73GryCoYaHH3K62UKHruO4m1aZioHWQb9xWZJ7EIqI7zGY2dt3eSkjMDU3Kfjne5N2MvkzEDkKCxbjJPIfpoGN2owKzWVpEv3CbdZuo2cWhCZilbQqJ%2B%2B8kuFbn4o2mFrGo3BB4V6yKMbGWjG9jN7Mz4oLEYDU0kLpSSx%2B66MCvk5JNnjbwkZvFqeVr%2B8NdIyZQ4yamKyHiORoFBcaZScKjWa3qd9lBQZiA06sBReIzqyO5twHtkkTM4Kzxd1ynla8UwOkStwq9kuGbJiGmmzJ6OjA0VQu52c87%2BsXUGxJWGsEJ19ae97LSjTttEdXWo0yhyerLTOXAKjd3COUbt1EpPCdgvHryi8He7YmzSy6%2F8YWr5N4pQYYWuoKqu4WEY8jV%2BZKmPAxTmIcZJTnQPVGFot0JSL7d4t1DrYucTfwiBL84xhXkhGfUkmUQ3e7w38owgNrA1gY6pgF8O5vPIHxdEHc1LDgtKPgLXHochoM9RLVDFZ%2FWpCC%2F6FgvA%2F50u%2BMWJWKDeIIcBQM40n8zTwDtM2xvUxpWITNZFHu8xnDiMm33BU195OPayxODTYKzrF7z8LoMmr4EVdvATXPDB%2FCzYAwkT5R%2BVMZk3iUdtc0XLkXHYRzUitMoy8BZUvBWqEnmV7ybQxKdNMkjDbXwusJRB8EDE7wlvs6Y9YBPodLc&X-Amz-Signature=76263006040e605fb6f3b4dba00372337fe48708673eebc6deb027259ae65fe8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YNZ6UQRE%2F20261015%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261015T021702Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAyxUOCHzj9w15U2D2eQnhbcAK%2FT108dWuBt35jdC0enAiBPArGF%2FrhRhz8eFE29hyyTsRYnI%2FG0d9eqD5SUjpSGoiqIBAjC%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMtZmu2%2BjE%2FxhwGQIWKtwD9l%2BXrHU0rjhArEH55ccFNtLNVRJ4qE8O97s3jiSrFi7P5q60%2BrbRxBWmsBXE9TkP48CKYjlXjl%2BfirnyKqXw2F6qSzUrPENSpg9NH%2Fhze%2FX%2B9JKEVJ19%2BcrCErTafFr%2FGGDQ0H6AM8ZXwG81%2FOJl2YfOosoqMSkooE8FPaUp7izqUJivSuCtFusSY73GryCoYaHH3K62UKHruO4m1aZioHWQb9xWZJ7EIqI7zGY2dt3eSkjMDU3Kfjne5N2MvkzEDkKCxbjJPIfpoGN2owKzWVpEv3CbdZuo2cWhCZilbQqJ%2B%2B8kuFbn4o2mFrGo3BB4V6yKMbGWjG9jN7Mz4oLEYDU0kLpSSx%2B66MCvk5JNnjbwkZvFqeVr%2B8NdIyZQ4yamKyHiORoFBcaZScKjWa3qd9lBQZiA06sBReIzqyO5twHtkkTM4Kzxd1ynla8UwOkStwq9kuGbJiGmmzJ6OjA0VQu52c87%2BsXUGxJWGsEJ19ae97LSjTttEdXWo0yhyerLTOXAKjd3COUbt1EpPCdgvHryi8He7YmzSy6%2F8YWr5N4pQYYWuoKqu4WEY8jV%2BZKmPAxTmIcZJTnQPVGFot0JSL7d4t1DrYucTfwiBL84xhXkhGfUkmUQ3e7w38owgNrA1gY6pgF8O5vPIHxdEHc1LDgtKPgLXHochoM9RLVDFZ%2FWpCC%2F6FgvA%2F50u%2BMWJWKDeIIcBQM40n8zTwDtM2xvUxpWITNZFHu8xnDiMm33BU195OPayxODTYKzrF7z8LoMmr4EVdvATXPDB%2FCzYAwkT5R%2BVMZk3iUdtc0XLkXHYRzUitMoy8BZUvBWqEnmV7ybQxKdNMkjDbXwusJRB8EDE7wlvs6Y9YBPodLc&X-Amz-Signature=9c1f4ed0e24a27be3061fed3ceff1f528c5e5ecce4cb2233b10992b03f3b23de&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
