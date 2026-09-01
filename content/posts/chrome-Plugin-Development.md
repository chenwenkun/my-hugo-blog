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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665CP3PQFH%2F20260901%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260901T023239Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCr7ul%2FtBXLXzSIefqwVl0e7GHOo28uJ2tRCFkzJfck%2FwIhANfnxXfFozBtu8qKvHB%2FerMdPCdhJ%2FlcTBtjnyk1Fg98KogECKL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwRREWwX6C0ZATowTQq3APu7o%2BaiOB0xz0eXH6J4%2BwPwhlRmzwzRTCElgv4WNV4vJmLSO%2FsbQkP%2B39OGNPG9i1n3NCvrEXjsOzLtkf020vUvj3PkiPndYp3A5rmATQ1T6ZEssWIN532J%2FEN81%2FtEZZ%2FoLaMw%2BYNaeOEVjlSRmHQTgFhlSFLq%2FozFkQqFMHcIOXx4GAkbuqon9XCysbrP%2F9QBzO4yc%2FOcx6xQDW4JT3mp7We3A4Kz1by%2Fw7j7gt80fqapyzYC85R69WBr4F30Bj7Huaylfu0gT0rC3COiOnX%2FR6QtabvchsQEZDmmumnsqcJF3VEER4l3wC71H6i6AVTieacKMy03UBXcP6kg9ISdLO%2BKwdBdMOfAGujXxqExjRB7lQKpEvpe8mc4X056O5osASJnZdatVjBNm1%2BGKW8UtTotE69x9xhFLwDK0FBrkH7QIarPDihdfUHG2%2FiYUcj5g5a7B4gSGvRS5hRXv%2FXFsT3bXamjgrCy1ZFcPmtiYn1y3sdZJrZFYGzO4MkQRSyTPyREHtLL8czsfWLQKG9xaBtWNF6yV36JWpKMG5kLF2KPu9OGjrtwYIHuXT5KQRxqdemRO6qVh1X5yWt%2Bz3xoHXSzT98Cvol5i2Dlicv1oVo7spdn6cyuMEdUzCD0tjUBjqkATY619n8xoERWtDMOzYbMGbfpIntPQHtRvZD5hJNOfvnPh3gHykPMN2G%2BbsiSg%2BwSj5mF4DNLF2kBSUuNR0nA%2FhDKU2JTdjSANvy5n%2B3KRggZkn3IJU4RSZqmOn1AX4pThCUvoh64r7Jml6ZPh5pUwz%2BnI21xIHTpITtCbUYexJaWcvfg%2BFgNVP3yuvi%2BLnv9VKHTV2s3TEfEdjLlO5bw9rQlaOZ&X-Amz-Signature=2779bf0870f585ee3338d5b71d7b0fc2c54e6b5f2a794b1e9eb30795da04d9ac&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665CP3PQFH%2F20260901%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260901T023239Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCr7ul%2FtBXLXzSIefqwVl0e7GHOo28uJ2tRCFkzJfck%2FwIhANfnxXfFozBtu8qKvHB%2FerMdPCdhJ%2FlcTBtjnyk1Fg98KogECKL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwRREWwX6C0ZATowTQq3APu7o%2BaiOB0xz0eXH6J4%2BwPwhlRmzwzRTCElgv4WNV4vJmLSO%2FsbQkP%2B39OGNPG9i1n3NCvrEXjsOzLtkf020vUvj3PkiPndYp3A5rmATQ1T6ZEssWIN532J%2FEN81%2FtEZZ%2FoLaMw%2BYNaeOEVjlSRmHQTgFhlSFLq%2FozFkQqFMHcIOXx4GAkbuqon9XCysbrP%2F9QBzO4yc%2FOcx6xQDW4JT3mp7We3A4Kz1by%2Fw7j7gt80fqapyzYC85R69WBr4F30Bj7Huaylfu0gT0rC3COiOnX%2FR6QtabvchsQEZDmmumnsqcJF3VEER4l3wC71H6i6AVTieacKMy03UBXcP6kg9ISdLO%2BKwdBdMOfAGujXxqExjRB7lQKpEvpe8mc4X056O5osASJnZdatVjBNm1%2BGKW8UtTotE69x9xhFLwDK0FBrkH7QIarPDihdfUHG2%2FiYUcj5g5a7B4gSGvRS5hRXv%2FXFsT3bXamjgrCy1ZFcPmtiYn1y3sdZJrZFYGzO4MkQRSyTPyREHtLL8czsfWLQKG9xaBtWNF6yV36JWpKMG5kLF2KPu9OGjrtwYIHuXT5KQRxqdemRO6qVh1X5yWt%2Bz3xoHXSzT98Cvol5i2Dlicv1oVo7spdn6cyuMEdUzCD0tjUBjqkATY619n8xoERWtDMOzYbMGbfpIntPQHtRvZD5hJNOfvnPh3gHykPMN2G%2BbsiSg%2BwSj5mF4DNLF2kBSUuNR0nA%2FhDKU2JTdjSANvy5n%2B3KRggZkn3IJU4RSZqmOn1AX4pThCUvoh64r7Jml6ZPh5pUwz%2BnI21xIHTpITtCbUYexJaWcvfg%2BFgNVP3yuvi%2BLnv9VKHTV2s3TEfEdjLlO5bw9rQlaOZ&X-Amz-Signature=9144f8e19955aecb76cc0a72e45613c02d519a06d93435a22646e3b6b5e56ce0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665CP3PQFH%2F20260901%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260901T023239Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCr7ul%2FtBXLXzSIefqwVl0e7GHOo28uJ2tRCFkzJfck%2FwIhANfnxXfFozBtu8qKvHB%2FerMdPCdhJ%2FlcTBtjnyk1Fg98KogECKL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwRREWwX6C0ZATowTQq3APu7o%2BaiOB0xz0eXH6J4%2BwPwhlRmzwzRTCElgv4WNV4vJmLSO%2FsbQkP%2B39OGNPG9i1n3NCvrEXjsOzLtkf020vUvj3PkiPndYp3A5rmATQ1T6ZEssWIN532J%2FEN81%2FtEZZ%2FoLaMw%2BYNaeOEVjlSRmHQTgFhlSFLq%2FozFkQqFMHcIOXx4GAkbuqon9XCysbrP%2F9QBzO4yc%2FOcx6xQDW4JT3mp7We3A4Kz1by%2Fw7j7gt80fqapyzYC85R69WBr4F30Bj7Huaylfu0gT0rC3COiOnX%2FR6QtabvchsQEZDmmumnsqcJF3VEER4l3wC71H6i6AVTieacKMy03UBXcP6kg9ISdLO%2BKwdBdMOfAGujXxqExjRB7lQKpEvpe8mc4X056O5osASJnZdatVjBNm1%2BGKW8UtTotE69x9xhFLwDK0FBrkH7QIarPDihdfUHG2%2FiYUcj5g5a7B4gSGvRS5hRXv%2FXFsT3bXamjgrCy1ZFcPmtiYn1y3sdZJrZFYGzO4MkQRSyTPyREHtLL8czsfWLQKG9xaBtWNF6yV36JWpKMG5kLF2KPu9OGjrtwYIHuXT5KQRxqdemRO6qVh1X5yWt%2Bz3xoHXSzT98Cvol5i2Dlicv1oVo7spdn6cyuMEdUzCD0tjUBjqkATY619n8xoERWtDMOzYbMGbfpIntPQHtRvZD5hJNOfvnPh3gHykPMN2G%2BbsiSg%2BwSj5mF4DNLF2kBSUuNR0nA%2FhDKU2JTdjSANvy5n%2B3KRggZkn3IJU4RSZqmOn1AX4pThCUvoh64r7Jml6ZPh5pUwz%2BnI21xIHTpITtCbUYexJaWcvfg%2BFgNVP3yuvi%2BLnv9VKHTV2s3TEfEdjLlO5bw9rQlaOZ&X-Amz-Signature=d268d45812544e7f7bbe5813f929f3e1fbaee13e2f0979e1de84da6a4f2bf1dc&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665CP3PQFH%2F20260901%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260901T023239Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCr7ul%2FtBXLXzSIefqwVl0e7GHOo28uJ2tRCFkzJfck%2FwIhANfnxXfFozBtu8qKvHB%2FerMdPCdhJ%2FlcTBtjnyk1Fg98KogECKL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwRREWwX6C0ZATowTQq3APu7o%2BaiOB0xz0eXH6J4%2BwPwhlRmzwzRTCElgv4WNV4vJmLSO%2FsbQkP%2B39OGNPG9i1n3NCvrEXjsOzLtkf020vUvj3PkiPndYp3A5rmATQ1T6ZEssWIN532J%2FEN81%2FtEZZ%2FoLaMw%2BYNaeOEVjlSRmHQTgFhlSFLq%2FozFkQqFMHcIOXx4GAkbuqon9XCysbrP%2F9QBzO4yc%2FOcx6xQDW4JT3mp7We3A4Kz1by%2Fw7j7gt80fqapyzYC85R69WBr4F30Bj7Huaylfu0gT0rC3COiOnX%2FR6QtabvchsQEZDmmumnsqcJF3VEER4l3wC71H6i6AVTieacKMy03UBXcP6kg9ISdLO%2BKwdBdMOfAGujXxqExjRB7lQKpEvpe8mc4X056O5osASJnZdatVjBNm1%2BGKW8UtTotE69x9xhFLwDK0FBrkH7QIarPDihdfUHG2%2FiYUcj5g5a7B4gSGvRS5hRXv%2FXFsT3bXamjgrCy1ZFcPmtiYn1y3sdZJrZFYGzO4MkQRSyTPyREHtLL8czsfWLQKG9xaBtWNF6yV36JWpKMG5kLF2KPu9OGjrtwYIHuXT5KQRxqdemRO6qVh1X5yWt%2Bz3xoHXSzT98Cvol5i2Dlicv1oVo7spdn6cyuMEdUzCD0tjUBjqkATY619n8xoERWtDMOzYbMGbfpIntPQHtRvZD5hJNOfvnPh3gHykPMN2G%2BbsiSg%2BwSj5mF4DNLF2kBSUuNR0nA%2FhDKU2JTdjSANvy5n%2B3KRggZkn3IJU4RSZqmOn1AX4pThCUvoh64r7Jml6ZPh5pUwz%2BnI21xIHTpITtCbUYexJaWcvfg%2BFgNVP3yuvi%2BLnv9VKHTV2s3TEfEdjLlO5bw9rQlaOZ&X-Amz-Signature=70abe4e74717cd930d9fe8f299d86d2c334b68216935125e9a2fa8a2c525e628&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
