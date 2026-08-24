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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VF66NW3V%2F20260824%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260824T063433Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEB0aCXVzLXdlc3QtMiJHMEUCIQCT754xbzFe%2BQlJ59u3L0DY%2FEaB%2FpRvm2PE5e%2F9T8ZMNQIgZtHsCCYgUfbwf%2F%2Bv2IsPmT6G6Jle5r%2BozHL9Y0e73jAqiAQI5v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDM9V5sWYgISXrC8e1ircA4LtBTX8Ep%2FiInRbUAjRY2Cpa9rk%2B%2FBGZpLCAL3tGIBLnRh1Um90y6jYRnETvQxHNl0EZ9LxQwUSdRXh%2Bzmza5w5l1WlEJJn7qP0PFrSqWLZkGITbrhOL41lLtuSoiumL6SeqqtNWadPCI6Ye5e%2FoVSwQgrxDq0MJIyirmLmn6KZZ4XIpGoyXvZxW0%2FNd%2BJFEsSlX7dnQOMEnRavJDZhrPdiVNIyfkmoSGn5lAkDjubYXdx6EHim4cy3FsmrMovGYaO9%2Fb1l20v11py7ERVXL39W7NMFtBoeHDswC50fefdEO4o2ihH5JKFLqnuhRihbRjUmjmWGEXgEjeAVK2epkklQiuG%2FpJUEU8neO7ls3NxCc1F13nKsVzSMKibWA8e1Q1bMoB4uk8bYtga%2FpRbyky4RSfq81OVT796sY6Ngf%2FFUZaW90AHQc%2FE6VqzQqsHmSQgnGA%2BxULHUqXZtYejOdFdSvOGk2Jyo1Flic0l26ZeZsXQI4KLJ0ukmT317ZWjOQs8xsyGeDknv8dfjUs%2FpqCXFEHXTxCm17sq%2Fl%2FqPNVFHQ1%2FmbxnvtpYRKcFxewsdTDQerRiTQQulBIpQt83GLtII7RDiUm5FTIYQscdVH9PSyib9tO3NCuXNM3qMMOmkr9QGOqUBeR9%2BaGX1J%2Fzo83%2FtcLF2AXUQjfifE9m5%2By4PVp3RJfKc9ETwg1c%2BgIV%2FqwVSxiP29W2%2FxjtYrXYIQUJ5wrXCoU8VhNpr75mbgLUkn%2BCbXY76XzMtJ%2B8saFmtVth0lpr5ZDGkI3wo8%2FsphG9T10%2FL7Usda66sAC0MJF04Mm%2B7%2BwDOamPyIrarxCL9MnePlr0zQ96WkXuXVhpkqYZEtL66im8M4Lds&X-Amz-Signature=a5e64f2b138a50adc03badbb48956ec6ec94034a03aaa71e0f6834192ae0abcc&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VF66NW3V%2F20260824%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260824T063433Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEB0aCXVzLXdlc3QtMiJHMEUCIQCT754xbzFe%2BQlJ59u3L0DY%2FEaB%2FpRvm2PE5e%2F9T8ZMNQIgZtHsCCYgUfbwf%2F%2Bv2IsPmT6G6Jle5r%2BozHL9Y0e73jAqiAQI5v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDM9V5sWYgISXrC8e1ircA4LtBTX8Ep%2FiInRbUAjRY2Cpa9rk%2B%2FBGZpLCAL3tGIBLnRh1Um90y6jYRnETvQxHNl0EZ9LxQwUSdRXh%2Bzmza5w5l1WlEJJn7qP0PFrSqWLZkGITbrhOL41lLtuSoiumL6SeqqtNWadPCI6Ye5e%2FoVSwQgrxDq0MJIyirmLmn6KZZ4XIpGoyXvZxW0%2FNd%2BJFEsSlX7dnQOMEnRavJDZhrPdiVNIyfkmoSGn5lAkDjubYXdx6EHim4cy3FsmrMovGYaO9%2Fb1l20v11py7ERVXL39W7NMFtBoeHDswC50fefdEO4o2ihH5JKFLqnuhRihbRjUmjmWGEXgEjeAVK2epkklQiuG%2FpJUEU8neO7ls3NxCc1F13nKsVzSMKibWA8e1Q1bMoB4uk8bYtga%2FpRbyky4RSfq81OVT796sY6Ngf%2FFUZaW90AHQc%2FE6VqzQqsHmSQgnGA%2BxULHUqXZtYejOdFdSvOGk2Jyo1Flic0l26ZeZsXQI4KLJ0ukmT317ZWjOQs8xsyGeDknv8dfjUs%2FpqCXFEHXTxCm17sq%2Fl%2FqPNVFHQ1%2FmbxnvtpYRKcFxewsdTDQerRiTQQulBIpQt83GLtII7RDiUm5FTIYQscdVH9PSyib9tO3NCuXNM3qMMOmkr9QGOqUBeR9%2BaGX1J%2Fzo83%2FtcLF2AXUQjfifE9m5%2By4PVp3RJfKc9ETwg1c%2BgIV%2FqwVSxiP29W2%2FxjtYrXYIQUJ5wrXCoU8VhNpr75mbgLUkn%2BCbXY76XzMtJ%2B8saFmtVth0lpr5ZDGkI3wo8%2FsphG9T10%2FL7Usda66sAC0MJF04Mm%2B7%2BwDOamPyIrarxCL9MnePlr0zQ96WkXuXVhpkqYZEtL66im8M4Lds&X-Amz-Signature=f1cc7a826d9266fd5d48c2142943d601fcb4455527b958b7a6832389e8c55b8d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VF66NW3V%2F20260824%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260824T063433Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEB0aCXVzLXdlc3QtMiJHMEUCIQCT754xbzFe%2BQlJ59u3L0DY%2FEaB%2FpRvm2PE5e%2F9T8ZMNQIgZtHsCCYgUfbwf%2F%2Bv2IsPmT6G6Jle5r%2BozHL9Y0e73jAqiAQI5v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDM9V5sWYgISXrC8e1ircA4LtBTX8Ep%2FiInRbUAjRY2Cpa9rk%2B%2FBGZpLCAL3tGIBLnRh1Um90y6jYRnETvQxHNl0EZ9LxQwUSdRXh%2Bzmza5w5l1WlEJJn7qP0PFrSqWLZkGITbrhOL41lLtuSoiumL6SeqqtNWadPCI6Ye5e%2FoVSwQgrxDq0MJIyirmLmn6KZZ4XIpGoyXvZxW0%2FNd%2BJFEsSlX7dnQOMEnRavJDZhrPdiVNIyfkmoSGn5lAkDjubYXdx6EHim4cy3FsmrMovGYaO9%2Fb1l20v11py7ERVXL39W7NMFtBoeHDswC50fefdEO4o2ihH5JKFLqnuhRihbRjUmjmWGEXgEjeAVK2epkklQiuG%2FpJUEU8neO7ls3NxCc1F13nKsVzSMKibWA8e1Q1bMoB4uk8bYtga%2FpRbyky4RSfq81OVT796sY6Ngf%2FFUZaW90AHQc%2FE6VqzQqsHmSQgnGA%2BxULHUqXZtYejOdFdSvOGk2Jyo1Flic0l26ZeZsXQI4KLJ0ukmT317ZWjOQs8xsyGeDknv8dfjUs%2FpqCXFEHXTxCm17sq%2Fl%2FqPNVFHQ1%2FmbxnvtpYRKcFxewsdTDQerRiTQQulBIpQt83GLtII7RDiUm5FTIYQscdVH9PSyib9tO3NCuXNM3qMMOmkr9QGOqUBeR9%2BaGX1J%2Fzo83%2FtcLF2AXUQjfifE9m5%2By4PVp3RJfKc9ETwg1c%2BgIV%2FqwVSxiP29W2%2FxjtYrXYIQUJ5wrXCoU8VhNpr75mbgLUkn%2BCbXY76XzMtJ%2B8saFmtVth0lpr5ZDGkI3wo8%2FsphG9T10%2FL7Usda66sAC0MJF04Mm%2B7%2BwDOamPyIrarxCL9MnePlr0zQ96WkXuXVhpkqYZEtL66im8M4Lds&X-Amz-Signature=16c88238e910c29ce51e1eb29811f8973d89a56ddb0ba184c43dec2c5b0d4015&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VF66NW3V%2F20260824%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260824T063433Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEB0aCXVzLXdlc3QtMiJHMEUCIQCT754xbzFe%2BQlJ59u3L0DY%2FEaB%2FpRvm2PE5e%2F9T8ZMNQIgZtHsCCYgUfbwf%2F%2Bv2IsPmT6G6Jle5r%2BozHL9Y0e73jAqiAQI5v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDM9V5sWYgISXrC8e1ircA4LtBTX8Ep%2FiInRbUAjRY2Cpa9rk%2B%2FBGZpLCAL3tGIBLnRh1Um90y6jYRnETvQxHNl0EZ9LxQwUSdRXh%2Bzmza5w5l1WlEJJn7qP0PFrSqWLZkGITbrhOL41lLtuSoiumL6SeqqtNWadPCI6Ye5e%2FoVSwQgrxDq0MJIyirmLmn6KZZ4XIpGoyXvZxW0%2FNd%2BJFEsSlX7dnQOMEnRavJDZhrPdiVNIyfkmoSGn5lAkDjubYXdx6EHim4cy3FsmrMovGYaO9%2Fb1l20v11py7ERVXL39W7NMFtBoeHDswC50fefdEO4o2ihH5JKFLqnuhRihbRjUmjmWGEXgEjeAVK2epkklQiuG%2FpJUEU8neO7ls3NxCc1F13nKsVzSMKibWA8e1Q1bMoB4uk8bYtga%2FpRbyky4RSfq81OVT796sY6Ngf%2FFUZaW90AHQc%2FE6VqzQqsHmSQgnGA%2BxULHUqXZtYejOdFdSvOGk2Jyo1Flic0l26ZeZsXQI4KLJ0ukmT317ZWjOQs8xsyGeDknv8dfjUs%2FpqCXFEHXTxCm17sq%2Fl%2FqPNVFHQ1%2FmbxnvtpYRKcFxewsdTDQerRiTQQulBIpQt83GLtII7RDiUm5FTIYQscdVH9PSyib9tO3NCuXNM3qMMOmkr9QGOqUBeR9%2BaGX1J%2Fzo83%2FtcLF2AXUQjfifE9m5%2By4PVp3RJfKc9ETwg1c%2BgIV%2FqwVSxiP29W2%2FxjtYrXYIQUJ5wrXCoU8VhNpr75mbgLUkn%2BCbXY76XzMtJ%2B8saFmtVth0lpr5ZDGkI3wo8%2FsphG9T10%2FL7Usda66sAC0MJF04Mm%2B7%2BwDOamPyIrarxCL9MnePlr0zQ96WkXuXVhpkqYZEtL66im8M4Lds&X-Amz-Signature=9e321b0038304bcc8f7b4e1889b05002c14187691f89b78aa08f00b98ebd762e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
