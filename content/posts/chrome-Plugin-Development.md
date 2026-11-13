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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TTEWPP26%2F20261113%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261113T133620Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDSx%2FePo6ldgaaB%2BCI1jOdxLVe%2FZyYDhTolKIEhhNo8kQIgHAiGHRyb29Ql6imIZlR%2FHVgEdWJtqi79DzVJKLVVlAoqiAQIhv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNEgNj2ueAWMNkjp%2FSrcAxuEkOzim7%2BC52J%2BQy1xm3iQ%2FbKhHhZ9v8owFVtlq6L%2Fv7sEkkLVj3XXlphj8RkTtE72uxnmvN8GGbFn6emrmuLzigZ4VEto9UJcavb2SpqSwcQn1u818qxaYz7v9h5vJZEUWmYR7AwhwJkhEvzzNewa%2Brsep2sGD4%2B0j7%2FtaTw5FbQYYQvMrdoc2%2BtohNtVYkdn9NSDfMzEKDdRQ2S07ksiFKi5UqBUoftwqgheiIIzvTBS970gLLnz974Yt0VCvevG2XlheWNeNQfJCGSu1VVj%2F0motSbopHy0Ul9s7SPeBnqBEJERUVPDRCjwmgYnROja8lEaOB2xdgZB448iFRRuNS65Rb9VFLBKG2hiWYc%2B1jCMf6NT5hr9tTwDwzPKU75DqAUoislYQTdBATq8aNHRg%2FaBHCYjchwuD9qEbIN2wRZ%2FlquQakyEZXMI8ng76hEljKxnzAtIN6hchNsLPpeQTc0EaqRfsWLURwdEZDQiPPwEByIZ2oaqgrU47Oz7tAyVShEzM0wKhQ7X9eat%2F1z2TZjommb6hwP4N7LFAQZVdwDF6WvjYoGlpjm1jM2PAxGOxQUJR6Ek9HB7aZEnpfObsELgBAmYpbOAsjPafAQa5i2Wl%2BinUQ54H0loMKCT3NcGOqUBkP3txpxeDfj8aZ7humQeH%2FCVZsUDWdeMlOAIlRkHgmdgSWgfA4Jv%2FwzekBApfEDvPz51CX5WYIzKppUKJPBnn3JBvlRzgxb9uxsUDppJiEIYJ8%2FhhiAIIxg8IJ6hXV2MaSwCs6uyfTJ157CdAojsvv4YO4j6NvmQnWvwozvjAhrAOw5Z%2FnAw9cmxeTPeW%2F%2FZt9uV0vKkWfgIlDwGtZ1TYpe9ie6e&X-Amz-Signature=cc59d421a2709f69a117809d2ba566e61dbb7379da38889d5b4a86db8b7c8738&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TTEWPP26%2F20261113%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261113T133620Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDSx%2FePo6ldgaaB%2BCI1jOdxLVe%2FZyYDhTolKIEhhNo8kQIgHAiGHRyb29Ql6imIZlR%2FHVgEdWJtqi79DzVJKLVVlAoqiAQIhv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNEgNj2ueAWMNkjp%2FSrcAxuEkOzim7%2BC52J%2BQy1xm3iQ%2FbKhHhZ9v8owFVtlq6L%2Fv7sEkkLVj3XXlphj8RkTtE72uxnmvN8GGbFn6emrmuLzigZ4VEto9UJcavb2SpqSwcQn1u818qxaYz7v9h5vJZEUWmYR7AwhwJkhEvzzNewa%2Brsep2sGD4%2B0j7%2FtaTw5FbQYYQvMrdoc2%2BtohNtVYkdn9NSDfMzEKDdRQ2S07ksiFKi5UqBUoftwqgheiIIzvTBS970gLLnz974Yt0VCvevG2XlheWNeNQfJCGSu1VVj%2F0motSbopHy0Ul9s7SPeBnqBEJERUVPDRCjwmgYnROja8lEaOB2xdgZB448iFRRuNS65Rb9VFLBKG2hiWYc%2B1jCMf6NT5hr9tTwDwzPKU75DqAUoislYQTdBATq8aNHRg%2FaBHCYjchwuD9qEbIN2wRZ%2FlquQakyEZXMI8ng76hEljKxnzAtIN6hchNsLPpeQTc0EaqRfsWLURwdEZDQiPPwEByIZ2oaqgrU47Oz7tAyVShEzM0wKhQ7X9eat%2F1z2TZjommb6hwP4N7LFAQZVdwDF6WvjYoGlpjm1jM2PAxGOxQUJR6Ek9HB7aZEnpfObsELgBAmYpbOAsjPafAQa5i2Wl%2BinUQ54H0loMKCT3NcGOqUBkP3txpxeDfj8aZ7humQeH%2FCVZsUDWdeMlOAIlRkHgmdgSWgfA4Jv%2FwzekBApfEDvPz51CX5WYIzKppUKJPBnn3JBvlRzgxb9uxsUDppJiEIYJ8%2FhhiAIIxg8IJ6hXV2MaSwCs6uyfTJ157CdAojsvv4YO4j6NvmQnWvwozvjAhrAOw5Z%2FnAw9cmxeTPeW%2F%2FZt9uV0vKkWfgIlDwGtZ1TYpe9ie6e&X-Amz-Signature=d987d7984056c03c5ac81a6d464fe34695a18f8ada906c42714ffd9a0adecb8a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TTEWPP26%2F20261113%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261113T133620Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDSx%2FePo6ldgaaB%2BCI1jOdxLVe%2FZyYDhTolKIEhhNo8kQIgHAiGHRyb29Ql6imIZlR%2FHVgEdWJtqi79DzVJKLVVlAoqiAQIhv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNEgNj2ueAWMNkjp%2FSrcAxuEkOzim7%2BC52J%2BQy1xm3iQ%2FbKhHhZ9v8owFVtlq6L%2Fv7sEkkLVj3XXlphj8RkTtE72uxnmvN8GGbFn6emrmuLzigZ4VEto9UJcavb2SpqSwcQn1u818qxaYz7v9h5vJZEUWmYR7AwhwJkhEvzzNewa%2Brsep2sGD4%2B0j7%2FtaTw5FbQYYQvMrdoc2%2BtohNtVYkdn9NSDfMzEKDdRQ2S07ksiFKi5UqBUoftwqgheiIIzvTBS970gLLnz974Yt0VCvevG2XlheWNeNQfJCGSu1VVj%2F0motSbopHy0Ul9s7SPeBnqBEJERUVPDRCjwmgYnROja8lEaOB2xdgZB448iFRRuNS65Rb9VFLBKG2hiWYc%2B1jCMf6NT5hr9tTwDwzPKU75DqAUoislYQTdBATq8aNHRg%2FaBHCYjchwuD9qEbIN2wRZ%2FlquQakyEZXMI8ng76hEljKxnzAtIN6hchNsLPpeQTc0EaqRfsWLURwdEZDQiPPwEByIZ2oaqgrU47Oz7tAyVShEzM0wKhQ7X9eat%2F1z2TZjommb6hwP4N7LFAQZVdwDF6WvjYoGlpjm1jM2PAxGOxQUJR6Ek9HB7aZEnpfObsELgBAmYpbOAsjPafAQa5i2Wl%2BinUQ54H0loMKCT3NcGOqUBkP3txpxeDfj8aZ7humQeH%2FCVZsUDWdeMlOAIlRkHgmdgSWgfA4Jv%2FwzekBApfEDvPz51CX5WYIzKppUKJPBnn3JBvlRzgxb9uxsUDppJiEIYJ8%2FhhiAIIxg8IJ6hXV2MaSwCs6uyfTJ157CdAojsvv4YO4j6NvmQnWvwozvjAhrAOw5Z%2FnAw9cmxeTPeW%2F%2FZt9uV0vKkWfgIlDwGtZ1TYpe9ie6e&X-Amz-Signature=9070caaf4ca0b3123b0d8bc37310c8a50e182c1e80b10e3bb3e58f0b02b0302a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TTEWPP26%2F20261113%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261113T133620Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDSx%2FePo6ldgaaB%2BCI1jOdxLVe%2FZyYDhTolKIEhhNo8kQIgHAiGHRyb29Ql6imIZlR%2FHVgEdWJtqi79DzVJKLVVlAoqiAQIhv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNEgNj2ueAWMNkjp%2FSrcAxuEkOzim7%2BC52J%2BQy1xm3iQ%2FbKhHhZ9v8owFVtlq6L%2Fv7sEkkLVj3XXlphj8RkTtE72uxnmvN8GGbFn6emrmuLzigZ4VEto9UJcavb2SpqSwcQn1u818qxaYz7v9h5vJZEUWmYR7AwhwJkhEvzzNewa%2Brsep2sGD4%2B0j7%2FtaTw5FbQYYQvMrdoc2%2BtohNtVYkdn9NSDfMzEKDdRQ2S07ksiFKi5UqBUoftwqgheiIIzvTBS970gLLnz974Yt0VCvevG2XlheWNeNQfJCGSu1VVj%2F0motSbopHy0Ul9s7SPeBnqBEJERUVPDRCjwmgYnROja8lEaOB2xdgZB448iFRRuNS65Rb9VFLBKG2hiWYc%2B1jCMf6NT5hr9tTwDwzPKU75DqAUoislYQTdBATq8aNHRg%2FaBHCYjchwuD9qEbIN2wRZ%2FlquQakyEZXMI8ng76hEljKxnzAtIN6hchNsLPpeQTc0EaqRfsWLURwdEZDQiPPwEByIZ2oaqgrU47Oz7tAyVShEzM0wKhQ7X9eat%2F1z2TZjommb6hwP4N7LFAQZVdwDF6WvjYoGlpjm1jM2PAxGOxQUJR6Ek9HB7aZEnpfObsELgBAmYpbOAsjPafAQa5i2Wl%2BinUQ54H0loMKCT3NcGOqUBkP3txpxeDfj8aZ7humQeH%2FCVZsUDWdeMlOAIlRkHgmdgSWgfA4Jv%2FwzekBApfEDvPz51CX5WYIzKppUKJPBnn3JBvlRzgxb9uxsUDppJiEIYJ8%2FhhiAIIxg8IJ6hXV2MaSwCs6uyfTJ157CdAojsvv4YO4j6NvmQnWvwozvjAhrAOw5Z%2FnAw9cmxeTPeW%2F%2FZt9uV0vKkWfgIlDwGtZ1TYpe9ie6e&X-Amz-Signature=acf32a26c5b6946c96c282a2367bd2f18b014660c4e1ce48d8093fce5095114d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
