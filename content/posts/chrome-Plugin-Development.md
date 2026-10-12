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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664WWJTSH7%2F20261012%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261012T235534Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDUakiJn6w6LmXgGMMe7nbXyNfrm8824xN%2Fu%2BpSAV0krAIgJoA0MSrxXskwS4ID89eGxgl9cgcxJz48nP8QaKPwTnEqiAQIjv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDHIavz565si9V7vIvircA165S26IUMdRGKyL4tag39Rep8z7vSiTZaergPBfyOwtHFlInhelAcpDywd8h1MXNMbbmwcn6s6kI8z7cYPikUrWvbc50%2F2XVmMNqJpe4eEa%2Bg2eF2gtOzq50PTtqqFIHCUdWrhYHWSWylTOw9yaZYAQcj0bUsm7Ls7H2agdCHJIZa4U2F%2FtXeidkjeAKh%2F1mKXB6LY9xsviUKlN0UkgXGEu0%2FGtRxeqwVaD1p44VEdmEO0Bm%2BHsOvVq3y0DCiqPEO%2FfdG06cK2fGS7nh6cvBvJxQcIR7xvjClizTP9hfhhjGCX2QhCfFy7%2FfcJ21eApQo0WdvkOCT66dO1xW4yh8BEKIBwZLnNrwiP1NcOoTkq2Q0xS1EGQvdFMLU6fkZZ92hdz3eCUW%2Bm4wHMurI05iT53vN4R59Zf92bX1PUaurLNSnUs6drVzNlw%2BNPtzkXk537nOkrkGCYXQ2QS5W4BKrnYrmKnWXHjKToLa%2FOuI4hgPNV3BnIB2BIPbsqiZV1siJNgbhlZ4ffHxI6lxKoYbQmv%2BVetDT%2B2USA0H9I%2F2hRmxoYTw5kbji6JUTQN5RCadtDJqjgUZiXbRqgLwTgekey5khqTKbp5CBQRzwqv%2Fkoja4RdHu0wRS%2F4GAlJMOOOtdYGOqUBi55lBBpMz6CKo1kwe4fbRcWbMDyAhmlfJkRJ1Hwv1t8knIf7R1ratxWfqoiqFgHPt8mW8Yr%2BsRz%2BRRWynrM%2BcUttwlyZsbbNF4Jp3jwEpUMEdThs3F55o1fszijfeRI1Q4Esh3N8VsJsbD032AZJ38LHZHLu%2BzjaPvPA2c8tvPe%2BzwyK6xrKufswFSVsIpV%2BbzJgTeMBcF6OS8nBoFn2z11EcKsB&X-Amz-Signature=d0c0f23d21af9d9ceea0cc5eafb0b2fe732984896c078393d631ada2c72dc983&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664WWJTSH7%2F20261012%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261012T235534Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDUakiJn6w6LmXgGMMe7nbXyNfrm8824xN%2Fu%2BpSAV0krAIgJoA0MSrxXskwS4ID89eGxgl9cgcxJz48nP8QaKPwTnEqiAQIjv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDHIavz565si9V7vIvircA165S26IUMdRGKyL4tag39Rep8z7vSiTZaergPBfyOwtHFlInhelAcpDywd8h1MXNMbbmwcn6s6kI8z7cYPikUrWvbc50%2F2XVmMNqJpe4eEa%2Bg2eF2gtOzq50PTtqqFIHCUdWrhYHWSWylTOw9yaZYAQcj0bUsm7Ls7H2agdCHJIZa4U2F%2FtXeidkjeAKh%2F1mKXB6LY9xsviUKlN0UkgXGEu0%2FGtRxeqwVaD1p44VEdmEO0Bm%2BHsOvVq3y0DCiqPEO%2FfdG06cK2fGS7nh6cvBvJxQcIR7xvjClizTP9hfhhjGCX2QhCfFy7%2FfcJ21eApQo0WdvkOCT66dO1xW4yh8BEKIBwZLnNrwiP1NcOoTkq2Q0xS1EGQvdFMLU6fkZZ92hdz3eCUW%2Bm4wHMurI05iT53vN4R59Zf92bX1PUaurLNSnUs6drVzNlw%2BNPtzkXk537nOkrkGCYXQ2QS5W4BKrnYrmKnWXHjKToLa%2FOuI4hgPNV3BnIB2BIPbsqiZV1siJNgbhlZ4ffHxI6lxKoYbQmv%2BVetDT%2B2USA0H9I%2F2hRmxoYTw5kbji6JUTQN5RCadtDJqjgUZiXbRqgLwTgekey5khqTKbp5CBQRzwqv%2Fkoja4RdHu0wRS%2F4GAlJMOOOtdYGOqUBi55lBBpMz6CKo1kwe4fbRcWbMDyAhmlfJkRJ1Hwv1t8knIf7R1ratxWfqoiqFgHPt8mW8Yr%2BsRz%2BRRWynrM%2BcUttwlyZsbbNF4Jp3jwEpUMEdThs3F55o1fszijfeRI1Q4Esh3N8VsJsbD032AZJ38LHZHLu%2BzjaPvPA2c8tvPe%2BzwyK6xrKufswFSVsIpV%2BbzJgTeMBcF6OS8nBoFn2z11EcKsB&X-Amz-Signature=69122e5206fa7f60e382bf1efd96d80bec5a925656654041efbeb5cadf26c545&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664WWJTSH7%2F20261012%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261012T235534Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDUakiJn6w6LmXgGMMe7nbXyNfrm8824xN%2Fu%2BpSAV0krAIgJoA0MSrxXskwS4ID89eGxgl9cgcxJz48nP8QaKPwTnEqiAQIjv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDHIavz565si9V7vIvircA165S26IUMdRGKyL4tag39Rep8z7vSiTZaergPBfyOwtHFlInhelAcpDywd8h1MXNMbbmwcn6s6kI8z7cYPikUrWvbc50%2F2XVmMNqJpe4eEa%2Bg2eF2gtOzq50PTtqqFIHCUdWrhYHWSWylTOw9yaZYAQcj0bUsm7Ls7H2agdCHJIZa4U2F%2FtXeidkjeAKh%2F1mKXB6LY9xsviUKlN0UkgXGEu0%2FGtRxeqwVaD1p44VEdmEO0Bm%2BHsOvVq3y0DCiqPEO%2FfdG06cK2fGS7nh6cvBvJxQcIR7xvjClizTP9hfhhjGCX2QhCfFy7%2FfcJ21eApQo0WdvkOCT66dO1xW4yh8BEKIBwZLnNrwiP1NcOoTkq2Q0xS1EGQvdFMLU6fkZZ92hdz3eCUW%2Bm4wHMurI05iT53vN4R59Zf92bX1PUaurLNSnUs6drVzNlw%2BNPtzkXk537nOkrkGCYXQ2QS5W4BKrnYrmKnWXHjKToLa%2FOuI4hgPNV3BnIB2BIPbsqiZV1siJNgbhlZ4ffHxI6lxKoYbQmv%2BVetDT%2B2USA0H9I%2F2hRmxoYTw5kbji6JUTQN5RCadtDJqjgUZiXbRqgLwTgekey5khqTKbp5CBQRzwqv%2Fkoja4RdHu0wRS%2F4GAlJMOOOtdYGOqUBi55lBBpMz6CKo1kwe4fbRcWbMDyAhmlfJkRJ1Hwv1t8knIf7R1ratxWfqoiqFgHPt8mW8Yr%2BsRz%2BRRWynrM%2BcUttwlyZsbbNF4Jp3jwEpUMEdThs3F55o1fszijfeRI1Q4Esh3N8VsJsbD032AZJ38LHZHLu%2BzjaPvPA2c8tvPe%2BzwyK6xrKufswFSVsIpV%2BbzJgTeMBcF6OS8nBoFn2z11EcKsB&X-Amz-Signature=00080af3adc86bbfb465355284de0c7edb4a19decb8bab58b7ddcadd1b5f2c1d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664WWJTSH7%2F20261012%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261012T235534Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDUakiJn6w6LmXgGMMe7nbXyNfrm8824xN%2Fu%2BpSAV0krAIgJoA0MSrxXskwS4ID89eGxgl9cgcxJz48nP8QaKPwTnEqiAQIjv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDHIavz565si9V7vIvircA165S26IUMdRGKyL4tag39Rep8z7vSiTZaergPBfyOwtHFlInhelAcpDywd8h1MXNMbbmwcn6s6kI8z7cYPikUrWvbc50%2F2XVmMNqJpe4eEa%2Bg2eF2gtOzq50PTtqqFIHCUdWrhYHWSWylTOw9yaZYAQcj0bUsm7Ls7H2agdCHJIZa4U2F%2FtXeidkjeAKh%2F1mKXB6LY9xsviUKlN0UkgXGEu0%2FGtRxeqwVaD1p44VEdmEO0Bm%2BHsOvVq3y0DCiqPEO%2FfdG06cK2fGS7nh6cvBvJxQcIR7xvjClizTP9hfhhjGCX2QhCfFy7%2FfcJ21eApQo0WdvkOCT66dO1xW4yh8BEKIBwZLnNrwiP1NcOoTkq2Q0xS1EGQvdFMLU6fkZZ92hdz3eCUW%2Bm4wHMurI05iT53vN4R59Zf92bX1PUaurLNSnUs6drVzNlw%2BNPtzkXk537nOkrkGCYXQ2QS5W4BKrnYrmKnWXHjKToLa%2FOuI4hgPNV3BnIB2BIPbsqiZV1siJNgbhlZ4ffHxI6lxKoYbQmv%2BVetDT%2B2USA0H9I%2F2hRmxoYTw5kbji6JUTQN5RCadtDJqjgUZiXbRqgLwTgekey5khqTKbp5CBQRzwqv%2Fkoja4RdHu0wRS%2F4GAlJMOOOtdYGOqUBi55lBBpMz6CKo1kwe4fbRcWbMDyAhmlfJkRJ1Hwv1t8knIf7R1ratxWfqoiqFgHPt8mW8Yr%2BsRz%2BRRWynrM%2BcUttwlyZsbbNF4Jp3jwEpUMEdThs3F55o1fszijfeRI1Q4Esh3N8VsJsbD032AZJ38LHZHLu%2BzjaPvPA2c8tvPe%2BzwyK6xrKufswFSVsIpV%2BbzJgTeMBcF6OS8nBoFn2z11EcKsB&X-Amz-Signature=e9601d14e476e04a46976f207220426612077742cac0db13f924b1d19857a2e5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
