<?php
/**
 * Created by PhpStorm.
 * User: star
 * Date: 2017/3/23
 * Time: 10:50
 */
//后台设计师列表
//引入smarty配置文件
require_once('./../config.php');
//引入连接数据库的文件
require_once ('./../connect.php');
//数据库操作文件
require_once ('./../common/mysql.class.php');
$mysql = new mysql();
session_start();
//判断当前是否有一个管理员账号存在
if(!empty($_SESSION) && isset($_SESSION['code'])){
    $role = $_SESSION['role'];
    $smarty->assign('role',$role);
    $smarty->assign('isLog',true);
    if($role < 2){
        $smarty->display('limit.tpl');
    }else{
        //获取管理员列表
        $sql = "select adminmessage.code,adminmessage.password,adminmessage.time,role.info from adminmessage,role where adminmessage.role < 3 and adminmessage.role = role.code";
        $query = $mysql->query($sql,$conn);
        $adminList = $mysql->findAll($query);
        $maxpage = ceil(count($adminList)/40);
        $adminList = array_slice($adminList,0,40);
        $smarty->assign('maxpage',$maxpage);
        $smarty->assign('adminList',$adminList);
        $smarty->display('adminAdList.tpl');
    }
}else{
    $smarty->display('adminSignup.tpl');
}