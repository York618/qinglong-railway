# qinglong-railway
使用railway部署青龙🐉面板
## 特点
包括[**青龙面板**](https://github.com/whyour/qinglong)的**所有**功能

同时利用[**Ngrok**](https://ngrok.com)为railway容器打开**SSH**来实现管理
## 基于项目
- [whyour/qinglong](https://github.com/whyour/qinglong)
- 某YouTube主的脚本
## 部署
1. Star并Fork本仓库以及青龙面板
2. 打开[Railway](https://railway.app)，点击右上角**Login**，选择**Github**以使用GitHub注册
3. 点击**New Project**，选择**Start from GitHub**，选择本仓库
4. 点击New Variable，填入KEY为``TOKEN``， VALUE为**你的Ngrok Authtoken**
5. 点击Deploy部署，去[Ngrok Dashboard](https://dashboard.ngrok.com)查询连接地址，默认账户是``root``，密码是``york618``
6. 青龙面板则是Railway Dashboard的Endpoint
