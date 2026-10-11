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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663D2GEKCI%2F20261011%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261011T165832Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBX3D9rP2nLiUL47ED4bluT4Sm7L%2Bhq5YbW0s6RnlDMkAiEAllWLrtbgRjOSQJ43%2FV7Y3pYLHhfOezH43vNXGoBfEbsq%2FwMIchAAGgw2Mzc0MjMxODM4MDUiDEASIsElApGMEBc24yrcA6lEkew7iUvW8%2BuKiClrg0W%2Bnu%2FwlrCkJPk9WJDYQ4qOaloDai%2BDDPnqbcYwpm%2By3iR2A%2Bczax9j1yYJrnSxFVE6ROsHB0jbq4BAdOfCMJTUowXXpA4gdRM4fcyp9lnKGi4WTJ%2FZII08P86pDBylh19NOiV7BTQeg00VokjFoJ1h8c%2Fnojp0V70aWUsp%2BeYZQ%2F7KygYzxg5O9lT6%2Fyyp%2Bc5uwTw2EUWL6H8bJQkY4VAx0nAMo3ddE2mtpXTzQCrnCVjwWo2Z9YG7%2FjlJ4s11Kw%2Bb7%2FcveYIfNX4%2BRkFM9%2F9Y0xxV64KCvsZGmvuMBkekNx5Y8WDuy%2F%2F0YXgB7hacI0Pp1pB3jtKLn1WQB0r9kr4VoCjusU%2BNdqZ9bz6dfO9Ok%2Fw33HMkDZqEd2QZcS2n9dB5mCgd%2FC1aXTTyHVwJzzbo9ESo5St6dWzO4rYoJYo9yUaBlhKnbVCGucKaKQUrccuRPA3dO8TPAmL%2F%2FGsP8Fmriuuwxupd8TUSKREwRxob8zsYPCPBtSsuQxChu3jI4O7Dzyix2T3MgBdTCR0Gyk1Eu6I6qpOA1znE%2BlEPAmsqWctCxKsaiwVnO%2Bxxhe9tFtPizGd2VfMA3cha1nwYzpCIh6GFUv%2BS4O%2Bi9vFdMKHwrtYGOqUBTCrJI59eCkYX0PmpF8TgmrbTDHGSuLQ3G2pu0vVw7863gXojjxb3iaP5tI8AEkKNU%2F739fDm4jOqe7aDWz2mXZGygQrG7iePBNOp%2BFPZKWAhYdPtQMqgKsvEl5OZW1po4vIPF93cFoAuVi8bBVTVsdVoyOKnHOmJc0iKCiNFF2%2B9pt%2BjIBztLZ0hFfmHsBn24k5J0U9z%2BOXyJqumhZ6gd0segnb5&X-Amz-Signature=d0d9e6eb75b49d25185981313d0fa2355593ad8ddf405e4cdc1d306a04ca528e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663D2GEKCI%2F20261011%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261011T165832Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBX3D9rP2nLiUL47ED4bluT4Sm7L%2Bhq5YbW0s6RnlDMkAiEAllWLrtbgRjOSQJ43%2FV7Y3pYLHhfOezH43vNXGoBfEbsq%2FwMIchAAGgw2Mzc0MjMxODM4MDUiDEASIsElApGMEBc24yrcA6lEkew7iUvW8%2BuKiClrg0W%2Bnu%2FwlrCkJPk9WJDYQ4qOaloDai%2BDDPnqbcYwpm%2By3iR2A%2Bczax9j1yYJrnSxFVE6ROsHB0jbq4BAdOfCMJTUowXXpA4gdRM4fcyp9lnKGi4WTJ%2FZII08P86pDBylh19NOiV7BTQeg00VokjFoJ1h8c%2Fnojp0V70aWUsp%2BeYZQ%2F7KygYzxg5O9lT6%2Fyyp%2Bc5uwTw2EUWL6H8bJQkY4VAx0nAMo3ddE2mtpXTzQCrnCVjwWo2Z9YG7%2FjlJ4s11Kw%2Bb7%2FcveYIfNX4%2BRkFM9%2F9Y0xxV64KCvsZGmvuMBkekNx5Y8WDuy%2F%2F0YXgB7hacI0Pp1pB3jtKLn1WQB0r9kr4VoCjusU%2BNdqZ9bz6dfO9Ok%2Fw33HMkDZqEd2QZcS2n9dB5mCgd%2FC1aXTTyHVwJzzbo9ESo5St6dWzO4rYoJYo9yUaBlhKnbVCGucKaKQUrccuRPA3dO8TPAmL%2F%2FGsP8Fmriuuwxupd8TUSKREwRxob8zsYPCPBtSsuQxChu3jI4O7Dzyix2T3MgBdTCR0Gyk1Eu6I6qpOA1znE%2BlEPAmsqWctCxKsaiwVnO%2Bxxhe9tFtPizGd2VfMA3cha1nwYzpCIh6GFUv%2BS4O%2Bi9vFdMKHwrtYGOqUBTCrJI59eCkYX0PmpF8TgmrbTDHGSuLQ3G2pu0vVw7863gXojjxb3iaP5tI8AEkKNU%2F739fDm4jOqe7aDWz2mXZGygQrG7iePBNOp%2BFPZKWAhYdPtQMqgKsvEl5OZW1po4vIPF93cFoAuVi8bBVTVsdVoyOKnHOmJc0iKCiNFF2%2B9pt%2BjIBztLZ0hFfmHsBn24k5J0U9z%2BOXyJqumhZ6gd0segnb5&X-Amz-Signature=46a3bfe2ed708937acc64b9a827a7ce9b9f91e30a487bf658130bdd44a2569c5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663D2GEKCI%2F20261011%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261011T165832Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBX3D9rP2nLiUL47ED4bluT4Sm7L%2Bhq5YbW0s6RnlDMkAiEAllWLrtbgRjOSQJ43%2FV7Y3pYLHhfOezH43vNXGoBfEbsq%2FwMIchAAGgw2Mzc0MjMxODM4MDUiDEASIsElApGMEBc24yrcA6lEkew7iUvW8%2BuKiClrg0W%2Bnu%2FwlrCkJPk9WJDYQ4qOaloDai%2BDDPnqbcYwpm%2By3iR2A%2Bczax9j1yYJrnSxFVE6ROsHB0jbq4BAdOfCMJTUowXXpA4gdRM4fcyp9lnKGi4WTJ%2FZII08P86pDBylh19NOiV7BTQeg00VokjFoJ1h8c%2Fnojp0V70aWUsp%2BeYZQ%2F7KygYzxg5O9lT6%2Fyyp%2Bc5uwTw2EUWL6H8bJQkY4VAx0nAMo3ddE2mtpXTzQCrnCVjwWo2Z9YG7%2FjlJ4s11Kw%2Bb7%2FcveYIfNX4%2BRkFM9%2F9Y0xxV64KCvsZGmvuMBkekNx5Y8WDuy%2F%2F0YXgB7hacI0Pp1pB3jtKLn1WQB0r9kr4VoCjusU%2BNdqZ9bz6dfO9Ok%2Fw33HMkDZqEd2QZcS2n9dB5mCgd%2FC1aXTTyHVwJzzbo9ESo5St6dWzO4rYoJYo9yUaBlhKnbVCGucKaKQUrccuRPA3dO8TPAmL%2F%2FGsP8Fmriuuwxupd8TUSKREwRxob8zsYPCPBtSsuQxChu3jI4O7Dzyix2T3MgBdTCR0Gyk1Eu6I6qpOA1znE%2BlEPAmsqWctCxKsaiwVnO%2Bxxhe9tFtPizGd2VfMA3cha1nwYzpCIh6GFUv%2BS4O%2Bi9vFdMKHwrtYGOqUBTCrJI59eCkYX0PmpF8TgmrbTDHGSuLQ3G2pu0vVw7863gXojjxb3iaP5tI8AEkKNU%2F739fDm4jOqe7aDWz2mXZGygQrG7iePBNOp%2BFPZKWAhYdPtQMqgKsvEl5OZW1po4vIPF93cFoAuVi8bBVTVsdVoyOKnHOmJc0iKCiNFF2%2B9pt%2BjIBztLZ0hFfmHsBn24k5J0U9z%2BOXyJqumhZ6gd0segnb5&X-Amz-Signature=58f008b46e33924380201901aa5eeb887b56d7dbd6915a92ed815d4951f7b15d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663D2GEKCI%2F20261011%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261011T165832Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBX3D9rP2nLiUL47ED4bluT4Sm7L%2Bhq5YbW0s6RnlDMkAiEAllWLrtbgRjOSQJ43%2FV7Y3pYLHhfOezH43vNXGoBfEbsq%2FwMIchAAGgw2Mzc0MjMxODM4MDUiDEASIsElApGMEBc24yrcA6lEkew7iUvW8%2BuKiClrg0W%2Bnu%2FwlrCkJPk9WJDYQ4qOaloDai%2BDDPnqbcYwpm%2By3iR2A%2Bczax9j1yYJrnSxFVE6ROsHB0jbq4BAdOfCMJTUowXXpA4gdRM4fcyp9lnKGi4WTJ%2FZII08P86pDBylh19NOiV7BTQeg00VokjFoJ1h8c%2Fnojp0V70aWUsp%2BeYZQ%2F7KygYzxg5O9lT6%2Fyyp%2Bc5uwTw2EUWL6H8bJQkY4VAx0nAMo3ddE2mtpXTzQCrnCVjwWo2Z9YG7%2FjlJ4s11Kw%2Bb7%2FcveYIfNX4%2BRkFM9%2F9Y0xxV64KCvsZGmvuMBkekNx5Y8WDuy%2F%2F0YXgB7hacI0Pp1pB3jtKLn1WQB0r9kr4VoCjusU%2BNdqZ9bz6dfO9Ok%2Fw33HMkDZqEd2QZcS2n9dB5mCgd%2FC1aXTTyHVwJzzbo9ESo5St6dWzO4rYoJYo9yUaBlhKnbVCGucKaKQUrccuRPA3dO8TPAmL%2F%2FGsP8Fmriuuwxupd8TUSKREwRxob8zsYPCPBtSsuQxChu3jI4O7Dzyix2T3MgBdTCR0Gyk1Eu6I6qpOA1znE%2BlEPAmsqWctCxKsaiwVnO%2Bxxhe9tFtPizGd2VfMA3cha1nwYzpCIh6GFUv%2BS4O%2Bi9vFdMKHwrtYGOqUBTCrJI59eCkYX0PmpF8TgmrbTDHGSuLQ3G2pu0vVw7863gXojjxb3iaP5tI8AEkKNU%2F739fDm4jOqe7aDWz2mXZGygQrG7iePBNOp%2BFPZKWAhYdPtQMqgKsvEl5OZW1po4vIPF93cFoAuVi8bBVTVsdVoyOKnHOmJc0iKCiNFF2%2B9pt%2BjIBztLZ0hFfmHsBn24k5J0U9z%2BOXyJqumhZ6gd0segnb5&X-Amz-Signature=51e07dc0be0acbe375c7de83732d08ed2dd4482d4b28714b309f651519e8ffbe&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
