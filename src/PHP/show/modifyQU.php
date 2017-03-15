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
    //要修改安全问题的账号
    $email = $_SESSION['email'];
    $_SESSION['question'] = $_SESSION['email'];
    if(isset($_SESSION['findPW'])){
        unset($_SESSION['findPW']);
    }
    //1.判断该账号是否设置了安全问题
    $sql = "select * from designermessage where email='$email'";
    $query = $mysql->query($sql,$conn);
    $result = $mysql->findOne($query);
    $smarty->assign('isLog',true);
    //设置了安全问题
    if($result['hasQuestion'] == 1){
        $smarty->assign('name',$email);
        $smarty->assign('info','安全问题');
        $smarty->display('choice.tpl');
    }else{
        $smarty->assign('name',$email);
        $smarty->assign('info','安全问题');
        $smarty->display('PW.tpl');
    }
}else{
    $smarty->display('signup.tpl');
}
?>