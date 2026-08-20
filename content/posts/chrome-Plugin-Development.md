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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46636R6K3ZL%2F20260820%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260820T062527Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIBu3wRAhIxTqZ3MLy%2FMnIxUc9iMdYow5XEP7K1KlgLnBAiApkyUfFB2lvT%2Fw%2B4bx5PQnJXQ46F%2FACjcUACcwTrbECiqIBAiH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMrRytvd1jdzXq%2Bew2KtwDs9Y5meGlt3D8DeX%2FhTfypYyYQudIapaq0x9Onl9zJrxW%2B1rTMuKpauU65IS6MJrstxeRkExjDV8%2FUKMQioU3%2F2Z3wWQuRFYhl9FBmsUvKzoyjO%2FtFdIBUGO4fpQSONiFSP7GaPJMM8t3B7wpDKAxxUdVot%2BOaR%2FoyLHPYZ3k3RV2IXVFk2yF3SSGoOg1d3ISAWKqYH%2BO9plPi25RGqPi7jAqGcAK4aPjqf72H%2B0Ka%2Ff%2FtIn4V5%2BUABJeCPryfIaRhG5%2Bvq7JvUZTxxG%2Blenjh5KMj1pTSy%2BXGLqq5Bi6qzHJfHmWb6x4LsCyqh7dxArmNOV5s9WUQmZ64zygfLEkUFgh8do95AQ9q%2FrKfXNhdooDp11nf4XyLvjqqFTp%2BOio00sr7bV5efY0uTIXn460Ir7Bn3PR8YEQaURosILz7XRQ8QsRLJ61Np3zyeTuVzr%2FPOL%2F6%2BkCTYjVAUMZvAf1AluzFiEMmjjHaFlQ6%2BOYvE99xmXIm286PFYB57pIfOeThSkVrla%2FcMeFmVTnDAoYjG9wiKa4Gm%2BuIa%2BHA1%2B5%2BxutktMlbF3srNSgUF7yZkmXG1I6raHsBuRfagchG7V2ewo1oQNws2i%2BdRhcRWYXJj%2Fjq8ybiGJIZztJFZow%2Baqa1AY6pgHLQAwB8eyBAfCjWohF5jCcBVQYlnfj5yHHPLvDd7wtw%2BQ1IFKO1kq26SZOpIM%2BdqKy1Uo8jGXH%2FLkWAGCAnzfF7B15SjGcvBh4LETju7uZxs9z3r39fSOOfAvIbHaIXM8NDCHgnaZOepp%2B7qUjvlW3rB%2BGTBVsLF8s61J3%2FXCo6bW35b4NPkyDkTespDXhlxYvBLHCvHsFKWU7QeJZj5Ok6uVs71W6&X-Amz-Signature=fbdc36005d7b0f849905de124aae0c5c5243e3ce92b00b158643881e805b44d8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46636R6K3ZL%2F20260820%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260820T062527Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIBu3wRAhIxTqZ3MLy%2FMnIxUc9iMdYow5XEP7K1KlgLnBAiApkyUfFB2lvT%2Fw%2B4bx5PQnJXQ46F%2FACjcUACcwTrbECiqIBAiH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMrRytvd1jdzXq%2Bew2KtwDs9Y5meGlt3D8DeX%2FhTfypYyYQudIapaq0x9Onl9zJrxW%2B1rTMuKpauU65IS6MJrstxeRkExjDV8%2FUKMQioU3%2F2Z3wWQuRFYhl9FBmsUvKzoyjO%2FtFdIBUGO4fpQSONiFSP7GaPJMM8t3B7wpDKAxxUdVot%2BOaR%2FoyLHPYZ3k3RV2IXVFk2yF3SSGoOg1d3ISAWKqYH%2BO9plPi25RGqPi7jAqGcAK4aPjqf72H%2B0Ka%2Ff%2FtIn4V5%2BUABJeCPryfIaRhG5%2Bvq7JvUZTxxG%2Blenjh5KMj1pTSy%2BXGLqq5Bi6qzHJfHmWb6x4LsCyqh7dxArmNOV5s9WUQmZ64zygfLEkUFgh8do95AQ9q%2FrKfXNhdooDp11nf4XyLvjqqFTp%2BOio00sr7bV5efY0uTIXn460Ir7Bn3PR8YEQaURosILz7XRQ8QsRLJ61Np3zyeTuVzr%2FPOL%2F6%2BkCTYjVAUMZvAf1AluzFiEMmjjHaFlQ6%2BOYvE99xmXIm286PFYB57pIfOeThSkVrla%2FcMeFmVTnDAoYjG9wiKa4Gm%2BuIa%2BHA1%2B5%2BxutktMlbF3srNSgUF7yZkmXG1I6raHsBuRfagchG7V2ewo1oQNws2i%2BdRhcRWYXJj%2Fjq8ybiGJIZztJFZow%2Baqa1AY6pgHLQAwB8eyBAfCjWohF5jCcBVQYlnfj5yHHPLvDd7wtw%2BQ1IFKO1kq26SZOpIM%2BdqKy1Uo8jGXH%2FLkWAGCAnzfF7B15SjGcvBh4LETju7uZxs9z3r39fSOOfAvIbHaIXM8NDCHgnaZOepp%2B7qUjvlW3rB%2BGTBVsLF8s61J3%2FXCo6bW35b4NPkyDkTespDXhlxYvBLHCvHsFKWU7QeJZj5Ok6uVs71W6&X-Amz-Signature=9646a9468294002e8ad602aabd9c7cd7972569df58010c29c55493bedcadee3d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46636R6K3ZL%2F20260820%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260820T062527Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIBu3wRAhIxTqZ3MLy%2FMnIxUc9iMdYow5XEP7K1KlgLnBAiApkyUfFB2lvT%2Fw%2B4bx5PQnJXQ46F%2FACjcUACcwTrbECiqIBAiH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMrRytvd1jdzXq%2Bew2KtwDs9Y5meGlt3D8DeX%2FhTfypYyYQudIapaq0x9Onl9zJrxW%2B1rTMuKpauU65IS6MJrstxeRkExjDV8%2FUKMQioU3%2F2Z3wWQuRFYhl9FBmsUvKzoyjO%2FtFdIBUGO4fpQSONiFSP7GaPJMM8t3B7wpDKAxxUdVot%2BOaR%2FoyLHPYZ3k3RV2IXVFk2yF3SSGoOg1d3ISAWKqYH%2BO9plPi25RGqPi7jAqGcAK4aPjqf72H%2B0Ka%2Ff%2FtIn4V5%2BUABJeCPryfIaRhG5%2Bvq7JvUZTxxG%2Blenjh5KMj1pTSy%2BXGLqq5Bi6qzHJfHmWb6x4LsCyqh7dxArmNOV5s9WUQmZ64zygfLEkUFgh8do95AQ9q%2FrKfXNhdooDp11nf4XyLvjqqFTp%2BOio00sr7bV5efY0uTIXn460Ir7Bn3PR8YEQaURosILz7XRQ8QsRLJ61Np3zyeTuVzr%2FPOL%2F6%2BkCTYjVAUMZvAf1AluzFiEMmjjHaFlQ6%2BOYvE99xmXIm286PFYB57pIfOeThSkVrla%2FcMeFmVTnDAoYjG9wiKa4Gm%2BuIa%2BHA1%2B5%2BxutktMlbF3srNSgUF7yZkmXG1I6raHsBuRfagchG7V2ewo1oQNws2i%2BdRhcRWYXJj%2Fjq8ybiGJIZztJFZow%2Baqa1AY6pgHLQAwB8eyBAfCjWohF5jCcBVQYlnfj5yHHPLvDd7wtw%2BQ1IFKO1kq26SZOpIM%2BdqKy1Uo8jGXH%2FLkWAGCAnzfF7B15SjGcvBh4LETju7uZxs9z3r39fSOOfAvIbHaIXM8NDCHgnaZOepp%2B7qUjvlW3rB%2BGTBVsLF8s61J3%2FXCo6bW35b4NPkyDkTespDXhlxYvBLHCvHsFKWU7QeJZj5Ok6uVs71W6&X-Amz-Signature=fca440d55e48569ec4b5d6369d9db407b90d50f51925bbb47c7f581a19790acb&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46636R6K3ZL%2F20260820%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260820T062527Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIBu3wRAhIxTqZ3MLy%2FMnIxUc9iMdYow5XEP7K1KlgLnBAiApkyUfFB2lvT%2Fw%2B4bx5PQnJXQ46F%2FACjcUACcwTrbECiqIBAiH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMrRytvd1jdzXq%2Bew2KtwDs9Y5meGlt3D8DeX%2FhTfypYyYQudIapaq0x9Onl9zJrxW%2B1rTMuKpauU65IS6MJrstxeRkExjDV8%2FUKMQioU3%2F2Z3wWQuRFYhl9FBmsUvKzoyjO%2FtFdIBUGO4fpQSONiFSP7GaPJMM8t3B7wpDKAxxUdVot%2BOaR%2FoyLHPYZ3k3RV2IXVFk2yF3SSGoOg1d3ISAWKqYH%2BO9plPi25RGqPi7jAqGcAK4aPjqf72H%2B0Ka%2Ff%2FtIn4V5%2BUABJeCPryfIaRhG5%2Bvq7JvUZTxxG%2Blenjh5KMj1pTSy%2BXGLqq5Bi6qzHJfHmWb6x4LsCyqh7dxArmNOV5s9WUQmZ64zygfLEkUFgh8do95AQ9q%2FrKfXNhdooDp11nf4XyLvjqqFTp%2BOio00sr7bV5efY0uTIXn460Ir7Bn3PR8YEQaURosILz7XRQ8QsRLJ61Np3zyeTuVzr%2FPOL%2F6%2BkCTYjVAUMZvAf1AluzFiEMmjjHaFlQ6%2BOYvE99xmXIm286PFYB57pIfOeThSkVrla%2FcMeFmVTnDAoYjG9wiKa4Gm%2BuIa%2BHA1%2B5%2BxutktMlbF3srNSgUF7yZkmXG1I6raHsBuRfagchG7V2ewo1oQNws2i%2BdRhcRWYXJj%2Fjq8ybiGJIZztJFZow%2Baqa1AY6pgHLQAwB8eyBAfCjWohF5jCcBVQYlnfj5yHHPLvDd7wtw%2BQ1IFKO1kq26SZOpIM%2BdqKy1Uo8jGXH%2FLkWAGCAnzfF7B15SjGcvBh4LETju7uZxs9z3r39fSOOfAvIbHaIXM8NDCHgnaZOepp%2B7qUjvlW3rB%2BGTBVsLF8s61J3%2FXCo6bW35b4NPkyDkTespDXhlxYvBLHCvHsFKWU7QeJZj5Ok6uVs71W6&X-Amz-Signature=ef1fbdfa106ef70d45bc7056772fa2e05b1cd2ea7e929c4efdde917a2c94cfe6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
