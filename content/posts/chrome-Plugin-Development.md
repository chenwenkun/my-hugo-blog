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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664GIY7K4R%2F20261029%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261029T174916Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFkaCXVzLXdlc3QtMiJHMEUCIEkDKZbmg3uM3Iq1aYuv8T5y198uzLL%2F7O%2FInWOvrPkUAiEAh8tezLTEoFKR8pSFEiBuniVUbKZTy3Pu8Q%2B%2FwC2HL8Uq%2FwMIIhAAGgw2Mzc0MjMxODM4MDUiDB%2FaMpZP4rYOOg%2BRXircA5PbqX21eJFQeZlfCPCB11d4Dnec0%2BL%2F21%2B1mFPhtmU0LV2Gd%2Bv5bCa67iLsezP4mpGsRGNv5%2BiPCPI7MwJhU4cxlF8%2BqGfkURWTMaGknc4NbRH%2B%2FBZQQs6eY1TGd9WbiT1X2JJrqgxG5V9KlDOxhbn1X6USrFIODNd%2BqROWVjKYN54AgAJEA48R3tUvl6%2FTpe%2FACPYJHgm2eX0pkNM5nZDEvRuIPzpn6V1CZQTgHoCraBayNfP7G0sDHsolYLdlMP28hn5XqBgV8LikISzbk%2BbJcvPdnmWm%2F166kqGxm%2FyPTMsLHxN3XdObKJqCyZs6DtNQai7zEK0GBcNEfD2j5qVcZIoEJvIU9nu0C4Rt2cUPFW5tfIJuKQSGnH9kIw09qG5Zg3dbUTjG3lCddKd%2Bqjt%2B2aXPstt5VNzof%2BUgpz7I3gwb1QjaYvA6Brw5DNSEQEU1Vq3ppEBxY4JAdvJEDeIkh%2FrlItvhweVKRY9dj%2BFC0934mDsxmuGqBTjafA%2BksEPE2zIDBCqZaAuxC8sf%2F2wTMD50veR%2B%2Fab3WRMrCQcLH%2BrpA1c2INJL4HXtgTbmSIFLn3qTxczPYkWuv54u30g7flly2Dn%2FzHRR2eoIQKvkxS8Za4aP3szl0OpkMPXzjdcGOqUBqBXRbj7EvkdFSmAJB%2B5YhKeSOj8eXFxgFtSFj4%2BYoaBOtfejF6Vi54HASR4SEFdiEAAv%2FaioVbILc%2F3Q6B2%2FZNvHhBR6J%2B%2FILUWPhom653H2snwl7%2FdYjRCCKbTDR%2Fu3CFeOX7G%2FTTIvL0s9pyfFKiCvm%2FVQcvIvrkLW74Q2pC31tNaVInGVamM7RY2mLyfMt5wBZuhqFEg8KnXVcT5vZrtHyT1I&X-Amz-Signature=2dc5b5e2455d98510aba4ce9d7108567dd79d49b4898920e89429df407c91ad7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664GIY7K4R%2F20261029%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261029T174916Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFkaCXVzLXdlc3QtMiJHMEUCIEkDKZbmg3uM3Iq1aYuv8T5y198uzLL%2F7O%2FInWOvrPkUAiEAh8tezLTEoFKR8pSFEiBuniVUbKZTy3Pu8Q%2B%2FwC2HL8Uq%2FwMIIhAAGgw2Mzc0MjMxODM4MDUiDB%2FaMpZP4rYOOg%2BRXircA5PbqX21eJFQeZlfCPCB11d4Dnec0%2BL%2F21%2B1mFPhtmU0LV2Gd%2Bv5bCa67iLsezP4mpGsRGNv5%2BiPCPI7MwJhU4cxlF8%2BqGfkURWTMaGknc4NbRH%2B%2FBZQQs6eY1TGd9WbiT1X2JJrqgxG5V9KlDOxhbn1X6USrFIODNd%2BqROWVjKYN54AgAJEA48R3tUvl6%2FTpe%2FACPYJHgm2eX0pkNM5nZDEvRuIPzpn6V1CZQTgHoCraBayNfP7G0sDHsolYLdlMP28hn5XqBgV8LikISzbk%2BbJcvPdnmWm%2F166kqGxm%2FyPTMsLHxN3XdObKJqCyZs6DtNQai7zEK0GBcNEfD2j5qVcZIoEJvIU9nu0C4Rt2cUPFW5tfIJuKQSGnH9kIw09qG5Zg3dbUTjG3lCddKd%2Bqjt%2B2aXPstt5VNzof%2BUgpz7I3gwb1QjaYvA6Brw5DNSEQEU1Vq3ppEBxY4JAdvJEDeIkh%2FrlItvhweVKRY9dj%2BFC0934mDsxmuGqBTjafA%2BksEPE2zIDBCqZaAuxC8sf%2F2wTMD50veR%2B%2Fab3WRMrCQcLH%2BrpA1c2INJL4HXtgTbmSIFLn3qTxczPYkWuv54u30g7flly2Dn%2FzHRR2eoIQKvkxS8Za4aP3szl0OpkMPXzjdcGOqUBqBXRbj7EvkdFSmAJB%2B5YhKeSOj8eXFxgFtSFj4%2BYoaBOtfejF6Vi54HASR4SEFdiEAAv%2FaioVbILc%2F3Q6B2%2FZNvHhBR6J%2B%2FILUWPhom653H2snwl7%2FdYjRCCKbTDR%2Fu3CFeOX7G%2FTTIvL0s9pyfFKiCvm%2FVQcvIvrkLW74Q2pC31tNaVInGVamM7RY2mLyfMt5wBZuhqFEg8KnXVcT5vZrtHyT1I&X-Amz-Signature=8d42ca9c427bf18a34dec9aff192d8dd89b1484f862fcda698138efa035b11ea&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664GIY7K4R%2F20261029%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261029T174916Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFkaCXVzLXdlc3QtMiJHMEUCIEkDKZbmg3uM3Iq1aYuv8T5y198uzLL%2F7O%2FInWOvrPkUAiEAh8tezLTEoFKR8pSFEiBuniVUbKZTy3Pu8Q%2B%2FwC2HL8Uq%2FwMIIhAAGgw2Mzc0MjMxODM4MDUiDB%2FaMpZP4rYOOg%2BRXircA5PbqX21eJFQeZlfCPCB11d4Dnec0%2BL%2F21%2B1mFPhtmU0LV2Gd%2Bv5bCa67iLsezP4mpGsRGNv5%2BiPCPI7MwJhU4cxlF8%2BqGfkURWTMaGknc4NbRH%2B%2FBZQQs6eY1TGd9WbiT1X2JJrqgxG5V9KlDOxhbn1X6USrFIODNd%2BqROWVjKYN54AgAJEA48R3tUvl6%2FTpe%2FACPYJHgm2eX0pkNM5nZDEvRuIPzpn6V1CZQTgHoCraBayNfP7G0sDHsolYLdlMP28hn5XqBgV8LikISzbk%2BbJcvPdnmWm%2F166kqGxm%2FyPTMsLHxN3XdObKJqCyZs6DtNQai7zEK0GBcNEfD2j5qVcZIoEJvIU9nu0C4Rt2cUPFW5tfIJuKQSGnH9kIw09qG5Zg3dbUTjG3lCddKd%2Bqjt%2B2aXPstt5VNzof%2BUgpz7I3gwb1QjaYvA6Brw5DNSEQEU1Vq3ppEBxY4JAdvJEDeIkh%2FrlItvhweVKRY9dj%2BFC0934mDsxmuGqBTjafA%2BksEPE2zIDBCqZaAuxC8sf%2F2wTMD50veR%2B%2Fab3WRMrCQcLH%2BrpA1c2INJL4HXtgTbmSIFLn3qTxczPYkWuv54u30g7flly2Dn%2FzHRR2eoIQKvkxS8Za4aP3szl0OpkMPXzjdcGOqUBqBXRbj7EvkdFSmAJB%2B5YhKeSOj8eXFxgFtSFj4%2BYoaBOtfejF6Vi54HASR4SEFdiEAAv%2FaioVbILc%2F3Q6B2%2FZNvHhBR6J%2B%2FILUWPhom653H2snwl7%2FdYjRCCKbTDR%2Fu3CFeOX7G%2FTTIvL0s9pyfFKiCvm%2FVQcvIvrkLW74Q2pC31tNaVInGVamM7RY2mLyfMt5wBZuhqFEg8KnXVcT5vZrtHyT1I&X-Amz-Signature=b07f7e307447ff8da68af821b75e2ae597967980eec3371d68c3f365b9df8cae&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664GIY7K4R%2F20261029%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261029T174916Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFkaCXVzLXdlc3QtMiJHMEUCIEkDKZbmg3uM3Iq1aYuv8T5y198uzLL%2F7O%2FInWOvrPkUAiEAh8tezLTEoFKR8pSFEiBuniVUbKZTy3Pu8Q%2B%2FwC2HL8Uq%2FwMIIhAAGgw2Mzc0MjMxODM4MDUiDB%2FaMpZP4rYOOg%2BRXircA5PbqX21eJFQeZlfCPCB11d4Dnec0%2BL%2F21%2B1mFPhtmU0LV2Gd%2Bv5bCa67iLsezP4mpGsRGNv5%2BiPCPI7MwJhU4cxlF8%2BqGfkURWTMaGknc4NbRH%2B%2FBZQQs6eY1TGd9WbiT1X2JJrqgxG5V9KlDOxhbn1X6USrFIODNd%2BqROWVjKYN54AgAJEA48R3tUvl6%2FTpe%2FACPYJHgm2eX0pkNM5nZDEvRuIPzpn6V1CZQTgHoCraBayNfP7G0sDHsolYLdlMP28hn5XqBgV8LikISzbk%2BbJcvPdnmWm%2F166kqGxm%2FyPTMsLHxN3XdObKJqCyZs6DtNQai7zEK0GBcNEfD2j5qVcZIoEJvIU9nu0C4Rt2cUPFW5tfIJuKQSGnH9kIw09qG5Zg3dbUTjG3lCddKd%2Bqjt%2B2aXPstt5VNzof%2BUgpz7I3gwb1QjaYvA6Brw5DNSEQEU1Vq3ppEBxY4JAdvJEDeIkh%2FrlItvhweVKRY9dj%2BFC0934mDsxmuGqBTjafA%2BksEPE2zIDBCqZaAuxC8sf%2F2wTMD50veR%2B%2Fab3WRMrCQcLH%2BrpA1c2INJL4HXtgTbmSIFLn3qTxczPYkWuv54u30g7flly2Dn%2FzHRR2eoIQKvkxS8Za4aP3szl0OpkMPXzjdcGOqUBqBXRbj7EvkdFSmAJB%2B5YhKeSOj8eXFxgFtSFj4%2BYoaBOtfejF6Vi54HASR4SEFdiEAAv%2FaioVbILc%2F3Q6B2%2FZNvHhBR6J%2B%2FILUWPhom653H2snwl7%2FdYjRCCKbTDR%2Fu3CFeOX7G%2FTTIvL0s9pyfFKiCvm%2FVQcvIvrkLW74Q2pC31tNaVInGVamM7RY2mLyfMt5wBZuhqFEg8KnXVcT5vZrtHyT1I&X-Amz-Signature=2ae71e56d23555b8aacfc4095ed71fb63acff8efbbefc184fed73f0c9b42ab8c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
