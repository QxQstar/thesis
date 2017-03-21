<?php
/**
 * Created by PhpStorm.
 * User: star
 * Date: 2017/3/19
 * Time: 10:23
 */
//后台作品详情
//引入smarty配置文件
require_once('./../config.php');
//数据库连接
require_once ('./../connect.php');
//数据库操作类
require_once ('./../common/mysql.class.php');
session_start();
$mysql = new mysql();
if(!empty($_SESSION) && isset($_SESSION['code']) && !empty($_GET)){
    $code = $_GET['code'];
    //获得作品的信息
    $sql = "select * from productionmessage where zpCode='$code'";
    $query = $mysql->query($sql,$conn);
    $zpMessage = $mysql->findOne($query);
    $email = $zpMessage['email'];
    //这个设计师的其他作品
    $sql = "select * from productionmessage where email='$email'and zpCode != '$code' and status='2' limit 6";
    $query = $mysql->query($sql,$conn);
    $otherZP = $mysql->findAll($query);
    //这个设计师的信息
    $sql = "select * from designermessage where email='$email'";
    $query = $mysql->query($sql,$conn);
    $designMess = $mysql->findOne($query);
    if($designMess['nickname']){
        $designMess['name'] = $designMess['nickname'];
    }else{
        $designMess['name'] = $designMess['email'];
    }
    $smarty->assign('designMess',$designMess);
    $smarty->assign('zpMessage',$zpMessage);
    $smarty->assign('otherZP',$otherZP);
    $smarty->assign('role',$_SESSION['role']);
    $smarty->assign('isLog',true);
    $smarty->display('adminZPdetail.tpl');

}else if(empty($_GET)){

}else{
    $smarty->display('adminSignup.tpl');
}
?>