<?php
/**
 * Created by PhpStorm.
 * User: star
 * Date: 2017/3/26
 * Time: 15:09
 */
//smarty配置文件
require_once ('./../config.php');
//数据库连接
require_once ('./../connect.php');
//数据库操作类
require_once ('./../common/mysql.class.php');
$mysql = new mysql();
session_start();
if(!empty($_SESSION) && isset($_SESSION['email'])){
    $smarty->assign('isLog',true);
    $email = $_SESSION['email'];
    $sql = "select * from note where email='$email'or email='all' order by status asc,time desc ";
    $query = $mysql->query($sql,$conn);
    $notes = $mysql->findAll($query);
    //将这个设计师消息更新为已读
    $mysql->update('note',array('status'=>'1'),"email='$email'",$conn);
    $smarty->assign('notes',$notes);
    $smarty->display('notes.tpl');
}else{
    $smarty->display('signup.tpl');
}