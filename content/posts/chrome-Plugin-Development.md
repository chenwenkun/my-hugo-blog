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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VGT2KIFY%2F20261003%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261003T201924Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIChitpnoDRftosvaaqxFWglwcWBYTq3F6BJGkA%2B193BRAiEA4HiJfYJ7G%2FRoiI36mBytDQnxnLrIdVgqzWerVZYQbAMqiAQItP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDKMTlfB61UpfusLf2SrcA93ORrBNarN4gGaaG9sxiTk%2BRcaFXutsU99BGUur%2B%2Bci39mHdc%2F%2BPD%2FYa%2FhsgHs%2B3k4zBbsDBHnOUAyuYSzQjWqP2TMdsk7pVr9Alpr%2B3f3f87ujTYSQAPUAJmtzjYPdAi85L7WxEwFSWDhNWtfxLkKp10p3WOJXoZV%2BLXgvPNn%2FR1AEAEdf38aYe65bkOI3CZqTPD6%2BWGFEBzc%2Bv%2BsmJb7qGFWtnDEDaheFmGUAAhy8bCc8SjOtWAqamNr2twYJZCmKoOpLXucMwycq05kJDBoGQ%2BfeOVJiWNrX1Y8d%2BmhcPRGVtV8nEwjXPDQ3hnBJmPzrds%2FxJe4G%2BIt%2BhWKExPYeB7AQvGbiqX66r%2FMb88O5a9NAb1ywN%2BRNYLE8ixhMjKIy3kYeT91R6%2FcluDtlgki4JNNRhBx0DvNyrCGW7VfyjgA8m7nQgXGYgCD2ldxo%2BcVOQYVN%2FZ3cD6wV2cVtdX79MgCRg%2B8oOa%2FhuBQQmJ%2BIEWek5FJYgia8wYFoVn9GJiQO8W1ta%2BQb95QzVWuWo%2BDGNf3cPMz6nvd4vfjV7o95xohe2ajr3aLv3%2BDJBc1VuOZfTzkGpP39Gtl9Dg6Xxa5pclkXx3d1HqJYd15dJ%2BBToG6e%2FjqFWqIkJ4e8MJOvhdYGOqUBGE1jKv3xK1Je5gm5hbaalWdpCg58HaEiyGoBO89sOm9%2FiCGTXn1apviUda6r%2BQolKylGv3Gwpy%2BQac46mmlg0s5A3%2FAtMRaEyve45rF7Yxxni%2FQoYHv2Hhf9LikkDPXXGf%2FlmTgDPOIdCauNqiFDpH7PuHdJQ1MrXkpt1dl49ha8bHdBZGxsfo9RIQmMF5XZfevh9JZDhkE%2BUD8RgczaRk3PTJak&X-Amz-Signature=4f2cf207c33fade63684a7fa8e55a565364843a718d88d0e47c1ebfd4d267600&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VGT2KIFY%2F20261003%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261003T201924Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIChitpnoDRftosvaaqxFWglwcWBYTq3F6BJGkA%2B193BRAiEA4HiJfYJ7G%2FRoiI36mBytDQnxnLrIdVgqzWerVZYQbAMqiAQItP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDKMTlfB61UpfusLf2SrcA93ORrBNarN4gGaaG9sxiTk%2BRcaFXutsU99BGUur%2B%2Bci39mHdc%2F%2BPD%2FYa%2FhsgHs%2B3k4zBbsDBHnOUAyuYSzQjWqP2TMdsk7pVr9Alpr%2B3f3f87ujTYSQAPUAJmtzjYPdAi85L7WxEwFSWDhNWtfxLkKp10p3WOJXoZV%2BLXgvPNn%2FR1AEAEdf38aYe65bkOI3CZqTPD6%2BWGFEBzc%2Bv%2BsmJb7qGFWtnDEDaheFmGUAAhy8bCc8SjOtWAqamNr2twYJZCmKoOpLXucMwycq05kJDBoGQ%2BfeOVJiWNrX1Y8d%2BmhcPRGVtV8nEwjXPDQ3hnBJmPzrds%2FxJe4G%2BIt%2BhWKExPYeB7AQvGbiqX66r%2FMb88O5a9NAb1ywN%2BRNYLE8ixhMjKIy3kYeT91R6%2FcluDtlgki4JNNRhBx0DvNyrCGW7VfyjgA8m7nQgXGYgCD2ldxo%2BcVOQYVN%2FZ3cD6wV2cVtdX79MgCRg%2B8oOa%2FhuBQQmJ%2BIEWek5FJYgia8wYFoVn9GJiQO8W1ta%2BQb95QzVWuWo%2BDGNf3cPMz6nvd4vfjV7o95xohe2ajr3aLv3%2BDJBc1VuOZfTzkGpP39Gtl9Dg6Xxa5pclkXx3d1HqJYd15dJ%2BBToG6e%2FjqFWqIkJ4e8MJOvhdYGOqUBGE1jKv3xK1Je5gm5hbaalWdpCg58HaEiyGoBO89sOm9%2FiCGTXn1apviUda6r%2BQolKylGv3Gwpy%2BQac46mmlg0s5A3%2FAtMRaEyve45rF7Yxxni%2FQoYHv2Hhf9LikkDPXXGf%2FlmTgDPOIdCauNqiFDpH7PuHdJQ1MrXkpt1dl49ha8bHdBZGxsfo9RIQmMF5XZfevh9JZDhkE%2BUD8RgczaRk3PTJak&X-Amz-Signature=7c4a3ca6b4a8ba8464d3d3d60003efbc0ab42fd0057ffff455a4093dd3b97dcc&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VGT2KIFY%2F20261003%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261003T201924Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIChitpnoDRftosvaaqxFWglwcWBYTq3F6BJGkA%2B193BRAiEA4HiJfYJ7G%2FRoiI36mBytDQnxnLrIdVgqzWerVZYQbAMqiAQItP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDKMTlfB61UpfusLf2SrcA93ORrBNarN4gGaaG9sxiTk%2BRcaFXutsU99BGUur%2B%2Bci39mHdc%2F%2BPD%2FYa%2FhsgHs%2B3k4zBbsDBHnOUAyuYSzQjWqP2TMdsk7pVr9Alpr%2B3f3f87ujTYSQAPUAJmtzjYPdAi85L7WxEwFSWDhNWtfxLkKp10p3WOJXoZV%2BLXgvPNn%2FR1AEAEdf38aYe65bkOI3CZqTPD6%2BWGFEBzc%2Bv%2BsmJb7qGFWtnDEDaheFmGUAAhy8bCc8SjOtWAqamNr2twYJZCmKoOpLXucMwycq05kJDBoGQ%2BfeOVJiWNrX1Y8d%2BmhcPRGVtV8nEwjXPDQ3hnBJmPzrds%2FxJe4G%2BIt%2BhWKExPYeB7AQvGbiqX66r%2FMb88O5a9NAb1ywN%2BRNYLE8ixhMjKIy3kYeT91R6%2FcluDtlgki4JNNRhBx0DvNyrCGW7VfyjgA8m7nQgXGYgCD2ldxo%2BcVOQYVN%2FZ3cD6wV2cVtdX79MgCRg%2B8oOa%2FhuBQQmJ%2BIEWek5FJYgia8wYFoVn9GJiQO8W1ta%2BQb95QzVWuWo%2BDGNf3cPMz6nvd4vfjV7o95xohe2ajr3aLv3%2BDJBc1VuOZfTzkGpP39Gtl9Dg6Xxa5pclkXx3d1HqJYd15dJ%2BBToG6e%2FjqFWqIkJ4e8MJOvhdYGOqUBGE1jKv3xK1Je5gm5hbaalWdpCg58HaEiyGoBO89sOm9%2FiCGTXn1apviUda6r%2BQolKylGv3Gwpy%2BQac46mmlg0s5A3%2FAtMRaEyve45rF7Yxxni%2FQoYHv2Hhf9LikkDPXXGf%2FlmTgDPOIdCauNqiFDpH7PuHdJQ1MrXkpt1dl49ha8bHdBZGxsfo9RIQmMF5XZfevh9JZDhkE%2BUD8RgczaRk3PTJak&X-Amz-Signature=83f2908efe7917730246dce8a9283a90bb7b7a6974c1d661d0153958597d3e0c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VGT2KIFY%2F20261003%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261003T201924Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIChitpnoDRftosvaaqxFWglwcWBYTq3F6BJGkA%2B193BRAiEA4HiJfYJ7G%2FRoiI36mBytDQnxnLrIdVgqzWerVZYQbAMqiAQItP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDKMTlfB61UpfusLf2SrcA93ORrBNarN4gGaaG9sxiTk%2BRcaFXutsU99BGUur%2B%2Bci39mHdc%2F%2BPD%2FYa%2FhsgHs%2B3k4zBbsDBHnOUAyuYSzQjWqP2TMdsk7pVr9Alpr%2B3f3f87ujTYSQAPUAJmtzjYPdAi85L7WxEwFSWDhNWtfxLkKp10p3WOJXoZV%2BLXgvPNn%2FR1AEAEdf38aYe65bkOI3CZqTPD6%2BWGFEBzc%2Bv%2BsmJb7qGFWtnDEDaheFmGUAAhy8bCc8SjOtWAqamNr2twYJZCmKoOpLXucMwycq05kJDBoGQ%2BfeOVJiWNrX1Y8d%2BmhcPRGVtV8nEwjXPDQ3hnBJmPzrds%2FxJe4G%2BIt%2BhWKExPYeB7AQvGbiqX66r%2FMb88O5a9NAb1ywN%2BRNYLE8ixhMjKIy3kYeT91R6%2FcluDtlgki4JNNRhBx0DvNyrCGW7VfyjgA8m7nQgXGYgCD2ldxo%2BcVOQYVN%2FZ3cD6wV2cVtdX79MgCRg%2B8oOa%2FhuBQQmJ%2BIEWek5FJYgia8wYFoVn9GJiQO8W1ta%2BQb95QzVWuWo%2BDGNf3cPMz6nvd4vfjV7o95xohe2ajr3aLv3%2BDJBc1VuOZfTzkGpP39Gtl9Dg6Xxa5pclkXx3d1HqJYd15dJ%2BBToG6e%2FjqFWqIkJ4e8MJOvhdYGOqUBGE1jKv3xK1Je5gm5hbaalWdpCg58HaEiyGoBO89sOm9%2FiCGTXn1apviUda6r%2BQolKylGv3Gwpy%2BQac46mmlg0s5A3%2FAtMRaEyve45rF7Yxxni%2FQoYHv2Hhf9LikkDPXXGf%2FlmTgDPOIdCauNqiFDpH7PuHdJQ1MrXkpt1dl49ha8bHdBZGxsfo9RIQmMF5XZfevh9JZDhkE%2BUD8RgczaRk3PTJak&X-Amz-Signature=b529c2b7e95ef9a17b9ca9260d69c57b67e8d9e3f373fc90a647cf3f0c261cc3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
