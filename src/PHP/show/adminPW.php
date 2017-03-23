<?php
/**
 * Created by PhpStorm.
 * User: star
 * Date: 2017/3/15
 * Time: 14:46
 */
//通过输入登录密码重置
//引入smarty配置文件
require_once('./../config.php');
session_start();
if(!empty($_SESSION) && isset($_SESSION['code'])){
    $smarty->assign('isLog',true);
    $smarty->assign('name',$_SESSION['code']);
    $smarty->assign('role',$_SESSION['role']);
    $smarty->display('adminPW.tpl');
}else{
    $smarty->display('adminSignup.tpl');
}
?>