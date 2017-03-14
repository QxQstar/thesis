<?php
/**
 * Created by PhpStorm.
 * User: star
 * Date: 2017/3/14
 * Time: 20:39
 */
//smarty配置文件
require_once ('./../config.php');
//数据库连接
require_once ('./../connect.php');
//数据库操作类
require_once ('./../common/mysql.class.php');
$mysql = new mysql();
session_start();
if(isset($_SESSION['findPW'])){
    $smarty->assign('name',$_SESSION['findPW']);
    $smarty->display('setPW.tpl');
}
?>