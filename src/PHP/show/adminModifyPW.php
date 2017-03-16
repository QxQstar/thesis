<?php
/**
 * Created by PhpStorm.
 * User: star
 * Date: 2017/3/15
 * Time: 14:14
 */
//设计师修改密码
//引入smarty配置文件
require_once('./../config.php');
//数据库连接
require_once ('./../connect.php');
//数据库操作类
require_once ('./../common/mysql.class.php');
$mysql = new mysql();
session_start();
if(!empty($_GET) && isset($_SESSION['code']) && isset($_GET['code']) && $_SESSION['code'] == $_GET['code']){
    //要修改密码的账号
    $code = $_SESSION['code'];
    $_SESSION['adminFindPW'] = $_SESSION['code'];
    if(isset($_SESSION['adminQuestion'])){
        unset($_SESSION['adminQuestion']);
    }
    //1.判断该账号是否设置了安全问题
    $sql = "select * from adminmessage where code='$code'";
    $query = $mysql->query($sql,$conn);
    $result = $mysql->findOne($query);
    $smarty->assign('isLog',true);
    //设置了安全问题
    if($result['hasQuestion'] == 1){
        $smarty->assign('name',$code);
        $smarty->assign('info','密码');
        $smarty->display('adminChoice.tpl');
    }else{
        $smarty->assign('name',$code);
        $smarty->assign('info','密码');
        $smarty->display('adminPW.tpl');
    }
}else{
    $smarty->display('adminSignup.tpl');
}
?>