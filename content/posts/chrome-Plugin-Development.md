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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TPNAOPRT%2F20261112%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261112T141212Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDRfXNazJ8xewh4qv%2F12CrsHjq86UPjdq7IaB0SbEQRKwIhAMzmZUlUzkxjV700zRNVevdzdF%2BkLzNTCug0s3RNLDS4Kv8DCG4QABoMNjM3NDIzMTgzODA1IgztWJjptoqUiu8AUvwq3AOdi%2FBqmpq05UMREJdeUqZbL%2BBxyp%2BuvMWmPFmi%2FBL0QJytlM6Cuu6IjZDAGFy8t0IJqZYcm7N3lnh6H8nRfo4teeriC%2Fph7w3zUVBJLkdhm%2F73jVdxsZXLFB0hPmzg9bwleaUU02IZjzQKTUHYSi2oIrrePmxUCsZStYWYG1S7YdmtauU7dAw8VU7oejMs101nuiUurjmEOoLTOsvAdac3AVWy%2Buj3JD%2Bv%2BwA79twcsFajqQIjj3GXurbzxypHN9AjSD7mDLBJioCGBxzjKhCixTQbTYiMmBojrqIpaUZ%2FHbpacdhfRVTcml1HlFkobP3ZPxlUL8suELnuasz96gqNQyISP2rDFIJH3UsB0YX9N06JVY4%2FTvyt6dWQ9qmOJ1DBtHKkDVfz8i%2Fvvt1MzNmgBETZL2IvjFaf64tH9UuORoghuU7VKHxDLx0j%2FOFS5fQnLuyYCW%2BRtvVUiD6FoinGiC9qoFxvB6HE72%2FbOZ1a4KZqgnrcaAYTPKQfcLkQCrlf89DVw5sbrZ4u6ar1sLyvxM%2FvmSA8qQAIDx6mxyw2kQzQoQ9fph8u9%2BLC05thblatmFiiWMmi8Ev5s%2FYNiO3rMgGj5k16nWwJh6%2BXlzuPFgFmWmyY4dFjBRWluDCF9tbXBjqkAWIpWwcoQgtrR6lsS0D9d8VhuiM%2BZiapHgF6RoVUGtSmIYFd%2FSsJ2sxI1yZ0XKK2NaTVRwkYh5A1A8aO8lHdeom49jYFC4XLRx6LDEtlpz%2BjQwN%2Fz0Pvu0Kiyre5r0g8nYTodTFyyGW8C%2FALquAGBKbNPXQx6pRYeLDhj%2B7o6RkC7Jt5oZWgB0o%2FEPGOMv9oNCYWxsQrcKkEe6sIdgl5vR%2BrNUW%2B&X-Amz-Signature=a7240836bd0906441396ffceb0bbc7a1ef25becd7c299c96c683ddaf115668f8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TPNAOPRT%2F20261112%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261112T141212Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDRfXNazJ8xewh4qv%2F12CrsHjq86UPjdq7IaB0SbEQRKwIhAMzmZUlUzkxjV700zRNVevdzdF%2BkLzNTCug0s3RNLDS4Kv8DCG4QABoMNjM3NDIzMTgzODA1IgztWJjptoqUiu8AUvwq3AOdi%2FBqmpq05UMREJdeUqZbL%2BBxyp%2BuvMWmPFmi%2FBL0QJytlM6Cuu6IjZDAGFy8t0IJqZYcm7N3lnh6H8nRfo4teeriC%2Fph7w3zUVBJLkdhm%2F73jVdxsZXLFB0hPmzg9bwleaUU02IZjzQKTUHYSi2oIrrePmxUCsZStYWYG1S7YdmtauU7dAw8VU7oejMs101nuiUurjmEOoLTOsvAdac3AVWy%2Buj3JD%2Bv%2BwA79twcsFajqQIjj3GXurbzxypHN9AjSD7mDLBJioCGBxzjKhCixTQbTYiMmBojrqIpaUZ%2FHbpacdhfRVTcml1HlFkobP3ZPxlUL8suELnuasz96gqNQyISP2rDFIJH3UsB0YX9N06JVY4%2FTvyt6dWQ9qmOJ1DBtHKkDVfz8i%2Fvvt1MzNmgBETZL2IvjFaf64tH9UuORoghuU7VKHxDLx0j%2FOFS5fQnLuyYCW%2BRtvVUiD6FoinGiC9qoFxvB6HE72%2FbOZ1a4KZqgnrcaAYTPKQfcLkQCrlf89DVw5sbrZ4u6ar1sLyvxM%2FvmSA8qQAIDx6mxyw2kQzQoQ9fph8u9%2BLC05thblatmFiiWMmi8Ev5s%2FYNiO3rMgGj5k16nWwJh6%2BXlzuPFgFmWmyY4dFjBRWluDCF9tbXBjqkAWIpWwcoQgtrR6lsS0D9d8VhuiM%2BZiapHgF6RoVUGtSmIYFd%2FSsJ2sxI1yZ0XKK2NaTVRwkYh5A1A8aO8lHdeom49jYFC4XLRx6LDEtlpz%2BjQwN%2Fz0Pvu0Kiyre5r0g8nYTodTFyyGW8C%2FALquAGBKbNPXQx6pRYeLDhj%2B7o6RkC7Jt5oZWgB0o%2FEPGOMv9oNCYWxsQrcKkEe6sIdgl5vR%2BrNUW%2B&X-Amz-Signature=1e6380d9b3b60daccf3c5caec7bb163c06e9dc6457cd392070f1b1de8febdeb5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TPNAOPRT%2F20261112%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261112T141212Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDRfXNazJ8xewh4qv%2F12CrsHjq86UPjdq7IaB0SbEQRKwIhAMzmZUlUzkxjV700zRNVevdzdF%2BkLzNTCug0s3RNLDS4Kv8DCG4QABoMNjM3NDIzMTgzODA1IgztWJjptoqUiu8AUvwq3AOdi%2FBqmpq05UMREJdeUqZbL%2BBxyp%2BuvMWmPFmi%2FBL0QJytlM6Cuu6IjZDAGFy8t0IJqZYcm7N3lnh6H8nRfo4teeriC%2Fph7w3zUVBJLkdhm%2F73jVdxsZXLFB0hPmzg9bwleaUU02IZjzQKTUHYSi2oIrrePmxUCsZStYWYG1S7YdmtauU7dAw8VU7oejMs101nuiUurjmEOoLTOsvAdac3AVWy%2Buj3JD%2Bv%2BwA79twcsFajqQIjj3GXurbzxypHN9AjSD7mDLBJioCGBxzjKhCixTQbTYiMmBojrqIpaUZ%2FHbpacdhfRVTcml1HlFkobP3ZPxlUL8suELnuasz96gqNQyISP2rDFIJH3UsB0YX9N06JVY4%2FTvyt6dWQ9qmOJ1DBtHKkDVfz8i%2Fvvt1MzNmgBETZL2IvjFaf64tH9UuORoghuU7VKHxDLx0j%2FOFS5fQnLuyYCW%2BRtvVUiD6FoinGiC9qoFxvB6HE72%2FbOZ1a4KZqgnrcaAYTPKQfcLkQCrlf89DVw5sbrZ4u6ar1sLyvxM%2FvmSA8qQAIDx6mxyw2kQzQoQ9fph8u9%2BLC05thblatmFiiWMmi8Ev5s%2FYNiO3rMgGj5k16nWwJh6%2BXlzuPFgFmWmyY4dFjBRWluDCF9tbXBjqkAWIpWwcoQgtrR6lsS0D9d8VhuiM%2BZiapHgF6RoVUGtSmIYFd%2FSsJ2sxI1yZ0XKK2NaTVRwkYh5A1A8aO8lHdeom49jYFC4XLRx6LDEtlpz%2BjQwN%2Fz0Pvu0Kiyre5r0g8nYTodTFyyGW8C%2FALquAGBKbNPXQx6pRYeLDhj%2B7o6RkC7Jt5oZWgB0o%2FEPGOMv9oNCYWxsQrcKkEe6sIdgl5vR%2BrNUW%2B&X-Amz-Signature=b40995fe05e73b0bf9beebd41d2016dd147ecfff56dab9d4e480395862c2716b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TPNAOPRT%2F20261112%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261112T141212Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDRfXNazJ8xewh4qv%2F12CrsHjq86UPjdq7IaB0SbEQRKwIhAMzmZUlUzkxjV700zRNVevdzdF%2BkLzNTCug0s3RNLDS4Kv8DCG4QABoMNjM3NDIzMTgzODA1IgztWJjptoqUiu8AUvwq3AOdi%2FBqmpq05UMREJdeUqZbL%2BBxyp%2BuvMWmPFmi%2FBL0QJytlM6Cuu6IjZDAGFy8t0IJqZYcm7N3lnh6H8nRfo4teeriC%2Fph7w3zUVBJLkdhm%2F73jVdxsZXLFB0hPmzg9bwleaUU02IZjzQKTUHYSi2oIrrePmxUCsZStYWYG1S7YdmtauU7dAw8VU7oejMs101nuiUurjmEOoLTOsvAdac3AVWy%2Buj3JD%2Bv%2BwA79twcsFajqQIjj3GXurbzxypHN9AjSD7mDLBJioCGBxzjKhCixTQbTYiMmBojrqIpaUZ%2FHbpacdhfRVTcml1HlFkobP3ZPxlUL8suELnuasz96gqNQyISP2rDFIJH3UsB0YX9N06JVY4%2FTvyt6dWQ9qmOJ1DBtHKkDVfz8i%2Fvvt1MzNmgBETZL2IvjFaf64tH9UuORoghuU7VKHxDLx0j%2FOFS5fQnLuyYCW%2BRtvVUiD6FoinGiC9qoFxvB6HE72%2FbOZ1a4KZqgnrcaAYTPKQfcLkQCrlf89DVw5sbrZ4u6ar1sLyvxM%2FvmSA8qQAIDx6mxyw2kQzQoQ9fph8u9%2BLC05thblatmFiiWMmi8Ev5s%2FYNiO3rMgGj5k16nWwJh6%2BXlzuPFgFmWmyY4dFjBRWluDCF9tbXBjqkAWIpWwcoQgtrR6lsS0D9d8VhuiM%2BZiapHgF6RoVUGtSmIYFd%2FSsJ2sxI1yZ0XKK2NaTVRwkYh5A1A8aO8lHdeom49jYFC4XLRx6LDEtlpz%2BjQwN%2Fz0Pvu0Kiyre5r0g8nYTodTFyyGW8C%2FALquAGBKbNPXQx6pRYeLDhj%2B7o6RkC7Jt5oZWgB0o%2FEPGOMv9oNCYWxsQrcKkEe6sIdgl5vR%2BrNUW%2B&X-Amz-Signature=8e2c970fb0f7e013dab01c7d5fca832bf501939b9f25cd2959343b2d2a519e37&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
