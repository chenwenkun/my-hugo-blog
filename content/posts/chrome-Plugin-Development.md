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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663CJRDIC7%2F20260921%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260921T112307Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCUBAdk3WgC38pniYx%2FIaRp6L%2BFaVTMZM0uqFLXw97NsQIgJTbKEx7zJIrHWt4zIBI6Ld2eqepieEaI9aAeknwgQNQqiAQIiv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNYqb13dsfXzmhb%2BvSrcA3yKFJgC2ySSitP8pNhFZ547KeeUHOOtbGPsGeIZnEsMYXMsaDXGQ8uLeYEnUbdccm1WDb9WsEbuJzcs0Aj8JlSzxZnHw4ZrBh8u2jneIR66TGH%2FnShAUZ6xjTVlEplk8Ag9sTMpHZ2UV2mTKCVJwUtnl8EdpCGtre%2BTxB5qaTqU3HeepzNVZ6J0BqYrBIAVMmk%2FCSg1NmzMb175aeh5YSUewl%2BzKzSuEzVs5f%2FXJswZA8D%2FXR1Oyb94CPVLfMsEnz%2BOP5fhcJOFXQXt8KQlsyjicBl8Dgo00ao%2Fw3Y%2FPqe3s8jdOPlmHJkhnRtW1shQUZuiCYanzgKl23CU265qLtMkeK7KwamHDZckOW5Wek773pnqa1ogpOxPLBa%2FkOFK%2FAMiNHr7EZJqhGMAoJXDIUO3H87evLjlx41Rb3DwdRpEIQt%2BPSYr%2Fc0n7ghVf0AAhK9LGQMstnWwW4XxrSEXAIaKVTQeDpgQtrQydYwwLY3UoKke2My3NVmVGKHXMKt9Ktqam6qGA%2FhptrmfHLaHG41jyY6MHEcra9btONNHzVYiwJKPh5mSFD7ajlCbK%2FThbu%2FnNOM0CtLMyYfrxjkjQSv76KvwWlHlGI2yBjdsvk6D4b8zswqyEFTUP1b3MMflw9UGOqUB0F6XF5wDSwCMj5eHEm4RJMf%2B8R7LWYFmJJ70xWd2eOVq%2FSG76Z0Bkg9%2BQJ057xW1G%2FqwDUYzXNzxxcRHbbuZEneVgtjek%2FQhKQXlikXHb73orFh1oP%2F34k6pcxJynaltaU26hz33QH0%2FI1s3Jd9ulrzIXQeKwA6t5CXsdrz5%2BCbZ9u2iDwasFE2Hku0Mq8BXVoJ6%2BsseINFdvYGgSIllscpvTiSe&X-Amz-Signature=3fa09e84b47ade1621555c32dd59f5432ae8957cf5ea4a5464808a43466d840d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663CJRDIC7%2F20260921%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260921T112307Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCUBAdk3WgC38pniYx%2FIaRp6L%2BFaVTMZM0uqFLXw97NsQIgJTbKEx7zJIrHWt4zIBI6Ld2eqepieEaI9aAeknwgQNQqiAQIiv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNYqb13dsfXzmhb%2BvSrcA3yKFJgC2ySSitP8pNhFZ547KeeUHOOtbGPsGeIZnEsMYXMsaDXGQ8uLeYEnUbdccm1WDb9WsEbuJzcs0Aj8JlSzxZnHw4ZrBh8u2jneIR66TGH%2FnShAUZ6xjTVlEplk8Ag9sTMpHZ2UV2mTKCVJwUtnl8EdpCGtre%2BTxB5qaTqU3HeepzNVZ6J0BqYrBIAVMmk%2FCSg1NmzMb175aeh5YSUewl%2BzKzSuEzVs5f%2FXJswZA8D%2FXR1Oyb94CPVLfMsEnz%2BOP5fhcJOFXQXt8KQlsyjicBl8Dgo00ao%2Fw3Y%2FPqe3s8jdOPlmHJkhnRtW1shQUZuiCYanzgKl23CU265qLtMkeK7KwamHDZckOW5Wek773pnqa1ogpOxPLBa%2FkOFK%2FAMiNHr7EZJqhGMAoJXDIUO3H87evLjlx41Rb3DwdRpEIQt%2BPSYr%2Fc0n7ghVf0AAhK9LGQMstnWwW4XxrSEXAIaKVTQeDpgQtrQydYwwLY3UoKke2My3NVmVGKHXMKt9Ktqam6qGA%2FhptrmfHLaHG41jyY6MHEcra9btONNHzVYiwJKPh5mSFD7ajlCbK%2FThbu%2FnNOM0CtLMyYfrxjkjQSv76KvwWlHlGI2yBjdsvk6D4b8zswqyEFTUP1b3MMflw9UGOqUB0F6XF5wDSwCMj5eHEm4RJMf%2B8R7LWYFmJJ70xWd2eOVq%2FSG76Z0Bkg9%2BQJ057xW1G%2FqwDUYzXNzxxcRHbbuZEneVgtjek%2FQhKQXlikXHb73orFh1oP%2F34k6pcxJynaltaU26hz33QH0%2FI1s3Jd9ulrzIXQeKwA6t5CXsdrz5%2BCbZ9u2iDwasFE2Hku0Mq8BXVoJ6%2BsseINFdvYGgSIllscpvTiSe&X-Amz-Signature=180c9403cd13e3ba7065f4addeba3fcc6403067b0678e3e8672194d0e6d619f3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663CJRDIC7%2F20260921%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260921T112307Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCUBAdk3WgC38pniYx%2FIaRp6L%2BFaVTMZM0uqFLXw97NsQIgJTbKEx7zJIrHWt4zIBI6Ld2eqepieEaI9aAeknwgQNQqiAQIiv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNYqb13dsfXzmhb%2BvSrcA3yKFJgC2ySSitP8pNhFZ547KeeUHOOtbGPsGeIZnEsMYXMsaDXGQ8uLeYEnUbdccm1WDb9WsEbuJzcs0Aj8JlSzxZnHw4ZrBh8u2jneIR66TGH%2FnShAUZ6xjTVlEplk8Ag9sTMpHZ2UV2mTKCVJwUtnl8EdpCGtre%2BTxB5qaTqU3HeepzNVZ6J0BqYrBIAVMmk%2FCSg1NmzMb175aeh5YSUewl%2BzKzSuEzVs5f%2FXJswZA8D%2FXR1Oyb94CPVLfMsEnz%2BOP5fhcJOFXQXt8KQlsyjicBl8Dgo00ao%2Fw3Y%2FPqe3s8jdOPlmHJkhnRtW1shQUZuiCYanzgKl23CU265qLtMkeK7KwamHDZckOW5Wek773pnqa1ogpOxPLBa%2FkOFK%2FAMiNHr7EZJqhGMAoJXDIUO3H87evLjlx41Rb3DwdRpEIQt%2BPSYr%2Fc0n7ghVf0AAhK9LGQMstnWwW4XxrSEXAIaKVTQeDpgQtrQydYwwLY3UoKke2My3NVmVGKHXMKt9Ktqam6qGA%2FhptrmfHLaHG41jyY6MHEcra9btONNHzVYiwJKPh5mSFD7ajlCbK%2FThbu%2FnNOM0CtLMyYfrxjkjQSv76KvwWlHlGI2yBjdsvk6D4b8zswqyEFTUP1b3MMflw9UGOqUB0F6XF5wDSwCMj5eHEm4RJMf%2B8R7LWYFmJJ70xWd2eOVq%2FSG76Z0Bkg9%2BQJ057xW1G%2FqwDUYzXNzxxcRHbbuZEneVgtjek%2FQhKQXlikXHb73orFh1oP%2F34k6pcxJynaltaU26hz33QH0%2FI1s3Jd9ulrzIXQeKwA6t5CXsdrz5%2BCbZ9u2iDwasFE2Hku0Mq8BXVoJ6%2BsseINFdvYGgSIllscpvTiSe&X-Amz-Signature=78b5929ae91a0088fde84ec62404e7604c3fe31f7fcc061d405d94cf002127b0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663CJRDIC7%2F20260921%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260921T112307Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCUBAdk3WgC38pniYx%2FIaRp6L%2BFaVTMZM0uqFLXw97NsQIgJTbKEx7zJIrHWt4zIBI6Ld2eqepieEaI9aAeknwgQNQqiAQIiv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNYqb13dsfXzmhb%2BvSrcA3yKFJgC2ySSitP8pNhFZ547KeeUHOOtbGPsGeIZnEsMYXMsaDXGQ8uLeYEnUbdccm1WDb9WsEbuJzcs0Aj8JlSzxZnHw4ZrBh8u2jneIR66TGH%2FnShAUZ6xjTVlEplk8Ag9sTMpHZ2UV2mTKCVJwUtnl8EdpCGtre%2BTxB5qaTqU3HeepzNVZ6J0BqYrBIAVMmk%2FCSg1NmzMb175aeh5YSUewl%2BzKzSuEzVs5f%2FXJswZA8D%2FXR1Oyb94CPVLfMsEnz%2BOP5fhcJOFXQXt8KQlsyjicBl8Dgo00ao%2Fw3Y%2FPqe3s8jdOPlmHJkhnRtW1shQUZuiCYanzgKl23CU265qLtMkeK7KwamHDZckOW5Wek773pnqa1ogpOxPLBa%2FkOFK%2FAMiNHr7EZJqhGMAoJXDIUO3H87evLjlx41Rb3DwdRpEIQt%2BPSYr%2Fc0n7ghVf0AAhK9LGQMstnWwW4XxrSEXAIaKVTQeDpgQtrQydYwwLY3UoKke2My3NVmVGKHXMKt9Ktqam6qGA%2FhptrmfHLaHG41jyY6MHEcra9btONNHzVYiwJKPh5mSFD7ajlCbK%2FThbu%2FnNOM0CtLMyYfrxjkjQSv76KvwWlHlGI2yBjdsvk6D4b8zswqyEFTUP1b3MMflw9UGOqUB0F6XF5wDSwCMj5eHEm4RJMf%2B8R7LWYFmJJ70xWd2eOVq%2FSG76Z0Bkg9%2BQJ057xW1G%2FqwDUYzXNzxxcRHbbuZEneVgtjek%2FQhKQXlikXHb73orFh1oP%2F34k6pcxJynaltaU26hz33QH0%2FI1s3Jd9ulrzIXQeKwA6t5CXsdrz5%2BCbZ9u2iDwasFE2Hku0Mq8BXVoJ6%2BsseINFdvYGgSIllscpvTiSe&X-Amz-Signature=e0b5c9f17ac1870d44b6c42beeab2d78a92ccc5917f4243e181a4084a8c99e0c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
