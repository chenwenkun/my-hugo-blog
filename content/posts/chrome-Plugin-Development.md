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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WRY2QUH6%2F20260830%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260830T105302Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEK%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIDBYsFwMeYmLM%2FG%2FBUsMICS5IYZA1f7jhZWJ4VTp8pQqAiEA2OZnvx51ZCfx5LzUqCnW5iWUNofVG%2Bz7xFgqWtqUGXIq%2FwMIeBAAGgw2Mzc0MjMxODM4MDUiDJVy4m6jsEcwO0or3CrcA0SFkgW053lBjscf2ltj9%2F5FAor4uasNy9F0GdTUBL2nx%2Bn8kBZxEHO0id2WNKi%2FZWjIRverrwYCn7eLQoIaKLsRNO%2BlzHG2Td0G2W6J2zl78Sh5bG9q2Sv%2FWTFvZw8NnBdezS0hoF2%2Bd6w7fSW67mhnYB1dm3dfIdcIUKv8lCesvsvFrOnbjfiIJo7819tlhQbMv2VijLT83vg5O4%2FDXrmUA57uy89jFZ9mn7HCA9PFEJhR100h%2FlpGIlZoG4sRgzGb32LvwUwF9kY0gtbZmTvmOPswdBUrWyK%2B23axbumepvwMq24R86FBiPt83f%2FLb2aDgQjJYUi%2FWV3whTUveoCZKdBKUE0D8nw9nC8gFLxrAheWw6c%2F2r4kNyY1MYUX5qVgseE21MclWQR97keZLxay28VvTDvsg%2FBX8WekPC9vZm7nGRJdhVE%2BeBg8iTiygregr5MCsCBtMHLKxSxqemcWv8eyNutc8FC5LlVZY7nCWdAdO3mo5YFeNmsfa%2B8t1JjZ1i863cKI08jv9xD%2B%2BvVXIqlASE%2FF0YZqZqMPVu6dRwGGBLdCJqYGNxZJg1SElt2al6s8fL%2FDMYmbpv%2FA59RREFCQOV6pvAWItanEfqNxYS0TEmF71PcYtJzMMJivz9QGOqUBV%2BwfqpyECRFpZRBI%2BA%2FOYe87xG0WH0tMRfTbXEm1zO08oHXO9PdH95shUsiDXHd0fO0QWgYIm8Q6uf%2BAe%2FUVaKeOPBCPwJex2%2FxTPV3KK59FLNp0TQNho1zJETi6iHnORpQUqwy7dP8qKQZm0klfXlTsEELwobdrBid0rz9iDYQQBMNPnA8UxlTnbVQz3Zmu4ZmUTOp6gqOf7oayO4p%2FsV%2F9gFGx&X-Amz-Signature=87a8bb9ef883f7a11daced7601be179e93a19cd5a5939db142ddd336b8904e26&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WRY2QUH6%2F20260830%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260830T105302Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEK%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIDBYsFwMeYmLM%2FG%2FBUsMICS5IYZA1f7jhZWJ4VTp8pQqAiEA2OZnvx51ZCfx5LzUqCnW5iWUNofVG%2Bz7xFgqWtqUGXIq%2FwMIeBAAGgw2Mzc0MjMxODM4MDUiDJVy4m6jsEcwO0or3CrcA0SFkgW053lBjscf2ltj9%2F5FAor4uasNy9F0GdTUBL2nx%2Bn8kBZxEHO0id2WNKi%2FZWjIRverrwYCn7eLQoIaKLsRNO%2BlzHG2Td0G2W6J2zl78Sh5bG9q2Sv%2FWTFvZw8NnBdezS0hoF2%2Bd6w7fSW67mhnYB1dm3dfIdcIUKv8lCesvsvFrOnbjfiIJo7819tlhQbMv2VijLT83vg5O4%2FDXrmUA57uy89jFZ9mn7HCA9PFEJhR100h%2FlpGIlZoG4sRgzGb32LvwUwF9kY0gtbZmTvmOPswdBUrWyK%2B23axbumepvwMq24R86FBiPt83f%2FLb2aDgQjJYUi%2FWV3whTUveoCZKdBKUE0D8nw9nC8gFLxrAheWw6c%2F2r4kNyY1MYUX5qVgseE21MclWQR97keZLxay28VvTDvsg%2FBX8WekPC9vZm7nGRJdhVE%2BeBg8iTiygregr5MCsCBtMHLKxSxqemcWv8eyNutc8FC5LlVZY7nCWdAdO3mo5YFeNmsfa%2B8t1JjZ1i863cKI08jv9xD%2B%2BvVXIqlASE%2FF0YZqZqMPVu6dRwGGBLdCJqYGNxZJg1SElt2al6s8fL%2FDMYmbpv%2FA59RREFCQOV6pvAWItanEfqNxYS0TEmF71PcYtJzMMJivz9QGOqUBV%2BwfqpyECRFpZRBI%2BA%2FOYe87xG0WH0tMRfTbXEm1zO08oHXO9PdH95shUsiDXHd0fO0QWgYIm8Q6uf%2BAe%2FUVaKeOPBCPwJex2%2FxTPV3KK59FLNp0TQNho1zJETi6iHnORpQUqwy7dP8qKQZm0klfXlTsEELwobdrBid0rz9iDYQQBMNPnA8UxlTnbVQz3Zmu4ZmUTOp6gqOf7oayO4p%2FsV%2F9gFGx&X-Amz-Signature=802ed5b832b5ce595406e0ac795455a136d343670f6fdebf1eeb2404fc864f0d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WRY2QUH6%2F20260830%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260830T105302Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEK%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIDBYsFwMeYmLM%2FG%2FBUsMICS5IYZA1f7jhZWJ4VTp8pQqAiEA2OZnvx51ZCfx5LzUqCnW5iWUNofVG%2Bz7xFgqWtqUGXIq%2FwMIeBAAGgw2Mzc0MjMxODM4MDUiDJVy4m6jsEcwO0or3CrcA0SFkgW053lBjscf2ltj9%2F5FAor4uasNy9F0GdTUBL2nx%2Bn8kBZxEHO0id2WNKi%2FZWjIRverrwYCn7eLQoIaKLsRNO%2BlzHG2Td0G2W6J2zl78Sh5bG9q2Sv%2FWTFvZw8NnBdezS0hoF2%2Bd6w7fSW67mhnYB1dm3dfIdcIUKv8lCesvsvFrOnbjfiIJo7819tlhQbMv2VijLT83vg5O4%2FDXrmUA57uy89jFZ9mn7HCA9PFEJhR100h%2FlpGIlZoG4sRgzGb32LvwUwF9kY0gtbZmTvmOPswdBUrWyK%2B23axbumepvwMq24R86FBiPt83f%2FLb2aDgQjJYUi%2FWV3whTUveoCZKdBKUE0D8nw9nC8gFLxrAheWw6c%2F2r4kNyY1MYUX5qVgseE21MclWQR97keZLxay28VvTDvsg%2FBX8WekPC9vZm7nGRJdhVE%2BeBg8iTiygregr5MCsCBtMHLKxSxqemcWv8eyNutc8FC5LlVZY7nCWdAdO3mo5YFeNmsfa%2B8t1JjZ1i863cKI08jv9xD%2B%2BvVXIqlASE%2FF0YZqZqMPVu6dRwGGBLdCJqYGNxZJg1SElt2al6s8fL%2FDMYmbpv%2FA59RREFCQOV6pvAWItanEfqNxYS0TEmF71PcYtJzMMJivz9QGOqUBV%2BwfqpyECRFpZRBI%2BA%2FOYe87xG0WH0tMRfTbXEm1zO08oHXO9PdH95shUsiDXHd0fO0QWgYIm8Q6uf%2BAe%2FUVaKeOPBCPwJex2%2FxTPV3KK59FLNp0TQNho1zJETi6iHnORpQUqwy7dP8qKQZm0klfXlTsEELwobdrBid0rz9iDYQQBMNPnA8UxlTnbVQz3Zmu4ZmUTOp6gqOf7oayO4p%2FsV%2F9gFGx&X-Amz-Signature=64da77a31edd29875cd1510e9a587fd586cdac2d145a0578a03ee435a09410cc&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WRY2QUH6%2F20260830%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260830T105302Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEK%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIDBYsFwMeYmLM%2FG%2FBUsMICS5IYZA1f7jhZWJ4VTp8pQqAiEA2OZnvx51ZCfx5LzUqCnW5iWUNofVG%2Bz7xFgqWtqUGXIq%2FwMIeBAAGgw2Mzc0MjMxODM4MDUiDJVy4m6jsEcwO0or3CrcA0SFkgW053lBjscf2ltj9%2F5FAor4uasNy9F0GdTUBL2nx%2Bn8kBZxEHO0id2WNKi%2FZWjIRverrwYCn7eLQoIaKLsRNO%2BlzHG2Td0G2W6J2zl78Sh5bG9q2Sv%2FWTFvZw8NnBdezS0hoF2%2Bd6w7fSW67mhnYB1dm3dfIdcIUKv8lCesvsvFrOnbjfiIJo7819tlhQbMv2VijLT83vg5O4%2FDXrmUA57uy89jFZ9mn7HCA9PFEJhR100h%2FlpGIlZoG4sRgzGb32LvwUwF9kY0gtbZmTvmOPswdBUrWyK%2B23axbumepvwMq24R86FBiPt83f%2FLb2aDgQjJYUi%2FWV3whTUveoCZKdBKUE0D8nw9nC8gFLxrAheWw6c%2F2r4kNyY1MYUX5qVgseE21MclWQR97keZLxay28VvTDvsg%2FBX8WekPC9vZm7nGRJdhVE%2BeBg8iTiygregr5MCsCBtMHLKxSxqemcWv8eyNutc8FC5LlVZY7nCWdAdO3mo5YFeNmsfa%2B8t1JjZ1i863cKI08jv9xD%2B%2BvVXIqlASE%2FF0YZqZqMPVu6dRwGGBLdCJqYGNxZJg1SElt2al6s8fL%2FDMYmbpv%2FA59RREFCQOV6pvAWItanEfqNxYS0TEmF71PcYtJzMMJivz9QGOqUBV%2BwfqpyECRFpZRBI%2BA%2FOYe87xG0WH0tMRfTbXEm1zO08oHXO9PdH95shUsiDXHd0fO0QWgYIm8Q6uf%2BAe%2FUVaKeOPBCPwJex2%2FxTPV3KK59FLNp0TQNho1zJETi6iHnORpQUqwy7dP8qKQZm0klfXlTsEELwobdrBid0rz9iDYQQBMNPnA8UxlTnbVQz3Zmu4ZmUTOp6gqOf7oayO4p%2FsV%2F9gFGx&X-Amz-Signature=04247245962ef1dc4d64cc99016ef5ae8e1f77e66e9f7542fa4c52c6bc9eaf1a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
