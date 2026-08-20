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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UNJTXB5H%2F20260820%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260820T003628Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCO4THy2XDZf980PTxK7QU7s8og%2B1Q93AwEK%2BzfmftrYgIhAOTuYTnvSGRUveGdhEw3EeySl0SqoMxv1ohrfxDEQPybKogECID%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgyIBX6tug6i0cfRlx4q3AON%2BElgCPf7O2Z0qCxAabIiNQgcHu3tNyo2iuVea0wEjKr9kb7uQgHLX%2BvCMyKsbBInkbeSvpXo8t74OHhIudQ4zdGfTk91TUVB%2BVx1ArE%2F%2FKezGFMDub2cC92MiNmvmupL1UkwB2V%2BrhuqyWWy6waiYzHF2nxjpfs3NEC%2FgKEeibdGz6VtDxyDdgyM5k9wDGBqXgGZq%2FvXjNZ82Mfw6%2F%2FDV1ygUjEHNOUaHRhdtIPryHDCyOcD%2F9%2FsMTG3R7EcPudT4sh08zTggUOPSr45PesBf%2BZibpRWo3EY1Ry46T3Ny2X%2BgT0k9q2%2BH8J0jRjYG0GdO6348lYZsD5PFby2tP1SC6eZ8HFu2Bulv6ursOyNyxNC%2FX4CnNeLrGIItOaUwvfWGYcizBny6ye25v7tzvYTqBCtoT%2BpeTwuHST7sH1ZAXcxoLmA3zzFWtfbg06ERIXkXtsUUtOvxAvuQPPZ2jah%2BnImJmJjbIRTp48ttzdJoojSNZJHRKty1ZCm4WNj%2FionurEdv4aNn%2BWFKw3cmxwc3TLRw5OYTKvxjYTpMqjQrgQN2w0f0rHsDCKq6cPbbMQB3zNUbgPr8KoAjQ4mckwaMJW3zFEnWbs5fBUPY7RiRPJXxE2t5S1O7eNgEzC065jUBjqkAYGdrbXB%2FrfuzdGi3RROAqXzwFd2QTdYRRqljGJeQZkVLMP9A%2F%2ByyqirWJjb9FSXvYwfFvFXGFcrGMErJG0arC1lOqH6ZTXu8f%2FOIXneYyvpiyKD5Uk5xoLWZeosPKOcTv%2BEBcnUYBsM00DxUOz1d%2BTOrMOsRKJnkyqj4VSF8v81lUOZ3NorXVjgPIRkDVBmOxuPhtJOTbThI%2Bm4vue%2FlubVqGEW&X-Amz-Signature=6828c9b93984d40cf3b04720cc162a036cb9633682207f6571b70882cf9d3de3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UNJTXB5H%2F20260820%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260820T003628Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCO4THy2XDZf980PTxK7QU7s8og%2B1Q93AwEK%2BzfmftrYgIhAOTuYTnvSGRUveGdhEw3EeySl0SqoMxv1ohrfxDEQPybKogECID%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgyIBX6tug6i0cfRlx4q3AON%2BElgCPf7O2Z0qCxAabIiNQgcHu3tNyo2iuVea0wEjKr9kb7uQgHLX%2BvCMyKsbBInkbeSvpXo8t74OHhIudQ4zdGfTk91TUVB%2BVx1ArE%2F%2FKezGFMDub2cC92MiNmvmupL1UkwB2V%2BrhuqyWWy6waiYzHF2nxjpfs3NEC%2FgKEeibdGz6VtDxyDdgyM5k9wDGBqXgGZq%2FvXjNZ82Mfw6%2F%2FDV1ygUjEHNOUaHRhdtIPryHDCyOcD%2F9%2FsMTG3R7EcPudT4sh08zTggUOPSr45PesBf%2BZibpRWo3EY1Ry46T3Ny2X%2BgT0k9q2%2BH8J0jRjYG0GdO6348lYZsD5PFby2tP1SC6eZ8HFu2Bulv6ursOyNyxNC%2FX4CnNeLrGIItOaUwvfWGYcizBny6ye25v7tzvYTqBCtoT%2BpeTwuHST7sH1ZAXcxoLmA3zzFWtfbg06ERIXkXtsUUtOvxAvuQPPZ2jah%2BnImJmJjbIRTp48ttzdJoojSNZJHRKty1ZCm4WNj%2FionurEdv4aNn%2BWFKw3cmxwc3TLRw5OYTKvxjYTpMqjQrgQN2w0f0rHsDCKq6cPbbMQB3zNUbgPr8KoAjQ4mckwaMJW3zFEnWbs5fBUPY7RiRPJXxE2t5S1O7eNgEzC065jUBjqkAYGdrbXB%2FrfuzdGi3RROAqXzwFd2QTdYRRqljGJeQZkVLMP9A%2F%2ByyqirWJjb9FSXvYwfFvFXGFcrGMErJG0arC1lOqH6ZTXu8f%2FOIXneYyvpiyKD5Uk5xoLWZeosPKOcTv%2BEBcnUYBsM00DxUOz1d%2BTOrMOsRKJnkyqj4VSF8v81lUOZ3NorXVjgPIRkDVBmOxuPhtJOTbThI%2Bm4vue%2FlubVqGEW&X-Amz-Signature=77853bec9c443adf864e9c0aeae3e22ef6521e3d21b9c287c4ba2e4c46ee19e2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UNJTXB5H%2F20260820%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260820T003628Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCO4THy2XDZf980PTxK7QU7s8og%2B1Q93AwEK%2BzfmftrYgIhAOTuYTnvSGRUveGdhEw3EeySl0SqoMxv1ohrfxDEQPybKogECID%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgyIBX6tug6i0cfRlx4q3AON%2BElgCPf7O2Z0qCxAabIiNQgcHu3tNyo2iuVea0wEjKr9kb7uQgHLX%2BvCMyKsbBInkbeSvpXo8t74OHhIudQ4zdGfTk91TUVB%2BVx1ArE%2F%2FKezGFMDub2cC92MiNmvmupL1UkwB2V%2BrhuqyWWy6waiYzHF2nxjpfs3NEC%2FgKEeibdGz6VtDxyDdgyM5k9wDGBqXgGZq%2FvXjNZ82Mfw6%2F%2FDV1ygUjEHNOUaHRhdtIPryHDCyOcD%2F9%2FsMTG3R7EcPudT4sh08zTggUOPSr45PesBf%2BZibpRWo3EY1Ry46T3Ny2X%2BgT0k9q2%2BH8J0jRjYG0GdO6348lYZsD5PFby2tP1SC6eZ8HFu2Bulv6ursOyNyxNC%2FX4CnNeLrGIItOaUwvfWGYcizBny6ye25v7tzvYTqBCtoT%2BpeTwuHST7sH1ZAXcxoLmA3zzFWtfbg06ERIXkXtsUUtOvxAvuQPPZ2jah%2BnImJmJjbIRTp48ttzdJoojSNZJHRKty1ZCm4WNj%2FionurEdv4aNn%2BWFKw3cmxwc3TLRw5OYTKvxjYTpMqjQrgQN2w0f0rHsDCKq6cPbbMQB3zNUbgPr8KoAjQ4mckwaMJW3zFEnWbs5fBUPY7RiRPJXxE2t5S1O7eNgEzC065jUBjqkAYGdrbXB%2FrfuzdGi3RROAqXzwFd2QTdYRRqljGJeQZkVLMP9A%2F%2ByyqirWJjb9FSXvYwfFvFXGFcrGMErJG0arC1lOqH6ZTXu8f%2FOIXneYyvpiyKD5Uk5xoLWZeosPKOcTv%2BEBcnUYBsM00DxUOz1d%2BTOrMOsRKJnkyqj4VSF8v81lUOZ3NorXVjgPIRkDVBmOxuPhtJOTbThI%2Bm4vue%2FlubVqGEW&X-Amz-Signature=391fbc718c395164e0f7f10bbd79b8892f700c8f4a68daae834603caf12ed070&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UNJTXB5H%2F20260820%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260820T003628Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCO4THy2XDZf980PTxK7QU7s8og%2B1Q93AwEK%2BzfmftrYgIhAOTuYTnvSGRUveGdhEw3EeySl0SqoMxv1ohrfxDEQPybKogECID%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgyIBX6tug6i0cfRlx4q3AON%2BElgCPf7O2Z0qCxAabIiNQgcHu3tNyo2iuVea0wEjKr9kb7uQgHLX%2BvCMyKsbBInkbeSvpXo8t74OHhIudQ4zdGfTk91TUVB%2BVx1ArE%2F%2FKezGFMDub2cC92MiNmvmupL1UkwB2V%2BrhuqyWWy6waiYzHF2nxjpfs3NEC%2FgKEeibdGz6VtDxyDdgyM5k9wDGBqXgGZq%2FvXjNZ82Mfw6%2F%2FDV1ygUjEHNOUaHRhdtIPryHDCyOcD%2F9%2FsMTG3R7EcPudT4sh08zTggUOPSr45PesBf%2BZibpRWo3EY1Ry46T3Ny2X%2BgT0k9q2%2BH8J0jRjYG0GdO6348lYZsD5PFby2tP1SC6eZ8HFu2Bulv6ursOyNyxNC%2FX4CnNeLrGIItOaUwvfWGYcizBny6ye25v7tzvYTqBCtoT%2BpeTwuHST7sH1ZAXcxoLmA3zzFWtfbg06ERIXkXtsUUtOvxAvuQPPZ2jah%2BnImJmJjbIRTp48ttzdJoojSNZJHRKty1ZCm4WNj%2FionurEdv4aNn%2BWFKw3cmxwc3TLRw5OYTKvxjYTpMqjQrgQN2w0f0rHsDCKq6cPbbMQB3zNUbgPr8KoAjQ4mckwaMJW3zFEnWbs5fBUPY7RiRPJXxE2t5S1O7eNgEzC065jUBjqkAYGdrbXB%2FrfuzdGi3RROAqXzwFd2QTdYRRqljGJeQZkVLMP9A%2F%2ByyqirWJjb9FSXvYwfFvFXGFcrGMErJG0arC1lOqH6ZTXu8f%2FOIXneYyvpiyKD5Uk5xoLWZeosPKOcTv%2BEBcnUYBsM00DxUOz1d%2BTOrMOsRKJnkyqj4VSF8v81lUOZ3NorXVjgPIRkDVBmOxuPhtJOTbThI%2Bm4vue%2FlubVqGEW&X-Amz-Signature=2b9e3537d509497311d44a6e752c4b69f4fee560a7bce571eca2f5917e00c722&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
