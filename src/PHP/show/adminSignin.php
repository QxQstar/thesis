<?php
/**
 * Created by PhpStorm.
 * User: star
 * Date: 2017/3/13
 * Time: 16:19
 */
//添加管理员
//引入smarty配置文件
require_once('./../config.php');
//数据库连接
require_once ('./../connect.php');
//数据库操作类
require_once ('./../common/mysql.class.php');
session_start();
$mysql = new mysql();
if(isset($_SESSION['code']) && isset($_SESSION['role'])){
    $role = $_SESSION['role'];
    $smarty->assign('role',$role);
    if($role > 1){
        //获取所有比当前管理员权限低的管理员权限
        $sql = "select * from role where code > 0 and code < $role order by code asc";
        $query = $mysql->query($sql,$conn);
        $roles = $mysql->findAll($query);
        $smarty->assign('roles',$roles);
        $smarty->display('adminSignin.tpl');
    }else{
        $smarty->display('limit.tpl');
    }
}else{
    $smarty->display('adminSignup.tpl');
}

?>