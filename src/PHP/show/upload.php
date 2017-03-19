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
//引入连接数据库的文件
require_once ('./../connect.php');
//数据库操作文件
require_once ('./../common/mysql.class.php');
$mysql = new mysql();
session_start();

//上传普通作品
if(!empty($_SESSION) && isset($_SESSION['email']) && empty($_GET)){
    $smarty->assign('isLog',true);
    $smarty->assign('activeCode',false);
    $smarty->display('upload.tpl');
}elseif (!empty($_SESSION) && isset($_SESSION['email']) && !empty($_GET) && isset($_GET['code'])){
    $smarty->assign('isLog',true);
    $code = $_GET['code'];
    $smarty->assign('activeCode',$_GET['code']);
    //获得该活动的标题
    $sql = "select * from activemessage where activeCode='$code'";
    $query = $mysql->query($sql,$conn);
    $arr = $mysql->findOne($query);
    $smarty->assign('name',$arr['title']);
    $smarty->display('upload.tpl');
}
else{
    $smarty->assign('isLog',false);
    $smarty->display('signup.tpl');
}
?>