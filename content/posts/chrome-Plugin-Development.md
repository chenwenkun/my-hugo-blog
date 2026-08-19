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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RIPFM5UD%2F20260819%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260819T003637Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIAcdAqRajGb8sB9X3UhS7jC%2FzLjVu8tMbD8E8mwfVS0uAiEA82K28a90lA4fCpKNs%2BtywMSsjROXGhkC2cyDx8qE4jYq%2FwMIaRAAGgw2Mzc0MjMxODM4MDUiDIzeB1VM5vvotQ0wXircA6Ge2qcMNgGAseHFGFpy6HT5BKSd5lnIJ0l8cz%2FZRLD2FYCb8yF3mhrrcl1vc0L7yw5%2BxPgKivTrZzX3BChtptMDRrRdJd42yHFrCCYR5YKx2nJzop8ahx74UqcwAfpITqdwe4XlER9i423IQwwIVuWqAnGSNzXuAsHVfiLtWTsHlf%2FeVmUWtbCnpqaeFK4pRPASDVb7%2Fs8aGtL%2BYENDLjELde%2BKUaUmlGDpwfat1QRJbuYWj5600cNjQVAI17moxeTXD63xvHSyr82GUyNh8F1chSIl%2FqvOxh%2BKsZyz9t7UNgZHWc2W4SjMK96jMfLJ5v47g%2Bj7M9edaF%2BxOtGzYZtmu970x39KxQEuKVVFL%2FhOYlk%2B8s2b5ntaeezVb4TA1Mdt64wXHYEVihj5woUfQgkOrsgDWCn80jTMV2%2FGQjZmwI%2BoBtHehsO1oL%2FTHfasDSyKGFPCBnlJAkFFMQlCLrA%2BhjWFD1lheLYYeyMIUQq42nAkbOEEtGUPB4JM8XosdlLG6Nybln6AQ27YZixUjl5P%2BcR5Zug%2BCui9Lg7ncp10bSvvECVz9k8vsgvOUlU3LyV8grY5BI6LgJtbBp8wASYSauJWvQSU%2BbUwLBhFp%2F1KKmUYNWOyq3cscVpBMPHWk9QGOqUB63XRoK5AbrXKk0%2BeqOuoX9gkT5H4P3gTaWe8aaXaiszZkvXgCsI9E5SY6xbYwmK1w14N9EbX1a4%2BHXXftQn9jdDL9HjfWL46k1t%2FZv9%2FxDN8qy3g3nX%2BmtxccF1mrFekjUbgyjTxUPfJh%2FDI0xWPPyGupbvk%2F95wuEVnULiUjMO6N1lY8yKSpBCV5TIa0PZ4aSEGAxSyGksoXTLy0LlWANTbnBgO&X-Amz-Signature=f15983f5408fb220e0cfe7712599a95c9d2e78ce569f7bb51ae7f27ed5cd6cfd&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RIPFM5UD%2F20260819%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260819T003637Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIAcdAqRajGb8sB9X3UhS7jC%2FzLjVu8tMbD8E8mwfVS0uAiEA82K28a90lA4fCpKNs%2BtywMSsjROXGhkC2cyDx8qE4jYq%2FwMIaRAAGgw2Mzc0MjMxODM4MDUiDIzeB1VM5vvotQ0wXircA6Ge2qcMNgGAseHFGFpy6HT5BKSd5lnIJ0l8cz%2FZRLD2FYCb8yF3mhrrcl1vc0L7yw5%2BxPgKivTrZzX3BChtptMDRrRdJd42yHFrCCYR5YKx2nJzop8ahx74UqcwAfpITqdwe4XlER9i423IQwwIVuWqAnGSNzXuAsHVfiLtWTsHlf%2FeVmUWtbCnpqaeFK4pRPASDVb7%2Fs8aGtL%2BYENDLjELde%2BKUaUmlGDpwfat1QRJbuYWj5600cNjQVAI17moxeTXD63xvHSyr82GUyNh8F1chSIl%2FqvOxh%2BKsZyz9t7UNgZHWc2W4SjMK96jMfLJ5v47g%2Bj7M9edaF%2BxOtGzYZtmu970x39KxQEuKVVFL%2FhOYlk%2B8s2b5ntaeezVb4TA1Mdt64wXHYEVihj5woUfQgkOrsgDWCn80jTMV2%2FGQjZmwI%2BoBtHehsO1oL%2FTHfasDSyKGFPCBnlJAkFFMQlCLrA%2BhjWFD1lheLYYeyMIUQq42nAkbOEEtGUPB4JM8XosdlLG6Nybln6AQ27YZixUjl5P%2BcR5Zug%2BCui9Lg7ncp10bSvvECVz9k8vsgvOUlU3LyV8grY5BI6LgJtbBp8wASYSauJWvQSU%2BbUwLBhFp%2F1KKmUYNWOyq3cscVpBMPHWk9QGOqUB63XRoK5AbrXKk0%2BeqOuoX9gkT5H4P3gTaWe8aaXaiszZkvXgCsI9E5SY6xbYwmK1w14N9EbX1a4%2BHXXftQn9jdDL9HjfWL46k1t%2FZv9%2FxDN8qy3g3nX%2BmtxccF1mrFekjUbgyjTxUPfJh%2FDI0xWPPyGupbvk%2F95wuEVnULiUjMO6N1lY8yKSpBCV5TIa0PZ4aSEGAxSyGksoXTLy0LlWANTbnBgO&X-Amz-Signature=a264351ec88717f8a30933d106a8586505b729e767ceb60e583346cd390fed9e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RIPFM5UD%2F20260819%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260819T003637Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIAcdAqRajGb8sB9X3UhS7jC%2FzLjVu8tMbD8E8mwfVS0uAiEA82K28a90lA4fCpKNs%2BtywMSsjROXGhkC2cyDx8qE4jYq%2FwMIaRAAGgw2Mzc0MjMxODM4MDUiDIzeB1VM5vvotQ0wXircA6Ge2qcMNgGAseHFGFpy6HT5BKSd5lnIJ0l8cz%2FZRLD2FYCb8yF3mhrrcl1vc0L7yw5%2BxPgKivTrZzX3BChtptMDRrRdJd42yHFrCCYR5YKx2nJzop8ahx74UqcwAfpITqdwe4XlER9i423IQwwIVuWqAnGSNzXuAsHVfiLtWTsHlf%2FeVmUWtbCnpqaeFK4pRPASDVb7%2Fs8aGtL%2BYENDLjELde%2BKUaUmlGDpwfat1QRJbuYWj5600cNjQVAI17moxeTXD63xvHSyr82GUyNh8F1chSIl%2FqvOxh%2BKsZyz9t7UNgZHWc2W4SjMK96jMfLJ5v47g%2Bj7M9edaF%2BxOtGzYZtmu970x39KxQEuKVVFL%2FhOYlk%2B8s2b5ntaeezVb4TA1Mdt64wXHYEVihj5woUfQgkOrsgDWCn80jTMV2%2FGQjZmwI%2BoBtHehsO1oL%2FTHfasDSyKGFPCBnlJAkFFMQlCLrA%2BhjWFD1lheLYYeyMIUQq42nAkbOEEtGUPB4JM8XosdlLG6Nybln6AQ27YZixUjl5P%2BcR5Zug%2BCui9Lg7ncp10bSvvECVz9k8vsgvOUlU3LyV8grY5BI6LgJtbBp8wASYSauJWvQSU%2BbUwLBhFp%2F1KKmUYNWOyq3cscVpBMPHWk9QGOqUB63XRoK5AbrXKk0%2BeqOuoX9gkT5H4P3gTaWe8aaXaiszZkvXgCsI9E5SY6xbYwmK1w14N9EbX1a4%2BHXXftQn9jdDL9HjfWL46k1t%2FZv9%2FxDN8qy3g3nX%2BmtxccF1mrFekjUbgyjTxUPfJh%2FDI0xWPPyGupbvk%2F95wuEVnULiUjMO6N1lY8yKSpBCV5TIa0PZ4aSEGAxSyGksoXTLy0LlWANTbnBgO&X-Amz-Signature=631d8c7ea9873752c009963a62499e035954a60d0e8f81a0e1f137d1e334d1e3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RIPFM5UD%2F20260819%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260819T003637Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIAcdAqRajGb8sB9X3UhS7jC%2FzLjVu8tMbD8E8mwfVS0uAiEA82K28a90lA4fCpKNs%2BtywMSsjROXGhkC2cyDx8qE4jYq%2FwMIaRAAGgw2Mzc0MjMxODM4MDUiDIzeB1VM5vvotQ0wXircA6Ge2qcMNgGAseHFGFpy6HT5BKSd5lnIJ0l8cz%2FZRLD2FYCb8yF3mhrrcl1vc0L7yw5%2BxPgKivTrZzX3BChtptMDRrRdJd42yHFrCCYR5YKx2nJzop8ahx74UqcwAfpITqdwe4XlER9i423IQwwIVuWqAnGSNzXuAsHVfiLtWTsHlf%2FeVmUWtbCnpqaeFK4pRPASDVb7%2Fs8aGtL%2BYENDLjELde%2BKUaUmlGDpwfat1QRJbuYWj5600cNjQVAI17moxeTXD63xvHSyr82GUyNh8F1chSIl%2FqvOxh%2BKsZyz9t7UNgZHWc2W4SjMK96jMfLJ5v47g%2Bj7M9edaF%2BxOtGzYZtmu970x39KxQEuKVVFL%2FhOYlk%2B8s2b5ntaeezVb4TA1Mdt64wXHYEVihj5woUfQgkOrsgDWCn80jTMV2%2FGQjZmwI%2BoBtHehsO1oL%2FTHfasDSyKGFPCBnlJAkFFMQlCLrA%2BhjWFD1lheLYYeyMIUQq42nAkbOEEtGUPB4JM8XosdlLG6Nybln6AQ27YZixUjl5P%2BcR5Zug%2BCui9Lg7ncp10bSvvECVz9k8vsgvOUlU3LyV8grY5BI6LgJtbBp8wASYSauJWvQSU%2BbUwLBhFp%2F1KKmUYNWOyq3cscVpBMPHWk9QGOqUB63XRoK5AbrXKk0%2BeqOuoX9gkT5H4P3gTaWe8aaXaiszZkvXgCsI9E5SY6xbYwmK1w14N9EbX1a4%2BHXXftQn9jdDL9HjfWL46k1t%2FZv9%2FxDN8qy3g3nX%2BmtxccF1mrFekjUbgyjTxUPfJh%2FDI0xWPPyGupbvk%2F95wuEVnULiUjMO6N1lY8yKSpBCV5TIa0PZ4aSEGAxSyGksoXTLy0LlWANTbnBgO&X-Amz-Signature=f7a9700344a1e81df6d40c74b217d53faf9112729dbdbf6d95d5d769c766ad6b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
