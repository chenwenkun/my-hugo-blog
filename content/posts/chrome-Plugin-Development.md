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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666BBSZHFG%2F20260812%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260812T010111Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIE5Y7IWpRaO%2BuTmiSG1aXU48xGNWAAIv%2B7KXIJF2yDshAiBJhV0Tq%2FyiAbYBfpx8cAadfivU5zYnw8%2Fdf2nYh%2FpgcyqIBAjB%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMZC904eHMfuMct1r0KtwDbcRQiQCBN81XNwArRqHXRJHBH%2B2dT4xvByVDmtdezGDbyXqIypat19cgV14wN7cQk9lFxvA5y9ZLycoj2L5kBnEGn2QFEKJz3YfhXOI%2FSVBSbDzuzbehnOSoIMbq07PO0QocThog4EchMAUPAZbS2X7P47aIPq4Xo8Zl8DNaichr017N%2FMD59eEc5hLcpNir8%2BLUeomX4bnjLFRCOZgBbtGpNGxDuf4Y8V8fLwcmYqaJDq8uYywnYnj%2FazymEk3zsYV6XLTXUBxWhI72kIGs6AKmWYtjuf4LsyQ67wYCgVJJXmsS1yKnsMLpFk%2BFHQXgx1xoUhzkHncz8Rjll5eE0U7kzyr07bhXcJwT%2BJG%2B9BGwk2DSAv5vKjF49DZ4PxfJAtZi7vSISRlK3xyOcq1RbGpqOvlbZ67GNx5dgs2tNkpSh5d1lmwUrM9D3EiF4DpQNTZZ5TFvk6yQ%2B0CPAAavKoyQrJF%2F4EzB4L95FLHkRgW4kItigRqzPrpZhwrSTDuTrQnvQYwJ4GGUe6WaoZTzegn4AP4dp1nPxBu8Yarq%2FnTq3En3a7zRyxOWNk1mTHvB5G2dy2siAe2V9H4pTH%2BnqbaDEY9fW3eqfK%2FQv6uY%2FSnuTKZfttZJwPaBXUow0enu0wY6pgF0z62AUoCgpUDQpmIwQE2PPnWx7FNpMgo%2FQAC7hKqlC8gICXteE2LfVrsM5EtkVhuuf3Hows0p5iVINTdmD%2FxQX7%2Bc9cxaAGer%2B9lKTBdQCzybQ9uKAb3Aty4RDwlDT9%2B911fdr%2BOTwfoI7zj2PXwrwt5gLBmBv40p3kn75SPS9Zzt1ah1QoMfui6bfxT1NTxZxAW5yiZU71UYVwQzgZ%2BEBYhmE8ub&X-Amz-Signature=95f07a0e0d7960eb648664d060d4a01b571f48179ea1a9bef7dccc195caba588&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666BBSZHFG%2F20260812%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260812T010111Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIE5Y7IWpRaO%2BuTmiSG1aXU48xGNWAAIv%2B7KXIJF2yDshAiBJhV0Tq%2FyiAbYBfpx8cAadfivU5zYnw8%2Fdf2nYh%2FpgcyqIBAjB%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMZC904eHMfuMct1r0KtwDbcRQiQCBN81XNwArRqHXRJHBH%2B2dT4xvByVDmtdezGDbyXqIypat19cgV14wN7cQk9lFxvA5y9ZLycoj2L5kBnEGn2QFEKJz3YfhXOI%2FSVBSbDzuzbehnOSoIMbq07PO0QocThog4EchMAUPAZbS2X7P47aIPq4Xo8Zl8DNaichr017N%2FMD59eEc5hLcpNir8%2BLUeomX4bnjLFRCOZgBbtGpNGxDuf4Y8V8fLwcmYqaJDq8uYywnYnj%2FazymEk3zsYV6XLTXUBxWhI72kIGs6AKmWYtjuf4LsyQ67wYCgVJJXmsS1yKnsMLpFk%2BFHQXgx1xoUhzkHncz8Rjll5eE0U7kzyr07bhXcJwT%2BJG%2B9BGwk2DSAv5vKjF49DZ4PxfJAtZi7vSISRlK3xyOcq1RbGpqOvlbZ67GNx5dgs2tNkpSh5d1lmwUrM9D3EiF4DpQNTZZ5TFvk6yQ%2B0CPAAavKoyQrJF%2F4EzB4L95FLHkRgW4kItigRqzPrpZhwrSTDuTrQnvQYwJ4GGUe6WaoZTzegn4AP4dp1nPxBu8Yarq%2FnTq3En3a7zRyxOWNk1mTHvB5G2dy2siAe2V9H4pTH%2BnqbaDEY9fW3eqfK%2FQv6uY%2FSnuTKZfttZJwPaBXUow0enu0wY6pgF0z62AUoCgpUDQpmIwQE2PPnWx7FNpMgo%2FQAC7hKqlC8gICXteE2LfVrsM5EtkVhuuf3Hows0p5iVINTdmD%2FxQX7%2Bc9cxaAGer%2B9lKTBdQCzybQ9uKAb3Aty4RDwlDT9%2B911fdr%2BOTwfoI7zj2PXwrwt5gLBmBv40p3kn75SPS9Zzt1ah1QoMfui6bfxT1NTxZxAW5yiZU71UYVwQzgZ%2BEBYhmE8ub&X-Amz-Signature=506df5a5e47669ecafb7b68e92724e096ba61e709fecbe9cf8cab02d5d0583c2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666BBSZHFG%2F20260812%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260812T010111Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIE5Y7IWpRaO%2BuTmiSG1aXU48xGNWAAIv%2B7KXIJF2yDshAiBJhV0Tq%2FyiAbYBfpx8cAadfivU5zYnw8%2Fdf2nYh%2FpgcyqIBAjB%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMZC904eHMfuMct1r0KtwDbcRQiQCBN81XNwArRqHXRJHBH%2B2dT4xvByVDmtdezGDbyXqIypat19cgV14wN7cQk9lFxvA5y9ZLycoj2L5kBnEGn2QFEKJz3YfhXOI%2FSVBSbDzuzbehnOSoIMbq07PO0QocThog4EchMAUPAZbS2X7P47aIPq4Xo8Zl8DNaichr017N%2FMD59eEc5hLcpNir8%2BLUeomX4bnjLFRCOZgBbtGpNGxDuf4Y8V8fLwcmYqaJDq8uYywnYnj%2FazymEk3zsYV6XLTXUBxWhI72kIGs6AKmWYtjuf4LsyQ67wYCgVJJXmsS1yKnsMLpFk%2BFHQXgx1xoUhzkHncz8Rjll5eE0U7kzyr07bhXcJwT%2BJG%2B9BGwk2DSAv5vKjF49DZ4PxfJAtZi7vSISRlK3xyOcq1RbGpqOvlbZ67GNx5dgs2tNkpSh5d1lmwUrM9D3EiF4DpQNTZZ5TFvk6yQ%2B0CPAAavKoyQrJF%2F4EzB4L95FLHkRgW4kItigRqzPrpZhwrSTDuTrQnvQYwJ4GGUe6WaoZTzegn4AP4dp1nPxBu8Yarq%2FnTq3En3a7zRyxOWNk1mTHvB5G2dy2siAe2V9H4pTH%2BnqbaDEY9fW3eqfK%2FQv6uY%2FSnuTKZfttZJwPaBXUow0enu0wY6pgF0z62AUoCgpUDQpmIwQE2PPnWx7FNpMgo%2FQAC7hKqlC8gICXteE2LfVrsM5EtkVhuuf3Hows0p5iVINTdmD%2FxQX7%2Bc9cxaAGer%2B9lKTBdQCzybQ9uKAb3Aty4RDwlDT9%2B911fdr%2BOTwfoI7zj2PXwrwt5gLBmBv40p3kn75SPS9Zzt1ah1QoMfui6bfxT1NTxZxAW5yiZU71UYVwQzgZ%2BEBYhmE8ub&X-Amz-Signature=fc6a5809d64a0cc635e758aba59b56967a7b20ddc1ebf9bf3dc5da8cd475d819&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666BBSZHFG%2F20260812%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260812T010111Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIE5Y7IWpRaO%2BuTmiSG1aXU48xGNWAAIv%2B7KXIJF2yDshAiBJhV0Tq%2FyiAbYBfpx8cAadfivU5zYnw8%2Fdf2nYh%2FpgcyqIBAjB%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMZC904eHMfuMct1r0KtwDbcRQiQCBN81XNwArRqHXRJHBH%2B2dT4xvByVDmtdezGDbyXqIypat19cgV14wN7cQk9lFxvA5y9ZLycoj2L5kBnEGn2QFEKJz3YfhXOI%2FSVBSbDzuzbehnOSoIMbq07PO0QocThog4EchMAUPAZbS2X7P47aIPq4Xo8Zl8DNaichr017N%2FMD59eEc5hLcpNir8%2BLUeomX4bnjLFRCOZgBbtGpNGxDuf4Y8V8fLwcmYqaJDq8uYywnYnj%2FazymEk3zsYV6XLTXUBxWhI72kIGs6AKmWYtjuf4LsyQ67wYCgVJJXmsS1yKnsMLpFk%2BFHQXgx1xoUhzkHncz8Rjll5eE0U7kzyr07bhXcJwT%2BJG%2B9BGwk2DSAv5vKjF49DZ4PxfJAtZi7vSISRlK3xyOcq1RbGpqOvlbZ67GNx5dgs2tNkpSh5d1lmwUrM9D3EiF4DpQNTZZ5TFvk6yQ%2B0CPAAavKoyQrJF%2F4EzB4L95FLHkRgW4kItigRqzPrpZhwrSTDuTrQnvQYwJ4GGUe6WaoZTzegn4AP4dp1nPxBu8Yarq%2FnTq3En3a7zRyxOWNk1mTHvB5G2dy2siAe2V9H4pTH%2BnqbaDEY9fW3eqfK%2FQv6uY%2FSnuTKZfttZJwPaBXUow0enu0wY6pgF0z62AUoCgpUDQpmIwQE2PPnWx7FNpMgo%2FQAC7hKqlC8gICXteE2LfVrsM5EtkVhuuf3Hows0p5iVINTdmD%2FxQX7%2Bc9cxaAGer%2B9lKTBdQCzybQ9uKAb3Aty4RDwlDT9%2B911fdr%2BOTwfoI7zj2PXwrwt5gLBmBv40p3kn75SPS9Zzt1ah1QoMfui6bfxT1NTxZxAW5yiZU71UYVwQzgZ%2BEBYhmE8ub&X-Amz-Signature=c1dbe046582762abb626dc9b7c876f6273acb078c22205b743f9774e77c636c6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
