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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666PGVJY4F%2F20260823%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260823T181329Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBIaCXVzLXdlc3QtMiJGMEQCIChuYQmSlL0tK0QYsahlU1%2FcLYXKslLBHTtRmwVdUG1dAiBCwKFN6ovanGY%2FxZaBleA1yy4jBSfkogP%2FHYY4wrmGUyqIBAjb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMdvS5T%2F8X8iXO%2BJhJKtwDpeBI6bdNdSnAoMDMckTdlD8XQFvrb8iD%2Fk1W713ZPY3ZyDLJgep%2FyTfShUP0o12t0kgg04TqXoZgObVqmxDRhZOAmasNfsWONe8VtSAYwBMjjBIAsNhoUBSVTSXXzCaaykn45xyUZsrbDdAy2CVZICZTU%2Fx1ptNzqTQ1m78Ibq6HesmXdjANi6N7D668GnJCm5K2ZJfvW6%2FPP%2FZwaExCc%2FGsXTx224pqki9mZ4OYuZ%2FrQbcz2ERG3fTF%2FP%2FuVH58eoVTfcbn5kDdUJVgnMx3sJvdzxpyBetGgcC3%2Fn4aHiJLyjhZH5TPYXAvPNJD6WV3ba1VQqHTPIaoE2anoXwXgFELVy6xB0uo59KlybkbIiUSUa8bq5S%2BIO4nBCit2ogr52dTENS4zFyW2nldZaEHvf2rR3IkJ8QyJd6BBfv6l%2BiZewhD184csYf2qJvVVk3FsVQN1n08aSmmr73aWtTqdMXLWOdOBOZ%2BAoCIUjMNvCbQWIRbm%2FyO%2BNrvpDYlPKDAOcOECOfdllGqaPdFttGpzBeH8Lg5GIKQEKxpVk%2BCZ8%2F7a1FEp1qFzQrJDh1wOomTRCta9OLE5hREYlTravl%2FKXvB%2FJ4GcddP5YT%2F9k9AH8473CGbZflUpBwdGsww%2Bues1AY6pgEjwxND%2BJzMwh3LYwfCD33vlR5NnoAYKL9%2FAQ1e4Fk5kgc%2FDQFtlKwIgHVa%2FLX6OBB7Gpx%2Bps2TjM0s4Y%2BJLOMt169Y0ao7HuqYZRkxziP1RCuZWtnHIm79TWXC1S35xDBaCL5yl2cp4F9ve0gYjxvQLiEgCy85GeP6yQ0JwhPf4DgHiVkPZ4KEUBANmKOBVWruUeFafD%2FFhDeV%2BYmHqJXZqLb3fcrG&X-Amz-Signature=f9a8df420853c007b99cbf051b26c657fb0fc5ee710e21c26773257198a1bbb3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666PGVJY4F%2F20260823%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260823T181329Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBIaCXVzLXdlc3QtMiJGMEQCIChuYQmSlL0tK0QYsahlU1%2FcLYXKslLBHTtRmwVdUG1dAiBCwKFN6ovanGY%2FxZaBleA1yy4jBSfkogP%2FHYY4wrmGUyqIBAjb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMdvS5T%2F8X8iXO%2BJhJKtwDpeBI6bdNdSnAoMDMckTdlD8XQFvrb8iD%2Fk1W713ZPY3ZyDLJgep%2FyTfShUP0o12t0kgg04TqXoZgObVqmxDRhZOAmasNfsWONe8VtSAYwBMjjBIAsNhoUBSVTSXXzCaaykn45xyUZsrbDdAy2CVZICZTU%2Fx1ptNzqTQ1m78Ibq6HesmXdjANi6N7D668GnJCm5K2ZJfvW6%2FPP%2FZwaExCc%2FGsXTx224pqki9mZ4OYuZ%2FrQbcz2ERG3fTF%2FP%2FuVH58eoVTfcbn5kDdUJVgnMx3sJvdzxpyBetGgcC3%2Fn4aHiJLyjhZH5TPYXAvPNJD6WV3ba1VQqHTPIaoE2anoXwXgFELVy6xB0uo59KlybkbIiUSUa8bq5S%2BIO4nBCit2ogr52dTENS4zFyW2nldZaEHvf2rR3IkJ8QyJd6BBfv6l%2BiZewhD184csYf2qJvVVk3FsVQN1n08aSmmr73aWtTqdMXLWOdOBOZ%2BAoCIUjMNvCbQWIRbm%2FyO%2BNrvpDYlPKDAOcOECOfdllGqaPdFttGpzBeH8Lg5GIKQEKxpVk%2BCZ8%2F7a1FEp1qFzQrJDh1wOomTRCta9OLE5hREYlTravl%2FKXvB%2FJ4GcddP5YT%2F9k9AH8473CGbZflUpBwdGsww%2Bues1AY6pgEjwxND%2BJzMwh3LYwfCD33vlR5NnoAYKL9%2FAQ1e4Fk5kgc%2FDQFtlKwIgHVa%2FLX6OBB7Gpx%2Bps2TjM0s4Y%2BJLOMt169Y0ao7HuqYZRkxziP1RCuZWtnHIm79TWXC1S35xDBaCL5yl2cp4F9ve0gYjxvQLiEgCy85GeP6yQ0JwhPf4DgHiVkPZ4KEUBANmKOBVWruUeFafD%2FFhDeV%2BYmHqJXZqLb3fcrG&X-Amz-Signature=b7f8590b0c11881eaab934b4f9efcf722b7841c0334df36eb9cc2543abc39316&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666PGVJY4F%2F20260823%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260823T181329Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBIaCXVzLXdlc3QtMiJGMEQCIChuYQmSlL0tK0QYsahlU1%2FcLYXKslLBHTtRmwVdUG1dAiBCwKFN6ovanGY%2FxZaBleA1yy4jBSfkogP%2FHYY4wrmGUyqIBAjb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMdvS5T%2F8X8iXO%2BJhJKtwDpeBI6bdNdSnAoMDMckTdlD8XQFvrb8iD%2Fk1W713ZPY3ZyDLJgep%2FyTfShUP0o12t0kgg04TqXoZgObVqmxDRhZOAmasNfsWONe8VtSAYwBMjjBIAsNhoUBSVTSXXzCaaykn45xyUZsrbDdAy2CVZICZTU%2Fx1ptNzqTQ1m78Ibq6HesmXdjANi6N7D668GnJCm5K2ZJfvW6%2FPP%2FZwaExCc%2FGsXTx224pqki9mZ4OYuZ%2FrQbcz2ERG3fTF%2FP%2FuVH58eoVTfcbn5kDdUJVgnMx3sJvdzxpyBetGgcC3%2Fn4aHiJLyjhZH5TPYXAvPNJD6WV3ba1VQqHTPIaoE2anoXwXgFELVy6xB0uo59KlybkbIiUSUa8bq5S%2BIO4nBCit2ogr52dTENS4zFyW2nldZaEHvf2rR3IkJ8QyJd6BBfv6l%2BiZewhD184csYf2qJvVVk3FsVQN1n08aSmmr73aWtTqdMXLWOdOBOZ%2BAoCIUjMNvCbQWIRbm%2FyO%2BNrvpDYlPKDAOcOECOfdllGqaPdFttGpzBeH8Lg5GIKQEKxpVk%2BCZ8%2F7a1FEp1qFzQrJDh1wOomTRCta9OLE5hREYlTravl%2FKXvB%2FJ4GcddP5YT%2F9k9AH8473CGbZflUpBwdGsww%2Bues1AY6pgEjwxND%2BJzMwh3LYwfCD33vlR5NnoAYKL9%2FAQ1e4Fk5kgc%2FDQFtlKwIgHVa%2FLX6OBB7Gpx%2Bps2TjM0s4Y%2BJLOMt169Y0ao7HuqYZRkxziP1RCuZWtnHIm79TWXC1S35xDBaCL5yl2cp4F9ve0gYjxvQLiEgCy85GeP6yQ0JwhPf4DgHiVkPZ4KEUBANmKOBVWruUeFafD%2FFhDeV%2BYmHqJXZqLb3fcrG&X-Amz-Signature=1136152ec53be096380dbf71694343bd7a5301818d5b3d50d37b0acddacbecd8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666PGVJY4F%2F20260823%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260823T181329Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBIaCXVzLXdlc3QtMiJGMEQCIChuYQmSlL0tK0QYsahlU1%2FcLYXKslLBHTtRmwVdUG1dAiBCwKFN6ovanGY%2FxZaBleA1yy4jBSfkogP%2FHYY4wrmGUyqIBAjb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMdvS5T%2F8X8iXO%2BJhJKtwDpeBI6bdNdSnAoMDMckTdlD8XQFvrb8iD%2Fk1W713ZPY3ZyDLJgep%2FyTfShUP0o12t0kgg04TqXoZgObVqmxDRhZOAmasNfsWONe8VtSAYwBMjjBIAsNhoUBSVTSXXzCaaykn45xyUZsrbDdAy2CVZICZTU%2Fx1ptNzqTQ1m78Ibq6HesmXdjANi6N7D668GnJCm5K2ZJfvW6%2FPP%2FZwaExCc%2FGsXTx224pqki9mZ4OYuZ%2FrQbcz2ERG3fTF%2FP%2FuVH58eoVTfcbn5kDdUJVgnMx3sJvdzxpyBetGgcC3%2Fn4aHiJLyjhZH5TPYXAvPNJD6WV3ba1VQqHTPIaoE2anoXwXgFELVy6xB0uo59KlybkbIiUSUa8bq5S%2BIO4nBCit2ogr52dTENS4zFyW2nldZaEHvf2rR3IkJ8QyJd6BBfv6l%2BiZewhD184csYf2qJvVVk3FsVQN1n08aSmmr73aWtTqdMXLWOdOBOZ%2BAoCIUjMNvCbQWIRbm%2FyO%2BNrvpDYlPKDAOcOECOfdllGqaPdFttGpzBeH8Lg5GIKQEKxpVk%2BCZ8%2F7a1FEp1qFzQrJDh1wOomTRCta9OLE5hREYlTravl%2FKXvB%2FJ4GcddP5YT%2F9k9AH8473CGbZflUpBwdGsww%2Bues1AY6pgEjwxND%2BJzMwh3LYwfCD33vlR5NnoAYKL9%2FAQ1e4Fk5kgc%2FDQFtlKwIgHVa%2FLX6OBB7Gpx%2Bps2TjM0s4Y%2BJLOMt169Y0ao7HuqYZRkxziP1RCuZWtnHIm79TWXC1S35xDBaCL5yl2cp4F9ve0gYjxvQLiEgCy85GeP6yQ0JwhPf4DgHiVkPZ4KEUBANmKOBVWruUeFafD%2FFhDeV%2BYmHqJXZqLb3fcrG&X-Amz-Signature=1c54bd0244465aedef4ea29cf31709beac2871aa940a59d85c922c7a0123488f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
