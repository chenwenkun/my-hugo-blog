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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662OHFBYOS%2F20261126%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261126T011657Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCYjkU5yH8o9mPLBFJHkhU3eXcEX7md%2BwUSEeOBlxnpcgIgY5GizyJgHsz4Wbmza1wV6XuXuqjj1mXznvEhHhq7BGMqiAQIsP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDD%2BIBy8UwJ9kFmPaMSrcA4fLAzdpiEvCGHv8ktSNhzTOE2N8jlYzIinF%2B65YK9qXME94svzmA%2FaCOhIDbvSn8sg33BewrT3tzYDxq9F0MIUi%2FrHJ6qq1yvbbvYRAFBrNFd1s%2B2vuY%2BaV3SuFwGGv%2FtqQsR1mmgRrFmYt0Gj6AF2ydEjwOMtByRS0oeVYvpCoO0m8hmVNd%2B6WNPjUS8AAbx%2BhSiovP%2FHdgaq02Se4gsV%2Br9gclp2V3WyRM%2FZmD3OlRPvb44QdpmY6NzSOoSvZpD3oo%2B9TWIyB7%2Bpbwu8MAh5rHy4q9uMbtH3DBH4ia2m7KLmicfODKVP3c6pfTxqxwSzLgqYcD2v3zsLYqc6uHr7DkzKAzXn9W0FN5JPDhcroofgAQJoWpbLKLYBVt9FaewltQsCXvf4fMzfHFcGb3pHvqly1rOf1uSvr%2F77L0ofGmg7uJPDJh6fNBpk8OHS9GLdzdQiRMjlAblTQRf%2FurtsQp6I6ykrFvTipWcOA9kltrwR2wJKO%2BYWQP%2FAmRZK4yvlFsphOjoZMX2VlY1w1d6BnZg0TQSY3%2FWQfsS1ZyRgYVJ9WK4CmvwdsJSECvjBlGYFgwaARYkXUVsQAZD9lz%2BdiGfRnY2RQniiD967pQShMGr9DPWgTJYCd3Fh7MNLXndgGOqUB%2FSSDmxJhIQSZk0%2F0tJgamaXog29rDNe380oKR7RpCV7y0W8Qa4YMONmOehnXBm%2F81GXsqNMMB4V2eNwTkA3VdimY7NkPXlQOhP0Nj4LWWxhYX3fghR8Bx4a4k7th9At6ZIrdHC%2FzP3QH4%2FhTvOMya5ddnc9IfBBRlZIiI7c8wEPFzlppRiOcVj5lC2bZZs8E7NvCvbIxOlE4sAg8y0QVDF5LaLbD&X-Amz-Signature=d63182a49f2041819882d5436c6dfd1253efde17a54fb9a4381a97d079880ebb&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662OHFBYOS%2F20261126%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261126T011657Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCYjkU5yH8o9mPLBFJHkhU3eXcEX7md%2BwUSEeOBlxnpcgIgY5GizyJgHsz4Wbmza1wV6XuXuqjj1mXznvEhHhq7BGMqiAQIsP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDD%2BIBy8UwJ9kFmPaMSrcA4fLAzdpiEvCGHv8ktSNhzTOE2N8jlYzIinF%2B65YK9qXME94svzmA%2FaCOhIDbvSn8sg33BewrT3tzYDxq9F0MIUi%2FrHJ6qq1yvbbvYRAFBrNFd1s%2B2vuY%2BaV3SuFwGGv%2FtqQsR1mmgRrFmYt0Gj6AF2ydEjwOMtByRS0oeVYvpCoO0m8hmVNd%2B6WNPjUS8AAbx%2BhSiovP%2FHdgaq02Se4gsV%2Br9gclp2V3WyRM%2FZmD3OlRPvb44QdpmY6NzSOoSvZpD3oo%2B9TWIyB7%2Bpbwu8MAh5rHy4q9uMbtH3DBH4ia2m7KLmicfODKVP3c6pfTxqxwSzLgqYcD2v3zsLYqc6uHr7DkzKAzXn9W0FN5JPDhcroofgAQJoWpbLKLYBVt9FaewltQsCXvf4fMzfHFcGb3pHvqly1rOf1uSvr%2F77L0ofGmg7uJPDJh6fNBpk8OHS9GLdzdQiRMjlAblTQRf%2FurtsQp6I6ykrFvTipWcOA9kltrwR2wJKO%2BYWQP%2FAmRZK4yvlFsphOjoZMX2VlY1w1d6BnZg0TQSY3%2FWQfsS1ZyRgYVJ9WK4CmvwdsJSECvjBlGYFgwaARYkXUVsQAZD9lz%2BdiGfRnY2RQniiD967pQShMGr9DPWgTJYCd3Fh7MNLXndgGOqUB%2FSSDmxJhIQSZk0%2F0tJgamaXog29rDNe380oKR7RpCV7y0W8Qa4YMONmOehnXBm%2F81GXsqNMMB4V2eNwTkA3VdimY7NkPXlQOhP0Nj4LWWxhYX3fghR8Bx4a4k7th9At6ZIrdHC%2FzP3QH4%2FhTvOMya5ddnc9IfBBRlZIiI7c8wEPFzlppRiOcVj5lC2bZZs8E7NvCvbIxOlE4sAg8y0QVDF5LaLbD&X-Amz-Signature=1f80629b03a886aca17d380e9585195c0cd5f7640390de82e27da299729259ae&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662OHFBYOS%2F20261126%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261126T011657Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCYjkU5yH8o9mPLBFJHkhU3eXcEX7md%2BwUSEeOBlxnpcgIgY5GizyJgHsz4Wbmza1wV6XuXuqjj1mXznvEhHhq7BGMqiAQIsP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDD%2BIBy8UwJ9kFmPaMSrcA4fLAzdpiEvCGHv8ktSNhzTOE2N8jlYzIinF%2B65YK9qXME94svzmA%2FaCOhIDbvSn8sg33BewrT3tzYDxq9F0MIUi%2FrHJ6qq1yvbbvYRAFBrNFd1s%2B2vuY%2BaV3SuFwGGv%2FtqQsR1mmgRrFmYt0Gj6AF2ydEjwOMtByRS0oeVYvpCoO0m8hmVNd%2B6WNPjUS8AAbx%2BhSiovP%2FHdgaq02Se4gsV%2Br9gclp2V3WyRM%2FZmD3OlRPvb44QdpmY6NzSOoSvZpD3oo%2B9TWIyB7%2Bpbwu8MAh5rHy4q9uMbtH3DBH4ia2m7KLmicfODKVP3c6pfTxqxwSzLgqYcD2v3zsLYqc6uHr7DkzKAzXn9W0FN5JPDhcroofgAQJoWpbLKLYBVt9FaewltQsCXvf4fMzfHFcGb3pHvqly1rOf1uSvr%2F77L0ofGmg7uJPDJh6fNBpk8OHS9GLdzdQiRMjlAblTQRf%2FurtsQp6I6ykrFvTipWcOA9kltrwR2wJKO%2BYWQP%2FAmRZK4yvlFsphOjoZMX2VlY1w1d6BnZg0TQSY3%2FWQfsS1ZyRgYVJ9WK4CmvwdsJSECvjBlGYFgwaARYkXUVsQAZD9lz%2BdiGfRnY2RQniiD967pQShMGr9DPWgTJYCd3Fh7MNLXndgGOqUB%2FSSDmxJhIQSZk0%2F0tJgamaXog29rDNe380oKR7RpCV7y0W8Qa4YMONmOehnXBm%2F81GXsqNMMB4V2eNwTkA3VdimY7NkPXlQOhP0Nj4LWWxhYX3fghR8Bx4a4k7th9At6ZIrdHC%2FzP3QH4%2FhTvOMya5ddnc9IfBBRlZIiI7c8wEPFzlppRiOcVj5lC2bZZs8E7NvCvbIxOlE4sAg8y0QVDF5LaLbD&X-Amz-Signature=a655e03ac4a1a418fab1c9aa013c7c577fb09f820f69e4d404e9a95a19e18b11&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662OHFBYOS%2F20261126%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261126T011657Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCYjkU5yH8o9mPLBFJHkhU3eXcEX7md%2BwUSEeOBlxnpcgIgY5GizyJgHsz4Wbmza1wV6XuXuqjj1mXznvEhHhq7BGMqiAQIsP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDD%2BIBy8UwJ9kFmPaMSrcA4fLAzdpiEvCGHv8ktSNhzTOE2N8jlYzIinF%2B65YK9qXME94svzmA%2FaCOhIDbvSn8sg33BewrT3tzYDxq9F0MIUi%2FrHJ6qq1yvbbvYRAFBrNFd1s%2B2vuY%2BaV3SuFwGGv%2FtqQsR1mmgRrFmYt0Gj6AF2ydEjwOMtByRS0oeVYvpCoO0m8hmVNd%2B6WNPjUS8AAbx%2BhSiovP%2FHdgaq02Se4gsV%2Br9gclp2V3WyRM%2FZmD3OlRPvb44QdpmY6NzSOoSvZpD3oo%2B9TWIyB7%2Bpbwu8MAh5rHy4q9uMbtH3DBH4ia2m7KLmicfODKVP3c6pfTxqxwSzLgqYcD2v3zsLYqc6uHr7DkzKAzXn9W0FN5JPDhcroofgAQJoWpbLKLYBVt9FaewltQsCXvf4fMzfHFcGb3pHvqly1rOf1uSvr%2F77L0ofGmg7uJPDJh6fNBpk8OHS9GLdzdQiRMjlAblTQRf%2FurtsQp6I6ykrFvTipWcOA9kltrwR2wJKO%2BYWQP%2FAmRZK4yvlFsphOjoZMX2VlY1w1d6BnZg0TQSY3%2FWQfsS1ZyRgYVJ9WK4CmvwdsJSECvjBlGYFgwaARYkXUVsQAZD9lz%2BdiGfRnY2RQniiD967pQShMGr9DPWgTJYCd3Fh7MNLXndgGOqUB%2FSSDmxJhIQSZk0%2F0tJgamaXog29rDNe380oKR7RpCV7y0W8Qa4YMONmOehnXBm%2F81GXsqNMMB4V2eNwTkA3VdimY7NkPXlQOhP0Nj4LWWxhYX3fghR8Bx4a4k7th9At6ZIrdHC%2FzP3QH4%2FhTvOMya5ddnc9IfBBRlZIiI7c8wEPFzlppRiOcVj5lC2bZZs8E7NvCvbIxOlE4sAg8y0QVDF5LaLbD&X-Amz-Signature=45a1aab3003e1b40596bd79abbf068f93a0ebfb482a03a09fb3c640f7f36545f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
