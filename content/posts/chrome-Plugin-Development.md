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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VY3GSNXY%2F20261114%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261114T124106Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDsCjIRaQLonHjZwYw1AofN7gY%2Bcjda84ebp%2BN0SN15LQIgBKqeibScr2lpocb8ZNbmE0HcizGefzI%2FNKy2gKKuvq8qiAQImv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDIv178tGWqk0LTAfcyrcA8U9CTgt5Mqx49LrrvkfP5%2FmFvqXLfYzKcg5yUgu%2BGTlxjy284V5t%2FQtdKqbwVH5yNeO9aOr1lYI1i%2BfQZrYvYdkH9zJZKkGUClCYEVjw5BEQhx78j6RxOMPzk9Bw31Y3heJ2mGk51FBBIa1PBow7j1vcRMZAfWqIgaFvO6lRd0UxKqp3nx851rWmIH9AYQthwce1j6HN3XnGtE4%2FmPPzG1TA%2Bk87tyPzFfuvuqs2uXCUQreqB9gogB9SrePGObJmQsCrFj88vS25rxYQhOQ80%2Fv939d8jRMjtOONPXSFYADbWN03Tj215aVGf6FgfZCrN%2F66NYkVH1xtVjOPZin%2B2PVeHmsgBpHt%2F4Vu3NdFcCqr74bPPeNy1NGPHTzjzVLIFyi8yrcSendLwn8DwqPa8Bg3kJDmQkCJ9KMXiWrf249HO%2BCasNBRpGuuEJarRvQqrriOQ6uS5JQS2pCD5%2BKqvog70r3qY0R3xk1Vg%2BkSxNHa77IgYjom3IPpKjyBHEiiBDU9KE%2BHTNlx7mH09qIPGhGEFLJPJr78p7omT%2Fg8fqepjsfz7SOu5yfhRSgx1zJHq7exdR9gibFaE8mEWYbtAysxK57vjp9ubXwaqvC%2FOD5wi%2Fc%2F2yOOv5k84qAMNzD4NcGOqUB%2FuYUewH3DNkbejsU64vUR6y8rkk%2FSBN25eckAZ%2BfxlWyUxef7%2BvEaepjdjWl8M3dXCnHkJbcbxVE8xmB%2BHya1vbqaq9ZSaizSaTx2bG4OI3Jddpt3fqChM4MVEimOs21RL2qXM%2Fh0YuCPtQKQskBbMdVChvuYNUe2M2ogdjmnMWhfCQPhaOtTyo6yS9JUckt9rNaCUsCCeqsAzduLZ8aKlKMZIBe&X-Amz-Signature=bc768aa0dbec2729797f1149305b825e7129967a0fd4f89fc8c390fe522c9213&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VY3GSNXY%2F20261114%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261114T124106Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDsCjIRaQLonHjZwYw1AofN7gY%2Bcjda84ebp%2BN0SN15LQIgBKqeibScr2lpocb8ZNbmE0HcizGefzI%2FNKy2gKKuvq8qiAQImv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDIv178tGWqk0LTAfcyrcA8U9CTgt5Mqx49LrrvkfP5%2FmFvqXLfYzKcg5yUgu%2BGTlxjy284V5t%2FQtdKqbwVH5yNeO9aOr1lYI1i%2BfQZrYvYdkH9zJZKkGUClCYEVjw5BEQhx78j6RxOMPzk9Bw31Y3heJ2mGk51FBBIa1PBow7j1vcRMZAfWqIgaFvO6lRd0UxKqp3nx851rWmIH9AYQthwce1j6HN3XnGtE4%2FmPPzG1TA%2Bk87tyPzFfuvuqs2uXCUQreqB9gogB9SrePGObJmQsCrFj88vS25rxYQhOQ80%2Fv939d8jRMjtOONPXSFYADbWN03Tj215aVGf6FgfZCrN%2F66NYkVH1xtVjOPZin%2B2PVeHmsgBpHt%2F4Vu3NdFcCqr74bPPeNy1NGPHTzjzVLIFyi8yrcSendLwn8DwqPa8Bg3kJDmQkCJ9KMXiWrf249HO%2BCasNBRpGuuEJarRvQqrriOQ6uS5JQS2pCD5%2BKqvog70r3qY0R3xk1Vg%2BkSxNHa77IgYjom3IPpKjyBHEiiBDU9KE%2BHTNlx7mH09qIPGhGEFLJPJr78p7omT%2Fg8fqepjsfz7SOu5yfhRSgx1zJHq7exdR9gibFaE8mEWYbtAysxK57vjp9ubXwaqvC%2FOD5wi%2Fc%2F2yOOv5k84qAMNzD4NcGOqUB%2FuYUewH3DNkbejsU64vUR6y8rkk%2FSBN25eckAZ%2BfxlWyUxef7%2BvEaepjdjWl8M3dXCnHkJbcbxVE8xmB%2BHya1vbqaq9ZSaizSaTx2bG4OI3Jddpt3fqChM4MVEimOs21RL2qXM%2Fh0YuCPtQKQskBbMdVChvuYNUe2M2ogdjmnMWhfCQPhaOtTyo6yS9JUckt9rNaCUsCCeqsAzduLZ8aKlKMZIBe&X-Amz-Signature=b7af69acb16780010e34cb233efbc0626af5d7aba4d8e6aeac85f34e0507018f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VY3GSNXY%2F20261114%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261114T124106Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDsCjIRaQLonHjZwYw1AofN7gY%2Bcjda84ebp%2BN0SN15LQIgBKqeibScr2lpocb8ZNbmE0HcizGefzI%2FNKy2gKKuvq8qiAQImv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDIv178tGWqk0LTAfcyrcA8U9CTgt5Mqx49LrrvkfP5%2FmFvqXLfYzKcg5yUgu%2BGTlxjy284V5t%2FQtdKqbwVH5yNeO9aOr1lYI1i%2BfQZrYvYdkH9zJZKkGUClCYEVjw5BEQhx78j6RxOMPzk9Bw31Y3heJ2mGk51FBBIa1PBow7j1vcRMZAfWqIgaFvO6lRd0UxKqp3nx851rWmIH9AYQthwce1j6HN3XnGtE4%2FmPPzG1TA%2Bk87tyPzFfuvuqs2uXCUQreqB9gogB9SrePGObJmQsCrFj88vS25rxYQhOQ80%2Fv939d8jRMjtOONPXSFYADbWN03Tj215aVGf6FgfZCrN%2F66NYkVH1xtVjOPZin%2B2PVeHmsgBpHt%2F4Vu3NdFcCqr74bPPeNy1NGPHTzjzVLIFyi8yrcSendLwn8DwqPa8Bg3kJDmQkCJ9KMXiWrf249HO%2BCasNBRpGuuEJarRvQqrriOQ6uS5JQS2pCD5%2BKqvog70r3qY0R3xk1Vg%2BkSxNHa77IgYjom3IPpKjyBHEiiBDU9KE%2BHTNlx7mH09qIPGhGEFLJPJr78p7omT%2Fg8fqepjsfz7SOu5yfhRSgx1zJHq7exdR9gibFaE8mEWYbtAysxK57vjp9ubXwaqvC%2FOD5wi%2Fc%2F2yOOv5k84qAMNzD4NcGOqUB%2FuYUewH3DNkbejsU64vUR6y8rkk%2FSBN25eckAZ%2BfxlWyUxef7%2BvEaepjdjWl8M3dXCnHkJbcbxVE8xmB%2BHya1vbqaq9ZSaizSaTx2bG4OI3Jddpt3fqChM4MVEimOs21RL2qXM%2Fh0YuCPtQKQskBbMdVChvuYNUe2M2ogdjmnMWhfCQPhaOtTyo6yS9JUckt9rNaCUsCCeqsAzduLZ8aKlKMZIBe&X-Amz-Signature=face761cda4fa86fa7a09db9b9e9f2a587ad9025ff50dbf4d18623b64f4ff12e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VY3GSNXY%2F20261114%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261114T124106Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDsCjIRaQLonHjZwYw1AofN7gY%2Bcjda84ebp%2BN0SN15LQIgBKqeibScr2lpocb8ZNbmE0HcizGefzI%2FNKy2gKKuvq8qiAQImv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDIv178tGWqk0LTAfcyrcA8U9CTgt5Mqx49LrrvkfP5%2FmFvqXLfYzKcg5yUgu%2BGTlxjy284V5t%2FQtdKqbwVH5yNeO9aOr1lYI1i%2BfQZrYvYdkH9zJZKkGUClCYEVjw5BEQhx78j6RxOMPzk9Bw31Y3heJ2mGk51FBBIa1PBow7j1vcRMZAfWqIgaFvO6lRd0UxKqp3nx851rWmIH9AYQthwce1j6HN3XnGtE4%2FmPPzG1TA%2Bk87tyPzFfuvuqs2uXCUQreqB9gogB9SrePGObJmQsCrFj88vS25rxYQhOQ80%2Fv939d8jRMjtOONPXSFYADbWN03Tj215aVGf6FgfZCrN%2F66NYkVH1xtVjOPZin%2B2PVeHmsgBpHt%2F4Vu3NdFcCqr74bPPeNy1NGPHTzjzVLIFyi8yrcSendLwn8DwqPa8Bg3kJDmQkCJ9KMXiWrf249HO%2BCasNBRpGuuEJarRvQqrriOQ6uS5JQS2pCD5%2BKqvog70r3qY0R3xk1Vg%2BkSxNHa77IgYjom3IPpKjyBHEiiBDU9KE%2BHTNlx7mH09qIPGhGEFLJPJr78p7omT%2Fg8fqepjsfz7SOu5yfhRSgx1zJHq7exdR9gibFaE8mEWYbtAysxK57vjp9ubXwaqvC%2FOD5wi%2Fc%2F2yOOv5k84qAMNzD4NcGOqUB%2FuYUewH3DNkbejsU64vUR6y8rkk%2FSBN25eckAZ%2BfxlWyUxef7%2BvEaepjdjWl8M3dXCnHkJbcbxVE8xmB%2BHya1vbqaq9ZSaizSaTx2bG4OI3Jddpt3fqChM4MVEimOs21RL2qXM%2Fh0YuCPtQKQskBbMdVChvuYNUe2M2ogdjmnMWhfCQPhaOtTyo6yS9JUckt9rNaCUsCCeqsAzduLZ8aKlKMZIBe&X-Amz-Signature=e3c968d07398bd0a9ddb56fb67e6c41bb9c7f87cad8fb0b0b8e4d74a5a966d4c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
