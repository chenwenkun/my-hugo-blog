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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663S6J3FIK%2F20260911%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260911T101030Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCFLhUr6KGZOtorL0XxyJ8vOVijBZKZp8kBNTe66PWcsQIgG7nD8ed9c1K9rBhvFDmNNr260CMacugXKXbahvhyG3oqiAQIlv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDBMC2%2Bym83UCzqm5vircA5smw2swUkacAv0rC67WeQA7oNErN8PW4XVUA0GrqqDJG2OiRO5rUVHHI2WzsXXaBT2DoPKZJ11UaxL7IYysWttlWlb8o4xoo%2BesJt2lt1BYups8f8pLHP9XcRRCYFot8bs2Pj2Sw5wfgSD5z0qeCR6sTUTHCtUqtdY%2BwGP%2FVCM%2Fx92e8pXoNqTl2RnnNeNtLU0J60mNnhq2rcdn215nFeS9sX6qn7pXRB%2FHJhxSqzRBg8D5OAtcBbB5mzU6wyzDLFuaQOzTV8pbkFvCx2zK%2F6RrznCNxik72b392VLNsXd482Lj7FL0Ka9v98jCZi3YzQKLWx%2FUHbmvbIDtRsNeoQFNOL1G%2FFmIuTyfTWEATBlhM14c4APfJ0%2F290A9Tm%2Be6n1NjNsPFyS1JGyyvx1%2F0oy4g0LEk1W3sJtkj%2BXUv9hwPdGVYGEDi9FJ3SLr1%2FiRlHXPZSaz9jDkzddV%2FpmUblsrpWPeeSQbzwLNxKnTBGWG4galuFKN0ben8BgG8Cw6svsoh05e0xO1NTr3li1s2AM0OP60oaN2WfOJa%2B3uw3HjB9%2BUBsldiK%2F%2B3Cb2lLwQpuJEFWfsSHiwY%2FeNdvPxaOzcDtOh14fajEFLtMykBoWRORW31Hq%2FPymsoMS4MKKYjtUGOqUBNm0TQ%2F5NMr6TM9FLLeRYorrcIqZjpXUlubXYsZpPJ6HsbA2aDeKBG8%2FfeppkgEsKAkXSrr%2BFkt%2BGItgxtIblJ53TiYWzMDyA0pRQR45Tdb3%2BeeT8E9gGuCgHX2GG1uVJLS0iUCUPMsUq%2BGKDlslmpkKnx5Q4ZYQSAkAlWyF5YWiTvdwoi61NyKD6NvUySoFhK%2B6oZm3xjuim8MJ7rBkfNuLWzgyJ&X-Amz-Signature=c3f44edb0c6c906b4a49ca36b1b0541ef449e8ca5bb7ac2ecefe15f830fbaa83&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663S6J3FIK%2F20260911%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260911T101030Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCFLhUr6KGZOtorL0XxyJ8vOVijBZKZp8kBNTe66PWcsQIgG7nD8ed9c1K9rBhvFDmNNr260CMacugXKXbahvhyG3oqiAQIlv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDBMC2%2Bym83UCzqm5vircA5smw2swUkacAv0rC67WeQA7oNErN8PW4XVUA0GrqqDJG2OiRO5rUVHHI2WzsXXaBT2DoPKZJ11UaxL7IYysWttlWlb8o4xoo%2BesJt2lt1BYups8f8pLHP9XcRRCYFot8bs2Pj2Sw5wfgSD5z0qeCR6sTUTHCtUqtdY%2BwGP%2FVCM%2Fx92e8pXoNqTl2RnnNeNtLU0J60mNnhq2rcdn215nFeS9sX6qn7pXRB%2FHJhxSqzRBg8D5OAtcBbB5mzU6wyzDLFuaQOzTV8pbkFvCx2zK%2F6RrznCNxik72b392VLNsXd482Lj7FL0Ka9v98jCZi3YzQKLWx%2FUHbmvbIDtRsNeoQFNOL1G%2FFmIuTyfTWEATBlhM14c4APfJ0%2F290A9Tm%2Be6n1NjNsPFyS1JGyyvx1%2F0oy4g0LEk1W3sJtkj%2BXUv9hwPdGVYGEDi9FJ3SLr1%2FiRlHXPZSaz9jDkzddV%2FpmUblsrpWPeeSQbzwLNxKnTBGWG4galuFKN0ben8BgG8Cw6svsoh05e0xO1NTr3li1s2AM0OP60oaN2WfOJa%2B3uw3HjB9%2BUBsldiK%2F%2B3Cb2lLwQpuJEFWfsSHiwY%2FeNdvPxaOzcDtOh14fajEFLtMykBoWRORW31Hq%2FPymsoMS4MKKYjtUGOqUBNm0TQ%2F5NMr6TM9FLLeRYorrcIqZjpXUlubXYsZpPJ6HsbA2aDeKBG8%2FfeppkgEsKAkXSrr%2BFkt%2BGItgxtIblJ53TiYWzMDyA0pRQR45Tdb3%2BeeT8E9gGuCgHX2GG1uVJLS0iUCUPMsUq%2BGKDlslmpkKnx5Q4ZYQSAkAlWyF5YWiTvdwoi61NyKD6NvUySoFhK%2B6oZm3xjuim8MJ7rBkfNuLWzgyJ&X-Amz-Signature=27f9fb21d94157fef207375cf5d767eac38ce5609454df415dde472c4c862891&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663S6J3FIK%2F20260911%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260911T101030Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCFLhUr6KGZOtorL0XxyJ8vOVijBZKZp8kBNTe66PWcsQIgG7nD8ed9c1K9rBhvFDmNNr260CMacugXKXbahvhyG3oqiAQIlv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDBMC2%2Bym83UCzqm5vircA5smw2swUkacAv0rC67WeQA7oNErN8PW4XVUA0GrqqDJG2OiRO5rUVHHI2WzsXXaBT2DoPKZJ11UaxL7IYysWttlWlb8o4xoo%2BesJt2lt1BYups8f8pLHP9XcRRCYFot8bs2Pj2Sw5wfgSD5z0qeCR6sTUTHCtUqtdY%2BwGP%2FVCM%2Fx92e8pXoNqTl2RnnNeNtLU0J60mNnhq2rcdn215nFeS9sX6qn7pXRB%2FHJhxSqzRBg8D5OAtcBbB5mzU6wyzDLFuaQOzTV8pbkFvCx2zK%2F6RrznCNxik72b392VLNsXd482Lj7FL0Ka9v98jCZi3YzQKLWx%2FUHbmvbIDtRsNeoQFNOL1G%2FFmIuTyfTWEATBlhM14c4APfJ0%2F290A9Tm%2Be6n1NjNsPFyS1JGyyvx1%2F0oy4g0LEk1W3sJtkj%2BXUv9hwPdGVYGEDi9FJ3SLr1%2FiRlHXPZSaz9jDkzddV%2FpmUblsrpWPeeSQbzwLNxKnTBGWG4galuFKN0ben8BgG8Cw6svsoh05e0xO1NTr3li1s2AM0OP60oaN2WfOJa%2B3uw3HjB9%2BUBsldiK%2F%2B3Cb2lLwQpuJEFWfsSHiwY%2FeNdvPxaOzcDtOh14fajEFLtMykBoWRORW31Hq%2FPymsoMS4MKKYjtUGOqUBNm0TQ%2F5NMr6TM9FLLeRYorrcIqZjpXUlubXYsZpPJ6HsbA2aDeKBG8%2FfeppkgEsKAkXSrr%2BFkt%2BGItgxtIblJ53TiYWzMDyA0pRQR45Tdb3%2BeeT8E9gGuCgHX2GG1uVJLS0iUCUPMsUq%2BGKDlslmpkKnx5Q4ZYQSAkAlWyF5YWiTvdwoi61NyKD6NvUySoFhK%2B6oZm3xjuim8MJ7rBkfNuLWzgyJ&X-Amz-Signature=7dc24b5567024761df40a0620f383699313724dbe39b83e0159acb56d3675bbe&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663S6J3FIK%2F20260911%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260911T101030Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCFLhUr6KGZOtorL0XxyJ8vOVijBZKZp8kBNTe66PWcsQIgG7nD8ed9c1K9rBhvFDmNNr260CMacugXKXbahvhyG3oqiAQIlv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDBMC2%2Bym83UCzqm5vircA5smw2swUkacAv0rC67WeQA7oNErN8PW4XVUA0GrqqDJG2OiRO5rUVHHI2WzsXXaBT2DoPKZJ11UaxL7IYysWttlWlb8o4xoo%2BesJt2lt1BYups8f8pLHP9XcRRCYFot8bs2Pj2Sw5wfgSD5z0qeCR6sTUTHCtUqtdY%2BwGP%2FVCM%2Fx92e8pXoNqTl2RnnNeNtLU0J60mNnhq2rcdn215nFeS9sX6qn7pXRB%2FHJhxSqzRBg8D5OAtcBbB5mzU6wyzDLFuaQOzTV8pbkFvCx2zK%2F6RrznCNxik72b392VLNsXd482Lj7FL0Ka9v98jCZi3YzQKLWx%2FUHbmvbIDtRsNeoQFNOL1G%2FFmIuTyfTWEATBlhM14c4APfJ0%2F290A9Tm%2Be6n1NjNsPFyS1JGyyvx1%2F0oy4g0LEk1W3sJtkj%2BXUv9hwPdGVYGEDi9FJ3SLr1%2FiRlHXPZSaz9jDkzddV%2FpmUblsrpWPeeSQbzwLNxKnTBGWG4galuFKN0ben8BgG8Cw6svsoh05e0xO1NTr3li1s2AM0OP60oaN2WfOJa%2B3uw3HjB9%2BUBsldiK%2F%2B3Cb2lLwQpuJEFWfsSHiwY%2FeNdvPxaOzcDtOh14fajEFLtMykBoWRORW31Hq%2FPymsoMS4MKKYjtUGOqUBNm0TQ%2F5NMr6TM9FLLeRYorrcIqZjpXUlubXYsZpPJ6HsbA2aDeKBG8%2FfeppkgEsKAkXSrr%2BFkt%2BGItgxtIblJ53TiYWzMDyA0pRQR45Tdb3%2BeeT8E9gGuCgHX2GG1uVJLS0iUCUPMsUq%2BGKDlslmpkKnx5Q4ZYQSAkAlWyF5YWiTvdwoi61NyKD6NvUySoFhK%2B6oZm3xjuim8MJ7rBkfNuLWzgyJ&X-Amz-Signature=0f07103bc5ee58a3d323a587b6f02909e6905f8d140ccb52fbe5f3055a3832e2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
