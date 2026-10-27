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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667GHHAPQM%2F20261027%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261027T213449Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECwaCXVzLXdlc3QtMiJIMEYCIQCl%2BSokkWXFmJJjFx71Yw45cPONQMUJK6Qny0ZeZwwCPQIhAOSkrAunHp8qE%2B2HSgadAIlW1QuZSQDL4UXYmeYLgbDmKogECPT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzPBSz9N%2BNVylAJWCIq3ANbuGTx5W%2FAoRKAasOVTDaW6H11AIgq3M8n7ozH%2FKhekzcE8mP3wfw0AhGfrVHC2MV7cbyJxxJ2s7LUgbdfcn2IBSHmR36l0pRBfTCjjbL%2BiA1WUQazn7OJK2vFfY9Zf1xoidWTV5IrvienuGJanbQEBsiTjPrvCN0G8D2Z88O8aKyzX2AeO%2BHZpWH7MVOLnsWXxdw2hsYqa%2FujouoC0linfLlH2JunNyqN76ESagTObKHxQgCkQvJzrnus1NCQ89qE6CYCaG6HD4HxUUnk7YHr6iS92GflkWjMefkPdQmAn1rS8zl2P7F6q%2F0yn8o6E9boI0Z7rrFe%2FPL%2BO7jw5j%2BOx4q7T7CyLUgeJzXjbHO3eE4VaFo10rgx1nI9GHj%2FBa4c9Ik%2BUR84DuAkNyaRd6K1WWG4AOw1BdRoptwUS1UJfvuauEJE0hbdcO5c8tSD%2BWFF3eLpV%2Fkz%2FmNvSRw7UWqIFElIwvdtXQ%2BrI6yR2lL3Y1IWZrUAbEgGHsg0Xd8u2owXR8dwvMLdSyLs7rSvrxwAiaBJtmW%2B%2B9wl%2B3Z%2FJo4yt0AhdqgoAVsjjQiXTE%2FtYAHne2qKDRt8x5Vf7WYWrHQt9Pm4AbcwvuWRR8HADeLU5Y56ZLMfcwdW0TsBgjD4%2BoPXBjqkAaO79LuIK4LvxNtbLf7aI9oDsu1JwcoJ3mOSLyD8iNzceNYY63LYGpRBYPzFO8SXdrquh3U9vRUqNS0xYf3A2%2Fs8P53pvYrD5v%2BeIGjyw645wHHv%2B7PDl%2FUZpKPd9xUUlWA5pUlTJhzl66d0oQ2Bs0kFGz3dsvucDJkVaZRPm3meqIWo0hls92CgTbV7UHMp%2B2x6UZqHIVk9S7B5wS%2BMlScBq2xq&X-Amz-Signature=49933158b5f8577654153b40fb611ff2fb16abda59fd36f92568422a485a0fef&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667GHHAPQM%2F20261027%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261027T213449Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECwaCXVzLXdlc3QtMiJIMEYCIQCl%2BSokkWXFmJJjFx71Yw45cPONQMUJK6Qny0ZeZwwCPQIhAOSkrAunHp8qE%2B2HSgadAIlW1QuZSQDL4UXYmeYLgbDmKogECPT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzPBSz9N%2BNVylAJWCIq3ANbuGTx5W%2FAoRKAasOVTDaW6H11AIgq3M8n7ozH%2FKhekzcE8mP3wfw0AhGfrVHC2MV7cbyJxxJ2s7LUgbdfcn2IBSHmR36l0pRBfTCjjbL%2BiA1WUQazn7OJK2vFfY9Zf1xoidWTV5IrvienuGJanbQEBsiTjPrvCN0G8D2Z88O8aKyzX2AeO%2BHZpWH7MVOLnsWXxdw2hsYqa%2FujouoC0linfLlH2JunNyqN76ESagTObKHxQgCkQvJzrnus1NCQ89qE6CYCaG6HD4HxUUnk7YHr6iS92GflkWjMefkPdQmAn1rS8zl2P7F6q%2F0yn8o6E9boI0Z7rrFe%2FPL%2BO7jw5j%2BOx4q7T7CyLUgeJzXjbHO3eE4VaFo10rgx1nI9GHj%2FBa4c9Ik%2BUR84DuAkNyaRd6K1WWG4AOw1BdRoptwUS1UJfvuauEJE0hbdcO5c8tSD%2BWFF3eLpV%2Fkz%2FmNvSRw7UWqIFElIwvdtXQ%2BrI6yR2lL3Y1IWZrUAbEgGHsg0Xd8u2owXR8dwvMLdSyLs7rSvrxwAiaBJtmW%2B%2B9wl%2B3Z%2FJo4yt0AhdqgoAVsjjQiXTE%2FtYAHne2qKDRt8x5Vf7WYWrHQt9Pm4AbcwvuWRR8HADeLU5Y56ZLMfcwdW0TsBgjD4%2BoPXBjqkAaO79LuIK4LvxNtbLf7aI9oDsu1JwcoJ3mOSLyD8iNzceNYY63LYGpRBYPzFO8SXdrquh3U9vRUqNS0xYf3A2%2Fs8P53pvYrD5v%2BeIGjyw645wHHv%2B7PDl%2FUZpKPd9xUUlWA5pUlTJhzl66d0oQ2Bs0kFGz3dsvucDJkVaZRPm3meqIWo0hls92CgTbV7UHMp%2B2x6UZqHIVk9S7B5wS%2BMlScBq2xq&X-Amz-Signature=cab04c85a303b627f8500734f2bfe0eb567183c402d8268d0dfa18b530e98029&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667GHHAPQM%2F20261027%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261027T213449Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECwaCXVzLXdlc3QtMiJIMEYCIQCl%2BSokkWXFmJJjFx71Yw45cPONQMUJK6Qny0ZeZwwCPQIhAOSkrAunHp8qE%2B2HSgadAIlW1QuZSQDL4UXYmeYLgbDmKogECPT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzPBSz9N%2BNVylAJWCIq3ANbuGTx5W%2FAoRKAasOVTDaW6H11AIgq3M8n7ozH%2FKhekzcE8mP3wfw0AhGfrVHC2MV7cbyJxxJ2s7LUgbdfcn2IBSHmR36l0pRBfTCjjbL%2BiA1WUQazn7OJK2vFfY9Zf1xoidWTV5IrvienuGJanbQEBsiTjPrvCN0G8D2Z88O8aKyzX2AeO%2BHZpWH7MVOLnsWXxdw2hsYqa%2FujouoC0linfLlH2JunNyqN76ESagTObKHxQgCkQvJzrnus1NCQ89qE6CYCaG6HD4HxUUnk7YHr6iS92GflkWjMefkPdQmAn1rS8zl2P7F6q%2F0yn8o6E9boI0Z7rrFe%2FPL%2BO7jw5j%2BOx4q7T7CyLUgeJzXjbHO3eE4VaFo10rgx1nI9GHj%2FBa4c9Ik%2BUR84DuAkNyaRd6K1WWG4AOw1BdRoptwUS1UJfvuauEJE0hbdcO5c8tSD%2BWFF3eLpV%2Fkz%2FmNvSRw7UWqIFElIwvdtXQ%2BrI6yR2lL3Y1IWZrUAbEgGHsg0Xd8u2owXR8dwvMLdSyLs7rSvrxwAiaBJtmW%2B%2B9wl%2B3Z%2FJo4yt0AhdqgoAVsjjQiXTE%2FtYAHne2qKDRt8x5Vf7WYWrHQt9Pm4AbcwvuWRR8HADeLU5Y56ZLMfcwdW0TsBgjD4%2BoPXBjqkAaO79LuIK4LvxNtbLf7aI9oDsu1JwcoJ3mOSLyD8iNzceNYY63LYGpRBYPzFO8SXdrquh3U9vRUqNS0xYf3A2%2Fs8P53pvYrD5v%2BeIGjyw645wHHv%2B7PDl%2FUZpKPd9xUUlWA5pUlTJhzl66d0oQ2Bs0kFGz3dsvucDJkVaZRPm3meqIWo0hls92CgTbV7UHMp%2B2x6UZqHIVk9S7B5wS%2BMlScBq2xq&X-Amz-Signature=ce78909db492914455988f464722ac9990378337a47b8c2598896aa30ac9d3e5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667GHHAPQM%2F20261027%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261027T213449Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECwaCXVzLXdlc3QtMiJIMEYCIQCl%2BSokkWXFmJJjFx71Yw45cPONQMUJK6Qny0ZeZwwCPQIhAOSkrAunHp8qE%2B2HSgadAIlW1QuZSQDL4UXYmeYLgbDmKogECPT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzPBSz9N%2BNVylAJWCIq3ANbuGTx5W%2FAoRKAasOVTDaW6H11AIgq3M8n7ozH%2FKhekzcE8mP3wfw0AhGfrVHC2MV7cbyJxxJ2s7LUgbdfcn2IBSHmR36l0pRBfTCjjbL%2BiA1WUQazn7OJK2vFfY9Zf1xoidWTV5IrvienuGJanbQEBsiTjPrvCN0G8D2Z88O8aKyzX2AeO%2BHZpWH7MVOLnsWXxdw2hsYqa%2FujouoC0linfLlH2JunNyqN76ESagTObKHxQgCkQvJzrnus1NCQ89qE6CYCaG6HD4HxUUnk7YHr6iS92GflkWjMefkPdQmAn1rS8zl2P7F6q%2F0yn8o6E9boI0Z7rrFe%2FPL%2BO7jw5j%2BOx4q7T7CyLUgeJzXjbHO3eE4VaFo10rgx1nI9GHj%2FBa4c9Ik%2BUR84DuAkNyaRd6K1WWG4AOw1BdRoptwUS1UJfvuauEJE0hbdcO5c8tSD%2BWFF3eLpV%2Fkz%2FmNvSRw7UWqIFElIwvdtXQ%2BrI6yR2lL3Y1IWZrUAbEgGHsg0Xd8u2owXR8dwvMLdSyLs7rSvrxwAiaBJtmW%2B%2B9wl%2B3Z%2FJo4yt0AhdqgoAVsjjQiXTE%2FtYAHne2qKDRt8x5Vf7WYWrHQt9Pm4AbcwvuWRR8HADeLU5Y56ZLMfcwdW0TsBgjD4%2BoPXBjqkAaO79LuIK4LvxNtbLf7aI9oDsu1JwcoJ3mOSLyD8iNzceNYY63LYGpRBYPzFO8SXdrquh3U9vRUqNS0xYf3A2%2Fs8P53pvYrD5v%2BeIGjyw645wHHv%2B7PDl%2FUZpKPd9xUUlWA5pUlTJhzl66d0oQ2Bs0kFGz3dsvucDJkVaZRPm3meqIWo0hls92CgTbV7UHMp%2B2x6UZqHIVk9S7B5wS%2BMlScBq2xq&X-Amz-Signature=5da6a414dcff7c25b4154dbf7ba85501d469c68172bc80883e1b106abfade85e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
