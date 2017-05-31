# 平面设计师站
## 数据库设计
使用的数据库是mysql，一共有11张数据表。分别是designermessage(设计师信息表),adminmessage(管理员信息表),headimg(系统头像表),role(权限表),questions(安全问题表),discuss(评价表)
activemessage(活动表), productionmessage(作品表),note(消息表),good(点赞表), focus(关注表)
## 后端程序
后端语言使用PHP，模板引擎使用Smarty，Smarty文件夹中保存的是Smarty的库文件，Smarty模板保存在src/tpl文件夹下。和界面显示有关的PHP文件保存在src/PHP/show文件夹下，处理提交的数据的PHP文件按照不同的功能保存在自己的文件夹中，这些文件夹又在src/PHP中。
## 前端程序
前端相关的文件主要保存在src/user文件夹中。
在前端将不同的功能划分到不同的模块中，使用webpack进行打包。在前端包含的模块有：
- ajax.js:专注发送ajax请求的模块，只用于发送请求与接收响应
- controlNum.js:控制输入框中输入的字符数
- createYZM.js:生成验证码
- customerImg.js:自定义头像
- preview.js:文件预览
- scrollLoading.js:滚动加载
- search.js:查询
- shear.js:图片裁剪
- spread.js:折叠/展开
- submitForm.js:获取表单数据