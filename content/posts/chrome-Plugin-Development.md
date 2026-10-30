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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YI6UYPPC%2F20261030%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261030T172541Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHEaCXVzLXdlc3QtMiJIMEYCIQDXFzZDQtl%2BDeOHm1VYppy1a1uUmfHjAXuzWxi9I%2BdYbwIhAMZe4o%2FMwLz9maWQ27lX7Qc%2BrmVInYJlrTNR5VZQ9ricKv8DCDkQABoMNjM3NDIzMTgzODA1Igz7KiO5s7FMfmkOtygq3AOC5k03tq4b%2FbKpAqwEfvNE%2FKE4W45T5weDaRdPg8WrDVaiAIaa8WhvnxYTZoJUSCRSG0V6ZsqWVUYTs%2BE6tt%2FlIr0%2B0hyAvvS5LMN5%2Bl61dp5Z0tFa8I4Z9I%2Bzhtv%2BZLnBRt34mZI0sh9Y6ZRJKHNbykNkkuVOob7PlIlmF0qF6OKsc%2FvjmDTQ62KnupT8BeyUCZ1mfsR%2B8kYGxzNsyY39DSVb%2FKSfyk%2Bs2Yx1cOSM4fQ9hfJhNaR302LzwtqG%2F7XNhBeBaIJzeT1w73rbpXaUebXoA8qHmQCa0AX0x3nOUJHUwQnp3rEB6%2Fyv99grn7DD0bSER7BG3ip9fQ8tiwW82mEHQRvRA99pPG1%2Fnz43xJoCVh%2BfxD57MQihhK7YJBF2j860AyrMuRt8TCkH%2FnDvrS6IuUj01kis2iPh%2FoBuPeh%2Fig5yAWcT%2BaBqX8J%2Fh0o5ckBmXZEwnLu%2FCK1O2F5TlEd7XGt6TStZ38lX12ofbT2%2FiusycN5Q4%2BsJEbv3q5R768a9WqFAtWSN9AeyvTA9kIXM%2FoTtGY2TP%2FfN8a%2B93AtZ0tEkjFLks3V00u4UICCngfWC6lChm2xXPJ6iZculwVbJlbt%2FureUei65ZfOYRoTWzwHp7mWs9mf5bjCEh5PXBjqkAaU8TWCiFizKLTda6IGXDED%2B2vW%2BWSZ5%2FQlyz4I2d57g7CgaarTeyemkd3RCI47m7PH7tm3Yks9phqEVLsPYI6cw6mXPpGo3jtwPN4xMVSUnQNdCinbxbNQHJmaWWBUnAXAFwXLCLMhjW3deKJ9Jq7uhbeyMk2GdCxZIG1IfU6tOMi905X%2B4u1wRuEO97kjT%2FeroEXqGQkbejvGG%2BiP2KaLiN%2BOc&X-Amz-Signature=0e14cf8fa4900f4dcea43ef76c6943341c839530b277c7cbcffd06a5724263bf&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YI6UYPPC%2F20261030%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261030T172541Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHEaCXVzLXdlc3QtMiJIMEYCIQDXFzZDQtl%2BDeOHm1VYppy1a1uUmfHjAXuzWxi9I%2BdYbwIhAMZe4o%2FMwLz9maWQ27lX7Qc%2BrmVInYJlrTNR5VZQ9ricKv8DCDkQABoMNjM3NDIzMTgzODA1Igz7KiO5s7FMfmkOtygq3AOC5k03tq4b%2FbKpAqwEfvNE%2FKE4W45T5weDaRdPg8WrDVaiAIaa8WhvnxYTZoJUSCRSG0V6ZsqWVUYTs%2BE6tt%2FlIr0%2B0hyAvvS5LMN5%2Bl61dp5Z0tFa8I4Z9I%2Bzhtv%2BZLnBRt34mZI0sh9Y6ZRJKHNbykNkkuVOob7PlIlmF0qF6OKsc%2FvjmDTQ62KnupT8BeyUCZ1mfsR%2B8kYGxzNsyY39DSVb%2FKSfyk%2Bs2Yx1cOSM4fQ9hfJhNaR302LzwtqG%2F7XNhBeBaIJzeT1w73rbpXaUebXoA8qHmQCa0AX0x3nOUJHUwQnp3rEB6%2Fyv99grn7DD0bSER7BG3ip9fQ8tiwW82mEHQRvRA99pPG1%2Fnz43xJoCVh%2BfxD57MQihhK7YJBF2j860AyrMuRt8TCkH%2FnDvrS6IuUj01kis2iPh%2FoBuPeh%2Fig5yAWcT%2BaBqX8J%2Fh0o5ckBmXZEwnLu%2FCK1O2F5TlEd7XGt6TStZ38lX12ofbT2%2FiusycN5Q4%2BsJEbv3q5R768a9WqFAtWSN9AeyvTA9kIXM%2FoTtGY2TP%2FfN8a%2B93AtZ0tEkjFLks3V00u4UICCngfWC6lChm2xXPJ6iZculwVbJlbt%2FureUei65ZfOYRoTWzwHp7mWs9mf5bjCEh5PXBjqkAaU8TWCiFizKLTda6IGXDED%2B2vW%2BWSZ5%2FQlyz4I2d57g7CgaarTeyemkd3RCI47m7PH7tm3Yks9phqEVLsPYI6cw6mXPpGo3jtwPN4xMVSUnQNdCinbxbNQHJmaWWBUnAXAFwXLCLMhjW3deKJ9Jq7uhbeyMk2GdCxZIG1IfU6tOMi905X%2B4u1wRuEO97kjT%2FeroEXqGQkbejvGG%2BiP2KaLiN%2BOc&X-Amz-Signature=bcdcd3218c585755ad042751a6a3dc13d72f478e148545eefe33053b440c360a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YI6UYPPC%2F20261030%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261030T172541Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHEaCXVzLXdlc3QtMiJIMEYCIQDXFzZDQtl%2BDeOHm1VYppy1a1uUmfHjAXuzWxi9I%2BdYbwIhAMZe4o%2FMwLz9maWQ27lX7Qc%2BrmVInYJlrTNR5VZQ9ricKv8DCDkQABoMNjM3NDIzMTgzODA1Igz7KiO5s7FMfmkOtygq3AOC5k03tq4b%2FbKpAqwEfvNE%2FKE4W45T5weDaRdPg8WrDVaiAIaa8WhvnxYTZoJUSCRSG0V6ZsqWVUYTs%2BE6tt%2FlIr0%2B0hyAvvS5LMN5%2Bl61dp5Z0tFa8I4Z9I%2Bzhtv%2BZLnBRt34mZI0sh9Y6ZRJKHNbykNkkuVOob7PlIlmF0qF6OKsc%2FvjmDTQ62KnupT8BeyUCZ1mfsR%2B8kYGxzNsyY39DSVb%2FKSfyk%2Bs2Yx1cOSM4fQ9hfJhNaR302LzwtqG%2F7XNhBeBaIJzeT1w73rbpXaUebXoA8qHmQCa0AX0x3nOUJHUwQnp3rEB6%2Fyv99grn7DD0bSER7BG3ip9fQ8tiwW82mEHQRvRA99pPG1%2Fnz43xJoCVh%2BfxD57MQihhK7YJBF2j860AyrMuRt8TCkH%2FnDvrS6IuUj01kis2iPh%2FoBuPeh%2Fig5yAWcT%2BaBqX8J%2Fh0o5ckBmXZEwnLu%2FCK1O2F5TlEd7XGt6TStZ38lX12ofbT2%2FiusycN5Q4%2BsJEbv3q5R768a9WqFAtWSN9AeyvTA9kIXM%2FoTtGY2TP%2FfN8a%2B93AtZ0tEkjFLks3V00u4UICCngfWC6lChm2xXPJ6iZculwVbJlbt%2FureUei65ZfOYRoTWzwHp7mWs9mf5bjCEh5PXBjqkAaU8TWCiFizKLTda6IGXDED%2B2vW%2BWSZ5%2FQlyz4I2d57g7CgaarTeyemkd3RCI47m7PH7tm3Yks9phqEVLsPYI6cw6mXPpGo3jtwPN4xMVSUnQNdCinbxbNQHJmaWWBUnAXAFwXLCLMhjW3deKJ9Jq7uhbeyMk2GdCxZIG1IfU6tOMi905X%2B4u1wRuEO97kjT%2FeroEXqGQkbejvGG%2BiP2KaLiN%2BOc&X-Amz-Signature=65a08759dcbf8220a4668d8895d533101462321d3154a7d8968cc075b3e397a6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YI6UYPPC%2F20261030%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261030T172541Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHEaCXVzLXdlc3QtMiJIMEYCIQDXFzZDQtl%2BDeOHm1VYppy1a1uUmfHjAXuzWxi9I%2BdYbwIhAMZe4o%2FMwLz9maWQ27lX7Qc%2BrmVInYJlrTNR5VZQ9ricKv8DCDkQABoMNjM3NDIzMTgzODA1Igz7KiO5s7FMfmkOtygq3AOC5k03tq4b%2FbKpAqwEfvNE%2FKE4W45T5weDaRdPg8WrDVaiAIaa8WhvnxYTZoJUSCRSG0V6ZsqWVUYTs%2BE6tt%2FlIr0%2B0hyAvvS5LMN5%2Bl61dp5Z0tFa8I4Z9I%2Bzhtv%2BZLnBRt34mZI0sh9Y6ZRJKHNbykNkkuVOob7PlIlmF0qF6OKsc%2FvjmDTQ62KnupT8BeyUCZ1mfsR%2B8kYGxzNsyY39DSVb%2FKSfyk%2Bs2Yx1cOSM4fQ9hfJhNaR302LzwtqG%2F7XNhBeBaIJzeT1w73rbpXaUebXoA8qHmQCa0AX0x3nOUJHUwQnp3rEB6%2Fyv99grn7DD0bSER7BG3ip9fQ8tiwW82mEHQRvRA99pPG1%2Fnz43xJoCVh%2BfxD57MQihhK7YJBF2j860AyrMuRt8TCkH%2FnDvrS6IuUj01kis2iPh%2FoBuPeh%2Fig5yAWcT%2BaBqX8J%2Fh0o5ckBmXZEwnLu%2FCK1O2F5TlEd7XGt6TStZ38lX12ofbT2%2FiusycN5Q4%2BsJEbv3q5R768a9WqFAtWSN9AeyvTA9kIXM%2FoTtGY2TP%2FfN8a%2B93AtZ0tEkjFLks3V00u4UICCngfWC6lChm2xXPJ6iZculwVbJlbt%2FureUei65ZfOYRoTWzwHp7mWs9mf5bjCEh5PXBjqkAaU8TWCiFizKLTda6IGXDED%2B2vW%2BWSZ5%2FQlyz4I2d57g7CgaarTeyemkd3RCI47m7PH7tm3Yks9phqEVLsPYI6cw6mXPpGo3jtwPN4xMVSUnQNdCinbxbNQHJmaWWBUnAXAFwXLCLMhjW3deKJ9Jq7uhbeyMk2GdCxZIG1IfU6tOMi905X%2B4u1wRuEO97kjT%2FeroEXqGQkbejvGG%2BiP2KaLiN%2BOc&X-Amz-Signature=cf025adf8564156e839afc30f3f70ed125b371164417bbe0e2507f4187e71f9a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
