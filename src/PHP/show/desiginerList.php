<?php
/**
 * Created by PhpStorm.
 * User: star
 * Date: 2017/3/23
 * Time: 8:39
 */
//前台设计师列表
//引入smarty配置文件
require_once('./../config.php');
//数据库连接
require_once ('./../connect.php');
//数据库操作类
require_once ('./../common/mysql.class.php');
session_start();
$mysql = new mysql();
//判断设计师是否登录
if(!empty($_SESSION) && isset($_SESSION['email'])){
    $smarty->assign('isLog',true);
    $smarty->assign('curEmail',$_SESSION['email']);
}else{
    $smarty->assign('isLog',false);
}
//找出所以的设计师并按照粉丝数降序排列
$sql = "select * from designermessage order by focus desc,email asc";
$query = $mysql->query($sql,$conn);
$desiMess = $mysql->findAll($query);
$smarty->assign('desiMess',$desiMess);
$smarty->display('desiginerList.tpl');