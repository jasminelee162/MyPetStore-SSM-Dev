# MyPetStore 项目

本项目是一个典型的宠物商店管理系统，采用前后端分离架构，适用于学习与二次开发。  
- **后端仓库**：[MyPetStore-SSM-Dev](https://github.com/jasminelee162/MyPetStore-SSM-Dev.git)  
- **前端仓库**：[MyPetStore-Webfront](https://github.com/jasminelee162/MyPetStore-Webfront.git)

---

## 项目结构

- **后端**：Spring、Spring MVC、MyBatis（SSM）框架，提供 RESTful API 服务。
- **前端**：独立仓库，现代化前端开发（推荐使用 Vue 或 React，可根据仓库实际实现查看）。

## 仓库地址

- **后端代码**  
  [https://github.com/jasminelee162/MyPetStore-SSM-Dev.git](https://github.com/jasminelee162/MyPetStore-SSM-Dev.git)

- **前端代码**  
  [https://github.com/jasminelee162/MyPetStore-Webfront.git](https://github.com/jasminelee162/MyPetStore-Webfront.git)

## 快速开始

### 后端启动

1. 克隆后端仓库：
   ```bash
   git clone https://github.com/jasminelee162/MyPetStore-SSM-Dev.git
   ```
2. 导入到 IDEA/Eclipse 并配置数据库（参见 `src/main/resources/application.properties`）。
3. 执行数据库脚本，启动 Spring Boot 或 Tomcat。

### 前端启动

1. 克隆前端仓库：
   ```bash
   git clone https://github.com/jasminelee162/MyPetStore-Webfront.git
   ```
2. 安装依赖：
   ```bash
   npm install
   ```
3. 启动开发服务器：
   ```bash
   npm run dev
   ```

## 功能简介

- 用户注册、登录、权限管理（普通用户/管理员）
- 宠物分类浏览、搜索、筛选
- 宠物详情展示、库存管理
- 商品（宠物食品、用品等）浏览与购买
- 购物车功能，支持添加、删除、修改商品数量
- 订单生成、查看、支付流程
- 订单状态跟踪、历史订单查询
- 用户个人信息管理、地址管理
- 评论与评分系统，用户可对已购买商品进行评价
- 管理员后台管理：商品管理、用户管理、订单管理、库存管理
- 数据统计与报表：销售统计、用户活跃度等
- 支持多种支付方式（可扩展）
- 支持图片上传与展示
- 简易消息通知系统（如订单状态变更提醒）
- 支持分页、模糊搜索等常用前端交互功能

## 交流与反馈

如有问题或建议，欢迎通过 [Issue](https://github.com/jasminelee162/MyPetStore-SSM-Dev/issues) 提交反馈。

---

**开源协议**：MIT  
**作者**：jasminelee162
