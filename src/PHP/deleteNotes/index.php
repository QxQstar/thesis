<?php
/**
 * Created by PhpStorm.
 * User: star
 * Date: 2017/3/26
 * Time: 15:42
 */
//删除消息
//引入smarty配置文件
require_once('./../config.php');
//数据库连接
require_once ('./../connect.php');
//数据库操作类
require_once ('./../common/mysql.class.php');
//移动图片的文件
require_once ('./../common/upload.func.php');
$mysql = new mysql();
session_start();
if(!empty($_SESSION) && !empty($_GET) && isset($_SESSION['email'])){
    $id = $_GET['id'];
    $mysql->del('note',"id=$id",$conn);
    echo json_encode(array('status'=>1,'msg'=>'删除成功'));
}else{
    echo json_encode(array('status'=>0,'msg'=>'你还没有登录，请登录！','url'=>'signup.php'));
}