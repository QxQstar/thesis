<?php
/**
 * Created by PhpStorm.
 * User: star
 * Date: 2017/3/18
 * Time: 9:19
 */
//待审核作品
//smarty配置文件
require_once('./../config.php');
//引入连接数据库的文件
require_once ('./../connect.php');
//数据库操作文件
require_once ('./../common/mysql.class.php');
$mysql = new mysql();
session_start();
if(!empty($_SESSION) && isset($_SESSION['code']) && isset($_SESSION['role']) && $_SESSION['role'] > 0){
    $sql = "select * from productionmessage where status='0'";
    $query = $mysql->query($sql,$conn);
    $result = $mysql->findAll($query);
    $smarty->assign('isLog',true);
    $smarty->assign('result',$result);
    $smarty->assign('length',count($result));
    $smarty->display('adminZP0.tpl');
}else{
    $smarty->display('adminSignup.tpl');
}
?>