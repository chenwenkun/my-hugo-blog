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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46642A7EBGA%2F20260812%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260812T070628Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEP7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFsHkfxZW4w89oNM5w%2Bl7o9bxEbMBqW670sf6U6t%2BnrhAiEAz6Bs%2FqNWMfM0iU5tWykaCxt26U%2FgS3fEgmBWlNbkQrwqiAQIx%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFjCaKiWhmeD2YnI4SrcA%2BUGNzUFpOSwYfYJ4PA9UZH%2F1lMoTFHeaKSlIDDtZbUcY4MZvUsOZCIR4ZcKkCQqOi2AfKIHgXLUVC9f67kumRr52HEy4QrlvgPeogHl4pHqZbnnlmJYEB2nqAza3wGitSl2pdgTjhDV8Sbb2r9GcYe2oJjAvLwuzQjSUKlxDCmXzhK3mHDriEXi5QR3rUdrIllXkwLH9L8Ct5%2FScBsd9CcGY3TvKeVyG8%2BLIg2NEUUvGJO1gkzf%2FH8wMQaadwzS9rht9bBferpv%2F4incBcwL9oB6mtN17fHidSu4AOjpBo7fEN9F0HsDz6QByto7R6Yl%2FOwak5ct4jf3uQ6wafkrOp7CNrqxHeACFUPHvw3To2Q72PcdYwVVEBfOfPHAOxE6coKOtZmEfkh%2BtK5DkRh6eoTfJDGljiCkm%2BaIzZ4BamIOTlewYzEEGeG%2FIF7NxZ2QIX8kV%2BWbMFe7ona2n9QBVS2sp56Fy8PT4EcTMRl0CNAEYVhSdEKBg96aCvu2EXlxuQsQKtz6RLsVLqmcWCGVFmq%2Fx0sUAzZ773lwT%2FvgT0HBWnoljIkMIrSwipZfWNSE0suBEBQ%2BmDBxThffhi5m2wMiYvZ7b1%2BlqKfotftJ5NfU92jx0eZWCN18J2sML2R8NMGOqUBGp%2FGv%2FS3w3bPdtMC3sev7yyh10NWipPX%2Bl%2FUGa258KhxDgm%2BMgX2kHejB65ttlxj%2BLWGYyhhbjPvvLPdezkKfr2UL2r1xPF6zQI1w6xzxFgwQq%2FKbpLFG%2FLLat2uimOs6%2BVfEEck7WTKDgNLuGMbTadol%2BHM6%2BME%2F6Q1j6DusT%2FUTvv7gNW0d7SXbxxDTzKYKGNkuqnuYKANOnrpMUoNAtM2gs6k&X-Amz-Signature=84a7bc44e0dbc28ecfd221bc7afbb41b552851431134d9d9c75d9a5bd9084cd8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46642A7EBGA%2F20260812%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260812T070628Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEP7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFsHkfxZW4w89oNM5w%2Bl7o9bxEbMBqW670sf6U6t%2BnrhAiEAz6Bs%2FqNWMfM0iU5tWykaCxt26U%2FgS3fEgmBWlNbkQrwqiAQIx%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFjCaKiWhmeD2YnI4SrcA%2BUGNzUFpOSwYfYJ4PA9UZH%2F1lMoTFHeaKSlIDDtZbUcY4MZvUsOZCIR4ZcKkCQqOi2AfKIHgXLUVC9f67kumRr52HEy4QrlvgPeogHl4pHqZbnnlmJYEB2nqAza3wGitSl2pdgTjhDV8Sbb2r9GcYe2oJjAvLwuzQjSUKlxDCmXzhK3mHDriEXi5QR3rUdrIllXkwLH9L8Ct5%2FScBsd9CcGY3TvKeVyG8%2BLIg2NEUUvGJO1gkzf%2FH8wMQaadwzS9rht9bBferpv%2F4incBcwL9oB6mtN17fHidSu4AOjpBo7fEN9F0HsDz6QByto7R6Yl%2FOwak5ct4jf3uQ6wafkrOp7CNrqxHeACFUPHvw3To2Q72PcdYwVVEBfOfPHAOxE6coKOtZmEfkh%2BtK5DkRh6eoTfJDGljiCkm%2BaIzZ4BamIOTlewYzEEGeG%2FIF7NxZ2QIX8kV%2BWbMFe7ona2n9QBVS2sp56Fy8PT4EcTMRl0CNAEYVhSdEKBg96aCvu2EXlxuQsQKtz6RLsVLqmcWCGVFmq%2Fx0sUAzZ773lwT%2FvgT0HBWnoljIkMIrSwipZfWNSE0suBEBQ%2BmDBxThffhi5m2wMiYvZ7b1%2BlqKfotftJ5NfU92jx0eZWCN18J2sML2R8NMGOqUBGp%2FGv%2FS3w3bPdtMC3sev7yyh10NWipPX%2Bl%2FUGa258KhxDgm%2BMgX2kHejB65ttlxj%2BLWGYyhhbjPvvLPdezkKfr2UL2r1xPF6zQI1w6xzxFgwQq%2FKbpLFG%2FLLat2uimOs6%2BVfEEck7WTKDgNLuGMbTadol%2BHM6%2BME%2F6Q1j6DusT%2FUTvv7gNW0d7SXbxxDTzKYKGNkuqnuYKANOnrpMUoNAtM2gs6k&X-Amz-Signature=aa089e29e993025507a16457023b48b76178962abdc6731eb2a5d8529bac87a0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46642A7EBGA%2F20260812%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260812T070628Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEP7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFsHkfxZW4w89oNM5w%2Bl7o9bxEbMBqW670sf6U6t%2BnrhAiEAz6Bs%2FqNWMfM0iU5tWykaCxt26U%2FgS3fEgmBWlNbkQrwqiAQIx%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFjCaKiWhmeD2YnI4SrcA%2BUGNzUFpOSwYfYJ4PA9UZH%2F1lMoTFHeaKSlIDDtZbUcY4MZvUsOZCIR4ZcKkCQqOi2AfKIHgXLUVC9f67kumRr52HEy4QrlvgPeogHl4pHqZbnnlmJYEB2nqAza3wGitSl2pdgTjhDV8Sbb2r9GcYe2oJjAvLwuzQjSUKlxDCmXzhK3mHDriEXi5QR3rUdrIllXkwLH9L8Ct5%2FScBsd9CcGY3TvKeVyG8%2BLIg2NEUUvGJO1gkzf%2FH8wMQaadwzS9rht9bBferpv%2F4incBcwL9oB6mtN17fHidSu4AOjpBo7fEN9F0HsDz6QByto7R6Yl%2FOwak5ct4jf3uQ6wafkrOp7CNrqxHeACFUPHvw3To2Q72PcdYwVVEBfOfPHAOxE6coKOtZmEfkh%2BtK5DkRh6eoTfJDGljiCkm%2BaIzZ4BamIOTlewYzEEGeG%2FIF7NxZ2QIX8kV%2BWbMFe7ona2n9QBVS2sp56Fy8PT4EcTMRl0CNAEYVhSdEKBg96aCvu2EXlxuQsQKtz6RLsVLqmcWCGVFmq%2Fx0sUAzZ773lwT%2FvgT0HBWnoljIkMIrSwipZfWNSE0suBEBQ%2BmDBxThffhi5m2wMiYvZ7b1%2BlqKfotftJ5NfU92jx0eZWCN18J2sML2R8NMGOqUBGp%2FGv%2FS3w3bPdtMC3sev7yyh10NWipPX%2Bl%2FUGa258KhxDgm%2BMgX2kHejB65ttlxj%2BLWGYyhhbjPvvLPdezkKfr2UL2r1xPF6zQI1w6xzxFgwQq%2FKbpLFG%2FLLat2uimOs6%2BVfEEck7WTKDgNLuGMbTadol%2BHM6%2BME%2F6Q1j6DusT%2FUTvv7gNW0d7SXbxxDTzKYKGNkuqnuYKANOnrpMUoNAtM2gs6k&X-Amz-Signature=b42f2b3426f607cefa13f9011ed513636547ae9f4879ee3faa59dd19303799af&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46642A7EBGA%2F20260812%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260812T070628Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEP7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFsHkfxZW4w89oNM5w%2Bl7o9bxEbMBqW670sf6U6t%2BnrhAiEAz6Bs%2FqNWMfM0iU5tWykaCxt26U%2FgS3fEgmBWlNbkQrwqiAQIx%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFjCaKiWhmeD2YnI4SrcA%2BUGNzUFpOSwYfYJ4PA9UZH%2F1lMoTFHeaKSlIDDtZbUcY4MZvUsOZCIR4ZcKkCQqOi2AfKIHgXLUVC9f67kumRr52HEy4QrlvgPeogHl4pHqZbnnlmJYEB2nqAza3wGitSl2pdgTjhDV8Sbb2r9GcYe2oJjAvLwuzQjSUKlxDCmXzhK3mHDriEXi5QR3rUdrIllXkwLH9L8Ct5%2FScBsd9CcGY3TvKeVyG8%2BLIg2NEUUvGJO1gkzf%2FH8wMQaadwzS9rht9bBferpv%2F4incBcwL9oB6mtN17fHidSu4AOjpBo7fEN9F0HsDz6QByto7R6Yl%2FOwak5ct4jf3uQ6wafkrOp7CNrqxHeACFUPHvw3To2Q72PcdYwVVEBfOfPHAOxE6coKOtZmEfkh%2BtK5DkRh6eoTfJDGljiCkm%2BaIzZ4BamIOTlewYzEEGeG%2FIF7NxZ2QIX8kV%2BWbMFe7ona2n9QBVS2sp56Fy8PT4EcTMRl0CNAEYVhSdEKBg96aCvu2EXlxuQsQKtz6RLsVLqmcWCGVFmq%2Fx0sUAzZ773lwT%2FvgT0HBWnoljIkMIrSwipZfWNSE0suBEBQ%2BmDBxThffhi5m2wMiYvZ7b1%2BlqKfotftJ5NfU92jx0eZWCN18J2sML2R8NMGOqUBGp%2FGv%2FS3w3bPdtMC3sev7yyh10NWipPX%2Bl%2FUGa258KhxDgm%2BMgX2kHejB65ttlxj%2BLWGYyhhbjPvvLPdezkKfr2UL2r1xPF6zQI1w6xzxFgwQq%2FKbpLFG%2FLLat2uimOs6%2BVfEEck7WTKDgNLuGMbTadol%2BHM6%2BME%2F6Q1j6DusT%2FUTvv7gNW0d7SXbxxDTzKYKGNkuqnuYKANOnrpMUoNAtM2gs6k&X-Amz-Signature=8f80acaffb32508ac300a9c75455a87b9797aee2f291c6811819ced1e94d466d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
