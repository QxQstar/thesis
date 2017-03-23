<?php
/**
 * Created by PhpStorm.
 * User: star
 * Date: 2017/3/23
 * Time: 9:24
 */
//前台首页
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
}else{
    $smarty->assign('isLog',false);
}
//活动快要结束的三个活动
$sql = "select * from activemessage order by eTime asc limit 3";
$query = $mysql->query($sql,$conn);
$activeList = $mysql->findAll($query);
$smarty->assign('activeList',$activeList);

//获取最热门的8个作品
$sql = "select * from productionmessage order by likeNum desc,discussNum desc limit 8";
$query = $mysql->query($sql,$conn);
$hotZPs = $mysql->findAll($query);
$smarty->assign('hotZPs',$hotZPs);

//获取热门的8八位设计师
$sql = "select * from designermessage order by focus desc,email asc limit 8";
$query = $mysql->query($sql,$conn);
$hotDesi = $mysql->findAll($query);
$smarty->assign('hotDesi',$hotDesi);

//获取最新的8个作品
$sql = "select * from productionmessage order by time desc,likeNum desc limit 8";
$query = $mysql->query($sql,$conn);
$newZPs = $mysql->findAll($query);
$smarty->assign('newZPs',$newZPs);

$smarty->display('index.tpl');