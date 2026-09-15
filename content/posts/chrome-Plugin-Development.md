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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YFEZHNOV%2F20260915%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260915T022207Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECoaCXVzLXdlc3QtMiJGMEQCID1DNBJMCVEi7HZgvkYYnFylK30MgibupmrAtLfRCWHbAiA8CklRXG5pTBAkBdoLpinNIc11hdGY%2FqdUod%2B2eBd%2FXyqIBAjy%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMiS0G2oBIUopLMcj2KtwD9e9fdxyqtJzJfYvCLRiaDb1jv7iOC958ppSZLSTDOHmk3JT4qvpL6pPvqSxfsdu5CrolubzJKy%2BcGXc4cHH9UvJXUkMDvnwzccQAWo22ipcwQkOlWM5izF3RShqa9faahYFKaUZef6TU2scl2F2l%2F6ehlXpPkzcVpRmb%2FRt2PEYkM5mxrMiLMRbzfOi%2BlbjHWIU%2BH3jCk564cbrjQEre4NMQoOk%2B3OoIrFaLXymuvjofW30AAUjQs8JTIFu7zrck2kffxaMfdzMYzyqAUb9SPC6XgaNsRPCAx0Lm%2BOK7m%2BC6bBi2Ws1wCgZdEZufEx7nsPRglRMkc4hdtmjYz%2B%2BcXSzb7hKCMB2%2B829r0wY9w6D%2B4Qt2Fzud0kaIKMWPnPMtXtwd9cM4bF8nAsgVSnChKwp2eFlzKORQH5cZa1S%2BvWETL8Ygb%2Ba6QOFMbC3SgSflYAHuLCL%2BbfRSLELUeGUHt07G9Sd9PXcawsEe8pIhGTCjR%2FSo7uzEiju0%2F7tvnr3tK0Y0T1Xzng8Yo7fPt%2Fs5ec8e5rCe8gQswgr50bItQcWaDuqbnAyEUkMaqDFqNtaqFWmNZvZwH6nSzOS15QCE2V8sph6B%2BM5B%2B6u6HHGSvmW6lUYe%2FwKlwLcC1KYwoLui1QY6pgGtBVSvdpqXuq0%2FLKDvIQ1airkkhjh0UTmKz6AbZIj4Yrgq753F94SRRq3t3Q%2F2SBSbGL%2FrIjgZ3CbrKwzq0vlT139IhidzxOmHTUTlJErd28zmnYI2A0JUyLM%2FsfWamVN5ROTB4cAvuR%2BTDzot87J1H4rp2YwGBadT%2BI0hkUQ54LukIecwYAzTtaF1foV55GaKUwOKkt7QiQKz%2FCcZKvOS6oVkNshI&X-Amz-Signature=548a6f5e241a49451c5a1523da913747ba29c3f677592b374187715c5efcafe7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YFEZHNOV%2F20260915%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260915T022207Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECoaCXVzLXdlc3QtMiJGMEQCID1DNBJMCVEi7HZgvkYYnFylK30MgibupmrAtLfRCWHbAiA8CklRXG5pTBAkBdoLpinNIc11hdGY%2FqdUod%2B2eBd%2FXyqIBAjy%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMiS0G2oBIUopLMcj2KtwD9e9fdxyqtJzJfYvCLRiaDb1jv7iOC958ppSZLSTDOHmk3JT4qvpL6pPvqSxfsdu5CrolubzJKy%2BcGXc4cHH9UvJXUkMDvnwzccQAWo22ipcwQkOlWM5izF3RShqa9faahYFKaUZef6TU2scl2F2l%2F6ehlXpPkzcVpRmb%2FRt2PEYkM5mxrMiLMRbzfOi%2BlbjHWIU%2BH3jCk564cbrjQEre4NMQoOk%2B3OoIrFaLXymuvjofW30AAUjQs8JTIFu7zrck2kffxaMfdzMYzyqAUb9SPC6XgaNsRPCAx0Lm%2BOK7m%2BC6bBi2Ws1wCgZdEZufEx7nsPRglRMkc4hdtmjYz%2B%2BcXSzb7hKCMB2%2B829r0wY9w6D%2B4Qt2Fzud0kaIKMWPnPMtXtwd9cM4bF8nAsgVSnChKwp2eFlzKORQH5cZa1S%2BvWETL8Ygb%2Ba6QOFMbC3SgSflYAHuLCL%2BbfRSLELUeGUHt07G9Sd9PXcawsEe8pIhGTCjR%2FSo7uzEiju0%2F7tvnr3tK0Y0T1Xzng8Yo7fPt%2Fs5ec8e5rCe8gQswgr50bItQcWaDuqbnAyEUkMaqDFqNtaqFWmNZvZwH6nSzOS15QCE2V8sph6B%2BM5B%2B6u6HHGSvmW6lUYe%2FwKlwLcC1KYwoLui1QY6pgGtBVSvdpqXuq0%2FLKDvIQ1airkkhjh0UTmKz6AbZIj4Yrgq753F94SRRq3t3Q%2F2SBSbGL%2FrIjgZ3CbrKwzq0vlT139IhidzxOmHTUTlJErd28zmnYI2A0JUyLM%2FsfWamVN5ROTB4cAvuR%2BTDzot87J1H4rp2YwGBadT%2BI0hkUQ54LukIecwYAzTtaF1foV55GaKUwOKkt7QiQKz%2FCcZKvOS6oVkNshI&X-Amz-Signature=388a0e349c14d787771d721f3e041939f4e952609610112307a58d8635d0ecb9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YFEZHNOV%2F20260915%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260915T022207Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECoaCXVzLXdlc3QtMiJGMEQCID1DNBJMCVEi7HZgvkYYnFylK30MgibupmrAtLfRCWHbAiA8CklRXG5pTBAkBdoLpinNIc11hdGY%2FqdUod%2B2eBd%2FXyqIBAjy%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMiS0G2oBIUopLMcj2KtwD9e9fdxyqtJzJfYvCLRiaDb1jv7iOC958ppSZLSTDOHmk3JT4qvpL6pPvqSxfsdu5CrolubzJKy%2BcGXc4cHH9UvJXUkMDvnwzccQAWo22ipcwQkOlWM5izF3RShqa9faahYFKaUZef6TU2scl2F2l%2F6ehlXpPkzcVpRmb%2FRt2PEYkM5mxrMiLMRbzfOi%2BlbjHWIU%2BH3jCk564cbrjQEre4NMQoOk%2B3OoIrFaLXymuvjofW30AAUjQs8JTIFu7zrck2kffxaMfdzMYzyqAUb9SPC6XgaNsRPCAx0Lm%2BOK7m%2BC6bBi2Ws1wCgZdEZufEx7nsPRglRMkc4hdtmjYz%2B%2BcXSzb7hKCMB2%2B829r0wY9w6D%2B4Qt2Fzud0kaIKMWPnPMtXtwd9cM4bF8nAsgVSnChKwp2eFlzKORQH5cZa1S%2BvWETL8Ygb%2Ba6QOFMbC3SgSflYAHuLCL%2BbfRSLELUeGUHt07G9Sd9PXcawsEe8pIhGTCjR%2FSo7uzEiju0%2F7tvnr3tK0Y0T1Xzng8Yo7fPt%2Fs5ec8e5rCe8gQswgr50bItQcWaDuqbnAyEUkMaqDFqNtaqFWmNZvZwH6nSzOS15QCE2V8sph6B%2BM5B%2B6u6HHGSvmW6lUYe%2FwKlwLcC1KYwoLui1QY6pgGtBVSvdpqXuq0%2FLKDvIQ1airkkhjh0UTmKz6AbZIj4Yrgq753F94SRRq3t3Q%2F2SBSbGL%2FrIjgZ3CbrKwzq0vlT139IhidzxOmHTUTlJErd28zmnYI2A0JUyLM%2FsfWamVN5ROTB4cAvuR%2BTDzot87J1H4rp2YwGBadT%2BI0hkUQ54LukIecwYAzTtaF1foV55GaKUwOKkt7QiQKz%2FCcZKvOS6oVkNshI&X-Amz-Signature=1384ea22c96f5601eea4c3c4176b5d68b95c79c560ec964b7e83687ea7be7486&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YFEZHNOV%2F20260915%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260915T022207Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECoaCXVzLXdlc3QtMiJGMEQCID1DNBJMCVEi7HZgvkYYnFylK30MgibupmrAtLfRCWHbAiA8CklRXG5pTBAkBdoLpinNIc11hdGY%2FqdUod%2B2eBd%2FXyqIBAjy%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMiS0G2oBIUopLMcj2KtwD9e9fdxyqtJzJfYvCLRiaDb1jv7iOC958ppSZLSTDOHmk3JT4qvpL6pPvqSxfsdu5CrolubzJKy%2BcGXc4cHH9UvJXUkMDvnwzccQAWo22ipcwQkOlWM5izF3RShqa9faahYFKaUZef6TU2scl2F2l%2F6ehlXpPkzcVpRmb%2FRt2PEYkM5mxrMiLMRbzfOi%2BlbjHWIU%2BH3jCk564cbrjQEre4NMQoOk%2B3OoIrFaLXymuvjofW30AAUjQs8JTIFu7zrck2kffxaMfdzMYzyqAUb9SPC6XgaNsRPCAx0Lm%2BOK7m%2BC6bBi2Ws1wCgZdEZufEx7nsPRglRMkc4hdtmjYz%2B%2BcXSzb7hKCMB2%2B829r0wY9w6D%2B4Qt2Fzud0kaIKMWPnPMtXtwd9cM4bF8nAsgVSnChKwp2eFlzKORQH5cZa1S%2BvWETL8Ygb%2Ba6QOFMbC3SgSflYAHuLCL%2BbfRSLELUeGUHt07G9Sd9PXcawsEe8pIhGTCjR%2FSo7uzEiju0%2F7tvnr3tK0Y0T1Xzng8Yo7fPt%2Fs5ec8e5rCe8gQswgr50bItQcWaDuqbnAyEUkMaqDFqNtaqFWmNZvZwH6nSzOS15QCE2V8sph6B%2BM5B%2B6u6HHGSvmW6lUYe%2FwKlwLcC1KYwoLui1QY6pgGtBVSvdpqXuq0%2FLKDvIQ1airkkhjh0UTmKz6AbZIj4Yrgq753F94SRRq3t3Q%2F2SBSbGL%2FrIjgZ3CbrKwzq0vlT139IhidzxOmHTUTlJErd28zmnYI2A0JUyLM%2FsfWamVN5ROTB4cAvuR%2BTDzot87J1H4rp2YwGBadT%2BI0hkUQ54LukIecwYAzTtaF1foV55GaKUwOKkt7QiQKz%2FCcZKvOS6oVkNshI&X-Amz-Signature=bceb67b4e50f6a3750244c412c1bfcd0115df1b5728027885e97f31034bf88a4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
