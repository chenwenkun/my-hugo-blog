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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VEDH53NU%2F20261010%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261010T205052Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIEL7HyJrt4ksTdGPTkqienSfTrXItSouDRkYlVUuCmoWAiArlL4w1Z7u2j6vf3jOfgdRm2jbTPK%2B2DlApmnPlQepbir%2FAwhcEAAaDDYzNzQyMzE4MzgwNSIMN0JYgwObftdeUOyNKtwDjK6dwAyM3Pf2yg2ccCKppIt8vS65IFDivjH81OYo41AiAnoAngLZnTc67oav0cQg24NR%2FH0khdeX%2FuQJ%2BKgOwTsGbIllBE91WIlHsznyYbjRiDKAUgGLVMQEJzYbJmFDVcJnLK7Vvl%2B2ePBSTs4NUMoltaJPLFKoK1zuUFuL%2Fwyjc0MpSiy%2FhBeLGSwE9yINkBKwjNH%2Fc6PYmPQwiRHKWtkstyA%2F2vNzHgxz%2F3PgX79YJdXgNMoCDCIt6B0WoX2WOYe7nF01CiPhF3AQntXVC%2B69swPx%2FBo0oD3KFhOhT7aXrT5VWS28sZM%2BIg6qv3ia%2BqyFRRWJc6EkY155TTIPiFOtqT%2FZBG1voiORuOfrRl4Wa2ZJNHZkpUr%2BqvNakfPYkgMV58gDWfKC3KIfDlGgrQePnwm%2BJEL2T1YCuV5Oo3kr2tmuX4Scza1OgHHXa2t1frZJkPR5IFxPUafvPbkhgFNrXXTAiYbZudcf%2Bp6rT4869uCfZZp57ea%2FCEhJ4F2%2B%2FbDpvhva5ClFhAYePChfLjxBSzU87m7gqtOHLbe2f1lRFq01HP6cQTGBZZs35xMjIo8%2BchJEyHXx8nQ3sT1d3EUa%2FE0w%2BC0UmwFqA54SvzsC%2B5n77HQtGtGO5Vgw06Kq1gY6pgHYL1MXvDs2p1YSUiF7gAZ9CVjopFvjpt%2FiEIuD17cH%2FkRLEnen9ZSRwUrFCQfyo6ZCYczcQ%2FhqbOUx33RRdLbdzePH3%2FYlpaEoAsksn1HwFtubmtNZzKxPflGKf0WBdg0%2Bfm7CJfWuuAyKFwKZkUW%2FizW3B%2BhZVRLREto5F4xk75x8WeqDL%2FNAQQCdhSWYViE4Jt3w22HJINXr0v8FuDHLGlcK%2BV8a&X-Amz-Signature=86ecea909d54dd5303af39073ce031e4aa1608dc042d0831a056bec1e2fe121d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VEDH53NU%2F20261010%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261010T205052Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIEL7HyJrt4ksTdGPTkqienSfTrXItSouDRkYlVUuCmoWAiArlL4w1Z7u2j6vf3jOfgdRm2jbTPK%2B2DlApmnPlQepbir%2FAwhcEAAaDDYzNzQyMzE4MzgwNSIMN0JYgwObftdeUOyNKtwDjK6dwAyM3Pf2yg2ccCKppIt8vS65IFDivjH81OYo41AiAnoAngLZnTc67oav0cQg24NR%2FH0khdeX%2FuQJ%2BKgOwTsGbIllBE91WIlHsznyYbjRiDKAUgGLVMQEJzYbJmFDVcJnLK7Vvl%2B2ePBSTs4NUMoltaJPLFKoK1zuUFuL%2Fwyjc0MpSiy%2FhBeLGSwE9yINkBKwjNH%2Fc6PYmPQwiRHKWtkstyA%2F2vNzHgxz%2F3PgX79YJdXgNMoCDCIt6B0WoX2WOYe7nF01CiPhF3AQntXVC%2B69swPx%2FBo0oD3KFhOhT7aXrT5VWS28sZM%2BIg6qv3ia%2BqyFRRWJc6EkY155TTIPiFOtqT%2FZBG1voiORuOfrRl4Wa2ZJNHZkpUr%2BqvNakfPYkgMV58gDWfKC3KIfDlGgrQePnwm%2BJEL2T1YCuV5Oo3kr2tmuX4Scza1OgHHXa2t1frZJkPR5IFxPUafvPbkhgFNrXXTAiYbZudcf%2Bp6rT4869uCfZZp57ea%2FCEhJ4F2%2B%2FbDpvhva5ClFhAYePChfLjxBSzU87m7gqtOHLbe2f1lRFq01HP6cQTGBZZs35xMjIo8%2BchJEyHXx8nQ3sT1d3EUa%2FE0w%2BC0UmwFqA54SvzsC%2B5n77HQtGtGO5Vgw06Kq1gY6pgHYL1MXvDs2p1YSUiF7gAZ9CVjopFvjpt%2FiEIuD17cH%2FkRLEnen9ZSRwUrFCQfyo6ZCYczcQ%2FhqbOUx33RRdLbdzePH3%2FYlpaEoAsksn1HwFtubmtNZzKxPflGKf0WBdg0%2Bfm7CJfWuuAyKFwKZkUW%2FizW3B%2BhZVRLREto5F4xk75x8WeqDL%2FNAQQCdhSWYViE4Jt3w22HJINXr0v8FuDHLGlcK%2BV8a&X-Amz-Signature=2dafd0a9c5a9c883896ca9c24be97bcee2c3644886d780949634c45f976d6fa5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VEDH53NU%2F20261010%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261010T205052Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIEL7HyJrt4ksTdGPTkqienSfTrXItSouDRkYlVUuCmoWAiArlL4w1Z7u2j6vf3jOfgdRm2jbTPK%2B2DlApmnPlQepbir%2FAwhcEAAaDDYzNzQyMzE4MzgwNSIMN0JYgwObftdeUOyNKtwDjK6dwAyM3Pf2yg2ccCKppIt8vS65IFDivjH81OYo41AiAnoAngLZnTc67oav0cQg24NR%2FH0khdeX%2FuQJ%2BKgOwTsGbIllBE91WIlHsznyYbjRiDKAUgGLVMQEJzYbJmFDVcJnLK7Vvl%2B2ePBSTs4NUMoltaJPLFKoK1zuUFuL%2Fwyjc0MpSiy%2FhBeLGSwE9yINkBKwjNH%2Fc6PYmPQwiRHKWtkstyA%2F2vNzHgxz%2F3PgX79YJdXgNMoCDCIt6B0WoX2WOYe7nF01CiPhF3AQntXVC%2B69swPx%2FBo0oD3KFhOhT7aXrT5VWS28sZM%2BIg6qv3ia%2BqyFRRWJc6EkY155TTIPiFOtqT%2FZBG1voiORuOfrRl4Wa2ZJNHZkpUr%2BqvNakfPYkgMV58gDWfKC3KIfDlGgrQePnwm%2BJEL2T1YCuV5Oo3kr2tmuX4Scza1OgHHXa2t1frZJkPR5IFxPUafvPbkhgFNrXXTAiYbZudcf%2Bp6rT4869uCfZZp57ea%2FCEhJ4F2%2B%2FbDpvhva5ClFhAYePChfLjxBSzU87m7gqtOHLbe2f1lRFq01HP6cQTGBZZs35xMjIo8%2BchJEyHXx8nQ3sT1d3EUa%2FE0w%2BC0UmwFqA54SvzsC%2B5n77HQtGtGO5Vgw06Kq1gY6pgHYL1MXvDs2p1YSUiF7gAZ9CVjopFvjpt%2FiEIuD17cH%2FkRLEnen9ZSRwUrFCQfyo6ZCYczcQ%2FhqbOUx33RRdLbdzePH3%2FYlpaEoAsksn1HwFtubmtNZzKxPflGKf0WBdg0%2Bfm7CJfWuuAyKFwKZkUW%2FizW3B%2BhZVRLREto5F4xk75x8WeqDL%2FNAQQCdhSWYViE4Jt3w22HJINXr0v8FuDHLGlcK%2BV8a&X-Amz-Signature=3ddafaf08a0c47c7524fa71d2a3035ac50b8d99a89665013deab279205966b51&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VEDH53NU%2F20261010%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261010T205052Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIEL7HyJrt4ksTdGPTkqienSfTrXItSouDRkYlVUuCmoWAiArlL4w1Z7u2j6vf3jOfgdRm2jbTPK%2B2DlApmnPlQepbir%2FAwhcEAAaDDYzNzQyMzE4MzgwNSIMN0JYgwObftdeUOyNKtwDjK6dwAyM3Pf2yg2ccCKppIt8vS65IFDivjH81OYo41AiAnoAngLZnTc67oav0cQg24NR%2FH0khdeX%2FuQJ%2BKgOwTsGbIllBE91WIlHsznyYbjRiDKAUgGLVMQEJzYbJmFDVcJnLK7Vvl%2B2ePBSTs4NUMoltaJPLFKoK1zuUFuL%2Fwyjc0MpSiy%2FhBeLGSwE9yINkBKwjNH%2Fc6PYmPQwiRHKWtkstyA%2F2vNzHgxz%2F3PgX79YJdXgNMoCDCIt6B0WoX2WOYe7nF01CiPhF3AQntXVC%2B69swPx%2FBo0oD3KFhOhT7aXrT5VWS28sZM%2BIg6qv3ia%2BqyFRRWJc6EkY155TTIPiFOtqT%2FZBG1voiORuOfrRl4Wa2ZJNHZkpUr%2BqvNakfPYkgMV58gDWfKC3KIfDlGgrQePnwm%2BJEL2T1YCuV5Oo3kr2tmuX4Scza1OgHHXa2t1frZJkPR5IFxPUafvPbkhgFNrXXTAiYbZudcf%2Bp6rT4869uCfZZp57ea%2FCEhJ4F2%2B%2FbDpvhva5ClFhAYePChfLjxBSzU87m7gqtOHLbe2f1lRFq01HP6cQTGBZZs35xMjIo8%2BchJEyHXx8nQ3sT1d3EUa%2FE0w%2BC0UmwFqA54SvzsC%2B5n77HQtGtGO5Vgw06Kq1gY6pgHYL1MXvDs2p1YSUiF7gAZ9CVjopFvjpt%2FiEIuD17cH%2FkRLEnen9ZSRwUrFCQfyo6ZCYczcQ%2FhqbOUx33RRdLbdzePH3%2FYlpaEoAsksn1HwFtubmtNZzKxPflGKf0WBdg0%2Bfm7CJfWuuAyKFwKZkUW%2FizW3B%2BhZVRLREto5F4xk75x8WeqDL%2FNAQQCdhSWYViE4Jt3w22HJINXr0v8FuDHLGlcK%2BV8a&X-Amz-Signature=4b82dae0a9ca8184c9377033fd5b577cfd8e5361ac5e6ef99f50aa954be30454&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
