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
if(!empty($_GET) && isset($_SESSION['email']) && isset($_GET['email']) && $_SESSION['email'] == $_GET['email']){
    //要修改密码的账号
    $email = $_SESSION['email'];
    $_SESSION['findPW'] = $_SESSION['email'];
    if(isset($_SESSION['question'])){
        unset($_SESSION['question']);
    }
    //1.判断该账号是否设置了安全问题
    $sql = "select * from designermessage where email='$email'";
    $query = $mysql->query($sql,$conn);
    $result = $mysql->findOne($query);
    $smarty->assign('isLog',true);
    //设置了安全问题
    if($result['hasQuestion'] == 1){
        $smarty->assign('name',$email);
        $smarty->assign('info','密码');
        $smarty->display('choice.tpl');
    }else{
        $smarty->assign('name',$email);
        $smarty->assign('info','密码');
        $smarty->display('PW.tpl');
    }
}else{
    $smarty->display('signup.tpl');
}
?>