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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZNHEQCEN%2F20261027%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261027T165931Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECkaCXVzLXdlc3QtMiJIMEYCIQCriOc5%2Fy0Sfy7oAwqNadzbfbEZdoNAiH1aTqO5A%2FpkcAIhAMQ6IYn%2FwN1MoOwxZfF9PYay0MbrJWYpyc6mi8uCYGfiKogECPH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwB4yuvEzRZOrjF8pgq3AOF0ruz%2F5TVADuAcV2%2FgssIcY%2Fs67sqNzva%2BnikohK5rob6mM63cdnwsr4sdMq1enJJCCzrFRaHp8208Y%2BciOrb38gk5A7KfXBrYj%2B29p8gUiTcCa65IjlSr5fxKCUwfH58uY%2Bktkb1BLeB95OwT%2BbRHFfxiq%2B%2FtOWgchicAQgA3HJs43hQJaW0TNhglv2aNWQybwcdYuPOnzKo3iIj%2BUBESU1RBXYwgVHNVNgEjkjjlxEvaIbGkn4s65Ct99dhVFJ2Sf5NSv0GRPgou5ENJ6l99iJKAd7rt3ZftgSwmY2MlJ4UFycuUY8%2BhSN%2FV%2F4g1svnMKW6tLBTHO2ZyqdoENW8vKVQtlUvxBJXdc97CibUzIhjKkmUkTxfdY0jC%2FZbCCafEzP04B9jtokMI9tW%2BQ3KUoBiJ7qXvFyrHW22BQ7q5aZQXalq7uLj%2BtPqkWyw0Q6v00WnTya3GunhCBruTtliYaEqwO03A7JCDTcCUI%2FMTW%2BtrQ%2F3PmK%2B1MbCVla55KAakfia%2BKQCFnq8TiYev5Zqjh07SbTCkgM8g%2FN2q8ykEmFSuY1aEPvaZoi8IvjqYrjVO9ogK7ELw2B9qat0rHrZ9OQTbsh8SKVsDVyBTdtksSgoENlC%2F52eCkBVGDC3ooPXBjqkAXHIeGA6ETKDNRLHOgqDFKWBW7K2ER7%2B7HW5XUg1k44cFEgmGKPx%2B3JcE9SHzDa8uQXka5ZGHsO2D4zvUdC0yyea3YeqrawGLlB6Hp5JhU3joc1VXXXDiZ3hIPj%2B4hT%2FIdYbtoE0LW6vqnFeA8UVG9jKN6YYqDSQe3WXm8mQzIYhwQrFr%2F1%2Bzo1%2B6vneOKt6Le6ALX%2B6%2BR9ytRR%2B%2BJb8Yh3o%2BZg7&X-Amz-Signature=19daf44092fb73536386c3478cf29b1060c0f7d57a8cf8f84e47a0c319fc2279&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZNHEQCEN%2F20261027%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261027T165931Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECkaCXVzLXdlc3QtMiJIMEYCIQCriOc5%2Fy0Sfy7oAwqNadzbfbEZdoNAiH1aTqO5A%2FpkcAIhAMQ6IYn%2FwN1MoOwxZfF9PYay0MbrJWYpyc6mi8uCYGfiKogECPH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwB4yuvEzRZOrjF8pgq3AOF0ruz%2F5TVADuAcV2%2FgssIcY%2Fs67sqNzva%2BnikohK5rob6mM63cdnwsr4sdMq1enJJCCzrFRaHp8208Y%2BciOrb38gk5A7KfXBrYj%2B29p8gUiTcCa65IjlSr5fxKCUwfH58uY%2Bktkb1BLeB95OwT%2BbRHFfxiq%2B%2FtOWgchicAQgA3HJs43hQJaW0TNhglv2aNWQybwcdYuPOnzKo3iIj%2BUBESU1RBXYwgVHNVNgEjkjjlxEvaIbGkn4s65Ct99dhVFJ2Sf5NSv0GRPgou5ENJ6l99iJKAd7rt3ZftgSwmY2MlJ4UFycuUY8%2BhSN%2FV%2F4g1svnMKW6tLBTHO2ZyqdoENW8vKVQtlUvxBJXdc97CibUzIhjKkmUkTxfdY0jC%2FZbCCafEzP04B9jtokMI9tW%2BQ3KUoBiJ7qXvFyrHW22BQ7q5aZQXalq7uLj%2BtPqkWyw0Q6v00WnTya3GunhCBruTtliYaEqwO03A7JCDTcCUI%2FMTW%2BtrQ%2F3PmK%2B1MbCVla55KAakfia%2BKQCFnq8TiYev5Zqjh07SbTCkgM8g%2FN2q8ykEmFSuY1aEPvaZoi8IvjqYrjVO9ogK7ELw2B9qat0rHrZ9OQTbsh8SKVsDVyBTdtksSgoENlC%2F52eCkBVGDC3ooPXBjqkAXHIeGA6ETKDNRLHOgqDFKWBW7K2ER7%2B7HW5XUg1k44cFEgmGKPx%2B3JcE9SHzDa8uQXka5ZGHsO2D4zvUdC0yyea3YeqrawGLlB6Hp5JhU3joc1VXXXDiZ3hIPj%2B4hT%2FIdYbtoE0LW6vqnFeA8UVG9jKN6YYqDSQe3WXm8mQzIYhwQrFr%2F1%2Bzo1%2B6vneOKt6Le6ALX%2B6%2BR9ytRR%2B%2BJb8Yh3o%2BZg7&X-Amz-Signature=c3f65bb5a569d3ad9bbbd5bb5fe4cb59850ef1aa644c0b7ca4bf1f938cf6582a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZNHEQCEN%2F20261027%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261027T165931Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECkaCXVzLXdlc3QtMiJIMEYCIQCriOc5%2Fy0Sfy7oAwqNadzbfbEZdoNAiH1aTqO5A%2FpkcAIhAMQ6IYn%2FwN1MoOwxZfF9PYay0MbrJWYpyc6mi8uCYGfiKogECPH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwB4yuvEzRZOrjF8pgq3AOF0ruz%2F5TVADuAcV2%2FgssIcY%2Fs67sqNzva%2BnikohK5rob6mM63cdnwsr4sdMq1enJJCCzrFRaHp8208Y%2BciOrb38gk5A7KfXBrYj%2B29p8gUiTcCa65IjlSr5fxKCUwfH58uY%2Bktkb1BLeB95OwT%2BbRHFfxiq%2B%2FtOWgchicAQgA3HJs43hQJaW0TNhglv2aNWQybwcdYuPOnzKo3iIj%2BUBESU1RBXYwgVHNVNgEjkjjlxEvaIbGkn4s65Ct99dhVFJ2Sf5NSv0GRPgou5ENJ6l99iJKAd7rt3ZftgSwmY2MlJ4UFycuUY8%2BhSN%2FV%2F4g1svnMKW6tLBTHO2ZyqdoENW8vKVQtlUvxBJXdc97CibUzIhjKkmUkTxfdY0jC%2FZbCCafEzP04B9jtokMI9tW%2BQ3KUoBiJ7qXvFyrHW22BQ7q5aZQXalq7uLj%2BtPqkWyw0Q6v00WnTya3GunhCBruTtliYaEqwO03A7JCDTcCUI%2FMTW%2BtrQ%2F3PmK%2B1MbCVla55KAakfia%2BKQCFnq8TiYev5Zqjh07SbTCkgM8g%2FN2q8ykEmFSuY1aEPvaZoi8IvjqYrjVO9ogK7ELw2B9qat0rHrZ9OQTbsh8SKVsDVyBTdtksSgoENlC%2F52eCkBVGDC3ooPXBjqkAXHIeGA6ETKDNRLHOgqDFKWBW7K2ER7%2B7HW5XUg1k44cFEgmGKPx%2B3JcE9SHzDa8uQXka5ZGHsO2D4zvUdC0yyea3YeqrawGLlB6Hp5JhU3joc1VXXXDiZ3hIPj%2B4hT%2FIdYbtoE0LW6vqnFeA8UVG9jKN6YYqDSQe3WXm8mQzIYhwQrFr%2F1%2Bzo1%2B6vneOKt6Le6ALX%2B6%2BR9ytRR%2B%2BJb8Yh3o%2BZg7&X-Amz-Signature=61d58199c650125c65bc288beacc83006a92e547ce20e7b7eff172b2af6292ec&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZNHEQCEN%2F20261027%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261027T165931Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECkaCXVzLXdlc3QtMiJIMEYCIQCriOc5%2Fy0Sfy7oAwqNadzbfbEZdoNAiH1aTqO5A%2FpkcAIhAMQ6IYn%2FwN1MoOwxZfF9PYay0MbrJWYpyc6mi8uCYGfiKogECPH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwB4yuvEzRZOrjF8pgq3AOF0ruz%2F5TVADuAcV2%2FgssIcY%2Fs67sqNzva%2BnikohK5rob6mM63cdnwsr4sdMq1enJJCCzrFRaHp8208Y%2BciOrb38gk5A7KfXBrYj%2B29p8gUiTcCa65IjlSr5fxKCUwfH58uY%2Bktkb1BLeB95OwT%2BbRHFfxiq%2B%2FtOWgchicAQgA3HJs43hQJaW0TNhglv2aNWQybwcdYuPOnzKo3iIj%2BUBESU1RBXYwgVHNVNgEjkjjlxEvaIbGkn4s65Ct99dhVFJ2Sf5NSv0GRPgou5ENJ6l99iJKAd7rt3ZftgSwmY2MlJ4UFycuUY8%2BhSN%2FV%2F4g1svnMKW6tLBTHO2ZyqdoENW8vKVQtlUvxBJXdc97CibUzIhjKkmUkTxfdY0jC%2FZbCCafEzP04B9jtokMI9tW%2BQ3KUoBiJ7qXvFyrHW22BQ7q5aZQXalq7uLj%2BtPqkWyw0Q6v00WnTya3GunhCBruTtliYaEqwO03A7JCDTcCUI%2FMTW%2BtrQ%2F3PmK%2B1MbCVla55KAakfia%2BKQCFnq8TiYev5Zqjh07SbTCkgM8g%2FN2q8ykEmFSuY1aEPvaZoi8IvjqYrjVO9ogK7ELw2B9qat0rHrZ9OQTbsh8SKVsDVyBTdtksSgoENlC%2F52eCkBVGDC3ooPXBjqkAXHIeGA6ETKDNRLHOgqDFKWBW7K2ER7%2B7HW5XUg1k44cFEgmGKPx%2B3JcE9SHzDa8uQXka5ZGHsO2D4zvUdC0yyea3YeqrawGLlB6Hp5JhU3joc1VXXXDiZ3hIPj%2B4hT%2FIdYbtoE0LW6vqnFeA8UVG9jKN6YYqDSQe3WXm8mQzIYhwQrFr%2F1%2Bzo1%2B6vneOKt6Le6ALX%2B6%2BR9ytRR%2B%2BJb8Yh3o%2BZg7&X-Amz-Signature=c70674b635ff4bd10c4f64e8f47cf2e5c369546254c24f8f93658ca87fb6c169&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
