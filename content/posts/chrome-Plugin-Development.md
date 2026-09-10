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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666VGSTCT6%2F20260910%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260910T201158Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDzUHnbqNWJ8vtbqNHRdQ6sgPW8YEebVEEbIxKuG61eLwIhAJGMxjrfgco3faopyF7rwqLS0MRmV8Dn%2FJzwUWnBieuUKogECIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzjJ55Sq23OmR4fwbUq3AM%2BhStJ%2BVrdG4OeNE3ANEVqUDfBnU7%2FDwrbdf13%2Bz5ae8qhBtLEOPTlUUQpgTU2P9Tv7YW9HmJmAECdIGToTSDx22MNOWoYWMc85y9TtL316zISCxpJRDe%2F%2FGTdPnyZWtUAHzZz94usRJMOr8rZZdG7drfnpqCVsc7YVCSuUrVy11q6jKHqitgpwiMNP2Z35lKoslIfMsGLBj4t0MxRpeYvq9gNDbA2r2u4HcF5DtGHqXd5rV5ZAxTJiUPV757mR6gJAcRAy3VrJbTPDWTof2AH029W8Q6zDhN1ThROC7FBkiF57uLStMwD64PejpKbiOWHjdmVTcp9KhDoVbQbjYhGkI4PW0k1wVJy%2FVhJhTdnRHy58lJCKGlAGqZ%2Ba%2BKPvgzYBXD6BL0Gjr5D1sOt6dsNRHCNXcV%2BYzGzKf9BqZit%2Bs15AgnkeSKNhPdkMZoNjoux2ueo1wBcyavpu7nmiujhlSbxe2x%2B%2F7dMDtgc6JAJrvYLgNOaXYkoC6n5YH00WxKcfHXM3d%2F0BtFFNdfgPVV2rPakx1QBJsnq2xT2BNuUjCk2l%2FxPQLM%2FYZIpIc3OsmITJ2DLhgrkzfXwQDW5rbE7kiaubMgb5Z4%2BEuZAtWXBaepMBxGg3TObSnUfGzCV%2FovVBjqkAfP3XFvNDX7jkh%2BAfL7xGXxV3QVx6Hosnc3ppVP47qzvkep%2BFeZzktK%2Fjkpv6Qjk%2B4wIJZsLyG0G4p4YaVp%2BHaDlbnNm9WuixL21DW%2B1IrvaZ1dHYixrHh2Y%2B6h5xQmV3xxTZ24fgiX3EJa14jgHqzCWKc%2BY42dDt8hCqOlJb%2FOpRfwWLiOCYi86d2Bv6mUtwN%2BzWef7E6%2FVPn%2F5c6b%2FTnuwWQyj&X-Amz-Signature=efee8335a94166e0d13926b3ec4b448ec62f01e5f0b9cba592d857f380e440b5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666VGSTCT6%2F20260910%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260910T201158Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDzUHnbqNWJ8vtbqNHRdQ6sgPW8YEebVEEbIxKuG61eLwIhAJGMxjrfgco3faopyF7rwqLS0MRmV8Dn%2FJzwUWnBieuUKogECIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzjJ55Sq23OmR4fwbUq3AM%2BhStJ%2BVrdG4OeNE3ANEVqUDfBnU7%2FDwrbdf13%2Bz5ae8qhBtLEOPTlUUQpgTU2P9Tv7YW9HmJmAECdIGToTSDx22MNOWoYWMc85y9TtL316zISCxpJRDe%2F%2FGTdPnyZWtUAHzZz94usRJMOr8rZZdG7drfnpqCVsc7YVCSuUrVy11q6jKHqitgpwiMNP2Z35lKoslIfMsGLBj4t0MxRpeYvq9gNDbA2r2u4HcF5DtGHqXd5rV5ZAxTJiUPV757mR6gJAcRAy3VrJbTPDWTof2AH029W8Q6zDhN1ThROC7FBkiF57uLStMwD64PejpKbiOWHjdmVTcp9KhDoVbQbjYhGkI4PW0k1wVJy%2FVhJhTdnRHy58lJCKGlAGqZ%2Ba%2BKPvgzYBXD6BL0Gjr5D1sOt6dsNRHCNXcV%2BYzGzKf9BqZit%2Bs15AgnkeSKNhPdkMZoNjoux2ueo1wBcyavpu7nmiujhlSbxe2x%2B%2F7dMDtgc6JAJrvYLgNOaXYkoC6n5YH00WxKcfHXM3d%2F0BtFFNdfgPVV2rPakx1QBJsnq2xT2BNuUjCk2l%2FxPQLM%2FYZIpIc3OsmITJ2DLhgrkzfXwQDW5rbE7kiaubMgb5Z4%2BEuZAtWXBaepMBxGg3TObSnUfGzCV%2FovVBjqkAfP3XFvNDX7jkh%2BAfL7xGXxV3QVx6Hosnc3ppVP47qzvkep%2BFeZzktK%2Fjkpv6Qjk%2B4wIJZsLyG0G4p4YaVp%2BHaDlbnNm9WuixL21DW%2B1IrvaZ1dHYixrHh2Y%2B6h5xQmV3xxTZ24fgiX3EJa14jgHqzCWKc%2BY42dDt8hCqOlJb%2FOpRfwWLiOCYi86d2Bv6mUtwN%2BzWef7E6%2FVPn%2F5c6b%2FTnuwWQyj&X-Amz-Signature=d9e4ae0441ec8fa72d655bf44a8e57c71e777a541632eacf4da86277be9e4a4d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666VGSTCT6%2F20260910%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260910T201158Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDzUHnbqNWJ8vtbqNHRdQ6sgPW8YEebVEEbIxKuG61eLwIhAJGMxjrfgco3faopyF7rwqLS0MRmV8Dn%2FJzwUWnBieuUKogECIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzjJ55Sq23OmR4fwbUq3AM%2BhStJ%2BVrdG4OeNE3ANEVqUDfBnU7%2FDwrbdf13%2Bz5ae8qhBtLEOPTlUUQpgTU2P9Tv7YW9HmJmAECdIGToTSDx22MNOWoYWMc85y9TtL316zISCxpJRDe%2F%2FGTdPnyZWtUAHzZz94usRJMOr8rZZdG7drfnpqCVsc7YVCSuUrVy11q6jKHqitgpwiMNP2Z35lKoslIfMsGLBj4t0MxRpeYvq9gNDbA2r2u4HcF5DtGHqXd5rV5ZAxTJiUPV757mR6gJAcRAy3VrJbTPDWTof2AH029W8Q6zDhN1ThROC7FBkiF57uLStMwD64PejpKbiOWHjdmVTcp9KhDoVbQbjYhGkI4PW0k1wVJy%2FVhJhTdnRHy58lJCKGlAGqZ%2Ba%2BKPvgzYBXD6BL0Gjr5D1sOt6dsNRHCNXcV%2BYzGzKf9BqZit%2Bs15AgnkeSKNhPdkMZoNjoux2ueo1wBcyavpu7nmiujhlSbxe2x%2B%2F7dMDtgc6JAJrvYLgNOaXYkoC6n5YH00WxKcfHXM3d%2F0BtFFNdfgPVV2rPakx1QBJsnq2xT2BNuUjCk2l%2FxPQLM%2FYZIpIc3OsmITJ2DLhgrkzfXwQDW5rbE7kiaubMgb5Z4%2BEuZAtWXBaepMBxGg3TObSnUfGzCV%2FovVBjqkAfP3XFvNDX7jkh%2BAfL7xGXxV3QVx6Hosnc3ppVP47qzvkep%2BFeZzktK%2Fjkpv6Qjk%2B4wIJZsLyG0G4p4YaVp%2BHaDlbnNm9WuixL21DW%2B1IrvaZ1dHYixrHh2Y%2B6h5xQmV3xxTZ24fgiX3EJa14jgHqzCWKc%2BY42dDt8hCqOlJb%2FOpRfwWLiOCYi86d2Bv6mUtwN%2BzWef7E6%2FVPn%2F5c6b%2FTnuwWQyj&X-Amz-Signature=2ce40e0748ce893419867ef6dc8202c6aec07d1a6c63c463a76c9e0d540ebff6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666VGSTCT6%2F20260910%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260910T201158Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDzUHnbqNWJ8vtbqNHRdQ6sgPW8YEebVEEbIxKuG61eLwIhAJGMxjrfgco3faopyF7rwqLS0MRmV8Dn%2FJzwUWnBieuUKogECIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzjJ55Sq23OmR4fwbUq3AM%2BhStJ%2BVrdG4OeNE3ANEVqUDfBnU7%2FDwrbdf13%2Bz5ae8qhBtLEOPTlUUQpgTU2P9Tv7YW9HmJmAECdIGToTSDx22MNOWoYWMc85y9TtL316zISCxpJRDe%2F%2FGTdPnyZWtUAHzZz94usRJMOr8rZZdG7drfnpqCVsc7YVCSuUrVy11q6jKHqitgpwiMNP2Z35lKoslIfMsGLBj4t0MxRpeYvq9gNDbA2r2u4HcF5DtGHqXd5rV5ZAxTJiUPV757mR6gJAcRAy3VrJbTPDWTof2AH029W8Q6zDhN1ThROC7FBkiF57uLStMwD64PejpKbiOWHjdmVTcp9KhDoVbQbjYhGkI4PW0k1wVJy%2FVhJhTdnRHy58lJCKGlAGqZ%2Ba%2BKPvgzYBXD6BL0Gjr5D1sOt6dsNRHCNXcV%2BYzGzKf9BqZit%2Bs15AgnkeSKNhPdkMZoNjoux2ueo1wBcyavpu7nmiujhlSbxe2x%2B%2F7dMDtgc6JAJrvYLgNOaXYkoC6n5YH00WxKcfHXM3d%2F0BtFFNdfgPVV2rPakx1QBJsnq2xT2BNuUjCk2l%2FxPQLM%2FYZIpIc3OsmITJ2DLhgrkzfXwQDW5rbE7kiaubMgb5Z4%2BEuZAtWXBaepMBxGg3TObSnUfGzCV%2FovVBjqkAfP3XFvNDX7jkh%2BAfL7xGXxV3QVx6Hosnc3ppVP47qzvkep%2BFeZzktK%2Fjkpv6Qjk%2B4wIJZsLyG0G4p4YaVp%2BHaDlbnNm9WuixL21DW%2B1IrvaZ1dHYixrHh2Y%2B6h5xQmV3xxTZ24fgiX3EJa14jgHqzCWKc%2BY42dDt8hCqOlJb%2FOpRfwWLiOCYi86d2Bv6mUtwN%2BzWef7E6%2FVPn%2F5c6b%2FTnuwWQyj&X-Amz-Signature=1e55bde4dc956d4a0d6050a08aec5810de1e579619c92432eda859908eec5e4e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
