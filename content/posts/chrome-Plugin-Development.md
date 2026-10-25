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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466W73DGQAR%2F20261025%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261025T102059Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDnHYDE%2FHcA1gcufMn1GXqtvEZ%2B%2BGTh58fmvdXsf2RvJQIgBMUiCr5VmNGs2%2BsV0Pm8E67Z70zuKEVtLUZI80we5fEqiAQIt%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDHcGRZXHhetQggI9sCrcA3z9GFhNmj9hgBbqT1fqgT3yxFE%2BAy8Dv5f%2Fa3VpNxG2DsY7Te%2BmFzBocWkF5mctce4JjVp6Yf3Eq0FANqXNDE1s7GPHtmWXv0JXHfTAIXN1Wqzz2Bp3TCgOx2hQL1Cn3Vv9zBq0jCqrk9k%2Fl2lpCBDgBmZ8ADSfjvwL7G8uAHoToZ9pA1GLySGrT05zQ9THZJpKukbZKrvisBkTsU5ZkEUoFWzaICZUv1Fj1ffnbyFd5DWSj3MqY4Xb39wNrwdwzYn7qBJQof5QFNvlR2pLuugsOofKYI%2FDL5sLRgCmr7S1eu2mTHQ3YW0TEKHKtMYL8Ju8gn3j06c4XZ6tAkTKUaqJ22Oeb%2BfrfjVBvsIS9YbLbOCAzc5DDD%2FdIpF3LeMl1470DaGVe%2FJ%2F3RBCvAFmzqACT%2F7%2BNlNqpsYLTy1ynnzTPt6FQriQ9sqNgaL1EDH4eFuRbWVl7dpwtwSgWtyw1j0UlobLU8dWDXsfyZZF8kbdIrZneJFhbugzYEOKuzeYZAaapagctSjueGieXGyNmgnwUd%2B0m7FvcwWO8lUWEHHQ3nvFV7e6EfHblVfCiX0TXeWABtGG56xFNcRxbqG5jzJdkxL%2FvOXd5A2CMalaCiZ26FBhqREfSWpP2IRcMIO09tYGOqUBwiIQb3eJau2L0kt%2BPsYpEHIdGzDMUpEji%2F3%2BQy%2FwAAhNWuaYOP0go1u4N9vRx86dC0uZW7tsCs1Laztxhb2%2FEb0Te3HKhmN1vQdzLMPI7HxuOdF6ohA16obVKV0spyCf3CTG8OXdoLd%2FwVEDPCZIEghGf8DDe8KNxcfg5RVU2ybv%2FSi4iiAzZsG5wdZatnpeUN%2FZfYkd3FK1FKI4%2BSmxJNqwrQok&X-Amz-Signature=7826ae443b01e8acd3e9c0c2389c6d54c127fdf8e53ff7eda269b63da73654fc&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466W73DGQAR%2F20261025%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261025T102059Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDnHYDE%2FHcA1gcufMn1GXqtvEZ%2B%2BGTh58fmvdXsf2RvJQIgBMUiCr5VmNGs2%2BsV0Pm8E67Z70zuKEVtLUZI80we5fEqiAQIt%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDHcGRZXHhetQggI9sCrcA3z9GFhNmj9hgBbqT1fqgT3yxFE%2BAy8Dv5f%2Fa3VpNxG2DsY7Te%2BmFzBocWkF5mctce4JjVp6Yf3Eq0FANqXNDE1s7GPHtmWXv0JXHfTAIXN1Wqzz2Bp3TCgOx2hQL1Cn3Vv9zBq0jCqrk9k%2Fl2lpCBDgBmZ8ADSfjvwL7G8uAHoToZ9pA1GLySGrT05zQ9THZJpKukbZKrvisBkTsU5ZkEUoFWzaICZUv1Fj1ffnbyFd5DWSj3MqY4Xb39wNrwdwzYn7qBJQof5QFNvlR2pLuugsOofKYI%2FDL5sLRgCmr7S1eu2mTHQ3YW0TEKHKtMYL8Ju8gn3j06c4XZ6tAkTKUaqJ22Oeb%2BfrfjVBvsIS9YbLbOCAzc5DDD%2FdIpF3LeMl1470DaGVe%2FJ%2F3RBCvAFmzqACT%2F7%2BNlNqpsYLTy1ynnzTPt6FQriQ9sqNgaL1EDH4eFuRbWVl7dpwtwSgWtyw1j0UlobLU8dWDXsfyZZF8kbdIrZneJFhbugzYEOKuzeYZAaapagctSjueGieXGyNmgnwUd%2B0m7FvcwWO8lUWEHHQ3nvFV7e6EfHblVfCiX0TXeWABtGG56xFNcRxbqG5jzJdkxL%2FvOXd5A2CMalaCiZ26FBhqREfSWpP2IRcMIO09tYGOqUBwiIQb3eJau2L0kt%2BPsYpEHIdGzDMUpEji%2F3%2BQy%2FwAAhNWuaYOP0go1u4N9vRx86dC0uZW7tsCs1Laztxhb2%2FEb0Te3HKhmN1vQdzLMPI7HxuOdF6ohA16obVKV0spyCf3CTG8OXdoLd%2FwVEDPCZIEghGf8DDe8KNxcfg5RVU2ybv%2FSi4iiAzZsG5wdZatnpeUN%2FZfYkd3FK1FKI4%2BSmxJNqwrQok&X-Amz-Signature=7e653635e0e662d96c93618d3a7bbe520a1d48ef8dcbd9e12fa2a9ea075c2afa&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466W73DGQAR%2F20261025%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261025T102059Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDnHYDE%2FHcA1gcufMn1GXqtvEZ%2B%2BGTh58fmvdXsf2RvJQIgBMUiCr5VmNGs2%2BsV0Pm8E67Z70zuKEVtLUZI80we5fEqiAQIt%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDHcGRZXHhetQggI9sCrcA3z9GFhNmj9hgBbqT1fqgT3yxFE%2BAy8Dv5f%2Fa3VpNxG2DsY7Te%2BmFzBocWkF5mctce4JjVp6Yf3Eq0FANqXNDE1s7GPHtmWXv0JXHfTAIXN1Wqzz2Bp3TCgOx2hQL1Cn3Vv9zBq0jCqrk9k%2Fl2lpCBDgBmZ8ADSfjvwL7G8uAHoToZ9pA1GLySGrT05zQ9THZJpKukbZKrvisBkTsU5ZkEUoFWzaICZUv1Fj1ffnbyFd5DWSj3MqY4Xb39wNrwdwzYn7qBJQof5QFNvlR2pLuugsOofKYI%2FDL5sLRgCmr7S1eu2mTHQ3YW0TEKHKtMYL8Ju8gn3j06c4XZ6tAkTKUaqJ22Oeb%2BfrfjVBvsIS9YbLbOCAzc5DDD%2FdIpF3LeMl1470DaGVe%2FJ%2F3RBCvAFmzqACT%2F7%2BNlNqpsYLTy1ynnzTPt6FQriQ9sqNgaL1EDH4eFuRbWVl7dpwtwSgWtyw1j0UlobLU8dWDXsfyZZF8kbdIrZneJFhbugzYEOKuzeYZAaapagctSjueGieXGyNmgnwUd%2B0m7FvcwWO8lUWEHHQ3nvFV7e6EfHblVfCiX0TXeWABtGG56xFNcRxbqG5jzJdkxL%2FvOXd5A2CMalaCiZ26FBhqREfSWpP2IRcMIO09tYGOqUBwiIQb3eJau2L0kt%2BPsYpEHIdGzDMUpEji%2F3%2BQy%2FwAAhNWuaYOP0go1u4N9vRx86dC0uZW7tsCs1Laztxhb2%2FEb0Te3HKhmN1vQdzLMPI7HxuOdF6ohA16obVKV0spyCf3CTG8OXdoLd%2FwVEDPCZIEghGf8DDe8KNxcfg5RVU2ybv%2FSi4iiAzZsG5wdZatnpeUN%2FZfYkd3FK1FKI4%2BSmxJNqwrQok&X-Amz-Signature=4f99319e41aeb543310735098bbee114954fff41924ab99a48ecbc2d1c115b17&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466W73DGQAR%2F20261025%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261025T102059Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDnHYDE%2FHcA1gcufMn1GXqtvEZ%2B%2BGTh58fmvdXsf2RvJQIgBMUiCr5VmNGs2%2BsV0Pm8E67Z70zuKEVtLUZI80we5fEqiAQIt%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDHcGRZXHhetQggI9sCrcA3z9GFhNmj9hgBbqT1fqgT3yxFE%2BAy8Dv5f%2Fa3VpNxG2DsY7Te%2BmFzBocWkF5mctce4JjVp6Yf3Eq0FANqXNDE1s7GPHtmWXv0JXHfTAIXN1Wqzz2Bp3TCgOx2hQL1Cn3Vv9zBq0jCqrk9k%2Fl2lpCBDgBmZ8ADSfjvwL7G8uAHoToZ9pA1GLySGrT05zQ9THZJpKukbZKrvisBkTsU5ZkEUoFWzaICZUv1Fj1ffnbyFd5DWSj3MqY4Xb39wNrwdwzYn7qBJQof5QFNvlR2pLuugsOofKYI%2FDL5sLRgCmr7S1eu2mTHQ3YW0TEKHKtMYL8Ju8gn3j06c4XZ6tAkTKUaqJ22Oeb%2BfrfjVBvsIS9YbLbOCAzc5DDD%2FdIpF3LeMl1470DaGVe%2FJ%2F3RBCvAFmzqACT%2F7%2BNlNqpsYLTy1ynnzTPt6FQriQ9sqNgaL1EDH4eFuRbWVl7dpwtwSgWtyw1j0UlobLU8dWDXsfyZZF8kbdIrZneJFhbugzYEOKuzeYZAaapagctSjueGieXGyNmgnwUd%2B0m7FvcwWO8lUWEHHQ3nvFV7e6EfHblVfCiX0TXeWABtGG56xFNcRxbqG5jzJdkxL%2FvOXd5A2CMalaCiZ26FBhqREfSWpP2IRcMIO09tYGOqUBwiIQb3eJau2L0kt%2BPsYpEHIdGzDMUpEji%2F3%2BQy%2FwAAhNWuaYOP0go1u4N9vRx86dC0uZW7tsCs1Laztxhb2%2FEb0Te3HKhmN1vQdzLMPI7HxuOdF6ohA16obVKV0spyCf3CTG8OXdoLd%2FwVEDPCZIEghGf8DDe8KNxcfg5RVU2ybv%2FSi4iiAzZsG5wdZatnpeUN%2FZfYkd3FK1FKI4%2BSmxJNqwrQok&X-Amz-Signature=211a9571d88de8fc3483208149526f3e8a944a8256de5e6e9d75fc883436ce61&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
