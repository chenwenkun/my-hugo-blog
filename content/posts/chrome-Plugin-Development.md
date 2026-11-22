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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SUACY5UN%2F20261122%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261122T225609Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIAZ%2Bm6f0avouUi8p7Vrg3iHadeJthmLXm6MgkSIjoeuXAiEAupnrQ8MUk4%2FvG39F%2BKF8oT5Ua12qfT1T7legWqHiCfYq%2FwMIZxAAGgw2Mzc0MjMxODM4MDUiDMNShvIQ2Nd2o8faYircA0WKqj6y4BkMJBBASbf2Rtq1hohZCRzYUagKK4AqrjPY%2F6RyIFLZyUVFViuiV24%2BZ8TvTXRdKUV8%2FBxrDFu7KLB%2BVxhvWXhirI%2FmCe%2F%2FKc4KbAM9CYcg4xICef%2BJJ8ypVWkZJvoK6YtOzIRBd4CYvrCaV1S7din2xynYOEQE1CJBP9LzirO1H0u%2FzPKFvQZEOepU%2Fw0W%2BP1jhxAfoa8Si4j8ZwAnxZefngpp2moJMQqDxUVnpOPRr2WW1cJ2dh1I63XAMMhHDf29%2BihohIccsmDHGu6QzNPr7iUamJDFI4Hf93B5ndRDki%2BJfjk9YNC1wnOOJ3RFStFQtm5Rnmkxkf9eUknKmsYFPeMztsITFOt4TrrF%2BHmfFO7lVNhtmOMCA6umwkm68pCrsRI2p3Vr29RQPaxIBMWNjVZ3%2BcHGG6OXy3QLWik0uC%2BlPvM%2FDdnCC36qJTMnxST3tJiundARAi8Zwpi1vp%2F4XbqfSh1Xp0N9m9OOJMaM3Q0cOv6QJWq%2FLlSyGJFeCJ3XCNzvybLokm0008FPA8ijLjvLrORtlBEV3RHStcoylyEZwjVOWc%2Fp2acI5W35sOEYIV12jnfpks5x%2FrbKsxm1U6owCEA81I9%2Fk24aeOzkgNjYYQwEMKHjjdgGOqUBRe05fyPy3dRObG0JTDj069kTXQqsgoOtlS%2Buoh1AfQGsVP6jRsbo956NHGfDk3X4Znx4KyScOven8bP2axDLxngmRZI7jVejx%2FYBqZ6ww2Pw509euVjtHmAq1BtSj5zM%2By8bgJiRKBSpxfMV4wyL6BigfBNbVx4XHTe1fEQfJvwU9VU0fKyhS2YWche7SEfGPaPwiYzIpaEe016aNkFE%2BIsVHz7A&X-Amz-Signature=4a351000128de9a11fc6ff6188f65f7aecf58824cfb4b90de65ca4119a8b6be9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SUACY5UN%2F20261122%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261122T225609Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIAZ%2Bm6f0avouUi8p7Vrg3iHadeJthmLXm6MgkSIjoeuXAiEAupnrQ8MUk4%2FvG39F%2BKF8oT5Ua12qfT1T7legWqHiCfYq%2FwMIZxAAGgw2Mzc0MjMxODM4MDUiDMNShvIQ2Nd2o8faYircA0WKqj6y4BkMJBBASbf2Rtq1hohZCRzYUagKK4AqrjPY%2F6RyIFLZyUVFViuiV24%2BZ8TvTXRdKUV8%2FBxrDFu7KLB%2BVxhvWXhirI%2FmCe%2F%2FKc4KbAM9CYcg4xICef%2BJJ8ypVWkZJvoK6YtOzIRBd4CYvrCaV1S7din2xynYOEQE1CJBP9LzirO1H0u%2FzPKFvQZEOepU%2Fw0W%2BP1jhxAfoa8Si4j8ZwAnxZefngpp2moJMQqDxUVnpOPRr2WW1cJ2dh1I63XAMMhHDf29%2BihohIccsmDHGu6QzNPr7iUamJDFI4Hf93B5ndRDki%2BJfjk9YNC1wnOOJ3RFStFQtm5Rnmkxkf9eUknKmsYFPeMztsITFOt4TrrF%2BHmfFO7lVNhtmOMCA6umwkm68pCrsRI2p3Vr29RQPaxIBMWNjVZ3%2BcHGG6OXy3QLWik0uC%2BlPvM%2FDdnCC36qJTMnxST3tJiundARAi8Zwpi1vp%2F4XbqfSh1Xp0N9m9OOJMaM3Q0cOv6QJWq%2FLlSyGJFeCJ3XCNzvybLokm0008FPA8ijLjvLrORtlBEV3RHStcoylyEZwjVOWc%2Fp2acI5W35sOEYIV12jnfpks5x%2FrbKsxm1U6owCEA81I9%2Fk24aeOzkgNjYYQwEMKHjjdgGOqUBRe05fyPy3dRObG0JTDj069kTXQqsgoOtlS%2Buoh1AfQGsVP6jRsbo956NHGfDk3X4Znx4KyScOven8bP2axDLxngmRZI7jVejx%2FYBqZ6ww2Pw509euVjtHmAq1BtSj5zM%2By8bgJiRKBSpxfMV4wyL6BigfBNbVx4XHTe1fEQfJvwU9VU0fKyhS2YWche7SEfGPaPwiYzIpaEe016aNkFE%2BIsVHz7A&X-Amz-Signature=c54336f970a4d9f71a71aafd18bf5c7fe6d4d82c1f443a1dc9253a297ff327d1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SUACY5UN%2F20261122%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261122T225609Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIAZ%2Bm6f0avouUi8p7Vrg3iHadeJthmLXm6MgkSIjoeuXAiEAupnrQ8MUk4%2FvG39F%2BKF8oT5Ua12qfT1T7legWqHiCfYq%2FwMIZxAAGgw2Mzc0MjMxODM4MDUiDMNShvIQ2Nd2o8faYircA0WKqj6y4BkMJBBASbf2Rtq1hohZCRzYUagKK4AqrjPY%2F6RyIFLZyUVFViuiV24%2BZ8TvTXRdKUV8%2FBxrDFu7KLB%2BVxhvWXhirI%2FmCe%2F%2FKc4KbAM9CYcg4xICef%2BJJ8ypVWkZJvoK6YtOzIRBd4CYvrCaV1S7din2xynYOEQE1CJBP9LzirO1H0u%2FzPKFvQZEOepU%2Fw0W%2BP1jhxAfoa8Si4j8ZwAnxZefngpp2moJMQqDxUVnpOPRr2WW1cJ2dh1I63XAMMhHDf29%2BihohIccsmDHGu6QzNPr7iUamJDFI4Hf93B5ndRDki%2BJfjk9YNC1wnOOJ3RFStFQtm5Rnmkxkf9eUknKmsYFPeMztsITFOt4TrrF%2BHmfFO7lVNhtmOMCA6umwkm68pCrsRI2p3Vr29RQPaxIBMWNjVZ3%2BcHGG6OXy3QLWik0uC%2BlPvM%2FDdnCC36qJTMnxST3tJiundARAi8Zwpi1vp%2F4XbqfSh1Xp0N9m9OOJMaM3Q0cOv6QJWq%2FLlSyGJFeCJ3XCNzvybLokm0008FPA8ijLjvLrORtlBEV3RHStcoylyEZwjVOWc%2Fp2acI5W35sOEYIV12jnfpks5x%2FrbKsxm1U6owCEA81I9%2Fk24aeOzkgNjYYQwEMKHjjdgGOqUBRe05fyPy3dRObG0JTDj069kTXQqsgoOtlS%2Buoh1AfQGsVP6jRsbo956NHGfDk3X4Znx4KyScOven8bP2axDLxngmRZI7jVejx%2FYBqZ6ww2Pw509euVjtHmAq1BtSj5zM%2By8bgJiRKBSpxfMV4wyL6BigfBNbVx4XHTe1fEQfJvwU9VU0fKyhS2YWche7SEfGPaPwiYzIpaEe016aNkFE%2BIsVHz7A&X-Amz-Signature=bc6ae6c531e5e4ba60af5a43e96ee07fa18d4c8d84fb8f2379e56a204f3f3c20&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SUACY5UN%2F20261122%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261122T225609Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIAZ%2Bm6f0avouUi8p7Vrg3iHadeJthmLXm6MgkSIjoeuXAiEAupnrQ8MUk4%2FvG39F%2BKF8oT5Ua12qfT1T7legWqHiCfYq%2FwMIZxAAGgw2Mzc0MjMxODM4MDUiDMNShvIQ2Nd2o8faYircA0WKqj6y4BkMJBBASbf2Rtq1hohZCRzYUagKK4AqrjPY%2F6RyIFLZyUVFViuiV24%2BZ8TvTXRdKUV8%2FBxrDFu7KLB%2BVxhvWXhirI%2FmCe%2F%2FKc4KbAM9CYcg4xICef%2BJJ8ypVWkZJvoK6YtOzIRBd4CYvrCaV1S7din2xynYOEQE1CJBP9LzirO1H0u%2FzPKFvQZEOepU%2Fw0W%2BP1jhxAfoa8Si4j8ZwAnxZefngpp2moJMQqDxUVnpOPRr2WW1cJ2dh1I63XAMMhHDf29%2BihohIccsmDHGu6QzNPr7iUamJDFI4Hf93B5ndRDki%2BJfjk9YNC1wnOOJ3RFStFQtm5Rnmkxkf9eUknKmsYFPeMztsITFOt4TrrF%2BHmfFO7lVNhtmOMCA6umwkm68pCrsRI2p3Vr29RQPaxIBMWNjVZ3%2BcHGG6OXy3QLWik0uC%2BlPvM%2FDdnCC36qJTMnxST3tJiundARAi8Zwpi1vp%2F4XbqfSh1Xp0N9m9OOJMaM3Q0cOv6QJWq%2FLlSyGJFeCJ3XCNzvybLokm0008FPA8ijLjvLrORtlBEV3RHStcoylyEZwjVOWc%2Fp2acI5W35sOEYIV12jnfpks5x%2FrbKsxm1U6owCEA81I9%2Fk24aeOzkgNjYYQwEMKHjjdgGOqUBRe05fyPy3dRObG0JTDj069kTXQqsgoOtlS%2Buoh1AfQGsVP6jRsbo956NHGfDk3X4Znx4KyScOven8bP2axDLxngmRZI7jVejx%2FYBqZ6ww2Pw509euVjtHmAq1BtSj5zM%2By8bgJiRKBSpxfMV4wyL6BigfBNbVx4XHTe1fEQfJvwU9VU0fKyhS2YWche7SEfGPaPwiYzIpaEe016aNkFE%2BIsVHz7A&X-Amz-Signature=ac88ca3a4e22e8afda27824980bfee3f997a8d6b1b8bee6a5853bcdc65fdc580&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
