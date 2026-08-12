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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663F2QWW5M%2F20260812%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260812T184554Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAgaCXVzLXdlc3QtMiJIMEYCIQDwIuvvVe9w17ml9zMOcxsx4oEj6yh%2B0%2FIXFunW30fiTQIhAOoxwgTq0L%2Fm9Y1likUJWbiVD4IMzXKxkJkdyhYqTHW7KogECNH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxY6QKVMCpKKM2iqRcq3AMxMWMOM7CPZ1m%2BdA5Oe55KTr9saE%2BwbgBqdEato0OD8BO%2BzG7wNtrlw5ECeD9RetUVrTcNNtpKXIkE%2FUrZikrXBvChpRi6%2FenNwYjjtxsk5M7T5%2F4s0aVmJ%2FAJXFOuSScdlLRkOWmWcqP4WT%2BKmLesw8VKJtDC6%2BL9qecBhyJq0OTgvYbkAeiYXF9iWFNETc40ieX5Ej6KINiXFs3YafHiFv7awbjr5XvppcOkQaWiqzHH5C0%2Fl30WZdH%2FbCvfHuD%2BiJwhjlSH3hLhoLMBG6bfh8gvF93PVWp0BedAxDNO6fLDzoVGPGcSVh4tX%2BHkqEdbVTEyvuZEbW3qCwhDNFaX%2FiXB0alOeYfAnyiOEzWaliq524AHSFuF2nMn86c3ltBzd8MWPhJtJyzImZknKXwYmJWIF6tvi%2FfIwdF6LW1zyaDbxY4jZB5m6srttj0%2Fq94KlVQkgsVYXiyHSNwqnxNL%2BVS39objXzjUop2K5qqnCu%2BnS%2BuzXsLC%2FQdgzUM2A4jwNd69AyUma3Zu9IzH83z4ZmWg7dyGCGzzgDmBg4zKlApc3GWlZ1kBtSINZbBW9VXaDt8bKqWzLzh%2F%2BlWCs6f1LG4QL38kPYuZmL5%2ByinYwZxCKZfztRQUYkyW5DC%2BsvLTBjqkAU3B6BKI9KAMb86RXHI8%2FCkJdMozdF%2FAPZvGHAcSzClb0b77cUBlsetKQIGwrf8D61r%2FlW6rBeTsSsDLJnPNmPgBtNcHcjSjRc%2FgMB8bQmUoVfWH7R6%2Bhq0DEbtPyMMqNNvCg2p63jY3zPIPfKic8ekjXDEDYopYGaN%2BrlrEVduDI%2FlxX7DrIIuvy7DlEuiRzdpVzhdkZhmhJOcDNAlc5JjVlo72&X-Amz-Signature=3e6e7381c556f733f985e97d8eac741b1250037ac618bc8ac3b9538ba33f786f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663F2QWW5M%2F20260812%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260812T184554Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAgaCXVzLXdlc3QtMiJIMEYCIQDwIuvvVe9w17ml9zMOcxsx4oEj6yh%2B0%2FIXFunW30fiTQIhAOoxwgTq0L%2Fm9Y1likUJWbiVD4IMzXKxkJkdyhYqTHW7KogECNH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxY6QKVMCpKKM2iqRcq3AMxMWMOM7CPZ1m%2BdA5Oe55KTr9saE%2BwbgBqdEato0OD8BO%2BzG7wNtrlw5ECeD9RetUVrTcNNtpKXIkE%2FUrZikrXBvChpRi6%2FenNwYjjtxsk5M7T5%2F4s0aVmJ%2FAJXFOuSScdlLRkOWmWcqP4WT%2BKmLesw8VKJtDC6%2BL9qecBhyJq0OTgvYbkAeiYXF9iWFNETc40ieX5Ej6KINiXFs3YafHiFv7awbjr5XvppcOkQaWiqzHH5C0%2Fl30WZdH%2FbCvfHuD%2BiJwhjlSH3hLhoLMBG6bfh8gvF93PVWp0BedAxDNO6fLDzoVGPGcSVh4tX%2BHkqEdbVTEyvuZEbW3qCwhDNFaX%2FiXB0alOeYfAnyiOEzWaliq524AHSFuF2nMn86c3ltBzd8MWPhJtJyzImZknKXwYmJWIF6tvi%2FfIwdF6LW1zyaDbxY4jZB5m6srttj0%2Fq94KlVQkgsVYXiyHSNwqnxNL%2BVS39objXzjUop2K5qqnCu%2BnS%2BuzXsLC%2FQdgzUM2A4jwNd69AyUma3Zu9IzH83z4ZmWg7dyGCGzzgDmBg4zKlApc3GWlZ1kBtSINZbBW9VXaDt8bKqWzLzh%2F%2BlWCs6f1LG4QL38kPYuZmL5%2ByinYwZxCKZfztRQUYkyW5DC%2BsvLTBjqkAU3B6BKI9KAMb86RXHI8%2FCkJdMozdF%2FAPZvGHAcSzClb0b77cUBlsetKQIGwrf8D61r%2FlW6rBeTsSsDLJnPNmPgBtNcHcjSjRc%2FgMB8bQmUoVfWH7R6%2Bhq0DEbtPyMMqNNvCg2p63jY3zPIPfKic8ekjXDEDYopYGaN%2BrlrEVduDI%2FlxX7DrIIuvy7DlEuiRzdpVzhdkZhmhJOcDNAlc5JjVlo72&X-Amz-Signature=6906a2cc74606f2b813d889b399f4fab7270f0a0ab594bcbe051c0aa9195915e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663F2QWW5M%2F20260812%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260812T184554Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAgaCXVzLXdlc3QtMiJIMEYCIQDwIuvvVe9w17ml9zMOcxsx4oEj6yh%2B0%2FIXFunW30fiTQIhAOoxwgTq0L%2Fm9Y1likUJWbiVD4IMzXKxkJkdyhYqTHW7KogECNH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxY6QKVMCpKKM2iqRcq3AMxMWMOM7CPZ1m%2BdA5Oe55KTr9saE%2BwbgBqdEato0OD8BO%2BzG7wNtrlw5ECeD9RetUVrTcNNtpKXIkE%2FUrZikrXBvChpRi6%2FenNwYjjtxsk5M7T5%2F4s0aVmJ%2FAJXFOuSScdlLRkOWmWcqP4WT%2BKmLesw8VKJtDC6%2BL9qecBhyJq0OTgvYbkAeiYXF9iWFNETc40ieX5Ej6KINiXFs3YafHiFv7awbjr5XvppcOkQaWiqzHH5C0%2Fl30WZdH%2FbCvfHuD%2BiJwhjlSH3hLhoLMBG6bfh8gvF93PVWp0BedAxDNO6fLDzoVGPGcSVh4tX%2BHkqEdbVTEyvuZEbW3qCwhDNFaX%2FiXB0alOeYfAnyiOEzWaliq524AHSFuF2nMn86c3ltBzd8MWPhJtJyzImZknKXwYmJWIF6tvi%2FfIwdF6LW1zyaDbxY4jZB5m6srttj0%2Fq94KlVQkgsVYXiyHSNwqnxNL%2BVS39objXzjUop2K5qqnCu%2BnS%2BuzXsLC%2FQdgzUM2A4jwNd69AyUma3Zu9IzH83z4ZmWg7dyGCGzzgDmBg4zKlApc3GWlZ1kBtSINZbBW9VXaDt8bKqWzLzh%2F%2BlWCs6f1LG4QL38kPYuZmL5%2ByinYwZxCKZfztRQUYkyW5DC%2BsvLTBjqkAU3B6BKI9KAMb86RXHI8%2FCkJdMozdF%2FAPZvGHAcSzClb0b77cUBlsetKQIGwrf8D61r%2FlW6rBeTsSsDLJnPNmPgBtNcHcjSjRc%2FgMB8bQmUoVfWH7R6%2Bhq0DEbtPyMMqNNvCg2p63jY3zPIPfKic8ekjXDEDYopYGaN%2BrlrEVduDI%2FlxX7DrIIuvy7DlEuiRzdpVzhdkZhmhJOcDNAlc5JjVlo72&X-Amz-Signature=0c26c801c2852b2e452679f614c47171fec503cb1ae1cd2a2e6437e5d0f58a3b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663F2QWW5M%2F20260812%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260812T184554Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAgaCXVzLXdlc3QtMiJIMEYCIQDwIuvvVe9w17ml9zMOcxsx4oEj6yh%2B0%2FIXFunW30fiTQIhAOoxwgTq0L%2Fm9Y1likUJWbiVD4IMzXKxkJkdyhYqTHW7KogECNH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxY6QKVMCpKKM2iqRcq3AMxMWMOM7CPZ1m%2BdA5Oe55KTr9saE%2BwbgBqdEato0OD8BO%2BzG7wNtrlw5ECeD9RetUVrTcNNtpKXIkE%2FUrZikrXBvChpRi6%2FenNwYjjtxsk5M7T5%2F4s0aVmJ%2FAJXFOuSScdlLRkOWmWcqP4WT%2BKmLesw8VKJtDC6%2BL9qecBhyJq0OTgvYbkAeiYXF9iWFNETc40ieX5Ej6KINiXFs3YafHiFv7awbjr5XvppcOkQaWiqzHH5C0%2Fl30WZdH%2FbCvfHuD%2BiJwhjlSH3hLhoLMBG6bfh8gvF93PVWp0BedAxDNO6fLDzoVGPGcSVh4tX%2BHkqEdbVTEyvuZEbW3qCwhDNFaX%2FiXB0alOeYfAnyiOEzWaliq524AHSFuF2nMn86c3ltBzd8MWPhJtJyzImZknKXwYmJWIF6tvi%2FfIwdF6LW1zyaDbxY4jZB5m6srttj0%2Fq94KlVQkgsVYXiyHSNwqnxNL%2BVS39objXzjUop2K5qqnCu%2BnS%2BuzXsLC%2FQdgzUM2A4jwNd69AyUma3Zu9IzH83z4ZmWg7dyGCGzzgDmBg4zKlApc3GWlZ1kBtSINZbBW9VXaDt8bKqWzLzh%2F%2BlWCs6f1LG4QL38kPYuZmL5%2ByinYwZxCKZfztRQUYkyW5DC%2BsvLTBjqkAU3B6BKI9KAMb86RXHI8%2FCkJdMozdF%2FAPZvGHAcSzClb0b77cUBlsetKQIGwrf8D61r%2FlW6rBeTsSsDLJnPNmPgBtNcHcjSjRc%2FgMB8bQmUoVfWH7R6%2Bhq0DEbtPyMMqNNvCg2p63jY3zPIPfKic8ekjXDEDYopYGaN%2BrlrEVduDI%2FlxX7DrIIuvy7DlEuiRzdpVzhdkZhmhJOcDNAlc5JjVlo72&X-Amz-Signature=c983e75b5484d011d0ac1e27c2d19a385c0dbe7299c0def9b1f90a7f26c1e242&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
