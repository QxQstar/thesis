<?php
/**
 * Created by PhpStorm.
 * User: star
 * Date: 2017/3/18
 * Time: 11:18
 */
//活动列表
//引入smarty配置文件
require_once('./../config.php');
//数据库连接
require_once ('./../connect.php');
//数据库操作类
require_once ('./../common/mysql.class.php');
session_start();
$mysql = new mysql();
$sql = "select * from activemessage";
$query = $mysql->query($sql,$conn);
$result = $mysql->findAll($query);
if(!isset($_SESSION['email'])){
    $smarty->assign('isLog',false);
}else{
    $smarty->assign('isLog',true);
}
$smarty->assign('result',$result);
$smarty->assign('length',count($result));
$smarty->display('activeList.tpl');
?>