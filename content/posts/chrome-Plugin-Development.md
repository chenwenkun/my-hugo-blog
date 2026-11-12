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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SRW5KBCC%2F20261112%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261112T044941Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCICcj8haKUrbCgzz2reM8DdDygQegKY50yEqGnYjnYK6yAiEAuKDQlUm5%2F4PV6fkW%2BVA3uGDinV2YyRa9x18UHo1%2BwYkq%2FwMIYxAAGgw2Mzc0MjMxODM4MDUiDIoynDgOlbG0UWeouCrcA3AytnobOU4L6zUhZOUll4WMtsMKEH1dA4ul%2BlZ9z8jF7ZFO323LiEypTuOJwaKVzwiDKpxCHezzqmUrlISsTpiMxJzw9Ey%2Br1rJLuNt0vVE5YlcYA6ewBb2SyDBXZT18GdYlEfjsDpshVUH3G9bpM8%2BpjPynbzXyAtVEiLNKjyExbA6tP%2F7FSKsqh9UJIq%2F%2FQ5wuOlzkE4wDa72eZcTLWhYIlMUX%2Bl7zQA8qkzNrx6DmHB83MOVEoQ1%2BnEyWfY6fRdSQzJWQrfJf%2F%2BarwcjIOXtZ7pTt%2FAh%2BXbfWTOc8IYEpzP%2FTMnoj36kHyhZQ9Pl7I7JINEpdspaozJmJOL2ebSjHK5kkQWAdUHdJFAI%2BTrmYCTHgL8mBtAQfViQvDLrvhyKXIoUHTaBJZebhRqe2F%2BKA%2BunHvCJ%2FWf%2FCIzq8QfBEfojF8KaXiploG1jAwur7hPW8UBwOxGg29sidiGeoWLDi%2F1CCcuh9u%2FXKM5QEKtcxGZY7zRk3P1uZjxSKQVS3gFxMfNrI6Rzr1z2nlQLvP2bU7LXWZjflwUiKwE02Hy4nObgGHOZNbj7QO8Sts5v4PTvAI0grb0zf1NDXaEC7xl%2FCv0LI7gJj2pI0h7tZUdY1%2Fit09z5Oo3AIjKDMObc1NcGOqUBwEhnpps7PRwyeLV1LdMwVXud4B7scLTadXJ79yaQciKDJ34PRXGzOKMiStJH57py%2FH5HXf7Xb3LQgwvWHZ6MyBXiFeWUdnt898Dm9suiawG4VA2CZDQzl7%2F2Al1E%2FFdAhdiwuhZy0nUssAA%2BxkX%2BjtoMhg%2Ffl%2Bz9cEEgA3rnOBmm3YR3RWaQeU4RhPIeiGIjyopo3ydPM%2BuGqK3EDZkH%2FEXaYZeo&X-Amz-Signature=93b4dda626545c8ce65781beb2be0e716482c998e69b193476d0f40fc6a00b8f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SRW5KBCC%2F20261112%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261112T044941Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCICcj8haKUrbCgzz2reM8DdDygQegKY50yEqGnYjnYK6yAiEAuKDQlUm5%2F4PV6fkW%2BVA3uGDinV2YyRa9x18UHo1%2BwYkq%2FwMIYxAAGgw2Mzc0MjMxODM4MDUiDIoynDgOlbG0UWeouCrcA3AytnobOU4L6zUhZOUll4WMtsMKEH1dA4ul%2BlZ9z8jF7ZFO323LiEypTuOJwaKVzwiDKpxCHezzqmUrlISsTpiMxJzw9Ey%2Br1rJLuNt0vVE5YlcYA6ewBb2SyDBXZT18GdYlEfjsDpshVUH3G9bpM8%2BpjPynbzXyAtVEiLNKjyExbA6tP%2F7FSKsqh9UJIq%2F%2FQ5wuOlzkE4wDa72eZcTLWhYIlMUX%2Bl7zQA8qkzNrx6DmHB83MOVEoQ1%2BnEyWfY6fRdSQzJWQrfJf%2F%2BarwcjIOXtZ7pTt%2FAh%2BXbfWTOc8IYEpzP%2FTMnoj36kHyhZQ9Pl7I7JINEpdspaozJmJOL2ebSjHK5kkQWAdUHdJFAI%2BTrmYCTHgL8mBtAQfViQvDLrvhyKXIoUHTaBJZebhRqe2F%2BKA%2BunHvCJ%2FWf%2FCIzq8QfBEfojF8KaXiploG1jAwur7hPW8UBwOxGg29sidiGeoWLDi%2F1CCcuh9u%2FXKM5QEKtcxGZY7zRk3P1uZjxSKQVS3gFxMfNrI6Rzr1z2nlQLvP2bU7LXWZjflwUiKwE02Hy4nObgGHOZNbj7QO8Sts5v4PTvAI0grb0zf1NDXaEC7xl%2FCv0LI7gJj2pI0h7tZUdY1%2Fit09z5Oo3AIjKDMObc1NcGOqUBwEhnpps7PRwyeLV1LdMwVXud4B7scLTadXJ79yaQciKDJ34PRXGzOKMiStJH57py%2FH5HXf7Xb3LQgwvWHZ6MyBXiFeWUdnt898Dm9suiawG4VA2CZDQzl7%2F2Al1E%2FFdAhdiwuhZy0nUssAA%2BxkX%2BjtoMhg%2Ffl%2Bz9cEEgA3rnOBmm3YR3RWaQeU4RhPIeiGIjyopo3ydPM%2BuGqK3EDZkH%2FEXaYZeo&X-Amz-Signature=c78f8773d41ed961e58f480c132aa8408293771a3958b53d4fcada9088f54aed&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SRW5KBCC%2F20261112%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261112T044941Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCICcj8haKUrbCgzz2reM8DdDygQegKY50yEqGnYjnYK6yAiEAuKDQlUm5%2F4PV6fkW%2BVA3uGDinV2YyRa9x18UHo1%2BwYkq%2FwMIYxAAGgw2Mzc0MjMxODM4MDUiDIoynDgOlbG0UWeouCrcA3AytnobOU4L6zUhZOUll4WMtsMKEH1dA4ul%2BlZ9z8jF7ZFO323LiEypTuOJwaKVzwiDKpxCHezzqmUrlISsTpiMxJzw9Ey%2Br1rJLuNt0vVE5YlcYA6ewBb2SyDBXZT18GdYlEfjsDpshVUH3G9bpM8%2BpjPynbzXyAtVEiLNKjyExbA6tP%2F7FSKsqh9UJIq%2F%2FQ5wuOlzkE4wDa72eZcTLWhYIlMUX%2Bl7zQA8qkzNrx6DmHB83MOVEoQ1%2BnEyWfY6fRdSQzJWQrfJf%2F%2BarwcjIOXtZ7pTt%2FAh%2BXbfWTOc8IYEpzP%2FTMnoj36kHyhZQ9Pl7I7JINEpdspaozJmJOL2ebSjHK5kkQWAdUHdJFAI%2BTrmYCTHgL8mBtAQfViQvDLrvhyKXIoUHTaBJZebhRqe2F%2BKA%2BunHvCJ%2FWf%2FCIzq8QfBEfojF8KaXiploG1jAwur7hPW8UBwOxGg29sidiGeoWLDi%2F1CCcuh9u%2FXKM5QEKtcxGZY7zRk3P1uZjxSKQVS3gFxMfNrI6Rzr1z2nlQLvP2bU7LXWZjflwUiKwE02Hy4nObgGHOZNbj7QO8Sts5v4PTvAI0grb0zf1NDXaEC7xl%2FCv0LI7gJj2pI0h7tZUdY1%2Fit09z5Oo3AIjKDMObc1NcGOqUBwEhnpps7PRwyeLV1LdMwVXud4B7scLTadXJ79yaQciKDJ34PRXGzOKMiStJH57py%2FH5HXf7Xb3LQgwvWHZ6MyBXiFeWUdnt898Dm9suiawG4VA2CZDQzl7%2F2Al1E%2FFdAhdiwuhZy0nUssAA%2BxkX%2BjtoMhg%2Ffl%2Bz9cEEgA3rnOBmm3YR3RWaQeU4RhPIeiGIjyopo3ydPM%2BuGqK3EDZkH%2FEXaYZeo&X-Amz-Signature=c1b0cbd278f1f6cf74f6e0e263c961e2664a0c14f8961341d4e62002353915e0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SRW5KBCC%2F20261112%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261112T044941Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCICcj8haKUrbCgzz2reM8DdDygQegKY50yEqGnYjnYK6yAiEAuKDQlUm5%2F4PV6fkW%2BVA3uGDinV2YyRa9x18UHo1%2BwYkq%2FwMIYxAAGgw2Mzc0MjMxODM4MDUiDIoynDgOlbG0UWeouCrcA3AytnobOU4L6zUhZOUll4WMtsMKEH1dA4ul%2BlZ9z8jF7ZFO323LiEypTuOJwaKVzwiDKpxCHezzqmUrlISsTpiMxJzw9Ey%2Br1rJLuNt0vVE5YlcYA6ewBb2SyDBXZT18GdYlEfjsDpshVUH3G9bpM8%2BpjPynbzXyAtVEiLNKjyExbA6tP%2F7FSKsqh9UJIq%2F%2FQ5wuOlzkE4wDa72eZcTLWhYIlMUX%2Bl7zQA8qkzNrx6DmHB83MOVEoQ1%2BnEyWfY6fRdSQzJWQrfJf%2F%2BarwcjIOXtZ7pTt%2FAh%2BXbfWTOc8IYEpzP%2FTMnoj36kHyhZQ9Pl7I7JINEpdspaozJmJOL2ebSjHK5kkQWAdUHdJFAI%2BTrmYCTHgL8mBtAQfViQvDLrvhyKXIoUHTaBJZebhRqe2F%2BKA%2BunHvCJ%2FWf%2FCIzq8QfBEfojF8KaXiploG1jAwur7hPW8UBwOxGg29sidiGeoWLDi%2F1CCcuh9u%2FXKM5QEKtcxGZY7zRk3P1uZjxSKQVS3gFxMfNrI6Rzr1z2nlQLvP2bU7LXWZjflwUiKwE02Hy4nObgGHOZNbj7QO8Sts5v4PTvAI0grb0zf1NDXaEC7xl%2FCv0LI7gJj2pI0h7tZUdY1%2Fit09z5Oo3AIjKDMObc1NcGOqUBwEhnpps7PRwyeLV1LdMwVXud4B7scLTadXJ79yaQciKDJ34PRXGzOKMiStJH57py%2FH5HXf7Xb3LQgwvWHZ6MyBXiFeWUdnt898Dm9suiawG4VA2CZDQzl7%2F2Al1E%2FFdAhdiwuhZy0nUssAA%2BxkX%2BjtoMhg%2Ffl%2Bz9cEEgA3rnOBmm3YR3RWaQeU4RhPIeiGIjyopo3ydPM%2BuGqK3EDZkH%2FEXaYZeo&X-Amz-Signature=de13b395c802d5be3ddc57d83685e5b4387948c5e313dd27bd78eb32aa3c99b8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
