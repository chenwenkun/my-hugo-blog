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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UYRQ4ZFV%2F20260820%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260820T122408Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDscbUk7VHkBmuYfKTqIIv2dm6IGszeHCohIVyCqnopKgIhAOZ3I%2FNOVxCEgq4NzXSaTBDhSp%2F1SFPJtIjy%2FakuEGMCKogECIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzmkAfjtXux3nGdMEYq3APQFMaRwlmQh2rKBFN0bJnhWwj3tTYBu9g9AZW0t2Np9y8IENHrrzHolEhZXNJlOWBOFhwAcQ07EnV9C93RmNfZxqC6wp5QtZwBPtyIky%2BcHyI4QZTIEaPw5W7969f9WvlCp5iuf8J3t%2B7g9zhHdkEwQ8qRmNBBAwNWTEkTtE0JI5AgKixuid%2FfbtTaU7jHXaGevmymwf%2BmA5RclVOWdk7VGBoUpe%2FcHhKx7po%2BGDxKUEFKT%2BFfbHsKbi1O4NjpiAeU1ZONC5rrSXwmRoV5YTa8mtopXKX3PANcyvSzbFB4X57rF6yKwYPQaMt%2FEGEIP9XEndxWWfeTyNiHHQC%2FZAj8YJio0gPUiM5IHS%2BTbO54HUFBiGnb3hojKheg%2FoZe8xa89t0iKkj2LI%2FCvRHxKrbC%2FZZ4XbyiZRFeXGrTu%2B6FMX9MUCb9zTU5wEXsxnKUD0f45nfHT22ilEbV6HytHj5hHH5kkoHUfIpFRupiJCqLZqcz%2BuX%2FfPctA8AbSKAlCuJg99uSCgqDwunkDDmFMeDxZaI1aWgEp8Lh6uVwJT9URJtSgIoiTXLBKyyiT%2FIr5952%2BfuTRYYwV%2Fl%2BnJ1%2F%2FSl1pza9BO8UEg8CaIM1DNv%2BD1PraBsTCeXAS%2F12OjCwrpvUBjqkAR0l3ijXE8aCDrFFHe1QeCzhporKHWNgknM0KQG3F%2BEpqUU8RSF9%2BLgrEqs%2BSeloVW3uaIziQXT6XGIKfx98OIlB0UpzIaLUD%2FmraG8h3hheWc3ZB2wZofRd1mNJ2UbqGortTqZbZsUPaflKrmL6UGJbwCdPQ2c1WN1ruuL9bRQdAUermkef5mXuBPfFRflNqr87xxAk4U%2F%2BJUzR127MM7Ht9ehj&X-Amz-Signature=1f069883e74eab8ac9cb0e756311e542868551fc5d931eb007e931b7c5008ba9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UYRQ4ZFV%2F20260820%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260820T122408Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDscbUk7VHkBmuYfKTqIIv2dm6IGszeHCohIVyCqnopKgIhAOZ3I%2FNOVxCEgq4NzXSaTBDhSp%2F1SFPJtIjy%2FakuEGMCKogECIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzmkAfjtXux3nGdMEYq3APQFMaRwlmQh2rKBFN0bJnhWwj3tTYBu9g9AZW0t2Np9y8IENHrrzHolEhZXNJlOWBOFhwAcQ07EnV9C93RmNfZxqC6wp5QtZwBPtyIky%2BcHyI4QZTIEaPw5W7969f9WvlCp5iuf8J3t%2B7g9zhHdkEwQ8qRmNBBAwNWTEkTtE0JI5AgKixuid%2FfbtTaU7jHXaGevmymwf%2BmA5RclVOWdk7VGBoUpe%2FcHhKx7po%2BGDxKUEFKT%2BFfbHsKbi1O4NjpiAeU1ZONC5rrSXwmRoV5YTa8mtopXKX3PANcyvSzbFB4X57rF6yKwYPQaMt%2FEGEIP9XEndxWWfeTyNiHHQC%2FZAj8YJio0gPUiM5IHS%2BTbO54HUFBiGnb3hojKheg%2FoZe8xa89t0iKkj2LI%2FCvRHxKrbC%2FZZ4XbyiZRFeXGrTu%2B6FMX9MUCb9zTU5wEXsxnKUD0f45nfHT22ilEbV6HytHj5hHH5kkoHUfIpFRupiJCqLZqcz%2BuX%2FfPctA8AbSKAlCuJg99uSCgqDwunkDDmFMeDxZaI1aWgEp8Lh6uVwJT9URJtSgIoiTXLBKyyiT%2FIr5952%2BfuTRYYwV%2Fl%2BnJ1%2F%2FSl1pza9BO8UEg8CaIM1DNv%2BD1PraBsTCeXAS%2F12OjCwrpvUBjqkAR0l3ijXE8aCDrFFHe1QeCzhporKHWNgknM0KQG3F%2BEpqUU8RSF9%2BLgrEqs%2BSeloVW3uaIziQXT6XGIKfx98OIlB0UpzIaLUD%2FmraG8h3hheWc3ZB2wZofRd1mNJ2UbqGortTqZbZsUPaflKrmL6UGJbwCdPQ2c1WN1ruuL9bRQdAUermkef5mXuBPfFRflNqr87xxAk4U%2F%2BJUzR127MM7Ht9ehj&X-Amz-Signature=0ea8e255780eb97608dad6e28c3945385aa76d447d4e24d09bee4ea3ebd13c39&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UYRQ4ZFV%2F20260820%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260820T122408Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDscbUk7VHkBmuYfKTqIIv2dm6IGszeHCohIVyCqnopKgIhAOZ3I%2FNOVxCEgq4NzXSaTBDhSp%2F1SFPJtIjy%2FakuEGMCKogECIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzmkAfjtXux3nGdMEYq3APQFMaRwlmQh2rKBFN0bJnhWwj3tTYBu9g9AZW0t2Np9y8IENHrrzHolEhZXNJlOWBOFhwAcQ07EnV9C93RmNfZxqC6wp5QtZwBPtyIky%2BcHyI4QZTIEaPw5W7969f9WvlCp5iuf8J3t%2B7g9zhHdkEwQ8qRmNBBAwNWTEkTtE0JI5AgKixuid%2FfbtTaU7jHXaGevmymwf%2BmA5RclVOWdk7VGBoUpe%2FcHhKx7po%2BGDxKUEFKT%2BFfbHsKbi1O4NjpiAeU1ZONC5rrSXwmRoV5YTa8mtopXKX3PANcyvSzbFB4X57rF6yKwYPQaMt%2FEGEIP9XEndxWWfeTyNiHHQC%2FZAj8YJio0gPUiM5IHS%2BTbO54HUFBiGnb3hojKheg%2FoZe8xa89t0iKkj2LI%2FCvRHxKrbC%2FZZ4XbyiZRFeXGrTu%2B6FMX9MUCb9zTU5wEXsxnKUD0f45nfHT22ilEbV6HytHj5hHH5kkoHUfIpFRupiJCqLZqcz%2BuX%2FfPctA8AbSKAlCuJg99uSCgqDwunkDDmFMeDxZaI1aWgEp8Lh6uVwJT9URJtSgIoiTXLBKyyiT%2FIr5952%2BfuTRYYwV%2Fl%2BnJ1%2F%2FSl1pza9BO8UEg8CaIM1DNv%2BD1PraBsTCeXAS%2F12OjCwrpvUBjqkAR0l3ijXE8aCDrFFHe1QeCzhporKHWNgknM0KQG3F%2BEpqUU8RSF9%2BLgrEqs%2BSeloVW3uaIziQXT6XGIKfx98OIlB0UpzIaLUD%2FmraG8h3hheWc3ZB2wZofRd1mNJ2UbqGortTqZbZsUPaflKrmL6UGJbwCdPQ2c1WN1ruuL9bRQdAUermkef5mXuBPfFRflNqr87xxAk4U%2F%2BJUzR127MM7Ht9ehj&X-Amz-Signature=fd61b84b44611b4732ff7b6bff36ce7e0edc150e1003cf20e862899b38bdc209&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UYRQ4ZFV%2F20260820%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260820T122408Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDscbUk7VHkBmuYfKTqIIv2dm6IGszeHCohIVyCqnopKgIhAOZ3I%2FNOVxCEgq4NzXSaTBDhSp%2F1SFPJtIjy%2FakuEGMCKogECIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzmkAfjtXux3nGdMEYq3APQFMaRwlmQh2rKBFN0bJnhWwj3tTYBu9g9AZW0t2Np9y8IENHrrzHolEhZXNJlOWBOFhwAcQ07EnV9C93RmNfZxqC6wp5QtZwBPtyIky%2BcHyI4QZTIEaPw5W7969f9WvlCp5iuf8J3t%2B7g9zhHdkEwQ8qRmNBBAwNWTEkTtE0JI5AgKixuid%2FfbtTaU7jHXaGevmymwf%2BmA5RclVOWdk7VGBoUpe%2FcHhKx7po%2BGDxKUEFKT%2BFfbHsKbi1O4NjpiAeU1ZONC5rrSXwmRoV5YTa8mtopXKX3PANcyvSzbFB4X57rF6yKwYPQaMt%2FEGEIP9XEndxWWfeTyNiHHQC%2FZAj8YJio0gPUiM5IHS%2BTbO54HUFBiGnb3hojKheg%2FoZe8xa89t0iKkj2LI%2FCvRHxKrbC%2FZZ4XbyiZRFeXGrTu%2B6FMX9MUCb9zTU5wEXsxnKUD0f45nfHT22ilEbV6HytHj5hHH5kkoHUfIpFRupiJCqLZqcz%2BuX%2FfPctA8AbSKAlCuJg99uSCgqDwunkDDmFMeDxZaI1aWgEp8Lh6uVwJT9URJtSgIoiTXLBKyyiT%2FIr5952%2BfuTRYYwV%2Fl%2BnJ1%2F%2FSl1pza9BO8UEg8CaIM1DNv%2BD1PraBsTCeXAS%2F12OjCwrpvUBjqkAR0l3ijXE8aCDrFFHe1QeCzhporKHWNgknM0KQG3F%2BEpqUU8RSF9%2BLgrEqs%2BSeloVW3uaIziQXT6XGIKfx98OIlB0UpzIaLUD%2FmraG8h3hheWc3ZB2wZofRd1mNJ2UbqGortTqZbZsUPaflKrmL6UGJbwCdPQ2c1WN1ruuL9bRQdAUermkef5mXuBPfFRflNqr87xxAk4U%2F%2BJUzR127MM7Ht9ehj&X-Amz-Signature=cdd7ad09f6d17d6e06d42cc2f9bd134cf73c0035ff32bc6494d59e1d655bd5df&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
