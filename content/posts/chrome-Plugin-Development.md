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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46624BTVUQF%2F20260821%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260821T182044Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIDGwKNduIR%2F0iC87BcvucHR0JW8csOXCCOw3ObhzppwoAiEAvUnWw467J9LpEJ1pCdGAPRwaAIwwtQkh8cBKjmipq9UqiAQIqv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDMWSKuf17FH2YFOz4yrcA3bcuqW9wOhvfq2dJKF7ilhSnZNThjFLNCV%2FFyWzfsNnXWUxPT1MjQMa2Yoh6O%2BefNnz0%2FvrX2uXscoa4jHIojaBaTV8ss6ZgeZEFkS68jhVbqH0J09QvExBOyRgwB4iPFsrRtP2jin9cPiXTNAadTksWSXfuqjq3W0wMQ396OkBhTFJyUp2ygbk3%2FFZcVvUiQ80L05QZV%2B3Xq16Bp8sDNLEmMvjiWN2NA%2F5fkKd2LndHulI%2F1s69luMXXCJtv05OV3L2MVtlYu25trvHcYshx%2Bze7nNbkXVCQLrYVGcyPqXXOgnvTRY%2BB6LM2DxYG1zPbgSlH1B1bbQrMv0cQUVbIabUwmjDeTEzA%2B6GpGTFwcVHj%2FlaGkT%2F3vTCF90mk4Zd2%2FpLXr0bcYhlGwBzojpstVc78cpuJ%2Fkgh2PF%2BDYnuJ5TIp8Y68t%2BL0YTQRVuxKHy%2FV6CcnOW%2BwY7Mr3jj7BZcR9DRz1BuNY4b4TeaRBRrJj8D8terD7JFBZsBhwp778lGLVxuBnuJhIt8DNskclTXeBp2CHfzlHvPdPMK6gqdktGyLJI2HPqZnw7o%2BFOuVPFphRJCyUJ2rKuF80097uF0RvcGltcVfNy6b42%2FivpX9bPMdx3htsvyUIRM%2FuMNf9odQGOqUBKLeaHGdfPnrod8463pVLRcBHfhPkJKpTsIwLKASwl8Y8hldpq%2FJ%2FuebrNOZewbiqqRQ80H4z0FUadZBuF9MQqvdPNpdKNX70WEw%2Bzhvus6mSpeJw0Pkf654UkVWmODwGSHzmqRnl1ybIM0j2QlMTKHwLQFnwLkDmULLR50pYIi0seSnxJnEDUiuwYZy9pcQTeCKMJa%2FZh8M6sSdSmmReseRO6jm8&X-Amz-Signature=097e24a6b891b0646620b31761476a76ef90e45e824d7842df9443fd417614b2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46624BTVUQF%2F20260821%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260821T182044Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIDGwKNduIR%2F0iC87BcvucHR0JW8csOXCCOw3ObhzppwoAiEAvUnWw467J9LpEJ1pCdGAPRwaAIwwtQkh8cBKjmipq9UqiAQIqv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDMWSKuf17FH2YFOz4yrcA3bcuqW9wOhvfq2dJKF7ilhSnZNThjFLNCV%2FFyWzfsNnXWUxPT1MjQMa2Yoh6O%2BefNnz0%2FvrX2uXscoa4jHIojaBaTV8ss6ZgeZEFkS68jhVbqH0J09QvExBOyRgwB4iPFsrRtP2jin9cPiXTNAadTksWSXfuqjq3W0wMQ396OkBhTFJyUp2ygbk3%2FFZcVvUiQ80L05QZV%2B3Xq16Bp8sDNLEmMvjiWN2NA%2F5fkKd2LndHulI%2F1s69luMXXCJtv05OV3L2MVtlYu25trvHcYshx%2Bze7nNbkXVCQLrYVGcyPqXXOgnvTRY%2BB6LM2DxYG1zPbgSlH1B1bbQrMv0cQUVbIabUwmjDeTEzA%2B6GpGTFwcVHj%2FlaGkT%2F3vTCF90mk4Zd2%2FpLXr0bcYhlGwBzojpstVc78cpuJ%2Fkgh2PF%2BDYnuJ5TIp8Y68t%2BL0YTQRVuxKHy%2FV6CcnOW%2BwY7Mr3jj7BZcR9DRz1BuNY4b4TeaRBRrJj8D8terD7JFBZsBhwp778lGLVxuBnuJhIt8DNskclTXeBp2CHfzlHvPdPMK6gqdktGyLJI2HPqZnw7o%2BFOuVPFphRJCyUJ2rKuF80097uF0RvcGltcVfNy6b42%2FivpX9bPMdx3htsvyUIRM%2FuMNf9odQGOqUBKLeaHGdfPnrod8463pVLRcBHfhPkJKpTsIwLKASwl8Y8hldpq%2FJ%2FuebrNOZewbiqqRQ80H4z0FUadZBuF9MQqvdPNpdKNX70WEw%2Bzhvus6mSpeJw0Pkf654UkVWmODwGSHzmqRnl1ybIM0j2QlMTKHwLQFnwLkDmULLR50pYIi0seSnxJnEDUiuwYZy9pcQTeCKMJa%2FZh8M6sSdSmmReseRO6jm8&X-Amz-Signature=5e55d20837c9780120d8fa35da18f9421cdf3f6646f199e9dfe87987d6431c6a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46624BTVUQF%2F20260821%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260821T182044Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIDGwKNduIR%2F0iC87BcvucHR0JW8csOXCCOw3ObhzppwoAiEAvUnWw467J9LpEJ1pCdGAPRwaAIwwtQkh8cBKjmipq9UqiAQIqv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDMWSKuf17FH2YFOz4yrcA3bcuqW9wOhvfq2dJKF7ilhSnZNThjFLNCV%2FFyWzfsNnXWUxPT1MjQMa2Yoh6O%2BefNnz0%2FvrX2uXscoa4jHIojaBaTV8ss6ZgeZEFkS68jhVbqH0J09QvExBOyRgwB4iPFsrRtP2jin9cPiXTNAadTksWSXfuqjq3W0wMQ396OkBhTFJyUp2ygbk3%2FFZcVvUiQ80L05QZV%2B3Xq16Bp8sDNLEmMvjiWN2NA%2F5fkKd2LndHulI%2F1s69luMXXCJtv05OV3L2MVtlYu25trvHcYshx%2Bze7nNbkXVCQLrYVGcyPqXXOgnvTRY%2BB6LM2DxYG1zPbgSlH1B1bbQrMv0cQUVbIabUwmjDeTEzA%2B6GpGTFwcVHj%2FlaGkT%2F3vTCF90mk4Zd2%2FpLXr0bcYhlGwBzojpstVc78cpuJ%2Fkgh2PF%2BDYnuJ5TIp8Y68t%2BL0YTQRVuxKHy%2FV6CcnOW%2BwY7Mr3jj7BZcR9DRz1BuNY4b4TeaRBRrJj8D8terD7JFBZsBhwp778lGLVxuBnuJhIt8DNskclTXeBp2CHfzlHvPdPMK6gqdktGyLJI2HPqZnw7o%2BFOuVPFphRJCyUJ2rKuF80097uF0RvcGltcVfNy6b42%2FivpX9bPMdx3htsvyUIRM%2FuMNf9odQGOqUBKLeaHGdfPnrod8463pVLRcBHfhPkJKpTsIwLKASwl8Y8hldpq%2FJ%2FuebrNOZewbiqqRQ80H4z0FUadZBuF9MQqvdPNpdKNX70WEw%2Bzhvus6mSpeJw0Pkf654UkVWmODwGSHzmqRnl1ybIM0j2QlMTKHwLQFnwLkDmULLR50pYIi0seSnxJnEDUiuwYZy9pcQTeCKMJa%2FZh8M6sSdSmmReseRO6jm8&X-Amz-Signature=5bd4f2ac7d74ba9fcce52108da6931368306c5e089506c620d943c8d5190d7af&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46624BTVUQF%2F20260821%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260821T182044Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIDGwKNduIR%2F0iC87BcvucHR0JW8csOXCCOw3ObhzppwoAiEAvUnWw467J9LpEJ1pCdGAPRwaAIwwtQkh8cBKjmipq9UqiAQIqv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDMWSKuf17FH2YFOz4yrcA3bcuqW9wOhvfq2dJKF7ilhSnZNThjFLNCV%2FFyWzfsNnXWUxPT1MjQMa2Yoh6O%2BefNnz0%2FvrX2uXscoa4jHIojaBaTV8ss6ZgeZEFkS68jhVbqH0J09QvExBOyRgwB4iPFsrRtP2jin9cPiXTNAadTksWSXfuqjq3W0wMQ396OkBhTFJyUp2ygbk3%2FFZcVvUiQ80L05QZV%2B3Xq16Bp8sDNLEmMvjiWN2NA%2F5fkKd2LndHulI%2F1s69luMXXCJtv05OV3L2MVtlYu25trvHcYshx%2Bze7nNbkXVCQLrYVGcyPqXXOgnvTRY%2BB6LM2DxYG1zPbgSlH1B1bbQrMv0cQUVbIabUwmjDeTEzA%2B6GpGTFwcVHj%2FlaGkT%2F3vTCF90mk4Zd2%2FpLXr0bcYhlGwBzojpstVc78cpuJ%2Fkgh2PF%2BDYnuJ5TIp8Y68t%2BL0YTQRVuxKHy%2FV6CcnOW%2BwY7Mr3jj7BZcR9DRz1BuNY4b4TeaRBRrJj8D8terD7JFBZsBhwp778lGLVxuBnuJhIt8DNskclTXeBp2CHfzlHvPdPMK6gqdktGyLJI2HPqZnw7o%2BFOuVPFphRJCyUJ2rKuF80097uF0RvcGltcVfNy6b42%2FivpX9bPMdx3htsvyUIRM%2FuMNf9odQGOqUBKLeaHGdfPnrod8463pVLRcBHfhPkJKpTsIwLKASwl8Y8hldpq%2FJ%2FuebrNOZewbiqqRQ80H4z0FUadZBuF9MQqvdPNpdKNX70WEw%2Bzhvus6mSpeJw0Pkf654UkVWmODwGSHzmqRnl1ybIM0j2QlMTKHwLQFnwLkDmULLR50pYIi0seSnxJnEDUiuwYZy9pcQTeCKMJa%2FZh8M6sSdSmmReseRO6jm8&X-Amz-Signature=d32197a6701187b68cd239af9e4f1a39d1bec525b81966702098d186756705b4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
