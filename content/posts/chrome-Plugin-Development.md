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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WLAQZOYQ%2F20261115%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261115T221529Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDve0ksKDm3pjSL%2FFLfcOw5CDjGDkxnwN00tmewzmAqEwIhAJPW%2FK1md3OWRH%2BJEcZSrD7tatnr%2BR75NwROo32Br5P0KogECL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwVioXmPbIdbzsRw%2FUq3ANHz0wsd1g%2Fk4wNGvlnXGRX7OslPsznznJA9It18BZGcDkVCOa3JtSA%2Bn9K%2FFQpkaALDLO9yH2jBQ7%2FBIbt8RNc9%2FD%2BLl0%2FGQf61SpBv09hyWZSNL3oWYzYS3EgZCj5kO%2Fqm1SjHS2tILxnNipaovj4xgmlQ0zVkNz4vR0xwD5EBlcjUOCJeLIAJzLHtb5s8ZLeu4STdmXF2SFfCvJrQJ%2BB3I0Wj21%2FrMEnK9ifoujO9ADTiXFvwbj703CeRRLozyXs1WwZy%2Frnb6nTLHDs8wDpPsGrNrJfrUXkrmQh7egoz04n6lRr1q%2Bm5r15RBDDLBbmvbiy4s1LB%2BCBRb%2FH6E4vBOeOjSSUQ9N4xbh3zqm%2BGDjsZQPEBTdxU%2FEmZA%2BZmeAI9OJGpaTyTtI0y%2FKro%2BISwuXxMgRnoKetLvddnEVYBoPNiD%2BRrtjRHCF1ddt%2FKBX3HxkR653%2Fd787pd%2F9xRixr2csYaMiU6ui5TwFGM2NlUeMvWL%2Blv7k3b1LjOPC3FWgUQV9gBCcG6S%2Bzpdl%2B3l%2FAQ5uXhLG6kMPyTa8rk8P2Mr1cFja71DR%2FQHDGMt3FlXXETwGV%2BACl0wUvXKhS4m9XTNPV%2B62ouMBNq77iM7aqu0p1zKuQBSQl30qMDDrwujXBjqkAasBpvylnsRKXWpZWKWQAWPHn%2B1bSqCwPyVjbG5KOF%2FiI3a0VUSQE7kxQp6wm8p5vfJCp2x9guO4Pam6vg%2B6%2FkNbfQkRA3QRlcotJE55ju8KOYyT4DzRTC7stEoOx2eiqi88KRlnvsDxGbgNrnNOZkMO%2FkC53GUPf8OzxFtk1e2gecR7YliAhzf%2BSvdXdw8EiJ7%2BG9nVY4lLIkluO9X4uydAlawJ&X-Amz-Signature=b198579f4717b747d8dcadea40facf7839b21f68cb28a749f6f781e4801e46ed&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WLAQZOYQ%2F20261115%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261115T221529Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDve0ksKDm3pjSL%2FFLfcOw5CDjGDkxnwN00tmewzmAqEwIhAJPW%2FK1md3OWRH%2BJEcZSrD7tatnr%2BR75NwROo32Br5P0KogECL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwVioXmPbIdbzsRw%2FUq3ANHz0wsd1g%2Fk4wNGvlnXGRX7OslPsznznJA9It18BZGcDkVCOa3JtSA%2Bn9K%2FFQpkaALDLO9yH2jBQ7%2FBIbt8RNc9%2FD%2BLl0%2FGQf61SpBv09hyWZSNL3oWYzYS3EgZCj5kO%2Fqm1SjHS2tILxnNipaovj4xgmlQ0zVkNz4vR0xwD5EBlcjUOCJeLIAJzLHtb5s8ZLeu4STdmXF2SFfCvJrQJ%2BB3I0Wj21%2FrMEnK9ifoujO9ADTiXFvwbj703CeRRLozyXs1WwZy%2Frnb6nTLHDs8wDpPsGrNrJfrUXkrmQh7egoz04n6lRr1q%2Bm5r15RBDDLBbmvbiy4s1LB%2BCBRb%2FH6E4vBOeOjSSUQ9N4xbh3zqm%2BGDjsZQPEBTdxU%2FEmZA%2BZmeAI9OJGpaTyTtI0y%2FKro%2BISwuXxMgRnoKetLvddnEVYBoPNiD%2BRrtjRHCF1ddt%2FKBX3HxkR653%2Fd787pd%2F9xRixr2csYaMiU6ui5TwFGM2NlUeMvWL%2Blv7k3b1LjOPC3FWgUQV9gBCcG6S%2Bzpdl%2B3l%2FAQ5uXhLG6kMPyTa8rk8P2Mr1cFja71DR%2FQHDGMt3FlXXETwGV%2BACl0wUvXKhS4m9XTNPV%2B62ouMBNq77iM7aqu0p1zKuQBSQl30qMDDrwujXBjqkAasBpvylnsRKXWpZWKWQAWPHn%2B1bSqCwPyVjbG5KOF%2FiI3a0VUSQE7kxQp6wm8p5vfJCp2x9guO4Pam6vg%2B6%2FkNbfQkRA3QRlcotJE55ju8KOYyT4DzRTC7stEoOx2eiqi88KRlnvsDxGbgNrnNOZkMO%2FkC53GUPf8OzxFtk1e2gecR7YliAhzf%2BSvdXdw8EiJ7%2BG9nVY4lLIkluO9X4uydAlawJ&X-Amz-Signature=49a87f2eedd22b35cd804bd90565b725392a04aefebf05fe0b3fe7ed0872b509&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WLAQZOYQ%2F20261115%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261115T221529Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDve0ksKDm3pjSL%2FFLfcOw5CDjGDkxnwN00tmewzmAqEwIhAJPW%2FK1md3OWRH%2BJEcZSrD7tatnr%2BR75NwROo32Br5P0KogECL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwVioXmPbIdbzsRw%2FUq3ANHz0wsd1g%2Fk4wNGvlnXGRX7OslPsznznJA9It18BZGcDkVCOa3JtSA%2Bn9K%2FFQpkaALDLO9yH2jBQ7%2FBIbt8RNc9%2FD%2BLl0%2FGQf61SpBv09hyWZSNL3oWYzYS3EgZCj5kO%2Fqm1SjHS2tILxnNipaovj4xgmlQ0zVkNz4vR0xwD5EBlcjUOCJeLIAJzLHtb5s8ZLeu4STdmXF2SFfCvJrQJ%2BB3I0Wj21%2FrMEnK9ifoujO9ADTiXFvwbj703CeRRLozyXs1WwZy%2Frnb6nTLHDs8wDpPsGrNrJfrUXkrmQh7egoz04n6lRr1q%2Bm5r15RBDDLBbmvbiy4s1LB%2BCBRb%2FH6E4vBOeOjSSUQ9N4xbh3zqm%2BGDjsZQPEBTdxU%2FEmZA%2BZmeAI9OJGpaTyTtI0y%2FKro%2BISwuXxMgRnoKetLvddnEVYBoPNiD%2BRrtjRHCF1ddt%2FKBX3HxkR653%2Fd787pd%2F9xRixr2csYaMiU6ui5TwFGM2NlUeMvWL%2Blv7k3b1LjOPC3FWgUQV9gBCcG6S%2Bzpdl%2B3l%2FAQ5uXhLG6kMPyTa8rk8P2Mr1cFja71DR%2FQHDGMt3FlXXETwGV%2BACl0wUvXKhS4m9XTNPV%2B62ouMBNq77iM7aqu0p1zKuQBSQl30qMDDrwujXBjqkAasBpvylnsRKXWpZWKWQAWPHn%2B1bSqCwPyVjbG5KOF%2FiI3a0VUSQE7kxQp6wm8p5vfJCp2x9guO4Pam6vg%2B6%2FkNbfQkRA3QRlcotJE55ju8KOYyT4DzRTC7stEoOx2eiqi88KRlnvsDxGbgNrnNOZkMO%2FkC53GUPf8OzxFtk1e2gecR7YliAhzf%2BSvdXdw8EiJ7%2BG9nVY4lLIkluO9X4uydAlawJ&X-Amz-Signature=4d064b644fe143ee20f16d2a1f73a2303657c3bfdf17b59ea24fb17a4beb8fab&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WLAQZOYQ%2F20261115%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261115T221529Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDve0ksKDm3pjSL%2FFLfcOw5CDjGDkxnwN00tmewzmAqEwIhAJPW%2FK1md3OWRH%2BJEcZSrD7tatnr%2BR75NwROo32Br5P0KogECL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwVioXmPbIdbzsRw%2FUq3ANHz0wsd1g%2Fk4wNGvlnXGRX7OslPsznznJA9It18BZGcDkVCOa3JtSA%2Bn9K%2FFQpkaALDLO9yH2jBQ7%2FBIbt8RNc9%2FD%2BLl0%2FGQf61SpBv09hyWZSNL3oWYzYS3EgZCj5kO%2Fqm1SjHS2tILxnNipaovj4xgmlQ0zVkNz4vR0xwD5EBlcjUOCJeLIAJzLHtb5s8ZLeu4STdmXF2SFfCvJrQJ%2BB3I0Wj21%2FrMEnK9ifoujO9ADTiXFvwbj703CeRRLozyXs1WwZy%2Frnb6nTLHDs8wDpPsGrNrJfrUXkrmQh7egoz04n6lRr1q%2Bm5r15RBDDLBbmvbiy4s1LB%2BCBRb%2FH6E4vBOeOjSSUQ9N4xbh3zqm%2BGDjsZQPEBTdxU%2FEmZA%2BZmeAI9OJGpaTyTtI0y%2FKro%2BISwuXxMgRnoKetLvddnEVYBoPNiD%2BRrtjRHCF1ddt%2FKBX3HxkR653%2Fd787pd%2F9xRixr2csYaMiU6ui5TwFGM2NlUeMvWL%2Blv7k3b1LjOPC3FWgUQV9gBCcG6S%2Bzpdl%2B3l%2FAQ5uXhLG6kMPyTa8rk8P2Mr1cFja71DR%2FQHDGMt3FlXXETwGV%2BACl0wUvXKhS4m9XTNPV%2B62ouMBNq77iM7aqu0p1zKuQBSQl30qMDDrwujXBjqkAasBpvylnsRKXWpZWKWQAWPHn%2B1bSqCwPyVjbG5KOF%2FiI3a0VUSQE7kxQp6wm8p5vfJCp2x9guO4Pam6vg%2B6%2FkNbfQkRA3QRlcotJE55ju8KOYyT4DzRTC7stEoOx2eiqi88KRlnvsDxGbgNrnNOZkMO%2FkC53GUPf8OzxFtk1e2gecR7YliAhzf%2BSvdXdw8EiJ7%2BG9nVY4lLIkluO9X4uydAlawJ&X-Amz-Signature=433aeb430ab55c2ddefea6e34a41ff36f9f317de4284537a84cef1c76f001b97&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
