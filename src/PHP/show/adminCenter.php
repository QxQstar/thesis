<?php
/**
 * Created by PhpStorm.
 * User: star
 * Date: 2017/3/14
 * Time: 10:18
 */
//管理员的个人中心
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
    if($role >0){
        $message = array();
        $sql = "select * from role where code='$role'";
        $query  = $mysql->query($sql,$conn);

        if(!mysqli_num_rows($query)){
            $message['roleInfo'] = '未知';
        }else{
            $row = $mysql->findOne($query);
            $message['roleInfo'] = $row['info'];
        }
        $message['code'] = $_SESSION['code'];
        $code = $_SESSION['code'];
        $sql = "select hasQuestion from adminmessage where code='$code'";
        $query = $mysql->query($sql,$conn);
        $adminMes = $mysql->findOne($query);
        $message['hasQuestion'] = $adminMes['hasQuestion'];
        $smarty->assign('role',$_SESSION['role']);
        $smarty->assign('message',$message);
        $smarty->assign('isLog',true);
        $smarty->display('adminCenter.tpl');
    }else{
        $smarty->display('limit.tpl');
    }
}
//如果当前没有管理员账号登录
else{
    $smarty->display('adminSignup.tpl');
}
?>