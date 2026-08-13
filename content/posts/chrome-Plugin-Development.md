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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666G5DGWBJ%2F20260813%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260813T010230Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEA4aCXVzLXdlc3QtMiJHMEUCIHd7PfTpFZREmLR%2FJQfIqP5BqbQqtIG9oqpNpZrq%2Fs1pAiEAkR%2FSs9K31Uh38ZtEePiuEe6qzjTUmK%2BDWBJWuLZ%2BqWEqiAQI1%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDPG2tm7FRG2znZriySrcAz1ZtfWtN4d9uon4eoXgnyWb4P4ZiIXsWtxGxclNFa3kKw1P72GdwdxqcIVkoBBcQrexgrCs3FU4lFFinlnmPqw3l3E9HIPTG9cWaqS05ZiuXT8tDGcawYxRNn290l42b3A1faTEhEq8fYLR3NlTgwMRTT3IkoQ2aGwLVr6s53b%2Bk%2BdhDcBi%2BP7QWOi7ukRGSYdXubAE4KItmN%2FBpBrcd27EiJQ2OPBq0e%2FQYdae9oKj%2BrMjUcOesMz3xbfSrWdQEWku8pzvlPDteyL%2FBcSREekRv3U2LY2iisFjjf5dBVC%2FEdsJ6mHcgkqVl8qUO146bbRvkWRP0oKAFHT62wyuX56Xxnxdj5AL6VoZE7YfwiBRQN%2F62Oo1LMmwRwCDjln1w1LyV2hC6fFEQ6w96aiRHszmNIKIM7COR3XidzUZwH2rnA4%2BJzCvmTkZgVy0yBoIKQu4Vkjv60xYw4z%2BCzP%2Fv%2BzB0ESzhj3yKvap%2BZHDFTVhyQJG%2Fx8ltQCNO%2BxLqLZEi0tO1mQTdlY1bfvkLrEJpJPJGlSsG0M3%2BM7dUnvIVxmlLwGFaVGTEIy0JOyy%2FtF7EedSkEr4Slbmkb92HZY42wGBrGFibUlxWX657P7R3JJC%2BHoveBGSwsbthGZXML7L89MGOqUBiWTS2q9DZaQhYcbuwSSvJ%2BZT4C5vafj1BEZvAIeStg0ocvtAldh%2F8dH1RmaEgRRVn6BPMpdGSn911e0Z6cD0i9%2F9N%2FF2PBgT654j30o7OzQs1AZD17AME%2Fq9FT4jOok%2FIgVwA%2B4eeIQ8AN7KNrtu8BCyG8WkAg4syFxbScXg1YMdk6Rb0DTTb%2F4P%2BXbA%2BQjWJRLbbeJcBJmPzlpZP65ppEHb1YEl&X-Amz-Signature=635c52b8ca7a9c352080d3e33f772984b8404c7eab629fb1984495716c48a8a6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666G5DGWBJ%2F20260813%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260813T010230Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEA4aCXVzLXdlc3QtMiJHMEUCIHd7PfTpFZREmLR%2FJQfIqP5BqbQqtIG9oqpNpZrq%2Fs1pAiEAkR%2FSs9K31Uh38ZtEePiuEe6qzjTUmK%2BDWBJWuLZ%2BqWEqiAQI1%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDPG2tm7FRG2znZriySrcAz1ZtfWtN4d9uon4eoXgnyWb4P4ZiIXsWtxGxclNFa3kKw1P72GdwdxqcIVkoBBcQrexgrCs3FU4lFFinlnmPqw3l3E9HIPTG9cWaqS05ZiuXT8tDGcawYxRNn290l42b3A1faTEhEq8fYLR3NlTgwMRTT3IkoQ2aGwLVr6s53b%2Bk%2BdhDcBi%2BP7QWOi7ukRGSYdXubAE4KItmN%2FBpBrcd27EiJQ2OPBq0e%2FQYdae9oKj%2BrMjUcOesMz3xbfSrWdQEWku8pzvlPDteyL%2FBcSREekRv3U2LY2iisFjjf5dBVC%2FEdsJ6mHcgkqVl8qUO146bbRvkWRP0oKAFHT62wyuX56Xxnxdj5AL6VoZE7YfwiBRQN%2F62Oo1LMmwRwCDjln1w1LyV2hC6fFEQ6w96aiRHszmNIKIM7COR3XidzUZwH2rnA4%2BJzCvmTkZgVy0yBoIKQu4Vkjv60xYw4z%2BCzP%2Fv%2BzB0ESzhj3yKvap%2BZHDFTVhyQJG%2Fx8ltQCNO%2BxLqLZEi0tO1mQTdlY1bfvkLrEJpJPJGlSsG0M3%2BM7dUnvIVxmlLwGFaVGTEIy0JOyy%2FtF7EedSkEr4Slbmkb92HZY42wGBrGFibUlxWX657P7R3JJC%2BHoveBGSwsbthGZXML7L89MGOqUBiWTS2q9DZaQhYcbuwSSvJ%2BZT4C5vafj1BEZvAIeStg0ocvtAldh%2F8dH1RmaEgRRVn6BPMpdGSn911e0Z6cD0i9%2F9N%2FF2PBgT654j30o7OzQs1AZD17AME%2Fq9FT4jOok%2FIgVwA%2B4eeIQ8AN7KNrtu8BCyG8WkAg4syFxbScXg1YMdk6Rb0DTTb%2F4P%2BXbA%2BQjWJRLbbeJcBJmPzlpZP65ppEHb1YEl&X-Amz-Signature=3e44e85117db9830ac55bc9b217d1623f30bc2a6520bf19a917841b7fa295f81&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666G5DGWBJ%2F20260813%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260813T010230Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEA4aCXVzLXdlc3QtMiJHMEUCIHd7PfTpFZREmLR%2FJQfIqP5BqbQqtIG9oqpNpZrq%2Fs1pAiEAkR%2FSs9K31Uh38ZtEePiuEe6qzjTUmK%2BDWBJWuLZ%2BqWEqiAQI1%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDPG2tm7FRG2znZriySrcAz1ZtfWtN4d9uon4eoXgnyWb4P4ZiIXsWtxGxclNFa3kKw1P72GdwdxqcIVkoBBcQrexgrCs3FU4lFFinlnmPqw3l3E9HIPTG9cWaqS05ZiuXT8tDGcawYxRNn290l42b3A1faTEhEq8fYLR3NlTgwMRTT3IkoQ2aGwLVr6s53b%2Bk%2BdhDcBi%2BP7QWOi7ukRGSYdXubAE4KItmN%2FBpBrcd27EiJQ2OPBq0e%2FQYdae9oKj%2BrMjUcOesMz3xbfSrWdQEWku8pzvlPDteyL%2FBcSREekRv3U2LY2iisFjjf5dBVC%2FEdsJ6mHcgkqVl8qUO146bbRvkWRP0oKAFHT62wyuX56Xxnxdj5AL6VoZE7YfwiBRQN%2F62Oo1LMmwRwCDjln1w1LyV2hC6fFEQ6w96aiRHszmNIKIM7COR3XidzUZwH2rnA4%2BJzCvmTkZgVy0yBoIKQu4Vkjv60xYw4z%2BCzP%2Fv%2BzB0ESzhj3yKvap%2BZHDFTVhyQJG%2Fx8ltQCNO%2BxLqLZEi0tO1mQTdlY1bfvkLrEJpJPJGlSsG0M3%2BM7dUnvIVxmlLwGFaVGTEIy0JOyy%2FtF7EedSkEr4Slbmkb92HZY42wGBrGFibUlxWX657P7R3JJC%2BHoveBGSwsbthGZXML7L89MGOqUBiWTS2q9DZaQhYcbuwSSvJ%2BZT4C5vafj1BEZvAIeStg0ocvtAldh%2F8dH1RmaEgRRVn6BPMpdGSn911e0Z6cD0i9%2F9N%2FF2PBgT654j30o7OzQs1AZD17AME%2Fq9FT4jOok%2FIgVwA%2B4eeIQ8AN7KNrtu8BCyG8WkAg4syFxbScXg1YMdk6Rb0DTTb%2F4P%2BXbA%2BQjWJRLbbeJcBJmPzlpZP65ppEHb1YEl&X-Amz-Signature=0e2139436651b6c1360da6749a6fc990f221959532dfa0c08d7b69fa374527be&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666G5DGWBJ%2F20260813%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260813T010230Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEA4aCXVzLXdlc3QtMiJHMEUCIHd7PfTpFZREmLR%2FJQfIqP5BqbQqtIG9oqpNpZrq%2Fs1pAiEAkR%2FSs9K31Uh38ZtEePiuEe6qzjTUmK%2BDWBJWuLZ%2BqWEqiAQI1%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDPG2tm7FRG2znZriySrcAz1ZtfWtN4d9uon4eoXgnyWb4P4ZiIXsWtxGxclNFa3kKw1P72GdwdxqcIVkoBBcQrexgrCs3FU4lFFinlnmPqw3l3E9HIPTG9cWaqS05ZiuXT8tDGcawYxRNn290l42b3A1faTEhEq8fYLR3NlTgwMRTT3IkoQ2aGwLVr6s53b%2Bk%2BdhDcBi%2BP7QWOi7ukRGSYdXubAE4KItmN%2FBpBrcd27EiJQ2OPBq0e%2FQYdae9oKj%2BrMjUcOesMz3xbfSrWdQEWku8pzvlPDteyL%2FBcSREekRv3U2LY2iisFjjf5dBVC%2FEdsJ6mHcgkqVl8qUO146bbRvkWRP0oKAFHT62wyuX56Xxnxdj5AL6VoZE7YfwiBRQN%2F62Oo1LMmwRwCDjln1w1LyV2hC6fFEQ6w96aiRHszmNIKIM7COR3XidzUZwH2rnA4%2BJzCvmTkZgVy0yBoIKQu4Vkjv60xYw4z%2BCzP%2Fv%2BzB0ESzhj3yKvap%2BZHDFTVhyQJG%2Fx8ltQCNO%2BxLqLZEi0tO1mQTdlY1bfvkLrEJpJPJGlSsG0M3%2BM7dUnvIVxmlLwGFaVGTEIy0JOyy%2FtF7EedSkEr4Slbmkb92HZY42wGBrGFibUlxWX657P7R3JJC%2BHoveBGSwsbthGZXML7L89MGOqUBiWTS2q9DZaQhYcbuwSSvJ%2BZT4C5vafj1BEZvAIeStg0ocvtAldh%2F8dH1RmaEgRRVn6BPMpdGSn911e0Z6cD0i9%2F9N%2FF2PBgT654j30o7OzQs1AZD17AME%2Fq9FT4jOok%2FIgVwA%2B4eeIQ8AN7KNrtu8BCyG8WkAg4syFxbScXg1YMdk6Rb0DTTb%2F4P%2BXbA%2BQjWJRLbbeJcBJmPzlpZP65ppEHb1YEl&X-Amz-Signature=f95ec31d15ce0f86758f6730182f8ff525842067ee86f38ab7b700b82309cfc4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
