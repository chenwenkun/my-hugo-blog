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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WEEPREBP%2F20260911%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260911T152848Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIGXN6Xyc3dMUJv5eZBZPIdymO%2B1klMp8M6m5Ba6nlnzpAiB0OkZwrrLFcChd6MicpKu%2BnR5yUKy7aFIb8eeNNhWDHCqIBAic%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM5c2T0qzcSpVhVfEoKtwD0zw3pD%2BoCX7EDrkrLorc5Q3xzbQmuBRs%2B7bfbwmgp5DlEnaBfpKOdRNIhAvZkaUTsX6gZmMnhm7Us5GbGxbc7oMLXdCfvVYK7bDw5dB0MfYBS9LjLOITZ%2FqwSMN4hYbouTwIl56L8WRBX93eRSbjJk6gJoKNzEY5Gv11cL7MiCAUL9%2FUPo0iNkYhUxxjqYEcUkiRgLCfoDpbBmNtYKTio1PeJqyQd8k6tmhJdTL1GDrP6XK3a3ZZGwp8llwFUrnFSrNOdgpVlievLd9F1FhwfGZztNqj5Uwiu1aUoizwmgzOwpjuX1H8ziJ1Yx56EJq7Keufuc8Y37xoGCKw33pXisMWmqNwe6VgSKKEX%2BvsE43wbux7bzPBsq71hhMBoH6U3RvqFaJpFaL4DHqdjNQsVQ%2F11frwtWO3%2BAvH0HQWr7sOIEkdh3a8XMnrNWUi1z6lSNmQKEB3ZOCdSuDTcvbkWqYJnNEVnmA%2B7qA69Zx%2F2yeO%2FFO5hCNYNGsK5VhUC%2BLO9lCE05uIdHXz%2FiOT0AucBFTp3tKuHrYSl0HmR7A5k0CalBYEtuSmPPSADbmiu%2Brm0CDN7OBfQY3nSFcja%2FcuDWLA3XCXOky2HzMdM0PmInhUOYH9ij%2F5XJRqX7Mwir2P1QY6pgHMqg%2BKQRsSRBfLH42%2FyBdEHshaNzCKPKGEcMghll1N6ZjadeX60HOpK8mUEk9u8kLkkF%2Bb4cKV5pssUZicpYLuh1gi0t2RG9d6rDPiRvrAS8JIeXkW9xz56N9bi2%2Bz%2FhDAIJ32XBqgv%2Bqld4SpjeU327i0AoiPGZdkGqLDTT31lkuzghnzz5FfecnpJDjlXJLctNkeEr4vZYnurMcYHjZ%2B8L%2FxPFCg&X-Amz-Signature=75f812a642f91dd0b7f91a7f3d5c18639ab993d3e1e7f4cd065208765f47b64d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WEEPREBP%2F20260911%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260911T152848Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIGXN6Xyc3dMUJv5eZBZPIdymO%2B1klMp8M6m5Ba6nlnzpAiB0OkZwrrLFcChd6MicpKu%2BnR5yUKy7aFIb8eeNNhWDHCqIBAic%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM5c2T0qzcSpVhVfEoKtwD0zw3pD%2BoCX7EDrkrLorc5Q3xzbQmuBRs%2B7bfbwmgp5DlEnaBfpKOdRNIhAvZkaUTsX6gZmMnhm7Us5GbGxbc7oMLXdCfvVYK7bDw5dB0MfYBS9LjLOITZ%2FqwSMN4hYbouTwIl56L8WRBX93eRSbjJk6gJoKNzEY5Gv11cL7MiCAUL9%2FUPo0iNkYhUxxjqYEcUkiRgLCfoDpbBmNtYKTio1PeJqyQd8k6tmhJdTL1GDrP6XK3a3ZZGwp8llwFUrnFSrNOdgpVlievLd9F1FhwfGZztNqj5Uwiu1aUoizwmgzOwpjuX1H8ziJ1Yx56EJq7Keufuc8Y37xoGCKw33pXisMWmqNwe6VgSKKEX%2BvsE43wbux7bzPBsq71hhMBoH6U3RvqFaJpFaL4DHqdjNQsVQ%2F11frwtWO3%2BAvH0HQWr7sOIEkdh3a8XMnrNWUi1z6lSNmQKEB3ZOCdSuDTcvbkWqYJnNEVnmA%2B7qA69Zx%2F2yeO%2FFO5hCNYNGsK5VhUC%2BLO9lCE05uIdHXz%2FiOT0AucBFTp3tKuHrYSl0HmR7A5k0CalBYEtuSmPPSADbmiu%2Brm0CDN7OBfQY3nSFcja%2FcuDWLA3XCXOky2HzMdM0PmInhUOYH9ij%2F5XJRqX7Mwir2P1QY6pgHMqg%2BKQRsSRBfLH42%2FyBdEHshaNzCKPKGEcMghll1N6ZjadeX60HOpK8mUEk9u8kLkkF%2Bb4cKV5pssUZicpYLuh1gi0t2RG9d6rDPiRvrAS8JIeXkW9xz56N9bi2%2Bz%2FhDAIJ32XBqgv%2Bqld4SpjeU327i0AoiPGZdkGqLDTT31lkuzghnzz5FfecnpJDjlXJLctNkeEr4vZYnurMcYHjZ%2B8L%2FxPFCg&X-Amz-Signature=243101dc0cbc5de89047eea200d08b292b53333d31c74fdcb34a65fcd139c93e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WEEPREBP%2F20260911%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260911T152848Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIGXN6Xyc3dMUJv5eZBZPIdymO%2B1klMp8M6m5Ba6nlnzpAiB0OkZwrrLFcChd6MicpKu%2BnR5yUKy7aFIb8eeNNhWDHCqIBAic%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM5c2T0qzcSpVhVfEoKtwD0zw3pD%2BoCX7EDrkrLorc5Q3xzbQmuBRs%2B7bfbwmgp5DlEnaBfpKOdRNIhAvZkaUTsX6gZmMnhm7Us5GbGxbc7oMLXdCfvVYK7bDw5dB0MfYBS9LjLOITZ%2FqwSMN4hYbouTwIl56L8WRBX93eRSbjJk6gJoKNzEY5Gv11cL7MiCAUL9%2FUPo0iNkYhUxxjqYEcUkiRgLCfoDpbBmNtYKTio1PeJqyQd8k6tmhJdTL1GDrP6XK3a3ZZGwp8llwFUrnFSrNOdgpVlievLd9F1FhwfGZztNqj5Uwiu1aUoizwmgzOwpjuX1H8ziJ1Yx56EJq7Keufuc8Y37xoGCKw33pXisMWmqNwe6VgSKKEX%2BvsE43wbux7bzPBsq71hhMBoH6U3RvqFaJpFaL4DHqdjNQsVQ%2F11frwtWO3%2BAvH0HQWr7sOIEkdh3a8XMnrNWUi1z6lSNmQKEB3ZOCdSuDTcvbkWqYJnNEVnmA%2B7qA69Zx%2F2yeO%2FFO5hCNYNGsK5VhUC%2BLO9lCE05uIdHXz%2FiOT0AucBFTp3tKuHrYSl0HmR7A5k0CalBYEtuSmPPSADbmiu%2Brm0CDN7OBfQY3nSFcja%2FcuDWLA3XCXOky2HzMdM0PmInhUOYH9ij%2F5XJRqX7Mwir2P1QY6pgHMqg%2BKQRsSRBfLH42%2FyBdEHshaNzCKPKGEcMghll1N6ZjadeX60HOpK8mUEk9u8kLkkF%2Bb4cKV5pssUZicpYLuh1gi0t2RG9d6rDPiRvrAS8JIeXkW9xz56N9bi2%2Bz%2FhDAIJ32XBqgv%2Bqld4SpjeU327i0AoiPGZdkGqLDTT31lkuzghnzz5FfecnpJDjlXJLctNkeEr4vZYnurMcYHjZ%2B8L%2FxPFCg&X-Amz-Signature=cd2af8d3545596c7e8080d52eb58cc465edcb33156fd25cdc786dcddd7e286b8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WEEPREBP%2F20260911%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260911T152848Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIGXN6Xyc3dMUJv5eZBZPIdymO%2B1klMp8M6m5Ba6nlnzpAiB0OkZwrrLFcChd6MicpKu%2BnR5yUKy7aFIb8eeNNhWDHCqIBAic%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM5c2T0qzcSpVhVfEoKtwD0zw3pD%2BoCX7EDrkrLorc5Q3xzbQmuBRs%2B7bfbwmgp5DlEnaBfpKOdRNIhAvZkaUTsX6gZmMnhm7Us5GbGxbc7oMLXdCfvVYK7bDw5dB0MfYBS9LjLOITZ%2FqwSMN4hYbouTwIl56L8WRBX93eRSbjJk6gJoKNzEY5Gv11cL7MiCAUL9%2FUPo0iNkYhUxxjqYEcUkiRgLCfoDpbBmNtYKTio1PeJqyQd8k6tmhJdTL1GDrP6XK3a3ZZGwp8llwFUrnFSrNOdgpVlievLd9F1FhwfGZztNqj5Uwiu1aUoizwmgzOwpjuX1H8ziJ1Yx56EJq7Keufuc8Y37xoGCKw33pXisMWmqNwe6VgSKKEX%2BvsE43wbux7bzPBsq71hhMBoH6U3RvqFaJpFaL4DHqdjNQsVQ%2F11frwtWO3%2BAvH0HQWr7sOIEkdh3a8XMnrNWUi1z6lSNmQKEB3ZOCdSuDTcvbkWqYJnNEVnmA%2B7qA69Zx%2F2yeO%2FFO5hCNYNGsK5VhUC%2BLO9lCE05uIdHXz%2FiOT0AucBFTp3tKuHrYSl0HmR7A5k0CalBYEtuSmPPSADbmiu%2Brm0CDN7OBfQY3nSFcja%2FcuDWLA3XCXOky2HzMdM0PmInhUOYH9ij%2F5XJRqX7Mwir2P1QY6pgHMqg%2BKQRsSRBfLH42%2FyBdEHshaNzCKPKGEcMghll1N6ZjadeX60HOpK8mUEk9u8kLkkF%2Bb4cKV5pssUZicpYLuh1gi0t2RG9d6rDPiRvrAS8JIeXkW9xz56N9bi2%2Bz%2FhDAIJ32XBqgv%2Bqld4SpjeU327i0AoiPGZdkGqLDTT31lkuzghnzz5FfecnpJDjlXJLctNkeEr4vZYnurMcYHjZ%2B8L%2FxPFCg&X-Amz-Signature=47a927ae0a67413beb458a1dbe8fa9fa7e68e2413e62327b0429fdd528c23dc4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
