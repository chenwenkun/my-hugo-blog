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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666XTRVKQY%2F20260910%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260910T152645Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDFaYVLSuU1nRkDuG909ngjGqk5Fd%2FGit1OOmThNeHewQIhAO4HyuupzsxPIFA8GV1RtV6gfKd0vme0PVSqdB1bEJpsKogECIb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwUceGV8n0274nFRCAq3AM%2Fcl8jN0TtndYJ2wOcGHRnetn83yK0qUzi3ouOZRiqRvJlnyU2%2BY2wDafF7VfhT5U03NDHxnvNh5Ah9KtoE2LmjtgWZpba8UYnSxcbR%2F5ZFONmUpZEAYc2dH%2FuX9kXmq3yijhTQFHobITjdoJ8VVLP35R5hY2G0k%2F%2F2EY1lsiL%2BAliqpZwc7LLNOjwaFr6vFZ8VWRkz6k7VxOrONbIhvyji%2F60bkuejdl0Kbp8EVHDs6se6mB%2FpA5VE81G8sQNe%2BsDbbl52Jjiw%2Bsn5ZYEib0wKQFeERy%2BZ1gCN5anevbfLhY3jCDXDzY0nUySTva6XkEnkrmNFX06rt%2Fqq4PSDTkk%2BcTK7bHsTJi19IWLpaVterpp89PYqU2dPktpbPGnvgGK6SrrLjQmKyxcKDPIwzmVvIimDKtELbtc7UM9Ei%2BfUFzDImPbpPLZUux%2BtgfkeNND6OYowpIjcO2kuhDb0qi9a3Y6vKY8iuttmvyRukYoBqmRsDeKoDPb6UYqu6SSKc%2BiellruAk9C9kMDakekAHRAlDt6Fnh7TDZczWxtpzrAN%2B1LDQco0zt10ybmi2rK7lpRC6bDbs9Vimmm1HqtQva5nGTMVb2OrS8rXpvK4f00l8Tu5Pj%2FKps3NTbWTDm2orVBjqkAYoI%2FeINnecnhD6UOAscUg%2BZUcpwVcuIXX2SrUYcw9oxgQFBsQoTXgOh2N60RREcFPRdp2yTv0fJuM1dy53yslMRrWbz2OZMZkVoLPcWHjGnFv4XUqyCNUf0LJRYBE9q5Avaq5C0VjX5I6bmDT8nS8ZtwRLlTCruU1UOjgKRyumG8SjwdjJhyYwNJV3doNxuqazt5f%2BujuGOxWkz7PfnbT2NtS0B&X-Amz-Signature=5db2200bf9a926d888541a3b437bad03d99f3a887dfd9b5da9e89e2975154397&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666XTRVKQY%2F20260910%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260910T152645Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDFaYVLSuU1nRkDuG909ngjGqk5Fd%2FGit1OOmThNeHewQIhAO4HyuupzsxPIFA8GV1RtV6gfKd0vme0PVSqdB1bEJpsKogECIb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwUceGV8n0274nFRCAq3AM%2Fcl8jN0TtndYJ2wOcGHRnetn83yK0qUzi3ouOZRiqRvJlnyU2%2BY2wDafF7VfhT5U03NDHxnvNh5Ah9KtoE2LmjtgWZpba8UYnSxcbR%2F5ZFONmUpZEAYc2dH%2FuX9kXmq3yijhTQFHobITjdoJ8VVLP35R5hY2G0k%2F%2F2EY1lsiL%2BAliqpZwc7LLNOjwaFr6vFZ8VWRkz6k7VxOrONbIhvyji%2F60bkuejdl0Kbp8EVHDs6se6mB%2FpA5VE81G8sQNe%2BsDbbl52Jjiw%2Bsn5ZYEib0wKQFeERy%2BZ1gCN5anevbfLhY3jCDXDzY0nUySTva6XkEnkrmNFX06rt%2Fqq4PSDTkk%2BcTK7bHsTJi19IWLpaVterpp89PYqU2dPktpbPGnvgGK6SrrLjQmKyxcKDPIwzmVvIimDKtELbtc7UM9Ei%2BfUFzDImPbpPLZUux%2BtgfkeNND6OYowpIjcO2kuhDb0qi9a3Y6vKY8iuttmvyRukYoBqmRsDeKoDPb6UYqu6SSKc%2BiellruAk9C9kMDakekAHRAlDt6Fnh7TDZczWxtpzrAN%2B1LDQco0zt10ybmi2rK7lpRC6bDbs9Vimmm1HqtQva5nGTMVb2OrS8rXpvK4f00l8Tu5Pj%2FKps3NTbWTDm2orVBjqkAYoI%2FeINnecnhD6UOAscUg%2BZUcpwVcuIXX2SrUYcw9oxgQFBsQoTXgOh2N60RREcFPRdp2yTv0fJuM1dy53yslMRrWbz2OZMZkVoLPcWHjGnFv4XUqyCNUf0LJRYBE9q5Avaq5C0VjX5I6bmDT8nS8ZtwRLlTCruU1UOjgKRyumG8SjwdjJhyYwNJV3doNxuqazt5f%2BujuGOxWkz7PfnbT2NtS0B&X-Amz-Signature=3b83f72d463489e7561e0bad3447bcae824ee49b52bee1e0b34c633f18a94100&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666XTRVKQY%2F20260910%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260910T152645Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDFaYVLSuU1nRkDuG909ngjGqk5Fd%2FGit1OOmThNeHewQIhAO4HyuupzsxPIFA8GV1RtV6gfKd0vme0PVSqdB1bEJpsKogECIb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwUceGV8n0274nFRCAq3AM%2Fcl8jN0TtndYJ2wOcGHRnetn83yK0qUzi3ouOZRiqRvJlnyU2%2BY2wDafF7VfhT5U03NDHxnvNh5Ah9KtoE2LmjtgWZpba8UYnSxcbR%2F5ZFONmUpZEAYc2dH%2FuX9kXmq3yijhTQFHobITjdoJ8VVLP35R5hY2G0k%2F%2F2EY1lsiL%2BAliqpZwc7LLNOjwaFr6vFZ8VWRkz6k7VxOrONbIhvyji%2F60bkuejdl0Kbp8EVHDs6se6mB%2FpA5VE81G8sQNe%2BsDbbl52Jjiw%2Bsn5ZYEib0wKQFeERy%2BZ1gCN5anevbfLhY3jCDXDzY0nUySTva6XkEnkrmNFX06rt%2Fqq4PSDTkk%2BcTK7bHsTJi19IWLpaVterpp89PYqU2dPktpbPGnvgGK6SrrLjQmKyxcKDPIwzmVvIimDKtELbtc7UM9Ei%2BfUFzDImPbpPLZUux%2BtgfkeNND6OYowpIjcO2kuhDb0qi9a3Y6vKY8iuttmvyRukYoBqmRsDeKoDPb6UYqu6SSKc%2BiellruAk9C9kMDakekAHRAlDt6Fnh7TDZczWxtpzrAN%2B1LDQco0zt10ybmi2rK7lpRC6bDbs9Vimmm1HqtQva5nGTMVb2OrS8rXpvK4f00l8Tu5Pj%2FKps3NTbWTDm2orVBjqkAYoI%2FeINnecnhD6UOAscUg%2BZUcpwVcuIXX2SrUYcw9oxgQFBsQoTXgOh2N60RREcFPRdp2yTv0fJuM1dy53yslMRrWbz2OZMZkVoLPcWHjGnFv4XUqyCNUf0LJRYBE9q5Avaq5C0VjX5I6bmDT8nS8ZtwRLlTCruU1UOjgKRyumG8SjwdjJhyYwNJV3doNxuqazt5f%2BujuGOxWkz7PfnbT2NtS0B&X-Amz-Signature=a0c665170e1fa10d5489538e1932de9217da44875edb65b1c2a7129a36c57cff&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666XTRVKQY%2F20260910%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260910T152645Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDFaYVLSuU1nRkDuG909ngjGqk5Fd%2FGit1OOmThNeHewQIhAO4HyuupzsxPIFA8GV1RtV6gfKd0vme0PVSqdB1bEJpsKogECIb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwUceGV8n0274nFRCAq3AM%2Fcl8jN0TtndYJ2wOcGHRnetn83yK0qUzi3ouOZRiqRvJlnyU2%2BY2wDafF7VfhT5U03NDHxnvNh5Ah9KtoE2LmjtgWZpba8UYnSxcbR%2F5ZFONmUpZEAYc2dH%2FuX9kXmq3yijhTQFHobITjdoJ8VVLP35R5hY2G0k%2F%2F2EY1lsiL%2BAliqpZwc7LLNOjwaFr6vFZ8VWRkz6k7VxOrONbIhvyji%2F60bkuejdl0Kbp8EVHDs6se6mB%2FpA5VE81G8sQNe%2BsDbbl52Jjiw%2Bsn5ZYEib0wKQFeERy%2BZ1gCN5anevbfLhY3jCDXDzY0nUySTva6XkEnkrmNFX06rt%2Fqq4PSDTkk%2BcTK7bHsTJi19IWLpaVterpp89PYqU2dPktpbPGnvgGK6SrrLjQmKyxcKDPIwzmVvIimDKtELbtc7UM9Ei%2BfUFzDImPbpPLZUux%2BtgfkeNND6OYowpIjcO2kuhDb0qi9a3Y6vKY8iuttmvyRukYoBqmRsDeKoDPb6UYqu6SSKc%2BiellruAk9C9kMDakekAHRAlDt6Fnh7TDZczWxtpzrAN%2B1LDQco0zt10ybmi2rK7lpRC6bDbs9Vimmm1HqtQva5nGTMVb2OrS8rXpvK4f00l8Tu5Pj%2FKps3NTbWTDm2orVBjqkAYoI%2FeINnecnhD6UOAscUg%2BZUcpwVcuIXX2SrUYcw9oxgQFBsQoTXgOh2N60RREcFPRdp2yTv0fJuM1dy53yslMRrWbz2OZMZkVoLPcWHjGnFv4XUqyCNUf0LJRYBE9q5Avaq5C0VjX5I6bmDT8nS8ZtwRLlTCruU1UOjgKRyumG8SjwdjJhyYwNJV3doNxuqazt5f%2BujuGOxWkz7PfnbT2NtS0B&X-Amz-Signature=5e58d49fa62985b9fa42d380bd28fd5596811c532df2d6b1b0725bd2d358e4b8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
