<?php
/**
 * Created by PhpStorm.
 * User: star
 * Date: 2017/3/23
 * Time: 15:51
 */
//管理员修改用户的资料
//引入smarty配置文件
require_once('./../config.php');
//数据库连接
require_once ('./../connect.php');
//数据库操作类
require_once ('./../common/mysql.class.php');
session_start();
$mysql = new mysql();
//判断是否有管理员账号登录
if(!empty($_SESSION) && isset($_SESSION['code'])){
    $smarty->assign('isLog',true);
    $role = $_SESSION['role'];
    $smarty->assign('role',$role);
    //判断该管理员是否具备修改用户资料的权限
    if($role > 1){
        //判断要修改资料的这个设计师账是否存在
        if(!empty($_GET) && isset($_GET['code'])){
            $code = $_GET['code'];
            //获取这个管理员的信息
            $sql = "select * from adminmessage where code='$code'";
            $query = $mysql->query($sql,$conn);
            $desiMessage = $mysql->findOne($query);
            $smarty->assign('message',$desiMessage);

            //获取所有比当前管理员权限低的管理员权限
            $sql = "select * from role where code > 0 and code < $role order by code asc";
            $query = $mysql->query($sql,$conn);
            $roles = $mysql->findAll($query);
            $smarty->assign('roles',$roles);

            $smarty->display('adminEditAd.tpl');
        }else{
            $smarty->display('adminSignin.tpl');
        }
    }else{
        $smarty->display('limit.tpl');
    }
}else{
    $smarty->display('adminSignup.tpl');
}