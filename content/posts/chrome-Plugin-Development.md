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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QYFD2MNT%2F20260821%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260821T003911Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEND%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDyrdjyt6rV1jt7FkNii6jB7BoRM2ySP2X5nRXLcmM9WwIhAJ1SKhX4vR5w2JhAYiSEEPcN8kjYV1WVhl5iU6sdKOa8KogECJn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igy%2BV9hglnkl%2BRIcnbEq3AOmxVi5FWhh57tBXZO4HYZa5Q6IHJhhvlJwhBL8N0eRejkO5y7bJQMzO8oC7NteLIW3XNAVNwNIpY8hV8zOYQv%2FDM9MMCjolEbPgTuHPXdBDrJV2quz1mCm%2BaMZSuLj2GpSuU8P%2Fl2%2FeEEkS6IuT4nY1Wkds5OcCNLYCPVSu%2Bd7kYeiDF%2BEJSZCZ9yw3%2BLYd3%2BC%2FPtVYnJQc3W%2FFKGwNtH1bjXA8B2Ex%2Bc0ZiBreAKtJzSK3KVbbN0qGik0BvhHqFDGuwYKN10Rehygr1yi87PP3IayRM7lAsS2WRYGyoKHtSFj8JC9Q5MmsdLTkzPVBbB0mQx3R2%2FASTAVAjtx3oKJotBii0X%2FoFYoOm0O%2BHwknN%2FtpnhSkfMtSRZsPOum9AgFnnE0Z5MBDyXboprXleNNHWODk2NgCON9zxW6Q6RTO9lFTnkgnTwqjTtSqXy0IfGBqcwe2qFH2CxyXC%2BQr%2BUi%2FpHo%2B11qxrgLEmv9PxUNzqr82Bw%2B8QA6oZZRBUbSJXvrP2QT%2FmMjXkTfPIE8MEnbevXefIDF4wlZfRwXYMoSev80ySiKBc4pTQuzCgzafoymS7F9cH9t6tDhi9nqC5oaXKUhagqCC5N6bOelK5fi%2Fy9eqbjRO4ESwu1oEzD%2FrJ7UBjqkAc8nBi1ZuSGa8eCnfBn7jvcwF9ouJImsOXAiUxsjOWF%2BFrFjY29KtpSYqYTchJxiaVSwntRxRcP6uw7%2BfzrT%2BxfYdtQqk2fqrjm3vUv7cJ8AMFpb6OG2zWgL2W2h%2FBvDaPbO6N32s99grpJOOTJGJtBlnLjcftCj%2BA7MMFSWguxIFaE0jI7WxwFDLjpRsY0LBsPJXihDcM1hKrQpdPyXYKtQTZmL&X-Amz-Signature=c0f89efae3f9360900f0bddd6b715099555476c56593f371649dfe9ecf8fd83b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QYFD2MNT%2F20260821%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260821T003911Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEND%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDyrdjyt6rV1jt7FkNii6jB7BoRM2ySP2X5nRXLcmM9WwIhAJ1SKhX4vR5w2JhAYiSEEPcN8kjYV1WVhl5iU6sdKOa8KogECJn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igy%2BV9hglnkl%2BRIcnbEq3AOmxVi5FWhh57tBXZO4HYZa5Q6IHJhhvlJwhBL8N0eRejkO5y7bJQMzO8oC7NteLIW3XNAVNwNIpY8hV8zOYQv%2FDM9MMCjolEbPgTuHPXdBDrJV2quz1mCm%2BaMZSuLj2GpSuU8P%2Fl2%2FeEEkS6IuT4nY1Wkds5OcCNLYCPVSu%2Bd7kYeiDF%2BEJSZCZ9yw3%2BLYd3%2BC%2FPtVYnJQc3W%2FFKGwNtH1bjXA8B2Ex%2Bc0ZiBreAKtJzSK3KVbbN0qGik0BvhHqFDGuwYKN10Rehygr1yi87PP3IayRM7lAsS2WRYGyoKHtSFj8JC9Q5MmsdLTkzPVBbB0mQx3R2%2FASTAVAjtx3oKJotBii0X%2FoFYoOm0O%2BHwknN%2FtpnhSkfMtSRZsPOum9AgFnnE0Z5MBDyXboprXleNNHWODk2NgCON9zxW6Q6RTO9lFTnkgnTwqjTtSqXy0IfGBqcwe2qFH2CxyXC%2BQr%2BUi%2FpHo%2B11qxrgLEmv9PxUNzqr82Bw%2B8QA6oZZRBUbSJXvrP2QT%2FmMjXkTfPIE8MEnbevXefIDF4wlZfRwXYMoSev80ySiKBc4pTQuzCgzafoymS7F9cH9t6tDhi9nqC5oaXKUhagqCC5N6bOelK5fi%2Fy9eqbjRO4ESwu1oEzD%2FrJ7UBjqkAc8nBi1ZuSGa8eCnfBn7jvcwF9ouJImsOXAiUxsjOWF%2BFrFjY29KtpSYqYTchJxiaVSwntRxRcP6uw7%2BfzrT%2BxfYdtQqk2fqrjm3vUv7cJ8AMFpb6OG2zWgL2W2h%2FBvDaPbO6N32s99grpJOOTJGJtBlnLjcftCj%2BA7MMFSWguxIFaE0jI7WxwFDLjpRsY0LBsPJXihDcM1hKrQpdPyXYKtQTZmL&X-Amz-Signature=083124df219aa178481350414b837e4238f18eab2376468c2c6c7b119420bcfd&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QYFD2MNT%2F20260821%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260821T003911Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEND%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDyrdjyt6rV1jt7FkNii6jB7BoRM2ySP2X5nRXLcmM9WwIhAJ1SKhX4vR5w2JhAYiSEEPcN8kjYV1WVhl5iU6sdKOa8KogECJn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igy%2BV9hglnkl%2BRIcnbEq3AOmxVi5FWhh57tBXZO4HYZa5Q6IHJhhvlJwhBL8N0eRejkO5y7bJQMzO8oC7NteLIW3XNAVNwNIpY8hV8zOYQv%2FDM9MMCjolEbPgTuHPXdBDrJV2quz1mCm%2BaMZSuLj2GpSuU8P%2Fl2%2FeEEkS6IuT4nY1Wkds5OcCNLYCPVSu%2Bd7kYeiDF%2BEJSZCZ9yw3%2BLYd3%2BC%2FPtVYnJQc3W%2FFKGwNtH1bjXA8B2Ex%2Bc0ZiBreAKtJzSK3KVbbN0qGik0BvhHqFDGuwYKN10Rehygr1yi87PP3IayRM7lAsS2WRYGyoKHtSFj8JC9Q5MmsdLTkzPVBbB0mQx3R2%2FASTAVAjtx3oKJotBii0X%2FoFYoOm0O%2BHwknN%2FtpnhSkfMtSRZsPOum9AgFnnE0Z5MBDyXboprXleNNHWODk2NgCON9zxW6Q6RTO9lFTnkgnTwqjTtSqXy0IfGBqcwe2qFH2CxyXC%2BQr%2BUi%2FpHo%2B11qxrgLEmv9PxUNzqr82Bw%2B8QA6oZZRBUbSJXvrP2QT%2FmMjXkTfPIE8MEnbevXefIDF4wlZfRwXYMoSev80ySiKBc4pTQuzCgzafoymS7F9cH9t6tDhi9nqC5oaXKUhagqCC5N6bOelK5fi%2Fy9eqbjRO4ESwu1oEzD%2FrJ7UBjqkAc8nBi1ZuSGa8eCnfBn7jvcwF9ouJImsOXAiUxsjOWF%2BFrFjY29KtpSYqYTchJxiaVSwntRxRcP6uw7%2BfzrT%2BxfYdtQqk2fqrjm3vUv7cJ8AMFpb6OG2zWgL2W2h%2FBvDaPbO6N32s99grpJOOTJGJtBlnLjcftCj%2BA7MMFSWguxIFaE0jI7WxwFDLjpRsY0LBsPJXihDcM1hKrQpdPyXYKtQTZmL&X-Amz-Signature=905b35388c227445f122c04e78bc6839602960decc1a56df07531ce17b3da16d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QYFD2MNT%2F20260821%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260821T003911Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEND%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDyrdjyt6rV1jt7FkNii6jB7BoRM2ySP2X5nRXLcmM9WwIhAJ1SKhX4vR5w2JhAYiSEEPcN8kjYV1WVhl5iU6sdKOa8KogECJn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igy%2BV9hglnkl%2BRIcnbEq3AOmxVi5FWhh57tBXZO4HYZa5Q6IHJhhvlJwhBL8N0eRejkO5y7bJQMzO8oC7NteLIW3XNAVNwNIpY8hV8zOYQv%2FDM9MMCjolEbPgTuHPXdBDrJV2quz1mCm%2BaMZSuLj2GpSuU8P%2Fl2%2FeEEkS6IuT4nY1Wkds5OcCNLYCPVSu%2Bd7kYeiDF%2BEJSZCZ9yw3%2BLYd3%2BC%2FPtVYnJQc3W%2FFKGwNtH1bjXA8B2Ex%2Bc0ZiBreAKtJzSK3KVbbN0qGik0BvhHqFDGuwYKN10Rehygr1yi87PP3IayRM7lAsS2WRYGyoKHtSFj8JC9Q5MmsdLTkzPVBbB0mQx3R2%2FASTAVAjtx3oKJotBii0X%2FoFYoOm0O%2BHwknN%2FtpnhSkfMtSRZsPOum9AgFnnE0Z5MBDyXboprXleNNHWODk2NgCON9zxW6Q6RTO9lFTnkgnTwqjTtSqXy0IfGBqcwe2qFH2CxyXC%2BQr%2BUi%2FpHo%2B11qxrgLEmv9PxUNzqr82Bw%2B8QA6oZZRBUbSJXvrP2QT%2FmMjXkTfPIE8MEnbevXefIDF4wlZfRwXYMoSev80ySiKBc4pTQuzCgzafoymS7F9cH9t6tDhi9nqC5oaXKUhagqCC5N6bOelK5fi%2Fy9eqbjRO4ESwu1oEzD%2FrJ7UBjqkAc8nBi1ZuSGa8eCnfBn7jvcwF9ouJImsOXAiUxsjOWF%2BFrFjY29KtpSYqYTchJxiaVSwntRxRcP6uw7%2BfzrT%2BxfYdtQqk2fqrjm3vUv7cJ8AMFpb6OG2zWgL2W2h%2FBvDaPbO6N32s99grpJOOTJGJtBlnLjcftCj%2BA7MMFSWguxIFaE0jI7WxwFDLjpRsY0LBsPJXihDcM1hKrQpdPyXYKtQTZmL&X-Amz-Signature=9fd4761393aad6a457a0cc86645abd7e1ea0e73498bf404dbeb2bff174836ee7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
