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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UMXBQRAA%2F20260914%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260914T171238Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECEaCXVzLXdlc3QtMiJHMEUCIQCJwNqnaBXH2He4TAcoRltE0jOGk5VcIFMrcpY%2FaLunOwIgT0o5IKh3GL3R0nalMrY%2B%2Bj0NwiY2ImqgG%2FJ8%2Fi0KpacqiAQI6v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDAMDK4DRRTZFkwF7BCrcA79m2c7Z9gL82D61R5LQlJTjUdkGsq%2FHgOdZFq%2BdmpZi%2FteWDE9ytkXFBz%2F93iTPmtazwBt%2BTT5ZvfpjTuUGk%2BGEt2KMBG4QGNdtggNFLmovpAvAD9uPWIR6q1kvyzOKJHeOoKMna4W4%2BQ%2Bz2kx6tgc5dYVBO71nGKWmgylQckWK6m7OM3Ov8OXsou8bcnvt2YisN%2BkOT1qZvDOPry6%2ByySN3U%2B5CZ5%2FLztrauXsLn1AnshmNmjGImxAlLrgkq5FW11c9Q7d%2BBR%2B%2F6B2baYuKYas0Dxaw0tQLEI399yGbAd%2Bev9IKiN9mH0sDY%2Bu5aencnXV%2BOb1Hw37gYI3TpHIXgloA%2BewFMwJb2Bg30Xl0Pl3gU18A1QlNJP4SMk9wNGDPr9vr63pWC3WiU2AxQEnuQFbiL%2BeqW7HA8wRa2aUk3tFUgv2tqgCCWFTbVQ6y5ljKV8nNgJEPEkgnMhO23mu0UVHrFRIOhhGY9WC%2Bp41Il1Av1pNZB%2Bnq3fNAHE2NoeSGlXsAKXiyWSXNGHMhd00tvJ%2B9fFnkGT8Z2hbvPbUB%2FOao4MDUXEIpsdiuJ6QwZlByElSmC76ZAgUyPT2zvT%2BNZQ4KWTrx0Z9NEMDk1kCbE0vHFbWtCuhW2sonIxwMK7EoNUGOqUBwHPBcpxgNdsjVuugWjUua0kjWc1MP0VJcTarsbFHt%2F%2FQoXcoeOqW5aB9DX3xAlXa%2Fu40B3EXKNLG4lhgIyJWzYq2xlUaTeBZTV87DAamrGRVQ7eqlvZQaUcz4RbChDxUSx6mK5IALzMLww5uTbQqja%2FuNDaXMkSDSgzcjRr32x8YjtyBvaJOwdaOe2Ux2u3gPHlptD8%2BJWWumI2t2uPEQtEjTXIw&X-Amz-Signature=95d18a4adcd16196e7c5e8837a86c96079f78d19ed9ac7c693ae7418ef42b30b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UMXBQRAA%2F20260914%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260914T171238Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECEaCXVzLXdlc3QtMiJHMEUCIQCJwNqnaBXH2He4TAcoRltE0jOGk5VcIFMrcpY%2FaLunOwIgT0o5IKh3GL3R0nalMrY%2B%2Bj0NwiY2ImqgG%2FJ8%2Fi0KpacqiAQI6v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDAMDK4DRRTZFkwF7BCrcA79m2c7Z9gL82D61R5LQlJTjUdkGsq%2FHgOdZFq%2BdmpZi%2FteWDE9ytkXFBz%2F93iTPmtazwBt%2BTT5ZvfpjTuUGk%2BGEt2KMBG4QGNdtggNFLmovpAvAD9uPWIR6q1kvyzOKJHeOoKMna4W4%2BQ%2Bz2kx6tgc5dYVBO71nGKWmgylQckWK6m7OM3Ov8OXsou8bcnvt2YisN%2BkOT1qZvDOPry6%2ByySN3U%2B5CZ5%2FLztrauXsLn1AnshmNmjGImxAlLrgkq5FW11c9Q7d%2BBR%2B%2F6B2baYuKYas0Dxaw0tQLEI399yGbAd%2Bev9IKiN9mH0sDY%2Bu5aencnXV%2BOb1Hw37gYI3TpHIXgloA%2BewFMwJb2Bg30Xl0Pl3gU18A1QlNJP4SMk9wNGDPr9vr63pWC3WiU2AxQEnuQFbiL%2BeqW7HA8wRa2aUk3tFUgv2tqgCCWFTbVQ6y5ljKV8nNgJEPEkgnMhO23mu0UVHrFRIOhhGY9WC%2Bp41Il1Av1pNZB%2Bnq3fNAHE2NoeSGlXsAKXiyWSXNGHMhd00tvJ%2B9fFnkGT8Z2hbvPbUB%2FOao4MDUXEIpsdiuJ6QwZlByElSmC76ZAgUyPT2zvT%2BNZQ4KWTrx0Z9NEMDk1kCbE0vHFbWtCuhW2sonIxwMK7EoNUGOqUBwHPBcpxgNdsjVuugWjUua0kjWc1MP0VJcTarsbFHt%2F%2FQoXcoeOqW5aB9DX3xAlXa%2Fu40B3EXKNLG4lhgIyJWzYq2xlUaTeBZTV87DAamrGRVQ7eqlvZQaUcz4RbChDxUSx6mK5IALzMLww5uTbQqja%2FuNDaXMkSDSgzcjRr32x8YjtyBvaJOwdaOe2Ux2u3gPHlptD8%2BJWWumI2t2uPEQtEjTXIw&X-Amz-Signature=927a0ad72ba06d931d69baf76fd7ca076e5176b0076eaac74a73418d2501f7cc&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UMXBQRAA%2F20260914%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260914T171238Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECEaCXVzLXdlc3QtMiJHMEUCIQCJwNqnaBXH2He4TAcoRltE0jOGk5VcIFMrcpY%2FaLunOwIgT0o5IKh3GL3R0nalMrY%2B%2Bj0NwiY2ImqgG%2FJ8%2Fi0KpacqiAQI6v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDAMDK4DRRTZFkwF7BCrcA79m2c7Z9gL82D61R5LQlJTjUdkGsq%2FHgOdZFq%2BdmpZi%2FteWDE9ytkXFBz%2F93iTPmtazwBt%2BTT5ZvfpjTuUGk%2BGEt2KMBG4QGNdtggNFLmovpAvAD9uPWIR6q1kvyzOKJHeOoKMna4W4%2BQ%2Bz2kx6tgc5dYVBO71nGKWmgylQckWK6m7OM3Ov8OXsou8bcnvt2YisN%2BkOT1qZvDOPry6%2ByySN3U%2B5CZ5%2FLztrauXsLn1AnshmNmjGImxAlLrgkq5FW11c9Q7d%2BBR%2B%2F6B2baYuKYas0Dxaw0tQLEI399yGbAd%2Bev9IKiN9mH0sDY%2Bu5aencnXV%2BOb1Hw37gYI3TpHIXgloA%2BewFMwJb2Bg30Xl0Pl3gU18A1QlNJP4SMk9wNGDPr9vr63pWC3WiU2AxQEnuQFbiL%2BeqW7HA8wRa2aUk3tFUgv2tqgCCWFTbVQ6y5ljKV8nNgJEPEkgnMhO23mu0UVHrFRIOhhGY9WC%2Bp41Il1Av1pNZB%2Bnq3fNAHE2NoeSGlXsAKXiyWSXNGHMhd00tvJ%2B9fFnkGT8Z2hbvPbUB%2FOao4MDUXEIpsdiuJ6QwZlByElSmC76ZAgUyPT2zvT%2BNZQ4KWTrx0Z9NEMDk1kCbE0vHFbWtCuhW2sonIxwMK7EoNUGOqUBwHPBcpxgNdsjVuugWjUua0kjWc1MP0VJcTarsbFHt%2F%2FQoXcoeOqW5aB9DX3xAlXa%2Fu40B3EXKNLG4lhgIyJWzYq2xlUaTeBZTV87DAamrGRVQ7eqlvZQaUcz4RbChDxUSx6mK5IALzMLww5uTbQqja%2FuNDaXMkSDSgzcjRr32x8YjtyBvaJOwdaOe2Ux2u3gPHlptD8%2BJWWumI2t2uPEQtEjTXIw&X-Amz-Signature=474776b6af99f9a4afc094d5c9d60fd36b65a62d3a57d5c18c433ef9cd22a1b7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UMXBQRAA%2F20260914%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260914T171238Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECEaCXVzLXdlc3QtMiJHMEUCIQCJwNqnaBXH2He4TAcoRltE0jOGk5VcIFMrcpY%2FaLunOwIgT0o5IKh3GL3R0nalMrY%2B%2Bj0NwiY2ImqgG%2FJ8%2Fi0KpacqiAQI6v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDAMDK4DRRTZFkwF7BCrcA79m2c7Z9gL82D61R5LQlJTjUdkGsq%2FHgOdZFq%2BdmpZi%2FteWDE9ytkXFBz%2F93iTPmtazwBt%2BTT5ZvfpjTuUGk%2BGEt2KMBG4QGNdtggNFLmovpAvAD9uPWIR6q1kvyzOKJHeOoKMna4W4%2BQ%2Bz2kx6tgc5dYVBO71nGKWmgylQckWK6m7OM3Ov8OXsou8bcnvt2YisN%2BkOT1qZvDOPry6%2ByySN3U%2B5CZ5%2FLztrauXsLn1AnshmNmjGImxAlLrgkq5FW11c9Q7d%2BBR%2B%2F6B2baYuKYas0Dxaw0tQLEI399yGbAd%2Bev9IKiN9mH0sDY%2Bu5aencnXV%2BOb1Hw37gYI3TpHIXgloA%2BewFMwJb2Bg30Xl0Pl3gU18A1QlNJP4SMk9wNGDPr9vr63pWC3WiU2AxQEnuQFbiL%2BeqW7HA8wRa2aUk3tFUgv2tqgCCWFTbVQ6y5ljKV8nNgJEPEkgnMhO23mu0UVHrFRIOhhGY9WC%2Bp41Il1Av1pNZB%2Bnq3fNAHE2NoeSGlXsAKXiyWSXNGHMhd00tvJ%2B9fFnkGT8Z2hbvPbUB%2FOao4MDUXEIpsdiuJ6QwZlByElSmC76ZAgUyPT2zvT%2BNZQ4KWTrx0Z9NEMDk1kCbE0vHFbWtCuhW2sonIxwMK7EoNUGOqUBwHPBcpxgNdsjVuugWjUua0kjWc1MP0VJcTarsbFHt%2F%2FQoXcoeOqW5aB9DX3xAlXa%2Fu40B3EXKNLG4lhgIyJWzYq2xlUaTeBZTV87DAamrGRVQ7eqlvZQaUcz4RbChDxUSx6mK5IALzMLww5uTbQqja%2FuNDaXMkSDSgzcjRr32x8YjtyBvaJOwdaOe2Ux2u3gPHlptD8%2BJWWumI2t2uPEQtEjTXIw&X-Amz-Signature=1901f3c599f37679c71c8e4552f4f5514ef74158b914104c63278229c9c8e03c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
