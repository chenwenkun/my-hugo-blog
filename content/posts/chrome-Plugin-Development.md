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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QMOX6HSJ%2F20260904%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260904T101302Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECkaCXVzLXdlc3QtMiJHMEUCIDr7OP0pCk2qMkwpO9gdmUVFoGv%2BBiqYa4cgVmHD9EYHAiEAg98xOJ0%2FEKXZTQ%2BSV9UFr%2BA0Ei2AFgQkNwsSVfkjnxcqiAQI8v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDDFJMvr6H6q17NfYHCrcA%2BXx59C6jsjvEiVH9qJBBxwhcx1g5XbnF9n%2Fcir92EUAZQN2LSyZVQ6RW7y0FqstjYHTTZqSBzA4jgdazvqoWpWnNX%2BIgwjdzEV0E7MF4CfxrMn3NdH91aBDi%2B9uW42wBDHtLojB48coLPuC%2BK%2BHPmsjd%2F3A95daazT043CN0Bz%2F7%2FGihz1%2FeqGJtxHhEG75soWShiekUmXgbp1brQeYeTnw9%2FrPkeunpLWDLnxjF%2FDL8DKThtkLn4Xb4LXCXbzGLzozxTbV%2FqDMf8m1wTnjla%2FxcsOhYkpkrnrOYFOE%2BZ1I64bUI4B2jnlR7JqbnOM7iuFiyFzLfJAATbyaWooikcaf3bQpPzvqfZStLSwFyjVQKXR3iJAOl1jzqU%2BtB4FkP1dk0KDc6RfV6QYTr9W97bhjID1CKEjoYJ7xkVtyLHCT%2Fo%2FN%2BSH6q%2F9%2BUQDU1sW8gKtX5mHRHsmNVST5ilLgrKlLDO5MB2ffDCbhKcN%2Bxkk4vaZNiUWpwYw2g0FhN8DcHkQXSGeNZRKa1DT7oweKDSKAI0LW69p9QwV5sHcU2zKLe3n9N%2B483e4o4sJcVouqPCmSQPq7GodxJqGynyRUYKrye66JvhfNal2Tc704E5qIWnDhobUWZkHyjT1ZMJOC6tQGOqUBasvwTfZGtN%2BiJR%2B33j4wf3DYb9hnRAFxebRRkkfYRblCmAN14Y3tuCCfVa93BXXJqJNzrg8oHLsVrPsjNAKGITFDuxFmOta3UrB7k1TWjc%2B2qJbCcU2jb2Sku94the6qfgoLdZo5wgpmGE6u0OCA8HdKXw8%2FXYYumP6mZeSftshSU1BU6C1fG2ZlTUXx6HLPsYb1gsQBQf4BC55w1jBPCMgtg9pl&X-Amz-Signature=c21c78b718bcdea4e704832fe25067f70138388d6858d1d75eed3a22d9cbd9b4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QMOX6HSJ%2F20260904%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260904T101302Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECkaCXVzLXdlc3QtMiJHMEUCIDr7OP0pCk2qMkwpO9gdmUVFoGv%2BBiqYa4cgVmHD9EYHAiEAg98xOJ0%2FEKXZTQ%2BSV9UFr%2BA0Ei2AFgQkNwsSVfkjnxcqiAQI8v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDDFJMvr6H6q17NfYHCrcA%2BXx59C6jsjvEiVH9qJBBxwhcx1g5XbnF9n%2Fcir92EUAZQN2LSyZVQ6RW7y0FqstjYHTTZqSBzA4jgdazvqoWpWnNX%2BIgwjdzEV0E7MF4CfxrMn3NdH91aBDi%2B9uW42wBDHtLojB48coLPuC%2BK%2BHPmsjd%2F3A95daazT043CN0Bz%2F7%2FGihz1%2FeqGJtxHhEG75soWShiekUmXgbp1brQeYeTnw9%2FrPkeunpLWDLnxjF%2FDL8DKThtkLn4Xb4LXCXbzGLzozxTbV%2FqDMf8m1wTnjla%2FxcsOhYkpkrnrOYFOE%2BZ1I64bUI4B2jnlR7JqbnOM7iuFiyFzLfJAATbyaWooikcaf3bQpPzvqfZStLSwFyjVQKXR3iJAOl1jzqU%2BtB4FkP1dk0KDc6RfV6QYTr9W97bhjID1CKEjoYJ7xkVtyLHCT%2Fo%2FN%2BSH6q%2F9%2BUQDU1sW8gKtX5mHRHsmNVST5ilLgrKlLDO5MB2ffDCbhKcN%2Bxkk4vaZNiUWpwYw2g0FhN8DcHkQXSGeNZRKa1DT7oweKDSKAI0LW69p9QwV5sHcU2zKLe3n9N%2B483e4o4sJcVouqPCmSQPq7GodxJqGynyRUYKrye66JvhfNal2Tc704E5qIWnDhobUWZkHyjT1ZMJOC6tQGOqUBasvwTfZGtN%2BiJR%2B33j4wf3DYb9hnRAFxebRRkkfYRblCmAN14Y3tuCCfVa93BXXJqJNzrg8oHLsVrPsjNAKGITFDuxFmOta3UrB7k1TWjc%2B2qJbCcU2jb2Sku94the6qfgoLdZo5wgpmGE6u0OCA8HdKXw8%2FXYYumP6mZeSftshSU1BU6C1fG2ZlTUXx6HLPsYb1gsQBQf4BC55w1jBPCMgtg9pl&X-Amz-Signature=d41e782cca51d12a1a3497280297a8bba736fc1dc0d3733a09e3ed9f67ec4e2b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QMOX6HSJ%2F20260904%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260904T101302Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECkaCXVzLXdlc3QtMiJHMEUCIDr7OP0pCk2qMkwpO9gdmUVFoGv%2BBiqYa4cgVmHD9EYHAiEAg98xOJ0%2FEKXZTQ%2BSV9UFr%2BA0Ei2AFgQkNwsSVfkjnxcqiAQI8v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDDFJMvr6H6q17NfYHCrcA%2BXx59C6jsjvEiVH9qJBBxwhcx1g5XbnF9n%2Fcir92EUAZQN2LSyZVQ6RW7y0FqstjYHTTZqSBzA4jgdazvqoWpWnNX%2BIgwjdzEV0E7MF4CfxrMn3NdH91aBDi%2B9uW42wBDHtLojB48coLPuC%2BK%2BHPmsjd%2F3A95daazT043CN0Bz%2F7%2FGihz1%2FeqGJtxHhEG75soWShiekUmXgbp1brQeYeTnw9%2FrPkeunpLWDLnxjF%2FDL8DKThtkLn4Xb4LXCXbzGLzozxTbV%2FqDMf8m1wTnjla%2FxcsOhYkpkrnrOYFOE%2BZ1I64bUI4B2jnlR7JqbnOM7iuFiyFzLfJAATbyaWooikcaf3bQpPzvqfZStLSwFyjVQKXR3iJAOl1jzqU%2BtB4FkP1dk0KDc6RfV6QYTr9W97bhjID1CKEjoYJ7xkVtyLHCT%2Fo%2FN%2BSH6q%2F9%2BUQDU1sW8gKtX5mHRHsmNVST5ilLgrKlLDO5MB2ffDCbhKcN%2Bxkk4vaZNiUWpwYw2g0FhN8DcHkQXSGeNZRKa1DT7oweKDSKAI0LW69p9QwV5sHcU2zKLe3n9N%2B483e4o4sJcVouqPCmSQPq7GodxJqGynyRUYKrye66JvhfNal2Tc704E5qIWnDhobUWZkHyjT1ZMJOC6tQGOqUBasvwTfZGtN%2BiJR%2B33j4wf3DYb9hnRAFxebRRkkfYRblCmAN14Y3tuCCfVa93BXXJqJNzrg8oHLsVrPsjNAKGITFDuxFmOta3UrB7k1TWjc%2B2qJbCcU2jb2Sku94the6qfgoLdZo5wgpmGE6u0OCA8HdKXw8%2FXYYumP6mZeSftshSU1BU6C1fG2ZlTUXx6HLPsYb1gsQBQf4BC55w1jBPCMgtg9pl&X-Amz-Signature=58fcb17f614c2086d6f5b67a10bca6fca9cd61c37e2765cfd5320b7b1f007b46&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QMOX6HSJ%2F20260904%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260904T101302Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECkaCXVzLXdlc3QtMiJHMEUCIDr7OP0pCk2qMkwpO9gdmUVFoGv%2BBiqYa4cgVmHD9EYHAiEAg98xOJ0%2FEKXZTQ%2BSV9UFr%2BA0Ei2AFgQkNwsSVfkjnxcqiAQI8v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDDFJMvr6H6q17NfYHCrcA%2BXx59C6jsjvEiVH9qJBBxwhcx1g5XbnF9n%2Fcir92EUAZQN2LSyZVQ6RW7y0FqstjYHTTZqSBzA4jgdazvqoWpWnNX%2BIgwjdzEV0E7MF4CfxrMn3NdH91aBDi%2B9uW42wBDHtLojB48coLPuC%2BK%2BHPmsjd%2F3A95daazT043CN0Bz%2F7%2FGihz1%2FeqGJtxHhEG75soWShiekUmXgbp1brQeYeTnw9%2FrPkeunpLWDLnxjF%2FDL8DKThtkLn4Xb4LXCXbzGLzozxTbV%2FqDMf8m1wTnjla%2FxcsOhYkpkrnrOYFOE%2BZ1I64bUI4B2jnlR7JqbnOM7iuFiyFzLfJAATbyaWooikcaf3bQpPzvqfZStLSwFyjVQKXR3iJAOl1jzqU%2BtB4FkP1dk0KDc6RfV6QYTr9W97bhjID1CKEjoYJ7xkVtyLHCT%2Fo%2FN%2BSH6q%2F9%2BUQDU1sW8gKtX5mHRHsmNVST5ilLgrKlLDO5MB2ffDCbhKcN%2Bxkk4vaZNiUWpwYw2g0FhN8DcHkQXSGeNZRKa1DT7oweKDSKAI0LW69p9QwV5sHcU2zKLe3n9N%2B483e4o4sJcVouqPCmSQPq7GodxJqGynyRUYKrye66JvhfNal2Tc704E5qIWnDhobUWZkHyjT1ZMJOC6tQGOqUBasvwTfZGtN%2BiJR%2B33j4wf3DYb9hnRAFxebRRkkfYRblCmAN14Y3tuCCfVa93BXXJqJNzrg8oHLsVrPsjNAKGITFDuxFmOta3UrB7k1TWjc%2B2qJbCcU2jb2Sku94the6qfgoLdZo5wgpmGE6u0OCA8HdKXw8%2FXYYumP6mZeSftshSU1BU6C1fG2ZlTUXx6HLPsYb1gsQBQf4BC55w1jBPCMgtg9pl&X-Amz-Signature=3cb2d03347465956e1d67b5799fb08e2dbeadf0183a209004e08a924068b5d42&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
