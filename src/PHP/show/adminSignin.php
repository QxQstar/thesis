<?php
/**
 * Created by PhpStorm.
 * User: star
 * Date: 2017/3/13
 * Time: 16:19
 */
//添加管理员
//引入smarty配置文件
require_once('./../config.php');
session_start();
if(isset($_SESSION['code']) && isset($_SESSION['role'])){
    $role = $_SESSION['role'];
    if($role > 1){
        $smarty->display('adminSignin.tpl');
    }else{
        $smarty->display('limit.tpl');
    }
}else{
    $smarty->display('adminSignup.tpl');
}

?>