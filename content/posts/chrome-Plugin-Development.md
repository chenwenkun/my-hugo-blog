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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664LAYJQG6%2F20261122%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261122T035745Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAKm%2B8TxVEATeam019r%2BJCqIY1t5Wsr8IAXtEjYeQnCsAiAq22vxROBsERxWch7oD%2BC9hufF5b4vWdN7SeGyWREz1Sr%2FAwhUEAAaDDYzNzQyMzE4MzgwNSIMwF0rC8QIE4jjwwkNKtwDteechNYQVi8UfAR%2Bze6ybsPN8ZDSltFSsVlEYm%2FlL60U1gUy1s7wwqH5s9%2Fd%2BLZT1xiUpGnhCn4hNOeMNqDWTDYw2Tka1uWgaKo73ahyztZKHlDnYKERbxHNtFJW%2FFO5cRq2%2BLWFTFB6Tltgi7UDEvBBCLW%2BVzTcw4FEE7JA2Y2khBsmpVgaqcak3efJnx2eL0irjjiQ5atsv%2Frq8W%2FKQ8WGSxuqfTP4HyB9cF5mVV1Z61h%2FXxwuKlkzI0nnheBByZEm85wis%2BYAQGct9Sja%2BWCEF5sYYP%2FKJookVHRWt7J3bvgy14yDNCIO03J8%2B8P0PgGLn381p8posWWepp2GZ7Y8U6GM9DAJ86NqT7%2BPFXGC6WxnjQg5OKfj%2BIyHPI3CdvErkcJP6x7wm82Ka2LAJwFOT5aF8uCuaLawsVj3EoCtZGVSkbEFXYjeb5Yvi77aelbt9agon5H7Wz2Lgc%2F%2FnkXkIoFsmGsZNOB2v11qlT1Q36%2BTya84HnGTNvevI7F14OGp6qB7r03z%2BezvB1NdibFSZ8wPG%2FCXD77SezMSVTcKBqqvvMbzfhBnQs%2FkuVfGc%2B0mcKlkS9EROdWsIKzMobveQySyyiMxWKTnuPbkYFRu9yU4wZnlF5S2J6gwh8CJ2AY6pgEfch9WZBoUvvzaKCBTyDuqGDZyH5mw545lWtDRzdH8mDH6nmUGowSfr4Dl8rflV9EcEaWqQcqDROf2QCWgExHxrVPpzy9KjNpFR3381UAjBwaER7wbHgl%2BxmLzEZlFEUg32beSpgQ7%2BIb2%2F2Vjs9NifR3kaN9SiEzjOpifsa6Q2%2FeYwX87Rbme2%2FewdogFaHi0gL7FoOfihAxpvuVZ5MDHAh71mS9y&X-Amz-Signature=5d730e6cd224b7e708dacabba2fbd5337d87038476681fb992d6212eef4312ef&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664LAYJQG6%2F20261122%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261122T035745Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAKm%2B8TxVEATeam019r%2BJCqIY1t5Wsr8IAXtEjYeQnCsAiAq22vxROBsERxWch7oD%2BC9hufF5b4vWdN7SeGyWREz1Sr%2FAwhUEAAaDDYzNzQyMzE4MzgwNSIMwF0rC8QIE4jjwwkNKtwDteechNYQVi8UfAR%2Bze6ybsPN8ZDSltFSsVlEYm%2FlL60U1gUy1s7wwqH5s9%2Fd%2BLZT1xiUpGnhCn4hNOeMNqDWTDYw2Tka1uWgaKo73ahyztZKHlDnYKERbxHNtFJW%2FFO5cRq2%2BLWFTFB6Tltgi7UDEvBBCLW%2BVzTcw4FEE7JA2Y2khBsmpVgaqcak3efJnx2eL0irjjiQ5atsv%2Frq8W%2FKQ8WGSxuqfTP4HyB9cF5mVV1Z61h%2FXxwuKlkzI0nnheBByZEm85wis%2BYAQGct9Sja%2BWCEF5sYYP%2FKJookVHRWt7J3bvgy14yDNCIO03J8%2B8P0PgGLn381p8posWWepp2GZ7Y8U6GM9DAJ86NqT7%2BPFXGC6WxnjQg5OKfj%2BIyHPI3CdvErkcJP6x7wm82Ka2LAJwFOT5aF8uCuaLawsVj3EoCtZGVSkbEFXYjeb5Yvi77aelbt9agon5H7Wz2Lgc%2F%2FnkXkIoFsmGsZNOB2v11qlT1Q36%2BTya84HnGTNvevI7F14OGp6qB7r03z%2BezvB1NdibFSZ8wPG%2FCXD77SezMSVTcKBqqvvMbzfhBnQs%2FkuVfGc%2B0mcKlkS9EROdWsIKzMobveQySyyiMxWKTnuPbkYFRu9yU4wZnlF5S2J6gwh8CJ2AY6pgEfch9WZBoUvvzaKCBTyDuqGDZyH5mw545lWtDRzdH8mDH6nmUGowSfr4Dl8rflV9EcEaWqQcqDROf2QCWgExHxrVPpzy9KjNpFR3381UAjBwaER7wbHgl%2BxmLzEZlFEUg32beSpgQ7%2BIb2%2F2Vjs9NifR3kaN9SiEzjOpifsa6Q2%2FeYwX87Rbme2%2FewdogFaHi0gL7FoOfihAxpvuVZ5MDHAh71mS9y&X-Amz-Signature=7eaed7c2943ec6b660106bf7b7cd789e7ab37613d1fdf79ddf726cfdd6e11075&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664LAYJQG6%2F20261122%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261122T035745Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAKm%2B8TxVEATeam019r%2BJCqIY1t5Wsr8IAXtEjYeQnCsAiAq22vxROBsERxWch7oD%2BC9hufF5b4vWdN7SeGyWREz1Sr%2FAwhUEAAaDDYzNzQyMzE4MzgwNSIMwF0rC8QIE4jjwwkNKtwDteechNYQVi8UfAR%2Bze6ybsPN8ZDSltFSsVlEYm%2FlL60U1gUy1s7wwqH5s9%2Fd%2BLZT1xiUpGnhCn4hNOeMNqDWTDYw2Tka1uWgaKo73ahyztZKHlDnYKERbxHNtFJW%2FFO5cRq2%2BLWFTFB6Tltgi7UDEvBBCLW%2BVzTcw4FEE7JA2Y2khBsmpVgaqcak3efJnx2eL0irjjiQ5atsv%2Frq8W%2FKQ8WGSxuqfTP4HyB9cF5mVV1Z61h%2FXxwuKlkzI0nnheBByZEm85wis%2BYAQGct9Sja%2BWCEF5sYYP%2FKJookVHRWt7J3bvgy14yDNCIO03J8%2B8P0PgGLn381p8posWWepp2GZ7Y8U6GM9DAJ86NqT7%2BPFXGC6WxnjQg5OKfj%2BIyHPI3CdvErkcJP6x7wm82Ka2LAJwFOT5aF8uCuaLawsVj3EoCtZGVSkbEFXYjeb5Yvi77aelbt9agon5H7Wz2Lgc%2F%2FnkXkIoFsmGsZNOB2v11qlT1Q36%2BTya84HnGTNvevI7F14OGp6qB7r03z%2BezvB1NdibFSZ8wPG%2FCXD77SezMSVTcKBqqvvMbzfhBnQs%2FkuVfGc%2B0mcKlkS9EROdWsIKzMobveQySyyiMxWKTnuPbkYFRu9yU4wZnlF5S2J6gwh8CJ2AY6pgEfch9WZBoUvvzaKCBTyDuqGDZyH5mw545lWtDRzdH8mDH6nmUGowSfr4Dl8rflV9EcEaWqQcqDROf2QCWgExHxrVPpzy9KjNpFR3381UAjBwaER7wbHgl%2BxmLzEZlFEUg32beSpgQ7%2BIb2%2F2Vjs9NifR3kaN9SiEzjOpifsa6Q2%2FeYwX87Rbme2%2FewdogFaHi0gL7FoOfihAxpvuVZ5MDHAh71mS9y&X-Amz-Signature=84744d64c4b74fc32910b92d24b078c6020d72a852748320737966c2752ab872&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664LAYJQG6%2F20261122%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261122T035745Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAKm%2B8TxVEATeam019r%2BJCqIY1t5Wsr8IAXtEjYeQnCsAiAq22vxROBsERxWch7oD%2BC9hufF5b4vWdN7SeGyWREz1Sr%2FAwhUEAAaDDYzNzQyMzE4MzgwNSIMwF0rC8QIE4jjwwkNKtwDteechNYQVi8UfAR%2Bze6ybsPN8ZDSltFSsVlEYm%2FlL60U1gUy1s7wwqH5s9%2Fd%2BLZT1xiUpGnhCn4hNOeMNqDWTDYw2Tka1uWgaKo73ahyztZKHlDnYKERbxHNtFJW%2FFO5cRq2%2BLWFTFB6Tltgi7UDEvBBCLW%2BVzTcw4FEE7JA2Y2khBsmpVgaqcak3efJnx2eL0irjjiQ5atsv%2Frq8W%2FKQ8WGSxuqfTP4HyB9cF5mVV1Z61h%2FXxwuKlkzI0nnheBByZEm85wis%2BYAQGct9Sja%2BWCEF5sYYP%2FKJookVHRWt7J3bvgy14yDNCIO03J8%2B8P0PgGLn381p8posWWepp2GZ7Y8U6GM9DAJ86NqT7%2BPFXGC6WxnjQg5OKfj%2BIyHPI3CdvErkcJP6x7wm82Ka2LAJwFOT5aF8uCuaLawsVj3EoCtZGVSkbEFXYjeb5Yvi77aelbt9agon5H7Wz2Lgc%2F%2FnkXkIoFsmGsZNOB2v11qlT1Q36%2BTya84HnGTNvevI7F14OGp6qB7r03z%2BezvB1NdibFSZ8wPG%2FCXD77SezMSVTcKBqqvvMbzfhBnQs%2FkuVfGc%2B0mcKlkS9EROdWsIKzMobveQySyyiMxWKTnuPbkYFRu9yU4wZnlF5S2J6gwh8CJ2AY6pgEfch9WZBoUvvzaKCBTyDuqGDZyH5mw545lWtDRzdH8mDH6nmUGowSfr4Dl8rflV9EcEaWqQcqDROf2QCWgExHxrVPpzy9KjNpFR3381UAjBwaER7wbHgl%2BxmLzEZlFEUg32beSpgQ7%2BIb2%2F2Vjs9NifR3kaN9SiEzjOpifsa6Q2%2FeYwX87Rbme2%2FewdogFaHi0gL7FoOfihAxpvuVZ5MDHAh71mS9y&X-Amz-Signature=5044414f4b179225cc89228961fb787e79db570ca9aabf64e8e51244f06a236c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
