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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667IL2S2CM%2F20261031%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261031T112330Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIHvBe2KPdNZRnUUlJhjkPOieK6U26nKq%2FIrcNbaeZkKxAiEAoK%2BEQTtpml8KqhDH1svk%2Bn1oB5r%2B11TbVOpzJnzShCEq%2FwMISxAAGgw2Mzc0MjMxODM4MDUiDCuf9e1TiCVmGFSemCrcAy%2F9RaZuO9e6ESfidQaU8ViEg%2BKQ5ww4UWEOzJv93FLeqf8clegfsuEszIU4Y304PptAKKbPxCTWPjJ9Ab7vbUkifL4OO0PMTpEVtdQRjsrWiAPcvsEkSCOPYqmkOBwg1cCVmsiA%2FkjnaWLXqpD5BZ52GYVxzDABgcA2H9qB7NzbVw14%2FrzInG7HNXoA65p4DYpl3GIQyVwKhrGFAX61VizlfbqoERawLKxkd23cVYe%2BPAaMDbhJOzuEpx8IeyB%2FQIFMgkxLlh%2Bxcg%2Fx84c8wcnY%2FePrgpy9pcc%2FDuIX71yZMJsWlgADqaMiqI%2Ba32KUXjIfaVDol1we9acb5mLEyZvXZP4zpzQoIL9dXl63pQJ%2Bp2clt4YXijASQwxebv%2FKtrhEYODmOblxfquAalvG1Lh1l%2FTi0NNd1W56foI%2BrqNKCxct5jc7KycAindQq%2F0ByZgDfOsu%2FSGQEMKPX%2BYzJu%2Fgx4SRRVc4LlQbdyKAw4p9WluL4BKXjF32TUiZCkeXq%2B8Q8dljZyoh7ZAKLGvUOCN%2BtrkTmudBnrDfmv3tTPaXorLB1NBygWzGJdfp6rIpJU4r5e07ENHHXWSzdDyzHW6aKVhxiJUDeFkSiJApJwHULxyHwd9IJhETa%2BDTMIGMl9cGOqUBffjBlp0kDYUjgs8F1R4bCI%2FEidcv8kNZihcD50QHaz2sOhJQCXD3Xlru20jfqhG5Y4VOHtLnzeHR18G%2F0HETOGNyNj2vnskbrR5p4XmtchKcsV4BL7IpSr3KEARK4jJaBaljbsHnq90TvOi4iCjgg18C%2Bps3tQhzqDZKfpbNKDv7%2BNdQ%2B4ydUdcu2%2BfcqVfzRFyDZaU92YLgGLO8FR7CkRKO41Am&X-Amz-Signature=d31b62a12cb104f5c58bcc4b0833e6e60c0174c1c51df222500dbf842254a382&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667IL2S2CM%2F20261031%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261031T112330Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIHvBe2KPdNZRnUUlJhjkPOieK6U26nKq%2FIrcNbaeZkKxAiEAoK%2BEQTtpml8KqhDH1svk%2Bn1oB5r%2B11TbVOpzJnzShCEq%2FwMISxAAGgw2Mzc0MjMxODM4MDUiDCuf9e1TiCVmGFSemCrcAy%2F9RaZuO9e6ESfidQaU8ViEg%2BKQ5ww4UWEOzJv93FLeqf8clegfsuEszIU4Y304PptAKKbPxCTWPjJ9Ab7vbUkifL4OO0PMTpEVtdQRjsrWiAPcvsEkSCOPYqmkOBwg1cCVmsiA%2FkjnaWLXqpD5BZ52GYVxzDABgcA2H9qB7NzbVw14%2FrzInG7HNXoA65p4DYpl3GIQyVwKhrGFAX61VizlfbqoERawLKxkd23cVYe%2BPAaMDbhJOzuEpx8IeyB%2FQIFMgkxLlh%2Bxcg%2Fx84c8wcnY%2FePrgpy9pcc%2FDuIX71yZMJsWlgADqaMiqI%2Ba32KUXjIfaVDol1we9acb5mLEyZvXZP4zpzQoIL9dXl63pQJ%2Bp2clt4YXijASQwxebv%2FKtrhEYODmOblxfquAalvG1Lh1l%2FTi0NNd1W56foI%2BrqNKCxct5jc7KycAindQq%2F0ByZgDfOsu%2FSGQEMKPX%2BYzJu%2Fgx4SRRVc4LlQbdyKAw4p9WluL4BKXjF32TUiZCkeXq%2B8Q8dljZyoh7ZAKLGvUOCN%2BtrkTmudBnrDfmv3tTPaXorLB1NBygWzGJdfp6rIpJU4r5e07ENHHXWSzdDyzHW6aKVhxiJUDeFkSiJApJwHULxyHwd9IJhETa%2BDTMIGMl9cGOqUBffjBlp0kDYUjgs8F1R4bCI%2FEidcv8kNZihcD50QHaz2sOhJQCXD3Xlru20jfqhG5Y4VOHtLnzeHR18G%2F0HETOGNyNj2vnskbrR5p4XmtchKcsV4BL7IpSr3KEARK4jJaBaljbsHnq90TvOi4iCjgg18C%2Bps3tQhzqDZKfpbNKDv7%2BNdQ%2B4ydUdcu2%2BfcqVfzRFyDZaU92YLgGLO8FR7CkRKO41Am&X-Amz-Signature=7e7eef72976a9e5024c4304c3e99e4504b077c162333a216f43c14c564778701&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667IL2S2CM%2F20261031%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261031T112330Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIHvBe2KPdNZRnUUlJhjkPOieK6U26nKq%2FIrcNbaeZkKxAiEAoK%2BEQTtpml8KqhDH1svk%2Bn1oB5r%2B11TbVOpzJnzShCEq%2FwMISxAAGgw2Mzc0MjMxODM4MDUiDCuf9e1TiCVmGFSemCrcAy%2F9RaZuO9e6ESfidQaU8ViEg%2BKQ5ww4UWEOzJv93FLeqf8clegfsuEszIU4Y304PptAKKbPxCTWPjJ9Ab7vbUkifL4OO0PMTpEVtdQRjsrWiAPcvsEkSCOPYqmkOBwg1cCVmsiA%2FkjnaWLXqpD5BZ52GYVxzDABgcA2H9qB7NzbVw14%2FrzInG7HNXoA65p4DYpl3GIQyVwKhrGFAX61VizlfbqoERawLKxkd23cVYe%2BPAaMDbhJOzuEpx8IeyB%2FQIFMgkxLlh%2Bxcg%2Fx84c8wcnY%2FePrgpy9pcc%2FDuIX71yZMJsWlgADqaMiqI%2Ba32KUXjIfaVDol1we9acb5mLEyZvXZP4zpzQoIL9dXl63pQJ%2Bp2clt4YXijASQwxebv%2FKtrhEYODmOblxfquAalvG1Lh1l%2FTi0NNd1W56foI%2BrqNKCxct5jc7KycAindQq%2F0ByZgDfOsu%2FSGQEMKPX%2BYzJu%2Fgx4SRRVc4LlQbdyKAw4p9WluL4BKXjF32TUiZCkeXq%2B8Q8dljZyoh7ZAKLGvUOCN%2BtrkTmudBnrDfmv3tTPaXorLB1NBygWzGJdfp6rIpJU4r5e07ENHHXWSzdDyzHW6aKVhxiJUDeFkSiJApJwHULxyHwd9IJhETa%2BDTMIGMl9cGOqUBffjBlp0kDYUjgs8F1R4bCI%2FEidcv8kNZihcD50QHaz2sOhJQCXD3Xlru20jfqhG5Y4VOHtLnzeHR18G%2F0HETOGNyNj2vnskbrR5p4XmtchKcsV4BL7IpSr3KEARK4jJaBaljbsHnq90TvOi4iCjgg18C%2Bps3tQhzqDZKfpbNKDv7%2BNdQ%2B4ydUdcu2%2BfcqVfzRFyDZaU92YLgGLO8FR7CkRKO41Am&X-Amz-Signature=7c8c1d5c8a72727b7782a1209ded9c496db413ae96dd45a069f3354328739e9d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667IL2S2CM%2F20261031%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261031T112330Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIHvBe2KPdNZRnUUlJhjkPOieK6U26nKq%2FIrcNbaeZkKxAiEAoK%2BEQTtpml8KqhDH1svk%2Bn1oB5r%2B11TbVOpzJnzShCEq%2FwMISxAAGgw2Mzc0MjMxODM4MDUiDCuf9e1TiCVmGFSemCrcAy%2F9RaZuO9e6ESfidQaU8ViEg%2BKQ5ww4UWEOzJv93FLeqf8clegfsuEszIU4Y304PptAKKbPxCTWPjJ9Ab7vbUkifL4OO0PMTpEVtdQRjsrWiAPcvsEkSCOPYqmkOBwg1cCVmsiA%2FkjnaWLXqpD5BZ52GYVxzDABgcA2H9qB7NzbVw14%2FrzInG7HNXoA65p4DYpl3GIQyVwKhrGFAX61VizlfbqoERawLKxkd23cVYe%2BPAaMDbhJOzuEpx8IeyB%2FQIFMgkxLlh%2Bxcg%2Fx84c8wcnY%2FePrgpy9pcc%2FDuIX71yZMJsWlgADqaMiqI%2Ba32KUXjIfaVDol1we9acb5mLEyZvXZP4zpzQoIL9dXl63pQJ%2Bp2clt4YXijASQwxebv%2FKtrhEYODmOblxfquAalvG1Lh1l%2FTi0NNd1W56foI%2BrqNKCxct5jc7KycAindQq%2F0ByZgDfOsu%2FSGQEMKPX%2BYzJu%2Fgx4SRRVc4LlQbdyKAw4p9WluL4BKXjF32TUiZCkeXq%2B8Q8dljZyoh7ZAKLGvUOCN%2BtrkTmudBnrDfmv3tTPaXorLB1NBygWzGJdfp6rIpJU4r5e07ENHHXWSzdDyzHW6aKVhxiJUDeFkSiJApJwHULxyHwd9IJhETa%2BDTMIGMl9cGOqUBffjBlp0kDYUjgs8F1R4bCI%2FEidcv8kNZihcD50QHaz2sOhJQCXD3Xlru20jfqhG5Y4VOHtLnzeHR18G%2F0HETOGNyNj2vnskbrR5p4XmtchKcsV4BL7IpSr3KEARK4jJaBaljbsHnq90TvOi4iCjgg18C%2Bps3tQhzqDZKfpbNKDv7%2BNdQ%2B4ydUdcu2%2BfcqVfzRFyDZaU92YLgGLO8FR7CkRKO41Am&X-Amz-Signature=bb02009d1693c0e0973eda6b8448292fdd43e13468d6e71eb6670b25250ee168&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
