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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UFTQDYWM%2F20261016%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261016T201251Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECMaCXVzLXdlc3QtMiJIMEYCIQDYR5So1bM6AW3MmUEd0DCLVAMojBFx0KEs42nkmF6sawIhAIy0%2Fq5isdBGlxzPOOYHtBEtwacq3RiVPUS%2FuRfgGa1MKogECOz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwxMyb%2B3GwM0WyGjEwq3AMy3g6qxyDD%2Fo%2FjDpCW%2FYjNnHnVx44ug3%2Bmz%2FMbhj2vxCIC3Uvmq88p4ZH3OcV9cyEYyrirWIjCmhFsg%2By5DYbf5umyLDEfuE2UIC8yr86XATqQ5N5ZaoAJmmyBvCYwcbDk7SU42xPglVpoXQnu7l5b%2BBxKyPBtu%2FeQ6vKh3KRHBEiTSQdopFfzigvJ58m%2BSd7svH%2F7R3z97agli4Ig30moMNIg3Z6uCAl%2FDZ%2F04WzekxOABbe%2FFDXtr6vGhSt6lGiLwArbRsj8t4EVphPojJY0IAbLc%2BYB4AXxQZoc7gu11wbtRZMblCIE5f3H6Jyp2MY2Y%2BhZXZX%2BAWYTrngKjb42KCbpowC0pt%2B8gKs1x7vxS%2FucmfxwpkcB2Rslqp4d45dwNaUfZqCY2P9yqr9bFfbdtvlUrK5K7BtJsLREH9jaBzmhwiUNPqwkvMSvqbE2l%2FOtzwugJOIKgrk5WVTCfqYzjSCB1ziTOqLF4p%2Bi38DynYyrQIu6OVCy5vt1t5zuf9UYWcw%2BhA1j%2BOvfZRM%2F6wMq1N4fiiWyZOGftFM6LT0lKJkXQ64jR602w26RoEWCJUoEfsNkpfdscWalfy1J9Ce%2FuldYrEaLyw8MdiBxCAw2SJ8W%2Bto0rcux8NLJQDDi7snWBjqkAeO7TM15NVAigmraDFacTrU3P3CVFKb8dXgF17d3nojsozjE%2FnejqDgBgNPTuc8AezqKt8zolUXGeQLdinJ3byg36qn2CtLVaC77rkPvgfVDqpDVt%2BrPh5tBD9GOTnfSbFvpvTiwMyk41uGeK52r83Y637isbOdfnBtB2AJHV0YBnO%2B5XNiXteG5QVB5SmdcKH0Bcc%2FECxIwdbQyRxHckW7xz0KZ&X-Amz-Signature=87625e86aca0c2e50f2efb5eab012193eac6c0e5b8206cca258053f65bc9883b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UFTQDYWM%2F20261016%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261016T201251Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECMaCXVzLXdlc3QtMiJIMEYCIQDYR5So1bM6AW3MmUEd0DCLVAMojBFx0KEs42nkmF6sawIhAIy0%2Fq5isdBGlxzPOOYHtBEtwacq3RiVPUS%2FuRfgGa1MKogECOz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwxMyb%2B3GwM0WyGjEwq3AMy3g6qxyDD%2Fo%2FjDpCW%2FYjNnHnVx44ug3%2Bmz%2FMbhj2vxCIC3Uvmq88p4ZH3OcV9cyEYyrirWIjCmhFsg%2By5DYbf5umyLDEfuE2UIC8yr86XATqQ5N5ZaoAJmmyBvCYwcbDk7SU42xPglVpoXQnu7l5b%2BBxKyPBtu%2FeQ6vKh3KRHBEiTSQdopFfzigvJ58m%2BSd7svH%2F7R3z97agli4Ig30moMNIg3Z6uCAl%2FDZ%2F04WzekxOABbe%2FFDXtr6vGhSt6lGiLwArbRsj8t4EVphPojJY0IAbLc%2BYB4AXxQZoc7gu11wbtRZMblCIE5f3H6Jyp2MY2Y%2BhZXZX%2BAWYTrngKjb42KCbpowC0pt%2B8gKs1x7vxS%2FucmfxwpkcB2Rslqp4d45dwNaUfZqCY2P9yqr9bFfbdtvlUrK5K7BtJsLREH9jaBzmhwiUNPqwkvMSvqbE2l%2FOtzwugJOIKgrk5WVTCfqYzjSCB1ziTOqLF4p%2Bi38DynYyrQIu6OVCy5vt1t5zuf9UYWcw%2BhA1j%2BOvfZRM%2F6wMq1N4fiiWyZOGftFM6LT0lKJkXQ64jR602w26RoEWCJUoEfsNkpfdscWalfy1J9Ce%2FuldYrEaLyw8MdiBxCAw2SJ8W%2Bto0rcux8NLJQDDi7snWBjqkAeO7TM15NVAigmraDFacTrU3P3CVFKb8dXgF17d3nojsozjE%2FnejqDgBgNPTuc8AezqKt8zolUXGeQLdinJ3byg36qn2CtLVaC77rkPvgfVDqpDVt%2BrPh5tBD9GOTnfSbFvpvTiwMyk41uGeK52r83Y637isbOdfnBtB2AJHV0YBnO%2B5XNiXteG5QVB5SmdcKH0Bcc%2FECxIwdbQyRxHckW7xz0KZ&X-Amz-Signature=79d6aaf980af096782493aac9595e7b63a9b798056185dbd8d103cfd3ae4efe0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UFTQDYWM%2F20261016%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261016T201251Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECMaCXVzLXdlc3QtMiJIMEYCIQDYR5So1bM6AW3MmUEd0DCLVAMojBFx0KEs42nkmF6sawIhAIy0%2Fq5isdBGlxzPOOYHtBEtwacq3RiVPUS%2FuRfgGa1MKogECOz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwxMyb%2B3GwM0WyGjEwq3AMy3g6qxyDD%2Fo%2FjDpCW%2FYjNnHnVx44ug3%2Bmz%2FMbhj2vxCIC3Uvmq88p4ZH3OcV9cyEYyrirWIjCmhFsg%2By5DYbf5umyLDEfuE2UIC8yr86XATqQ5N5ZaoAJmmyBvCYwcbDk7SU42xPglVpoXQnu7l5b%2BBxKyPBtu%2FeQ6vKh3KRHBEiTSQdopFfzigvJ58m%2BSd7svH%2F7R3z97agli4Ig30moMNIg3Z6uCAl%2FDZ%2F04WzekxOABbe%2FFDXtr6vGhSt6lGiLwArbRsj8t4EVphPojJY0IAbLc%2BYB4AXxQZoc7gu11wbtRZMblCIE5f3H6Jyp2MY2Y%2BhZXZX%2BAWYTrngKjb42KCbpowC0pt%2B8gKs1x7vxS%2FucmfxwpkcB2Rslqp4d45dwNaUfZqCY2P9yqr9bFfbdtvlUrK5K7BtJsLREH9jaBzmhwiUNPqwkvMSvqbE2l%2FOtzwugJOIKgrk5WVTCfqYzjSCB1ziTOqLF4p%2Bi38DynYyrQIu6OVCy5vt1t5zuf9UYWcw%2BhA1j%2BOvfZRM%2F6wMq1N4fiiWyZOGftFM6LT0lKJkXQ64jR602w26RoEWCJUoEfsNkpfdscWalfy1J9Ce%2FuldYrEaLyw8MdiBxCAw2SJ8W%2Bto0rcux8NLJQDDi7snWBjqkAeO7TM15NVAigmraDFacTrU3P3CVFKb8dXgF17d3nojsozjE%2FnejqDgBgNPTuc8AezqKt8zolUXGeQLdinJ3byg36qn2CtLVaC77rkPvgfVDqpDVt%2BrPh5tBD9GOTnfSbFvpvTiwMyk41uGeK52r83Y637isbOdfnBtB2AJHV0YBnO%2B5XNiXteG5QVB5SmdcKH0Bcc%2FECxIwdbQyRxHckW7xz0KZ&X-Amz-Signature=6b42bba4ad5a5e23dcf997973bc58a00e50ab41387751ff8d1aa3ad88ed1cb86&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UFTQDYWM%2F20261016%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261016T201251Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECMaCXVzLXdlc3QtMiJIMEYCIQDYR5So1bM6AW3MmUEd0DCLVAMojBFx0KEs42nkmF6sawIhAIy0%2Fq5isdBGlxzPOOYHtBEtwacq3RiVPUS%2FuRfgGa1MKogECOz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwxMyb%2B3GwM0WyGjEwq3AMy3g6qxyDD%2Fo%2FjDpCW%2FYjNnHnVx44ug3%2Bmz%2FMbhj2vxCIC3Uvmq88p4ZH3OcV9cyEYyrirWIjCmhFsg%2By5DYbf5umyLDEfuE2UIC8yr86XATqQ5N5ZaoAJmmyBvCYwcbDk7SU42xPglVpoXQnu7l5b%2BBxKyPBtu%2FeQ6vKh3KRHBEiTSQdopFfzigvJ58m%2BSd7svH%2F7R3z97agli4Ig30moMNIg3Z6uCAl%2FDZ%2F04WzekxOABbe%2FFDXtr6vGhSt6lGiLwArbRsj8t4EVphPojJY0IAbLc%2BYB4AXxQZoc7gu11wbtRZMblCIE5f3H6Jyp2MY2Y%2BhZXZX%2BAWYTrngKjb42KCbpowC0pt%2B8gKs1x7vxS%2FucmfxwpkcB2Rslqp4d45dwNaUfZqCY2P9yqr9bFfbdtvlUrK5K7BtJsLREH9jaBzmhwiUNPqwkvMSvqbE2l%2FOtzwugJOIKgrk5WVTCfqYzjSCB1ziTOqLF4p%2Bi38DynYyrQIu6OVCy5vt1t5zuf9UYWcw%2BhA1j%2BOvfZRM%2F6wMq1N4fiiWyZOGftFM6LT0lKJkXQ64jR602w26RoEWCJUoEfsNkpfdscWalfy1J9Ce%2FuldYrEaLyw8MdiBxCAw2SJ8W%2Bto0rcux8NLJQDDi7snWBjqkAeO7TM15NVAigmraDFacTrU3P3CVFKb8dXgF17d3nojsozjE%2FnejqDgBgNPTuc8AezqKt8zolUXGeQLdinJ3byg36qn2CtLVaC77rkPvgfVDqpDVt%2BrPh5tBD9GOTnfSbFvpvTiwMyk41uGeK52r83Y637isbOdfnBtB2AJHV0YBnO%2B5XNiXteG5QVB5SmdcKH0Bcc%2FECxIwdbQyRxHckW7xz0KZ&X-Amz-Signature=29b85d4c6c7e7d73d7ef3c142aa092ec53535b01dc35093702ab48cbae6d5014&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
