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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RWRESRDQ%2F20260812%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260812T124217Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAMaCXVzLXdlc3QtMiJIMEYCIQCKdCGRKB%2BD%2FZ9KFGk%2FYYHjoZLqmWZRO6ytmwdqoHIKoQIhAOmXeKv65qkaCDXl8209jF3rnn2CHxiLDPoxs78yYwmlKogECMz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgyB%2FOmN5Nl9WHFe0JUq3ANEzcwvVTSkH5bh06vdaC6KoIig0TA3Mf1%2FGHwCr5gUkZlh8YT3DL7FqSxfKvZ9o6RXS5qt7Z3wB21bCiCtMTCWBexBn8MB6RUitA64066Vq0KXXzNOLV01%2FA%2FjmcsBsEw3xb1afczMr8eJt1Pgkknr0MXVqgfpQ%2FOkTpBhvU1MuGaGR7H%2BXcc0c9vdF%2F2aU7dRUiKLrFVz8hg5nr5AQ1R%2FCFuIkYORN7YFYtGgNhUKhitjcLaPguKnguieynWV45eRJ23WhYVD2SYSwVrw%2B9JlXSrwOsoWCVd5IpdCaXexP30jleWMWsssF6VGKjz9WTxugc0yXEJHIIvcVvXb1l4ynWWg1cvNz9IfS0AKkOxncR4uyuemLE%2FS88upbZaL0qVjCcCqK9AuB1Ox4vHxFvzuiz1pwbzaJe8pupeZ7mNCTbhtTy68lzBK0v4JZuKuReLsh89eXU7332EvdM62KEfG2Idosyqt80sYNbJBpK4eafKR7W6Uv5IKX68G4yTB%2BZ%2BF8fAsG5eIdYdOQqUMnKTDMq2vC0xvEkMyFUmLkPNDcZ3DCzwR%2BhI69eoCs3dCdr%2Bf9lfCghyXIJyIqbbr3eu0gQZocU0xlGZK5sRK2TabdXU07w6aAqGvzyK%2BKDCqnvHTBjqkARi0Ma0X06MOUvQu0sIWrOo6KJZfOida0HdcyqyqSseiX9zlYeZzrBQAaCeEf2cqoswVrYcsK4pD%2FgTyW%2FDicZwTg4A0zvgDOZyf6frwGVPf%2Fs%2Bo9MR2IwA%2BHQaMt62rGwviwRqwH%2BnHWjYU5eH0LAO6D42XZEzXmo5DSZNcryY6WoU4XgO06OdQP6NVV7NwPg2Te%2BXi%2BDmFB%2B%2FIn%2Bcusc%2F4n39v&X-Amz-Signature=fe4d3a56ab55ec6f1c60b267e319d5d465b47f0bf9015aa931a4cbbda3cda2de&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RWRESRDQ%2F20260812%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260812T124217Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAMaCXVzLXdlc3QtMiJIMEYCIQCKdCGRKB%2BD%2FZ9KFGk%2FYYHjoZLqmWZRO6ytmwdqoHIKoQIhAOmXeKv65qkaCDXl8209jF3rnn2CHxiLDPoxs78yYwmlKogECMz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgyB%2FOmN5Nl9WHFe0JUq3ANEzcwvVTSkH5bh06vdaC6KoIig0TA3Mf1%2FGHwCr5gUkZlh8YT3DL7FqSxfKvZ9o6RXS5qt7Z3wB21bCiCtMTCWBexBn8MB6RUitA64066Vq0KXXzNOLV01%2FA%2FjmcsBsEw3xb1afczMr8eJt1Pgkknr0MXVqgfpQ%2FOkTpBhvU1MuGaGR7H%2BXcc0c9vdF%2F2aU7dRUiKLrFVz8hg5nr5AQ1R%2FCFuIkYORN7YFYtGgNhUKhitjcLaPguKnguieynWV45eRJ23WhYVD2SYSwVrw%2B9JlXSrwOsoWCVd5IpdCaXexP30jleWMWsssF6VGKjz9WTxugc0yXEJHIIvcVvXb1l4ynWWg1cvNz9IfS0AKkOxncR4uyuemLE%2FS88upbZaL0qVjCcCqK9AuB1Ox4vHxFvzuiz1pwbzaJe8pupeZ7mNCTbhtTy68lzBK0v4JZuKuReLsh89eXU7332EvdM62KEfG2Idosyqt80sYNbJBpK4eafKR7W6Uv5IKX68G4yTB%2BZ%2BF8fAsG5eIdYdOQqUMnKTDMq2vC0xvEkMyFUmLkPNDcZ3DCzwR%2BhI69eoCs3dCdr%2Bf9lfCghyXIJyIqbbr3eu0gQZocU0xlGZK5sRK2TabdXU07w6aAqGvzyK%2BKDCqnvHTBjqkARi0Ma0X06MOUvQu0sIWrOo6KJZfOida0HdcyqyqSseiX9zlYeZzrBQAaCeEf2cqoswVrYcsK4pD%2FgTyW%2FDicZwTg4A0zvgDOZyf6frwGVPf%2Fs%2Bo9MR2IwA%2BHQaMt62rGwviwRqwH%2BnHWjYU5eH0LAO6D42XZEzXmo5DSZNcryY6WoU4XgO06OdQP6NVV7NwPg2Te%2BXi%2BDmFB%2B%2FIn%2Bcusc%2F4n39v&X-Amz-Signature=a22a706d0b8362dfdf4ac8df276c8fdb33f04a7ac302ecba71936104cf2e87c7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RWRESRDQ%2F20260812%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260812T124217Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAMaCXVzLXdlc3QtMiJIMEYCIQCKdCGRKB%2BD%2FZ9KFGk%2FYYHjoZLqmWZRO6ytmwdqoHIKoQIhAOmXeKv65qkaCDXl8209jF3rnn2CHxiLDPoxs78yYwmlKogECMz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgyB%2FOmN5Nl9WHFe0JUq3ANEzcwvVTSkH5bh06vdaC6KoIig0TA3Mf1%2FGHwCr5gUkZlh8YT3DL7FqSxfKvZ9o6RXS5qt7Z3wB21bCiCtMTCWBexBn8MB6RUitA64066Vq0KXXzNOLV01%2FA%2FjmcsBsEw3xb1afczMr8eJt1Pgkknr0MXVqgfpQ%2FOkTpBhvU1MuGaGR7H%2BXcc0c9vdF%2F2aU7dRUiKLrFVz8hg5nr5AQ1R%2FCFuIkYORN7YFYtGgNhUKhitjcLaPguKnguieynWV45eRJ23WhYVD2SYSwVrw%2B9JlXSrwOsoWCVd5IpdCaXexP30jleWMWsssF6VGKjz9WTxugc0yXEJHIIvcVvXb1l4ynWWg1cvNz9IfS0AKkOxncR4uyuemLE%2FS88upbZaL0qVjCcCqK9AuB1Ox4vHxFvzuiz1pwbzaJe8pupeZ7mNCTbhtTy68lzBK0v4JZuKuReLsh89eXU7332EvdM62KEfG2Idosyqt80sYNbJBpK4eafKR7W6Uv5IKX68G4yTB%2BZ%2BF8fAsG5eIdYdOQqUMnKTDMq2vC0xvEkMyFUmLkPNDcZ3DCzwR%2BhI69eoCs3dCdr%2Bf9lfCghyXIJyIqbbr3eu0gQZocU0xlGZK5sRK2TabdXU07w6aAqGvzyK%2BKDCqnvHTBjqkARi0Ma0X06MOUvQu0sIWrOo6KJZfOida0HdcyqyqSseiX9zlYeZzrBQAaCeEf2cqoswVrYcsK4pD%2FgTyW%2FDicZwTg4A0zvgDOZyf6frwGVPf%2Fs%2Bo9MR2IwA%2BHQaMt62rGwviwRqwH%2BnHWjYU5eH0LAO6D42XZEzXmo5DSZNcryY6WoU4XgO06OdQP6NVV7NwPg2Te%2BXi%2BDmFB%2B%2FIn%2Bcusc%2F4n39v&X-Amz-Signature=571be9537752800c1d7e8d6d79b22ac7869b04cb466ce94adefa63904e0a8468&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RWRESRDQ%2F20260812%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260812T124217Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAMaCXVzLXdlc3QtMiJIMEYCIQCKdCGRKB%2BD%2FZ9KFGk%2FYYHjoZLqmWZRO6ytmwdqoHIKoQIhAOmXeKv65qkaCDXl8209jF3rnn2CHxiLDPoxs78yYwmlKogECMz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgyB%2FOmN5Nl9WHFe0JUq3ANEzcwvVTSkH5bh06vdaC6KoIig0TA3Mf1%2FGHwCr5gUkZlh8YT3DL7FqSxfKvZ9o6RXS5qt7Z3wB21bCiCtMTCWBexBn8MB6RUitA64066Vq0KXXzNOLV01%2FA%2FjmcsBsEw3xb1afczMr8eJt1Pgkknr0MXVqgfpQ%2FOkTpBhvU1MuGaGR7H%2BXcc0c9vdF%2F2aU7dRUiKLrFVz8hg5nr5AQ1R%2FCFuIkYORN7YFYtGgNhUKhitjcLaPguKnguieynWV45eRJ23WhYVD2SYSwVrw%2B9JlXSrwOsoWCVd5IpdCaXexP30jleWMWsssF6VGKjz9WTxugc0yXEJHIIvcVvXb1l4ynWWg1cvNz9IfS0AKkOxncR4uyuemLE%2FS88upbZaL0qVjCcCqK9AuB1Ox4vHxFvzuiz1pwbzaJe8pupeZ7mNCTbhtTy68lzBK0v4JZuKuReLsh89eXU7332EvdM62KEfG2Idosyqt80sYNbJBpK4eafKR7W6Uv5IKX68G4yTB%2BZ%2BF8fAsG5eIdYdOQqUMnKTDMq2vC0xvEkMyFUmLkPNDcZ3DCzwR%2BhI69eoCs3dCdr%2Bf9lfCghyXIJyIqbbr3eu0gQZocU0xlGZK5sRK2TabdXU07w6aAqGvzyK%2BKDCqnvHTBjqkARi0Ma0X06MOUvQu0sIWrOo6KJZfOida0HdcyqyqSseiX9zlYeZzrBQAaCeEf2cqoswVrYcsK4pD%2FgTyW%2FDicZwTg4A0zvgDOZyf6frwGVPf%2Fs%2Bo9MR2IwA%2BHQaMt62rGwviwRqwH%2BnHWjYU5eH0LAO6D42XZEzXmo5DSZNcryY6WoU4XgO06OdQP6NVV7NwPg2Te%2BXi%2BDmFB%2B%2FIn%2Bcusc%2F4n39v&X-Amz-Signature=c3f57b67f9968ea5de183cc1ae2794e6c12cceda5ac0f69a482db040011265af&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
