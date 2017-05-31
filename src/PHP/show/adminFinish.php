<?php
/**
 * Created by PhpStorm.
 * User: star
 * Date: 2017/3/14
 * Time: 21:06
 */
//smarty配置文件
require_once ('./../config.php');
session_start();
if(isset($_SESSION['findPW'])){
    unset($_SESSION['findPW']);
}
if(isset($_SESSION['question'])){
    unset($_SESSION['question']);
}
if(isset($_SESSION['adminFindPW'])){
    unset($_SESSION['adminFindPW']);
}
if(isset($_SESSION['adminQuestion'])){
    unset($_SESSION['adminQuestion']);
}
if(!empty($_SESSION) && isset($_SESSION['code'])){
    $smarty->assign('isLog',true);
}else{
    $smarty->assign('isLog',false);
}
$smarty->assign('role',$_SESSION['role']);
$smarty->display('adminFinish.tpl');
?>