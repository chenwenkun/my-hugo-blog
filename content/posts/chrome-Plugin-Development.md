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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664SMZ5BDH%2F20260916%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260916T154420Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEwaCXVzLXdlc3QtMiJIMEYCIQDlwtBs3KvmjaH%2BZ%2Bk1DoYGNMWiLq3t1I1XSnNhB%2Fw%2F8AIhAOPAqiV8DPoq8HoQULgwvWkBctXzkUkTczU%2FJDxuP1neKv8DCBUQABoMNjM3NDIzMTgzODA1Igxsa8c5rvn5mKIkjfAq3ANibv1X4%2BcPGcOnS%2BBNijb6GACCYaRJb%2BGugMNvhF0ju2wCM1F93RZ7C%2BQzSCLRHX9Ea6xj%2FDk2u%2BCUFH8uo2JZbJXL1C%2FHt%2BN29a4IVuUecUeSHBLEJQM42jLFjKAdAoeMMlXPK%2B2YrnjeLB%2FpxvKYeYgh0CJ9m4kQrUGbgpQcMjjfrIIUtqtJpVrIpYx6omB7mY8SMvZpvqgy8uTgxPSnfk6m2wHqgONBJGW3idTL%2FKU9SLNh%2BcPkxM9t%2BgUKiLnkeQ2vmY9ZuUL4KvW5xkWbSdWgd4rHgjGiXJHtquHFMFQmtZgeoBC74BhWAwQ35m%2Ftp4KFGID5vXwktMJYhSxvCJ1MgYTv%2FTpuj0yLeFLuF0jTbw7YwwI9NfIprFIUAmWxVISR19wD3ms1uQWxECx2tPxS%2BwE8fT0dXoLVrvG810qMK4zDlroB2J9TIC8FMDN%2BT8t6xVuZnPiB%2F2H1qZVke634YqeGdNUE8V5Q0qNKplV%2Bk4ap8rPf%2B%2BhUMxwvIfEb%2FnlvMqm%2F0CeA2PSgk%2FCxEqdY4%2F1O805ivCrJuIYuMDU5WwwrG6Jrzo5I8Q7roB2NoUfdIoFOFxl86MrZKwbILjcNBtAvB7CzSrgd328YE79MN%2FbOvDcSQXHuzTCkjKrVBjqkAQsukmQVxnC6L6QEf7yuqu7Pydg%2FvPeRcAJGgxtgfHJtWzpXUIhIhfNx7RZG%2BkiRcehUMhI5oSSBAywr4q%2FQtokLm8uXiyUJxcpoSX%2Ff9WeBbDyfZ868ilMB1LDxqLzdQ%2FEI4FeI2ed%2BGVBBXDiMBh8XpnhBfCM904b6JxlrWXvlQum5nnKv3m94ypZTMOhs3AUGMTiNN1j%2Bx8th36dk3Jp20vCT&X-Amz-Signature=67f1a8e7149bc0ca99a847732dd984e42c7b82bdbd24b9c23b6f155112a9087d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664SMZ5BDH%2F20260916%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260916T154420Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEwaCXVzLXdlc3QtMiJIMEYCIQDlwtBs3KvmjaH%2BZ%2Bk1DoYGNMWiLq3t1I1XSnNhB%2Fw%2F8AIhAOPAqiV8DPoq8HoQULgwvWkBctXzkUkTczU%2FJDxuP1neKv8DCBUQABoMNjM3NDIzMTgzODA1Igxsa8c5rvn5mKIkjfAq3ANibv1X4%2BcPGcOnS%2BBNijb6GACCYaRJb%2BGugMNvhF0ju2wCM1F93RZ7C%2BQzSCLRHX9Ea6xj%2FDk2u%2BCUFH8uo2JZbJXL1C%2FHt%2BN29a4IVuUecUeSHBLEJQM42jLFjKAdAoeMMlXPK%2B2YrnjeLB%2FpxvKYeYgh0CJ9m4kQrUGbgpQcMjjfrIIUtqtJpVrIpYx6omB7mY8SMvZpvqgy8uTgxPSnfk6m2wHqgONBJGW3idTL%2FKU9SLNh%2BcPkxM9t%2BgUKiLnkeQ2vmY9ZuUL4KvW5xkWbSdWgd4rHgjGiXJHtquHFMFQmtZgeoBC74BhWAwQ35m%2Ftp4KFGID5vXwktMJYhSxvCJ1MgYTv%2FTpuj0yLeFLuF0jTbw7YwwI9NfIprFIUAmWxVISR19wD3ms1uQWxECx2tPxS%2BwE8fT0dXoLVrvG810qMK4zDlroB2J9TIC8FMDN%2BT8t6xVuZnPiB%2F2H1qZVke634YqeGdNUE8V5Q0qNKplV%2Bk4ap8rPf%2B%2BhUMxwvIfEb%2FnlvMqm%2F0CeA2PSgk%2FCxEqdY4%2F1O805ivCrJuIYuMDU5WwwrG6Jrzo5I8Q7roB2NoUfdIoFOFxl86MrZKwbILjcNBtAvB7CzSrgd328YE79MN%2FbOvDcSQXHuzTCkjKrVBjqkAQsukmQVxnC6L6QEf7yuqu7Pydg%2FvPeRcAJGgxtgfHJtWzpXUIhIhfNx7RZG%2BkiRcehUMhI5oSSBAywr4q%2FQtokLm8uXiyUJxcpoSX%2Ff9WeBbDyfZ868ilMB1LDxqLzdQ%2FEI4FeI2ed%2BGVBBXDiMBh8XpnhBfCM904b6JxlrWXvlQum5nnKv3m94ypZTMOhs3AUGMTiNN1j%2Bx8th36dk3Jp20vCT&X-Amz-Signature=27308afe507a356c6eac88a404fe40e8b7b1c8e58300751d52a3d09cb062bd34&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664SMZ5BDH%2F20260916%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260916T154420Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEwaCXVzLXdlc3QtMiJIMEYCIQDlwtBs3KvmjaH%2BZ%2Bk1DoYGNMWiLq3t1I1XSnNhB%2Fw%2F8AIhAOPAqiV8DPoq8HoQULgwvWkBctXzkUkTczU%2FJDxuP1neKv8DCBUQABoMNjM3NDIzMTgzODA1Igxsa8c5rvn5mKIkjfAq3ANibv1X4%2BcPGcOnS%2BBNijb6GACCYaRJb%2BGugMNvhF0ju2wCM1F93RZ7C%2BQzSCLRHX9Ea6xj%2FDk2u%2BCUFH8uo2JZbJXL1C%2FHt%2BN29a4IVuUecUeSHBLEJQM42jLFjKAdAoeMMlXPK%2B2YrnjeLB%2FpxvKYeYgh0CJ9m4kQrUGbgpQcMjjfrIIUtqtJpVrIpYx6omB7mY8SMvZpvqgy8uTgxPSnfk6m2wHqgONBJGW3idTL%2FKU9SLNh%2BcPkxM9t%2BgUKiLnkeQ2vmY9ZuUL4KvW5xkWbSdWgd4rHgjGiXJHtquHFMFQmtZgeoBC74BhWAwQ35m%2Ftp4KFGID5vXwktMJYhSxvCJ1MgYTv%2FTpuj0yLeFLuF0jTbw7YwwI9NfIprFIUAmWxVISR19wD3ms1uQWxECx2tPxS%2BwE8fT0dXoLVrvG810qMK4zDlroB2J9TIC8FMDN%2BT8t6xVuZnPiB%2F2H1qZVke634YqeGdNUE8V5Q0qNKplV%2Bk4ap8rPf%2B%2BhUMxwvIfEb%2FnlvMqm%2F0CeA2PSgk%2FCxEqdY4%2F1O805ivCrJuIYuMDU5WwwrG6Jrzo5I8Q7roB2NoUfdIoFOFxl86MrZKwbILjcNBtAvB7CzSrgd328YE79MN%2FbOvDcSQXHuzTCkjKrVBjqkAQsukmQVxnC6L6QEf7yuqu7Pydg%2FvPeRcAJGgxtgfHJtWzpXUIhIhfNx7RZG%2BkiRcehUMhI5oSSBAywr4q%2FQtokLm8uXiyUJxcpoSX%2Ff9WeBbDyfZ868ilMB1LDxqLzdQ%2FEI4FeI2ed%2BGVBBXDiMBh8XpnhBfCM904b6JxlrWXvlQum5nnKv3m94ypZTMOhs3AUGMTiNN1j%2Bx8th36dk3Jp20vCT&X-Amz-Signature=4cb9a4d9cf2bb284c9e499908d581423c95f6d811c1f4fee899abb5202c53cf5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664SMZ5BDH%2F20260916%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260916T154420Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEwaCXVzLXdlc3QtMiJIMEYCIQDlwtBs3KvmjaH%2BZ%2Bk1DoYGNMWiLq3t1I1XSnNhB%2Fw%2F8AIhAOPAqiV8DPoq8HoQULgwvWkBctXzkUkTczU%2FJDxuP1neKv8DCBUQABoMNjM3NDIzMTgzODA1Igxsa8c5rvn5mKIkjfAq3ANibv1X4%2BcPGcOnS%2BBNijb6GACCYaRJb%2BGugMNvhF0ju2wCM1F93RZ7C%2BQzSCLRHX9Ea6xj%2FDk2u%2BCUFH8uo2JZbJXL1C%2FHt%2BN29a4IVuUecUeSHBLEJQM42jLFjKAdAoeMMlXPK%2B2YrnjeLB%2FpxvKYeYgh0CJ9m4kQrUGbgpQcMjjfrIIUtqtJpVrIpYx6omB7mY8SMvZpvqgy8uTgxPSnfk6m2wHqgONBJGW3idTL%2FKU9SLNh%2BcPkxM9t%2BgUKiLnkeQ2vmY9ZuUL4KvW5xkWbSdWgd4rHgjGiXJHtquHFMFQmtZgeoBC74BhWAwQ35m%2Ftp4KFGID5vXwktMJYhSxvCJ1MgYTv%2FTpuj0yLeFLuF0jTbw7YwwI9NfIprFIUAmWxVISR19wD3ms1uQWxECx2tPxS%2BwE8fT0dXoLVrvG810qMK4zDlroB2J9TIC8FMDN%2BT8t6xVuZnPiB%2F2H1qZVke634YqeGdNUE8V5Q0qNKplV%2Bk4ap8rPf%2B%2BhUMxwvIfEb%2FnlvMqm%2F0CeA2PSgk%2FCxEqdY4%2F1O805ivCrJuIYuMDU5WwwrG6Jrzo5I8Q7roB2NoUfdIoFOFxl86MrZKwbILjcNBtAvB7CzSrgd328YE79MN%2FbOvDcSQXHuzTCkjKrVBjqkAQsukmQVxnC6L6QEf7yuqu7Pydg%2FvPeRcAJGgxtgfHJtWzpXUIhIhfNx7RZG%2BkiRcehUMhI5oSSBAywr4q%2FQtokLm8uXiyUJxcpoSX%2Ff9WeBbDyfZ868ilMB1LDxqLzdQ%2FEI4FeI2ed%2BGVBBXDiMBh8XpnhBfCM904b6JxlrWXvlQum5nnKv3m94ypZTMOhs3AUGMTiNN1j%2Bx8th36dk3Jp20vCT&X-Amz-Signature=cc3883a84409e53c6df86c75f3b7944cd316031fd46ba9d1ac239f0bd81e9e8a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
