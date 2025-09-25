---
title: 屏蔽国产内置安卓某些系统应用联网权限
date: '2025-09-25'
tags:
  - 技术
draft: false
---
众所周知，某些国产安卓自带的程序没法关掉联网权限

目前通过 vpn 软件来进行实现

vivo 手机的的全局搜索这个，天天调用一个百度的搜索结果看的很烦，加上规则

[Rule]

PROCESS-NAME,com.vivo.globalsearch,REJECT，这样可以完全屏蔽这个 app 的联网权限了
