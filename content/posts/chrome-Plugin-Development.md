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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QH4AR6DK%2F20261025%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261025T200721Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFt%2FocNk5NjEHBb2WKgMfRD2maJgLzpxOHNRrP3mc%2BTQAiEA6yt1zthjkUukVjlNr1BO0%2Fib%2FFG3IKb4wIEaK0XnTiIqiAQIxP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOmPtyWDGpitfuGNrCrcA9nYEl2K7Z9%2F74PCDbJ4UKXrP1ne1yNNJQDtYchK3bPyZKLCsYddPZNcHHzVfPHeoHFfJwyMUKswvpJMvEKYGqGunQwaex6YnHBjcK8mdQtw75QZndpsf7KFkKxW5oysFcLsYpDgFDUqCM%2B%2Fwh1BTtuG4gGnl2BOFE%2FAKvzSgFM%2Fl0hkjo1SkdoYGK%2BXEvcEnhit2sNI0qU4vtyqFgQ%2B894BQd%2F9p4XDfbYH0emZPtVJ4r%2BWE4cZnShI90mrqgwgdv%2FR9qWec0SXcp7ATPyTWPMksz4aAWao5bAxcQWNkFIKNp42GyfoJTCjUBXT3qZJA8s5L7sj3tuVDSgm2F%2B%2BoIVwjlWkxIvJNGYG4IyCkQi4BJIltl7KCT9xe%2BYSRimaxVi2qisPf03UvUixN5T%2FuPMdRO5DoouG4ZQ1f69sVbm1rApeX8iEbw%2BZHzQZU0ho6Iy2D3057GuEFsCmM7fOTwK1%2BytHPfBxdygT2G%2FAglxm3m%2BI384nmF9q%2F3F32b52lWlBXak83JrMjwephKD89XQ%2FdbGDB9l7GrQW68i3ma0QwfZ9BHOpgnvoedZUcfnFBYfoWEh7IUidsHN2VyVk4eSraTZfILxS8ms2ewF%2F4a3vee1FChA2AX5mt5X9MPax%2BdYGOqUBufEM2JWng4wjfcEZV%2Baalmojl%2B3wBih%2FQtifm8BKXm0IMU2L3Ya1vCEtIQD0VUVh216Iv%2BaeA176g%2Byj0CBx7f6p1eDpbg0H1YrPqjfps%2BkA8mUQtrgC7pRNEN1gmat3c6DW3U62CRkUoa1jtLoor6jcFWViephfYaSC3wy9xRkeYzn%2BzEBF5zsceA3XWi%2BV8iKMo%2FeepYnNwIDNqfIJo%2BnDN7eK&X-Amz-Signature=15100b2bae2d394c9c3aa09e4ce9711a6c3fda20dc3d490406708aa9594d949d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QH4AR6DK%2F20261025%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261025T200721Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFt%2FocNk5NjEHBb2WKgMfRD2maJgLzpxOHNRrP3mc%2BTQAiEA6yt1zthjkUukVjlNr1BO0%2Fib%2FFG3IKb4wIEaK0XnTiIqiAQIxP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOmPtyWDGpitfuGNrCrcA9nYEl2K7Z9%2F74PCDbJ4UKXrP1ne1yNNJQDtYchK3bPyZKLCsYddPZNcHHzVfPHeoHFfJwyMUKswvpJMvEKYGqGunQwaex6YnHBjcK8mdQtw75QZndpsf7KFkKxW5oysFcLsYpDgFDUqCM%2B%2Fwh1BTtuG4gGnl2BOFE%2FAKvzSgFM%2Fl0hkjo1SkdoYGK%2BXEvcEnhit2sNI0qU4vtyqFgQ%2B894BQd%2F9p4XDfbYH0emZPtVJ4r%2BWE4cZnShI90mrqgwgdv%2FR9qWec0SXcp7ATPyTWPMksz4aAWao5bAxcQWNkFIKNp42GyfoJTCjUBXT3qZJA8s5L7sj3tuVDSgm2F%2B%2BoIVwjlWkxIvJNGYG4IyCkQi4BJIltl7KCT9xe%2BYSRimaxVi2qisPf03UvUixN5T%2FuPMdRO5DoouG4ZQ1f69sVbm1rApeX8iEbw%2BZHzQZU0ho6Iy2D3057GuEFsCmM7fOTwK1%2BytHPfBxdygT2G%2FAglxm3m%2BI384nmF9q%2F3F32b52lWlBXak83JrMjwephKD89XQ%2FdbGDB9l7GrQW68i3ma0QwfZ9BHOpgnvoedZUcfnFBYfoWEh7IUidsHN2VyVk4eSraTZfILxS8ms2ewF%2F4a3vee1FChA2AX5mt5X9MPax%2BdYGOqUBufEM2JWng4wjfcEZV%2Baalmojl%2B3wBih%2FQtifm8BKXm0IMU2L3Ya1vCEtIQD0VUVh216Iv%2BaeA176g%2Byj0CBx7f6p1eDpbg0H1YrPqjfps%2BkA8mUQtrgC7pRNEN1gmat3c6DW3U62CRkUoa1jtLoor6jcFWViephfYaSC3wy9xRkeYzn%2BzEBF5zsceA3XWi%2BV8iKMo%2FeepYnNwIDNqfIJo%2BnDN7eK&X-Amz-Signature=fcf6c860866d0b52fc5cdad1934a52ce1711050378ba6c29ae0a549af2d975b4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QH4AR6DK%2F20261025%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261025T200721Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFt%2FocNk5NjEHBb2WKgMfRD2maJgLzpxOHNRrP3mc%2BTQAiEA6yt1zthjkUukVjlNr1BO0%2Fib%2FFG3IKb4wIEaK0XnTiIqiAQIxP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOmPtyWDGpitfuGNrCrcA9nYEl2K7Z9%2F74PCDbJ4UKXrP1ne1yNNJQDtYchK3bPyZKLCsYddPZNcHHzVfPHeoHFfJwyMUKswvpJMvEKYGqGunQwaex6YnHBjcK8mdQtw75QZndpsf7KFkKxW5oysFcLsYpDgFDUqCM%2B%2Fwh1BTtuG4gGnl2BOFE%2FAKvzSgFM%2Fl0hkjo1SkdoYGK%2BXEvcEnhit2sNI0qU4vtyqFgQ%2B894BQd%2F9p4XDfbYH0emZPtVJ4r%2BWE4cZnShI90mrqgwgdv%2FR9qWec0SXcp7ATPyTWPMksz4aAWao5bAxcQWNkFIKNp42GyfoJTCjUBXT3qZJA8s5L7sj3tuVDSgm2F%2B%2BoIVwjlWkxIvJNGYG4IyCkQi4BJIltl7KCT9xe%2BYSRimaxVi2qisPf03UvUixN5T%2FuPMdRO5DoouG4ZQ1f69sVbm1rApeX8iEbw%2BZHzQZU0ho6Iy2D3057GuEFsCmM7fOTwK1%2BytHPfBxdygT2G%2FAglxm3m%2BI384nmF9q%2F3F32b52lWlBXak83JrMjwephKD89XQ%2FdbGDB9l7GrQW68i3ma0QwfZ9BHOpgnvoedZUcfnFBYfoWEh7IUidsHN2VyVk4eSraTZfILxS8ms2ewF%2F4a3vee1FChA2AX5mt5X9MPax%2BdYGOqUBufEM2JWng4wjfcEZV%2Baalmojl%2B3wBih%2FQtifm8BKXm0IMU2L3Ya1vCEtIQD0VUVh216Iv%2BaeA176g%2Byj0CBx7f6p1eDpbg0H1YrPqjfps%2BkA8mUQtrgC7pRNEN1gmat3c6DW3U62CRkUoa1jtLoor6jcFWViephfYaSC3wy9xRkeYzn%2BzEBF5zsceA3XWi%2BV8iKMo%2FeepYnNwIDNqfIJo%2BnDN7eK&X-Amz-Signature=7b4aa5327efd4811ee03182ebaea4af0d52b6c8cd6caf1da57cf2f21ff990eba&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QH4AR6DK%2F20261025%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261025T200721Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFt%2FocNk5NjEHBb2WKgMfRD2maJgLzpxOHNRrP3mc%2BTQAiEA6yt1zthjkUukVjlNr1BO0%2Fib%2FFG3IKb4wIEaK0XnTiIqiAQIxP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOmPtyWDGpitfuGNrCrcA9nYEl2K7Z9%2F74PCDbJ4UKXrP1ne1yNNJQDtYchK3bPyZKLCsYddPZNcHHzVfPHeoHFfJwyMUKswvpJMvEKYGqGunQwaex6YnHBjcK8mdQtw75QZndpsf7KFkKxW5oysFcLsYpDgFDUqCM%2B%2Fwh1BTtuG4gGnl2BOFE%2FAKvzSgFM%2Fl0hkjo1SkdoYGK%2BXEvcEnhit2sNI0qU4vtyqFgQ%2B894BQd%2F9p4XDfbYH0emZPtVJ4r%2BWE4cZnShI90mrqgwgdv%2FR9qWec0SXcp7ATPyTWPMksz4aAWao5bAxcQWNkFIKNp42GyfoJTCjUBXT3qZJA8s5L7sj3tuVDSgm2F%2B%2BoIVwjlWkxIvJNGYG4IyCkQi4BJIltl7KCT9xe%2BYSRimaxVi2qisPf03UvUixN5T%2FuPMdRO5DoouG4ZQ1f69sVbm1rApeX8iEbw%2BZHzQZU0ho6Iy2D3057GuEFsCmM7fOTwK1%2BytHPfBxdygT2G%2FAglxm3m%2BI384nmF9q%2F3F32b52lWlBXak83JrMjwephKD89XQ%2FdbGDB9l7GrQW68i3ma0QwfZ9BHOpgnvoedZUcfnFBYfoWEh7IUidsHN2VyVk4eSraTZfILxS8ms2ewF%2F4a3vee1FChA2AX5mt5X9MPax%2BdYGOqUBufEM2JWng4wjfcEZV%2Baalmojl%2B3wBih%2FQtifm8BKXm0IMU2L3Ya1vCEtIQD0VUVh216Iv%2BaeA176g%2Byj0CBx7f6p1eDpbg0H1YrPqjfps%2BkA8mUQtrgC7pRNEN1gmat3c6DW3U62CRkUoa1jtLoor6jcFWViephfYaSC3wy9xRkeYzn%2BzEBF5zsceA3XWi%2BV8iKMo%2FeepYnNwIDNqfIJo%2BnDN7eK&X-Amz-Signature=a9576138bf78cb15da31a8d2466ab0bf31cfe333ed5e639f6a08bfb8cf82ce94&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
