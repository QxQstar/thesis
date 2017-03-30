<?php
/**
 * Created by PhpStorm.
 * User: star
 * Date: 2017/3/19
 * Time: 11:21
 */

//最新作品
//引入smarty配置文件
require_once('./../config.php');
//数据库连接
require_once ('./../connect.php');
//数据库操作类
require_once ('./../common/mysql.class.php');
session_start();
$mysql = new mysql();
$sql = "select * from productionmessage where status='2' order by time desc,likeNum desc";
$query = $mysql->query($sql,$conn);
$result = $mysql->findAll($query);
$maxpage = ceil(count($result)/8);
$result = array_slice($result,0,8);
if(isset($_SESSION['email'])){
    $smarty->assign('isLog',true);
}else{
    $smarty->assign('isLog',false);
}
$smarty->assign('list',$result);
$smarty->assign('maxpage',$maxpage);
$smarty->display('newZP.tpl');