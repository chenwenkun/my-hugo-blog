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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665PGJ6TUF%2F20261004%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261004T112919Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCw6MiUmrONZmsn99O0WONFHmtjWSQOFI%2BAWFcNhtWSjgIgLQ0HTqjpeipzPkm41POShI3Xjoxvc1zZRiSB%2Bl0pFucqiAQIwf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDI1u2GhL2T8eyK%2FcoyrcA58cL8brPIrgCvHD3q5fVw%2FE7WRVYSY8bagORTYSKzb%2BEhi2MTY8%2BNYLW8fk5V3TkVV7SWFi2MRXJ73jihF9jxroYzy%2BCdcAkSJrs%2FWIXyIjHA4Yx%2BAc%2B2IYeUf79Pv2oB5d3uDlvMQjBDSlvd5pO%2BfNua8Rt5VEE3Et7%2BqbFn2znBwCvHZh%2BQE4FhDrWm%2BgB%2FnVxFMsHPVnCCDTI9MXjU2vg26SKO7P%2Fi6gE33Dus1CCglgBdNbMHDSPFw7w4AmvG8UIVg%2FaaDGWw09hSNTEd2LZRpmwy3%2B41nJtWCRDdGPHJjevP3VBf4uuA2x3RgPGHAUW7rebKbPPnb2lv4gTeQ0GMPhQz1L30L%2Bf%2F50xD1kn5DwDC%2BraoxGwHfSL1ZhwaL5zqfzkI5fXdR3r%2BF%2BqD1%2B4I6U5UywmGnxWGakRCCx5Bj%2Bo7BLzbJpBxA%2FH4ywtpMcZWW1GscaHJNcUDAhnCpNbw9GBBa1IDP2FiH2XvDcdv8SY4haD82QyMNdzuuZskkV7X6PR%2FsxG%2B5uMAJUTJJvKSxjLSlwNKXF9jcd2jkqeG3dHW5goHjWoR%2F%2BxVveCkKe3zyC6r96JEHv4%2FAO0O%2BZrvF6WdyQ4L8KqfkdzPbRljPBnhcdNcZXkZIPMKWWiNYGOqUBQ3L0KhvDP32vc%2Bd%2B81nGPA9NTXPGo0seu%2FwLHn7dbquBCfqGfhpb2geGT9DXxMnYkA0kYMc%2BLE4iUh90dipWlhVkb5eEwJtTE7Kn0o7LDinGrOhtus%2FZfCAU8p4s%2BjurEksylyUaQblHCQoN1g0gv9ZxRp5d56AYrjK0kSTlYiyRpJJjDToM2zPYwVtg5KXSefgdpoqhPn27dJ7zIHxGOdVdX0OP&X-Amz-Signature=d9d48d2815685108c00056e06821b49be9e8bc5936ad707afaaaceb6f7322090&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665PGJ6TUF%2F20261004%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261004T112919Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCw6MiUmrONZmsn99O0WONFHmtjWSQOFI%2BAWFcNhtWSjgIgLQ0HTqjpeipzPkm41POShI3Xjoxvc1zZRiSB%2Bl0pFucqiAQIwf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDI1u2GhL2T8eyK%2FcoyrcA58cL8brPIrgCvHD3q5fVw%2FE7WRVYSY8bagORTYSKzb%2BEhi2MTY8%2BNYLW8fk5V3TkVV7SWFi2MRXJ73jihF9jxroYzy%2BCdcAkSJrs%2FWIXyIjHA4Yx%2BAc%2B2IYeUf79Pv2oB5d3uDlvMQjBDSlvd5pO%2BfNua8Rt5VEE3Et7%2BqbFn2znBwCvHZh%2BQE4FhDrWm%2BgB%2FnVxFMsHPVnCCDTI9MXjU2vg26SKO7P%2Fi6gE33Dus1CCglgBdNbMHDSPFw7w4AmvG8UIVg%2FaaDGWw09hSNTEd2LZRpmwy3%2B41nJtWCRDdGPHJjevP3VBf4uuA2x3RgPGHAUW7rebKbPPnb2lv4gTeQ0GMPhQz1L30L%2Bf%2F50xD1kn5DwDC%2BraoxGwHfSL1ZhwaL5zqfzkI5fXdR3r%2BF%2BqD1%2B4I6U5UywmGnxWGakRCCx5Bj%2Bo7BLzbJpBxA%2FH4ywtpMcZWW1GscaHJNcUDAhnCpNbw9GBBa1IDP2FiH2XvDcdv8SY4haD82QyMNdzuuZskkV7X6PR%2FsxG%2B5uMAJUTJJvKSxjLSlwNKXF9jcd2jkqeG3dHW5goHjWoR%2F%2BxVveCkKe3zyC6r96JEHv4%2FAO0O%2BZrvF6WdyQ4L8KqfkdzPbRljPBnhcdNcZXkZIPMKWWiNYGOqUBQ3L0KhvDP32vc%2Bd%2B81nGPA9NTXPGo0seu%2FwLHn7dbquBCfqGfhpb2geGT9DXxMnYkA0kYMc%2BLE4iUh90dipWlhVkb5eEwJtTE7Kn0o7LDinGrOhtus%2FZfCAU8p4s%2BjurEksylyUaQblHCQoN1g0gv9ZxRp5d56AYrjK0kSTlYiyRpJJjDToM2zPYwVtg5KXSefgdpoqhPn27dJ7zIHxGOdVdX0OP&X-Amz-Signature=fab91483ef50806f7bbc83a050cb7515bff1bbb64274a4a9492c9d9138dbe17a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665PGJ6TUF%2F20261004%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261004T112919Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCw6MiUmrONZmsn99O0WONFHmtjWSQOFI%2BAWFcNhtWSjgIgLQ0HTqjpeipzPkm41POShI3Xjoxvc1zZRiSB%2Bl0pFucqiAQIwf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDI1u2GhL2T8eyK%2FcoyrcA58cL8brPIrgCvHD3q5fVw%2FE7WRVYSY8bagORTYSKzb%2BEhi2MTY8%2BNYLW8fk5V3TkVV7SWFi2MRXJ73jihF9jxroYzy%2BCdcAkSJrs%2FWIXyIjHA4Yx%2BAc%2B2IYeUf79Pv2oB5d3uDlvMQjBDSlvd5pO%2BfNua8Rt5VEE3Et7%2BqbFn2znBwCvHZh%2BQE4FhDrWm%2BgB%2FnVxFMsHPVnCCDTI9MXjU2vg26SKO7P%2Fi6gE33Dus1CCglgBdNbMHDSPFw7w4AmvG8UIVg%2FaaDGWw09hSNTEd2LZRpmwy3%2B41nJtWCRDdGPHJjevP3VBf4uuA2x3RgPGHAUW7rebKbPPnb2lv4gTeQ0GMPhQz1L30L%2Bf%2F50xD1kn5DwDC%2BraoxGwHfSL1ZhwaL5zqfzkI5fXdR3r%2BF%2BqD1%2B4I6U5UywmGnxWGakRCCx5Bj%2Bo7BLzbJpBxA%2FH4ywtpMcZWW1GscaHJNcUDAhnCpNbw9GBBa1IDP2FiH2XvDcdv8SY4haD82QyMNdzuuZskkV7X6PR%2FsxG%2B5uMAJUTJJvKSxjLSlwNKXF9jcd2jkqeG3dHW5goHjWoR%2F%2BxVveCkKe3zyC6r96JEHv4%2FAO0O%2BZrvF6WdyQ4L8KqfkdzPbRljPBnhcdNcZXkZIPMKWWiNYGOqUBQ3L0KhvDP32vc%2Bd%2B81nGPA9NTXPGo0seu%2FwLHn7dbquBCfqGfhpb2geGT9DXxMnYkA0kYMc%2BLE4iUh90dipWlhVkb5eEwJtTE7Kn0o7LDinGrOhtus%2FZfCAU8p4s%2BjurEksylyUaQblHCQoN1g0gv9ZxRp5d56AYrjK0kSTlYiyRpJJjDToM2zPYwVtg5KXSefgdpoqhPn27dJ7zIHxGOdVdX0OP&X-Amz-Signature=bdd47c6033545e423e1da4b0675fe44a333b48cd3489de182d3afc099c47f1f9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665PGJ6TUF%2F20261004%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261004T112919Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCw6MiUmrONZmsn99O0WONFHmtjWSQOFI%2BAWFcNhtWSjgIgLQ0HTqjpeipzPkm41POShI3Xjoxvc1zZRiSB%2Bl0pFucqiAQIwf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDI1u2GhL2T8eyK%2FcoyrcA58cL8brPIrgCvHD3q5fVw%2FE7WRVYSY8bagORTYSKzb%2BEhi2MTY8%2BNYLW8fk5V3TkVV7SWFi2MRXJ73jihF9jxroYzy%2BCdcAkSJrs%2FWIXyIjHA4Yx%2BAc%2B2IYeUf79Pv2oB5d3uDlvMQjBDSlvd5pO%2BfNua8Rt5VEE3Et7%2BqbFn2znBwCvHZh%2BQE4FhDrWm%2BgB%2FnVxFMsHPVnCCDTI9MXjU2vg26SKO7P%2Fi6gE33Dus1CCglgBdNbMHDSPFw7w4AmvG8UIVg%2FaaDGWw09hSNTEd2LZRpmwy3%2B41nJtWCRDdGPHJjevP3VBf4uuA2x3RgPGHAUW7rebKbPPnb2lv4gTeQ0GMPhQz1L30L%2Bf%2F50xD1kn5DwDC%2BraoxGwHfSL1ZhwaL5zqfzkI5fXdR3r%2BF%2BqD1%2B4I6U5UywmGnxWGakRCCx5Bj%2Bo7BLzbJpBxA%2FH4ywtpMcZWW1GscaHJNcUDAhnCpNbw9GBBa1IDP2FiH2XvDcdv8SY4haD82QyMNdzuuZskkV7X6PR%2FsxG%2B5uMAJUTJJvKSxjLSlwNKXF9jcd2jkqeG3dHW5goHjWoR%2F%2BxVveCkKe3zyC6r96JEHv4%2FAO0O%2BZrvF6WdyQ4L8KqfkdzPbRljPBnhcdNcZXkZIPMKWWiNYGOqUBQ3L0KhvDP32vc%2Bd%2B81nGPA9NTXPGo0seu%2FwLHn7dbquBCfqGfhpb2geGT9DXxMnYkA0kYMc%2BLE4iUh90dipWlhVkb5eEwJtTE7Kn0o7LDinGrOhtus%2FZfCAU8p4s%2BjurEksylyUaQblHCQoN1g0gv9ZxRp5d56AYrjK0kSTlYiyRpJJjDToM2zPYwVtg5KXSefgdpoqhPn27dJ7zIHxGOdVdX0OP&X-Amz-Signature=d69f9a56d380b12cbf7c629f3aa02751e4dbd468aa16126bfbe9bbd9f0f7447f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
