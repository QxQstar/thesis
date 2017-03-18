<?php
/**
 * Created by PhpStorm.
 * User: star
 * Date: 2017/3/18
 * Time: 10:39
 */
//发布活动
//引入smarty配置文件
require_once('./../config.php');
//数据库连接
require_once ('./../connect.php');
//数据库操作类
require_once ('./../common/mysql.class.php');
$mysql = new mysql();
session_start();
if(!empty($_SESSION) && isset($_SESSION['code'])){
    $smarty->assign('isLog',true);
    $smarty->display('adminAddActive.tpl');
}else{
    $smarty->display('adminSignup.tpl');
}
?>