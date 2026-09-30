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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Z25BTKUF%2F20260930%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260930T213819Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDox%2BL1iIOgPl8OjZ2nKVjQ4RdwLUypYol2ki%2BX8QBdbAIgEfY1bD528FOWEhff8pzpSU7yvp6z%2BM9ktF079AE9ZuQq%2FwMIbRAAGgw2Mzc0MjMxODM4MDUiDEejznyAn6yqb1egoircAyYGu0RA7b2qJX%2BVw9XnMNIGqBi1s1Jmv6i9qWihEUSnWTW0DxRuT%2B%2BPBtBQmEcY7ZvrsBDhloiTjrLRgIn89WSHLIvp2zffyZe6%2FscqGYIbHwmPx0n61IXxUtqu%2Fh9%2BhTL6dXL6AK9CbL59OmcuvI6uDWJOfTAVB8pLPZdb5EPug7tPL8cARdgLZONh2mEmu0tDqNs5PFHxELZcw037aM30%2FMyb%2FsQCD8D8fm9wT8dvWPxaTXBcnEkum7CZNFDuRmqXpQ8ioiDUynXae%2BqhLYttFarTLNzlzOsII%2F%2B8FAZkMKQK3xv0YHP7yMwgh%2F%2BdWTdxFqp93c2jv2VN3RhvfIJLHvfLhwG0wnBN5c4LBqWWMPIW0LVL%2Bw%2Fw7vamjrWhnVa1d22QMCRO%2FL6RqvJnDirK2wYWSYCe5vfk1LQkAH9WXbvhpqUdMj0k0j7zpY6yZ27aInsDhFC8Zfe2XJ0DuQMbW1%2BrQOrJC22QAxsTwLdrVcg5Sclm3a1%2FjfAUpHxondV2GXwGtJash4tmi4mCHc4n%2FpzSFL4esfotzjEj5OXhcpll0UfWFz8dnkog3b09JbJLIfjuJovOTWzsBph8WySBDiEEk09wtRIdsQBlZ0yl4CJU4%2FfE4ZaMtxJ%2BMJzY9dUGOqUBak7j1SFX46kVJUBStqv3oD0dRtB%2B9IBtENScXt8KsSoFmW2Jz601Og1UbTK3wWQtxxViU7q8rFG7Mx2GxHnZt2U3I5gP9Pbtmk%2FcM1%2FpXUL1AhrikF9nDCnUh46fzuXefcJyZy2b6OU1bmyFPD%2BmKih3He0vx2bH%2F9wej3KqoPss4j3FMp6Ut8ztTfZEIfFvvxUUQ8bnR%2F%2B83CawsixYOtI2BAhi&X-Amz-Signature=02b63f4ffb7ae844434d6a75d4f8e17e19b451c3f9b4199866b576401c35a287&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Z25BTKUF%2F20260930%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260930T213819Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDox%2BL1iIOgPl8OjZ2nKVjQ4RdwLUypYol2ki%2BX8QBdbAIgEfY1bD528FOWEhff8pzpSU7yvp6z%2BM9ktF079AE9ZuQq%2FwMIbRAAGgw2Mzc0MjMxODM4MDUiDEejznyAn6yqb1egoircAyYGu0RA7b2qJX%2BVw9XnMNIGqBi1s1Jmv6i9qWihEUSnWTW0DxRuT%2B%2BPBtBQmEcY7ZvrsBDhloiTjrLRgIn89WSHLIvp2zffyZe6%2FscqGYIbHwmPx0n61IXxUtqu%2Fh9%2BhTL6dXL6AK9CbL59OmcuvI6uDWJOfTAVB8pLPZdb5EPug7tPL8cARdgLZONh2mEmu0tDqNs5PFHxELZcw037aM30%2FMyb%2FsQCD8D8fm9wT8dvWPxaTXBcnEkum7CZNFDuRmqXpQ8ioiDUynXae%2BqhLYttFarTLNzlzOsII%2F%2B8FAZkMKQK3xv0YHP7yMwgh%2F%2BdWTdxFqp93c2jv2VN3RhvfIJLHvfLhwG0wnBN5c4LBqWWMPIW0LVL%2Bw%2Fw7vamjrWhnVa1d22QMCRO%2FL6RqvJnDirK2wYWSYCe5vfk1LQkAH9WXbvhpqUdMj0k0j7zpY6yZ27aInsDhFC8Zfe2XJ0DuQMbW1%2BrQOrJC22QAxsTwLdrVcg5Sclm3a1%2FjfAUpHxondV2GXwGtJash4tmi4mCHc4n%2FpzSFL4esfotzjEj5OXhcpll0UfWFz8dnkog3b09JbJLIfjuJovOTWzsBph8WySBDiEEk09wtRIdsQBlZ0yl4CJU4%2FfE4ZaMtxJ%2BMJzY9dUGOqUBak7j1SFX46kVJUBStqv3oD0dRtB%2B9IBtENScXt8KsSoFmW2Jz601Og1UbTK3wWQtxxViU7q8rFG7Mx2GxHnZt2U3I5gP9Pbtmk%2FcM1%2FpXUL1AhrikF9nDCnUh46fzuXefcJyZy2b6OU1bmyFPD%2BmKih3He0vx2bH%2F9wej3KqoPss4j3FMp6Ut8ztTfZEIfFvvxUUQ8bnR%2F%2B83CawsixYOtI2BAhi&X-Amz-Signature=2350f54a0ec44179a519498be99b9edfc5d365104e72bd88d6b843b188deee76&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Z25BTKUF%2F20260930%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260930T213819Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDox%2BL1iIOgPl8OjZ2nKVjQ4RdwLUypYol2ki%2BX8QBdbAIgEfY1bD528FOWEhff8pzpSU7yvp6z%2BM9ktF079AE9ZuQq%2FwMIbRAAGgw2Mzc0MjMxODM4MDUiDEejznyAn6yqb1egoircAyYGu0RA7b2qJX%2BVw9XnMNIGqBi1s1Jmv6i9qWihEUSnWTW0DxRuT%2B%2BPBtBQmEcY7ZvrsBDhloiTjrLRgIn89WSHLIvp2zffyZe6%2FscqGYIbHwmPx0n61IXxUtqu%2Fh9%2BhTL6dXL6AK9CbL59OmcuvI6uDWJOfTAVB8pLPZdb5EPug7tPL8cARdgLZONh2mEmu0tDqNs5PFHxELZcw037aM30%2FMyb%2FsQCD8D8fm9wT8dvWPxaTXBcnEkum7CZNFDuRmqXpQ8ioiDUynXae%2BqhLYttFarTLNzlzOsII%2F%2B8FAZkMKQK3xv0YHP7yMwgh%2F%2BdWTdxFqp93c2jv2VN3RhvfIJLHvfLhwG0wnBN5c4LBqWWMPIW0LVL%2Bw%2Fw7vamjrWhnVa1d22QMCRO%2FL6RqvJnDirK2wYWSYCe5vfk1LQkAH9WXbvhpqUdMj0k0j7zpY6yZ27aInsDhFC8Zfe2XJ0DuQMbW1%2BrQOrJC22QAxsTwLdrVcg5Sclm3a1%2FjfAUpHxondV2GXwGtJash4tmi4mCHc4n%2FpzSFL4esfotzjEj5OXhcpll0UfWFz8dnkog3b09JbJLIfjuJovOTWzsBph8WySBDiEEk09wtRIdsQBlZ0yl4CJU4%2FfE4ZaMtxJ%2BMJzY9dUGOqUBak7j1SFX46kVJUBStqv3oD0dRtB%2B9IBtENScXt8KsSoFmW2Jz601Og1UbTK3wWQtxxViU7q8rFG7Mx2GxHnZt2U3I5gP9Pbtmk%2FcM1%2FpXUL1AhrikF9nDCnUh46fzuXefcJyZy2b6OU1bmyFPD%2BmKih3He0vx2bH%2F9wej3KqoPss4j3FMp6Ut8ztTfZEIfFvvxUUQ8bnR%2F%2B83CawsixYOtI2BAhi&X-Amz-Signature=7fcced40f4e17e8be2dff80aa80289b5deb96b4f83f95d5cf5c2e39bc2775bdc&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Z25BTKUF%2F20260930%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260930T213819Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDox%2BL1iIOgPl8OjZ2nKVjQ4RdwLUypYol2ki%2BX8QBdbAIgEfY1bD528FOWEhff8pzpSU7yvp6z%2BM9ktF079AE9ZuQq%2FwMIbRAAGgw2Mzc0MjMxODM4MDUiDEejznyAn6yqb1egoircAyYGu0RA7b2qJX%2BVw9XnMNIGqBi1s1Jmv6i9qWihEUSnWTW0DxRuT%2B%2BPBtBQmEcY7ZvrsBDhloiTjrLRgIn89WSHLIvp2zffyZe6%2FscqGYIbHwmPx0n61IXxUtqu%2Fh9%2BhTL6dXL6AK9CbL59OmcuvI6uDWJOfTAVB8pLPZdb5EPug7tPL8cARdgLZONh2mEmu0tDqNs5PFHxELZcw037aM30%2FMyb%2FsQCD8D8fm9wT8dvWPxaTXBcnEkum7CZNFDuRmqXpQ8ioiDUynXae%2BqhLYttFarTLNzlzOsII%2F%2B8FAZkMKQK3xv0YHP7yMwgh%2F%2BdWTdxFqp93c2jv2VN3RhvfIJLHvfLhwG0wnBN5c4LBqWWMPIW0LVL%2Bw%2Fw7vamjrWhnVa1d22QMCRO%2FL6RqvJnDirK2wYWSYCe5vfk1LQkAH9WXbvhpqUdMj0k0j7zpY6yZ27aInsDhFC8Zfe2XJ0DuQMbW1%2BrQOrJC22QAxsTwLdrVcg5Sclm3a1%2FjfAUpHxondV2GXwGtJash4tmi4mCHc4n%2FpzSFL4esfotzjEj5OXhcpll0UfWFz8dnkog3b09JbJLIfjuJovOTWzsBph8WySBDiEEk09wtRIdsQBlZ0yl4CJU4%2FfE4ZaMtxJ%2BMJzY9dUGOqUBak7j1SFX46kVJUBStqv3oD0dRtB%2B9IBtENScXt8KsSoFmW2Jz601Og1UbTK3wWQtxxViU7q8rFG7Mx2GxHnZt2U3I5gP9Pbtmk%2FcM1%2FpXUL1AhrikF9nDCnUh46fzuXefcJyZy2b6OU1bmyFPD%2BmKih3He0vx2bH%2F9wej3KqoPss4j3FMp6Ut8ztTfZEIfFvvxUUQ8bnR%2F%2B83CawsixYOtI2BAhi&X-Amz-Signature=3cbb6756278f8fd6bd1e2268a2166b85fabc20fe2fbad8a974b91ab273ef5c6d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
