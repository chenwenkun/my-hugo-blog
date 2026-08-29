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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UDR2JRIJ%2F20260829%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260829T200756Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCkIxFIJ8vVcBWYitKVbP9Xp18KViZ6whlxD4FGxFMr5QIhAPL4fnJJAOSC81wD2%2B2GZ%2B%2B5wdKRTMB6Tpz7HiaKlud2Kv8DCGsQABoMNjM3NDIzMTgzODA1IgxeluHqM7AH1XNhrjMq3APYIWv8Av5SXq1DYx52VbWwVzUL5ffAQcUakK38cQJHlrciq0h73OG1%2BHa8QR9bcuuiXKBpBMqX1zstiC9gcFcNr45ffSF8n4ve20ATBtCWEuz0eMr7zJ9iGAsVA%2Fq6%2B%2BuS4Dq0Mzyf1m%2BGfqqEEB8w9FSn24bIxHebYBr2n1W%2BUOocO3oD%2BvlOoaNyt7HdxWXT9vUjaDHXdNWOhy%2BjWjmenTNPDoqs1BbWg%2FKtv%2B6hODjHHWlzUXtxSAHxc32u%2F0zbnZJDLuy5CbAjB7tw%2BR%2BgRS2MmXchQEpbTdarq8ZX%2BIadArx36hXEyqIB5oYEqPAK0fKe6bjyaDfPjSpagtkGY4aoHBl3XrI%2Fzy%2FaLaNkqSj8ccQw6EcfVzushpwstF4gXuh1G%2BC0LmrNdo3BrWXfXgGxi3EW394cEgN0TxKx66E5LLwrPcN5ePmAex7ZkMXqQzekYubfkJ4qSlrgF%2Biyklube9r9SH8WPN%2BTaGd6oHGBdvADLXOqK%2FL%2F5Zfe%2F2RBonkEIIp5ru4KVNpSedFYKKJv%2BXSwQF1RUkiUh7QQugIY3teDas7Eo1tpeIBQF87dmYfagN9yUGsBAqFYcGiN%2F5DtLqa%2FA1RY8LqjLjmegy%2Fl23X7rsdIQDQYpjCqx8zUBjqkAYnmavbQBXXtaiFtw3gcPU%2FOafv0SyP9EapgNnv%2F4fPiWJCK%2BQQbt8cAT2n3m8DO9kQdiAIxh%2FGPLtz%2B8%2B4jEzPhNGosGIF91edrcODfx6poHqRtC64zOxFjJC70wLA6EEtCO3RJhfME1VXD00SybdcPs8VZOIJ2fr5r6QLUa5UGgtQSS3lCI6LaKoxbgoxyNZqJ66AWm1EYgcKq9RuRTcJW1R%2Fl&X-Amz-Signature=59db07dae8d90765d7e43eb8ea8fb8904a6d372cd234524a1e3b86aea2048171&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UDR2JRIJ%2F20260829%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260829T200756Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCkIxFIJ8vVcBWYitKVbP9Xp18KViZ6whlxD4FGxFMr5QIhAPL4fnJJAOSC81wD2%2B2GZ%2B%2B5wdKRTMB6Tpz7HiaKlud2Kv8DCGsQABoMNjM3NDIzMTgzODA1IgxeluHqM7AH1XNhrjMq3APYIWv8Av5SXq1DYx52VbWwVzUL5ffAQcUakK38cQJHlrciq0h73OG1%2BHa8QR9bcuuiXKBpBMqX1zstiC9gcFcNr45ffSF8n4ve20ATBtCWEuz0eMr7zJ9iGAsVA%2Fq6%2B%2BuS4Dq0Mzyf1m%2BGfqqEEB8w9FSn24bIxHebYBr2n1W%2BUOocO3oD%2BvlOoaNyt7HdxWXT9vUjaDHXdNWOhy%2BjWjmenTNPDoqs1BbWg%2FKtv%2B6hODjHHWlzUXtxSAHxc32u%2F0zbnZJDLuy5CbAjB7tw%2BR%2BgRS2MmXchQEpbTdarq8ZX%2BIadArx36hXEyqIB5oYEqPAK0fKe6bjyaDfPjSpagtkGY4aoHBl3XrI%2Fzy%2FaLaNkqSj8ccQw6EcfVzushpwstF4gXuh1G%2BC0LmrNdo3BrWXfXgGxi3EW394cEgN0TxKx66E5LLwrPcN5ePmAex7ZkMXqQzekYubfkJ4qSlrgF%2Biyklube9r9SH8WPN%2BTaGd6oHGBdvADLXOqK%2FL%2F5Zfe%2F2RBonkEIIp5ru4KVNpSedFYKKJv%2BXSwQF1RUkiUh7QQugIY3teDas7Eo1tpeIBQF87dmYfagN9yUGsBAqFYcGiN%2F5DtLqa%2FA1RY8LqjLjmegy%2Fl23X7rsdIQDQYpjCqx8zUBjqkAYnmavbQBXXtaiFtw3gcPU%2FOafv0SyP9EapgNnv%2F4fPiWJCK%2BQQbt8cAT2n3m8DO9kQdiAIxh%2FGPLtz%2B8%2B4jEzPhNGosGIF91edrcODfx6poHqRtC64zOxFjJC70wLA6EEtCO3RJhfME1VXD00SybdcPs8VZOIJ2fr5r6QLUa5UGgtQSS3lCI6LaKoxbgoxyNZqJ66AWm1EYgcKq9RuRTcJW1R%2Fl&X-Amz-Signature=3df3ed3ed2e5f80c2f7e044315537ca68f93a210c6c98d0ebba7b95b36aae8ee&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UDR2JRIJ%2F20260829%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260829T200756Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCkIxFIJ8vVcBWYitKVbP9Xp18KViZ6whlxD4FGxFMr5QIhAPL4fnJJAOSC81wD2%2B2GZ%2B%2B5wdKRTMB6Tpz7HiaKlud2Kv8DCGsQABoMNjM3NDIzMTgzODA1IgxeluHqM7AH1XNhrjMq3APYIWv8Av5SXq1DYx52VbWwVzUL5ffAQcUakK38cQJHlrciq0h73OG1%2BHa8QR9bcuuiXKBpBMqX1zstiC9gcFcNr45ffSF8n4ve20ATBtCWEuz0eMr7zJ9iGAsVA%2Fq6%2B%2BuS4Dq0Mzyf1m%2BGfqqEEB8w9FSn24bIxHebYBr2n1W%2BUOocO3oD%2BvlOoaNyt7HdxWXT9vUjaDHXdNWOhy%2BjWjmenTNPDoqs1BbWg%2FKtv%2B6hODjHHWlzUXtxSAHxc32u%2F0zbnZJDLuy5CbAjB7tw%2BR%2BgRS2MmXchQEpbTdarq8ZX%2BIadArx36hXEyqIB5oYEqPAK0fKe6bjyaDfPjSpagtkGY4aoHBl3XrI%2Fzy%2FaLaNkqSj8ccQw6EcfVzushpwstF4gXuh1G%2BC0LmrNdo3BrWXfXgGxi3EW394cEgN0TxKx66E5LLwrPcN5ePmAex7ZkMXqQzekYubfkJ4qSlrgF%2Biyklube9r9SH8WPN%2BTaGd6oHGBdvADLXOqK%2FL%2F5Zfe%2F2RBonkEIIp5ru4KVNpSedFYKKJv%2BXSwQF1RUkiUh7QQugIY3teDas7Eo1tpeIBQF87dmYfagN9yUGsBAqFYcGiN%2F5DtLqa%2FA1RY8LqjLjmegy%2Fl23X7rsdIQDQYpjCqx8zUBjqkAYnmavbQBXXtaiFtw3gcPU%2FOafv0SyP9EapgNnv%2F4fPiWJCK%2BQQbt8cAT2n3m8DO9kQdiAIxh%2FGPLtz%2B8%2B4jEzPhNGosGIF91edrcODfx6poHqRtC64zOxFjJC70wLA6EEtCO3RJhfME1VXD00SybdcPs8VZOIJ2fr5r6QLUa5UGgtQSS3lCI6LaKoxbgoxyNZqJ66AWm1EYgcKq9RuRTcJW1R%2Fl&X-Amz-Signature=4facdea50dcca910f682b41bf897e2ed92c289e481da57179c1b11f20136c7ac&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UDR2JRIJ%2F20260829%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260829T200756Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCkIxFIJ8vVcBWYitKVbP9Xp18KViZ6whlxD4FGxFMr5QIhAPL4fnJJAOSC81wD2%2B2GZ%2B%2B5wdKRTMB6Tpz7HiaKlud2Kv8DCGsQABoMNjM3NDIzMTgzODA1IgxeluHqM7AH1XNhrjMq3APYIWv8Av5SXq1DYx52VbWwVzUL5ffAQcUakK38cQJHlrciq0h73OG1%2BHa8QR9bcuuiXKBpBMqX1zstiC9gcFcNr45ffSF8n4ve20ATBtCWEuz0eMr7zJ9iGAsVA%2Fq6%2B%2BuS4Dq0Mzyf1m%2BGfqqEEB8w9FSn24bIxHebYBr2n1W%2BUOocO3oD%2BvlOoaNyt7HdxWXT9vUjaDHXdNWOhy%2BjWjmenTNPDoqs1BbWg%2FKtv%2B6hODjHHWlzUXtxSAHxc32u%2F0zbnZJDLuy5CbAjB7tw%2BR%2BgRS2MmXchQEpbTdarq8ZX%2BIadArx36hXEyqIB5oYEqPAK0fKe6bjyaDfPjSpagtkGY4aoHBl3XrI%2Fzy%2FaLaNkqSj8ccQw6EcfVzushpwstF4gXuh1G%2BC0LmrNdo3BrWXfXgGxi3EW394cEgN0TxKx66E5LLwrPcN5ePmAex7ZkMXqQzekYubfkJ4qSlrgF%2Biyklube9r9SH8WPN%2BTaGd6oHGBdvADLXOqK%2FL%2F5Zfe%2F2RBonkEIIp5ru4KVNpSedFYKKJv%2BXSwQF1RUkiUh7QQugIY3teDas7Eo1tpeIBQF87dmYfagN9yUGsBAqFYcGiN%2F5DtLqa%2FA1RY8LqjLjmegy%2Fl23X7rsdIQDQYpjCqx8zUBjqkAYnmavbQBXXtaiFtw3gcPU%2FOafv0SyP9EapgNnv%2F4fPiWJCK%2BQQbt8cAT2n3m8DO9kQdiAIxh%2FGPLtz%2B8%2B4jEzPhNGosGIF91edrcODfx6poHqRtC64zOxFjJC70wLA6EEtCO3RJhfME1VXD00SybdcPs8VZOIJ2fr5r6QLUa5UGgtQSS3lCI6LaKoxbgoxyNZqJ66AWm1EYgcKq9RuRTcJW1R%2Fl&X-Amz-Signature=c024fc0f08f13192a34574de4f12d4f98d45857775081716cef7b00c1aa0df11&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
