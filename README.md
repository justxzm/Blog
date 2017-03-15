# Blog
个人博客快速建站

>系统说明

* 开发环境：eclipse+mysql+tomcat
* 使用技术：jsp+servlet+ajax+jdbc+struts2文件上传+qrcode二维码
* 使用场景：快速的建立部署个人博客

> 文件说明	 

* blog.sql用来还原该项目数据库

> 使用说明

1. 还原数据库
2. 修改/Blog/src/db/ConnDb.java中的数据库连接信息
3. 修改/Blog/src/servlet/SendEmail.java第68行处的emailname和emailpassword，即邮箱账号和密码，用于发送邮件，若使用163邮箱，则密码使用的是smtp密码，需登录163邮箱设置

* 无注册功能，数据库中有事先准备好的账号：admin，密码：123456，邮箱：emailaccount@163.com
* 数据库admin表中邮箱字段用于发送邮件找回密码

>关于

* 制作于2016-11，首次制作网站时
* 没有分好层进行有效的封装抽象，将业务逻辑耦合在了jsp中，维护困难
* 基本无注释，查看痛苦
* 大神绕过:)
