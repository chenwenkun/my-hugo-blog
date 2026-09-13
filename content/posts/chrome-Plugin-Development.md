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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RP3YHCVX%2F20260913%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260913T015821Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCg1ff5dVFguUksfEsA%2BzLfrGB%2BIIfnpva8ZEHNVV4vsQIhALhjq9%2FryKWo3ck5VIun1Jd8hLpJHRiIRSkmGCby1eFUKogECML%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igz%2FK9jCHhesemsVD10q3AMmEIhdorl6%2F%2Fy1dDKhI12BWmlJ0iVl4osO8XOXEXism8s3t1L48hg%2FIt6vyLGt0SrgI9EG3HKoOQXvpin2QXCt0%2FIQm0XIUsFKAjzY4YiiUXAgo9BjcD6OG7mIVqUH3mp0yngwjrZg%2BCL5wUoLKQAymU%2BH1U2KNvaswLmsSwhQmudad8m6B79N8ZCyVq%2BFltYWMp3%2By9pUHEDKRxo3jFjLcCc5jLJ3dWbJ7AJZiL9igOb%2Bw8sEZLA%2F5sPq0WcXyxLN66r4vtR9g1dZMEl%2B1bM6vGKC4%2BB4CqBxa1K52Oz5fal0ZbRB9MpoPjYBikGwV1g9X43yfbsINrUcEiAzHydtpMajer6OK0%2F0pLyCXKsvFIa31l4ugQ4fcZebjNJ%2FLsTM7mrK6KyboBWNux2CA3wtqTb6fQ47RaDHUL8NqdpIWT51Wh6yKWPARFDa0SFinlrvNJszXR0PfZnorFxmTwKfrX%2BxTqUkCWtAnUoGjjvSduhcBdEC93odAK0tXUk8IpwAxGXeZVr0n9DiZLnYKP%2FpmkYwyy08LUAX0gd%2FP3H3%2BBcl1aJi4n%2BGExfKynd0UqCy%2B6SF05ao7JUsGrsuOP41RY99ikFucqpJajb1HEGYQJ5hdN6gM6m0XMRVADCI5JfVBjqkAfMgF07BsPEuyLKVav4rKhcJycUceDWHKxXaEFlajbVthvW8x88%2F22ohn089yLtj1lmX6nqhMWfK8oqWopNL%2BSEI43sgNZWtO6GDzOIDJ5gdIRDpDlEeBqxH%2FQj2orgxEkcql7b%2BnbMbz5q6mZ9Z3rXmP%2BNOs%2FNTqH4YZYg4hWzPVGmlYQ16Vh0imQAF74norxNMFtA9MuLrWYEeCe2%2F2b633gsL&X-Amz-Signature=84ee9e06a8b97b5f0d59c90947b02b7eb3caf00e824bdf7b239c12c3fde74d2e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RP3YHCVX%2F20260913%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260913T015821Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCg1ff5dVFguUksfEsA%2BzLfrGB%2BIIfnpva8ZEHNVV4vsQIhALhjq9%2FryKWo3ck5VIun1Jd8hLpJHRiIRSkmGCby1eFUKogECML%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igz%2FK9jCHhesemsVD10q3AMmEIhdorl6%2F%2Fy1dDKhI12BWmlJ0iVl4osO8XOXEXism8s3t1L48hg%2FIt6vyLGt0SrgI9EG3HKoOQXvpin2QXCt0%2FIQm0XIUsFKAjzY4YiiUXAgo9BjcD6OG7mIVqUH3mp0yngwjrZg%2BCL5wUoLKQAymU%2BH1U2KNvaswLmsSwhQmudad8m6B79N8ZCyVq%2BFltYWMp3%2By9pUHEDKRxo3jFjLcCc5jLJ3dWbJ7AJZiL9igOb%2Bw8sEZLA%2F5sPq0WcXyxLN66r4vtR9g1dZMEl%2B1bM6vGKC4%2BB4CqBxa1K52Oz5fal0ZbRB9MpoPjYBikGwV1g9X43yfbsINrUcEiAzHydtpMajer6OK0%2F0pLyCXKsvFIa31l4ugQ4fcZebjNJ%2FLsTM7mrK6KyboBWNux2CA3wtqTb6fQ47RaDHUL8NqdpIWT51Wh6yKWPARFDa0SFinlrvNJszXR0PfZnorFxmTwKfrX%2BxTqUkCWtAnUoGjjvSduhcBdEC93odAK0tXUk8IpwAxGXeZVr0n9DiZLnYKP%2FpmkYwyy08LUAX0gd%2FP3H3%2BBcl1aJi4n%2BGExfKynd0UqCy%2B6SF05ao7JUsGrsuOP41RY99ikFucqpJajb1HEGYQJ5hdN6gM6m0XMRVADCI5JfVBjqkAfMgF07BsPEuyLKVav4rKhcJycUceDWHKxXaEFlajbVthvW8x88%2F22ohn089yLtj1lmX6nqhMWfK8oqWopNL%2BSEI43sgNZWtO6GDzOIDJ5gdIRDpDlEeBqxH%2FQj2orgxEkcql7b%2BnbMbz5q6mZ9Z3rXmP%2BNOs%2FNTqH4YZYg4hWzPVGmlYQ16Vh0imQAF74norxNMFtA9MuLrWYEeCe2%2F2b633gsL&X-Amz-Signature=500118c81927f37a0a5c49ae8c27e3d152fe9dbd3984839a12fd22d2d83bc61c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RP3YHCVX%2F20260913%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260913T015821Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCg1ff5dVFguUksfEsA%2BzLfrGB%2BIIfnpva8ZEHNVV4vsQIhALhjq9%2FryKWo3ck5VIun1Jd8hLpJHRiIRSkmGCby1eFUKogECML%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igz%2FK9jCHhesemsVD10q3AMmEIhdorl6%2F%2Fy1dDKhI12BWmlJ0iVl4osO8XOXEXism8s3t1L48hg%2FIt6vyLGt0SrgI9EG3HKoOQXvpin2QXCt0%2FIQm0XIUsFKAjzY4YiiUXAgo9BjcD6OG7mIVqUH3mp0yngwjrZg%2BCL5wUoLKQAymU%2BH1U2KNvaswLmsSwhQmudad8m6B79N8ZCyVq%2BFltYWMp3%2By9pUHEDKRxo3jFjLcCc5jLJ3dWbJ7AJZiL9igOb%2Bw8sEZLA%2F5sPq0WcXyxLN66r4vtR9g1dZMEl%2B1bM6vGKC4%2BB4CqBxa1K52Oz5fal0ZbRB9MpoPjYBikGwV1g9X43yfbsINrUcEiAzHydtpMajer6OK0%2F0pLyCXKsvFIa31l4ugQ4fcZebjNJ%2FLsTM7mrK6KyboBWNux2CA3wtqTb6fQ47RaDHUL8NqdpIWT51Wh6yKWPARFDa0SFinlrvNJszXR0PfZnorFxmTwKfrX%2BxTqUkCWtAnUoGjjvSduhcBdEC93odAK0tXUk8IpwAxGXeZVr0n9DiZLnYKP%2FpmkYwyy08LUAX0gd%2FP3H3%2BBcl1aJi4n%2BGExfKynd0UqCy%2B6SF05ao7JUsGrsuOP41RY99ikFucqpJajb1HEGYQJ5hdN6gM6m0XMRVADCI5JfVBjqkAfMgF07BsPEuyLKVav4rKhcJycUceDWHKxXaEFlajbVthvW8x88%2F22ohn089yLtj1lmX6nqhMWfK8oqWopNL%2BSEI43sgNZWtO6GDzOIDJ5gdIRDpDlEeBqxH%2FQj2orgxEkcql7b%2BnbMbz5q6mZ9Z3rXmP%2BNOs%2FNTqH4YZYg4hWzPVGmlYQ16Vh0imQAF74norxNMFtA9MuLrWYEeCe2%2F2b633gsL&X-Amz-Signature=179b6317d9eabce080cf19c3e6e9b1e435568d2a43367c22329846140c594473&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RP3YHCVX%2F20260913%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260913T015821Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCg1ff5dVFguUksfEsA%2BzLfrGB%2BIIfnpva8ZEHNVV4vsQIhALhjq9%2FryKWo3ck5VIun1Jd8hLpJHRiIRSkmGCby1eFUKogECML%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igz%2FK9jCHhesemsVD10q3AMmEIhdorl6%2F%2Fy1dDKhI12BWmlJ0iVl4osO8XOXEXism8s3t1L48hg%2FIt6vyLGt0SrgI9EG3HKoOQXvpin2QXCt0%2FIQm0XIUsFKAjzY4YiiUXAgo9BjcD6OG7mIVqUH3mp0yngwjrZg%2BCL5wUoLKQAymU%2BH1U2KNvaswLmsSwhQmudad8m6B79N8ZCyVq%2BFltYWMp3%2By9pUHEDKRxo3jFjLcCc5jLJ3dWbJ7AJZiL9igOb%2Bw8sEZLA%2F5sPq0WcXyxLN66r4vtR9g1dZMEl%2B1bM6vGKC4%2BB4CqBxa1K52Oz5fal0ZbRB9MpoPjYBikGwV1g9X43yfbsINrUcEiAzHydtpMajer6OK0%2F0pLyCXKsvFIa31l4ugQ4fcZebjNJ%2FLsTM7mrK6KyboBWNux2CA3wtqTb6fQ47RaDHUL8NqdpIWT51Wh6yKWPARFDa0SFinlrvNJszXR0PfZnorFxmTwKfrX%2BxTqUkCWtAnUoGjjvSduhcBdEC93odAK0tXUk8IpwAxGXeZVr0n9DiZLnYKP%2FpmkYwyy08LUAX0gd%2FP3H3%2BBcl1aJi4n%2BGExfKynd0UqCy%2B6SF05ao7JUsGrsuOP41RY99ikFucqpJajb1HEGYQJ5hdN6gM6m0XMRVADCI5JfVBjqkAfMgF07BsPEuyLKVav4rKhcJycUceDWHKxXaEFlajbVthvW8x88%2F22ohn089yLtj1lmX6nqhMWfK8oqWopNL%2BSEI43sgNZWtO6GDzOIDJ5gdIRDpDlEeBqxH%2FQj2orgxEkcql7b%2BnbMbz5q6mZ9Z3rXmP%2BNOs%2FNTqH4YZYg4hWzPVGmlYQ16Vh0imQAF74norxNMFtA9MuLrWYEeCe2%2F2b633gsL&X-Amz-Signature=f24e14ec9f4c49e057a0bba6371551d1707ebbfc2580fbab79ec0f8ca1f81123&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
