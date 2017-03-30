<?php
/**
 * Created by PhpStorm.
 * User: star
 * Date: 2017/3/21
 * Time: 15:25
 */
//全部的作品
//smarty配置文件
require_once('./../config.php');
//引入连接数据库的文件
require_once ('./../connect.php');
//数据库操作文件
require_once ('./../common/mysql.class.php');
$mysql = new mysql();
session_start();
if(!empty($_SESSION) && isset($_SESSION['code'])){
    $sql = "select * from productionmessage order by likeNum desc,time asc";
    $query = $mysql->query($sql,$conn);
    $result = $mysql->findAll($query);
    $maxpage = ceil(count($result)/8);
    $result = array_slice($result,0,8);
    $smarty->assign('isLog',true);
    $smarty->assign('result',$result);
    $smarty->assign('length',count($result));
    $smarty->assign('maxpage',$maxpage);
    $smarty->assign('role',$_SESSION['role']);
    $smarty->display('adminZPall.tpl');
}else{
    $smarty->display('adminSignup.tpl');
}