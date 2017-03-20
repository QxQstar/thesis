<?php
/**
 * Created by PhpStorm.
 * User: star
 * Date: 2017/3/14
 * Time: 8:49
 */
//系统安全问题管理
//引入smarty配置文件
require_once('./../config.php');
//引入连接数据库的文件
require_once ('./../connect.php');
//数据库操作文件
require_once ('./../common/mysql.class.php');
$mysql = new mysql();
session_start();
//如果当前有一个管理员账号登录
if(isset($_SESSION['code']) && isset($_SESSION['role'])){
    $role = $_SESSION['role'];
    if($role >2){
        $sql = "select * from questions";
        $query  = $mysql->query($sql,$conn);
        $list = $mysql->findAll($query);
        $smarty->assign('list',$list);
        $smarty->assign('isLog',true);
        $smarty->display('safeQues.tpl');
    }else{
        $smarty->display('limit.tpl');
    }
}
//如果当前没有管理员账号登录
else{
    $smarty->display('adminSignup.tpl');
}
?>