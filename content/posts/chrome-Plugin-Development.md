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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZM77MW47%2F20261101%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261101T212757Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCnbl02oVuN7VLShbq0XFaK8PfHmOlSBF%2BGL1wC1wR0kQIgXp2zsWrsICW%2Bx709dDKXHsQpH23XxTyYuiH5JzDJtfwq%2FwMIbhAAGgw2Mzc0MjMxODM4MDUiDPbSlKiZN99lirtHOircA9JQgaGkFm7ZtTAj%2Bk6YlublgdsyY7m2zcw7QZ29porYJIxTEQ4I0ajPoUku8wf4xuoVoE7wd5jIe9AeoZnRcpnk06Nfk79dNIe8y1NyRDsB3%2FvZCUU6NC9cjKKMCVb6kVbL3Vvbt9jAS9%2FD0mlJFRntHtFs2mzDWypngXj%2FuNlpjaiy22Cwsj9nyJQ6QBskE0jJV1rcHoBUd0gRenns%2F67CLHn4GeDaTohYXUxqV77jAdquR4MMz%2BB%2F6ZHI8Y1s95CfcZugjBs6ZBF6996%2F%2FvbRnSEg6Bsuvz2hGDOAw%2B77HCgzxECLfPm4UDtVQ88q6E%2B5bVA%2BaPNVQfcJ5Ln8l92QgSe3ww2NuSVPTZHwgl%2FTybouiPub9EIy6s%2BTzS96Y1AL%2B8KiiEbKc1RMuNoOzlv1v55iwWFKL19e54wlIiu15%2ByeWUMXHwui0Eri9rA2PhNMrHAog%2BV0Q1J5aWIoQHnnQLpE6nZxXxGwNGrQOUr6ONEttjkF1V6%2FBltwoI33%2B8qOtLET1ZMxlxxsCu4jZhw35g76pfRX6fGXOyZyYjMPZmIxUawDmtiQ59BIvZhBGUGZ%2Fwi%2Fe1oip7RCDsnPcfCuMChUyHH650KDfNqVPw0mJFb69R3HlwDCO%2BktMK3ZntcGOqUBGLPJiazKSkepUm8feyWMecBWXECDIkgZLFUjDuOpeu5cyD9oloqJervBOYSWYC9Q%2BAFQUlt1Y7k38l4P3W%2FKXEx4dAUz%2BQnEv9nJ6YOi5HIrUysF9b2jl2FJ4JYKdrOmtjfddPuhf9bIHELJNjpEbnKnikCsofC0qiTEvwwG2snbFpvsff06u9%2Fked%2BUJDu%2BlUYcuh00mXHG3lN4dwJTTg3XFyRx&X-Amz-Signature=5e8025798bfdf5c12b0dcd907f08541f4be5c0973d55df6e29e5dcb3aef5e3be&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZM77MW47%2F20261101%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261101T212757Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCnbl02oVuN7VLShbq0XFaK8PfHmOlSBF%2BGL1wC1wR0kQIgXp2zsWrsICW%2Bx709dDKXHsQpH23XxTyYuiH5JzDJtfwq%2FwMIbhAAGgw2Mzc0MjMxODM4MDUiDPbSlKiZN99lirtHOircA9JQgaGkFm7ZtTAj%2Bk6YlublgdsyY7m2zcw7QZ29porYJIxTEQ4I0ajPoUku8wf4xuoVoE7wd5jIe9AeoZnRcpnk06Nfk79dNIe8y1NyRDsB3%2FvZCUU6NC9cjKKMCVb6kVbL3Vvbt9jAS9%2FD0mlJFRntHtFs2mzDWypngXj%2FuNlpjaiy22Cwsj9nyJQ6QBskE0jJV1rcHoBUd0gRenns%2F67CLHn4GeDaTohYXUxqV77jAdquR4MMz%2BB%2F6ZHI8Y1s95CfcZugjBs6ZBF6996%2F%2FvbRnSEg6Bsuvz2hGDOAw%2B77HCgzxECLfPm4UDtVQ88q6E%2B5bVA%2BaPNVQfcJ5Ln8l92QgSe3ww2NuSVPTZHwgl%2FTybouiPub9EIy6s%2BTzS96Y1AL%2B8KiiEbKc1RMuNoOzlv1v55iwWFKL19e54wlIiu15%2ByeWUMXHwui0Eri9rA2PhNMrHAog%2BV0Q1J5aWIoQHnnQLpE6nZxXxGwNGrQOUr6ONEttjkF1V6%2FBltwoI33%2B8qOtLET1ZMxlxxsCu4jZhw35g76pfRX6fGXOyZyYjMPZmIxUawDmtiQ59BIvZhBGUGZ%2Fwi%2Fe1oip7RCDsnPcfCuMChUyHH650KDfNqVPw0mJFb69R3HlwDCO%2BktMK3ZntcGOqUBGLPJiazKSkepUm8feyWMecBWXECDIkgZLFUjDuOpeu5cyD9oloqJervBOYSWYC9Q%2BAFQUlt1Y7k38l4P3W%2FKXEx4dAUz%2BQnEv9nJ6YOi5HIrUysF9b2jl2FJ4JYKdrOmtjfddPuhf9bIHELJNjpEbnKnikCsofC0qiTEvwwG2snbFpvsff06u9%2Fked%2BUJDu%2BlUYcuh00mXHG3lN4dwJTTg3XFyRx&X-Amz-Signature=c114c1a8a82d343386b04b5298dfcfb708aa6327360bb15bfd6b3e7e9b26cc13&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZM77MW47%2F20261101%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261101T212757Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCnbl02oVuN7VLShbq0XFaK8PfHmOlSBF%2BGL1wC1wR0kQIgXp2zsWrsICW%2Bx709dDKXHsQpH23XxTyYuiH5JzDJtfwq%2FwMIbhAAGgw2Mzc0MjMxODM4MDUiDPbSlKiZN99lirtHOircA9JQgaGkFm7ZtTAj%2Bk6YlublgdsyY7m2zcw7QZ29porYJIxTEQ4I0ajPoUku8wf4xuoVoE7wd5jIe9AeoZnRcpnk06Nfk79dNIe8y1NyRDsB3%2FvZCUU6NC9cjKKMCVb6kVbL3Vvbt9jAS9%2FD0mlJFRntHtFs2mzDWypngXj%2FuNlpjaiy22Cwsj9nyJQ6QBskE0jJV1rcHoBUd0gRenns%2F67CLHn4GeDaTohYXUxqV77jAdquR4MMz%2BB%2F6ZHI8Y1s95CfcZugjBs6ZBF6996%2F%2FvbRnSEg6Bsuvz2hGDOAw%2B77HCgzxECLfPm4UDtVQ88q6E%2B5bVA%2BaPNVQfcJ5Ln8l92QgSe3ww2NuSVPTZHwgl%2FTybouiPub9EIy6s%2BTzS96Y1AL%2B8KiiEbKc1RMuNoOzlv1v55iwWFKL19e54wlIiu15%2ByeWUMXHwui0Eri9rA2PhNMrHAog%2BV0Q1J5aWIoQHnnQLpE6nZxXxGwNGrQOUr6ONEttjkF1V6%2FBltwoI33%2B8qOtLET1ZMxlxxsCu4jZhw35g76pfRX6fGXOyZyYjMPZmIxUawDmtiQ59BIvZhBGUGZ%2Fwi%2Fe1oip7RCDsnPcfCuMChUyHH650KDfNqVPw0mJFb69R3HlwDCO%2BktMK3ZntcGOqUBGLPJiazKSkepUm8feyWMecBWXECDIkgZLFUjDuOpeu5cyD9oloqJervBOYSWYC9Q%2BAFQUlt1Y7k38l4P3W%2FKXEx4dAUz%2BQnEv9nJ6YOi5HIrUysF9b2jl2FJ4JYKdrOmtjfddPuhf9bIHELJNjpEbnKnikCsofC0qiTEvwwG2snbFpvsff06u9%2Fked%2BUJDu%2BlUYcuh00mXHG3lN4dwJTTg3XFyRx&X-Amz-Signature=233ed033ef060999a60246cc0c49e5d5fcacb51390e526e54f202cff26c69ebf&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZM77MW47%2F20261101%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261101T212757Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCnbl02oVuN7VLShbq0XFaK8PfHmOlSBF%2BGL1wC1wR0kQIgXp2zsWrsICW%2Bx709dDKXHsQpH23XxTyYuiH5JzDJtfwq%2FwMIbhAAGgw2Mzc0MjMxODM4MDUiDPbSlKiZN99lirtHOircA9JQgaGkFm7ZtTAj%2Bk6YlublgdsyY7m2zcw7QZ29porYJIxTEQ4I0ajPoUku8wf4xuoVoE7wd5jIe9AeoZnRcpnk06Nfk79dNIe8y1NyRDsB3%2FvZCUU6NC9cjKKMCVb6kVbL3Vvbt9jAS9%2FD0mlJFRntHtFs2mzDWypngXj%2FuNlpjaiy22Cwsj9nyJQ6QBskE0jJV1rcHoBUd0gRenns%2F67CLHn4GeDaTohYXUxqV77jAdquR4MMz%2BB%2F6ZHI8Y1s95CfcZugjBs6ZBF6996%2F%2FvbRnSEg6Bsuvz2hGDOAw%2B77HCgzxECLfPm4UDtVQ88q6E%2B5bVA%2BaPNVQfcJ5Ln8l92QgSe3ww2NuSVPTZHwgl%2FTybouiPub9EIy6s%2BTzS96Y1AL%2B8KiiEbKc1RMuNoOzlv1v55iwWFKL19e54wlIiu15%2ByeWUMXHwui0Eri9rA2PhNMrHAog%2BV0Q1J5aWIoQHnnQLpE6nZxXxGwNGrQOUr6ONEttjkF1V6%2FBltwoI33%2B8qOtLET1ZMxlxxsCu4jZhw35g76pfRX6fGXOyZyYjMPZmIxUawDmtiQ59BIvZhBGUGZ%2Fwi%2Fe1oip7RCDsnPcfCuMChUyHH650KDfNqVPw0mJFb69R3HlwDCO%2BktMK3ZntcGOqUBGLPJiazKSkepUm8feyWMecBWXECDIkgZLFUjDuOpeu5cyD9oloqJervBOYSWYC9Q%2BAFQUlt1Y7k38l4P3W%2FKXEx4dAUz%2BQnEv9nJ6YOi5HIrUysF9b2jl2FJ4JYKdrOmtjfddPuhf9bIHELJNjpEbnKnikCsofC0qiTEvwwG2snbFpvsff06u9%2Fked%2BUJDu%2BlUYcuh00mXHG3lN4dwJTTg3XFyRx&X-Amz-Signature=8f3990b9caeb1f650f3dd4c13c4da42b3d52d247f1376cb24b1c0904a67bbdde&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
