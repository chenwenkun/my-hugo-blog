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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666SVIQIDY%2F20260810%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260810T070824Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIHk%2B1uXW6%2FlxQjsC2uYER9FqZV5PhdRULqVUtLfsvs%2FFAiAoU7qj%2B2KYsMEtQ8qNQ%2FdoTa2geWz6LvLkgjd8h6n26yqIBAiX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMVotdTk8p17zJolTlKtwDJIJJ9M5gCtQMHMo3Tok2cWkRSu9SWxl2G9V%2BsB0zQ4iGiPOdgJhFx5XXxEua5owEJNZwEEvqrSvlOt31t%2F8BoRO1FTAHObZvhnFBGrC9DyuAI8trq7JskXKEX3UIIXx9A%2BKwap%2FRczzZyrWXWgYKYyU6tLZBsCk%2F1dz4OXLCKXmzGkMHmHICEJzlc10kR%2FZlEV8dInyc7zEdNfuAu37ExOBBQXBNIjzJ%2BtlhaVyXOsA84F7pMiIeM4wSg9%2FKkZnfWoe%2B437pSyOf3ruZZCO6acMsMRkjX%2BTdY4GsuhD6y%2BQRhFcxHYtxbthUTO7sE33X%2FcG%2FnbwLag2FrEUpahZinWgrPmIu8yLB0PIlgBXR9KOeDwfHkL2wdEbhmPnKeS8ycQyPmlla3993JvPfmiMsmUpH46yoaba%2F5EaZZwGWapotxNDIBWaU1OMOghDLjxGMtlMRdYDumbeUnrgh7Y2xTDjRNvRgAIivG4sz2qhWxOvv1EpVoCD7bqTkU0LmpEAYTzOMlyjx8zqSp3L20pyTFNvtgjk21neVyszAWldTHmrAqORN330Z2%2FN2EPxhWkAXWpPxVJO5Od7LapwEazzeXmI5pnvAdOuRYI38%2FhbQjEm72u7QKp%2BYfzq%2BFHUw6czl0wY6pgHhZmc6cRvmMsXyY5S%2FW93zbO%2B5ByPjFERiuSuQQWpsuB0TWhAutjUbAFAVV7r%2BK7YdVTjLzgP%2B0h2xO77lWvJa8NJ4lIhGZ3jekbjdMz2rbBCmb1WCJS3kSRr87QFjQnUsd9IxI8%2FAXBIwM2fFzzi0o2XlITYaa72BO%2FRwKMZGHF7tY1QktuXb2BfJf%2B8grJtRX%2B32D3j5XS735ihFgesiX7TE2QkR&X-Amz-Signature=5ef83ba47a08fbf332763ac0141cd206d946e948b81cfb9470263506910b195f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666SVIQIDY%2F20260810%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260810T070824Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIHk%2B1uXW6%2FlxQjsC2uYER9FqZV5PhdRULqVUtLfsvs%2FFAiAoU7qj%2B2KYsMEtQ8qNQ%2FdoTa2geWz6LvLkgjd8h6n26yqIBAiX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMVotdTk8p17zJolTlKtwDJIJJ9M5gCtQMHMo3Tok2cWkRSu9SWxl2G9V%2BsB0zQ4iGiPOdgJhFx5XXxEua5owEJNZwEEvqrSvlOt31t%2F8BoRO1FTAHObZvhnFBGrC9DyuAI8trq7JskXKEX3UIIXx9A%2BKwap%2FRczzZyrWXWgYKYyU6tLZBsCk%2F1dz4OXLCKXmzGkMHmHICEJzlc10kR%2FZlEV8dInyc7zEdNfuAu37ExOBBQXBNIjzJ%2BtlhaVyXOsA84F7pMiIeM4wSg9%2FKkZnfWoe%2B437pSyOf3ruZZCO6acMsMRkjX%2BTdY4GsuhD6y%2BQRhFcxHYtxbthUTO7sE33X%2FcG%2FnbwLag2FrEUpahZinWgrPmIu8yLB0PIlgBXR9KOeDwfHkL2wdEbhmPnKeS8ycQyPmlla3993JvPfmiMsmUpH46yoaba%2F5EaZZwGWapotxNDIBWaU1OMOghDLjxGMtlMRdYDumbeUnrgh7Y2xTDjRNvRgAIivG4sz2qhWxOvv1EpVoCD7bqTkU0LmpEAYTzOMlyjx8zqSp3L20pyTFNvtgjk21neVyszAWldTHmrAqORN330Z2%2FN2EPxhWkAXWpPxVJO5Od7LapwEazzeXmI5pnvAdOuRYI38%2FhbQjEm72u7QKp%2BYfzq%2BFHUw6czl0wY6pgHhZmc6cRvmMsXyY5S%2FW93zbO%2B5ByPjFERiuSuQQWpsuB0TWhAutjUbAFAVV7r%2BK7YdVTjLzgP%2B0h2xO77lWvJa8NJ4lIhGZ3jekbjdMz2rbBCmb1WCJS3kSRr87QFjQnUsd9IxI8%2FAXBIwM2fFzzi0o2XlITYaa72BO%2FRwKMZGHF7tY1QktuXb2BfJf%2B8grJtRX%2B32D3j5XS735ihFgesiX7TE2QkR&X-Amz-Signature=7c1beeb7021670489057706cf37d818672dcdc23d2044086e05ae16d9a0e2721&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666SVIQIDY%2F20260810%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260810T070824Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIHk%2B1uXW6%2FlxQjsC2uYER9FqZV5PhdRULqVUtLfsvs%2FFAiAoU7qj%2B2KYsMEtQ8qNQ%2FdoTa2geWz6LvLkgjd8h6n26yqIBAiX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMVotdTk8p17zJolTlKtwDJIJJ9M5gCtQMHMo3Tok2cWkRSu9SWxl2G9V%2BsB0zQ4iGiPOdgJhFx5XXxEua5owEJNZwEEvqrSvlOt31t%2F8BoRO1FTAHObZvhnFBGrC9DyuAI8trq7JskXKEX3UIIXx9A%2BKwap%2FRczzZyrWXWgYKYyU6tLZBsCk%2F1dz4OXLCKXmzGkMHmHICEJzlc10kR%2FZlEV8dInyc7zEdNfuAu37ExOBBQXBNIjzJ%2BtlhaVyXOsA84F7pMiIeM4wSg9%2FKkZnfWoe%2B437pSyOf3ruZZCO6acMsMRkjX%2BTdY4GsuhD6y%2BQRhFcxHYtxbthUTO7sE33X%2FcG%2FnbwLag2FrEUpahZinWgrPmIu8yLB0PIlgBXR9KOeDwfHkL2wdEbhmPnKeS8ycQyPmlla3993JvPfmiMsmUpH46yoaba%2F5EaZZwGWapotxNDIBWaU1OMOghDLjxGMtlMRdYDumbeUnrgh7Y2xTDjRNvRgAIivG4sz2qhWxOvv1EpVoCD7bqTkU0LmpEAYTzOMlyjx8zqSp3L20pyTFNvtgjk21neVyszAWldTHmrAqORN330Z2%2FN2EPxhWkAXWpPxVJO5Od7LapwEazzeXmI5pnvAdOuRYI38%2FhbQjEm72u7QKp%2BYfzq%2BFHUw6czl0wY6pgHhZmc6cRvmMsXyY5S%2FW93zbO%2B5ByPjFERiuSuQQWpsuB0TWhAutjUbAFAVV7r%2BK7YdVTjLzgP%2B0h2xO77lWvJa8NJ4lIhGZ3jekbjdMz2rbBCmb1WCJS3kSRr87QFjQnUsd9IxI8%2FAXBIwM2fFzzi0o2XlITYaa72BO%2FRwKMZGHF7tY1QktuXb2BfJf%2B8grJtRX%2B32D3j5XS735ihFgesiX7TE2QkR&X-Amz-Signature=ec68e95d23e34404ee06fee638912d3996862bf1394ddd942e7c97aa11f2dbc1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666SVIQIDY%2F20260810%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260810T070824Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIHk%2B1uXW6%2FlxQjsC2uYER9FqZV5PhdRULqVUtLfsvs%2FFAiAoU7qj%2B2KYsMEtQ8qNQ%2FdoTa2geWz6LvLkgjd8h6n26yqIBAiX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMVotdTk8p17zJolTlKtwDJIJJ9M5gCtQMHMo3Tok2cWkRSu9SWxl2G9V%2BsB0zQ4iGiPOdgJhFx5XXxEua5owEJNZwEEvqrSvlOt31t%2F8BoRO1FTAHObZvhnFBGrC9DyuAI8trq7JskXKEX3UIIXx9A%2BKwap%2FRczzZyrWXWgYKYyU6tLZBsCk%2F1dz4OXLCKXmzGkMHmHICEJzlc10kR%2FZlEV8dInyc7zEdNfuAu37ExOBBQXBNIjzJ%2BtlhaVyXOsA84F7pMiIeM4wSg9%2FKkZnfWoe%2B437pSyOf3ruZZCO6acMsMRkjX%2BTdY4GsuhD6y%2BQRhFcxHYtxbthUTO7sE33X%2FcG%2FnbwLag2FrEUpahZinWgrPmIu8yLB0PIlgBXR9KOeDwfHkL2wdEbhmPnKeS8ycQyPmlla3993JvPfmiMsmUpH46yoaba%2F5EaZZwGWapotxNDIBWaU1OMOghDLjxGMtlMRdYDumbeUnrgh7Y2xTDjRNvRgAIivG4sz2qhWxOvv1EpVoCD7bqTkU0LmpEAYTzOMlyjx8zqSp3L20pyTFNvtgjk21neVyszAWldTHmrAqORN330Z2%2FN2EPxhWkAXWpPxVJO5Od7LapwEazzeXmI5pnvAdOuRYI38%2FhbQjEm72u7QKp%2BYfzq%2BFHUw6czl0wY6pgHhZmc6cRvmMsXyY5S%2FW93zbO%2B5ByPjFERiuSuQQWpsuB0TWhAutjUbAFAVV7r%2BK7YdVTjLzgP%2B0h2xO77lWvJa8NJ4lIhGZ3jekbjdMz2rbBCmb1WCJS3kSRr87QFjQnUsd9IxI8%2FAXBIwM2fFzzi0o2XlITYaa72BO%2FRwKMZGHF7tY1QktuXb2BfJf%2B8grJtRX%2B32D3j5XS735ihFgesiX7TE2QkR&X-Amz-Signature=9efa08ae3a2076fedace44cf70e90e07671ac6a8c7bfcd3a4cb65790a46f3cdb&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
