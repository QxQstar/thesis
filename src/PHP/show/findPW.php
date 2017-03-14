<?php
/**
 * Created by PhpStorm.
 * User: star
 * Date: 2017/3/14
 * Time: 18:09
 */
//设计师找回密码
//引入smarty配置文件
require_once('./../config.php');
session_start();
if($_SESSION['email']){
    $smarty->assign('name',$_SESSION['email']);
}else{
    $smarty->assign('name','');
}
$smarty->display('findPW.tpl');
?>