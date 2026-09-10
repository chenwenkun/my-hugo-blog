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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UY4V256Z%2F20260910%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260910T101310Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIHy8JD8tgdPey%2BdTncAA4y8IAOLv2%2FTkSWAcw%2FSzyID7AiBRwX4AOWY22INQCh9Hs5%2F%2FcbRtESlecXJ5dfhw7RLJByqIBAiC%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMnJgCBGr4LLFWzRBrKtwD7vz3Jd38mUhD2dYPKgOs1E4JHWGPpnmRic7UjWuUMVZgTADy8%2BPq2mVvhBUM4TvW5fLMaosBz%2B4p841InzCrSeUeSvdd6w7BURFARa22jI%2FQbOigaqUu%2B9N4V6xmhq0yjzcHptjOk9yEEDaStVi5Lf3VyTtPZVGyHSMlmVnvOTJfQOjQ04tp%2BL%2FXhPp4atVnRds7CrqQOQ7O0gMoNKbPO06J7s87Eu8v2f3OO6gt8NOucSvxorpe%2FEBnaNAanP51tbeX9jQ3dBbBCQF0oZsxoHXZfjwPA1G7ID9tQcc7bMndqOgeROmXqgJQTOHGVKPa4GLR7qCygoT%2BqfRsVGrYps%2FCxDzNtiaNpFStVx3w1oWm6p7P93ETzon%2BHmFAH9w6%2BvzWLP%2F8IcxbNMkqYfVY9hQnl%2FV%2FveuZ%2F8hytmg4%2FV4TCiZh6nGAP5zzPn3fuTqHE2M1eFtGEY2HUkhz4Rm1%2BCAbZApkCnvpkhuuQWb%2Fzlt6yWCyIxegK6ZIy6eLMrVF7z1EcL%2F6Fesoe2Qxq74cdRfhmoIBxvC4s%2B8C5%2BGGn3E%2FdY9RN4lDkkYAA%2BxvZzmtEgdRT1m7cuyswWj5DONzMhnctd1LoA7GEebzFS6xLx3UpyBKo%2FuIfNZXZL4whOKJ1QY6pgGmcPJiDeBuXSc%2B4yV7qX1VWG%2BAcxuyYWF9HensllpG7NEypq8ZPeHhnlcU5Y%2BXx94cHRMOtqjLtqzEZosgOD7bD8F70m6j8FpRXwBh8ZWnmZvIvB3vMPqm3BXCP6MAiTxe%2F6qqDz5lrtUKy0vuyJ%2Bldxr5tOydCK556Vx6hphYFucRFA4sQKSjlbZjN%2FjCZFjo0IzZOeyiIfLj84MTtzWHE3ql5hrx&X-Amz-Signature=aa5192867129a9a37961be50ad7ae4d9072509106b12201bf58e1ea0b3ab247d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UY4V256Z%2F20260910%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260910T101310Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIHy8JD8tgdPey%2BdTncAA4y8IAOLv2%2FTkSWAcw%2FSzyID7AiBRwX4AOWY22INQCh9Hs5%2F%2FcbRtESlecXJ5dfhw7RLJByqIBAiC%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMnJgCBGr4LLFWzRBrKtwD7vz3Jd38mUhD2dYPKgOs1E4JHWGPpnmRic7UjWuUMVZgTADy8%2BPq2mVvhBUM4TvW5fLMaosBz%2B4p841InzCrSeUeSvdd6w7BURFARa22jI%2FQbOigaqUu%2B9N4V6xmhq0yjzcHptjOk9yEEDaStVi5Lf3VyTtPZVGyHSMlmVnvOTJfQOjQ04tp%2BL%2FXhPp4atVnRds7CrqQOQ7O0gMoNKbPO06J7s87Eu8v2f3OO6gt8NOucSvxorpe%2FEBnaNAanP51tbeX9jQ3dBbBCQF0oZsxoHXZfjwPA1G7ID9tQcc7bMndqOgeROmXqgJQTOHGVKPa4GLR7qCygoT%2BqfRsVGrYps%2FCxDzNtiaNpFStVx3w1oWm6p7P93ETzon%2BHmFAH9w6%2BvzWLP%2F8IcxbNMkqYfVY9hQnl%2FV%2FveuZ%2F8hytmg4%2FV4TCiZh6nGAP5zzPn3fuTqHE2M1eFtGEY2HUkhz4Rm1%2BCAbZApkCnvpkhuuQWb%2Fzlt6yWCyIxegK6ZIy6eLMrVF7z1EcL%2F6Fesoe2Qxq74cdRfhmoIBxvC4s%2B8C5%2BGGn3E%2FdY9RN4lDkkYAA%2BxvZzmtEgdRT1m7cuyswWj5DONzMhnctd1LoA7GEebzFS6xLx3UpyBKo%2FuIfNZXZL4whOKJ1QY6pgGmcPJiDeBuXSc%2B4yV7qX1VWG%2BAcxuyYWF9HensllpG7NEypq8ZPeHhnlcU5Y%2BXx94cHRMOtqjLtqzEZosgOD7bD8F70m6j8FpRXwBh8ZWnmZvIvB3vMPqm3BXCP6MAiTxe%2F6qqDz5lrtUKy0vuyJ%2Bldxr5tOydCK556Vx6hphYFucRFA4sQKSjlbZjN%2FjCZFjo0IzZOeyiIfLj84MTtzWHE3ql5hrx&X-Amz-Signature=75da16ca34502359a2fa05d7a7613d52d24a9a828e022d999099a9b65e94ba6c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UY4V256Z%2F20260910%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260910T101310Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIHy8JD8tgdPey%2BdTncAA4y8IAOLv2%2FTkSWAcw%2FSzyID7AiBRwX4AOWY22INQCh9Hs5%2F%2FcbRtESlecXJ5dfhw7RLJByqIBAiC%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMnJgCBGr4LLFWzRBrKtwD7vz3Jd38mUhD2dYPKgOs1E4JHWGPpnmRic7UjWuUMVZgTADy8%2BPq2mVvhBUM4TvW5fLMaosBz%2B4p841InzCrSeUeSvdd6w7BURFARa22jI%2FQbOigaqUu%2B9N4V6xmhq0yjzcHptjOk9yEEDaStVi5Lf3VyTtPZVGyHSMlmVnvOTJfQOjQ04tp%2BL%2FXhPp4atVnRds7CrqQOQ7O0gMoNKbPO06J7s87Eu8v2f3OO6gt8NOucSvxorpe%2FEBnaNAanP51tbeX9jQ3dBbBCQF0oZsxoHXZfjwPA1G7ID9tQcc7bMndqOgeROmXqgJQTOHGVKPa4GLR7qCygoT%2BqfRsVGrYps%2FCxDzNtiaNpFStVx3w1oWm6p7P93ETzon%2BHmFAH9w6%2BvzWLP%2F8IcxbNMkqYfVY9hQnl%2FV%2FveuZ%2F8hytmg4%2FV4TCiZh6nGAP5zzPn3fuTqHE2M1eFtGEY2HUkhz4Rm1%2BCAbZApkCnvpkhuuQWb%2Fzlt6yWCyIxegK6ZIy6eLMrVF7z1EcL%2F6Fesoe2Qxq74cdRfhmoIBxvC4s%2B8C5%2BGGn3E%2FdY9RN4lDkkYAA%2BxvZzmtEgdRT1m7cuyswWj5DONzMhnctd1LoA7GEebzFS6xLx3UpyBKo%2FuIfNZXZL4whOKJ1QY6pgGmcPJiDeBuXSc%2B4yV7qX1VWG%2BAcxuyYWF9HensllpG7NEypq8ZPeHhnlcU5Y%2BXx94cHRMOtqjLtqzEZosgOD7bD8F70m6j8FpRXwBh8ZWnmZvIvB3vMPqm3BXCP6MAiTxe%2F6qqDz5lrtUKy0vuyJ%2Bldxr5tOydCK556Vx6hphYFucRFA4sQKSjlbZjN%2FjCZFjo0IzZOeyiIfLj84MTtzWHE3ql5hrx&X-Amz-Signature=23761149e06c9e57346f05356843197e6d6deea5ab2771d4f719541c637177cb&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UY4V256Z%2F20260910%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260910T101310Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIHy8JD8tgdPey%2BdTncAA4y8IAOLv2%2FTkSWAcw%2FSzyID7AiBRwX4AOWY22INQCh9Hs5%2F%2FcbRtESlecXJ5dfhw7RLJByqIBAiC%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMnJgCBGr4LLFWzRBrKtwD7vz3Jd38mUhD2dYPKgOs1E4JHWGPpnmRic7UjWuUMVZgTADy8%2BPq2mVvhBUM4TvW5fLMaosBz%2B4p841InzCrSeUeSvdd6w7BURFARa22jI%2FQbOigaqUu%2B9N4V6xmhq0yjzcHptjOk9yEEDaStVi5Lf3VyTtPZVGyHSMlmVnvOTJfQOjQ04tp%2BL%2FXhPp4atVnRds7CrqQOQ7O0gMoNKbPO06J7s87Eu8v2f3OO6gt8NOucSvxorpe%2FEBnaNAanP51tbeX9jQ3dBbBCQF0oZsxoHXZfjwPA1G7ID9tQcc7bMndqOgeROmXqgJQTOHGVKPa4GLR7qCygoT%2BqfRsVGrYps%2FCxDzNtiaNpFStVx3w1oWm6p7P93ETzon%2BHmFAH9w6%2BvzWLP%2F8IcxbNMkqYfVY9hQnl%2FV%2FveuZ%2F8hytmg4%2FV4TCiZh6nGAP5zzPn3fuTqHE2M1eFtGEY2HUkhz4Rm1%2BCAbZApkCnvpkhuuQWb%2Fzlt6yWCyIxegK6ZIy6eLMrVF7z1EcL%2F6Fesoe2Qxq74cdRfhmoIBxvC4s%2B8C5%2BGGn3E%2FdY9RN4lDkkYAA%2BxvZzmtEgdRT1m7cuyswWj5DONzMhnctd1LoA7GEebzFS6xLx3UpyBKo%2FuIfNZXZL4whOKJ1QY6pgGmcPJiDeBuXSc%2B4yV7qX1VWG%2BAcxuyYWF9HensllpG7NEypq8ZPeHhnlcU5Y%2BXx94cHRMOtqjLtqzEZosgOD7bD8F70m6j8FpRXwBh8ZWnmZvIvB3vMPqm3BXCP6MAiTxe%2F6qqDz5lrtUKy0vuyJ%2Bldxr5tOydCK556Vx6hphYFucRFA4sQKSjlbZjN%2FjCZFjo0IzZOeyiIfLj84MTtzWHE3ql5hrx&X-Amz-Signature=b34003fddf05431d172ced27f37a65760ecbce5df9095ea1ee08f27578370811&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
