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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TPRXM3QK%2F20261004%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261004T031929Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQC20WCrcBLsE5Tt1m%2FH5v1ZYcbpQ%2B9p9aWkwuOm3BKYrgIhALEjizT72gBR9qT4WmrKp%2BCJ67f0bEocRk%2BWkcbLUUTVKogECLr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxHKsICUi%2BFSfN%2FxSgq3APJV9QWKYmspcLz5xdp%2B9wprh%2BqMuhmHAhkY69uTx06Si7EJGs2fpFVmTn27CmKMp9wzsM6u1kkW4I7N2cToQQocPZ6%2F96VMqsMJB9YyZoWEbTvARhsNprLEfvcABzoVh7wYlu5oRwlr%2Fmi5b2IoTsf8bWtlKBECl3goXlVPAcjkw%2FYPja5RSfLkuYGl0vG0SVALt7oqn%2FPuQ%2Bhdk7u7716bGkFq4jjIe3EctEzXSpUw1%2FuSvPgyX%2BN76wRT%2BlBgx6ZmmpxPmHaPZE7gyczlWoicawhgUrWTeFG5Ga7aSM2V7%2B60WpvX6Zmo82xXaHMxg35096XOBqxFo8xdnXpO9jFzyzWyaQmDUOFExUuhK%2BZJ4jlOln6uFarf4tY%2BkFVTU62h0FT6%2B0Unhazttt3nqG6Ks0tdFfU3u7uvrDjdJ%2Bn%2Fnp%2Fx%2FsBx8IsQX%2BK%2BuQxCsU%2Bm7b7RMtwUxk9f0o6lIiOA%2BAzVcYsVJLy46M1FeS5vtAT9IsZyFKHc9PDA%2F4hcvEAMcsrqgz8AfiZ2%2Be%2BiMXD6c2Ql6bSrKCUm4FagDlW9B5rIy4l%2F28J1GGIwviTxzyhpxpX17C%2BUKi2Z8UVuHilms2Jh%2Fr%2FmNUMW4QBAkY4cGrrBNcQunMuZA3zATC35YbWBjqkAUMDv5rWCudRwP%2F3ZVWZaGG7VDxd%2B9%2FKqSlqrvxCgth1U5ZME6DdIr6pUN5F%2BMusY3vNgSE5ZhR4Hok%2FEslvSc0tc8xjBE6%2FYGMguEpXy9qdIMz0Lbqwt4Q5CD%2BmU6PaAhbO5Uw0GZJA%2Bves9Luf3GG8uCN3h22wJ%2BLg%2BgqqA%2FK8dsu9qEsvgWjn%2FYHZidme5bLyNooXYUfWg4oX91t35h9e0bwJ&X-Amz-Signature=2d4f682fbf86bf6829b81ab29db4f52ab12a307092572284de7e476730d023e1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TPRXM3QK%2F20261004%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261004T031929Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQC20WCrcBLsE5Tt1m%2FH5v1ZYcbpQ%2B9p9aWkwuOm3BKYrgIhALEjizT72gBR9qT4WmrKp%2BCJ67f0bEocRk%2BWkcbLUUTVKogECLr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxHKsICUi%2BFSfN%2FxSgq3APJV9QWKYmspcLz5xdp%2B9wprh%2BqMuhmHAhkY69uTx06Si7EJGs2fpFVmTn27CmKMp9wzsM6u1kkW4I7N2cToQQocPZ6%2F96VMqsMJB9YyZoWEbTvARhsNprLEfvcABzoVh7wYlu5oRwlr%2Fmi5b2IoTsf8bWtlKBECl3goXlVPAcjkw%2FYPja5RSfLkuYGl0vG0SVALt7oqn%2FPuQ%2Bhdk7u7716bGkFq4jjIe3EctEzXSpUw1%2FuSvPgyX%2BN76wRT%2BlBgx6ZmmpxPmHaPZE7gyczlWoicawhgUrWTeFG5Ga7aSM2V7%2B60WpvX6Zmo82xXaHMxg35096XOBqxFo8xdnXpO9jFzyzWyaQmDUOFExUuhK%2BZJ4jlOln6uFarf4tY%2BkFVTU62h0FT6%2B0Unhazttt3nqG6Ks0tdFfU3u7uvrDjdJ%2Bn%2Fnp%2Fx%2FsBx8IsQX%2BK%2BuQxCsU%2Bm7b7RMtwUxk9f0o6lIiOA%2BAzVcYsVJLy46M1FeS5vtAT9IsZyFKHc9PDA%2F4hcvEAMcsrqgz8AfiZ2%2Be%2BiMXD6c2Ql6bSrKCUm4FagDlW9B5rIy4l%2F28J1GGIwviTxzyhpxpX17C%2BUKi2Z8UVuHilms2Jh%2Fr%2FmNUMW4QBAkY4cGrrBNcQunMuZA3zATC35YbWBjqkAUMDv5rWCudRwP%2F3ZVWZaGG7VDxd%2B9%2FKqSlqrvxCgth1U5ZME6DdIr6pUN5F%2BMusY3vNgSE5ZhR4Hok%2FEslvSc0tc8xjBE6%2FYGMguEpXy9qdIMz0Lbqwt4Q5CD%2BmU6PaAhbO5Uw0GZJA%2Bves9Luf3GG8uCN3h22wJ%2BLg%2BgqqA%2FK8dsu9qEsvgWjn%2FYHZidme5bLyNooXYUfWg4oX91t35h9e0bwJ&X-Amz-Signature=ec88fa8c84c8344f42d4846a8268488d4ac4cc819ff8f6317f2ee61c2295cfcd&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TPRXM3QK%2F20261004%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261004T031929Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQC20WCrcBLsE5Tt1m%2FH5v1ZYcbpQ%2B9p9aWkwuOm3BKYrgIhALEjizT72gBR9qT4WmrKp%2BCJ67f0bEocRk%2BWkcbLUUTVKogECLr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxHKsICUi%2BFSfN%2FxSgq3APJV9QWKYmspcLz5xdp%2B9wprh%2BqMuhmHAhkY69uTx06Si7EJGs2fpFVmTn27CmKMp9wzsM6u1kkW4I7N2cToQQocPZ6%2F96VMqsMJB9YyZoWEbTvARhsNprLEfvcABzoVh7wYlu5oRwlr%2Fmi5b2IoTsf8bWtlKBECl3goXlVPAcjkw%2FYPja5RSfLkuYGl0vG0SVALt7oqn%2FPuQ%2Bhdk7u7716bGkFq4jjIe3EctEzXSpUw1%2FuSvPgyX%2BN76wRT%2BlBgx6ZmmpxPmHaPZE7gyczlWoicawhgUrWTeFG5Ga7aSM2V7%2B60WpvX6Zmo82xXaHMxg35096XOBqxFo8xdnXpO9jFzyzWyaQmDUOFExUuhK%2BZJ4jlOln6uFarf4tY%2BkFVTU62h0FT6%2B0Unhazttt3nqG6Ks0tdFfU3u7uvrDjdJ%2Bn%2Fnp%2Fx%2FsBx8IsQX%2BK%2BuQxCsU%2Bm7b7RMtwUxk9f0o6lIiOA%2BAzVcYsVJLy46M1FeS5vtAT9IsZyFKHc9PDA%2F4hcvEAMcsrqgz8AfiZ2%2Be%2BiMXD6c2Ql6bSrKCUm4FagDlW9B5rIy4l%2F28J1GGIwviTxzyhpxpX17C%2BUKi2Z8UVuHilms2Jh%2Fr%2FmNUMW4QBAkY4cGrrBNcQunMuZA3zATC35YbWBjqkAUMDv5rWCudRwP%2F3ZVWZaGG7VDxd%2B9%2FKqSlqrvxCgth1U5ZME6DdIr6pUN5F%2BMusY3vNgSE5ZhR4Hok%2FEslvSc0tc8xjBE6%2FYGMguEpXy9qdIMz0Lbqwt4Q5CD%2BmU6PaAhbO5Uw0GZJA%2Bves9Luf3GG8uCN3h22wJ%2BLg%2BgqqA%2FK8dsu9qEsvgWjn%2FYHZidme5bLyNooXYUfWg4oX91t35h9e0bwJ&X-Amz-Signature=0b4b107d42046b7f5e91fc0d56d6260b33143702f7c744065aaf34b789502fc4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TPRXM3QK%2F20261004%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261004T031929Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQC20WCrcBLsE5Tt1m%2FH5v1ZYcbpQ%2B9p9aWkwuOm3BKYrgIhALEjizT72gBR9qT4WmrKp%2BCJ67f0bEocRk%2BWkcbLUUTVKogECLr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxHKsICUi%2BFSfN%2FxSgq3APJV9QWKYmspcLz5xdp%2B9wprh%2BqMuhmHAhkY69uTx06Si7EJGs2fpFVmTn27CmKMp9wzsM6u1kkW4I7N2cToQQocPZ6%2F96VMqsMJB9YyZoWEbTvARhsNprLEfvcABzoVh7wYlu5oRwlr%2Fmi5b2IoTsf8bWtlKBECl3goXlVPAcjkw%2FYPja5RSfLkuYGl0vG0SVALt7oqn%2FPuQ%2Bhdk7u7716bGkFq4jjIe3EctEzXSpUw1%2FuSvPgyX%2BN76wRT%2BlBgx6ZmmpxPmHaPZE7gyczlWoicawhgUrWTeFG5Ga7aSM2V7%2B60WpvX6Zmo82xXaHMxg35096XOBqxFo8xdnXpO9jFzyzWyaQmDUOFExUuhK%2BZJ4jlOln6uFarf4tY%2BkFVTU62h0FT6%2B0Unhazttt3nqG6Ks0tdFfU3u7uvrDjdJ%2Bn%2Fnp%2Fx%2FsBx8IsQX%2BK%2BuQxCsU%2Bm7b7RMtwUxk9f0o6lIiOA%2BAzVcYsVJLy46M1FeS5vtAT9IsZyFKHc9PDA%2F4hcvEAMcsrqgz8AfiZ2%2Be%2BiMXD6c2Ql6bSrKCUm4FagDlW9B5rIy4l%2F28J1GGIwviTxzyhpxpX17C%2BUKi2Z8UVuHilms2Jh%2Fr%2FmNUMW4QBAkY4cGrrBNcQunMuZA3zATC35YbWBjqkAUMDv5rWCudRwP%2F3ZVWZaGG7VDxd%2B9%2FKqSlqrvxCgth1U5ZME6DdIr6pUN5F%2BMusY3vNgSE5ZhR4Hok%2FEslvSc0tc8xjBE6%2FYGMguEpXy9qdIMz0Lbqwt4Q5CD%2BmU6PaAhbO5Uw0GZJA%2Bves9Luf3GG8uCN3h22wJ%2BLg%2BgqqA%2FK8dsu9qEsvgWjn%2FYHZidme5bLyNooXYUfWg4oX91t35h9e0bwJ&X-Amz-Signature=8beede5ff0b43dc70a4f7c92ebb30073d9b08df1ed7b6ba8e454d9588f47ce81&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
