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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VU3LU7OX%2F20260928%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260928T121815Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGwaCXVzLXdlc3QtMiJHMEUCIBmt2l9ahfviXg%2B0r7KNZ7EGfEfb1IwRa%2BE92GcK%2BeyyAiEAuvsqe7Gq7SBR7iTx8UuL6aUML%2FaLrJ8CwZ0b9QInyEQq%2FwMINRAAGgw2Mzc0MjMxODM4MDUiDGrV1O%2BHUwrs9e8BfircA27P1laGEMf2dHrEFkZWE1aXnop7FK2ajXoGiiKl3uQ2ippAsFlB4oYzMMFTsYSMapKxYBqK%2BTmQkkw5IxrZv5w5MdT7ic2GJHr7yatxV8Quoh2jRsp1QsoUorvyNv%2BZ4rnJruvG2lx8PQPn1xD%2BEV7pEcDUqQuCNjP3x7nCs%2F%2FKf7moVSKJArMhD2xpsQbAF6htBQzizGBHDfysvzyFVjwpVUjBa7NY%2BnQCzUNZVwNAtBqATzzfBQk%2BBkNdvPPx%2FXne%2BJ2IuAVkBqArugZmppDVv%2B4PhObcNgJeBCZrL3GPQo195ZchlFJ2Txre6g%2FYNH1pmW%2FoGE%2BTBDR4%2BEmlqqYf1JsA7x9an%2BW7FtqLY6hGMEV7SKC2rqL02GkQv1jV1FxhFcSuFcGlhBfLG%2FlzOWAo0Q3ZAV%2F9IhIEBJ70c1SdY5Y3LZsGau2jxoFVrjW4cqgqXLPUonCa0Mpuup9vunrlPCTMeZt79djTzoMQwxy01xtgaxTYsa8a0zWFc2UAV%2BayJaT7%2B3EHohr9ydU9K49mv0Uk7g%2F%2Blzy2aiEjI2jnrzYWwoOkBRxjLva5WPKdUWaVLyYU%2BDbs976c0QwsczMipJQ0Z%2FiYYb1SPtjAXV%2FPzoDoFfJIMjukWi0DMIGy6dUGOqUB7RwJ5NpmneMAe9M5euk0B1c7miIXhJvWbW6Uvi60SyMTwZETT2fnwJWhcr%2FeQJCTCjzCaykrD7xzcdJTZ6CEG%2Fwr5r137H3FmRk%2Fy5xZtifb%2ByAmpCK%2FFIc3Dheuzel8JoK2CUSc8588aBBryaFY%2Byi1qlP2fRclSunHlvJEQVurA88K5%2B5w0c3u%2BYGAZJPJExOK96chvFZ7XhIhQBzgDRv9LQxc&X-Amz-Signature=965e67402238c935061259261b52e3447dad0e0df95a053573f3deb2757d1c63&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VU3LU7OX%2F20260928%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260928T121815Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGwaCXVzLXdlc3QtMiJHMEUCIBmt2l9ahfviXg%2B0r7KNZ7EGfEfb1IwRa%2BE92GcK%2BeyyAiEAuvsqe7Gq7SBR7iTx8UuL6aUML%2FaLrJ8CwZ0b9QInyEQq%2FwMINRAAGgw2Mzc0MjMxODM4MDUiDGrV1O%2BHUwrs9e8BfircA27P1laGEMf2dHrEFkZWE1aXnop7FK2ajXoGiiKl3uQ2ippAsFlB4oYzMMFTsYSMapKxYBqK%2BTmQkkw5IxrZv5w5MdT7ic2GJHr7yatxV8Quoh2jRsp1QsoUorvyNv%2BZ4rnJruvG2lx8PQPn1xD%2BEV7pEcDUqQuCNjP3x7nCs%2F%2FKf7moVSKJArMhD2xpsQbAF6htBQzizGBHDfysvzyFVjwpVUjBa7NY%2BnQCzUNZVwNAtBqATzzfBQk%2BBkNdvPPx%2FXne%2BJ2IuAVkBqArugZmppDVv%2B4PhObcNgJeBCZrL3GPQo195ZchlFJ2Txre6g%2FYNH1pmW%2FoGE%2BTBDR4%2BEmlqqYf1JsA7x9an%2BW7FtqLY6hGMEV7SKC2rqL02GkQv1jV1FxhFcSuFcGlhBfLG%2FlzOWAo0Q3ZAV%2F9IhIEBJ70c1SdY5Y3LZsGau2jxoFVrjW4cqgqXLPUonCa0Mpuup9vunrlPCTMeZt79djTzoMQwxy01xtgaxTYsa8a0zWFc2UAV%2BayJaT7%2B3EHohr9ydU9K49mv0Uk7g%2F%2Blzy2aiEjI2jnrzYWwoOkBRxjLva5WPKdUWaVLyYU%2BDbs976c0QwsczMipJQ0Z%2FiYYb1SPtjAXV%2FPzoDoFfJIMjukWi0DMIGy6dUGOqUB7RwJ5NpmneMAe9M5euk0B1c7miIXhJvWbW6Uvi60SyMTwZETT2fnwJWhcr%2FeQJCTCjzCaykrD7xzcdJTZ6CEG%2Fwr5r137H3FmRk%2Fy5xZtifb%2ByAmpCK%2FFIc3Dheuzel8JoK2CUSc8588aBBryaFY%2Byi1qlP2fRclSunHlvJEQVurA88K5%2B5w0c3u%2BYGAZJPJExOK96chvFZ7XhIhQBzgDRv9LQxc&X-Amz-Signature=dfa608763751d4393fa21dafd3f452a72ca3661477b033a0088b770d77351723&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VU3LU7OX%2F20260928%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260928T121815Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGwaCXVzLXdlc3QtMiJHMEUCIBmt2l9ahfviXg%2B0r7KNZ7EGfEfb1IwRa%2BE92GcK%2BeyyAiEAuvsqe7Gq7SBR7iTx8UuL6aUML%2FaLrJ8CwZ0b9QInyEQq%2FwMINRAAGgw2Mzc0MjMxODM4MDUiDGrV1O%2BHUwrs9e8BfircA27P1laGEMf2dHrEFkZWE1aXnop7FK2ajXoGiiKl3uQ2ippAsFlB4oYzMMFTsYSMapKxYBqK%2BTmQkkw5IxrZv5w5MdT7ic2GJHr7yatxV8Quoh2jRsp1QsoUorvyNv%2BZ4rnJruvG2lx8PQPn1xD%2BEV7pEcDUqQuCNjP3x7nCs%2F%2FKf7moVSKJArMhD2xpsQbAF6htBQzizGBHDfysvzyFVjwpVUjBa7NY%2BnQCzUNZVwNAtBqATzzfBQk%2BBkNdvPPx%2FXne%2BJ2IuAVkBqArugZmppDVv%2B4PhObcNgJeBCZrL3GPQo195ZchlFJ2Txre6g%2FYNH1pmW%2FoGE%2BTBDR4%2BEmlqqYf1JsA7x9an%2BW7FtqLY6hGMEV7SKC2rqL02GkQv1jV1FxhFcSuFcGlhBfLG%2FlzOWAo0Q3ZAV%2F9IhIEBJ70c1SdY5Y3LZsGau2jxoFVrjW4cqgqXLPUonCa0Mpuup9vunrlPCTMeZt79djTzoMQwxy01xtgaxTYsa8a0zWFc2UAV%2BayJaT7%2B3EHohr9ydU9K49mv0Uk7g%2F%2Blzy2aiEjI2jnrzYWwoOkBRxjLva5WPKdUWaVLyYU%2BDbs976c0QwsczMipJQ0Z%2FiYYb1SPtjAXV%2FPzoDoFfJIMjukWi0DMIGy6dUGOqUB7RwJ5NpmneMAe9M5euk0B1c7miIXhJvWbW6Uvi60SyMTwZETT2fnwJWhcr%2FeQJCTCjzCaykrD7xzcdJTZ6CEG%2Fwr5r137H3FmRk%2Fy5xZtifb%2ByAmpCK%2FFIc3Dheuzel8JoK2CUSc8588aBBryaFY%2Byi1qlP2fRclSunHlvJEQVurA88K5%2B5w0c3u%2BYGAZJPJExOK96chvFZ7XhIhQBzgDRv9LQxc&X-Amz-Signature=d96f713b4c0abd855105b89e75f783a1406d37033ce93d2564987d5e3eb984ea&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VU3LU7OX%2F20260928%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260928T121815Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGwaCXVzLXdlc3QtMiJHMEUCIBmt2l9ahfviXg%2B0r7KNZ7EGfEfb1IwRa%2BE92GcK%2BeyyAiEAuvsqe7Gq7SBR7iTx8UuL6aUML%2FaLrJ8CwZ0b9QInyEQq%2FwMINRAAGgw2Mzc0MjMxODM4MDUiDGrV1O%2BHUwrs9e8BfircA27P1laGEMf2dHrEFkZWE1aXnop7FK2ajXoGiiKl3uQ2ippAsFlB4oYzMMFTsYSMapKxYBqK%2BTmQkkw5IxrZv5w5MdT7ic2GJHr7yatxV8Quoh2jRsp1QsoUorvyNv%2BZ4rnJruvG2lx8PQPn1xD%2BEV7pEcDUqQuCNjP3x7nCs%2F%2FKf7moVSKJArMhD2xpsQbAF6htBQzizGBHDfysvzyFVjwpVUjBa7NY%2BnQCzUNZVwNAtBqATzzfBQk%2BBkNdvPPx%2FXne%2BJ2IuAVkBqArugZmppDVv%2B4PhObcNgJeBCZrL3GPQo195ZchlFJ2Txre6g%2FYNH1pmW%2FoGE%2BTBDR4%2BEmlqqYf1JsA7x9an%2BW7FtqLY6hGMEV7SKC2rqL02GkQv1jV1FxhFcSuFcGlhBfLG%2FlzOWAo0Q3ZAV%2F9IhIEBJ70c1SdY5Y3LZsGau2jxoFVrjW4cqgqXLPUonCa0Mpuup9vunrlPCTMeZt79djTzoMQwxy01xtgaxTYsa8a0zWFc2UAV%2BayJaT7%2B3EHohr9ydU9K49mv0Uk7g%2F%2Blzy2aiEjI2jnrzYWwoOkBRxjLva5WPKdUWaVLyYU%2BDbs976c0QwsczMipJQ0Z%2FiYYb1SPtjAXV%2FPzoDoFfJIMjukWi0DMIGy6dUGOqUB7RwJ5NpmneMAe9M5euk0B1c7miIXhJvWbW6Uvi60SyMTwZETT2fnwJWhcr%2FeQJCTCjzCaykrD7xzcdJTZ6CEG%2Fwr5r137H3FmRk%2Fy5xZtifb%2ByAmpCK%2FFIc3Dheuzel8JoK2CUSc8588aBBryaFY%2Byi1qlP2fRclSunHlvJEQVurA88K5%2B5w0c3u%2BYGAZJPJExOK96chvFZ7XhIhQBzgDRv9LQxc&X-Amz-Signature=690df7f9c63018549c662a601d67c4c1252d9492854fb81c5928faf8fd0c3901&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
