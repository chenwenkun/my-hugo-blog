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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666UG443QP%2F20260811%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260811T123917Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIHJ0DV8ca0rCywG4b4ov%2B4aeWu477mLGPexMZ8m7IuvTAiAsiqp%2BuSdzE7P0%2BeXdZn1AwAI7Bb2ZK2wblOXDLNnZYiqIBAi1%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMHkE4hbKS7QLNmnH3KtwDt%2FTJ6pPEX3fvJcNdqJepkRVw2mXIXys6o66Ae7rdDYjf8GKxopbMT%2F855EGkTvaVDnrdWMG%2FW0bWG1Li9ninWOWC4%2F9DrBcWQwpk1vSnl%2BjdN4%2BG97ykWCSxIaGJK2mj%2F%2ByLj6uiG9%2Fh9rk8VE%2F4rdwhTaXg28ik8%2FAl5y1AZCK%2FmUibWtuhl1hCh0DjhiTmJg9uOyfaSHRja5dY9xIYivE7%2BCsraPtcqbX9HGOzVUlK%2FtVEwSUZdpgvLkkkbKm840h%2B8EJU9YKi43pPXkNVUweOC2eRhKZqGT8KNP%2FM2oEGBYVSYo%2BGzjNF3wd%2FyUQXNP1fYGkg19jW8MNuJp9oJMDxj6HfM0yFkujrl8%2FHm2hAKjVACDCcjkAFcY0rPcpoW58ke%2FGKnkKtcw4s07Nky%2FuDBJ4oDOJ7N93wdE6vp0gPUMao4zxbAIvW58XirPdNgM3RXAhHl%2F4eDlvVBZE5ECIfIhNiMv2atHZcLtpfaLhMM7W5S%2Br7cIS1ynmhQ2UIGS8%2BzL5ulDxn5EkBT33%2F7z4DggQ%2FD0b5MPzvO6F4noOBHFLBAzXCk%2BcmhrAayTrn2ojSsJ7UYztZJFYpuCBGFr6D2rC2K%2FW7l3aIMv%2FmTnA1iQ0SSCSRc3ddZpswg5ns0wY6pgGjGrPX7%2B718U2h0NrJbHppZ1V%2FBQvf14MRCeigMdWnysrS3DB4TsrFshOCb%2FxRs9%2FMgzEm%2F3iL7DaFHhfbpfIQlC0G61qoLjET%2FRwTWD98Rlh5IuGHIoLtrx89FzMwxC6vCSlTjFIHjtei0SIAocXcKA0vAmkUY4Trf0MkCx0k6y3HVw5pKBa5Xay4EjAYytwT7ci6Jwjg%2FDIXE0FTqi6GYEuNRi2M&X-Amz-Signature=c2746212b8d8043c15df667d1cba47c5656aa3880003d868e94bd38d11925fba&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666UG443QP%2F20260811%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260811T123917Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIHJ0DV8ca0rCywG4b4ov%2B4aeWu477mLGPexMZ8m7IuvTAiAsiqp%2BuSdzE7P0%2BeXdZn1AwAI7Bb2ZK2wblOXDLNnZYiqIBAi1%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMHkE4hbKS7QLNmnH3KtwDt%2FTJ6pPEX3fvJcNdqJepkRVw2mXIXys6o66Ae7rdDYjf8GKxopbMT%2F855EGkTvaVDnrdWMG%2FW0bWG1Li9ninWOWC4%2F9DrBcWQwpk1vSnl%2BjdN4%2BG97ykWCSxIaGJK2mj%2F%2ByLj6uiG9%2Fh9rk8VE%2F4rdwhTaXg28ik8%2FAl5y1AZCK%2FmUibWtuhl1hCh0DjhiTmJg9uOyfaSHRja5dY9xIYivE7%2BCsraPtcqbX9HGOzVUlK%2FtVEwSUZdpgvLkkkbKm840h%2B8EJU9YKi43pPXkNVUweOC2eRhKZqGT8KNP%2FM2oEGBYVSYo%2BGzjNF3wd%2FyUQXNP1fYGkg19jW8MNuJp9oJMDxj6HfM0yFkujrl8%2FHm2hAKjVACDCcjkAFcY0rPcpoW58ke%2FGKnkKtcw4s07Nky%2FuDBJ4oDOJ7N93wdE6vp0gPUMao4zxbAIvW58XirPdNgM3RXAhHl%2F4eDlvVBZE5ECIfIhNiMv2atHZcLtpfaLhMM7W5S%2Br7cIS1ynmhQ2UIGS8%2BzL5ulDxn5EkBT33%2F7z4DggQ%2FD0b5MPzvO6F4noOBHFLBAzXCk%2BcmhrAayTrn2ojSsJ7UYztZJFYpuCBGFr6D2rC2K%2FW7l3aIMv%2FmTnA1iQ0SSCSRc3ddZpswg5ns0wY6pgGjGrPX7%2B718U2h0NrJbHppZ1V%2FBQvf14MRCeigMdWnysrS3DB4TsrFshOCb%2FxRs9%2FMgzEm%2F3iL7DaFHhfbpfIQlC0G61qoLjET%2FRwTWD98Rlh5IuGHIoLtrx89FzMwxC6vCSlTjFIHjtei0SIAocXcKA0vAmkUY4Trf0MkCx0k6y3HVw5pKBa5Xay4EjAYytwT7ci6Jwjg%2FDIXE0FTqi6GYEuNRi2M&X-Amz-Signature=4786eb23007bc37fafd448b2946df22f6c2be36599c297ac384b9ede6ebf0539&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666UG443QP%2F20260811%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260811T123917Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIHJ0DV8ca0rCywG4b4ov%2B4aeWu477mLGPexMZ8m7IuvTAiAsiqp%2BuSdzE7P0%2BeXdZn1AwAI7Bb2ZK2wblOXDLNnZYiqIBAi1%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMHkE4hbKS7QLNmnH3KtwDt%2FTJ6pPEX3fvJcNdqJepkRVw2mXIXys6o66Ae7rdDYjf8GKxopbMT%2F855EGkTvaVDnrdWMG%2FW0bWG1Li9ninWOWC4%2F9DrBcWQwpk1vSnl%2BjdN4%2BG97ykWCSxIaGJK2mj%2F%2ByLj6uiG9%2Fh9rk8VE%2F4rdwhTaXg28ik8%2FAl5y1AZCK%2FmUibWtuhl1hCh0DjhiTmJg9uOyfaSHRja5dY9xIYivE7%2BCsraPtcqbX9HGOzVUlK%2FtVEwSUZdpgvLkkkbKm840h%2B8EJU9YKi43pPXkNVUweOC2eRhKZqGT8KNP%2FM2oEGBYVSYo%2BGzjNF3wd%2FyUQXNP1fYGkg19jW8MNuJp9oJMDxj6HfM0yFkujrl8%2FHm2hAKjVACDCcjkAFcY0rPcpoW58ke%2FGKnkKtcw4s07Nky%2FuDBJ4oDOJ7N93wdE6vp0gPUMao4zxbAIvW58XirPdNgM3RXAhHl%2F4eDlvVBZE5ECIfIhNiMv2atHZcLtpfaLhMM7W5S%2Br7cIS1ynmhQ2UIGS8%2BzL5ulDxn5EkBT33%2F7z4DggQ%2FD0b5MPzvO6F4noOBHFLBAzXCk%2BcmhrAayTrn2ojSsJ7UYztZJFYpuCBGFr6D2rC2K%2FW7l3aIMv%2FmTnA1iQ0SSCSRc3ddZpswg5ns0wY6pgGjGrPX7%2B718U2h0NrJbHppZ1V%2FBQvf14MRCeigMdWnysrS3DB4TsrFshOCb%2FxRs9%2FMgzEm%2F3iL7DaFHhfbpfIQlC0G61qoLjET%2FRwTWD98Rlh5IuGHIoLtrx89FzMwxC6vCSlTjFIHjtei0SIAocXcKA0vAmkUY4Trf0MkCx0k6y3HVw5pKBa5Xay4EjAYytwT7ci6Jwjg%2FDIXE0FTqi6GYEuNRi2M&X-Amz-Signature=5cf20cc42fd26ef1ffbbdb15ee05ce0b7f075b21fad18d2a8b7ac58bfcb868b3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666UG443QP%2F20260811%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260811T123917Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIHJ0DV8ca0rCywG4b4ov%2B4aeWu477mLGPexMZ8m7IuvTAiAsiqp%2BuSdzE7P0%2BeXdZn1AwAI7Bb2ZK2wblOXDLNnZYiqIBAi1%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMHkE4hbKS7QLNmnH3KtwDt%2FTJ6pPEX3fvJcNdqJepkRVw2mXIXys6o66Ae7rdDYjf8GKxopbMT%2F855EGkTvaVDnrdWMG%2FW0bWG1Li9ninWOWC4%2F9DrBcWQwpk1vSnl%2BjdN4%2BG97ykWCSxIaGJK2mj%2F%2ByLj6uiG9%2Fh9rk8VE%2F4rdwhTaXg28ik8%2FAl5y1AZCK%2FmUibWtuhl1hCh0DjhiTmJg9uOyfaSHRja5dY9xIYivE7%2BCsraPtcqbX9HGOzVUlK%2FtVEwSUZdpgvLkkkbKm840h%2B8EJU9YKi43pPXkNVUweOC2eRhKZqGT8KNP%2FM2oEGBYVSYo%2BGzjNF3wd%2FyUQXNP1fYGkg19jW8MNuJp9oJMDxj6HfM0yFkujrl8%2FHm2hAKjVACDCcjkAFcY0rPcpoW58ke%2FGKnkKtcw4s07Nky%2FuDBJ4oDOJ7N93wdE6vp0gPUMao4zxbAIvW58XirPdNgM3RXAhHl%2F4eDlvVBZE5ECIfIhNiMv2atHZcLtpfaLhMM7W5S%2Br7cIS1ynmhQ2UIGS8%2BzL5ulDxn5EkBT33%2F7z4DggQ%2FD0b5MPzvO6F4noOBHFLBAzXCk%2BcmhrAayTrn2ojSsJ7UYztZJFYpuCBGFr6D2rC2K%2FW7l3aIMv%2FmTnA1iQ0SSCSRc3ddZpswg5ns0wY6pgGjGrPX7%2B718U2h0NrJbHppZ1V%2FBQvf14MRCeigMdWnysrS3DB4TsrFshOCb%2FxRs9%2FMgzEm%2F3iL7DaFHhfbpfIQlC0G61qoLjET%2FRwTWD98Rlh5IuGHIoLtrx89FzMwxC6vCSlTjFIHjtei0SIAocXcKA0vAmkUY4Trf0MkCx0k6y3HVw5pKBa5Xay4EjAYytwT7ci6Jwjg%2FDIXE0FTqi6GYEuNRi2M&X-Amz-Signature=9fec737356f6d11281d9f18682e45171f045628deba9da9cb96af799e75514ad&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
