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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TZ7BFXS7%2F20261020%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261020T103606Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHkaCXVzLXdlc3QtMiJIMEYCIQDBQmBvHmS0Lv8OD8tPP8GdXgAK0nd%2BGW2YHrODJ9E42gIhANP%2FngDWbAob0XFEyV7inDcmHpheRT3bua2FvuGuxQUlKv8DCEIQABoMNjM3NDIzMTgzODA1IgweA%2BL2yrLrztrdRdkq3ANdBFzO08VC%2F17dvmNXiNPb%2FY0z%2B6v428IgPogj2Tswk6jd%2Bz7n8zzpu%2Bn3BytjcLbS3R590I05QKI5x5%2BMG8xccNuU2JWwpcTzfsBn2zMwjrecs%2FiZV%2F340z1a%2FBhZAkoMbcEtAaxyVAhOGQCqgdPZKRV9rStvgHgSt4m%2BSvTslpVNV49OoMFx2Wugr9RBGpJSGca3yT5NUcyBD8YDG2hbVjeBDZH5xUQOyR0iBW6x00VNFJoXHl0ryBfmH%2FD57PAmf6CqnB%2FKFt0PC%2FmuJjEgR5lJ5nJuYlp%2BlS4FbWbaXg6o0rQq%2Bj04XcZ3K4QR9PIxU9Dowk1KJ6S6Suo6FbkohTNZ1Slo%2Fk2lxF3gTbXXrAdS1qPuyhJBk2f5H9b%2F%2FOxQZZqnGj2vndAJvYPtQrLyViNFmC4DAWwzkPU6rxXbCU%2B1jTq2GOBmeUXoqwMdd84Gr%2FWuQpLxEGpFfOIcAEcW7zFu9p3Tc5g4PonZMhIqR9j4dvCGEw2zj9JMiL5dPvn66mo0R1xqyhUZDGifa%2FMSEJ0DnKKbjLq1SQuI8XiEr3y5R8uijwWav0PjPDyoM1saiiJo7AyidxvwiBkwVjy%2FM430r2XBjSUuo3WCIPYM3HEtpIE5x9lyen53iDCC09zWBjqkAaluYXtrCHIMIxqXFkQrmmGTTb2b%2F8oCqsB5XhNr7g0FL%2F%2BI%2FYd1HK%2FUjGX5zV8Dan56xHmDSskhRFEblWu%2BWKY%2F0V43b2KreQghhtUhh6kjnwjQx%2F3342tE%2BPuOiMUMWaUqJci1UPjTjxr%2FUqbgLJycB4iikZRa7%2FEoA51GneTYE59YGWZ5ypKx%2BD3%2BOTKVML4lVDW33nSm7453OgsYGqHEhFM%2B&X-Amz-Signature=0f1bb513316ca2c7a3d8ad89b3a7e0ab4471e11415d308bb0b544fd9ca964f7b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TZ7BFXS7%2F20261020%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261020T103606Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHkaCXVzLXdlc3QtMiJIMEYCIQDBQmBvHmS0Lv8OD8tPP8GdXgAK0nd%2BGW2YHrODJ9E42gIhANP%2FngDWbAob0XFEyV7inDcmHpheRT3bua2FvuGuxQUlKv8DCEIQABoMNjM3NDIzMTgzODA1IgweA%2BL2yrLrztrdRdkq3ANdBFzO08VC%2F17dvmNXiNPb%2FY0z%2B6v428IgPogj2Tswk6jd%2Bz7n8zzpu%2Bn3BytjcLbS3R590I05QKI5x5%2BMG8xccNuU2JWwpcTzfsBn2zMwjrecs%2FiZV%2F340z1a%2FBhZAkoMbcEtAaxyVAhOGQCqgdPZKRV9rStvgHgSt4m%2BSvTslpVNV49OoMFx2Wugr9RBGpJSGca3yT5NUcyBD8YDG2hbVjeBDZH5xUQOyR0iBW6x00VNFJoXHl0ryBfmH%2FD57PAmf6CqnB%2FKFt0PC%2FmuJjEgR5lJ5nJuYlp%2BlS4FbWbaXg6o0rQq%2Bj04XcZ3K4QR9PIxU9Dowk1KJ6S6Suo6FbkohTNZ1Slo%2Fk2lxF3gTbXXrAdS1qPuyhJBk2f5H9b%2F%2FOxQZZqnGj2vndAJvYPtQrLyViNFmC4DAWwzkPU6rxXbCU%2B1jTq2GOBmeUXoqwMdd84Gr%2FWuQpLxEGpFfOIcAEcW7zFu9p3Tc5g4PonZMhIqR9j4dvCGEw2zj9JMiL5dPvn66mo0R1xqyhUZDGifa%2FMSEJ0DnKKbjLq1SQuI8XiEr3y5R8uijwWav0PjPDyoM1saiiJo7AyidxvwiBkwVjy%2FM430r2XBjSUuo3WCIPYM3HEtpIE5x9lyen53iDCC09zWBjqkAaluYXtrCHIMIxqXFkQrmmGTTb2b%2F8oCqsB5XhNr7g0FL%2F%2BI%2FYd1HK%2FUjGX5zV8Dan56xHmDSskhRFEblWu%2BWKY%2F0V43b2KreQghhtUhh6kjnwjQx%2F3342tE%2BPuOiMUMWaUqJci1UPjTjxr%2FUqbgLJycB4iikZRa7%2FEoA51GneTYE59YGWZ5ypKx%2BD3%2BOTKVML4lVDW33nSm7453OgsYGqHEhFM%2B&X-Amz-Signature=2fc562a6fc7935b5cd0f3fd8d4fc301287ad594f4dfd6ac98aa33f68a6cc3980&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TZ7BFXS7%2F20261020%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261020T103606Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHkaCXVzLXdlc3QtMiJIMEYCIQDBQmBvHmS0Lv8OD8tPP8GdXgAK0nd%2BGW2YHrODJ9E42gIhANP%2FngDWbAob0XFEyV7inDcmHpheRT3bua2FvuGuxQUlKv8DCEIQABoMNjM3NDIzMTgzODA1IgweA%2BL2yrLrztrdRdkq3ANdBFzO08VC%2F17dvmNXiNPb%2FY0z%2B6v428IgPogj2Tswk6jd%2Bz7n8zzpu%2Bn3BytjcLbS3R590I05QKI5x5%2BMG8xccNuU2JWwpcTzfsBn2zMwjrecs%2FiZV%2F340z1a%2FBhZAkoMbcEtAaxyVAhOGQCqgdPZKRV9rStvgHgSt4m%2BSvTslpVNV49OoMFx2Wugr9RBGpJSGca3yT5NUcyBD8YDG2hbVjeBDZH5xUQOyR0iBW6x00VNFJoXHl0ryBfmH%2FD57PAmf6CqnB%2FKFt0PC%2FmuJjEgR5lJ5nJuYlp%2BlS4FbWbaXg6o0rQq%2Bj04XcZ3K4QR9PIxU9Dowk1KJ6S6Suo6FbkohTNZ1Slo%2Fk2lxF3gTbXXrAdS1qPuyhJBk2f5H9b%2F%2FOxQZZqnGj2vndAJvYPtQrLyViNFmC4DAWwzkPU6rxXbCU%2B1jTq2GOBmeUXoqwMdd84Gr%2FWuQpLxEGpFfOIcAEcW7zFu9p3Tc5g4PonZMhIqR9j4dvCGEw2zj9JMiL5dPvn66mo0R1xqyhUZDGifa%2FMSEJ0DnKKbjLq1SQuI8XiEr3y5R8uijwWav0PjPDyoM1saiiJo7AyidxvwiBkwVjy%2FM430r2XBjSUuo3WCIPYM3HEtpIE5x9lyen53iDCC09zWBjqkAaluYXtrCHIMIxqXFkQrmmGTTb2b%2F8oCqsB5XhNr7g0FL%2F%2BI%2FYd1HK%2FUjGX5zV8Dan56xHmDSskhRFEblWu%2BWKY%2F0V43b2KreQghhtUhh6kjnwjQx%2F3342tE%2BPuOiMUMWaUqJci1UPjTjxr%2FUqbgLJycB4iikZRa7%2FEoA51GneTYE59YGWZ5ypKx%2BD3%2BOTKVML4lVDW33nSm7453OgsYGqHEhFM%2B&X-Amz-Signature=a53fb9fc51694c78163e88706d397bed2c554b0eb119c52c59de79d1db54655a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TZ7BFXS7%2F20261020%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261020T103606Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHkaCXVzLXdlc3QtMiJIMEYCIQDBQmBvHmS0Lv8OD8tPP8GdXgAK0nd%2BGW2YHrODJ9E42gIhANP%2FngDWbAob0XFEyV7inDcmHpheRT3bua2FvuGuxQUlKv8DCEIQABoMNjM3NDIzMTgzODA1IgweA%2BL2yrLrztrdRdkq3ANdBFzO08VC%2F17dvmNXiNPb%2FY0z%2B6v428IgPogj2Tswk6jd%2Bz7n8zzpu%2Bn3BytjcLbS3R590I05QKI5x5%2BMG8xccNuU2JWwpcTzfsBn2zMwjrecs%2FiZV%2F340z1a%2FBhZAkoMbcEtAaxyVAhOGQCqgdPZKRV9rStvgHgSt4m%2BSvTslpVNV49OoMFx2Wugr9RBGpJSGca3yT5NUcyBD8YDG2hbVjeBDZH5xUQOyR0iBW6x00VNFJoXHl0ryBfmH%2FD57PAmf6CqnB%2FKFt0PC%2FmuJjEgR5lJ5nJuYlp%2BlS4FbWbaXg6o0rQq%2Bj04XcZ3K4QR9PIxU9Dowk1KJ6S6Suo6FbkohTNZ1Slo%2Fk2lxF3gTbXXrAdS1qPuyhJBk2f5H9b%2F%2FOxQZZqnGj2vndAJvYPtQrLyViNFmC4DAWwzkPU6rxXbCU%2B1jTq2GOBmeUXoqwMdd84Gr%2FWuQpLxEGpFfOIcAEcW7zFu9p3Tc5g4PonZMhIqR9j4dvCGEw2zj9JMiL5dPvn66mo0R1xqyhUZDGifa%2FMSEJ0DnKKbjLq1SQuI8XiEr3y5R8uijwWav0PjPDyoM1saiiJo7AyidxvwiBkwVjy%2FM430r2XBjSUuo3WCIPYM3HEtpIE5x9lyen53iDCC09zWBjqkAaluYXtrCHIMIxqXFkQrmmGTTb2b%2F8oCqsB5XhNr7g0FL%2F%2BI%2FYd1HK%2FUjGX5zV8Dan56xHmDSskhRFEblWu%2BWKY%2F0V43b2KreQghhtUhh6kjnwjQx%2F3342tE%2BPuOiMUMWaUqJci1UPjTjxr%2FUqbgLJycB4iikZRa7%2FEoA51GneTYE59YGWZ5ypKx%2BD3%2BOTKVML4lVDW33nSm7453OgsYGqHEhFM%2B&X-Amz-Signature=5bf3ee3f1b33bf2c495a3b5873ff343735380f33d9e9769445f8859703448c99&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
