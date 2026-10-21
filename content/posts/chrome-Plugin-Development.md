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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UPMBW5KV%2F20261021%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261021T161615Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQD%2BRB7HZydq1DQ6ts6B4oxrgPUM6%2B22%2FuuTID6dZ518OQIgYbKmlL%2Fc5WwJNhSBSnuXzMZ1GhNsAwiGf%2B6Hfzq9ZWIq%2FwMIXxAAGgw2Mzc0MjMxODM4MDUiDHrwSX6%2FTSrbtilhkyrcA9YH7OFlAMw0ppQi6oyYDISAR7xPdxzlpgmj8QTVckiQPd0eoklHjQw3QEnlKHU8kwg68SymEawrohYTfnX2JBjFR87CQ79NdhR3PLGifAlWA3vOXYXyOxf%2BQZ2BYp2hlASLzbRThI8r4q3i1ZXpQT7VxaURbCWhz1j%2Bso6bMVglgFPHmSPsy0NJ2nQYiBsM6%2FuX5dhZxIRnzZFn%2FW3mjuZ9qrqjEJaDSnIyAP2H1yV%2FLAgQsF%2Frc2wVyoVk5kIyMx2AnwQNv3XXZWmY%2Fa6cdDD0eFishALz8LlVuVPMoFRtFKH2AlRboCokEkoqJbX0zJKXZP6NivhcvIqpboYzyccvqlAra2gaiY%2BknfpOSU%2BhOY%2BUQjWUmcZQIBZMwYBhFGicUc6MQJShz9BnNORBbFNkgvBaGnMwHmr0Ot01rrNiNNTnEpMBg9U04BgwgOZId0aQMc8SEfqcxDi8vdTbTo0ghRKJpWlv5itE%2BShDr6MmjvP%2Fl8WJaIh9j50%2BjxPJVgtVVOr33K7NFnkkAnG8bdGY%2F4f2JCIQkPNxe9mbBBJjJwggdsH%2BMFd2cuXHN%2FLXkwMoNCvqY2NFJkjZICnYa1r8urXGX%2FEmyYXoVaACZ1vRqrIh0WHFLhc2uR40MNGg49YGOqUBmKB%2FjMLZI2tCUvp0nMIwzojsAfajsYkb0pyx7WZR9D8H7cXuHsMzix87CJ4DD5EtDmx6ylbUgljoJ9QpDB%2B7LOzDBB4zP%2FoMPjD4Y%2FDXPnqrnRLVjqwFUmoqxTgIS2AVY%2BW2NItNFYkG48U8QWvsTK6rFEG52KSgQD%2Fq2hjY21gE40%2FPjHSdIpLu5CaITMQDSMFVRxjM5qbWMSaNfXNaWjKFkq1q&X-Amz-Signature=dc3b8256fe9d91bf719125422698a83a9bb6c3452346bbf958e7096ca124cb73&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UPMBW5KV%2F20261021%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261021T161615Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQD%2BRB7HZydq1DQ6ts6B4oxrgPUM6%2B22%2FuuTID6dZ518OQIgYbKmlL%2Fc5WwJNhSBSnuXzMZ1GhNsAwiGf%2B6Hfzq9ZWIq%2FwMIXxAAGgw2Mzc0MjMxODM4MDUiDHrwSX6%2FTSrbtilhkyrcA9YH7OFlAMw0ppQi6oyYDISAR7xPdxzlpgmj8QTVckiQPd0eoklHjQw3QEnlKHU8kwg68SymEawrohYTfnX2JBjFR87CQ79NdhR3PLGifAlWA3vOXYXyOxf%2BQZ2BYp2hlASLzbRThI8r4q3i1ZXpQT7VxaURbCWhz1j%2Bso6bMVglgFPHmSPsy0NJ2nQYiBsM6%2FuX5dhZxIRnzZFn%2FW3mjuZ9qrqjEJaDSnIyAP2H1yV%2FLAgQsF%2Frc2wVyoVk5kIyMx2AnwQNv3XXZWmY%2Fa6cdDD0eFishALz8LlVuVPMoFRtFKH2AlRboCokEkoqJbX0zJKXZP6NivhcvIqpboYzyccvqlAra2gaiY%2BknfpOSU%2BhOY%2BUQjWUmcZQIBZMwYBhFGicUc6MQJShz9BnNORBbFNkgvBaGnMwHmr0Ot01rrNiNNTnEpMBg9U04BgwgOZId0aQMc8SEfqcxDi8vdTbTo0ghRKJpWlv5itE%2BShDr6MmjvP%2Fl8WJaIh9j50%2BjxPJVgtVVOr33K7NFnkkAnG8bdGY%2F4f2JCIQkPNxe9mbBBJjJwggdsH%2BMFd2cuXHN%2FLXkwMoNCvqY2NFJkjZICnYa1r8urXGX%2FEmyYXoVaACZ1vRqrIh0WHFLhc2uR40MNGg49YGOqUBmKB%2FjMLZI2tCUvp0nMIwzojsAfajsYkb0pyx7WZR9D8H7cXuHsMzix87CJ4DD5EtDmx6ylbUgljoJ9QpDB%2B7LOzDBB4zP%2FoMPjD4Y%2FDXPnqrnRLVjqwFUmoqxTgIS2AVY%2BW2NItNFYkG48U8QWvsTK6rFEG52KSgQD%2Fq2hjY21gE40%2FPjHSdIpLu5CaITMQDSMFVRxjM5qbWMSaNfXNaWjKFkq1q&X-Amz-Signature=f5911b32cad0d36b478f32be94e26aa774f3208c7a6fafc4d095483421bec1cf&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UPMBW5KV%2F20261021%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261021T161615Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQD%2BRB7HZydq1DQ6ts6B4oxrgPUM6%2B22%2FuuTID6dZ518OQIgYbKmlL%2Fc5WwJNhSBSnuXzMZ1GhNsAwiGf%2B6Hfzq9ZWIq%2FwMIXxAAGgw2Mzc0MjMxODM4MDUiDHrwSX6%2FTSrbtilhkyrcA9YH7OFlAMw0ppQi6oyYDISAR7xPdxzlpgmj8QTVckiQPd0eoklHjQw3QEnlKHU8kwg68SymEawrohYTfnX2JBjFR87CQ79NdhR3PLGifAlWA3vOXYXyOxf%2BQZ2BYp2hlASLzbRThI8r4q3i1ZXpQT7VxaURbCWhz1j%2Bso6bMVglgFPHmSPsy0NJ2nQYiBsM6%2FuX5dhZxIRnzZFn%2FW3mjuZ9qrqjEJaDSnIyAP2H1yV%2FLAgQsF%2Frc2wVyoVk5kIyMx2AnwQNv3XXZWmY%2Fa6cdDD0eFishALz8LlVuVPMoFRtFKH2AlRboCokEkoqJbX0zJKXZP6NivhcvIqpboYzyccvqlAra2gaiY%2BknfpOSU%2BhOY%2BUQjWUmcZQIBZMwYBhFGicUc6MQJShz9BnNORBbFNkgvBaGnMwHmr0Ot01rrNiNNTnEpMBg9U04BgwgOZId0aQMc8SEfqcxDi8vdTbTo0ghRKJpWlv5itE%2BShDr6MmjvP%2Fl8WJaIh9j50%2BjxPJVgtVVOr33K7NFnkkAnG8bdGY%2F4f2JCIQkPNxe9mbBBJjJwggdsH%2BMFd2cuXHN%2FLXkwMoNCvqY2NFJkjZICnYa1r8urXGX%2FEmyYXoVaACZ1vRqrIh0WHFLhc2uR40MNGg49YGOqUBmKB%2FjMLZI2tCUvp0nMIwzojsAfajsYkb0pyx7WZR9D8H7cXuHsMzix87CJ4DD5EtDmx6ylbUgljoJ9QpDB%2B7LOzDBB4zP%2FoMPjD4Y%2FDXPnqrnRLVjqwFUmoqxTgIS2AVY%2BW2NItNFYkG48U8QWvsTK6rFEG52KSgQD%2Fq2hjY21gE40%2FPjHSdIpLu5CaITMQDSMFVRxjM5qbWMSaNfXNaWjKFkq1q&X-Amz-Signature=7b84187cb6836a5a400155260f64c88380ed638682ba2652908d0af3e33bee02&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UPMBW5KV%2F20261021%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261021T161615Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQD%2BRB7HZydq1DQ6ts6B4oxrgPUM6%2B22%2FuuTID6dZ518OQIgYbKmlL%2Fc5WwJNhSBSnuXzMZ1GhNsAwiGf%2B6Hfzq9ZWIq%2FwMIXxAAGgw2Mzc0MjMxODM4MDUiDHrwSX6%2FTSrbtilhkyrcA9YH7OFlAMw0ppQi6oyYDISAR7xPdxzlpgmj8QTVckiQPd0eoklHjQw3QEnlKHU8kwg68SymEawrohYTfnX2JBjFR87CQ79NdhR3PLGifAlWA3vOXYXyOxf%2BQZ2BYp2hlASLzbRThI8r4q3i1ZXpQT7VxaURbCWhz1j%2Bso6bMVglgFPHmSPsy0NJ2nQYiBsM6%2FuX5dhZxIRnzZFn%2FW3mjuZ9qrqjEJaDSnIyAP2H1yV%2FLAgQsF%2Frc2wVyoVk5kIyMx2AnwQNv3XXZWmY%2Fa6cdDD0eFishALz8LlVuVPMoFRtFKH2AlRboCokEkoqJbX0zJKXZP6NivhcvIqpboYzyccvqlAra2gaiY%2BknfpOSU%2BhOY%2BUQjWUmcZQIBZMwYBhFGicUc6MQJShz9BnNORBbFNkgvBaGnMwHmr0Ot01rrNiNNTnEpMBg9U04BgwgOZId0aQMc8SEfqcxDi8vdTbTo0ghRKJpWlv5itE%2BShDr6MmjvP%2Fl8WJaIh9j50%2BjxPJVgtVVOr33K7NFnkkAnG8bdGY%2F4f2JCIQkPNxe9mbBBJjJwggdsH%2BMFd2cuXHN%2FLXkwMoNCvqY2NFJkjZICnYa1r8urXGX%2FEmyYXoVaACZ1vRqrIh0WHFLhc2uR40MNGg49YGOqUBmKB%2FjMLZI2tCUvp0nMIwzojsAfajsYkb0pyx7WZR9D8H7cXuHsMzix87CJ4DD5EtDmx6ylbUgljoJ9QpDB%2B7LOzDBB4zP%2FoMPjD4Y%2FDXPnqrnRLVjqwFUmoqxTgIS2AVY%2BW2NItNFYkG48U8QWvsTK6rFEG52KSgQD%2Fq2hjY21gE40%2FPjHSdIpLu5CaITMQDSMFVRxjM5qbWMSaNfXNaWjKFkq1q&X-Amz-Signature=676db2c1401d8b1e552f8eed5630b8088f1b9d4798b051571ad83856969c3be8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
