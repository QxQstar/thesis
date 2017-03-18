<?php
/**
 * Created by PhpStorm.
 * User: star
 * Date: 2017/3/18
 * Time: 8:16
 */
//设计师上传作品
//引入smarty配置文件
require_once('./../config.php');
session_start();
//上传普通作品
if(!empty($_SESSION) && isset($_SESSION['email']) && empty($_GET)){
    $smarty->assign('isLog',true);
    $smarty->assign('activeCode',false);
    $smarty->display('upload.tpl');
}else{
    $smarty->assign('isLog',false);
    $smarty->display('signup.tpl');
}
?>