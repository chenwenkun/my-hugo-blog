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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663YHM7I3S%2F20260804%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260804T012402Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDkaCXVzLXdlc3QtMiJGMEQCIHg%2FylMgfSD93mXDBYutzWGdxlZEh3sBZzl4EmDZIEX2AiBMGBarQS2N9Xtvt1hLqpazz3XDKgk00Q9iR%2BjQ%2Fqg%2BJCr%2FAwgCEAAaDDYzNzQyMzE4MzgwNSIMQb5%2F7jI0%2Fk6km9LaKtwDUG10Mc7312SfnrswfhQIqQ%2FLcDcPhv4x0uVO3Jt1DZ%2B5BZr7LN6mt%2FKQN1KF%2BzeoG6bp0%2FF7Y1iJOamLT77hOBRqZ52N7lA8ERDYLuaAlqFuOad5yH6l%2BcMoBqJpuEgluKmJh1%2FXqW4QMHfsoHKpUCcUua%2FlTmfkpR%2BNj%2FMhwfBPUIONMlJzF9U9BETSExpgdUMIVvQ5Sl1upldE%2B9dQbnstTRPrWlfO8fdwsCdADDYkbYl%2Ff0hXjt3JkLCpIP8%2BnNKTlMbNgH3%2F0UTV6rAskjQmsJi9IHmUXECn%2BRKHVHugdLTpwSpC2B%2FTMS2zT6XGWGW%2Fn3BbkdK%2FqxFcbf%2F3a4Ejk5mw3sTXali35lkwZr6at0Dh1gIrIBRdtXdnUydkn%2F%2FLZPJYKGRpm%2Bo%2BdYCGvTs2ur3kF5OwUBM4CPBUpdn0MUg%2FK8GpeYeppzMtaGnm4ACmPNLDDXtmylB6YWou6bCPqO3zbmxwv8q6X4rQ9pIg8SRMgVdK7poHloBzqmKOcMyzAACCOZmplqPWXmWuU0U%2BxQ1BHU1JdKqGd9CQvU3wCOJh8ydQs2YpbmgZU%2FF%2BHb5A%2Fv%2FOmgAvH%2B54AzRyDYwdQcg7j8Le9jIR1l18DiwJgkeBtk3cpzjl0KMwxeLE0wY6pgGxcHisHskVgcaLNH%2Bdzo1WHwGNhG4dq4B8tGpiBjYywHQgZZ%2FIe4sLyVZu%2FN6Q2SV9OIwVTlrOAlB4aVbbofliB9%2B%2BG%2BHuc36fsBQPRntkGOvcSt4bE22j1ai7OLmNJw0qVrm69i9GdTcYKx%2F9apNPLUs2p%2Fl9XyEnqS2tENMsVFx3muiZ9pfT2LbRxvZa4xTYirrcFoVZENFvI8Xd%2FyQQhVrS%2B58q&X-Amz-Signature=b918309aa8b7d845d9c7d6e7bb072ae97a1ee8a50cc14ecaf83705703c8b7a4a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663YHM7I3S%2F20260804%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260804T012402Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDkaCXVzLXdlc3QtMiJGMEQCIHg%2FylMgfSD93mXDBYutzWGdxlZEh3sBZzl4EmDZIEX2AiBMGBarQS2N9Xtvt1hLqpazz3XDKgk00Q9iR%2BjQ%2Fqg%2BJCr%2FAwgCEAAaDDYzNzQyMzE4MzgwNSIMQb5%2F7jI0%2Fk6km9LaKtwDUG10Mc7312SfnrswfhQIqQ%2FLcDcPhv4x0uVO3Jt1DZ%2B5BZr7LN6mt%2FKQN1KF%2BzeoG6bp0%2FF7Y1iJOamLT77hOBRqZ52N7lA8ERDYLuaAlqFuOad5yH6l%2BcMoBqJpuEgluKmJh1%2FXqW4QMHfsoHKpUCcUua%2FlTmfkpR%2BNj%2FMhwfBPUIONMlJzF9U9BETSExpgdUMIVvQ5Sl1upldE%2B9dQbnstTRPrWlfO8fdwsCdADDYkbYl%2Ff0hXjt3JkLCpIP8%2BnNKTlMbNgH3%2F0UTV6rAskjQmsJi9IHmUXECn%2BRKHVHugdLTpwSpC2B%2FTMS2zT6XGWGW%2Fn3BbkdK%2FqxFcbf%2F3a4Ejk5mw3sTXali35lkwZr6at0Dh1gIrIBRdtXdnUydkn%2F%2FLZPJYKGRpm%2Bo%2BdYCGvTs2ur3kF5OwUBM4CPBUpdn0MUg%2FK8GpeYeppzMtaGnm4ACmPNLDDXtmylB6YWou6bCPqO3zbmxwv8q6X4rQ9pIg8SRMgVdK7poHloBzqmKOcMyzAACCOZmplqPWXmWuU0U%2BxQ1BHU1JdKqGd9CQvU3wCOJh8ydQs2YpbmgZU%2FF%2BHb5A%2Fv%2FOmgAvH%2B54AzRyDYwdQcg7j8Le9jIR1l18DiwJgkeBtk3cpzjl0KMwxeLE0wY6pgGxcHisHskVgcaLNH%2Bdzo1WHwGNhG4dq4B8tGpiBjYywHQgZZ%2FIe4sLyVZu%2FN6Q2SV9OIwVTlrOAlB4aVbbofliB9%2B%2BG%2BHuc36fsBQPRntkGOvcSt4bE22j1ai7OLmNJw0qVrm69i9GdTcYKx%2F9apNPLUs2p%2Fl9XyEnqS2tENMsVFx3muiZ9pfT2LbRxvZa4xTYirrcFoVZENFvI8Xd%2FyQQhVrS%2B58q&X-Amz-Signature=7645e19966931dc0a01ac7e09ab1261e0ae41daa90ec69c051c75d1d8cca502f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663YHM7I3S%2F20260804%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260804T012402Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDkaCXVzLXdlc3QtMiJGMEQCIHg%2FylMgfSD93mXDBYutzWGdxlZEh3sBZzl4EmDZIEX2AiBMGBarQS2N9Xtvt1hLqpazz3XDKgk00Q9iR%2BjQ%2Fqg%2BJCr%2FAwgCEAAaDDYzNzQyMzE4MzgwNSIMQb5%2F7jI0%2Fk6km9LaKtwDUG10Mc7312SfnrswfhQIqQ%2FLcDcPhv4x0uVO3Jt1DZ%2B5BZr7LN6mt%2FKQN1KF%2BzeoG6bp0%2FF7Y1iJOamLT77hOBRqZ52N7lA8ERDYLuaAlqFuOad5yH6l%2BcMoBqJpuEgluKmJh1%2FXqW4QMHfsoHKpUCcUua%2FlTmfkpR%2BNj%2FMhwfBPUIONMlJzF9U9BETSExpgdUMIVvQ5Sl1upldE%2B9dQbnstTRPrWlfO8fdwsCdADDYkbYl%2Ff0hXjt3JkLCpIP8%2BnNKTlMbNgH3%2F0UTV6rAskjQmsJi9IHmUXECn%2BRKHVHugdLTpwSpC2B%2FTMS2zT6XGWGW%2Fn3BbkdK%2FqxFcbf%2F3a4Ejk5mw3sTXali35lkwZr6at0Dh1gIrIBRdtXdnUydkn%2F%2FLZPJYKGRpm%2Bo%2BdYCGvTs2ur3kF5OwUBM4CPBUpdn0MUg%2FK8GpeYeppzMtaGnm4ACmPNLDDXtmylB6YWou6bCPqO3zbmxwv8q6X4rQ9pIg8SRMgVdK7poHloBzqmKOcMyzAACCOZmplqPWXmWuU0U%2BxQ1BHU1JdKqGd9CQvU3wCOJh8ydQs2YpbmgZU%2FF%2BHb5A%2Fv%2FOmgAvH%2B54AzRyDYwdQcg7j8Le9jIR1l18DiwJgkeBtk3cpzjl0KMwxeLE0wY6pgGxcHisHskVgcaLNH%2Bdzo1WHwGNhG4dq4B8tGpiBjYywHQgZZ%2FIe4sLyVZu%2FN6Q2SV9OIwVTlrOAlB4aVbbofliB9%2B%2BG%2BHuc36fsBQPRntkGOvcSt4bE22j1ai7OLmNJw0qVrm69i9GdTcYKx%2F9apNPLUs2p%2Fl9XyEnqS2tENMsVFx3muiZ9pfT2LbRxvZa4xTYirrcFoVZENFvI8Xd%2FyQQhVrS%2B58q&X-Amz-Signature=397c003f44fd7e1254184aa7e26e09fb7a01dabc3a7c5ab029d3026927cd90d1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663YHM7I3S%2F20260804%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260804T012402Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDkaCXVzLXdlc3QtMiJGMEQCIHg%2FylMgfSD93mXDBYutzWGdxlZEh3sBZzl4EmDZIEX2AiBMGBarQS2N9Xtvt1hLqpazz3XDKgk00Q9iR%2BjQ%2Fqg%2BJCr%2FAwgCEAAaDDYzNzQyMzE4MzgwNSIMQb5%2F7jI0%2Fk6km9LaKtwDUG10Mc7312SfnrswfhQIqQ%2FLcDcPhv4x0uVO3Jt1DZ%2B5BZr7LN6mt%2FKQN1KF%2BzeoG6bp0%2FF7Y1iJOamLT77hOBRqZ52N7lA8ERDYLuaAlqFuOad5yH6l%2BcMoBqJpuEgluKmJh1%2FXqW4QMHfsoHKpUCcUua%2FlTmfkpR%2BNj%2FMhwfBPUIONMlJzF9U9BETSExpgdUMIVvQ5Sl1upldE%2B9dQbnstTRPrWlfO8fdwsCdADDYkbYl%2Ff0hXjt3JkLCpIP8%2BnNKTlMbNgH3%2F0UTV6rAskjQmsJi9IHmUXECn%2BRKHVHugdLTpwSpC2B%2FTMS2zT6XGWGW%2Fn3BbkdK%2FqxFcbf%2F3a4Ejk5mw3sTXali35lkwZr6at0Dh1gIrIBRdtXdnUydkn%2F%2FLZPJYKGRpm%2Bo%2BdYCGvTs2ur3kF5OwUBM4CPBUpdn0MUg%2FK8GpeYeppzMtaGnm4ACmPNLDDXtmylB6YWou6bCPqO3zbmxwv8q6X4rQ9pIg8SRMgVdK7poHloBzqmKOcMyzAACCOZmplqPWXmWuU0U%2BxQ1BHU1JdKqGd9CQvU3wCOJh8ydQs2YpbmgZU%2FF%2BHb5A%2Fv%2FOmgAvH%2B54AzRyDYwdQcg7j8Le9jIR1l18DiwJgkeBtk3cpzjl0KMwxeLE0wY6pgGxcHisHskVgcaLNH%2Bdzo1WHwGNhG4dq4B8tGpiBjYywHQgZZ%2FIe4sLyVZu%2FN6Q2SV9OIwVTlrOAlB4aVbbofliB9%2B%2BG%2BHuc36fsBQPRntkGOvcSt4bE22j1ai7OLmNJw0qVrm69i9GdTcYKx%2F9apNPLUs2p%2Fl9XyEnqS2tENMsVFx3muiZ9pfT2LbRxvZa4xTYirrcFoVZENFvI8Xd%2FyQQhVrS%2B58q&X-Amz-Signature=6dd99b9fb45fb1030745a1b81991861ac7866cf8235fbe50a9046fabcafded4a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
