<?php
/**
 * Created by PhpStorm.
 * User: star
 * Date: 2017/3/23
 * Time: 14:40
 */
//管理员修改用户的资料
//引入smarty配置文件
require_once('./../config.php');
//数据库连接
require_once ('./../connect.php');
//数据库操作类
require_once ('./../common/mysql.class.php');
session_start();
$mysql = new mysql();
//判断是否有管理员账号登录
if(!empty($_SESSION) && isset($_SESSION['code'])){
    $smarty->assign('isLog',true);
    $role = $_SESSION['role'];
    $smarty->assign('role',$role);
    //判断该管理员是否具备修改用户资料的权限
    if($role > 1){
        //判断要修改资料的这个设计师账是否存在
        if(!empty($_GET) && isset($_GET['email'])){
            $email = $_GET['email'];
            //获取这个设计师的信息
            $sql = "select * from designermessage where email='$email'";
            $query = $mysql->query($sql,$conn);
            $desiMessage = $mysql->findOne($query);
            $smarty->assign('message',$desiMessage);

            //获取系统头像
            $sql = "select * from headimg";
            $query = $mysql->query($sql,$conn);
            $systemImg = $mysql->findAll($query);
            $smarty->assign('imgList',$systemImg);

            $smarty->display('adminEditUser.tpl');
        }else{
            $smarty->display('adminDesSignin.tpl');
        }
    }else{
        $smarty->display('limit.tpl');
    }
}else{
    $smarty->display('adminSignup.tpl');
}