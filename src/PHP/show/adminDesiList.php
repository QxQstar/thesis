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
        //获取设计师列表
        $sql = "select * from designermessage order by focus desc,email asc";
        $query = $mysql->query($sql,$conn);
        $desiList = $mysql->findAll($query);
        $maxpage = ceil(count($desiList)/40);
        $desiList = array_slice($desiList,0,40);
        $smarty->assign('maxpage',$maxpage);
        $smarty->assign('desiList',$desiList);
        $smarty->display('adminDesiList.tpl');
    }
}else{
    $smarty->display('adminSignup.tpl');
}