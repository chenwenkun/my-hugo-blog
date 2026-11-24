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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666762EMIN%2F20261124%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261124T164053Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIHWOcwp%2FJrV7iaL8qNtY5qck35RE7GCdvxZheh4ltzybAiBP5Sv4enwgVpd1ZM77vfveKf9180DXUtQ43JowOnqajyqIBAiP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMZti5EwUIfIm8ovGxKtwDv6qfgXdgtcAWKfZnC2FnIfAv1VJspXsDKwMXCYHiE1M7GST9rkKIi8%2Fr6jermppoG5kDga4fxk%2BGzNj6w8p2SOruEDaF4xGvuoXG8vfRmZ23b%2BjUQy9TN7J%2FIy510YuvBN8XvsO8YZHc1RQhKFAUccjsr2FfYp%2BUyDSP1CNhgm2Qhqiii9UiXoyYqzV%2FwTB8TCVlPbyVeSPL7vcdDGR30E5%2FLIECgMU%2BZjv0em%2BfwYFPZPGyaH5iNvNzuNQXDGa0XVrYYygqv4rwvVYfwmmFunxmsH%2B3bYQrvJE7A11GPfOyc9tjVKOq85gKFRLK%2F5FeObAcL3wrmuXRPLbLTE3W9XoYtlGLnKVqOoZso%2BWMrEqJisC31w%2FUhVxbUdIjlvuM4z8qHOHGim9CG03RHTOdbEXBg9IIJ3mYWuLSkrVBilFU1lc7EnZYUs3icMKYdiop44XZeDhfdLU7rF0qd1V1uF2bOA2nw%2BsHTEwC24pz9mUbU8Gjot4Iyp%2FbD7%2BIrXsVH05kzdkSw1R8RmuiGNPdU8tP9qUrXwxmhjYIRsSHazT2I9aq6EQbj0rvsXhu6Qbguauxs90GOq3Nu7qdGXdNtX%2Br%2BHAz%2BmC%2FiX9n8zq4a5GG0Z7IthmzD4mMDfEws8yW2AY6pgEqI1s%2FsHzyIvuheyM0TqOw0nIDIsB7mUWFhpn58XpTX3fudsVVEH72cxKacuA17cYmKyyoXqmjUEnoTunZX78g7VN4xpFnn2QZ6H4J%2BDwtpEQeOo9KkbgPcnQS0QmxSLGJ%2Bigbegj8k4zlCco0BFtkAuGmLYMHtyen5AE21WZr1Pacz1zoqm%2FWKRbiJsXVprxeBpr4mx%2FsFTgXk1B2zNaULGXB9L9z&X-Amz-Signature=265898a2c814782fdb6c58658ba72de5cb03a55ccfbfe9c233c2e75c3dde7ec0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666762EMIN%2F20261124%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261124T164053Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIHWOcwp%2FJrV7iaL8qNtY5qck35RE7GCdvxZheh4ltzybAiBP5Sv4enwgVpd1ZM77vfveKf9180DXUtQ43JowOnqajyqIBAiP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMZti5EwUIfIm8ovGxKtwDv6qfgXdgtcAWKfZnC2FnIfAv1VJspXsDKwMXCYHiE1M7GST9rkKIi8%2Fr6jermppoG5kDga4fxk%2BGzNj6w8p2SOruEDaF4xGvuoXG8vfRmZ23b%2BjUQy9TN7J%2FIy510YuvBN8XvsO8YZHc1RQhKFAUccjsr2FfYp%2BUyDSP1CNhgm2Qhqiii9UiXoyYqzV%2FwTB8TCVlPbyVeSPL7vcdDGR30E5%2FLIECgMU%2BZjv0em%2BfwYFPZPGyaH5iNvNzuNQXDGa0XVrYYygqv4rwvVYfwmmFunxmsH%2B3bYQrvJE7A11GPfOyc9tjVKOq85gKFRLK%2F5FeObAcL3wrmuXRPLbLTE3W9XoYtlGLnKVqOoZso%2BWMrEqJisC31w%2FUhVxbUdIjlvuM4z8qHOHGim9CG03RHTOdbEXBg9IIJ3mYWuLSkrVBilFU1lc7EnZYUs3icMKYdiop44XZeDhfdLU7rF0qd1V1uF2bOA2nw%2BsHTEwC24pz9mUbU8Gjot4Iyp%2FbD7%2BIrXsVH05kzdkSw1R8RmuiGNPdU8tP9qUrXwxmhjYIRsSHazT2I9aq6EQbj0rvsXhu6Qbguauxs90GOq3Nu7qdGXdNtX%2Br%2BHAz%2BmC%2FiX9n8zq4a5GG0Z7IthmzD4mMDfEws8yW2AY6pgEqI1s%2FsHzyIvuheyM0TqOw0nIDIsB7mUWFhpn58XpTX3fudsVVEH72cxKacuA17cYmKyyoXqmjUEnoTunZX78g7VN4xpFnn2QZ6H4J%2BDwtpEQeOo9KkbgPcnQS0QmxSLGJ%2Bigbegj8k4zlCco0BFtkAuGmLYMHtyen5AE21WZr1Pacz1zoqm%2FWKRbiJsXVprxeBpr4mx%2FsFTgXk1B2zNaULGXB9L9z&X-Amz-Signature=b6e3a50cd837e9311300ee59a5d0891860e5577c4620e4c7a3f40629e8d8140f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666762EMIN%2F20261124%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261124T164053Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIHWOcwp%2FJrV7iaL8qNtY5qck35RE7GCdvxZheh4ltzybAiBP5Sv4enwgVpd1ZM77vfveKf9180DXUtQ43JowOnqajyqIBAiP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMZti5EwUIfIm8ovGxKtwDv6qfgXdgtcAWKfZnC2FnIfAv1VJspXsDKwMXCYHiE1M7GST9rkKIi8%2Fr6jermppoG5kDga4fxk%2BGzNj6w8p2SOruEDaF4xGvuoXG8vfRmZ23b%2BjUQy9TN7J%2FIy510YuvBN8XvsO8YZHc1RQhKFAUccjsr2FfYp%2BUyDSP1CNhgm2Qhqiii9UiXoyYqzV%2FwTB8TCVlPbyVeSPL7vcdDGR30E5%2FLIECgMU%2BZjv0em%2BfwYFPZPGyaH5iNvNzuNQXDGa0XVrYYygqv4rwvVYfwmmFunxmsH%2B3bYQrvJE7A11GPfOyc9tjVKOq85gKFRLK%2F5FeObAcL3wrmuXRPLbLTE3W9XoYtlGLnKVqOoZso%2BWMrEqJisC31w%2FUhVxbUdIjlvuM4z8qHOHGim9CG03RHTOdbEXBg9IIJ3mYWuLSkrVBilFU1lc7EnZYUs3icMKYdiop44XZeDhfdLU7rF0qd1V1uF2bOA2nw%2BsHTEwC24pz9mUbU8Gjot4Iyp%2FbD7%2BIrXsVH05kzdkSw1R8RmuiGNPdU8tP9qUrXwxmhjYIRsSHazT2I9aq6EQbj0rvsXhu6Qbguauxs90GOq3Nu7qdGXdNtX%2Br%2BHAz%2BmC%2FiX9n8zq4a5GG0Z7IthmzD4mMDfEws8yW2AY6pgEqI1s%2FsHzyIvuheyM0TqOw0nIDIsB7mUWFhpn58XpTX3fudsVVEH72cxKacuA17cYmKyyoXqmjUEnoTunZX78g7VN4xpFnn2QZ6H4J%2BDwtpEQeOo9KkbgPcnQS0QmxSLGJ%2Bigbegj8k4zlCco0BFtkAuGmLYMHtyen5AE21WZr1Pacz1zoqm%2FWKRbiJsXVprxeBpr4mx%2FsFTgXk1B2zNaULGXB9L9z&X-Amz-Signature=ca31e3aa6da8560ec4234018240b984952b9a5302785a31fc42949e1adadc388&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666762EMIN%2F20261124%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261124T164053Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIHWOcwp%2FJrV7iaL8qNtY5qck35RE7GCdvxZheh4ltzybAiBP5Sv4enwgVpd1ZM77vfveKf9180DXUtQ43JowOnqajyqIBAiP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMZti5EwUIfIm8ovGxKtwDv6qfgXdgtcAWKfZnC2FnIfAv1VJspXsDKwMXCYHiE1M7GST9rkKIi8%2Fr6jermppoG5kDga4fxk%2BGzNj6w8p2SOruEDaF4xGvuoXG8vfRmZ23b%2BjUQy9TN7J%2FIy510YuvBN8XvsO8YZHc1RQhKFAUccjsr2FfYp%2BUyDSP1CNhgm2Qhqiii9UiXoyYqzV%2FwTB8TCVlPbyVeSPL7vcdDGR30E5%2FLIECgMU%2BZjv0em%2BfwYFPZPGyaH5iNvNzuNQXDGa0XVrYYygqv4rwvVYfwmmFunxmsH%2B3bYQrvJE7A11GPfOyc9tjVKOq85gKFRLK%2F5FeObAcL3wrmuXRPLbLTE3W9XoYtlGLnKVqOoZso%2BWMrEqJisC31w%2FUhVxbUdIjlvuM4z8qHOHGim9CG03RHTOdbEXBg9IIJ3mYWuLSkrVBilFU1lc7EnZYUs3icMKYdiop44XZeDhfdLU7rF0qd1V1uF2bOA2nw%2BsHTEwC24pz9mUbU8Gjot4Iyp%2FbD7%2BIrXsVH05kzdkSw1R8RmuiGNPdU8tP9qUrXwxmhjYIRsSHazT2I9aq6EQbj0rvsXhu6Qbguauxs90GOq3Nu7qdGXdNtX%2Br%2BHAz%2BmC%2FiX9n8zq4a5GG0Z7IthmzD4mMDfEws8yW2AY6pgEqI1s%2FsHzyIvuheyM0TqOw0nIDIsB7mUWFhpn58XpTX3fudsVVEH72cxKacuA17cYmKyyoXqmjUEnoTunZX78g7VN4xpFnn2QZ6H4J%2BDwtpEQeOo9KkbgPcnQS0QmxSLGJ%2Bigbegj8k4zlCco0BFtkAuGmLYMHtyen5AE21WZr1Pacz1zoqm%2FWKRbiJsXVprxeBpr4mx%2FsFTgXk1B2zNaULGXB9L9z&X-Amz-Signature=fc18de78b7bf7f5907a7e4953b26a91e0d2cabe0acd0ad7f8082c8118574ff0a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
