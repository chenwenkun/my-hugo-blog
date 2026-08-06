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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466X3VEIKHV%2F20260806%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260806T133911Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHUaCXVzLXdlc3QtMiJHMEUCIQDi%2FBEcwttsWeBQZCK8DHhul%2B1ZD4d7Oi7EO6I0kouHxgIgRmKfL9AzdRxU2DB0npHrxSdkcuyNgV1JNE9pJt%2B%2B0DIq%2FwMIPhAAGgw2Mzc0MjMxODM4MDUiDClBekzHycFgxH%2F5fyrcA%2BGnidvFKsWw92IKCDp44Ln6%2F0mZkIu7iCVJ3%2FXuvvNt1Pd30Hg2kRMqaFMFVvGFzJpLglwMGbixJ4A6VAk2z6jSrfIs91vnUuJrj7AuZdLOMo6M6i1vEEt5JTSLLo2Z%2FyMeLDOE6CrcBthQg%2BmNhMLOfE2TY%2B1yR6SCpHE4EcrAhVJADqA8M%2BuPBw%2B9gL6Y1%2FBTxkS7a9ijqC%2BA3XcUQ1TGQtV34v4TT5dgu8Dr4Ch7Ghy5NQ45fEGdzNzDJHePnboe0%2BH7crhRBJ5VKsU8lR9cz%2FNhp9%2Fkk%2FUgQZl0vAJVYFADkG3XdemRRmF3%2BwhXzcdE5NWgrgfehJea88Jd7VbkpdQ6ISlhAv%2B%2Fiqa972Klo0cGIplJ7WvIPjKNeTyK8Tyt%2BY5956MWT9Zel2yiUE9BwHvTNaxuA6QKeVi8mfTbx%2BHsnEVDoDnwpMe5wHzSA7juIfrvIUuJbWnn6iia%2F1D3iYCCmlTiRwDflqugoi9un%2BVniWAJSplW9mxBG%2FhEYacj0Hmo09Bgb%2F%2FeSzU5F4Sj2xXm%2Fumft0wNJ7CG%2FMIKupU5YdW2nBG52ql4D9HqXinyZXc43uMWLz9OMYlBHmuMq4RmkkOdlASzp5jeU3bxaFFcRT54vo2GoQdeMK%2BK0tMGOqUBBY3THOcqUR%2FOlhCmSA0DGQAl%2FOYjD1Tdfn5Qy51Tgay5iybnS99wrZm3IUt42f3K5GSKVNvshfOVlPyEvxnFa8XnAZ%2BNBoYutDv5%2FbZd23WzsDs%2FBV0YnDnpblki7qdAuGx%2B0nwUPlsu39CzkwOl%2BaUJzK7AGmCe%2F9v5txPIugYBgbG5OY3CcDs09a9MqrKhtwxkOAC10c6srFbtqacwaN6eRf2i&X-Amz-Signature=77b363867a3b140b0de8d9b47cdfbef03f3f59a1dade8c2d26ace77a23e79d6c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466X3VEIKHV%2F20260806%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260806T133911Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHUaCXVzLXdlc3QtMiJHMEUCIQDi%2FBEcwttsWeBQZCK8DHhul%2B1ZD4d7Oi7EO6I0kouHxgIgRmKfL9AzdRxU2DB0npHrxSdkcuyNgV1JNE9pJt%2B%2B0DIq%2FwMIPhAAGgw2Mzc0MjMxODM4MDUiDClBekzHycFgxH%2F5fyrcA%2BGnidvFKsWw92IKCDp44Ln6%2F0mZkIu7iCVJ3%2FXuvvNt1Pd30Hg2kRMqaFMFVvGFzJpLglwMGbixJ4A6VAk2z6jSrfIs91vnUuJrj7AuZdLOMo6M6i1vEEt5JTSLLo2Z%2FyMeLDOE6CrcBthQg%2BmNhMLOfE2TY%2B1yR6SCpHE4EcrAhVJADqA8M%2BuPBw%2B9gL6Y1%2FBTxkS7a9ijqC%2BA3XcUQ1TGQtV34v4TT5dgu8Dr4Ch7Ghy5NQ45fEGdzNzDJHePnboe0%2BH7crhRBJ5VKsU8lR9cz%2FNhp9%2Fkk%2FUgQZl0vAJVYFADkG3XdemRRmF3%2BwhXzcdE5NWgrgfehJea88Jd7VbkpdQ6ISlhAv%2B%2Fiqa972Klo0cGIplJ7WvIPjKNeTyK8Tyt%2BY5956MWT9Zel2yiUE9BwHvTNaxuA6QKeVi8mfTbx%2BHsnEVDoDnwpMe5wHzSA7juIfrvIUuJbWnn6iia%2F1D3iYCCmlTiRwDflqugoi9un%2BVniWAJSplW9mxBG%2FhEYacj0Hmo09Bgb%2F%2FeSzU5F4Sj2xXm%2Fumft0wNJ7CG%2FMIKupU5YdW2nBG52ql4D9HqXinyZXc43uMWLz9OMYlBHmuMq4RmkkOdlASzp5jeU3bxaFFcRT54vo2GoQdeMK%2BK0tMGOqUBBY3THOcqUR%2FOlhCmSA0DGQAl%2FOYjD1Tdfn5Qy51Tgay5iybnS99wrZm3IUt42f3K5GSKVNvshfOVlPyEvxnFa8XnAZ%2BNBoYutDv5%2FbZd23WzsDs%2FBV0YnDnpblki7qdAuGx%2B0nwUPlsu39CzkwOl%2BaUJzK7AGmCe%2F9v5txPIugYBgbG5OY3CcDs09a9MqrKhtwxkOAC10c6srFbtqacwaN6eRf2i&X-Amz-Signature=38fbe315b277afee34165e42682d30c80685c2ab3774ccd4b11127b08fae2e47&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466X3VEIKHV%2F20260806%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260806T133911Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHUaCXVzLXdlc3QtMiJHMEUCIQDi%2FBEcwttsWeBQZCK8DHhul%2B1ZD4d7Oi7EO6I0kouHxgIgRmKfL9AzdRxU2DB0npHrxSdkcuyNgV1JNE9pJt%2B%2B0DIq%2FwMIPhAAGgw2Mzc0MjMxODM4MDUiDClBekzHycFgxH%2F5fyrcA%2BGnidvFKsWw92IKCDp44Ln6%2F0mZkIu7iCVJ3%2FXuvvNt1Pd30Hg2kRMqaFMFVvGFzJpLglwMGbixJ4A6VAk2z6jSrfIs91vnUuJrj7AuZdLOMo6M6i1vEEt5JTSLLo2Z%2FyMeLDOE6CrcBthQg%2BmNhMLOfE2TY%2B1yR6SCpHE4EcrAhVJADqA8M%2BuPBw%2B9gL6Y1%2FBTxkS7a9ijqC%2BA3XcUQ1TGQtV34v4TT5dgu8Dr4Ch7Ghy5NQ45fEGdzNzDJHePnboe0%2BH7crhRBJ5VKsU8lR9cz%2FNhp9%2Fkk%2FUgQZl0vAJVYFADkG3XdemRRmF3%2BwhXzcdE5NWgrgfehJea88Jd7VbkpdQ6ISlhAv%2B%2Fiqa972Klo0cGIplJ7WvIPjKNeTyK8Tyt%2BY5956MWT9Zel2yiUE9BwHvTNaxuA6QKeVi8mfTbx%2BHsnEVDoDnwpMe5wHzSA7juIfrvIUuJbWnn6iia%2F1D3iYCCmlTiRwDflqugoi9un%2BVniWAJSplW9mxBG%2FhEYacj0Hmo09Bgb%2F%2FeSzU5F4Sj2xXm%2Fumft0wNJ7CG%2FMIKupU5YdW2nBG52ql4D9HqXinyZXc43uMWLz9OMYlBHmuMq4RmkkOdlASzp5jeU3bxaFFcRT54vo2GoQdeMK%2BK0tMGOqUBBY3THOcqUR%2FOlhCmSA0DGQAl%2FOYjD1Tdfn5Qy51Tgay5iybnS99wrZm3IUt42f3K5GSKVNvshfOVlPyEvxnFa8XnAZ%2BNBoYutDv5%2FbZd23WzsDs%2FBV0YnDnpblki7qdAuGx%2B0nwUPlsu39CzkwOl%2BaUJzK7AGmCe%2F9v5txPIugYBgbG5OY3CcDs09a9MqrKhtwxkOAC10c6srFbtqacwaN6eRf2i&X-Amz-Signature=8b4fae7ad9d0de61de239eb38780a1969adf2b733782bffc8ebfef6001d2fbee&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466X3VEIKHV%2F20260806%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260806T133911Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHUaCXVzLXdlc3QtMiJHMEUCIQDi%2FBEcwttsWeBQZCK8DHhul%2B1ZD4d7Oi7EO6I0kouHxgIgRmKfL9AzdRxU2DB0npHrxSdkcuyNgV1JNE9pJt%2B%2B0DIq%2FwMIPhAAGgw2Mzc0MjMxODM4MDUiDClBekzHycFgxH%2F5fyrcA%2BGnidvFKsWw92IKCDp44Ln6%2F0mZkIu7iCVJ3%2FXuvvNt1Pd30Hg2kRMqaFMFVvGFzJpLglwMGbixJ4A6VAk2z6jSrfIs91vnUuJrj7AuZdLOMo6M6i1vEEt5JTSLLo2Z%2FyMeLDOE6CrcBthQg%2BmNhMLOfE2TY%2B1yR6SCpHE4EcrAhVJADqA8M%2BuPBw%2B9gL6Y1%2FBTxkS7a9ijqC%2BA3XcUQ1TGQtV34v4TT5dgu8Dr4Ch7Ghy5NQ45fEGdzNzDJHePnboe0%2BH7crhRBJ5VKsU8lR9cz%2FNhp9%2Fkk%2FUgQZl0vAJVYFADkG3XdemRRmF3%2BwhXzcdE5NWgrgfehJea88Jd7VbkpdQ6ISlhAv%2B%2Fiqa972Klo0cGIplJ7WvIPjKNeTyK8Tyt%2BY5956MWT9Zel2yiUE9BwHvTNaxuA6QKeVi8mfTbx%2BHsnEVDoDnwpMe5wHzSA7juIfrvIUuJbWnn6iia%2F1D3iYCCmlTiRwDflqugoi9un%2BVniWAJSplW9mxBG%2FhEYacj0Hmo09Bgb%2F%2FeSzU5F4Sj2xXm%2Fumft0wNJ7CG%2FMIKupU5YdW2nBG52ql4D9HqXinyZXc43uMWLz9OMYlBHmuMq4RmkkOdlASzp5jeU3bxaFFcRT54vo2GoQdeMK%2BK0tMGOqUBBY3THOcqUR%2FOlhCmSA0DGQAl%2FOYjD1Tdfn5Qy51Tgay5iybnS99wrZm3IUt42f3K5GSKVNvshfOVlPyEvxnFa8XnAZ%2BNBoYutDv5%2FbZd23WzsDs%2FBV0YnDnpblki7qdAuGx%2B0nwUPlsu39CzkwOl%2BaUJzK7AGmCe%2F9v5txPIugYBgbG5OY3CcDs09a9MqrKhtwxkOAC10c6srFbtqacwaN6eRf2i&X-Amz-Signature=55fe80635062a8b58aee336618681231edc7f988db27745b103cc16bf08fd3ca&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
