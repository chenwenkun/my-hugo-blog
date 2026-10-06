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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466524NLAH6%2F20261006%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261006T122323Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECsaCXVzLXdlc3QtMiJHMEUCICHVsqYLegybTLCUYWpGUrs%2BPiMi0NADzYLcH2T0OyXYAiEAnWK%2Bl8oK2vFVTwVMvHG0YHhePKPdwlH2xJuC45GJ0E8qiAQI8%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDKC7XMZ27sDLiM68HyrcA483gguqXAoPoPgPK%2B2MgpXPN0mPnzQ3uMZrGtwSi%2BY9ygAU6ji9KUTCtsLxGRggzYqsFKc9BuFYlj%2FiuuQbEzueBjNHDFzIbiXYz2m3j3Cqqva4tBUQcSC4nVUYS30wXALQUJ%2BGVaBEee%2FS8GN2NHMp1xrKakuXxHWwPFHu5kV4pKHpZItQUnFeALhkJgNE9aZ8HLRvhSHOUWKifP%2BbkSc0uqCsq6h0nYFDMmJFsmtfYXcHlt3WTm5RM5Mx49EOMGdF8e3GShJX3dzgFjw3tlaekZqPp7fHBRz6Tlwk3SC1zE4fS1zX%2F%2BRVTsn8DTRUdOyafq9ryJ4%2Fm4rCYnS5QUGTi8Rmue3JlentF2h5ANgVFwQIaHDUdXd4Px3%2BUgvyh%2BPZlDox1wLG7Qo%2Flk0OJinqQrzr6vNyQMQBaUpjymaJvzLw56SUBCYAEpAmgzBJAgASzvImKyUTFu%2FphzYehdETkeg9UNRS988MKRqPVCu0ELT%2B2%2BH%2FfIEOCmelWo%2Fxf%2Far55ie0vuiSf9yxCSEdUMSxuTgeBlNV%2BLvmNDc8w5nN2xSOVeUPPL0iG4y4m4QW%2FIozo%2BahXjiSXlc51AkUC8G1j2FdGNmFHN4XwlP6dgaM2vu%2Fr2Z0ReKEY7GMPuak9YGOqUB9qHRNOpaIzZSV85OQLTFd%2Fvlfn5R0PSi2zZqwudXJT8tp5bjSXzm6jmnLbLxBh%2BLzauPl3GyXKtn4RE20KNVzCOdjA8aTGImwL3k28ks0obkc64weUHMo55pOYgPitPzsf4fHI%2FvrDTKoSUPRaF7R7PyVupR13OUP%2BPvWoOTv4vp9L2S0KIXnyswx9Q0%2Ff2UXhd%2Fkmj2FrPWYXxnYOOvZJNCq%2F7h&X-Amz-Signature=39f490aec1f3f4072c7d093ce066a19683ece63d666242207dfdbd9fc8b1a200&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466524NLAH6%2F20261006%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261006T122323Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECsaCXVzLXdlc3QtMiJHMEUCICHVsqYLegybTLCUYWpGUrs%2BPiMi0NADzYLcH2T0OyXYAiEAnWK%2Bl8oK2vFVTwVMvHG0YHhePKPdwlH2xJuC45GJ0E8qiAQI8%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDKC7XMZ27sDLiM68HyrcA483gguqXAoPoPgPK%2B2MgpXPN0mPnzQ3uMZrGtwSi%2BY9ygAU6ji9KUTCtsLxGRggzYqsFKc9BuFYlj%2FiuuQbEzueBjNHDFzIbiXYz2m3j3Cqqva4tBUQcSC4nVUYS30wXALQUJ%2BGVaBEee%2FS8GN2NHMp1xrKakuXxHWwPFHu5kV4pKHpZItQUnFeALhkJgNE9aZ8HLRvhSHOUWKifP%2BbkSc0uqCsq6h0nYFDMmJFsmtfYXcHlt3WTm5RM5Mx49EOMGdF8e3GShJX3dzgFjw3tlaekZqPp7fHBRz6Tlwk3SC1zE4fS1zX%2F%2BRVTsn8DTRUdOyafq9ryJ4%2Fm4rCYnS5QUGTi8Rmue3JlentF2h5ANgVFwQIaHDUdXd4Px3%2BUgvyh%2BPZlDox1wLG7Qo%2Flk0OJinqQrzr6vNyQMQBaUpjymaJvzLw56SUBCYAEpAmgzBJAgASzvImKyUTFu%2FphzYehdETkeg9UNRS988MKRqPVCu0ELT%2B2%2BH%2FfIEOCmelWo%2Fxf%2Far55ie0vuiSf9yxCSEdUMSxuTgeBlNV%2BLvmNDc8w5nN2xSOVeUPPL0iG4y4m4QW%2FIozo%2BahXjiSXlc51AkUC8G1j2FdGNmFHN4XwlP6dgaM2vu%2Fr2Z0ReKEY7GMPuak9YGOqUB9qHRNOpaIzZSV85OQLTFd%2Fvlfn5R0PSi2zZqwudXJT8tp5bjSXzm6jmnLbLxBh%2BLzauPl3GyXKtn4RE20KNVzCOdjA8aTGImwL3k28ks0obkc64weUHMo55pOYgPitPzsf4fHI%2FvrDTKoSUPRaF7R7PyVupR13OUP%2BPvWoOTv4vp9L2S0KIXnyswx9Q0%2Ff2UXhd%2Fkmj2FrPWYXxnYOOvZJNCq%2F7h&X-Amz-Signature=42862dac16804f65db8678ed2cbc233e445d07b7bfa5209d9c01b99a0b3c2a87&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466524NLAH6%2F20261006%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261006T122323Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECsaCXVzLXdlc3QtMiJHMEUCICHVsqYLegybTLCUYWpGUrs%2BPiMi0NADzYLcH2T0OyXYAiEAnWK%2Bl8oK2vFVTwVMvHG0YHhePKPdwlH2xJuC45GJ0E8qiAQI8%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDKC7XMZ27sDLiM68HyrcA483gguqXAoPoPgPK%2B2MgpXPN0mPnzQ3uMZrGtwSi%2BY9ygAU6ji9KUTCtsLxGRggzYqsFKc9BuFYlj%2FiuuQbEzueBjNHDFzIbiXYz2m3j3Cqqva4tBUQcSC4nVUYS30wXALQUJ%2BGVaBEee%2FS8GN2NHMp1xrKakuXxHWwPFHu5kV4pKHpZItQUnFeALhkJgNE9aZ8HLRvhSHOUWKifP%2BbkSc0uqCsq6h0nYFDMmJFsmtfYXcHlt3WTm5RM5Mx49EOMGdF8e3GShJX3dzgFjw3tlaekZqPp7fHBRz6Tlwk3SC1zE4fS1zX%2F%2BRVTsn8DTRUdOyafq9ryJ4%2Fm4rCYnS5QUGTi8Rmue3JlentF2h5ANgVFwQIaHDUdXd4Px3%2BUgvyh%2BPZlDox1wLG7Qo%2Flk0OJinqQrzr6vNyQMQBaUpjymaJvzLw56SUBCYAEpAmgzBJAgASzvImKyUTFu%2FphzYehdETkeg9UNRS988MKRqPVCu0ELT%2B2%2BH%2FfIEOCmelWo%2Fxf%2Far55ie0vuiSf9yxCSEdUMSxuTgeBlNV%2BLvmNDc8w5nN2xSOVeUPPL0iG4y4m4QW%2FIozo%2BahXjiSXlc51AkUC8G1j2FdGNmFHN4XwlP6dgaM2vu%2Fr2Z0ReKEY7GMPuak9YGOqUB9qHRNOpaIzZSV85OQLTFd%2Fvlfn5R0PSi2zZqwudXJT8tp5bjSXzm6jmnLbLxBh%2BLzauPl3GyXKtn4RE20KNVzCOdjA8aTGImwL3k28ks0obkc64weUHMo55pOYgPitPzsf4fHI%2FvrDTKoSUPRaF7R7PyVupR13OUP%2BPvWoOTv4vp9L2S0KIXnyswx9Q0%2Ff2UXhd%2Fkmj2FrPWYXxnYOOvZJNCq%2F7h&X-Amz-Signature=d4462174d3b8595b793d96ca0685bcc98e478f5ce7d11081a345fe9aebd8ba0a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466524NLAH6%2F20261006%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261006T122323Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECsaCXVzLXdlc3QtMiJHMEUCICHVsqYLegybTLCUYWpGUrs%2BPiMi0NADzYLcH2T0OyXYAiEAnWK%2Bl8oK2vFVTwVMvHG0YHhePKPdwlH2xJuC45GJ0E8qiAQI8%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDKC7XMZ27sDLiM68HyrcA483gguqXAoPoPgPK%2B2MgpXPN0mPnzQ3uMZrGtwSi%2BY9ygAU6ji9KUTCtsLxGRggzYqsFKc9BuFYlj%2FiuuQbEzueBjNHDFzIbiXYz2m3j3Cqqva4tBUQcSC4nVUYS30wXALQUJ%2BGVaBEee%2FS8GN2NHMp1xrKakuXxHWwPFHu5kV4pKHpZItQUnFeALhkJgNE9aZ8HLRvhSHOUWKifP%2BbkSc0uqCsq6h0nYFDMmJFsmtfYXcHlt3WTm5RM5Mx49EOMGdF8e3GShJX3dzgFjw3tlaekZqPp7fHBRz6Tlwk3SC1zE4fS1zX%2F%2BRVTsn8DTRUdOyafq9ryJ4%2Fm4rCYnS5QUGTi8Rmue3JlentF2h5ANgVFwQIaHDUdXd4Px3%2BUgvyh%2BPZlDox1wLG7Qo%2Flk0OJinqQrzr6vNyQMQBaUpjymaJvzLw56SUBCYAEpAmgzBJAgASzvImKyUTFu%2FphzYehdETkeg9UNRS988MKRqPVCu0ELT%2B2%2BH%2FfIEOCmelWo%2Fxf%2Far55ie0vuiSf9yxCSEdUMSxuTgeBlNV%2BLvmNDc8w5nN2xSOVeUPPL0iG4y4m4QW%2FIozo%2BahXjiSXlc51AkUC8G1j2FdGNmFHN4XwlP6dgaM2vu%2Fr2Z0ReKEY7GMPuak9YGOqUB9qHRNOpaIzZSV85OQLTFd%2Fvlfn5R0PSi2zZqwudXJT8tp5bjSXzm6jmnLbLxBh%2BLzauPl3GyXKtn4RE20KNVzCOdjA8aTGImwL3k28ks0obkc64weUHMo55pOYgPitPzsf4fHI%2FvrDTKoSUPRaF7R7PyVupR13OUP%2BPvWoOTv4vp9L2S0KIXnyswx9Q0%2Ff2UXhd%2Fkmj2FrPWYXxnYOOvZJNCq%2F7h&X-Amz-Signature=df1d94442d91499d975b0b6f752317eeb8d58296e266a296c0fa2f13b583ed11&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
