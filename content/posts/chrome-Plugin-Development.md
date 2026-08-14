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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XQYGGDM5%2F20260814%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260814T070651Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEC4aCXVzLXdlc3QtMiJGMEQCIHWMTS4OJLHDbJnyeHqCueK7Hrl7r8aDTBlgA0hkZ%2F4KAiBNgr8c%2FWYO2o3WAxDlVYNtKow%2FwIxvN4nVU81l7%2F4TryqIBAj3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMuykq7KpMkTpEdaSbKtwDlQJoyq6FZc0YaTIs3lJ%2FOcd3qqoCWiMly4hP%2Bf71LtqxJ7B8UX6vm66rYJ%2FjfDobl61h7wjrTLAVtB4ygtI%2F3M8DQgzw6N1L89CQqcI%2Bl8eGavcB5r3UTay1IvF7%2FnYRilNOERJ9JEor%2B1uaKksNNXaarP6NRLLyeSfNz9Z0eVj2MX0owIdXG8y5m2XCO9Cx5jXLhWCRacxzCX1HjDUPzSVE8SHnpcO1G9vL1h2g83DyUHvRbsJJoZQn8Tnx4W4SKqzfJUH9LWd%2BQVNsmzPq%2Fd0k6n5iD06hFotLKh%2F9kgJVYNa7AfQIDSjGiI6AjFahVoUEyzKPTC7ttMc0I96BJzooDZreKnLFpbWWqZUh3NySH%2FKqAFJs%2Fui611pBYGey%2B9KcW%2F6H8D14ALy7QObebz%2F5mU202DVrfp%2FGOPIfYuwd4VutcyxCpFw7ijMhdp6sil8hLgjpMCKD8s6ixIzF1U%2BOX6UTfopwoXMVNGQh7YRWAbyObwmPKjzLPClUAOK80ySAAs1E91ZKsisnsqBMHcDbzDIdRPNXwakRrE7idTHNVJaGxsir%2BX5MIK9NTIqurF0OhtCkMwiefqzD%2FoMgkgOucn%2FUMAtmOAxYz6q3z%2FFOD8f5GVt%2Bp9LErQkwut760wY6pgFDlrSWghtPIRacAmqW3uDdq7FEpwma4J4%2B7spI131vXySV62tltgrCcggrrjwdxeKnOdkFyLgUNCfkfqloN4AU7GzWOGoiRH%2BH0DfSGVJsDNJyYCvOJt8EJaXxbg5nezssNdW7%2FjXPFJQuELE4cEtpNJ91nt%2FeqKpj8DU6Hr28KemTOjjLiLfKnZtIz3eI6a9GFFXngOysecM9HSrRPj26NoQTsbg6&X-Amz-Signature=e78efe3152a0a60107e70eb99047e3eb2143f54bac08a6bde596a2af6ad73fb0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XQYGGDM5%2F20260814%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260814T070651Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEC4aCXVzLXdlc3QtMiJGMEQCIHWMTS4OJLHDbJnyeHqCueK7Hrl7r8aDTBlgA0hkZ%2F4KAiBNgr8c%2FWYO2o3WAxDlVYNtKow%2FwIxvN4nVU81l7%2F4TryqIBAj3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMuykq7KpMkTpEdaSbKtwDlQJoyq6FZc0YaTIs3lJ%2FOcd3qqoCWiMly4hP%2Bf71LtqxJ7B8UX6vm66rYJ%2FjfDobl61h7wjrTLAVtB4ygtI%2F3M8DQgzw6N1L89CQqcI%2Bl8eGavcB5r3UTay1IvF7%2FnYRilNOERJ9JEor%2B1uaKksNNXaarP6NRLLyeSfNz9Z0eVj2MX0owIdXG8y5m2XCO9Cx5jXLhWCRacxzCX1HjDUPzSVE8SHnpcO1G9vL1h2g83DyUHvRbsJJoZQn8Tnx4W4SKqzfJUH9LWd%2BQVNsmzPq%2Fd0k6n5iD06hFotLKh%2F9kgJVYNa7AfQIDSjGiI6AjFahVoUEyzKPTC7ttMc0I96BJzooDZreKnLFpbWWqZUh3NySH%2FKqAFJs%2Fui611pBYGey%2B9KcW%2F6H8D14ALy7QObebz%2F5mU202DVrfp%2FGOPIfYuwd4VutcyxCpFw7ijMhdp6sil8hLgjpMCKD8s6ixIzF1U%2BOX6UTfopwoXMVNGQh7YRWAbyObwmPKjzLPClUAOK80ySAAs1E91ZKsisnsqBMHcDbzDIdRPNXwakRrE7idTHNVJaGxsir%2BX5MIK9NTIqurF0OhtCkMwiefqzD%2FoMgkgOucn%2FUMAtmOAxYz6q3z%2FFOD8f5GVt%2Bp9LErQkwut760wY6pgFDlrSWghtPIRacAmqW3uDdq7FEpwma4J4%2B7spI131vXySV62tltgrCcggrrjwdxeKnOdkFyLgUNCfkfqloN4AU7GzWOGoiRH%2BH0DfSGVJsDNJyYCvOJt8EJaXxbg5nezssNdW7%2FjXPFJQuELE4cEtpNJ91nt%2FeqKpj8DU6Hr28KemTOjjLiLfKnZtIz3eI6a9GFFXngOysecM9HSrRPj26NoQTsbg6&X-Amz-Signature=fb8fdd66e5559024b87c8ed9791db92fa84650d936bd1afbc71495ddd89a1def&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XQYGGDM5%2F20260814%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260814T070651Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEC4aCXVzLXdlc3QtMiJGMEQCIHWMTS4OJLHDbJnyeHqCueK7Hrl7r8aDTBlgA0hkZ%2F4KAiBNgr8c%2FWYO2o3WAxDlVYNtKow%2FwIxvN4nVU81l7%2F4TryqIBAj3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMuykq7KpMkTpEdaSbKtwDlQJoyq6FZc0YaTIs3lJ%2FOcd3qqoCWiMly4hP%2Bf71LtqxJ7B8UX6vm66rYJ%2FjfDobl61h7wjrTLAVtB4ygtI%2F3M8DQgzw6N1L89CQqcI%2Bl8eGavcB5r3UTay1IvF7%2FnYRilNOERJ9JEor%2B1uaKksNNXaarP6NRLLyeSfNz9Z0eVj2MX0owIdXG8y5m2XCO9Cx5jXLhWCRacxzCX1HjDUPzSVE8SHnpcO1G9vL1h2g83DyUHvRbsJJoZQn8Tnx4W4SKqzfJUH9LWd%2BQVNsmzPq%2Fd0k6n5iD06hFotLKh%2F9kgJVYNa7AfQIDSjGiI6AjFahVoUEyzKPTC7ttMc0I96BJzooDZreKnLFpbWWqZUh3NySH%2FKqAFJs%2Fui611pBYGey%2B9KcW%2F6H8D14ALy7QObebz%2F5mU202DVrfp%2FGOPIfYuwd4VutcyxCpFw7ijMhdp6sil8hLgjpMCKD8s6ixIzF1U%2BOX6UTfopwoXMVNGQh7YRWAbyObwmPKjzLPClUAOK80ySAAs1E91ZKsisnsqBMHcDbzDIdRPNXwakRrE7idTHNVJaGxsir%2BX5MIK9NTIqurF0OhtCkMwiefqzD%2FoMgkgOucn%2FUMAtmOAxYz6q3z%2FFOD8f5GVt%2Bp9LErQkwut760wY6pgFDlrSWghtPIRacAmqW3uDdq7FEpwma4J4%2B7spI131vXySV62tltgrCcggrrjwdxeKnOdkFyLgUNCfkfqloN4AU7GzWOGoiRH%2BH0DfSGVJsDNJyYCvOJt8EJaXxbg5nezssNdW7%2FjXPFJQuELE4cEtpNJ91nt%2FeqKpj8DU6Hr28KemTOjjLiLfKnZtIz3eI6a9GFFXngOysecM9HSrRPj26NoQTsbg6&X-Amz-Signature=0d0acbdd3458821dfa8dd1b041f784194529b9c9fc7f180ed3bd2a66fe1a3879&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XQYGGDM5%2F20260814%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260814T070651Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEC4aCXVzLXdlc3QtMiJGMEQCIHWMTS4OJLHDbJnyeHqCueK7Hrl7r8aDTBlgA0hkZ%2F4KAiBNgr8c%2FWYO2o3WAxDlVYNtKow%2FwIxvN4nVU81l7%2F4TryqIBAj3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMuykq7KpMkTpEdaSbKtwDlQJoyq6FZc0YaTIs3lJ%2FOcd3qqoCWiMly4hP%2Bf71LtqxJ7B8UX6vm66rYJ%2FjfDobl61h7wjrTLAVtB4ygtI%2F3M8DQgzw6N1L89CQqcI%2Bl8eGavcB5r3UTay1IvF7%2FnYRilNOERJ9JEor%2B1uaKksNNXaarP6NRLLyeSfNz9Z0eVj2MX0owIdXG8y5m2XCO9Cx5jXLhWCRacxzCX1HjDUPzSVE8SHnpcO1G9vL1h2g83DyUHvRbsJJoZQn8Tnx4W4SKqzfJUH9LWd%2BQVNsmzPq%2Fd0k6n5iD06hFotLKh%2F9kgJVYNa7AfQIDSjGiI6AjFahVoUEyzKPTC7ttMc0I96BJzooDZreKnLFpbWWqZUh3NySH%2FKqAFJs%2Fui611pBYGey%2B9KcW%2F6H8D14ALy7QObebz%2F5mU202DVrfp%2FGOPIfYuwd4VutcyxCpFw7ijMhdp6sil8hLgjpMCKD8s6ixIzF1U%2BOX6UTfopwoXMVNGQh7YRWAbyObwmPKjzLPClUAOK80ySAAs1E91ZKsisnsqBMHcDbzDIdRPNXwakRrE7idTHNVJaGxsir%2BX5MIK9NTIqurF0OhtCkMwiefqzD%2FoMgkgOucn%2FUMAtmOAxYz6q3z%2FFOD8f5GVt%2Bp9LErQkwut760wY6pgFDlrSWghtPIRacAmqW3uDdq7FEpwma4J4%2B7spI131vXySV62tltgrCcggrrjwdxeKnOdkFyLgUNCfkfqloN4AU7GzWOGoiRH%2BH0DfSGVJsDNJyYCvOJt8EJaXxbg5nezssNdW7%2FjXPFJQuELE4cEtpNJ91nt%2FeqKpj8DU6Hr28KemTOjjLiLfKnZtIz3eI6a9GFFXngOysecM9HSrRPj26NoQTsbg6&X-Amz-Signature=a826e79a80fbb2f6caef509a8a321051604bd2082d03ee584e61e9009b4476ae&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
