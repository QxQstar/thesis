<?php
/**
 * Created by PhpStorm.
 * User: star
 * Date: 2017/3/20
 * Time: 9:05
 */
//引入smarty配置文件
require_once('./../config.php');
//数据库连接
require_once ('./../connect.php');
//数据库操作类
require_once ('./../common/mysql.class.php');
session_start();
$mysql = new mysql();
if(!empty($_SESSION) && isset($_SESSION['code'])){
    if(!empty($_GET) && isset($_GET['code'])){
        $smarty->assign('isLog',true);
        $code = $_GET['code'];
        //活动得到这个活动的信息
        $sql = "select * from activemessage where activeCode='$code'";
        $query  = $mysql->query($sql,$conn);
        $message = $mysql->findOne($query);
        $smarty->assign('message',$message);
        $smarty->assign('role',$_SESSION['role']);
        $smarty->display('adminAddActive.tpl');
    }else{
        $smarty->assign('isLog',true);
        $smarty->assign('message',false);
        $smarty->display('adminAddActive.tpl');
    }
}else{
    $smarty->display('adminSignup.tpl');
}
?>