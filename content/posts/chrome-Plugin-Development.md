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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TK7UGSZE%2F20261031%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261031T204601Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIEF5cimpQvN7VKgs2d8dirwCorVyWAHUUUGmvZiPrM8jAiEA0t5gSYdMBGjycbVQJZ0C6QnStgiXszRuWaRiBO8wMZ8q%2FwMIVRAAGgw2Mzc0MjMxODM4MDUiDBNfKOTXkJb2IUAkqCrcAyVEH1A5Lo50XTtcgud8aaWXbMl9Wnb2va22hHBOVsY6c%2F0X0jJzre2aF5oTj2A035Au%2BprGbEyHWnKRdh8l6nC5Ch%2BB6ZSs0BB059mVXZt273x0%2BP%2BooW%2BVw4skVNRx66S5AqzKJchJ%2FxlFXD5jFyk4VVuRb3%2Bu9TFJXQ%2FPEiBGPIJ78fBL3h8AVH%2F2zdrFqxiXid4o8HZ8vRwNczYY%2FnZ5ewevKAzkc8%2BI6emoWM50k5RQDc%2Fgd9BKDSuimvNA9tBW2ALYjF%2BWnmmg9Vxr2BAQ22B%2FU0kUYbxnkRfLESGDSqg1w174KB2wPkhG6R9Y8SqV7kYWBNwv%2F4GSELIwHmYGQ5xvixsZ3RloColf%2BQ%2F5l081mJyVlOYis%2B6R8GhC2%2BavT%2BOSf%2BANmrqo7tW8Z8MjdHIIuLgpgTLNSbQhQLA2%2BiZNw3rUg5%2BQmpJjAjrmj4%2FrHBV6%2F%2F1cAnQHpdUhaxPu3mnr%2FoYM9w79cOVbQ3VU8wsD88QqdElgbKYRI5mi0fLYeRLoC763IwTvKu2WmlybzVof9sGpS6YuJsSP45RM6T42TKtLaHIn1caEhMDBlsWT55K0JZSJBKAoJgV5%2FwSfWgJi4KFhV9LKCUIpBoUHOJHSpnelqYnEBly9MISdmdcGOqUBYMuJ1gcP3P3qHLyxjq%2FfdItw2Q7Y%2FrZGre5xlWZ7x373EkYwR2cHMaZh7MMPc%2BnXsmeTLsgeciINuy3dzkq4tNSp%2BcGQf088rJJriVe3gSxK486SXWjwUBXZyduch6VI9wAkjwTbLR0%2ByG1wjh4bupENvFTV367f0qWWB4fg98xBlQGzj39a8U9mIPUHl%2FPe7jzis3om2Hf%2F%2FCmb6xZDsSEosNbt&X-Amz-Signature=0513b9be080fb2b05a30d6f0ff1175c982faf96ce8e0787e73e81acbfd34489b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TK7UGSZE%2F20261031%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261031T204601Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIEF5cimpQvN7VKgs2d8dirwCorVyWAHUUUGmvZiPrM8jAiEA0t5gSYdMBGjycbVQJZ0C6QnStgiXszRuWaRiBO8wMZ8q%2FwMIVRAAGgw2Mzc0MjMxODM4MDUiDBNfKOTXkJb2IUAkqCrcAyVEH1A5Lo50XTtcgud8aaWXbMl9Wnb2va22hHBOVsY6c%2F0X0jJzre2aF5oTj2A035Au%2BprGbEyHWnKRdh8l6nC5Ch%2BB6ZSs0BB059mVXZt273x0%2BP%2BooW%2BVw4skVNRx66S5AqzKJchJ%2FxlFXD5jFyk4VVuRb3%2Bu9TFJXQ%2FPEiBGPIJ78fBL3h8AVH%2F2zdrFqxiXid4o8HZ8vRwNczYY%2FnZ5ewevKAzkc8%2BI6emoWM50k5RQDc%2Fgd9BKDSuimvNA9tBW2ALYjF%2BWnmmg9Vxr2BAQ22B%2FU0kUYbxnkRfLESGDSqg1w174KB2wPkhG6R9Y8SqV7kYWBNwv%2F4GSELIwHmYGQ5xvixsZ3RloColf%2BQ%2F5l081mJyVlOYis%2B6R8GhC2%2BavT%2BOSf%2BANmrqo7tW8Z8MjdHIIuLgpgTLNSbQhQLA2%2BiZNw3rUg5%2BQmpJjAjrmj4%2FrHBV6%2F%2F1cAnQHpdUhaxPu3mnr%2FoYM9w79cOVbQ3VU8wsD88QqdElgbKYRI5mi0fLYeRLoC763IwTvKu2WmlybzVof9sGpS6YuJsSP45RM6T42TKtLaHIn1caEhMDBlsWT55K0JZSJBKAoJgV5%2FwSfWgJi4KFhV9LKCUIpBoUHOJHSpnelqYnEBly9MISdmdcGOqUBYMuJ1gcP3P3qHLyxjq%2FfdItw2Q7Y%2FrZGre5xlWZ7x373EkYwR2cHMaZh7MMPc%2BnXsmeTLsgeciINuy3dzkq4tNSp%2BcGQf088rJJriVe3gSxK486SXWjwUBXZyduch6VI9wAkjwTbLR0%2ByG1wjh4bupENvFTV367f0qWWB4fg98xBlQGzj39a8U9mIPUHl%2FPe7jzis3om2Hf%2F%2FCmb6xZDsSEosNbt&X-Amz-Signature=a7a02ff31164f4ddf2dbfe67709d2b5915ddd8b8ea12cc21232cfd1897be07ed&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TK7UGSZE%2F20261031%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261031T204601Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIEF5cimpQvN7VKgs2d8dirwCorVyWAHUUUGmvZiPrM8jAiEA0t5gSYdMBGjycbVQJZ0C6QnStgiXszRuWaRiBO8wMZ8q%2FwMIVRAAGgw2Mzc0MjMxODM4MDUiDBNfKOTXkJb2IUAkqCrcAyVEH1A5Lo50XTtcgud8aaWXbMl9Wnb2va22hHBOVsY6c%2F0X0jJzre2aF5oTj2A035Au%2BprGbEyHWnKRdh8l6nC5Ch%2BB6ZSs0BB059mVXZt273x0%2BP%2BooW%2BVw4skVNRx66S5AqzKJchJ%2FxlFXD5jFyk4VVuRb3%2Bu9TFJXQ%2FPEiBGPIJ78fBL3h8AVH%2F2zdrFqxiXid4o8HZ8vRwNczYY%2FnZ5ewevKAzkc8%2BI6emoWM50k5RQDc%2Fgd9BKDSuimvNA9tBW2ALYjF%2BWnmmg9Vxr2BAQ22B%2FU0kUYbxnkRfLESGDSqg1w174KB2wPkhG6R9Y8SqV7kYWBNwv%2F4GSELIwHmYGQ5xvixsZ3RloColf%2BQ%2F5l081mJyVlOYis%2B6R8GhC2%2BavT%2BOSf%2BANmrqo7tW8Z8MjdHIIuLgpgTLNSbQhQLA2%2BiZNw3rUg5%2BQmpJjAjrmj4%2FrHBV6%2F%2F1cAnQHpdUhaxPu3mnr%2FoYM9w79cOVbQ3VU8wsD88QqdElgbKYRI5mi0fLYeRLoC763IwTvKu2WmlybzVof9sGpS6YuJsSP45RM6T42TKtLaHIn1caEhMDBlsWT55K0JZSJBKAoJgV5%2FwSfWgJi4KFhV9LKCUIpBoUHOJHSpnelqYnEBly9MISdmdcGOqUBYMuJ1gcP3P3qHLyxjq%2FfdItw2Q7Y%2FrZGre5xlWZ7x373EkYwR2cHMaZh7MMPc%2BnXsmeTLsgeciINuy3dzkq4tNSp%2BcGQf088rJJriVe3gSxK486SXWjwUBXZyduch6VI9wAkjwTbLR0%2ByG1wjh4bupENvFTV367f0qWWB4fg98xBlQGzj39a8U9mIPUHl%2FPe7jzis3om2Hf%2F%2FCmb6xZDsSEosNbt&X-Amz-Signature=b70d697a7845c74806320556a92d12762e10f67adce03a682fd1f397c1d13097&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TK7UGSZE%2F20261031%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261031T204601Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIEF5cimpQvN7VKgs2d8dirwCorVyWAHUUUGmvZiPrM8jAiEA0t5gSYdMBGjycbVQJZ0C6QnStgiXszRuWaRiBO8wMZ8q%2FwMIVRAAGgw2Mzc0MjMxODM4MDUiDBNfKOTXkJb2IUAkqCrcAyVEH1A5Lo50XTtcgud8aaWXbMl9Wnb2va22hHBOVsY6c%2F0X0jJzre2aF5oTj2A035Au%2BprGbEyHWnKRdh8l6nC5Ch%2BB6ZSs0BB059mVXZt273x0%2BP%2BooW%2BVw4skVNRx66S5AqzKJchJ%2FxlFXD5jFyk4VVuRb3%2Bu9TFJXQ%2FPEiBGPIJ78fBL3h8AVH%2F2zdrFqxiXid4o8HZ8vRwNczYY%2FnZ5ewevKAzkc8%2BI6emoWM50k5RQDc%2Fgd9BKDSuimvNA9tBW2ALYjF%2BWnmmg9Vxr2BAQ22B%2FU0kUYbxnkRfLESGDSqg1w174KB2wPkhG6R9Y8SqV7kYWBNwv%2F4GSELIwHmYGQ5xvixsZ3RloColf%2BQ%2F5l081mJyVlOYis%2B6R8GhC2%2BavT%2BOSf%2BANmrqo7tW8Z8MjdHIIuLgpgTLNSbQhQLA2%2BiZNw3rUg5%2BQmpJjAjrmj4%2FrHBV6%2F%2F1cAnQHpdUhaxPu3mnr%2FoYM9w79cOVbQ3VU8wsD88QqdElgbKYRI5mi0fLYeRLoC763IwTvKu2WmlybzVof9sGpS6YuJsSP45RM6T42TKtLaHIn1caEhMDBlsWT55K0JZSJBKAoJgV5%2FwSfWgJi4KFhV9LKCUIpBoUHOJHSpnelqYnEBly9MISdmdcGOqUBYMuJ1gcP3P3qHLyxjq%2FfdItw2Q7Y%2FrZGre5xlWZ7x373EkYwR2cHMaZh7MMPc%2BnXsmeTLsgeciINuy3dzkq4tNSp%2BcGQf088rJJriVe3gSxK486SXWjwUBXZyduch6VI9wAkjwTbLR0%2ByG1wjh4bupENvFTV367f0qWWB4fg98xBlQGzj39a8U9mIPUHl%2FPe7jzis3om2Hf%2F%2FCmb6xZDsSEosNbt&X-Amz-Signature=98fdabe73d9a1d3557ef7bbd015151e69234133d223f48ea6b3855694b8e35a5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
