<?php
/**
 * Created by PhpStorm.
 * User: star
 * Date: 2017/3/14
 * Time: 14:23
 */
//设计师修改个人信息
require_once('./../config.php');
//引入连接数据库的文件
require_once ('./../connect.php');
//数据库操作文件
require_once ('./../common/mysql.class.php');
$mysql = new mysql();
session_start();
//如果当前有一个设计师账号登录
if(isset($_SESSION['email']) && isset($_SESSION['role']) && $_SESSION['role'] <= 1){
    $role = $_SESSION['role'];
    $email = $_SESSION['email'];
    //获得设计师基本信息
    $sql = "select * from designermessage where email='$email'";
    $query = $mysql->query($sql,$conn);
    $message = $mysql->findOne($query);
    //获得系统的头像
    $sql = "select * from headimg";
    $query = $mysql->query($sql,$conn);
    $systemImg = $mysql->findAll($query);

    //向模板中传值
    $smarty->assign('message',$message);
    $smarty->assign('imgList',$systemImg);
    $smarty->assign('isLog',true);
    //渲染模板
    $smarty->display('setMessage.tpl');
}
//如果当前没有设计师账号登录
else{
    $smarty->display('signup.tpl');
}
?>